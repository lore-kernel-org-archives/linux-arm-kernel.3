Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D980CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 16:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bD3xYIzF9Uzh/GN41AjAa2R2ipqp1LsEB7KswyZ2blw=; b=m4ZoNgP0AkqXTNcasAWfHqQsz0
	+hlLt89NXFckk0896VIJY1AI7scnDTbKrZOmcFQwn9WE4MsWlgMQxACFKR/qz12lh1zf8+qPLbCi5
	adT3Kp2tq2HOLZTxgfQWEGgAWCfDw7gFTyhsIDiD1jprUlikF7r49QuHYQMJbTA+AnVT1+zv9ICBL
	2XiQliGk0dDOhJqSbcpuTsuHRWrwfZvVGisCd5fAmhq56q3K0MwHnjMshplriFsKw1U1MELdvUCq3
	ElQoD73c/lNYfCc0aTrHGmsdY2CJRaZ4wwqPi8ANsJKKGozWEUwsrJ2dWw3KBdE6FBIhuyOmvLcYj
	kN58CHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrdz-00000007V0e-0MOs;
	Tue, 11 Nov 2025 16:54:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrdx-00000007V0U-1mck
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 16:54:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9084F60204;
	Tue, 11 Nov 2025 16:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA336C113D0;
	Tue, 11 Nov 2025 16:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762880096;
	bh=g2qpKek/bXepoXeAYoO1uBMn56y2jG6J5EJpN9tjKjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sowvj686mB4AULMiD8qJK6S2VhQ1Sma4nzGBWPdbbM8oe3byYncZiEsFGYMlJAtM2
	 aob9db3XYuX57073ozMNPXu8hYl67LpTglrrNf2Jip1rlyoWTOXwtye3lIOm3m6eB5
	 fQmISuNe6u7iFskf9xY2zbIVjT23iM1wu9c8hnsARtPkLuOuEAk6+HFKj9BEno9hgy
	 ZPxTYUqfineEEfdQGgbMUi+EE398+g7NZgFAaT/kB/9n9XZRiLmePY22lDhSVQGBQn
	 VL4lF4h97MXDchOsD8rETXHSSQE26v7Gg5MYGxS3Rcc7WRz/BiG04givnr7l1Z+5xu
	 uB7j/fhTdDkGQ==
Date: Tue, 11 Nov 2025 10:59:06 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Vinod Koul <vkoul@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Moritz Fischer <moritz.fischer@ettus.com>, John Stultz <john.stultz@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Stephen Boyd <swboyd@chromium.org>, Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Elliot Berman <quic_eberman@quicinc.com>, 
	Xin Liu <xin.liu@oss.qualcomm.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Elliot Berman <elliot.berman@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v17 09/12] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
Message-ID: <3gvxaeun4i3ajoo3perjvdsohmtzgstsctdilorr65eexesxfh@hyoinhvkgi3c>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-9-46e085bca4cc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-9-46e085bca4cc@oss.qualcomm.com>
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

On Sun, Nov 09, 2025 at 08:07:22PM +0530, Shivendra Pratap wrote:
> From: Elliot Berman <elliot.berman@oss.qualcomm.com>
> 
> Add support for SYSTEM_RESET2 vendor-specific resets in

Please rewrite this to start with the purpose of the patch, introduce
the fact that we can use SYSTEM_RESET2 to affect the reboot mode.

Make sure you include the information that this isn't broadly available
on all sc7280 devices.

Please line break at 72 characters, not less.

> qcs6490-rb3gen2 as reboot-modes.  Describe the resets:

This looks like the header for a list, that documents "bootloader" and
"edl", but it's just one lump of text. Please improve the formatting. If
it is a list, then make it look like a list.

Regards,
Bjorn

> "bootloader" will cause device to reboot and stop in the
> bootloader's fastboot mode. "edl" will cause device to reboot
> into "emergency download mode", which permits loading images via
> the Firehose protocol.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 721a26d49ccaeb1429e2cc1c3a5c8d9517da3be6..cebdedd5d614b9efb6dfbee91dd67f3c3e322a38 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -935,6 +935,13 @@ &pon_resin {
>  	status = "okay";
>  };
>  
> +&psci {
> +	reboot-mode {
> +		mode-bootloader = <0x10001 0x2>;
> +		mode-edl = <0 0x1>;
> +	};
> +};
> +
>  &qup_uart7_cts {
>  	/*
>  	 * Configure a bias-bus-hold on CTS to lower power
> 
> -- 
> 2.34.1
> 

