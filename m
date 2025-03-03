Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4F6C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 17:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xs6XW5l5LKVJDuEGs9QvIzhw0zb2Kt99VbZtVOkoILA=; b=jjOkDpYdmwr17wUe/+VkngwdvN
	no9cWe2DZBlnJQVtujTLn49Nwd80mDMJcb3LMUxo5YaTL0osF6SclC9KFMUEnbwMC789fNCvOBfhc
	duGWZs0FGOE03n8JPjMbTVVVJxrKhCx7u+FTr4V4ykoDLZGYSSJPPZfGqJz/3f+OjgIgwygQ7JXrY
	Z+xUdDn2ulY5JCZN84KYiCYpoA2Ajh/Be2aSkHrSNs1qZ8BzDb+XoM3rutY24McouP2IL+SE7NcJL
	sagSIUfsKnQPnf8ekmO3Q1QdTfaV5bOLZ+hX36rkQjS5ddhfOaHEIe8CJBSOG7OEeQpgv2RtSfSDI
	5PQzs6Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpA13-00000001rBs-2cmH;
	Mon, 03 Mar 2025 17:55:45 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9zT-00000001qwU-3wSN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 17:54:09 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-471f686642cso44108871cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 09:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741024446; x=1741629246; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xs6XW5l5LKVJDuEGs9QvIzhw0zb2Kt99VbZtVOkoILA=;
        b=O9AB5lLFOAbZgJxawW9y/L1sQBg49p5W+1ONm3Ilx5o3nvxvzOIK8/Wur0fUeTPr3n
         +cJfMKcLF3EPKdql94cbSXhLxW/IHYVTOfgAFVyotLE3wN1lCk8XVT0fxBHdWY/4g1k4
         o/ZvGEvlN2nZag6Lif+SeUqIRSz1kbaV8CyyWlyzoefGhieb5QGCDQIJP/O1RdlK7QJu
         mbvo604MfvX5TcXwWjwsbDs03LrgMUiQwdeIhGajgkCOKu9wg69kfYqe+LEcbqf7F+s4
         obZ/YsjpM7h53K82i4V/dhJs4cbGvOyO9e9qem/PSD89wxLFeF41FIOZPX/it+bmUrfG
         +r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741024446; x=1741629246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xs6XW5l5LKVJDuEGs9QvIzhw0zb2Kt99VbZtVOkoILA=;
        b=qvZAwi7YS+MkGXQ9nK7fueO2Re6/9ZFMlfopTSCAjLu5F8HtQVhx5cymJ9uz49XKPd
         EIXx0+quAsnsREGXjDBTNF7lbyPKuhdM4P8kJxRd0sxsh86kuvUbUkS4/0hv15puyUQV
         OPr84YLjR9Qr5akXFYvB4Ydd8AWrjScUwP35PLHrGmNrMBf9QEpsYY2hqmhUzS9TFOZR
         GoYufJ3v+8nTeJ0JZMrEbk9Gsi0izp/KNu/bnRUjznHxVH5M1dxWdyhJaNF+yBvaLpdk
         R1SXy3nhrUPUJyuvrfbAyytFystE9Wpo4gaRzsRc8T8T9YOOnKU8KIxerZynH3iu+gm3
         uIjg==
X-Forwarded-Encrypted: i=1; AJvYcCW6tKwX+oeMacKNp9gVMJQdj27AoMAETjn3rI+bLECMgCaVWh3aFfVqreqMcPZdYRGuMJ9AWj1Y1s44DZ9PxPl/@lists.infradead.org
X-Gm-Message-State: AOJu0YykmicmnIOx7QQurtbGhfPLy6pEoqwlsNBjrmBYGWhI5nRJ9xOH
	6PqfATci47elZJ9thPaAgn/2EPYY6QdOB2Ndc2WvIWEELhcDEzIc
X-Gm-Gg: ASbGncu0pxuh35xxu/0md04fV/VhAJUrCZJHpgYgIY7sKVCNS/fUP+c84XH9LjHg3GY
	UOftRijMtud96H76vBwaA7ucDO4SYt4S7dSfcQ99of8sjIjojJ39InpoBaL0KBbyrm/I7gsQvnN
	+igUwg5YnbJd/ccL6Q379xGdZLVlXqafMkdrIL0sx1/3zef5zgm9dnnIJwePVjWv9icUoAiJhsF
	tuu51Oe34yRM/Cz5Oma/adZzlKGDI8wOrR7/OfSxIQQhu3CviXtS8xA2N0DfxvxhYMU5mHUHnk1
	D6rhq18CKj0Z1t+gByGtnSohAlaQIiqq+R8hR9V0
X-Google-Smtp-Source: AGHT+IH5I40jDDNiG/MrI51Au0ev3ZByHeIEUlYPK0MqfEH3LZQnhNrts3S3dQV0K/kx8mhNB74A9w==
X-Received: by 2002:ac8:5d11:0:b0:471:f0d6:8f32 with SMTP id d75a77b69052e-474bc0ff3aemr204772191cf.34.1741024446316;
        Mon, 03 Mar 2025 09:54:06 -0800 (PST)
Received: from debian ([2607:fb90:8e63:c2b3:5405:c8bf:c1d1:41d5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474b6d20896sm52931581cf.74.2025.03.03.09.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 09:54:05 -0800 (PST)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Mon, 3 Mar 2025 09:53:57 -0800
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, nifan.cxl@gmail.com,
	a.manzanares@samsung.com, pankaj.dubey@samsung.com,
	cassel@kernel.org, 18255117159@163.com, xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 4/5] Add debugfs based error injection support in DWC
Message-ID: <Z8XstSB-BE6JG5hk@debian>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132039epcas5p31913eab0acec1eb5e7874897a084c725@epcas5p3.samsung.com>
 <20250221131548.59616-5-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221131548.59616-5-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_095407_981994_F5931631 
X-CRM114-Status: GOOD (  36.08  )
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

On Fri, Feb 21, 2025 at 06:45:47PM +0530, Shradha Todi wrote:
> Add support to provide error injection interface to userspace. This set
> of debug registers are part of the RASDES feature present in DesignWare
> PCIe controllers.
> 
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---

LGTM.

Reviewed-by: Fan Ni <fan.ni@samsung.com>

>  Documentation/ABI/testing/debugfs-dwc-pcie    |  70 ++++++++
>  .../controller/dwc/pcie-designware-debugfs.c  | 165 +++++++++++++++++-
>  2 files changed, 233 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/debugfs-dwc-pcie b/Documentation/ABI/testing/debugfs-dwc-pcie
> index e8ed34e988ef..6ee0897fe753 100644
> --- a/Documentation/ABI/testing/debugfs-dwc-pcie
> +++ b/Documentation/ABI/testing/debugfs-dwc-pcie
> @@ -11,3 +11,73 @@ Contact:	Shradha Todi <shradha.t@samsung.com>
>  Description:	(RW) Write the lane number to be checked as valid or invalid. Read
>  		will return the status of PIPE RXVALID signal of the selected lane.
>  		The default selected lane is Lane0.
> +
> +What:		/sys/kernel/debug/dwc_pcie_<dev>/rasdes_err_inj/<error>
> +Date:		Feburary 2025
> +Contact:	Shradha Todi <shradha.t@samsung.com>
> +Description:	rasdes_err_inj is the directory which can be used to inject errors in the
> +		system. The possible errors that can be injected are:
> +
> +		1) TLP LCRC error injection TX Path - tx_lcrc
> +		2) 16b CRC error injection of ACK/NAK DLLP - b16_crc_dllp
> +		3) 16b CRC error injection of Update-FC DLLP - b16_crc_upd_fc
> +		4) TLP ECRC error injection TX Path - tx_ecrc
> +		5) TLP's FCRC error injection TX Path - fcrc_tlp
> +		6) Parity error of TSOS - parity_tsos
> +		7) Parity error on SKPOS - parity_skpos
> +		8) LCRC error injection RX Path - rx_lcrc
> +		9) ECRC error injection RX Path - rx_ecrc
> +		10) TLPs SEQ# error - tlp_err_seq
> +		11) DLLPS ACK/NAK SEQ# error - ack_nak_dllp_seq
> +		12) ACK/NAK DLLPs transmission block - ack_nak_dllp
> +		13) UpdateFC DLLPs transmission block - upd_fc_dllp
> +		14) Always transmission for NAK DLLP - nak_dllp
> +		15) Invert SYNC header - inv_sync_hdr_sym
> +		16) COM/PAD TS1 order set - com_pad_ts1
> +		17) COM/PAD TS2 order set - com_pad_ts2
> +		18) COM/FTS FTS order set - com_fts
> +		19) COM/IDL E-idle order set - com_idl
> +		20) END/EDB symbol - end_edb
> +		21) STP/SDP symbol - stp_sdp
> +		22) COM/SKP SKP order set - com_skp
> +		23) Posted TLP Header credit value control - posted_tlp_hdr
> +		24) Non-Posted TLP Header credit value control - non_post_tlp_hdr
> +		25) Completion TLP Header credit value control - cmpl_tlp_hdr
> +		26) Posted TLP Data credit value control - posted_tlp_data
> +		27) Non-Posted TLP Data credit value control - non_post_tlp_data
> +		28) Completion TLP Data credit value control - cmpl_tlp_data
> +		29) Generates duplicate TLPs - duplicate_dllp
> +		30) Generates Nullified TLPs - nullified_tlp
> +
> +		(WO) Write to the attribute will prepare controller to inject the respective
> +		error in the next transmission of data. Parameter required to write will
> +		change in the following ways:
> +
> +		i) Errors 9) - 10) are sequence errors. The write command for these will be
> +
> +			echo <count> <diff> > /sys/kernel/debug/dwc_pcie_<dev>/rasdes_err_inj/<error>
> +
> +			<count>
> +				Number of errors to be injected
> +			<diff>
> +				The difference to add or subtract from natural sequence number to
> +				generate sequence error. Range (-4095 : 4095)
> +
> +		ii) Errors 23) - 28) are credit value error insertions. Write command:
> +
> +			echo <count> <diff> <vc> > /sys/kernel/debug/dwc_pcie_<dev>/rasdes_err_inj/<error>
> +
> +			<count>
> +				Number of errors to be injected
> +			<diff>
> +				The difference to add or subtract from UpdateFC credit value.
> +				Range (-4095 : 4095)
> +			<vc>
> +				Target VC number
> +
> +		iii) All other errors. Write command:
> +
> +			echo <count> > /sys/kernel/debug/dwc_pcie_<dev>/rasdes_err_inj/<error>
> +
> +			<count>
> +				Number of errors to be injected
> diff --git a/drivers/pci/controller/dwc/pcie-designware-debugfs.c b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
> index 3887a6996706..b7260edd2336 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-debugfs.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
> @@ -17,6 +17,20 @@
>  #define PIPE_DETECT_LANE		BIT(17)
>  #define LANE_SELECT			GENMASK(3, 0)
>  
> +#define ERR_INJ0_OFF			0x34
> +#define EINJ_VAL_DIFF			GENMASK(28, 16)
> +#define EINJ_VC_NUM			GENMASK(14, 12)
> +#define EINJ_TYPE_SHIFT			8
> +#define EINJ0_TYPE			GENMASK(11, 8)
> +#define EINJ1_TYPE			BIT(8)
> +#define EINJ2_TYPE			GENMASK(9, 8)
> +#define EINJ3_TYPE			GENMASK(10, 8)
> +#define EINJ4_TYPE			GENMASK(10, 8)
> +#define EINJ5_TYPE			BIT(8)
> +#define EINJ_COUNT			GENMASK(7, 0)
> +
> +#define ERR_INJ_ENABLE_REG		0x30
> +
>  #define DWC_DEBUGFS_BUF_MAX		128
>  
>  /**
> @@ -33,6 +47,72 @@ struct dwc_pcie_rasdes_info {
>  	struct mutex reg_event_lock;
>  };
>  
> +/**
> + * struct dwc_pcie_rasdes_priv - Stores file specific private data information
> + * @pci: Reference to the dw_pcie structure
> + * @idx: Index to point to specific file related information in array of structs
> + *
> + * All debugfs files will have this struct as its private data.
> + */
> +struct dwc_pcie_rasdes_priv {
> +	struct dw_pcie *pci;
> +	int idx;
> +};
> +
> +/**
> + * struct dwc_pcie_err_inj - Store details about each error injection supported by DWC RASDES
> + * @name: Name of the error that can be injected
> + * @err_inj_group: Group number to which the error belongs to. Value can range from 0 - 5
> + * @err_inj_type: Each group can have multiple types of error
> + */
> +struct dwc_pcie_err_inj {
> +	const char *name;
> +	u32 err_inj_group;
> +	u32 err_inj_type;
> +};
> +
> +static const struct dwc_pcie_err_inj err_inj_list[] = {
> +	{"tx_lcrc", 0x0, 0x0},
> +	{"b16_crc_dllp", 0x0, 0x1},
> +	{"b16_crc_upd_fc", 0x0, 0x2},
> +	{"tx_ecrc", 0x0, 0x3},
> +	{"fcrc_tlp", 0x0, 0x4},
> +	{"parity_tsos", 0x0, 0x5},
> +	{"parity_skpos", 0x0, 0x6},
> +	{"rx_lcrc", 0x0, 0x8},
> +	{"rx_ecrc", 0x0, 0xb},
> +	{"tlp_err_seq", 0x1, 0x0},
> +	{"ack_nak_dllp_seq", 0x1, 0x1},
> +	{"ack_nak_dllp", 0x2, 0x0},
> +	{"upd_fc_dllp", 0x2, 0x1},
> +	{"nak_dllp", 0x2, 0x2},
> +	{"inv_sync_hdr_sym", 0x3, 0x0},
> +	{"com_pad_ts1", 0x3, 0x1},
> +	{"com_pad_ts2", 0x3, 0x2},
> +	{"com_fts", 0x3, 0x3},
> +	{"com_idl", 0x3, 0x4},
> +	{"end_edb", 0x3, 0x5},
> +	{"stp_sdp", 0x3, 0x6},
> +	{"com_skp", 0x3, 0x7},
> +	{"posted_tlp_hdr", 0x4, 0x0},
> +	{"non_post_tlp_hdr", 0x4, 0x1},
> +	{"cmpl_tlp_hdr", 0x4, 0x2},
> +	{"posted_tlp_data", 0x4, 0x4},
> +	{"non_post_tlp_data", 0x4, 0x5},
> +	{"cmpl_tlp_data", 0x4, 0x6},
> +	{"duplicate_dllp", 0x5, 0x0},
> +	{"nullified_tlp", 0x5, 0x1},
> +};
> +
> +static const u32 err_inj_type_mask[] = {
> +	EINJ0_TYPE,
> +	EINJ1_TYPE,
> +	EINJ2_TYPE,
> +	EINJ3_TYPE,
> +	EINJ4_TYPE,
> +	EINJ5_TYPE,
> +};
> +
>  static ssize_t lane_detect_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>  {
>  	struct dw_pcie *pci = file->private_data;
> @@ -93,6 +173,63 @@ static ssize_t rx_valid_write(struct file *file, const char __user *buf, size_t
>  	return lane_detect_write(file, buf, count, ppos);
>  }
>  
> +static ssize_t err_inj_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
> +{
> +	struct dwc_pcie_rasdes_priv *pdata = file->private_data;
> +	struct dw_pcie *pci = pdata->pci;
> +	struct dwc_pcie_rasdes_info *rinfo = pci->debugfs->rasdes_info;
> +	u32 val, counter, vc_num, err_group, type_mask;
> +	int val_diff = 0;
> +	char *kern_buf;
> +
> +	err_group = err_inj_list[pdata->idx].err_inj_group;
> +	type_mask = err_inj_type_mask[err_group];
> +
> +	kern_buf = memdup_user_nul(buf, count);
> +	if (IS_ERR(kern_buf))
> +		return PTR_ERR(kern_buf);
> +
> +	if (err_group == 4) {
> +		val = sscanf(kern_buf, "%u %d %u", &counter, &val_diff, &vc_num);
> +		if ((val != 3) || (val_diff < -4095 || val_diff > 4095)) {
> +			kfree(kern_buf);
> +			return -EINVAL;
> +		}
> +	} else if (err_group == 1) {
> +		val = sscanf(kern_buf, "%u %d", &counter, &val_diff);
> +		if ((val != 2) || (val_diff < -4095 || val_diff > 4095)) {
> +			kfree(kern_buf);
> +			return -EINVAL;
> +		}
> +	} else {
> +		val = kstrtou32(kern_buf, 0, &counter);
> +		if (val) {
> +			kfree(kern_buf);
> +			return val;
> +		}
> +	}
> +
> +	val = dw_pcie_readl_dbi(pci, rinfo->ras_cap_offset + ERR_INJ0_OFF + (0x4 * err_group));
> +	val &= ~(type_mask | EINJ_COUNT);
> +	val |= ((err_inj_list[pdata->idx].err_inj_type << EINJ_TYPE_SHIFT) & type_mask);
> +	val |= FIELD_PREP(EINJ_COUNT, counter);
> +
> +	if (err_group == 1 || err_group == 4) {
> +		val &= ~(EINJ_VAL_DIFF);
> +		val |= FIELD_PREP(EINJ_VAL_DIFF, val_diff);
> +	}
> +	if (err_group == 4) {
> +		val &= ~(EINJ_VC_NUM);
> +		val |= FIELD_PREP(EINJ_VC_NUM, vc_num);
> +	}
> +
> +	dw_pcie_writel_dbi(pci, rinfo->ras_cap_offset + ERR_INJ0_OFF + (0x4 * err_group), val);
> +	dw_pcie_writel_dbi(pci, rinfo->ras_cap_offset + ERR_INJ_ENABLE_REG, (0x1 << err_group));
> +
> +	kfree(kern_buf);
> +	return count;
> +}
> +
>  #define dwc_debugfs_create(name)			\
>  debugfs_create_file(#name, 0644, rasdes_debug, pci,	\
>  			&dbg_ ## name ## _fops)
> @@ -107,6 +244,11 @@ static const struct file_operations dbg_ ## name ## _fops = {	\
>  DWC_DEBUGFS_FOPS(lane_detect);
>  DWC_DEBUGFS_FOPS(rx_valid);
>  
> +static const struct file_operations dwc_pcie_err_inj_ops = {
> +	.open = simple_open,
> +	.write = err_inj_write,
> +};
> +
>  static void dwc_pcie_rasdes_debugfs_deinit(struct dw_pcie *pci)
>  {
>  	struct dwc_pcie_rasdes_info *rinfo = pci->debugfs->rasdes_info;
> @@ -116,10 +258,11 @@ static void dwc_pcie_rasdes_debugfs_deinit(struct dw_pcie *pci)
>  
>  static int dwc_pcie_rasdes_debugfs_init(struct dw_pcie *pci, struct dentry *dir)
>  {
> -	struct dentry *rasdes_debug;
> +	struct dentry *rasdes_debug, *rasdes_err_inj;
>  	struct dwc_pcie_rasdes_info *rasdes_info;
> +	struct dwc_pcie_rasdes_priv *priv_tmp;
>  	struct device *dev = pci->dev;
> -	int ras_cap;
> +	int ras_cap, i, ret;
>  
>  	ras_cap = dw_pcie_find_rasdes_capability(pci);
>  	if (!ras_cap) {
> @@ -133,6 +276,7 @@ static int dwc_pcie_rasdes_debugfs_init(struct dw_pcie *pci, struct dentry *dir)
>  
>  	/* Create subdirectories for Debug, Error injection, Statistics */
>  	rasdes_debug = debugfs_create_dir("rasdes_debug", dir);
> +	rasdes_err_inj = debugfs_create_dir("rasdes_err_inj", dir);
>  
>  	mutex_init(&rasdes_info->reg_event_lock);
>  	rasdes_info->ras_cap_offset = ras_cap;
> @@ -142,7 +286,24 @@ static int dwc_pcie_rasdes_debugfs_init(struct dw_pcie *pci, struct dentry *dir)
>  	dwc_debugfs_create(lane_detect);
>  	dwc_debugfs_create(rx_valid);
>  
> +	/* Create debugfs files for Error injection subdirectory */
> +	for (i = 0; i < ARRAY_SIZE(err_inj_list); i++) {
> +		priv_tmp = devm_kzalloc(dev, sizeof(*priv_tmp), GFP_KERNEL);
> +		if (!priv_tmp) {
> +			ret = -ENOMEM;
> +			goto err_deinit;
> +		}
> +
> +		priv_tmp->idx = i;
> +		priv_tmp->pci = pci;
> +		debugfs_create_file(err_inj_list[i].name, 0200, rasdes_err_inj, priv_tmp,
> +				    &dwc_pcie_err_inj_ops);
> +	}
>  	return 0;
> +
> +err_deinit:
> +	dwc_pcie_rasdes_debugfs_deinit(pci);
> +	return ret;
>  }
>  
>  void dwc_pcie_debugfs_deinit(struct dw_pcie *pci)
> -- 
> 2.17.1
> 

