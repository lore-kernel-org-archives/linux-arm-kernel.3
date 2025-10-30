Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813F7CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 15:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Psazla5+eYAufNiiwI3yXjwC/wZ2Y95axZ2CKkrlGsc=; b=soWGfpvIVE/cfF
	idqnXmfZzTwQj+5E4kw84Qqm5qChjRfzwebxyLXOI8Wpe5WLBqcJLlmN7NhDPIjip65zPyB52tT3d
	AEy0+sXYO9TIoAZhmzrENnXKzJ6c+XWVY2nAU9lwEdJZkk/kh1fc5HPJb2iPISzFD/MTDBsDGnza3
	AEDkhAjW9p2+UejwqstZsq/OFFa0AjAuy1i6S5I6Z73vy0qw4th69dNPy+GYxgOFW2fdjboGreylS
	BXsi8KCTXJ1XNDu6dcVDO3e1eli9GKUZjBGpttwznNjPo5pavdur2JDbY8DqQ7kq3rZXexQhabIse
	nNrmtwz9fO/EphANo9sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUkA-00000004OqP-2YwI;
	Thu, 30 Oct 2025 15:39:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUk9-00000004OqD-1eJ3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 15:39:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AACE601EA;
	Thu, 30 Oct 2025 15:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7E4C4CEF1;
	Thu, 30 Oct 2025 15:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761838756;
	bh=ek0IzzttXXx97qNT2h1xklMaf1xglphbe0kKLIhYhN4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=nleKMoCV/yk0BtnlIzx2I86cr3HqnGJCU2jCbp9S0N/Q/Sb8AY040g42QhifNtB8Z
	 udiMRHAA0R8lBIhjvOVioR2YzQFLaGzXZ5dBAAhrCBor4d9fALEU1V4A4qV8rnRdEq
	 hP0KMwy8FhR5ib1gdGtUvhOpN+eHx9fT0K9XJtrFhb+fVmFC8Elq8IuEFMvQzBKIew
	 QKFOZ3tVdkiCBLZ6ZaLIOd7pOt6K+mygmbGAtJ7KwZ3oBH8c24H2QJBS45eYZMwFyC
	 0zolbfs49T4uyRqBOcIkUj/9tq1+KJte6+ls+ftCku+3nWF1ALDRaetliGcVLmOyYm
	 WYCCxgN+u+CRQ==
Date: Thu, 30 Oct 2025 10:39:14 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	chaitanya chundru <quic_krichai@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Jingoo Han <jingoohan1@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, amitk@kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	jorge.ramirez@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <lumag@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v7 0/8] PCI: Enable Power and configure the TC9563 PCIe
 switch
Message-ID: <20251030153914.GA1632785@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dccca2d-272f-451a-9e38-901a6fa3a24c@oss.qualcomm.com>
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

On Thu, Oct 30, 2025 at 09:13:29AM +0530, Krishna Chaitanya Chundru wrote:
> On 10/30/2025 4:53 AM, Bjorn Helgaas wrote:
> > On Wed, Oct 29, 2025 at 04:59:53PM +0530, Krishna Chaitanya Chundru wrote:
> > > TC9563 is the PCIe switch which has one upstream and three downstream
> > > ports. To one of the downstream ports ethernet MAC is connected as endpoint
> > > device. Other two downstream ports are supposed to connect to external
> > > device. One Host can connect to TC956x by upstream port.
> > > 
> > > TC9563 switch power is controlled by the GPIO's. After powering on
> > > the switch will immediately participate in the link training. if the
> > > host is also ready by that time PCIe link will established.
> > > 
> > > The TC9563 needs to configured certain parameters like de-emphasis,
> > > disable unused port etc before link is established.
> > > 
> > > As the controller starts link training before the probe of pwrctl driver,
> > > the PCIe link may come up as soon as we power on the switch. Due to this
> > > configuring the switch itself through i2c will not have any effect as
> > > this configuration needs to done before link training. To avoid this
> > > introduce two functions in pci_ops to start_link() & stop_link() which
> > > will disable the link training if the PCIe link is not up yet.
> > > 
> > > This series depends on the https://lore.kernel.org/all/20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com/
> > What does this series apply to?  It doesn't apply cleanly to v6.18-rc1
> > (the normal base for topic branches) or v6.18-rc3 or pci/next.
>
> I sent this on top of rc3 as we have some dependencies with latest changes
> i.e ecam changes in dwc driver.

Oops, sorry, my fault.  I must have been trying to apply the v6 series
(not this v7) on -rc3.  This v7 *does* apply cleanly to -rc3.

But all the other topic branches are based on -rc1, so I think the
best thing is to make this one apply on -rc1 as well, and I will deal
with the resulting conflicts when merging into pci/next and ultimately
into Linus's tree.

Bjorn

