Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BC4C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSETgrsVMB4OUyqU4p3tpNCMc9bknN2FBok7iwVPUnA=; b=Pvdgy0q9sUL2HQQcNybPqiJU0L
	45wM1kyDwUVB7AMze0QEVG6LFFLtk/0w8MGvVX+agJO1lW1w42dHPEar6y6rWPHFvcLevVlYqJpcr
	cRaGePxRTYXAezijU8Y3kmV+f624/gvrBpjnru5kNLR1zmgmogV00iuGevAuNgPbgInPG2FzNM0E3
	yq4UuGQ/F6wQvNujSwrXfaTyiW6md/m06a1SonKs5mixzYTrQkjpd6725kOWI2dz4wi5UM6OWWz6Y
	4+x9vhF5d8kDo4dCL8J5xboDUmnqt/6fYk5FE0UH+QiNgh2I69B86jYrU1cMXuDjn++DRsRWCBLRW
	p8rEyu7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMt5-00000003bAG-16BR;
	Fri, 09 May 2025 12:31:35 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLyC-00000003RWq-3E4g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:32:50 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 549BWdrC1390739
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 06:32:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746790359;
	bh=qSETgrsVMB4OUyqU4p3tpNCMc9bknN2FBok7iwVPUnA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=dAmm3ZkO7yJ3NvTubB4FvQ9p6cj2opGD6Sx3NgNFLXWtcwppEOFgkCHIYj/9+7Xh9
	 jCFx5EyA2ncbPE6Eq8Wl4U1jisFrNHCpGHCZ2yKpjLnBn8X6GguFWUxS9eLQhZorQV
	 dEIrknq+PZid+Fx2ErE6gaVBTSmgRiFbjGsuBsAw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 549BWdaB024266
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 06:32:39 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 06:32:39 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 06:32:39 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 549BWcbG092720;
	Fri, 9 May 2025 06:32:39 -0500
Date: Fri, 9 May 2025 17:02:38 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/1] soc: ti: wkup_m3_ipc: Use dev_err_probe
Message-ID: <20250509113238.sjj5lj47hh3y4hts@lcpd911>
References: <20250509093652.1866566-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250509093652.1866566-1-alexander.stein@ew.tq-group.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_043248_891565_2E6BA682 
X-CRM114-Status: GOOD (  17.90  )
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

On May 09, 2025 at 11:36:52 +0200, Alexander Stein wrote:
> During probe the mailbox channel might not yet be available. Use
> dev_err_probe to silence this deferred probe error message:
> wkup_m3_ipc 44e11324.wkup_m3_ipc: IPC Request for A8->M3 Channel failed! -517
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/soc/ti/wkup_m3_ipc.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
> index 79dde9a7ec639..5845fc652adcf 100644
> --- a/drivers/soc/ti/wkup_m3_ipc.c
> +++ b/drivers/soc/ti/wkup_m3_ipc.c
> @@ -644,11 +644,9 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
>  
>  	m3_ipc->mbox = mbox_request_channel(&m3_ipc->mbox_client, 0);
>  
> -	if (IS_ERR(m3_ipc->mbox)) {
> -		dev_err(dev, "IPC Request for A8->M3 Channel failed! %ld\n",
> -			PTR_ERR(m3_ipc->mbox));
> -		return PTR_ERR(m3_ipc->mbox);
> -	}
> +	if (IS_ERR(m3_ipc->mbox))
> +		return dev_err_probe(dev, PTR_ERR(m3_ipc->mbox),
> +				     "IPC Request for A8->M3 Channel failed!\n");

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

