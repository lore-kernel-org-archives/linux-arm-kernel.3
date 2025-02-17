Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB41C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 11:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXZoNdUIJJnZShIOY1SKEQ9C5imd0JT3HSgWwpXyows=; b=OGAJbMflkNU4YFpPfGZ+uvzI8g
	d2PdK/GvGNHrxcwxHsglukOlEPOT1i8br/h9S1sHzdLOYSJdrk6iO9aP6tIYNbcZPDB4exN1C8+wa
	i2zCt3deDSGZs1dBOtxEZ+yJmlwLJ+VhW3jKKx+YpBXDDdn/Xmhy48oEJd7Y4RL5fnbAH0jYeLC78
	+Z9o7uyBbZtzdEQ0AEvaOaGU5jnOhu2U2LQhQJaP0Bn4OI3c7aclF6kL3sTZhJxbfM4QpNcshg7fQ
	lVhCbKDYSWDElIeUY40/7fwZSnNWwOMuriMx7C89jfr72Rw6R0oKLYgUXR/t47hkFmFgsz0WdyzWg
	YmgWExAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzMt-00000004Jg5-2KAi;
	Mon, 17 Feb 2025 11:32:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzLP-00000004JNi-1Vx7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:31:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3043A5C51A7;
	Mon, 17 Feb 2025 11:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322ECC4CED1;
	Mon, 17 Feb 2025 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739791882;
	bh=x59L7IqL94IFM2zao/QYrrn1Ck873l+zRRObe6nR3ZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FntKGJ2gEe8KQtXAM1A7/RQn+PfYq8H5dWKYZn5oss5qZBf9JJncJE+R18hFL8Lm9
	 PFPpYqcpS5EoPKMf2J66Tc0mJGlB837NAOJlOR8NTAl4z0mfHEvAkYdhwMS9wYhdKJ
	 HEiZuuptHx2U2UuENVvlZPPOD8mlcYbVLdg9xYKBvzRLVk1cxv7vKgZUb9VcRqL5Lp
	 nZcpJgysIZTcUAwuJCuFc5CgPBBFycmNx72h4mVdtw8TrXX0x7EKS9IV1CpLtU44w5
	 2lFAIvwLk9KmxV7+5Q6jltQEsCH16ycLhTcgGiskBxqc2hX/gfn1u19wzSWtFwHK40
	 qURVopF4ZbD4g==
Date: Mon, 17 Feb 2025 11:31:13 +0000
From: Simon Horman <horms@kernel.org>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Suraj Jaiswal <quic_jsuraj@quicinc.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Gal Pressman <gal@nvidia.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH iwl-next v4 5/9] igc: Add support for frame preemption
 verification
Message-ID: <20250217113113.GK1615191@kernel.org>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-6-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210070207.2615418-6-faizal.abdul.rahim@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_033123_513487_DA121C50 
X-CRM114-Status: GOOD (  13.28  )
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

On Mon, Feb 10, 2025 at 02:02:03AM -0500, Faizal Rahim wrote:

...

> diff --git a/drivers/net/ethernet/intel/igc/igc_tsn.c b/drivers/net/ethernet/intel/igc/igc_tsn.c

...

> +bool igc_fpe_transmitted_smd_v(union igc_adv_tx_desc *tx_desc)
> +{
> +	u8 smd = FIELD_GET(IGC_TXD_POPTS_SMD_MASK, tx_desc->read.olinfo_status);

olininfo_status is little-endian, so I think it needs
to be converted to host byte order when used as an
argument to FIELD_GET().

Flagged by Sparse.

> +
> +	return smd == SMD_V;
> +}

...

> diff --git a/drivers/net/ethernet/intel/igc/igc_tsn.h b/drivers/net/ethernet/intel/igc/igc_tsn.h

...

> +static inline void igc_fpe_lp_event_status(union igc_adv_rx_desc *rx_desc,
> +					   struct ethtool_mmsv *mmsv)
> +{
> +	__le32 status_error = le32_to_cpu(rx_desc->wb.upper.status_error);

It looks like the type of status_error should be a host byte order integer,
such as u32.

Also flagged by Sparse.

> +	int smd;
> +
> +	smd = FIELD_GET(IGC_RXDADV_STAT_SMD_TYPE_MASK, status_error);
> +
> +	if (smd == IGC_RXD_STAT_SMD_TYPE_V)
> +		ethtool_mmsv_event_handle(mmsv, ETHTOOL_MMSV_LP_SENT_VERIFY_MPACKET);
> +	else if (smd == IGC_RXD_STAT_SMD_TYPE_R)
> +		ethtool_mmsv_event_handle(mmsv, ETHTOOL_MMSV_LP_SENT_RESPONSE_MPACKET);
> +}
> +
> +static inline bool igc_fpe_is_verify_or_response(union igc_adv_rx_desc *rx_desc,
> +						 unsigned int size)
> +{
> +	__le32 status_error = le32_to_cpu(rx_desc->wb.upper.status_error);

Ditto.

> +	int smd;
> +
> +	smd = FIELD_GET(IGC_RXDADV_STAT_SMD_TYPE_MASK, status_error);
> +
> +	return ((smd == IGC_RXD_STAT_SMD_TYPE_V || smd == IGC_RXD_STAT_SMD_TYPE_R) &&
> +		size == SMD_FRAME_SIZE);
> +}
> +
>  #endif /* _IGC_BASE_H */
> -- 
> 2.34.1
> 

