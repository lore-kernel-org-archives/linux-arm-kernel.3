Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9BA606D814
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bf91ofps;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=SffZOo3u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=prKL/IiDtwtZc6yvvtNMWVlCcs+HKIOTNMT0UbmZxag=; b=bf91ofpsPBMHMf
	upD0toCmQhT5+8ugmeZKTXf9GQA9+3FPofpjLQKkbe2bC+YhWYqXrqosgPW9+QpvVNQriSrMRoSF9
	HaME9fpefj8Tuq9b377akDKbg37GWK44WiNGzU9mMcUdyyNqlTgV0GbFfYj+9PwbXVroorbr+QpVt
	oKOqnHu/YoOKPBp/v0qr9+2glWfy3dSLNStCVSFE3JZ+tHpHhLIU8e5PPoCSrWYIsxagAwlSknhMA
	KnMvXX7SVcJ2sEIpHXVh0lxViokO7OthaT1+oklspHfqG0VPEW5fM/r3Ee5JQJjxzQ+XE2OXe/DEe
	sRjxWfDyfPYSGk40ARlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdXO-00000005tCX-0ck1;
	Wed, 04 Nov 2026 16:08:34 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdXK-00000005t8Q-16JM;
	Wed, 04 Nov 2026 16:08:32 +0000
Received: from [192.168.1.10] (unknown [4.194.122.170])
	by linux.microsoft.com (Postfix) with ESMTPSA id 63DEA20B7167;
	Wed,  4 Nov 2026 08:08:11 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 63DEA20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793808493;
	bh=prKL/IiDtwtZc6yvvtNMWVlCcs+HKIOTNMT0UbmZxag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SffZOo3unSj20HxNN/HBXkrg74iNW686erVL6zKzCyh7fgseY8VWtJOkLzn3BTWG6
	 kAMblKKR0pEPU6mkN11IyTSYYC/skyUn8eMWFElgxZXoZ92gr4Ozsa3sqpTvmF3C37
	 hpCvaDZSlr5dvJrJ1dRRV+56es5iUzZhZb6fsvgU=
Message-ID: <1ac51332-054a-47d1-abce-60bc74646e44@linux.microsoft.com>
Date: Wed, 4 Nov 2026 21:38:24 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: Convert to subsys_platform_driver()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261104113324.1634161-1-peng.fan@oss.nxp.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20261104113324.1634161-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_080830_336385_CB41416F 
X-CRM114-Status: GOOD (  14.14  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>

Hi Peng,

On 04-11-2026 17:03, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   drivers/mailbox/mailbox-xgene-slimpro.c | 13 +------------
>   drivers/mailbox/mtk-cmdq-mailbox.c      | 13 +------------
>   drivers/mailbox/zynqmp-ipi-mailbox.c    | 13 +------------
>   3 files changed, 3 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/mailbox/mailbox-xgene-slimpro.c b/drivers/mailbox/mailbox-xgene-slimpro.c
> index 1f87a84e5995..f489bcabceff 100644
> --- a/drivers/mailbox/mailbox-xgene-slimpro.c
> +++ b/drivers/mailbox/mailbox-xgene-slimpro.c
> @@ -243,18 +243,7 @@ static struct platform_driver slimpro_mbox_driver = {
>   	},
>   };
>   
> -static int __init slimpro_mbox_init(void)
> -{
> -	return platform_driver_register(&slimpro_mbox_driver);
> -}
> -
> -static void __exit slimpro_mbox_exit(void)
> -{
> -	platform_driver_unregister(&slimpro_mbox_driver);
> -}
> -
> -subsys_initcall(slimpro_mbox_init);
> -module_exit(slimpro_mbox_exit);
> +subsys_platform_driver(slimpro_mbox_driver);
>   
>   MODULE_DESCRIPTION("APM X-Gene SLIMpro Mailbox Driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 96462ca84471..262832753fa5 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -875,18 +875,7 @@ static struct platform_driver cmdq_drv = {
>   	}
>   };
>   
> -static int __init cmdq_drv_init(void)
> -{
> -	return platform_driver_register(&cmdq_drv);
> -}
> -
> -static void __exit cmdq_drv_exit(void)
> -{
> -	platform_driver_unregister(&cmdq_drv);
> -}
> -
> -subsys_initcall(cmdq_drv_init);
> -module_exit(cmdq_drv_exit);
> +subsys_platform_driver(cmdq_drv);
>   
>   MODULE_DESCRIPTION("Mediatek Command Queue(CMDQ) Mailbox driver");
>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
> index 42d2583e44ca..da7d33435cdb 100644
> --- a/drivers/mailbox/zynqmp-ipi-mailbox.c
> +++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
> @@ -1022,18 +1022,7 @@ static struct platform_driver zynqmp_ipi_driver = {
>   		   .of_match_table = of_match_ptr(zynqmp_ipi_of_match),
>   	},
>   };
> -
> -static int __init zynqmp_ipi_init(void)
> -{
> -	return platform_driver_register(&zynqmp_ipi_driver);
> -}
> -subsys_initcall(zynqmp_ipi_init);
> -
> -static void __exit zynqmp_ipi_exit(void)
> -{
> -	platform_driver_unregister(&zynqmp_ipi_driver);
> -}
> -module_exit(zynqmp_ipi_exit);
> +subsys_platform_driver(zynqmp_ipi_driver);
>   
>   MODULE_LICENSE("GPL v2");
>   MODULE_DESCRIPTION("Xilinx ZynqMP IPI Mailbox driver");


Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>

Regards,
Prasanna Kumar

