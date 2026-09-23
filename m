Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886E7C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+h8E1QKWSZDpJwCxpdRnKnG35J6P/3C8VA+1n19Xdo=; b=AMqmixWt//x4qKE7RCYx4cWMOA
	fN3U7PM4OC5dDKzQMsN7OTe5eeSqZDSkcy4zsYGy1RSGsCRimKy4SmtJ25z03+Eg6BR7zHk/iKQpu
	HHFZ+sf0z9BfPCpj8u+/llyBIWEsYS8fPxH6WvDuzXHYDYg9mHNe5oJRo4YUtg/R/lpJPr5RqGDEN
	SJK2o4tojKQ5Mp2Ro1HTaeghyc07szidPksviDbN/ttqI/VDgSfMntYVpaQ2RB+HOsddS3V3b+EI2
	WDrPAnxWHO1VJijT9V4vIK+Hiu2eT2rfLS29aQn6xoyypTT1V5Qa8G7vKUHXd6Mu/wMAgPJzVOdYd
	16jVEEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9H1s-00000007LK2-1vCS;
	Wed, 23 Sep 2026 07:04:32 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9H1o-00000007LIv-3I1I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 07:04:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=u+h8E1QKWSZDpJwCxpdRnKnG35J6P/3C8VA+1n19Xdo=;
	b=mve9PMTvFtE9KLyj5595nFR4Gtto9AwDKfJyqHeyAf2Z5gmF2V+oK13d05KTmeo8cHGCgkNw1
	bvfUaY+nCurpYTXQjccE5JvOXfxR6PG+JLnTh/gXjcAJHh9hbVrKXnbddAhxGgMEpFko9NPS1Ih
	/sCZMYdlM8xHZJQomv5DbmE=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hqSLw4T89z1K9B2;
	Wed, 23 Sep 2026 14:52:08 +0800 (CST)
Received: from whupemk100014.china.huawei.com (unknown [7.152.184.20])
	by mail.maildlp.com (Postfix) with ESMTPS id 181C84055B;
	Wed, 23 Sep 2026 15:04:14 +0800 (CST)
Received: from [10.67.121.110] (10.67.121.110) by
 whupemk100014.china.huawei.com (7.152.184.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 23 Sep 2026 15:04:12 +0800
Subject: Re: [PATCH v3 11/13] crypto: hisilicon/sec2: Remove check of
 CONFIG_CPU_LITTLE_ENDIAN
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ard
 Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>, Marc Zyngier <maz@kernel.org>,
	Chenghai Huang <huangchenghai2@huawei.com>, Weili Qian
	<qianweili@huawei.com>, Zaibo Xu <xuzaibo@huawei.com>, Kai Ye
	<yekai13@huawei.com>, Wei Zhang <zhangwei375@huawei.com>
References: <20260918145217.1669-1-will@kernel.org>
 <20260918145217.1669-12-will@kernel.org>
From: liulongfang <liulongfang@huawei.com>
Message-ID: <0c929b0a-8d92-2d2c-79c2-4d9f7c0c29e5@huawei.com>
Date: Wed, 23 Sep 2026 15:04:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20260918145217.1669-12-will@kernel.org>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.110]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemk100014.china.huawei.com (7.152.184.20)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_000429_315951_6081286B 
X-CRM114-Status: GOOD (  16.93  )
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

On 2026/9/18 22:52, Will Deacon wrote:
> The hisilicon "sec" driver targets arm64 but can be compile-tested on
> other 64-bit architectures. In preparation for removing the definition
> of CONFIG_CPU_LITTLE_ENDIAN for arm64 (since it will be little-endian
> only), invert the check in sec_set_endian() so that it behaves as
> little-endian by default.
> 
> Cc: Chenghai Huang <huangchenghai2@huawei.com>
> Cc: Weili Qian <qianweili@huawei.com>
> Cc: Zaibo Xu <xuzaibo@huawei.com>
> Cc: Longfang Liu <liulongfang@huawei.com>
> Cc: Kai Ye <yekai13@huawei.com>
> Cc: Wei Zhang <zhangwei375@huawei.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  drivers/crypto/hisilicon/sec2/sec_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/hisilicon/sec2/sec_main.c b/drivers/crypto/hisilicon/sec2/sec_main.c
> index 752565200c16..03523cfbb28e 100644
> --- a/drivers/crypto/hisilicon/sec2/sec_main.c
> +++ b/drivers/crypto/hisilicon/sec2/sec_main.c
> @@ -484,7 +484,7 @@ static void sec_set_endian(struct hisi_qm *qm)
>  	if (!IS_ENABLED(CONFIG_64BIT))
>  		reg |= BIT(1);
>  
> -	if (!IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN))
> +	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
>  		reg |= BIT(0);
>

Reviewed-by: Longfang Liu <liulongfang@huawei.com>

Thanks.

>  	writel_relaxed(reg, qm->io_base + SEC_CONTROL_REG);
> 

