Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F91CEFCE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lC/vPrppfWWJLMXtqrkEQhEuGW9UilLVWhfYhsLXqlM=; b=lNfT7C0OfbIBf76yrShaYM1uBb
	+fFl9RdycBZ0urv+t++erDB586NtTVqRgUMrEMrtSU101EYJmA953NgUl7C+4k5G73k8A56A/dxRx
	uAwKlAPVI5QehCmKuJMY8rqbaZ7iKffzpvRxRmj+McbsU/mCNhQlCmBoaA5fQJ9nSbQb378HCfMkw
	azlN0JIJhbDx4/vqh1lUOCxgPJyVT5CdrMRY7pZZSs1l9XaKXnAskjH5PA2ksviqREuAm/P8GOvln
	VNRSkTYjMfyYy15c+I3TiPBZCjB4x79KyHVhvWoillZJQdEuWCsElYLMHk8UfUa2e+EhJg9q0Nt/8
	IvSeJy7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAmT-0000000DZFm-1Sg6;
	Tue, 06 Jan 2026 17:23:41 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAmQ-0000000DZF9-0MiG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:23:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lC/vPrppfWWJLMXtqrkEQhEuGW9UilLVWhfYhsLXqlM=;
	b=wA8AGwnUx1Vq5QigHCn0VYFfK4J5ZNl8Ntb+EC5rG1ToX7ySH9N0CRiIQpm75yRmrrJxMpPRs
	/2H/zmJxLE+C3vnLaJKQQtOfJbYl98JaAprg+qmVkx5lo4yoYhpqh+3KKM4G26tGMTna1y6Zc5T
	56A9cor4yPwLMcOXjD90jVI=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dlycr0KYxz1vp16;
	Wed,  7 Jan 2026 01:21:15 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlygD270QzJ46Bs;
	Wed,  7 Jan 2026 01:23:20 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 2DFD440086;
	Wed,  7 Jan 2026 01:23:22 +0800 (CST)
Received: from localhost (10.195.245.156) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 17:23:21 +0000
Date: Tue, 6 Jan 2026 17:23:17 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd
	<nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Timothy Hayes
	<Timothy.Hayes@arm.com>
Subject: Re: [PATCH v2 01/36] KVM: arm64: Account for RES1 bits in
 DECLARE_FEAT_MAP() and co
Message-ID: <20260106172317.00001463@huawei.com>
In-Reply-To: <20251219155222.1383109-2-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-2-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.245.156]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_092338_672508_37BCFD3F 
X-CRM114-Status: GOOD (  14.42  )
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

On Fri, 19 Dec 2025 15:52:36 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> From: Marc Zyngier <maz@kernel.org>
> 
> None of the registers we manage in the feature dependency infrastructure
> so far has any RES1 bit. This is about to change, as VTCR_EL2 has
> its bit 31 being RES1.

Oh goody.

> 
> In order to not fail the consistency checks by not describing a bit,
> add RES1 bits to the set of immutable bits. This requires some extra
> surgery for the FGT handling, as we now need to track RES1 bits there
> as well.
> 
> There are no RES1 FGT bits *yet*. Watch this space.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
FWIW it seems correct.  The only thing I wondered about is
the assumption that if there is an error best thing to do is
to assume it was res0 that was wrong and paper over it.
I guess we can't do anything better if that does happen.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Process thing though: before anyone can merge this, Sasha
please take a look at submitting patches documentation.

When you 'post' a patch that was written by someone else you have
handled the patch and for the Developer Certificate of origin stuff
to work you have to add your Signed-off-by after theirs.

Jonathan

