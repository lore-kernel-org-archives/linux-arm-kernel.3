Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F561CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Npi4M3TMXFh7qnSvuPO/x5NdI1CgV5cfT8ctm2HfVHw=; b=XC4qj6+UJfSa2Mh1P3VQzImkBK
	Qx1eJuZj3vQxicQWGjHXfgmy3TPD61uRdchk3Uq2wxud0toS94t32VO6INOdspHb3J5/xuc4tW/CZ
	286Jw9PcofxfAaBDkww/MUT7rzoe0alPGLuw8xDICsm515g9q3SEjPMQhW8NpRvdoqKRnm4T2swiL
	0IH3IJa1MDLl84Jx7tTmvTsWSddfyEq2NepZy9jaPC6GPTalMAH82p/yp5u4nkmcIexQg+MtTUKWG
	7qwzJLpJB4D+Ly/9WjTjEMPwSd5ZL0AZ/MeXpLtSNX5b4Awqq0oAcCXKpEZCO4szsa3K4RUoDUCWH
	Y6pg0G0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKE0l-0000000G3gd-1gI2;
	Tue, 05 May 2026 11:32:23 +0000
Received: from mail-eastusazon11012016.outbound.protection.outlook.com ([52.101.53.16] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKE0j-0000000G3ff-0iIh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:32:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZfCIYgk7s1z2EcYCCeMTcNWf0f/SlhyusEKF3o6s5XulMfwHBuL8S0VSYWYohzZve4W1lt1+cqI19aEH3SfAosbuU5DH0E5wC2CWz+IHbkoSkXWBQtiUOhfyABGBauLXLaZpkCLcMuJLQ4UK/Irp6NiRptnf0D8zok8T4d+idmMgnNNYbaDmrdE4ncwCKGy2dRKcPG1RuK7+AfGQKOOi/d/R0NPLI0rQ83vlEJGEaJBGe/eCXEQhlqtnjr5jrss/uhGx1uo3R8foB314y/3f65ALcoif2TiyYG40Wt2dWVPZURqpAom+SNlG2sKV9oX8ay7e6LqsXzNs1py1aILQDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Npi4M3TMXFh7qnSvuPO/x5NdI1CgV5cfT8ctm2HfVHw=;
 b=wR2IhGm64sr20QiDpllgipbEQl0T6DNtTxf0lsh828K97CZuzX/hSHtVzAyUS2yx+UkEc1nny2c4hZtGcfVVBwFE7UodaGd7Keak4PS/tRtS8T0W+8YC5ua/maMGNPksEnTN3PMRSNXh1E2+G5KvggyQJ0NW2XNpjOBHhX4noHWvnOHq7S/VCNnAoEzVfLl9MiQdt9tTvdIzgjiStOxWXfeShWHj33A2vYIOcE8tBZ2nVSCZ8DD2DyQujzs2FZQH2s2WRcYVpy2gX/WRPay62ln5XHpG0OqdFS4M134xp+HXfWzWgLaBQ+knapyC6uVtWNg93vdsSO/vbmFZfM50rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Npi4M3TMXFh7qnSvuPO/x5NdI1CgV5cfT8ctm2HfVHw=;
 b=RcfdZbDXh+Lsha6LMst5zE3JvXnv36D/25HsweO4zLlBgDJAz5Z+URHKTQKfgvvXKWhz4lTrxRi7ZgapS2Fui+b5TmMG9Z3DzkFusMpPCh7FHOmuMoJOOAPdAXO/fMlTNwGzsQQmn5RBOiek5EcUg8iGQLxDSJmI25JsaoxNa+8=
Received: from PH7P221CA0071.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::24)
 by DM4PR10MB6159.namprd10.prod.outlook.com (2603:10b6:8:ba::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:32:14 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:510:328:cafe::2c) by PH7P221CA0071.outlook.office365.com
 (2603:10b6:510:328::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 11:32:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:32:14 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:32:13 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:32:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 06:32:13 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645BWDPs2871108;
	Tue, 5 May 2026 06:32:13 -0500
Date: Tue, 5 May 2026 06:32:13 -0500
From: Nishanth Menon <nm@ti.com>
To: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
CC: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>, <richard.genoud@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>, Abhash Kumar <a-kumar2@ti.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, Kendall Willis
	<k-willis@ti.com>
Subject: Re: [PATCH v6 2/4] firmware: ti_sci: add support for restoring IRQs
 during resume
Message-ID: <20260505113213.fz7qrovpgn4lbesn@zodiac>
References: <20260427-ti-sci-jacinto-s2r-restore-irq-v6-0-72c6468cb2ab@bootlin.com>
 <20260427-ti-sci-jacinto-s2r-restore-irq-v6-2-72c6468cb2ab@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260427-ti-sci-jacinto-s2r-restore-irq-v6-2-72c6468cb2ab@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|DM4PR10MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: 737fc377-37ac-4a59-26c3-08deaa99f4cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8aQ2M8OJ6rxorSphD3w1uLLTVXlJJL6PEX8MpIb+CEieM1gZh/9xjZHcd5dH4qwQo072cJ8q67C5LvgKC2zZn7QwjhFDna0DOMGZhOcOjnYIN23KdnsxYW0qqegsRrclyTU3v8wpyB+t+bjB2GSuFNcUPmy2MFqKl5dYh9kWHDR7NJ2JbAX5GnXpy9a2e9VrJa4Y2t+BzYEugGmSRXjzufdut3J3JU0ghjuFwG1MzQguC3FX9/YKJtSepC/jgeJBkOLPYiM8J6VIVVMSeHmp2+LzcE8HSP9tPX/m88XRsNtJSMJx7jC2RncUgj03vuhP5+7I+8XOBjHT6o86XVlEhfRSHfj14DEI/LdveO1XnIrxubT+wmOdoB6vJs4PFUcuJ4WJWOZyxsjDqVrAx+I1v4FaGZ0cm+dcnjJTt5mxUZtptxEDIAwkpRhejzSr6er7mmDuQrLXk4CGxoFjqZjjwMxSv4qGc5YcuE88ie+vm6fmS2t+Hm6p8e8SpH+q3zpKOCA7/wKzuUEk+xQ9hwEQWJOByeVKmgTmPLfk8nuS+Z/BTRg+yKTzGKQUnBWNJIFnPPKpzNoFfObfkIy/eEFYG5TO1LCdbKhavpZX4YY6eW2JamTSNAa2B01E1RKgOP/wzH/lFIHiu1CGmlnihD2MtUnB9ge2qWLzHSly9ak9NG4IaOV7qx1ezNct8CwlCC5RIMgvVjCsX0yFcM721KiS7HU5nxmM+d+gMdqL17E8jic=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uBLdfRXmHi3VJVtGylAElMfb42WEJAspmZbhdCCYWcsjxtG0jQiHQS4PrZKhet2oCvLyI+9O445fq9P4B6ChKgz9C773mbbzY2WdVZ7gd+mLGgMA7zAA5n8qxGXEk7aU5PsrZGW8OGhphEP4P6nT7SW1WsmlX+wUCA2yQVr2lpESqd9hBXv/EzTB1cEppCHxaQwpA9HrqTcxq8/wih9NzRzITnCeYfe1tEhLdBn03WQWudoHNYIiJRXF7AF0fbmAEOz9RPvaP0fWtKoAbVIGY+pTA2tP2xsF7Gj39LAUUIJwoRJBpFxCHBF5whfDU0fKvZ3yza+3w48c91ZESGBhdlrpIH2prH5XlGug39UayZNqBz2GSSz+J+RhkvuYsO6aQSaAq5NeFZwb42dxuDSHB9ZQ9qOMZHZOchsH+CylKIertJEaMC/n9bHZ5lmE6rM6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:32:14.6310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 737fc377-37ac-4a59-26c3-08deaa99f4cf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_043221_220042_E1811BB2 
X-CRM114-Status: GOOD (  18.07  )
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

On 14:21-20260427, Thomas Richard (TI) wrote:

[..]

>  /**
>   * ti_sci_set_irq() - Helper api to configure the irq route between the
>   *		      requested source and destination
> @@ -2324,15 +2363,43 @@ static int ti_sci_set_irq(const struct ti_sci_handle *handle, u32 valid_params,
>  			  u16 dst_host_irq, u16 ia_id, u16 vint,
>  			  u16 global_event, u8 vint_status_bit, u8 s_host)
>  {
> +	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
> +	struct ti_sci_msg_req_manage_irq *desc;
> +	struct ti_sci_irq *irq;
> +	int ret;
> +
>  	pr_debug("%s: IRQ set with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
>  		 __func__, valid_params, src_id, src_index,
>  		 dst_id, dst_host_irq, ia_id, vint, global_event,
>  		 vint_status_bit);
>  
> -	return ti_sci_manage_irq(handle, valid_params, src_id, src_index,
> -				 dst_id, dst_host_irq, ia_id, vint,
> -				 global_event, vint_status_bit, s_host,
> -				 TI_SCI_MSG_SET_IRQ);
> +	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
> +				dst_id, dst_host_irq, ia_id, vint,
> +				global_event, vint_status_bit, s_host,
> +				TI_SCI_MSG_SET_IRQ);
> +
> +	if (ret || !(info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST))
> +		return ret;
> +
> +	irq = kzalloc_obj(*irq, GFP_KERNEL);
> +	if (!irq)
> +		return -ENOMEM;

Do we need to handle cleanup of ti_sci_manage_irq if the allocation fails?

> +
> +	desc = &irq->desc;
> +	desc->valid_params = valid_params;
> +	desc->src_id = src_id;
> +	desc->src_index = src_index;
> +	desc->dst_id = dst_id;
> +	desc->dst_host_irq = dst_host_irq;
> +	desc->ia_id = ia_id;
> +	desc->vint = vint;
> +	desc->global_event = global_event;
> +	desc->vint_status_bit = vint_status_bit;
> +	desc->secondary_host = s_host;
> +
> +	hash_add(info->irqs, &irq->node, ti_sci_irq_hash(desc));

No locking? set_irq can be invoked in parallel paths, no?
Further, should'nt we check if the same src_id and src_index is already
present before adding to hash list?

> +
> +	return 0;
>  }
>  
>  /**
> @@ -2358,15 +2425,46 @@ static int ti_sci_free_irq(const struct ti_sci_handle *handle, u32 valid_params,
>  			   u16 dst_host_irq, u16 ia_id, u16 vint,
>  			   u16 global_event, u8 vint_status_bit, u8 s_host)
>  {
> +	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
> +	struct ti_sci_msg_req_manage_irq irq_desc;
> +	struct ti_sci_irq *this_irq;
> +	struct hlist_node *tmp_node;
> +	int ret;
> +
>  	pr_debug("%s: IRQ release with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
>  		 __func__, valid_params, src_id, src_index,
>  		 dst_id, dst_host_irq, ia_id, vint, global_event,
>  		 vint_status_bit);
>  
> -	return ti_sci_manage_irq(handle, valid_params, src_id, src_index,
> -				 dst_id, dst_host_irq, ia_id, vint,
> -				 global_event, vint_status_bit, s_host,
> -				 TI_SCI_MSG_FREE_IRQ);
> +	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
> +				dst_id, dst_host_irq, ia_id, vint,
> +				global_event, vint_status_bit, s_host,
> +				TI_SCI_MSG_FREE_IRQ);
> +
> +	if (ret || !(info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST))
> +		return ret;
> +
> +	irq_desc.valid_params = valid_params;
> +	irq_desc.src_id = src_id;
> +	irq_desc.src_index = src_index;
> +	irq_desc.dst_id = dst_id;
> +	irq_desc.dst_host_irq = dst_host_irq;
> +	irq_desc.ia_id = ia_id;
> +	irq_desc.vint = vint;
> +	irq_desc.global_event = global_event;
> +	irq_desc.vint_status_bit = vint_status_bit;
> +	irq_desc.secondary_host = s_host;
> +
> +	hash_for_each_possible_safe(info->irqs, this_irq, tmp_node, node,
> +				    ti_sci_irq_hash(&irq_desc)) {
> +		if (ti_sci_irq_equal(&irq_desc, &this_irq->desc)) {
> +			hlist_del(&this_irq->node);
> +			kfree(this_irq);
> +			return 0;
> +		}
> +	}
> +

We should ideally not be here, correct? Add a dev_warn?

> +	return 0;
>  }
>  
>  /**
> @@ -3847,7 +3945,10 @@ static int ti_sci_suspend_noirq(struct device *dev)
>  static int ti_sci_resume_noirq(struct device *dev)
>  {
>  	struct ti_sci_info *info = dev_get_drvdata(dev);
> -	int ret = 0;
> +	struct ti_sci_msg_req_manage_irq *irq_desc;
> +	struct ti_sci_irq *irq;
> +	struct hlist_node *tmp_node;
> +	int ret = 0, i;
>  	u32 source;
>  	u64 time;
>  	u8 pin;
> @@ -3859,6 +3960,32 @@ static int ti_sci_resume_noirq(struct device *dev)
>  			return ret;
>  	}
>  
> +	switch (pm_suspend_target_state) {
> +	case PM_SUSPEND_MEM:
> +		if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST) {
> +			hash_for_each_safe(info->irqs, i, tmp_node, irq, node) {
> +				irq_desc = &irq->desc;
> +				ret = ti_sci_manage_irq(&info->handle,
> +							irq_desc->valid_params,
> +							irq_desc->src_id,
> +							irq_desc->src_index,
> +							irq_desc->dst_id,
> +							irq_desc->dst_host_irq,
> +							irq_desc->ia_id,
> +							irq_desc->vint,
> +							irq_desc->global_event,
> +							irq_desc->vint_status_bit,
> +							irq_desc->secondary_host,
> +							TI_SCI_MSG_SET_IRQ);
> +				if (ret)
> +					return ret;

Do you want to attempt to restore the rest of the entries rather than give
up on the first fail? Maybe just log the error for debug and attempt the
rest?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

