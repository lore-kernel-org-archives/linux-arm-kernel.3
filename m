Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E52D6AB1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 01:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7a1fZxaKoE5xyb/5xzVXDFRHMaJo2Lgn50wTA87sjTQ=; b=1/VvPszxArzbFI+FsJptNfuPbS
	5pJk5gNvmM/zwPsRYvt9ykprmhO6pcrQp/gAeGgvicYT+IfXdf83NiSAW9E6DgZJzxbDNAqKLsi75
	biTfDsF/kVTtsbfBSaLhwdUY4/A3DlfXbEZM7WPJdkW6qfPscMVhATX558g2wJ4FkCndOXyFV2N6e
	yQUeCVG6onLG8nFhPhyU5CLiZQ7auIE7V4vR6ideq6M3cbMUxwyZ0+WRB7cKOWE1gP2QctRbOCC4x
	4QMpn1Lk94Tu0//VpeBE/UT9KeuemLbJm+jjGVfl8HgnyqhX4mQKa1PsesGePc6yPOjCXTNAPA+PX
	+hb4K/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TAJ-000000011nJ-1eXC;
	Fri, 03 Apr 2026 01:17:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TAG-000000011l9-27ks
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 01:17:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 376A340B83;
	Fri,  3 Apr 2026 01:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC915C116C6;
	Fri,  3 Apr 2026 01:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775179056;
	bh=Cge0Op8XIjIL/FzyaMsXywj9bmxHOydn7s7dSUzb2ks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d5kzfYmJPKBNdvO3nSJvsyoJ+PIyPCXGESJxAhYTppge05ohd0x0Wt2nOzWHT8HpD
	 G/sNU1YrW1igNY4qpp3/oDubDsCWQ5VlEJNCuQ6EDkf7VCDmVu/HWtLZuf+RZ8DqMz
	 pG3xZBdt9MPpY6CLzz/SXzaiiBW+u8IRILNPbOS54Zsc4DbVFfCW+MXe7T6oX1EoDl
	 4cMjrv26Aj4zKWKrj6rLudiYP+3gDzLA4GmnKMNL4Fi2V4EYRDpM2shV3fyvtaR/yX
	 VS1PRrC+gvrDGDFpS2SzA+EGwM1HEgW0Q5vA/St5Hxd4xKwe7jNAbklo1alVpWM6wC
	 SfLNbxj5oarTw==
From: Jakub Kicinski <kuba@kernel.org>
To: wei.fang@nxp.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	f.fainelli@gmail.com,
	frank.li@nxp.com,
	chleroy@kernel.org,
	horms@kernel.org,
	linux@armlinux.org.uk,
	andrew@lunn.ch,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 net-next 07/14] net: enetc: add support for "Add" and "Delete" operations to IPFT
Date: Thu,  2 Apr 2026 18:17:34 -0700
Message-ID: <20260403011734.1795551-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331113025.1566878-8-wei.fang@nxp.com>
References: <20260331113025.1566878-8-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_181736_600899_35F584E8 
X-CRM114-Status: GOOD (  23.81  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: enetc: add support for "Add" and "Delete" operations to IPFT

This commit adds support for the "Add" and "Delete" operations to the
ingress port filter table (IPFT). These interfaces will be used by both
the ENETC driver and the NETC switch driver.

> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/ethernet/freescale/enetc/ntmp.c
> index 3c59b355c142..960d5be8ec42 100644
> --- a/drivers/net/ethernet/freescale/enetc/ntmp.c
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp.c

[ ... ]

> @@ -468,6 +471,79 @@ int ntmp_rsst_query_entry(struct ntmp_user *user, u32 *table, int count)
>  }
>  EXPORT_SYMBOL_GPL(ntmp_rsst_query_entry);
>  
> +/**
> + * ntmp_ipft_add_entry - add an entry into the ingress port filter table
> + * @user: target ntmp_user struct
> + * @entry: the entry data, entry->cfge (configuration element data) and
> + * entry->keye (key element data) are used as input. Since the entry ID
> + * is assigned by the hardware, so entry->entry_id is a returned value
> + * for the driver to use, the driver can update/delete/query the entry
> + * based on the entry_id.
> + *
> + * Return: 0 on success, otherwise a negative error code
> + */
> +int ntmp_ipft_add_entry(struct ntmp_user *user,
> +			struct ipft_entry_data *entry)
> +{
[ ... ]
> +	err = ntmp_alloc_data_mem(&data, (void **)&req);
> +	if (err)
> +		return err;
> +
> +	ntmp_fill_crd(&req->crd, user->tbl.ipft_ver, NTMP_QA_ENTRY_ID,
> +		      NTMP_GEN_UA_CFGEU | NTMP_GEN_UA_STSEU);
> +	req->ak.keye = entry->keye;
> +	req->cfge = entry->cfge;

The request sets NTMP_GEN_UA_STSEU to indicate statistics data is present,
but struct ipft_req_ua does not appear to contain a match_count or STSE data
field before cfge.

Since the hardware expects STSE data before CFGE data (as seen in
struct ipft_resp_query), will this cause the hardware to misinterpret the
first 8 bytes of cfge as the match_count, and then read the actual filter
configuration from out-of-bounds or uninitialized memory?

> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp_private.h b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> index 7d50af7745c7..6d519d59a433 100644
> --- a/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp_private.h

[ ... ]

> +/* Ingress Port Filter Table Request Data Buffer Format of Update and
> + * Add actions
> + */
> +struct ipft_req_ua {
> +	struct ntmp_cmn_req_data crd;
> +	union ipft_access_key ak;
> +	struct ipft_cfge_data cfge;
> +};

Does this struct need an STSE data field before cfge to match the request
header flags?

> diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
> index a54945dcdc61..efda35e5e22c 100644
> --- a/include/linux/fsl/ntmp.h
> +++ b/include/linux/fsl/ntmp.h

[ ... ]

> @@ -66,6 +68,94 @@ struct maft_entry_data {
>  	struct maft_cfge_data cfge;
>  };
>  
> +struct ipft_pld_byte {
> +	u8 data;
> +	u8 mask;
> +};
> +
> +struct ipft_keye_data {
> +	__le16 precedence;
> +	__le16 resv0[3];
> +	__le16 frm_attr_flags;
> +#define IPFT_FAF_OVLAN		BIT(2)
> +#define IPFT_FAF_IVLAN		BIT(3)
> +#define IPFT_FAF_IP_HDR		BIT(7)
> +#define IPFT_FAF_IP_VER6	BIT(8)
> +#define IPFT_FAF_L4_CODE	GENMASK(11, 10)
> +#define  IPFT_FAF_TCP_HDR	1
> +#define  IPFT_FAF_UDP_HDR	2
> +#define  IPFT_FAF_SCTP_HDR	3
> +#define IPFT_FAF_WOL_MAGIC	BIT(12)
> +	__le16 frm_attr_flags_mask;
> +	__le16 dscp;
> +#define IPFT_DSCP		GENMASK(5, 0)
> +#define IPFT_DSCP_MASK		GENMASK(11, 0)

Does IPFT_DSCP_MASK completely overlap with IPFT_DSCP?

If it is defined as GENMASK(11, 0) instead of GENMASK(11, 6), using
FIELD_PREP with this mask will not shift the value into the upper bits,
which might overwrite the actual DSCP value in bits 0-5.

