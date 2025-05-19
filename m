Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F8CC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iGvaXPFmlCaD7tO069Z1NW0tGPHoKnaB5/b9gvCSeY=; b=omquIKIZH5loFZscFWH9sXGMf/
	GVDANoxf31thj6KcNY4mH63UgyHAVrdw0wM1RIQSp881qDTwqrb4WfVqLu8j5Gh/z9w4C5g/R3EfL
	HRgpz/ua7vR0dfR0cM3MA4A17N/H11T6BSX+DsVSuAp6Zzlbp39URlUbv38boVgTqg2NHT9NCiqKz
	U5nEwwRJIZGBpshC6w4xPf2tp9LQz5CkVh76jnh7oFY+7YEa/ayMwOjpMsiCflOmGWpHUGheNdHHY
	hUV9xUgis923+9NAJzeK8sma9aIcDCchDJNxEo330GOg9L4XMt7ykBSemkKEkCsBRi+nxvALe8Cv7
	6JkrIzcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3Rg-00000009pGv-0Fqn;
	Mon, 19 May 2025 16:34:32 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2Tc-00000009csO-0hvk;
	Mon, 19 May 2025 15:32:29 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4b1MB51GSvzm1Hcc;
	Mon, 19 May 2025 15:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1747668730; x=1750260731; bh=1iGvaXPFmlCaD7tO069Z1NW0
	tGPHoKnaB5/b9gvCSeY=; b=Dwco3b/Dya5jpYSEcBA1gsi08sADra3tzFzI0Oz+
	iIjDs2+j+/vYXpMqTvH4WJWNTm51pMVjEtZG8QrKPWCzcxrQTaOcQ68Oa+wJoZbS
	rWGGDx+0U7DQADlDu6h8Zjdy6z6MUdB41jIcK2Sr2iJfx5xyicjdD3emzVr87O7r
	Yt89KL6wDjfInX3pVjcmNj0xgTt+WQ8u39MHw/kdzxlO2C+PQ2niT3RfvdJGs+lb
	X52/UkmgO9BvkRFirjpnxIKRAjWsFpK/C5Z3RLp1oXtJJUB6KdvkUu3KD+plLP55
	Hrz0VqVgdbb597AeklR+NeM1JZidV8XZg0yXOzY5ACRYqA==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id L_M2lBvzyI16; Mon, 19 May 2025 15:32:10 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4b1M9p42Njzm0Hqx;
	Mon, 19 May 2025 15:31:57 +0000 (UTC)
Message-ID: <60c20e1f-ab07-4af9-b7ea-b199364c66d0@acm.org>
Date: Mon, 19 May 2025 08:31:56 -0700
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
X-CRM114-CacheID: sfid-20250519_083228_276693_109AC91F 
X-CRM114-Status: GOOD (  10.45  )
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

UFS driver kernel patches should be prepared against Martin's for-next
branch. Commit a3a951064f7e ("scsi: ufs: Rework 
ufshcd_clock_scaling_prepare()") removed ufshcd_wait_for_doorbell_clr().

Please fix the build failure introduced by this patch.

Bart.

