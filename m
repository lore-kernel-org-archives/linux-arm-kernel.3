Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C79C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qcQNUHgV1N9LnFZH512TXGopEde8MG1HM/QzXXuiMs=; b=uopnhJey+eGw1sTlzdqLd1Q74B
	GGxTp6tgkE+tyAQ4U2ACGpPSsb4RF2v33m9f/BNptydjiTscMmG/7NJacmf3QDOV9DJyTL/LCMMHB
	LrD0VBrn9sP2iLe2Ujti6uJ2lSR1jL0O1b8qQ2lM++9R3cLvk5pNoQEKjmyvp2+X8z0YI1uomOvj9
	b+c0MIHTSQBMTl2NPwt/a1dklv2RqOLekHRuacO+dnAj6q+su5aFlqdrZ272rf7//FGZRC8FVb46g
	eLc1/tGkevTSVw1hyhoec4/j43Tsd4hx3EooCP9mpbPLs62tym85Z8FcV4JwMzfUeN/jVHZQHPFnf
	NEizeluA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9jH-00000006fWk-1Rg8;
	Tue, 24 Jun 2025 19:54:51 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6It-00000006FVK-0kOD;
	Tue, 24 Jun 2025 16:15:24 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4bRVR30xytzlgqV2;
	Tue, 24 Jun 2025 16:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1750781708; x=1753373709; bh=7qcQNUHgV1N9LnFZH512TXGo
	pEde8MG1HM/QzXXuiMs=; b=XsaIiYkMwpmUAdL/lZgWAvTZXX1aPpkSW5v7Il8l
	w1mziKN33dNk2cls8t+ni5BZYk39g4iXojYDJbtV6hbmkwtdlrntD5jMQM1CkzMW
	yj2FhBurP9YCByVxo2Gn55Z9y9U8gD3BVRHoRmfuVv9flnYypA8mQ8fg3fSD5nm+
	XJxNeTDZsgJTpxKiNvTNWb3u+/GjyvIf4WdT0kBOzZxj5rNn1e3/oDKhZGEWBuYX
	bm4fHzHoQQ4K4PrCoRjvqBxdBVoPaKlSag3rV+LwFEb9bTufwNxG1tK8k07XE2Ta
	eWIhIeCNQjocrks1rNsOyQSkLqTI6dvFWnlrbH/rIbCRqw==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id a3X19X6cxwTP; Tue, 24 Jun 2025 16:15:08 +0000 (UTC)
Received: from [100.118.141.242] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4bRVQp006CzlgqTy;
	Tue, 24 Jun 2025 16:14:56 +0000 (UTC)
Message-ID: <a15b8f6e-5ad5-4d16-98d4-79cf63619f6e@acm.org>
Date: Tue, 24 Jun 2025 09:14:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: ufs: preventing bus hang crash during emergency
 power off
To: Bo Ye <bo.ye@mediatek.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: xiujuan.tan@mediatek.com, Qilin Tan <qilin.tan@mediatek.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250519073814.167264-1-bo.ye@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250519073814.167264-1-bo.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_091523_298738_9AC74C46 
X-CRM114-Status: GOOD (  10.58  )
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

On 5/19/25 12:38 AM, Bo Ye wrote:
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 7735421e3991..a1013aea8e90 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -10262,6 +10262,7 @@ static void ufshcd_wl_shutdown(struct device *dev)
>   		scsi_device_set_state(sdev, SDEV_OFFLINE);
>   		mutex_unlock(&sdev->state_mutex);
>   	}
> +	ufshcd_wait_for_doorbell_clr(hba, 5 * USEC_PER_SEC);
>   	__ufshcd_wl_suspend(hba, UFS_SHUTDOWN_PM);
>   
>   	/*

This code path is not only triggered when using a UFSHCI 3.0 controller
but also when using a UFSHCI 4.0 controller.
ufshcd_wait_for_doorbell_clr() only supports the legacy single doorbell
mode. Please make sure that the fix supports both the legacy single
doorbell mode and MCQ.

Thanks,

Bart.

