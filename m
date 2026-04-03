Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AE0D6AB1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 01:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxQv7s5Odq+vZQmZIotCiow9lCNZu5hiBKdpZB9SFQs=; b=v3M24nLqOd6prFLGsDt5gd5VJm
	TETE472DZlo/+n1QzKgJvAPsrrG/A1s7aRgD84yUepgBV/umlEYIWmwk14Vm87Vm0zl+ypM0pOrVB
	uyiL/NmUjUJuNvdogQ96NYvCn4YwQNb4qqT1ffs1UEqc+2lhDb5QwewqfN/fksEHyp2PbIa8aEp1o
	fw92l2rBNP02YWvle5Ue2kAdL1tw7qS2xr3t7mT+RUWE50c58SKIfHB4MUdoPnAwJxcc4hMXgr6oG
	4hVZ7vwyFGoBxVWhyGcPsqX1bfYUiCe4tmo347JrIUGTGjfXW+M15nFGgcqzXD3gs6aBkwGn/+zXY
	gRr+mmSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TAF-000000011kd-1dn0;
	Fri, 03 Apr 2026 01:17:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8TAC-000000011jO-0ehw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 01:17:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 933D743488;
	Fri,  3 Apr 2026 01:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F30C19423;
	Fri,  3 Apr 2026 01:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775179051;
	bh=z2oeBslkWxXFxUEpEWFwllAfQCf4n0yeC2tozbEVTlM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MdV9augW1jHZqVwnMVXugkgpU/OawSUTlXxgNHgItjcvmIUEWW2w4w5xit2HBBHif
	 0fr72BN15tfROcp/toAKBSg3iE65TFpJFCcgkJUUaNiLqsV4WKBJDI9DCEXedvzy49
	 FTgxWeo/a4aqiTElWJ/eegm2i4dVWVTQE1H1yvhkR3wBVxXxKBkQOuNPC/XC/yU+vv
	 LbxdimGIxIU1xU63GXKAh67M9AkUVRJmZa5OIJiisn/mSYglYqNtSwW0QWjlM82RXp
	 xYJe9TtgRr/AmJ3hxt7+XnkZQzPJqiUi6t+IFzrNdoJAoCmx2OSwm3w5oqP4a+TuDy
	 UcQy18A1RR15A==
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
Subject: Re: [PATCH v4 net-next 05/14] net: enetc: add support for the "Add" operation to VLAN filter table
Date: Thu,  2 Apr 2026 18:17:29 -0700
Message-ID: <20260403011729.1795413-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331113025.1566878-6-wei.fang@nxp.com>
References: <20260331113025.1566878-6-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_181732_239940_D3868966 
X-CRM114-Status: GOOD (  16.32  )
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
net: enetc: add support for the "Add" operation to VLAN filter table

This patch adds the ntmp_vft_add_entry() helper function to support adding
entries to the VLAN filter table. It allocates a DMA buffer, formats the
request, and transmits it via the command BD ring using netc_xmit_ntmp_cmd().

> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/ethernet/freescale/enetc/ntmp.c
> --- a/drivers/net/ethernet/freescale/enetc/ntmp.c
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp.c

[ ... ]

> @@ -652,5 +655,52 @@ int ntmp_fdbt_search_port_entry(struct ntmp_user *user, int port,
> +int ntmp_vft_add_entry(struct ntmp_user *user, u16 vid,
> +		       const struct vft_cfge_data *cfge)
> +{
> +	struct ntmp_dma_buf data = {
> +		.dev = user->dev,
> +		.size = sizeof(struct vft_req_ua),
> +	};
> +	struct vft_req_ua *req;
> +	union netc_cbd cbd;
> +	u32 len;
> +	int err;
> +
> +	err = ntmp_alloc_data_mem(&data, (void **)&req);
> +	if (err)
> +		return err;
> +
> +	/* Request data */
> +	ntmp_fill_crd(&req->crd, user->tbl.vft_ver, 0,
> +		      NTMP_GEN_UA_CFGEU);
> +	req->ak.exact.vid = cpu_to_le16(vid);
> +	req->cfge = *cfge;
> +
> +	/* Request header */
> +	len = NTMP_LEN(data.size, NTMP_STATUS_RESP_LEN);
> +	ntmp_fill_request_hdr(&cbd, data.dma, len, NTMP_VFT_ID,
> +			      NTMP_CMD_ADD, NTMP_AM_EXACT_KEY);
> +
> +	err = netc_xmit_ntmp_cmd(user, &cbd);
> +	if (err)
> +		dev_err(user->dev,
> +			"Failed to add %s entry, vid: %u, err: %pe\n",
> +			ntmp_table_name(NTMP_VFT_ID), vid, ERR_PTR(err));
> +
> +	ntmp_free_data_mem(&data);

Does this code safely handle hardware timeouts?

If netc_xmit_ntmp_cmd() times out and returns an error, the pending
transaction is not explicitly aborted before ntmp_free_data_mem()
unconditionally frees the DMA buffer.

Could the hardware eventually process the pending command and perform a
DMA write of the response to the physical address of the freed buffer?

This might lead to silent memory corruption if that memory has already
been reallocated to another subsystem. Would it be safer to explicitly
abort the pending DMA transaction, reset the device on timeout, or
intentionally delay freeing the buffer until it is proven safe?

> +
> +	return err;
> +}

