Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824DECA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXLMAg3FlhSPADp+jfcghXHh3xfR672rAp8rAyJvzVo=; b=vdYpoXoQ5OwXBFH5ODErlak8RA
	iBgMF3FiYeC8MhCBwg3V1rINmD0zVxaBmTuvLh2csJkkl/tVbemDocM+MBk6pY+k+1G5lBTGzCsha
	nh0prycGKW9Flbw9mApsdXwQ3Pn/y1mqcSkm+BB1UWNN9uYiKjjaJnkuSxqGTZ3SmXBKXa7kxGhp1
	ZA9UhVcZ/WXwTEh/3ZWXshYQttqL5A4lakNqhRzbCRth0mzrO3iFaePo5rd+hpNWB2X40mFON1h3C
	a2tJVHSSQjrffDjyLa4nJuRkMKbKd9GH/hLiL4F9lOPjppJxf+ITD7EMKIBlXuTUHyXL511Ar2ub6
	h1/hOJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJm2-00000009jRI-1v67;
	Thu, 01 Oct 2026 16:36:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJm0-00000009jQn-3QYa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:36:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F8FE429D5;
	Thu,  1 Oct 2026 16:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF1E1F000FF;
	Thu,  1 Oct 2026 16:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790872604;
	bh=BXLMAg3FlhSPADp+jfcghXHh3xfR672rAp8rAyJvzVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MI2RWpwaJp/wRl1dRcHeuajsqvY1oGk53fo/PNKRs874vC3Bu+RiWPn45D7au2Wry
	 6J+WxP1QK/S2chfk9HGMdhF6jToyBoWYT9aKw71o5zKTuuKs1hxgYeKQmFqeMrIjC9
	 6TjFR1H3Pq9pofIW5XS2U8Pv/7Vw3f+CHJyHek59TUX1nkUrwyg52gD7/AnbifIwKf
	 s2jpADjhYjtpkgBn8BY5zZy1BpXJPYeysTIR5OU8O7VT2wkHGf6J11GYrBiGTztNwB
	 bfAGwLW1/Vh3qIAiOZ2r2EajetCqfCxlPYcEypgpm6rzT6VQL/nlk+bnY0lYcF4PPk
	 1IP/QRrT3Zjwg==
Date: Thu, 1 Oct 2026 17:36:37 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: Re: [PATCH v21 11/15] KVM: selftests: arm64: Add GCS registers to
 get-reg-list
Message-ID: <ar6L9O-MGe12d95Z@gremlin>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-11-3556644cd927@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-arm64-gcs-v21-11-3556644cd927@kernel.org>
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

On Wed, Sep 30, 2026 at 10:48:21PM +0100, Mark Brown wrote:
> GCS adds new registers GCSCR_ELx, GCSCRE0_EL1 and GCSPR_ELx. Add
> these to those validated by get-reg-list.
>
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>

This looks obviously correct (TM) to me so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

--
Cheers, Lorenzo

