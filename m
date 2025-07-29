Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F122C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 21:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbTYZV5A/izXGKdYsYyam9domfvB6oEjtk6O72eaKBs=; b=cHDQgajWlUB0YGmYmtRI8Q2b8x
	shLI1SE+hE8W0ZCHMM9rJ9xAKk/7I6gOaimHPMZ0W07yl6CaaSc3MAv0KnoQNY1s3GyEijrd2/IJ1
	jCycWOCI1dvAuEV3XCtpBFcj/2VvAxFE0meJsxfHO02Opyo+LRxBmIpHJDPVfxhHJqq52qCeMetLl
	9q7++oYUUyZucQ12ODs92AC+Te2oOaTIYzyBTI7epAlQ9WpzVDKsfhboB2h7g9H05+XvSLPgeIpS/
	+1XWhzQHkM0dLHj7NpAp6/oN4DmwGsQ4L31Mda/ixEdJbtQPeaGsRttvaC/UYrkwegmzK+DjzxR2d
	qYwRddTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrpk-000000007Lq-1WxW;
	Tue, 29 Jul 2025 21:26:04 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrnF-000000007DV-3RyR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 21:23:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753824207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KbTYZV5A/izXGKdYsYyam9domfvB6oEjtk6O72eaKBs=;
	b=R9NTTjX+rORwT+a6JEIYVzSVkSK/RdLskz6BUNFX0dC5BsyCafVhv2uhz1byrhsymuxQGR
	YPqf6IDP1I3oHmOLby3G/aQ8iLzsfJuE5kx9SeVn3eZ4BTbAQA1QMAQnuJhSDlAVA0pX51
	rCK0mNvbXaGok210uECSnNBoj2j9l0s=
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Move bundling vLPI and vSGI to vgic_supports_direct_msis()
Date: Tue, 29 Jul 2025 14:23:16 -0700
Message-Id: <175382415249.3325682.6984441451099105450.b4-ty@linux.dev>
In-Reply-To: <20250729210644.830364-1-rananta@google.com>
References: <20250729210644.830364-1-rananta@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_142330_320871_F0DC631A 
X-CRM114-Status: UNSURE (   7.20  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 29 Jul 2025 21:06:44 +0000, Raghavendra Rao Ananta wrote:
> Commit <c652887a9288> ("KVM: arm64: vgic-v3: Allow userspace to write
> GICD_TYPER2.nASSGIcap") bundles the vLPIs and vSGIs behind the
> GICD_TYPER2.nASSGIcap field. While the vGIC v4 initialization and
> teardown is handled correctly, it erroneously left out the cases when
> KVM sets/unset vGIC v4 forwarding, which leads to a kernel panic of the
> following nature:
> 
> [...]

Massaged the changelog a bit. Applied to fixes, thanks!

[1/1] KVM: arm64: Move bundling vLPI and vSGI to vgic_supports_direct_msis()
      https://git.kernel.org/kvmarm/kvmarm/c/7b8346bd9fce

--
Best,
Oliver

