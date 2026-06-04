Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21554CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 03:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMgBCSgvMtpZEZrDJ1R+5pwimwPSaByYbNxh3LP7+uM=; b=n5bZ6lJXOj9fum8svRHr1LjpRy
	2NA8UWMOSaMJ/T86M4s+qC+Fr9NDpHbSfDwwYeqkqSFWH0+C7FStCG5vHgSbyOIbk4S356VH4qNaq
	26Dc2chOHpmuO2ZHSIK+hnh6XFKqSQwuc3DibWHMcaSL2p1AmMlNlnWSemHeiQxAUcgf8wslXCBam
	lkBFY13u7ozxt34wWuj30zjpOsxBXeEEsdAcyAHcA45+jF2T2rNvEZ/FMup8N3TbR/g13wp7y2FhO
	Mv4xy8gxShWoThLfnMigL07wo6Q6skDvKCXT496+GjE4Wcop6FPjgyBCfyXSWmO7ZMFrd/1ObRtQU
	VPX/bxoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUyot-0000000G6Sc-3HZ5;
	Thu, 04 Jun 2026 03:32:35 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUyor-0000000G6S1-0Cp1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 03:32:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cMgBCSgvMtpZEZrDJ1R+5pwimwPSaByYbNxh3LP7+uM=;
	b=b0D/6tYekJLgMjLMWwjnVuLzmDupBuHI0VQIAXUUfPUs8mTBlUW81/A51fwmxND/9D7AnK+DT
	OZL4NAI8Byt+ENSFJoStoZyERUI9o4QiK983PVPLf3vilQi6iVdy/dCYQoMAbrr86+U1A88di5D
	UmwAH2Vm+B8EFaKNLwT5rdE=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gW90d20Cjz1cyPd;
	Thu,  4 Jun 2026 11:24:33 +0800 (CST)
Received: from dggpemf500015.china.huawei.com (unknown [7.185.36.143])
	by mail.maildlp.com (Postfix) with ESMTPS id 7C6304056E;
	Thu,  4 Jun 2026 11:32:22 +0800 (CST)
Received: from [10.67.121.110] (10.67.121.110) by
 dggpemf500015.china.huawei.com (7.185.36.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 4 Jun 2026 11:32:21 +0800
Subject: Re: [PATCH 0/2] HiSilicon TRNG fix and simplification
To: Eric Biggers <ebiggers@kernel.org>, <linux-crypto@vger.kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
CC: Olivia Mackall <olivia@selenic.com>, Weili Qian <qianweili@huawei.com>,
	Wei Xu <xuwei5@hisilicon.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260530202624.20768-1-ebiggers@kernel.org>
From: liulongfang <liulongfang@huawei.com>
Message-ID: <a5df5973-480e-c18b-90bf-99380d24968d@huawei.com>
Date: Thu, 4 Jun 2026 11:32:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20260530202624.20768-1-ebiggers@kernel.org>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.110]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500015.china.huawei.com (7.185.36.143)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_203233_568934_68FFC634 
X-CRM114-Status: GOOD (  12.19  )
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

On 2026/5/31 4:26, Eric Biggers wrote:
> This series fixes and greatly simplifies the HiSilicon TRNG driver by
> removing the gratuitous crypto_rng interface, leaving just hwrng which
> is the one that actually matters.
> 
> Note that this mirrors similar changes in other drivers such as qcom-rng
> (https://lore.kernel.org/r/20260530020332.143058-1-ebiggers@kernel.org)
> 
> Eric Biggers (2):
>   crypto: hisi-trng - Remove crypto_rng interface
>   hwrng: hisi-trng - Move hisi-trng into drivers/char/hw_random/
> 
>  MAINTAINERS                            |   2 +-
>  arch/arm64/configs/defconfig           |   2 +-
>  drivers/char/hw_random/Kconfig         |  10 +
>  drivers/char/hw_random/Makefile        |   1 +
>  drivers/char/hw_random/hisi-trng-v2.c  |  98 +++++++
>  drivers/crypto/hisilicon/Kconfig       |   8 -
>  drivers/crypto/hisilicon/Makefile      |   1 -
>  drivers/crypto/hisilicon/trng/Makefile |   2 -
>  drivers/crypto/hisilicon/trng/trng.c   | 390 -------------------------
>  9 files changed, 111 insertions(+), 403 deletions(-)
>  create mode 100644 drivers/char/hw_random/hisi-trng-v2.c
>  delete mode 100644 drivers/crypto/hisilicon/trng/Makefile
>  delete mode 100644 drivers/crypto/hisilicon/trng/trng.c
> 
> 
> base-commit: 5624ea54f3ba5c83d2e5503411a31a8be0278c1e
> prerequisite-patch-id: 07e982b663ac3f8312ca524f6b91b5b38661df5e
> prerequisite-patch-id: 72064361a8f36e015ab0b7e1fa4d364b40d90506
> prerequisite-patch-id: 8978b8e0db7f47935e5f6f0aff14a97f55d3073c
> prerequisite-patch-id: 6aa0e3e93a008279d71e535a3d0cf48643f55e19
>

Acked-by: Longfang Liu <liulongfang@huawei.com>

Thanks.

