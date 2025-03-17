Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96F8C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 14:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cxa0F0xN4ZRdIBH8WPHg9yoO97a+pHmZwYuPPKE8ufU=; b=4ZOy5Qa6ylg0NT89DMY2o8KmQj
	J2m5RT7B091yytLvCDf1eA8cBnLnRAjlK+5FeVcT4cWg/IaXMqFs9GQS6M6VOXEXa8MJdQ319AGR2
	QMj6CKTCPLCAmAPOlLhE29CF30G8TuTIfkijSrT5khdm72emvNFGviG7nrFGRNb4JWU7sfvKtNsk3
	A+CUancnDZNqhQzIc92i/C4hZzFwFknNOwtCwdS6wN4Di8ZA8uEvTID2eD113k2lrcD8/cw8Z2RNp
	Zbh54DrLdAW2VEvHiZGWnlsPAa51hQhqXxHY5FWwD45rUIxm2V4VMiQ3mdjzDOOH/eNLg91rZIUGF
	RSsyIjoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBAw-00000002sND-19zO;
	Mon, 17 Mar 2025 14:10:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuB8l-00000002r33-0Deh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 14:08:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0B7FAA4027F;
	Mon, 17 Mar 2025 14:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CEBFC4CEE3;
	Mon, 17 Mar 2025 14:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742220505;
	bh=FEPHIwDyK7Tr4mXhiKsjBTrxFWaEJhWGW9kE0joAnEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IHDA0cUyq4XAc4DX4FKFkAV+J5U7Vgze+OeF+RN+Rt9t8HKtTLr0usCZiG7B9lUX2
	 78RL7UkwQ6Ov8pRrumSCoWar33zkK0eKVIfpnJ/4M++v9DTmAF1beUrmZr4Y9hnmIj
	 j2Fo9wQGCb78kV7p4a+OOqe2+ZIoEj2A/B2+8zsoMReBtSGZBGTuB8WxOPz9wJ8T+n
	 eIvkXDMfzs613KUYOSzoh7/89JTYJIpZCcOZXtXcdeLfDZ/ggfSCiH2j+Il1Ly62of
	 ewmP9do4wnTyN2jHObK3NFFuhC1bYIpfo7uZhnHmNTgMZhXCwQfxB46a/k91jsq+IU
	 VunRAG9oVd/AQ==
Date: Mon, 17 Mar 2025 15:08:16 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, geert+renesas@glider.be, lumag@kernel.org, heiko@sntech.de, 
	biju.das.jz@bp.renesas.com, quic_tdas@quicinc.com, nfraprado@collabora.com, 
	elinor.montmasson@savoirfairelinux.com, ross.burton@arm.com, javier.carrasco@wolfvision.net, 
	ebiggers@google.com, quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, quic_varada@quicinc.com, 
	quic_srichara@quicinc.com
Subject: Re: [PATCH v12 4/6] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
Message-ID: <65gl7d6qd55xrdm3as3pnqevpmakin3k4jzyocehq7wq7565jj@x35t2inlykop>
References: <20250313110359.242491-1-quic_mmanikan@quicinc.com>
 <20250313110359.242491-5-quic_mmanikan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313110359.242491-5-quic_mmanikan@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_070827_174697_70A13D27 
X-CRM114-Status: UNSURE (   9.08  )
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

On Thu, Mar 13, 2025 at 04:33:57PM +0530, Manikanta Mylavarapu wrote:

> +static struct clk_rcg2 nss_cc_clc_clk_src = {
> +	.cmd_rcgr = 0x28604,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = nss_cc_parent_map_6,
> +	.freq_tbl = ftbl_nss_cc_clc_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "nss_cc_clc_clk_src",
> +		.parent_data = nss_cc_parent_data_6,
> +		.num_parents = ARRAY_SIZE(nss_cc_parent_data_6),
> +		.ops = &clk_rcg2_ops,
> +	},
> +};

This structure definition gets repeated many times in this driver,
with only slight changes. (This also happens in other qualcomm clock
drivers.)

Would it be possible to refactor it into a macro, to avoid the
insane code repetition?

Marek

