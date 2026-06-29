Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B93C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTAqympCuHM2c/PQmqwHbJCuVDhybEJa0vtK+R7ZX2Q=; b=HN3ZV2PxP33ObJ6lA7xplq0kQW
	JLsvt4cg0IIMYBCj4++ngDMXfgxlp/KOpIxevhtOXZhVEcNSCfQhuQisCWwlwfwm7/R/iwQXJjSp/
	cBwe4+XKX4D8Myd6FL7+L1Nup1B7u4S2th1Q4g0ovRMYBtmK0+8SLC+mxvvjfPIEKBLFiT70jeWid
	64lSNlzqXWJbu3u4q6HkQvF+TTxnhsCKB8eCfkGysSrMuMRhUiR2Brg6FKkXrlNjaTNAjTcZ0y+nT
	Se6xlyXLzwZwZFVXF1ZH+fAC3u6VI1K9uySxcMf39Y45w+36coJjteTOJ6E1b3vN04N19JCqmbEYv
	8/LKGGYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weF2C-0000000FEqC-3u1z;
	Mon, 29 Jun 2026 16:40:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weF2A-0000000FEpF-17HC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:40:35 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so27989175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 09:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751232; x=1783356032; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vTAqympCuHM2c/PQmqwHbJCuVDhybEJa0vtK+R7ZX2Q=;
        b=QnK1u5zCEm/tNF7E84vPMpkGQE2h9Zk/kaBsMquL+wk0jakxUQ6h/dppiDEbaGdwYd
         vkAS5fcA426OqLoa68Gx8L+HcxgxVO7t/YY9rXsKv2PmhJCLZMCRDsmiHiisV5T5AveU
         T3GYnc4E5YJ3ca9LvAmWreFPoqhL9kiZoz9vGaWeIH2VL2KVxevhw532DLkLBg2KMM+0
         uz3BGHpgKAh32SET5jEbYaY33lRebSF6v4vFyasghm4ED75EfYli/cfPLDcmsnQNO4u3
         95nWGTE4EgOshrtloxHbcBPEb4A7af3uP01tSd7AJKa+3TohslLz1SKj07A1FtnEIiPl
         q8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751232; x=1783356032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTAqympCuHM2c/PQmqwHbJCuVDhybEJa0vtK+R7ZX2Q=;
        b=NdinaaSeMGWtSjZfKMO1YmeLJMOjxU+k/VP6ezxyQTilIanbf8zUvHg52VIbMa79p3
         GZamkZZJ/pIpNMzf43Cszux/8F8dDDyIfi0hBRqndynyb6PFkoPSiaTwnAdQDOcVo2NT
         AfouVa+viFGNJZ3+jGvta5k6oytmUP/UOm8YWQuIItDkDyESDKH5bAZg4vWoR4KTXbiX
         iG9Ul+HlvOuoOUSLgh7FDm3MLiuTXM7lGOYzwFgddznkS6j3Unyz7pUABgV5zp0d8ta8
         E1qDRcm9OtXOQGO1+VrYlE09zlh2uESF64oIJ5ufNBme1RZgE39i4nCmN8453JoCI50Y
         A5Cw==
X-Forwarded-Encrypted: i=1; AFNElJ/m7XBZkwYA3/vWCe+YH9gwdYbIG8L+oPjE1/mFer/HICWSDPwb5eDdEVS71g3HdZCLYEfaEZpDW8zcmNwjqU+h@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhl91J4gEnKGUXezL5TakCyRnoJRhmVHf7ZnNkpssLU7mYpHWa
	yNc4qqv011qmfxeFFPqfVesFkqsLFurlXuuEoRBnSQJFr6CONtmIwnGg
X-Gm-Gg: AfdE7ckWOi3is6hcWwGCYS7jEtxYZ6OpqIv4J3Umtaluvv939sCLsIOCtnykQCqOpDO
	3HjGB3citv9bDeRxP7JRAirycxChHoc4etjgd3Tn3XLmbhieclDmYu+FRwL6jf0cCBuV2/MX8+k
	JhSCVpTHxeOkSxSKXsk4QkfUKX9UvIPiLPtSKlds35FUhdR6+wCraFaRIlLBj9DeMrVXQDQN/mC
	8S5AQSNZcZIv0pgcuJV6SrSypmOOWzGYTvSHUMZvzEbRdbqXBAAPGloCv6l78d2OU4jOUQwEGlb
	tsPr9AFTftq455hG0S5Z0dec1fnmlA/3Tt9WFBEx9GOtywAkSEC1BsWFGY5otcZRJ6/1eGKFZbk
	ILXpxDJl7I8rLk2fSy4tkxNkpaHqSg1pn/P7vNG9hbxgaQ+9omR3FSnI00+e5WUBxGC9HCpkEDg
	Lf2cvJTDbC9YGqPXGT3DkUm1BzcAE4HLmEuMv1nDWWDnK3D3FVehPIF3kxiinMFWOHUvyAVEhyo
	dOxPt7nBg554Hh8sFpeXoo4FL0ul+We
X-Received: by 2002:a05:600c:1d09:b0:493:a535:5527 with SMTP id 5b1f17b1804b1-493b82ac8d4mr6429385e9.21.1782751231985;
        Mon, 29 Jun 2026 09:40:31 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8c238fasm2254645e9.0.2026.06.29.09.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:40:31 -0700 (PDT)
Date: Mon, 29 Jun 2026 18:40:29 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v5 06/14] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Message-ID: <akKf_akO7IZ2ltHd@Lord-Beerus.station>
References: <cover.1780929317.git.stefano.r@variscite.com>
 <26b5b602c3995a5a74f64b84576ab4d54ace23ee.1780929317.git.stefano.r@variscite.com>
 <akKdkWos2E25M_q8@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akKdkWos2E25M_q8@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_094034_324814_9F7279A3 
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

Hi Frank,

On Mon, Jun 29, 2026 at 12:30:09PM -0400, Frank Li wrote:
> 
> You have to provide all clocks, otherwise, whole clocks and clock-names will
> by overwrite with one clock "ref".
> 
> suppose CHECK_DTBS should report warning about clocks items.
> 
> Frank
> 

thanks for checking.

In this case the SoC dtsi does not provide any clocks or clock-names for
the PCIe PHY node, so this is not overriding an existing clock list. It
only adds the external reference clock used by the board.

This follows the same pattern used by the i.MX8MP EVK, where the PCIe
PHY node only provides the external "ref" clock together with
fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>.

This is also why CHECK_DTBS does not report any warnings for this node.

$: sed -n '/^&pcie_phy {/,/^};/p' arch/arm64/boot/dts/freescale/imx8mp-evk.dts
&pcie_phy {
        fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
        clocks = <&pcie0_refclk>;
        clock-names = "ref";
        status = "okay";
};

Thanks,
Stefano

