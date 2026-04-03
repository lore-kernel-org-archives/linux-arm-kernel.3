Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C30D6AAFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 01:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6YaZNE7pOlYEWI69TmOBoEfHRzSwR+IqGqAPhEKmmQ=; b=zDy27cmEx+jDl5pXOrU9d3SbDa
	PH02hDbSVPli7g3CKQ8HGSZq89txoht9H6hF1w4w/4V+kzqlKxcV0SJzSz/1rFKsd6Z3xZ4z6Ze3m
	6lcg6mVyfnZdTNF4n4AlbU3zJcTrMtwEFUh+bUPnPePH7wsI6HwmJmj4ydw+9J1NT7k+t2GRxVHFo
	hFOFa/1Eks4k0GhEcDAN0NDG/SVMHkra6zYBYttr+uZRqe/S09I4s0yfJXDmEpjXUl7EHTayNp4D0
	CfPTL0fu0+jmsV8+sC3eN49uA9X2q/MTAuCsKUHPZPxVBgcwkc9DpPH1tyX+3EpZQYeF5SBNLYAqd
	HIjfTUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TAF-000000011kz-30v7;
	Fri, 03 Apr 2026 01:17:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TAE-000000011kR-414t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 01:17:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 31FBC60127;
	Fri,  3 Apr 2026 01:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBD8C2BCB0;
	Fri,  3 Apr 2026 01:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775179053;
	bh=IjIkp8FIjKATBd7jIiPxzeFBb13nS3nzbxHI2WLxLcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bhn8oIIZoi0uI1nny0o2U/uU6bOCJ18EbsQFHJ0o0GygSh3+ENa6fhY3GkI0iCyrk
	 hvVgRxi2ktGgQpzlhRDKy98XX4MVSOAfFRM+p4jch8H2GsIVb9dzK1cGJCOUi5ygf2
	 /zOVHYommileHwaqOG+qtdlo3PjQgRKaJZmBdONj2ZpJKjMzVjNCNRSSYy7nlRanPt
	 ephSAaiMHZ5HoXUqb6WA18U3xq4DgD7nCALIJx9ExdA/06yMAS/aIwjVovYbnsafvJ
	 3F3sK3c3VM8Lr6N0yIRau3XhtEvyeowJ7vTYz5vsTyZehYj057yx8SK4Z0NoGIaukV
	 n1lmuT0ONOs7A==
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
Subject: Re: [PATCH v4 net-next 06/14] net: enetc: add support for the "Update" operation to buffer pool table
Date: Thu,  2 Apr 2026 18:17:31 -0700
Message-ID: <20260403011731.1795517-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331113025.1566878-7-wei.fang@nxp.com>
References: <20260331113025.1566878-7-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Subject: net: enetc: add support for the "Update" operation to buffer pool table

This patch adds the ntmp_bpt_update_entry() helper function to support
updating a specified entry in the buffer pool table. It provides the
ability to update buffer pool configuration data.

> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp_private.h b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> --- a/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp_private.h

[ ... ]

> +/* Buffer Pool Table Request Data Buffer Format of Update action */
> +struct bpt_req_update {
> +	struct ntmp_req_by_eid rbe;
> +	struct bpt_cfge_data cfge;
> +};
> +

[ ... ]

> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/ethernet/freescale/enetc/ntmp.c
> --- a/drivers/net/ethernet/freescale/enetc/ntmp.c
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp.c

[ ... ]

> @@ -702,5 +708,38 @@ int ntmp_vft_add_entry(struct ntmp_user *user, u16 vid,
>  }
>  EXPORT_SYMBOL_GPL(ntmp_vft_add_entry);
>  
> +int ntmp_bpt_update_entry(struct ntmp_user *user, u32 entry_id,
> +			  const struct bpt_cfge_data *cfge)
> +{
> +	struct ntmp_dma_buf data = {
> +		.dev = user->dev,
> +		.size = sizeof(struct bpt_req_update),
> +	};
> +	struct bpt_req_update *req;
> +	union netc_cbd cbd;
> +	int err;
> +
> +	err = ntmp_alloc_data_mem(&data, (void **)&req);
> +	if (err)
> +		return err;
> +
> +	ntmp_fill_crd_eid(&req->rbe, user->tbl.bpt_ver, 0,
> +			  NTMP_GEN_UA_CFGEU | BPT_UA_BPSEU, entry_id);

Does this update action mask match the size of the request buffer?

The mask includes both NTMP_GEN_UA_CFGEU and BPT_UA_BPSEU, which instructs
the hardware to update both the configuration entry and the status entry.
However, struct bpt_req_update only contains the configuration data,
omitting the status data.

If the hardware attempts to read the missing BPSE data, could it reject
the command due to an undersized request length, or read beyond the
intended payload into zero-initialized DMA padding? This might overwrite
critical buffer pool tracking variables like amount_used_hwm.

If only the configuration is being updated, should the BPT_UA_BPSEU flag
be removed?

> +	req->cfge = *cfge;
> +	ntmp_fill_request_hdr(&cbd, data.dma, NTMP_LEN(data.size, 0),
> +			      NTMP_BPT_ID, NTMP_CMD_UPDATE, NTMP_AM_ENTRY_ID);
> +
> +	err = netc_xmit_ntmp_cmd(user, &cbd);
> +	if (err)
> +		dev_err(user->dev,
> +			"Failed to update %s entry 0x%x, err: %pe\n",
> +			ntmp_table_name(NTMP_BPT_ID), entry_id, ERR_PTR(err));
> +
> +	ntmp_free_data_mem(&data);

Can this result in a DMA use-after-free if the hardware command times out?

If netc_xmit_ntmp_cmd() times out waiting for the hardware to process the
command, it returns -ETIMEDOUT without resetting the hardware ring or
explicitly cancelling the command.

The descriptor remains active in the ring, and ntmp_free_data_mem()
unconditionally frees the DMA-mapped buffer. If the hardware eventually
processes the descriptor, it will read from the now-freed DMA memory.

Could this lead to an IOMMU fault or cause the hardware to read garbage
data if the page has been reallocated?

> +
> +	return err;
> +}

