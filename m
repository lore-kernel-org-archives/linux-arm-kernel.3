Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E201CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 16:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jB0cPZbL/j9osnIk7St90ygfrYdaffrndO7LwkqWJU=; b=H9leyIuxsgMiN1Wp0jJgn4WK+Q
	W0CONLdZGHJ32YCvP4KSyyOrmUTeVPQrilkFmrWjzCLtKhf6lMZ/wBKpN88wkK52Pm2G/Z82VVBzG
	3+VBRo3PjjiBd1g9YXx41o3TaiJattRckCFI09/NqyNrlUbmnJim6MyoazEvBUMG3SCA4ooeR7LSn
	oBhrRwX7m0/CE/ex7O5FWEHdWA3ey0bwJNUMCQ7DP3kBSPMXNzUnmZISUSWmByYQT06Y0uhuE8mit
	c9iRr8OcIl/BYCQoP5oWpHbMymRzc1Bn+wum4qCWrHborDfMydNi0qkyjdcct8Q2aBLnnms5kGpAw
	gt7j0juQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXM4P-000000089Cq-3TYk;
	Wed, 10 Jun 2026 16:46:25 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXM4N-000000089CE-06kV;
	Wed, 10 Jun 2026 16:46:24 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4gbBW24CkXzlffvg;
	Wed, 10 Jun 2026 16:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1781109974; x=1783701975; bh=/jB0cPZbL/j9osnIk7St90yg
	frYdaffrndO7LwkqWJU=; b=bTWflbo/sP5FTUDCc/Ak9W4pOgod3h13bq9Er/m+
	X3MnYwDgfeGWi6wJ/7Z9NVrj6kuHPopW0G1uPQhbDEzUI1EwUxNnaETzYi/XfK2F
	XdYDkOSobGKUANrEqx4R39F2pFqcIILGHMDfRgB+wJRbMacYm8/iQfDeVOIomNAg
	ovmd2pz6biGgh+Vj7H5sAEEvykonhSLJJz1or3j6l3hrGnM6EQ+cytV7xkgoe/c6
	f3DsjmFNjGy+L5931c+rVlp5j2Ccvq33Sf/E5XmykdD8kInj1ZrYfswgHfhp3+8t
	SMZ1yb4uHb9VqVSfCshZoujzduS83PDGFih1+W6F04hF2A==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id H_ZPhF46pVnA; Wed, 10 Jun 2026 16:46:14 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4gbBVp2k5bzlfgPv;
	Wed, 10 Jun 2026 16:46:10 +0000 (UTC)
Message-ID: <1af2f199-e498-46ea-b872-74bfc0d05243@acm.org>
Date: Wed, 10 Jun 2026 09:46:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ufs: core: Add get_hba_nortt callback for
 vendor-specific RTT capability
To: ed.tsai@mediatek.com, alim.akhtar@samsung.com, avri.altman@wdc.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 peter.wang@mediatek.com, alice.chao@mediatek.com, naomi.chu@mediatek.com,
 chun-hung.wu@mediatek.com
References: <20260609103856.676222-1-ed.tsai@mediatek.com>
 <20260609103856.676222-2-ed.tsai@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260609103856.676222-2-ed.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_094623_082720_E37DAC93 
X-CRM114-Status: GOOD (  16.21  )
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

On 6/9/26 3:38 AM, ed.tsai@mediatek.com wrote:
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index cfbc75d8df83..13d0d7798294 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -370,7 +370,6 @@ struct ufshcd_tx_eq_params {
>   /**
>    * struct ufs_hba_variant_ops - variant specific callbacks
>    * @name: variant name
> - * @max_num_rtt: maximum RTT supported by the host
>    * @init: called when the driver is initialized
>    * @exit: called to cleanup everything done in init
>    * @set_dma_mask: For setting another DMA mask than indicated by the 64AS
> @@ -415,10 +414,11 @@ struct ufshcd_tx_eq_params {
>    * @get_rx_fom: called to get Figure of Merit (FOM) value.
>    * @tx_eqtr_notify: called before and after TX Equalization Training procedure
>    *	to allow platform vendor specific configs to take place.
> + * @get_hba_nortt: called to get maximum number of outstanding RTTs supported by
> + *	the controller.
>    */
>   struct ufs_hba_variant_ops {
>   	const char *name;
> -	int	max_num_rtt;
>   	int	(*init)(struct ufs_hba *);
>   	void    (*exit)(struct ufs_hba *);
>   	u32	(*get_ufs_hci_version)(struct ufs_hba *);
> @@ -477,6 +477,7 @@ struct ufs_hba_variant_ops {
>   	int	(*tx_eqtr_notify)(struct ufs_hba *hba,
>   				  enum ufs_notify_change_status status,
>   				  struct ufs_pa_layer_attr *pwr_mode);
> +	int	(*get_hba_nortt)(struct ufs_hba *hba);
>   };

A patch series should be bisectable. Removing max_num_rtt from struct
ufs_hba_variant_ops before the code is removed from the MediaTek driver
that sets that variable introduces a build break. Please keep
'max_num_rtt' in this patch and add a third patch to this series that
removes 'max_num_rtt'.

Thanks,

Bart.

