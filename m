Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A39C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 08:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pzd+NtYsMpRr5R87oiCp497xgpUmZFgPE0u6QRoXJBw=; b=1d/cbMs4zVHd63pbIYrrFGHWmV
	2XeC5AYN5gxgkRBIv1pMQmKi2Qoy0gjNygaZGRrjh84X85RuFH/+zp2lkvcY6zFXMSbadc298mrT3
	lr0ZnNDfpg+rN39kSEW65y/K/P0UNVUeDQ5IMW3D5lJcgTCHcvzZPgT9dPzYGN6FcqkxL6PSodVWE
	t0etpY+H35q/4CcxXcTziSFNddxGNNA5OGme6OJIgTIP/sVlgJJGMb9e+Sm5/38xuTgLWg060dseD
	OBpAOjM7sJTsa9krbZZ9sWx4Afb4/6u6yHp4//xgIp0xTGyZ3QCXV5+R9u5oZf7eHrh+3MRACkL2T
	WO1imlYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwlK-000000008XD-1xrd;
	Thu, 08 May 2025 08:37:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwUB-000000005cY-2K1b;
	Thu, 08 May 2025 08:20:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7CA37A4DA68;
	Thu,  8 May 2025 08:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBD6C4AF0C;
	Thu,  8 May 2025 08:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746692406;
	bh=CYQ/e7inFWvv5fdVT73hsrbTbLuCIkw9CeE/xLnCgH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b9W/iAf0YxhXtRJba0lkljhjgfCn3uxiLoEsUg7+SpTathmVLV7JOwQ1FBrYmIQAa
	 +0yJ/9CtgY18d6beHZRRPPy5dHxjezAijm+E4KmC2l6ciqGD4F5FJ3TInZc0j9xNdR
	 qi/bSRB7jstbUVGBe1wa0uLQLMEASPZzWNqVjbeddtq1Iid3j1GTYNgQ3uBYNXbMXK
	 lM1e1/PrT/7q2gTbDsgAyz+d6HOD3nlHCHjkkdEL8gKyeBoSiIWKxF45eWolSj8EFY
	 bIxfqrGZz1xfhyarrp7ViFrnS3e9+/AILpMhkrg1MhiiYAUrIULoBUrUEPJ5DsFn8p
	 y2YWWvDz4Z9iA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uCwU6-000000007T8-248Z;
	Thu, 08 May 2025 10:20:03 +0200
Date: Thu, 8 May 2025 10:20:02 +0200
From: Johan Hovold <johan@kernel.org>
To: Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
	linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com,
	quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
	quic_cang@quicinc.com, quic_qianyu@quicinc.com,
	Johan Hovold <johan+linaro@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v3 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
Message-ID: <aBxpMuFGKgWrw1TV@hovoldconsulting.com>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
 <20250508081514.3227956-6-quic_wenbyao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508081514.3227956-6-quic_wenbyao@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_012007_664464_782F9809 
X-CRM114-Status: UNSURE (   9.91  )
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

On Thu, May 08, 2025 at 04:15:14PM +0800, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
> clocks provided by the TCSR device.

This still looks wrong and you never replied to why these supplies
shouldn't be handled by the tcsr clock driver that supplies these
clocks:

	https://lore.kernel.org/lkml/aBHUmXx6N72_sCH9@hovoldconsulting.com/

> Hence, restore the vdda-qref request for the 6th PCIe instance by reverting
> commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref
> supplies"). For the 4th PCIe instance (Gen3 x2), add a new driver data
> entry, namely x1e80100_qmp_gen3x2_pciephy_cfg, which is a copy of
> sm8550_qmp_gen3x2_pciephy_cfg but uses sm8550_qmp_phy_vreg_l instead.
> 
> Fixes: 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref supplies")
> Fixes: 606060ce8fd0 ("phy: qcom-qmp-pcie: Add support for X1E80100 g3x2 and g4x2 PCIE")
> Cc: Johan Hovold <johan+linaro@kernel.org>
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>

Johan

