Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC6ECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vzSWFHpj6QfKSgwHO/cnwaqSWbbXk0UTcvqYLmzuPs=; b=z5d5tScdCdyqOuFHjtPgdIDdhk
	ytVYpzyROtf9DY6wYEQATaH6leR+5huXAwen6HJYs/2ZrwhDuTBBDV6BQNlXiB+rB3FJs4QrbIqnT
	tDu3Sn178B8LOeZcv6EXHbPxNE1GRm2xnHXPBjRmPcetUpx1NMQFRyqPsi6VZOoBgL0M2mkWNdD1f
	Kri90mb9sMMPA29s9BV1d//D6dhydCjzSSYsVZoMyeZb5Wb/g+jLE95ymUtP4EqT9cUKhh53XaxDj
	cc9XN+82vrp6mJHnsHYUKKwk1tpmzDfdTY+5TV2JBEkGavSF7juknYS6aYrb36BUPDJOWLOlmGn0E
	VtseaSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITmk-00000005guZ-18si;
	Mon, 10 Nov 2025 15:26:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITmg-00000005gu9-2qdG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 15:26:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1031140BE9;
	Mon, 10 Nov 2025 15:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86160C4CEFB;
	Mon, 10 Nov 2025 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762788381;
	bh=oUgWF0RUu+mB1/5X7J8Lib1+YnLUj4YxOYKGEf0wWH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NEi3pw/N8drkjbFObP4vqAMkSx9U17WFA1bbYOZYToSNXxmPQLzT6NXLMV/1G23X6
	 QHehiRrMOiARo9hAnf9MGLSsJbV15Xs0N4T+ZACfLp/Vc9pUgUHiEGsG9krkL8k0q0
	 5friH9S5o9xUQNXyiBEiTHPr6fytp1DjQld1K0wumVqmhFjOXTVxTqEcCj4ZMztsK5
	 r8Xc+b8mVufve+txLpSjZFDpywY64xjKXsTG3g/+UmRWtFIGzHF0Iohlp5bwhAPq6J
	 0jtFJFBVDOY2VkHF5hPZnqBsCJY2rcjXjgHQR8sfLT53f76cI7+MdGOxW0DPojdKMH
	 39wTD61gcg0Kg==
Date: Mon, 10 Nov 2025 09:30:26 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Sebastian Reichel <sre@kernel.org>, 
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Moritz Fischer <moritz.fischer@ettus.com>, 
	John Stultz <john.stultz@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Stephen Boyd <swboyd@chromium.org>, Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Elliot Berman <quic_eberman@quicinc.com>, 
	Xin Liu <xin.liu@oss.qualcomm.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Elliot Berman <elliot.berman@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v17 09/12] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
Message-ID: <btvknf3tcqhgxzf7ckyvfwix6hxle2bs4whyayan5haaejo3sm@gnbszdys32lm>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-9-46e085bca4cc@oss.qualcomm.com>
 <20251110122824.5je5jfoanivl6xrh@hu-mojha-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110122824.5je5jfoanivl6xrh@hu-mojha-hyd.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_072622_755337_BCC2AD21 
X-CRM114-Status: GOOD (  21.35  )
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

On Mon, Nov 10, 2025 at 05:58:24PM +0530, Mukesh Ojha wrote:
> On Sun, Nov 09, 2025 at 08:07:22PM +0530, Shivendra Pratap wrote:
> > From: Elliot Berman <elliot.berman@oss.qualcomm.com>
> > 
> > Add support for SYSTEM_RESET2 vendor-specific resets in
> > qcs6490-rb3gen2 as reboot-modes.  Describe the resets:
> > "bootloader" will cause device to reboot and stop in the
> > bootloader's fastboot mode. "edl" will cause device to reboot
> > into "emergency download mode", which permits loading images via
> > the Firehose protocol.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
> > Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > index 721a26d49ccaeb1429e2cc1c3a5c8d9517da3be6..cebdedd5d614b9efb6dfbee91dd67f3c3e322a38 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > @@ -935,6 +935,13 @@ &pon_resin {
> >  	status = "okay";
> >  };
> >  
> > +&psci {
> > +	reboot-mode {
> > +		mode-bootloader = <0x10001 0x2>;
> > +		mode-edl = <0 0x1>;
> > +	};
> > +};
> > +
> 
> Make sense for this as it leverages sc7280 and adding it there would not
> have made sense.
> 

Why wouldn't it make sense?

> Acked-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 

Please read submitting-patches.rst about Acked-by, and use Reviewed-by
going forward.

Regards,
Bjorn

> >  &qup_uart7_cts {
> >  	/*
> >  	 * Configure a bias-bus-hold on CTS to lower power
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> -Mukesh Ojha
> 

