Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732F0CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gQRnY18Yf5sZLa9hrEMVv61/7uAFGlQA3UH4id3Xkg=; b=KSBmlBTCuK7MvLtYYKT6R8mRry
	GyyFmIcHzlODEArjKIYiukI7BGLoCgpZahhO0mKQKKAnYrjeiur4wqpxJvGOAx2Z3x7ReZDNAJXdQ
	jv5gTA9H+eLNgVZW73h9qY5sO0k1Z2tctnDcOsZitUWWd7SeOR/ynPZsSI7dXLzJM1ucHtgmjfx/+
	yL27BN4Zx6xzT1Szc1K0RoATm9HBiWzXbxCGXFMyJ7dkqxdT+u60sxA+4uOaUh1cnNDAssftCGxWx
	/xGk4GwVvZEzEOUGNF+e2doPMg1z9E9lG/b7K+v+/v2iXkPIm9vv45y4oZPJM8kEFRr+7PaE2y/ul
	2jmOGmVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3v7-0000000Dzs8-1GhM;
	Mon, 15 Jun 2026 09:47:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3v6-0000000Dzs1-1Dzg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 09:47:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A32E041B23;
	Mon, 15 Jun 2026 09:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75D01F000E9;
	Mon, 15 Jun 2026 09:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781516871;
	bh=+gQRnY18Yf5sZLa9hrEMVv61/7uAFGlQA3UH4id3Xkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ljbq4CVw7HtTGNgedrO0+X1vR12DOmPfi7xAw2UAwbjguH24snP5E9jJoNwjrVTzk
	 wwnVFTAGwZchN/h3Hm60eLpY1K6xrbTYrRQ1IAgKRoI9SL4nlRs4WmNbEWJ4kMUa1g
	 OiqgWyjDV5T39W4A50850awfndvdfqzTcoeQoiUuDSfN8sPXbGPD87h0iwSWnkvDEr
	 GUef+xwYnxCPSFoQKo56cR2XjkaOTTT2A5CGaUs2ZhBFFXws6/+wTLkUmntdl2JOYc
	 xB1tZmq+pdVNIjMgBSvNnhJZHyjIxXTNsc+9TV/UtyowabnWbaLkcyNtmtby8vBwPn
	 AcO5wTzJMTN1g==
Date: Mon, 15 Jun 2026 10:47:45 +0100
From: Will Deacon <will@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: Vincent Donnefort <vdonnefort@google.com>, catalin.marinas@arm.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v2 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to
 TrustZone
Message-ID: <ai_KQTJj4n1dZS6F@willie-the-truck>
References: <20260608165549.1479409-1-sebastianene@google.com>
 <aikt44sVnpL3_dYi@google.com>
 <aik5MtvOlnQDmzjr@willie-the-truck>
 <ailVcN-bxY30-XBF@google.com>
 <ailXKA1VG8vyKNfV@willie-the-truck>
 <ailtCAcEaJIgZ5Ap@google.com>
 <ai50fgNHGUqz0muP@willie-the-truck>
 <ai-tO-sSNGp7mjAU@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai-tO-sSNGp7mjAU@google.com>
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

On Mon, Jun 15, 2026 at 07:43:55AM +0000, Sebastian Ene wrote:
> On Sun, Jun 14, 2026 at 10:29:34AM +0100, Will Deacon wrote:
> > Yes, that part now seems to be missing.
> 
> I am a bit worried to apply for all of them the check from the relayer
> (ffa_check_unused_args_sbz) because of how it's written in the spec in
> (11.2 Reserved parameter convention). To be more specific, there is no
> mention of what the relayer is expected to do here (which is what hyp
> does). It says 2 things:
> 1. the caller (in this case the host driver) is expected to zero out
> unused args
> 2. the callee (Trustzone) ignores the values in these registers.
> 
> If we enforce SBZ in the relayer but (1) doesn't comply with it, we will
> introduce a regression. I left it on purpose without enforcing
> ffa_check_unused_args_sbz for the others.

I think that's ok -- if the caller isn't passing zeroes when it should,
then it's already on borrowed (no pun intended!) time and it will need
to be fixed.

Will

