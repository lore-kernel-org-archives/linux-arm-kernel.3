Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DBBC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 18:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+WExHp/eucasP6spZD90r4rBLs5DXcFpo1A+WnUFhk=; b=sidMK2HZ+fchi5YgKPKPfz9tOd
	qol/lWMHKY9fvprpqzHfV0rNqdvgnm5RksnB1/iBws/JnVdYLt3z1yQCDVkoj8l6VL91VSNpPUMFt
	Q7X8QmfKw2tQeaNBQia425ekiK8R/7guiduXc1+6US1swbLzTLEgk25uaLcNTatGU5sVFSCDywQeF
	ny8E1bdv4SpDL90/hVFT07xEKpg9r44Q3mCbBDI0VeGIVGLOmRsCi6Mk9N1aYIGlw265ZD5TxMDje
	Q1aLRb7+kLgYy0FQbE6IPkVUQ5Ueuagay0Qm41XugzH2GbW/iOQPOesFNOPzr64HRJW+CvZ7Cs6zU
	dG/YJbwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tafLT-0000000AyEX-1Zy9;
	Wed, 22 Jan 2025 18:20:55 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tafKA-0000000Ay6D-3Mk8;
	Wed, 22 Jan 2025 18:19:35 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4YdXR92KFPz6CmQyd;
	Wed, 22 Jan 2025 18:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1737569962; x=1740161963; bh=T+WExHp/eucasP6spZD90r4r
	BLs5DXcFpo1A+WnUFhk=; b=1+VGhC4iEJJmeJElGE8dCFS9c9hczJFD7CeGGbOG
	ue2x1HsXGfywfXFyEX2KoPLJfCnXi0Rf9bRYk317HJx2EwCsqrZgsFMiXrl+gvND
	19q1sinrkcYXh2uDde9bTZ4fjXQvdmiSLKA84efVoifnUxY25PNf4nqlNDguuL3s
	o3a9BywEKWK16NBg+8toSmdlHO49HKK9XLyTZT777UCjnKofXNKx7fYEAmfCMYln
	narbB/wLjyqHfwn+mzfV+t4SbBubNq1WVj+DRePN9r0IDlCjipOy4bXdQipHBW/e
	hVQK7X1EvtspO4q0+kWmTYRn3aRlgVb+WQeccuuZ233o/Q==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id U4d84v6X9cLj; Wed, 22 Jan 2025 18:19:22 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4YdXQn1V56z6CmQyY;
	Wed, 22 Jan 2025 18:19:12 +0000 (UTC)
Message-ID: <2e42cc2b-5597-435a-a58d-507c46e1132f@acm.org>
Date: Wed, 22 Jan 2025 10:19:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vops
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 mani@kernel.org, beanhuo@micron.com, avri.altman@wdc.com,
 junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Maramaina Naresh <quic_mnaresh@quicinc.com>,
 Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-2-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250122100214.489749-2-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_101934_859485_F7DF957B 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

On 1/22/25 2:02 AM, Ziqi Chen wrote:
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index d7aca9e61684..a4dac897a169 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -344,7 +344,7 @@ struct ufs_hba_variant_ops {
>   	void    (*exit)(struct ufs_hba *);
>   	u32	(*get_ufs_hci_version)(struct ufs_hba *);
>   	int	(*set_dma_mask)(struct ufs_hba *);
> -	int	(*clk_scale_notify)(struct ufs_hba *, bool,
> +	int (*clk_scale_notify)(struct ufs_hba *, bool, unsigned long,
>   				    enum ufs_notify_change_status);
>   	int	(*setup_clocks)(struct ufs_hba *, bool,
>   				enum ufs_notify_change_status);

Please keep the indentation consistent.

Thanks,

Bart.

