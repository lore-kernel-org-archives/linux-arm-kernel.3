Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1DDCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 23:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lsMHm2mZ5mYnp9tVkHEF9uvJZldQAv+OaokRJZBEw0U=; b=bhqSkR8MKRa9vc
	E9y0xHAOA0gK4UbAhIdoKxZ+PudfYqLrmpWJ9eDJMTT+qXTodi9yaZDJaG4olikZYGgtZBgVU4HcI
	wrsjrThtpE1AvTdXs65Y22svBOfkWkR057WAXXPXqAYYmSnZc5VIcommY/H0A3E+a321XD5uRW/PZ
	1Us4vLwhOEuuxWk6H0vkwrqWLqg4igDUgvuvPfOa81AhTacxn4xHu/SuQMDSOKgyjfOIEbArP+HPP
	7Facy0oWOOA0RPzu6l/2Zh05y3e1sqewkzbu+J61I1CeSosw0DAEV5DsPzr+qaxyR1DhBLgOkL/Cg
	rJdVWVBbYHpcJLxfubiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEFVn-00000003F8m-3NGQ;
	Wed, 29 Oct 2025 23:23:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEFVl-00000003F7n-37KB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 23:23:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B235841B5A;
	Wed, 29 Oct 2025 23:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63756C4CEF7;
	Wed, 29 Oct 2025 23:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761780204;
	bh=c/sTjrq+R9ZaCsBuwnVAqRM5QZJaaojvFV/fjYuoNGs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=n2objD2qH1724Re0HCcuSPzk1/aNZVzfB4rKes83yRy/4rJohBGae/kHc+PLNJvjV
	 QBTxxd59XiSacPcC9e9vKkErhlnbtauqS0N72jpQVM/VTIQbEF86KdpGEJYHZISUP6
	 QISwHziNuIX/hA89l85FIfTqm1eWnehJzN1rzajfoPG7iX03hdyVfyBH52teHRldKR
	 3CLD4dsQxbEJYCAP5ZRHxB0s26dczjgfbkc8nTvRX6bM4f26UEmZa/dMolb6gd5qGi
	 fV1nyrJC/Yz/7LmuZaZHktINivzgbUlnPppJMuO6jWq2S6DNM1DvCn8k5jdM/8gcje
	 JgPdL1iICbtxA==
Date: Wed, 29 Oct 2025 18:23:23 -0500
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
	Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com,
	amitk@kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <lumag@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v7 0/8] PCI: Enable Power and configure the TC9563 PCIe
 switch
Message-ID: <20251029232323.GA1602660@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_162325_824761_A2F02615 
X-CRM114-Status: GOOD (  15.91  )
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

On Wed, Oct 29, 2025 at 04:59:53PM +0530, Krishna Chaitanya Chundru wrote:
> TC9563 is the PCIe switch which has one upstream and three downstream
> ports. To one of the downstream ports ethernet MAC is connected as endpoint
> device. Other two downstream ports are supposed to connect to external
> device. One Host can connect to TC956x by upstream port.
> 
> TC9563 switch power is controlled by the GPIO's. After powering on
> the switch will immediately participate in the link training. if the
> host is also ready by that time PCIe link will established. 
> 
> The TC9563 needs to configured certain parameters like de-emphasis,
> disable unused port etc before link is established.
> 
> As the controller starts link training before the probe of pwrctl driver,
> the PCIe link may come up as soon as we power on the switch. Due to this
> configuring the switch itself through i2c will not have any effect as
> this configuration needs to done before link training. To avoid this
> introduce two functions in pci_ops to start_link() & stop_link() which
> will disable the link training if the PCIe link is not up yet.
> 
> This series depends on the https://lore.kernel.org/all/20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com/

What does this series apply to?  It doesn't apply cleanly to v6.18-rc1
(the normal base for topic branches) or v6.18-rc3 or pci/next.

I tried first applying the patches from
https://lore.kernel.org/all/20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com/,
but those don't apply to -rc1 or -rc3 either.

Bjorn

