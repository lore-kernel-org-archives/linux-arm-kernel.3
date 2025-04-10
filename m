Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B550BC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 12:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHLdKFMyuUGhsE0Tr4FhflZ/Iyl5Dj3Ex9B6HMuR9XY=; b=sANne0WYZwREs5HMxzsFYlFONt
	KiFw2KrLitzfMWjuX38DCqq5Q7NsjfsdxVxD1S+i1EATyi5ZZxWIiwX/S4Aeh4rWUnSaiEeyAd1lR
	sBPfDHiCS7tzVVMFDCLb6OeDSVL/iMOHXsgrzWyyyoChpaxM1wX2BwLAAvQJFnDWW+a0/UVZ+P/GG
	0zB+6RBmud/Tbfy0+iPxzEZ2x1i0E2BGAYESDLs/VN3SnhqeRggOx3ijC894hN1T7I1/LxKomaKP7
	5cdT7ngGtXDW/jEpMOUKucBs2X7MsbnsauViMvwAj3dOS6wdHbBSoOWYhyv4DdZsqFgyYB1Bfa7KO
	pUtkYBJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rTp-0000000AaYB-49TR;
	Thu, 10 Apr 2025 12:58:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qTN-0000000AO5q-0EbG;
	Thu, 10 Apr 2025 11:53:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 987764A400;
	Thu, 10 Apr 2025 11:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5BDC4CEEB;
	Thu, 10 Apr 2025 11:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744286012;
	bh=PhiOxgPV+UJGeNCtj3MezYeVIX8cgjdJLX0OoBVn8PU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7MQhzqY2PpJ0Jem5Fw2rsXzKuA1s69TONRI1iVqGtOLjORR228OnpOyzwHw3s5h+
	 vwgY95cSE+Co0rFRlFI7+tP0C7dYB7y+tggmxpExoPNjTzc6sBj5Mf3MOxmPpZaUcn
	 SIuYoYcUpI/po+HeJlmC2P/8Xa8Xre7fZwuwLqXk5pEZ4rxli+GaFoVRD/YBNFnklt
	 sAiUVSzji0bfDgBH+w5NVXBxW/nF7WyQ92wClMsAoAlOgOBUzD4V1KqEUQzsphw0sL
	 6I1CQS8eH1/DmU29GNOdnFxPzaz3HdRAa7mfik1bOmdRlenPIZ2BJSL2ZGDK92BGSc
	 YHOzgOQT0pSHQ==
Date: Thu, 10 Apr 2025 17:23:28 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <Z/exOF4T+0vNLQwg@vaman>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
 <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_045333_115165_4427F339 
X-CRM114-Status: UNSURE (   9.26  )
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

On 09-04-25, 10:48, Melody Olvera wrote:

> +static int m31eusb2_phy_write_readback(void __iomem *base, u32 offset,
> +					const u32 mask, u32 val)
> +{
> +	u32 write_val;
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(base + offset);
> +	tmp &= ~mask;
> +	write_val = tmp | val;
> +
> +	writel_relaxed(write_val, base + offset);
> +
> +	tmp = readl_relaxed(base + offset);

Why are you using _relaxed version here?

> +	tmp &= mask;
> +
> +	if (tmp != val) {
> +		pr_err("write: %x to offset: %x FAILED\n", val, offset);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

-- 
~Vinod

