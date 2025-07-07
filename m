Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA166C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhBmOe4x1JLcoZy9mys+lB4+WJiQRcQ3Aao9PKPfMf8=; b=LsQw+bTSEwVlBnVbR33me8U+BD
	JQqFs3DYg44xox7KsaNgrgg4JpfNmKal5AChnEbRF2xcZ4xXs3OwXNIJ7wUcpHRFupgqIQPvL6efX
	DZ0mVVRNAAs0QHfO5RMjhW1C0CifB3iHQW9ZTlEiakA5BBL0zar+62ZIC0qJ4jMOtLU6Y+nwRCSEE
	kNNSyDKLasvsLQVQK7CR9xc5HcVOiRJzrpye/NLb2MeA1wcoUGCRk1GT/sSmGS/1Bi839bol7qLQQ
	n9Uf36wQ+uAs6g9IcWqRl1Or3Kka3hHWOUT8+qG962tvPMebNiPU8YvWJm0AW79+2z9UrR/H7nMdj
	RAoD50Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpIO-000000037Z7-0pNO;
	Mon, 07 Jul 2025 17:06:24 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoUU-00000002zp3-3cgx;
	Mon, 07 Jul 2025 16:14:53 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4bbTpd6XF1zltKGZ;
	Mon,  7 Jul 2025 16:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1751904887; x=1754496888; bh=DhBmOe4x1JLcoZy9mys+lB4+
	WJiQRcQ3Aao9PKPfMf8=; b=XCzhS0MhtHZh1gZfve9dCCHnaQ14ohGk/X9Al/G4
	WG8xmUu0nDRuTkjj5caY+e5sBmnc4rdlHVAIQl2karkC8vuCbg0+PJkxy6QQXMIf
	nNvr7YdzL9WUmRHpLsKAW6zaTVQb86ezgxVMHgrHByXTSYM1olbx48Ipl+To23Eh
	RBrrMxAeheBcJ4jaSVlDOgeYVKaI3pZHYNchGZKq79XzcuFE2GDjMEn/EAMUkms7
	BJsmdxqA6yygCkjQ17Ypq1XU840d/a74YyEj9VjIYdLrbu0TMmxsk5oZ7q5FfRgF
	kfR8rJsrzmjWN3vzvumoynJ1JO3FFoCB8NwLH8rSMi9/Hw==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id SVxenN_q8gk4; Mon,  7 Jul 2025 16:14:47 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4bbTpQ64vXzlng93;
	Mon,  7 Jul 2025 16:14:37 +0000 (UTC)
Message-ID: <2700084c-5241-468a-a80e-971e42560d31@acm.org>
Date: Mon, 7 Jul 2025 09:14:36 -0700
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
X-CRM114-CacheID: sfid-20250707_091450_986965_8E59E2E6 
X-CRM114-Status: GOOD (  18.43  )
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
> The root cause is that scsi_device_quiesce and blk_mq_freeze_queue
> only drain the requests in the request queue but don't guarantee that
> all requests have been dispatched to the UFS host and completed.
> Requests may remain pending in the hardware dispatch queue and be
> rescheduled later.

The above is confusing. scsi_device_quiesce() drains both the request
queue and the hardware queues for all commands associated with a single
logical unit. The problem that you are encountering is probably that
scsi_device_quiesce() is only called for the WLUN but not for the other
logical units and hence that there still may be commands being processed
for other logical units after scsi_device_quiesce() has returned.

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

The name of the ufshcd_wait_for_doorbell_clr() function is confusing
since "doorbell" refers to a legacy single doorbell mode concept while
the function supports both legacy mode and MCQ. After this patch has
been queued I plan to submit a patch that renames this function.

If the patch description of this patch is improved I will add my
Reviewed-by to this patch.

Thanks,

Bart.

