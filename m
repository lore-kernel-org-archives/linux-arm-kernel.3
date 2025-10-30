Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12E1CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 06:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dV+CXFB1zvMHtw0SigbntgKz0kspSSblr/BJAyA8Hdw=; b=Lo8Nf5HUapDstlyX2t/mF3wDHn
	xUZGWLImWXDr6LOs9atDXycvhVPmEJH08N99+wpiRlKEVUXEmCSOICrhaJhqvB003x+IaKCtCe4Hr
	rqkn6LPh+yO0juWR0O6uWxdGiLRYbJW+HbfTWokXly0FHL6AooZzxBJUY3Q/LVhw0CtdDJqXs6vM0
	unBl4IQW5kxYu53dqBfJrFxWrXzHmkC2Z4doM1tuftSyh2Miv2DUTylO3GRemas+QgzfhNMGMwTH0
	QYuvI5eySJcuPETYvGWpf7YGyizf2l9Xtnc+X6KKsXqqqtcCRX5jPh8rExrareWqUHbY1PPCEcNUT
	8qyhtkrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEMd7-00000003bRJ-1p6p;
	Thu, 30 Oct 2025 06:59:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEMd6-00000003bR9-0TyE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 06:59:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B627D604CC;
	Thu, 30 Oct 2025 06:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0E0C4CEF1;
	Thu, 30 Oct 2025 06:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761807566;
	bh=pi8QZz8S06COfBDFE8/Wpju4Uxk040gn3MFwKckdEto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NhmnJkVKTHbBxaT7RKKAvihXDYVkKZTqdRc275vGNS+rmMVNBhbtesYJfRqH2+zl/
	 IFwOhgN66c5WX+1v4IkEt+UG/Nut2agoPKlZOuPXaAxPc2DteTkczciDDQ4Ln7SUgY
	 ISFfSelEN0gqkD71+7GPvwvmIqEEJaHo2cIZdmVpcRyi/JbG8jjp8FgusMRyAFtu4h
	 tJ/w1KS6EOWEbxQ6cIMFmkhw62p0wGrKF+QyzJu/9LcLlCql4dRik77uMr/PXI36n1
	 Xw0kjvpGSJMFSPKGDhRcbLzs8k8ziJTTO/YygdpdqSbzCC17GglqJuFpCtRwGhAgrM
	 jd5w2NUv30xDg==
Date: Thu, 30 Oct 2025 12:29:06 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, chaitanya chundru <quic_krichai@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com, amitk@kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7 7/8] arm64: defconfig: Enable TC9563 PWRCTL driver
Message-ID: <lf3mihjdk5twfn54z4sfqf7kpp5drxkr4sk24d3zzh6pxsnvii@2micimqjfvuc>
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
 <20251029-qps615_v4_1-v7-7-68426de5844a@oss.qualcomm.com>
 <CAMRc=McWw6tAjjaa6wst6y3+Dw=JT8446wwvQ0_c5LHHm=1Y-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McWw6tAjjaa6wst6y3+Dw=JT8446wwvQ0_c5LHHm=1Y-Q@mail.gmail.com>
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

On Wed, Oct 29, 2025 at 02:15:37PM +0100, Bartosz Golaszewski wrote:
> On Wed, Oct 29, 2025 at 12:30 PM Krishna Chaitanya Chundru
> <krishna.chundru@oss.qualcomm.com> wrote:
> >
> > Enable TC9563 PCIe switch pwrctl driver by default. This is needed
> > to power the PCIe switch which is present in Qualcomm RB3gen2 platform.
> > Without this the switch will not powered up and we can't use the
> > endpoints connected to the switch.
> >
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..fe5c9951c437a67ac76bf939a9e436eafa3820bf 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -249,6 +249,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
> >  CONFIG_PCI_ENDPOINT=y
> >  CONFIG_PCI_ENDPOINT_CONFIGFS=y
> >  CONFIG_PCI_EPF_TEST=m
> > +CONFIG_PCI_PWRCTRL_TC9563=m
> >  CONFIG_DEVTMPFS=y
> >  CONFIG_DEVTMPFS_MOUNT=y
> >  CONFIG_FW_LOADER_USER_HELPER=y
> >
> > --
> > 2.34.1
> >
> 
> Can't we just do the following in the respective Kconfig entry?
> 
> config PCI_PWRCTRL_TC9563
>     tristate ...
>     default m if ARCH_QCOM

I believe the driver is supposed to support all Toshiba TC9563 switches, but
since we have some hooks for toggling PERST# and they are only added for QCOM
platforms atm, it is OK to select the driver in Kconfig.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

