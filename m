Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD62C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 15:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrV8UKRaBkJx7qrzrFbhIoiWd+Bi6KkFjUTHdRByj7A=; b=bpLAReqCvkMaKv6DyXXzNti/wL
	Z9XXM6sSfqlFzc99lxCt7p7SUBpJeooqDwG4tCG8exbhrVxoSydCv5VmWIP1B88pcyvz5ODVsh7eS
	er5dyWw9mkQND2U1tGNA1c9JsZSNiXChyKrbWMK4ShpBS+0meF3pRTJvUAiCVbdQfKDIO6CCItaZa
	gaBnX8vDDeksgnBAojpx45KtQM91q+IGlin2LZIrfRqzEiIyVF0quhiElRvmv325j1iDy4YwIxZTb
	vDRMErpgAE/NIG/Lw5H+wwu7kBqZskFhgZTagB2txvJKilShQrmiFJPBbxy7MHonKCmzFYvuA8TVX
	GlR7SLDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpn9-0000000DfJV-1IY8;
	Wed, 04 Jun 2025 15:12:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpl1-0000000Df1h-1CCJ;
	Wed, 04 Jun 2025 15:10:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5398BA50422;
	Wed,  4 Jun 2025 15:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDD2C4CEE4;
	Wed,  4 Jun 2025 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749049822;
	bh=79Ct6+QrZ9TbmPLlyPDYC3WA1Nr8Z20nWCGL8X8r8l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgtefAdaS0h1SgoV/xMChN6Cv2eI2z94uV7biOA8pJWGRN+9BfeYWWAkvZ8fYRPa8
	 t1ZwxRubQUaRrbTOGL0cGe9CdB8VDkkXC8URwevp8wADnWBbzD6MXmXcDlXHp9YaDT
	 aTUBsR48g3DkU6+qDXRVGEyRsHBvHOcdopaewZr3NjAlfh968fAxmtmfrzKNaH3u3G
	 oI4wKqSobA0teOoRuzeNz+RD+2YzpsRZd1h9LeQwJ1VMf+RgKr05prJduO+1QkCgl7
	 KDDCrs0uXS2DuMhZ5N5Yx2pwbplUeN9+z6sUxahrxzkc1b2NhObTijya/AAC1dlfi7
	 JkZGpzhVRqe8A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uMpkx-000000007qM-2gvq;
	Wed, 04 Jun 2025 17:10:19 +0200
Date: Wed, 4 Jun 2025 17:10:19 +0200
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
	quic_cang@quicinc.com, qiang.yu@oss.qualcomm.com,
	Johan Hovold <johan+linaro@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v4 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
Message-ID: <aEBh2xHu3QDtUrxe@hovoldconsulting.com>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
 <20250604080237.494014-6-quic_wenbyao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604080237.494014-6-quic_wenbyao@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_081023_471189_2547ADB6 
X-CRM114-Status: GOOD (  14.12  )
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

On Wed, Jun 04, 2025 at 04:02:37PM +0800, Wenbin Yao wrote:
> From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
> clocks provided by the TCSR device.

As I just mentioned in the thread where this is still being discussed:

	https://lore.kernel.org/all/aEBfV2M-ZqDF7aRz@hovoldconsulting.com

you need to provide a lot more detail on why you think modelling these
supplies as PHY supplies (which they are not) is the right thing to do.

Also please answer the question I've asked three times now on how the
QREF supplies map to PHY supplies on X1E as no one will be able to use
this binding unless this is documented somewhere (and similar for other
SoCs).

The fact that you so far have not been able to provide an answer
seems to suggest that these supplies need to be managed by the TCSR
clock driver which can handle the mapping.

> Hence, restore the vdda-qref request for the 6th and the 3th PCIe instance
> by reverting commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
> qref supplies") and commit eb7a22f830f6("phy: qcom: qmp-pcie: drop bogus
> x1e80100 qref supply"). For the 4th PCIe instance (Gen3 x2), add a new
> driver data entry, namely x1e80100_qmp_gen3x2_pciephy_cfg, which is a copy
> of sm8550_qmp_gen3x2_pciephy_cfg but uses sm8550_qmp_phy_vreg_l instead.
> 
> Fixes: eb7a22f830f6 ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref supplies")
> Fixes: 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref supplies")
> Fixes: 606060ce8fd0 ("phy: qcom-qmp-pcie: Add support for X1E80100 g3x2 and g4x2 PCIE")
> Cc: Johan Hovold <johan+linaro@kernel.org>
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>

NAK, for now, and please don't post any new revisions of this patch
until this has been resolved.

Johan

