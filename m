Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E319DC5AD44
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 18:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJwrgY6xFSMePlSsx9wyS7H3bTpR++X2AOvZVpByx9I=; b=k/nb2HmcKQhGVANNtDyEbhZCm9
	yOokGTbX+borH/tqdwtZ7mRtbzT3D3cmffn2Ft3og8NQiQ/mmjzCOw6ABqiWkPuqsY62kLUHtiPxM
	Ffbl9mfFJBTFXZPOFCFZnlYEgdQ0MzryWEaU2DFm2O5BY7aoD30OlXvk9uV5HLv0EfmgBHteydXCt
	Yh/F8b/BNRQ0tnFV6iBFeBJzj/mZR0I2rmJIx2etTF72f7bI2UMhIkRyuPsfZKo/EWhPH0sgTz8Iq
	wumSpvEfiw2XexeU9dFrxIfKQ7AOKy87qk4DEH2N02nHj2a9D4joMOX4VLHkPyRS/4dwve3XCKfii
	vJZD1EcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsltZ-00000009aAo-2cb9;
	Sat, 08 Aug 2026 18:35:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsltY-00000009aAV-26XF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 18:35:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FD1741A75;
	Sat,  8 Aug 2026 18:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4637D1F000E9;
	Sat,  8 Aug 2026 18:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786214143;
	bh=bJwrgY6xFSMePlSsx9wyS7H3bTpR++X2AOvZVpByx9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PL3wae9qqhBv8Xl37xN/xlKZKxrn61617gO/RBy+LHjrONvkuR1yTfaAi8cfRfXiJ
	 od4RrqoGaYT/MP1kAvpvA/gRrlvk6TvEKX73ayZLvADll7gFFGblI+SqDD6OeUkwq5
	 tqyXyNzaAJ6HOF+u1j8VHHkgWlinDGqKvZYPWM1JRgr7xes4DMk68dQndeqhNBvLd5
	 yKJDXbWGT8/55Fne1keEeYUQjWXMP1hLWRvXc1myMOwcZbO+TUKFr0bhZwdLIOP/Bg
	 lX6QzyrF38/agspDV51o8wFGBCpC3ME/fR5Y+pK3Pg4cZkWRp9HfeS0/PaNGbLT2Dp
	 TC//V+6TR354w==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] KVM: arm64: vgic: Fixes for ITS table save and init retry
Date: Sat,  8 Aug 2026 11:35:38 -0700
Message-ID: <178621413198.380376.1272590130654213471.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260807104102.2410744-1-fuad.tabba@linux.dev>
References: <20260807104102.2410744-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 07 Aug 2026 11:40:58 +0100, Fuad Tabba wrote:
> Respinning today since I am travelling until the 17th and will be slow to
> reply.
> 
> Changes since v1 [1]:
>   - Patch 3: check the collection ID with vgic_its_check_id() instead of
>     bounding the walk by the table size, so a collection the table cannot
>     address is not saved either. Retitled to match. (sashiko)
>   - New patch 4: skip the ITEs that are saved as invalid when computing an
>     ITE's next-event offset. (Oliver)
> 
> [...]

Applied to next, thanks!

[1/4] KVM: arm64: vgic-its: Don't dereference a NULL collection on ITT save
      https://git.kernel.org/kvmarm/kvmarm/c/c6c156d931c3
[2/4] KVM: arm64: vgic: Don't leak the SPI array when init is retried
      https://git.kernel.org/kvmarm/kvmarm/c/52d044d6e76f
[3/4] KVM: arm64: vgic-its: Don't save collections the table cannot hold
      https://git.kernel.org/kvmarm/kvmarm/c/9b10fb74e4b6
[4/4] KVM: arm64: vgic-its: Point saved ITEs at the next valid entry
      https://git.kernel.org/kvmarm/kvmarm/c/ad1e686e2378

--
Best,
Oliver

