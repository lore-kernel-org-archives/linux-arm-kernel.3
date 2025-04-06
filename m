Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A87C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 18:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S93UKdhObdvlpcU/FcRzIW0uhpMd7EvcOLuxG0UINpk=; b=1UCw/UR4dY+pAyX6TdgGypUr9Z
	rDSr1E3VhmYuhAFZY/FHcH11+EEEUYOMht9DUlG0K/kYbBYNQ8UVksrzfdVC/jaj18rEXE7BJ0SWy
	QssgyUr7kJCMF4R0WGHK0LdQtypPPfuRkG3s85513Jet281qPdkHjTznwbEEoku8qyLX/nDXV9Mch
	//qNgZAcw6Ym99KbV656Y2zjHb7DvqKrmm8sp/DY3l6iOS8bgOUz0XM4QCAxMJB9jvhbZxKZqc64M
	Crv3gvLE+G12QwyjoZ1xaFeGzbV2tT2hsvQNSBjs5w2B/zBDLb07BGfJcNGgXiqf+BjCS5cdevykp
	qZCE179Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Uau-0000000FdAL-153o;
	Sun, 06 Apr 2025 18:19:44 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1UXk-0000000FcnI-0TPs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 18:16:29 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743963382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S93UKdhObdvlpcU/FcRzIW0uhpMd7EvcOLuxG0UINpk=;
	b=RI0HJfehh0GA78yb7DIYDAHCR7yGkWUf90gpLVs40PskfCgXEvxDu97Tm+0pBjoeRnmavN
	9apFmBWXbLLTIV0I+lC094J0BbdCTA0vQoa5U2TBEO92dL2ag2NkKmYMp76R5cNnwIKCdL
	hE4/vexq3n9ro30PqCJWSh6C/fbYcxI=
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Mingwei Zhang <mizhang@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH v2 0/2] KVM : selftests: arm64: Explicitly set the page attrs to Inner-Shareable
Date: Sun,  6 Apr 2025 11:16:13 -0700
Message-Id: <174396331752.3282387.4731776469161725499.b4-ty@linux.dev>
In-Reply-To: <20250405001042.1470552-1-rananta@google.com>
References: <20250405001042.1470552-1-rananta@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_111628_367012_286D73F5 
X-CRM114-Status: UNSURE (   8.96  )
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

On Sat, 05 Apr 2025 00:10:40 +0000, Raghavendra Rao Ananta wrote:
> The series fixes a conflict in memory attributes in some
> implementations,
> such as Neoverse-N3, that causes a data abort in guest EL1 with FSC
> 0x35 (IMPLEMENTATION DEFINED fault (Unsupported Exclusive or Atomic
> access)).
> 
> Patch-1 is a cleanup patch that replaces numbers (and comments) to
> using proper macros for hardware configuration, such as registers and
> page-table entries.
> 
> [...]

I cleaned up the changelog on patch 2 per the discussion + added a note
about the interaction with LPA2.

Applied to fixes, thanks!

[1/2] KVM: selftests: arm64: Introduce and use hardware-definition macros
      https://git.kernel.org/kvmarm/kvmarm/c/d8d78398e550
[2/2] KVM: selftests: arm64: Explicitly set the page attrs to Inner-Shareable
      https://git.kernel.org/kvmarm/kvmarm/c/c8631ea59b65

--
Best,
Oliver

