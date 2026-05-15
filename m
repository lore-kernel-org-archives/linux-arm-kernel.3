Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF84BCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 23:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13W8vqjDTUkOwRMDWh9WUbax5RjY2p2CDpd84EuUOP4=; b=rPm3rk1a1xN8TLcwr31TODGeK8
	1rgef1SkHRfux9I7SG6OaCux3Q606r0BKoPs32sUtMIgQfUeuHleuj4jdAaR/p43kIEUL69ohvzkU
	Yc3eCT50gjURFCHWCUN8m3wzF/jtErKOEu08Of6LC4qQYmNFVew2JL2kn1DPlxhrctyT1AeSDl4Ho
	FrlEVmG2YC27UfrYKUGY6PLzlKR1zpskbgKaKmEEJJ/H0EdIN+RaIX2uT8dPOvYYJLKbs6eKXu0EN
	9u+J7geJliWrN2GsAV8zkJ2jWp7YJJ9JAXh4VPmZqgfRjmsnLv6GvXsu8IggR83IyP/kOF9YZIB7i
	bg15uMLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO27d-00000009jnl-0pCe;
	Fri, 15 May 2026 23:39:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO27Y-00000009jml-3QLu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 23:39:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF5B022FC;
	Fri, 15 May 2026 16:39:01 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DABD3F85F;
	Fri, 15 May 2026 16:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778888347; bh=hcyi/oQQYFZ0VBh4EERVTQPgaMQsOUZKGv3aL0avj9M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pPkwFu5D+YbH2+PpMwRTpME8igQ1y2qLUKm9sYXy4XipkRaiTw+MnZkf3cLn1Ge7O
	 HVAblJg3cV+31efMuWUyKMt2R7inzWu4pynGFnlLK2OBD3Um9meAy+J1U5xXLJ/i8U
	 /tDMGc53F7bdHTNTw1tBhaCIVUVWPaIpCFa8JIdM=
Date: Sat, 16 May 2026 01:38:15 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla
 <sudeep.holla@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ge Gordon
 <gordon.ge@bst.ai>, BST Linux Kernel Upstream Group
 <bst-upstream@bstai.top>, Jesper Nilsson <jesper.nilsson@axis.com>, Lars
 Persson <lars.persson@axis.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
 <jonathanh@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konradybcio@kernel.org>, Andreas =?UTF-8?B?RsOkcmJlcg==?=
 <afaerber@suse.de>, Heiko Stuebner <heiko@sntech.de>, Shawn Lin
 <shawn.lin@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Michal Simek <michal.simek@amd.com>,
 linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH v2 05/17] arm64: dts: allwinner: Add EL2 virtual timer
 interrupt
Message-ID: <20260516013815.6dd21da3@ryzen.lan>
In-Reply-To: <20260514150945.3917510-6-maz@kernel.org>
References: <20260514150945.3917510-1-maz@kernel.org>
	<20260514150945.3917510-6-maz@kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_163909_105547_20C81E57 
X-CRM114-Status: GOOD (  15.45  )
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

On Thu, 14 May 2026 16:09:33 +0100
Marc Zyngier <maz@kernel.org> wrote:

> The ARMv8.2 based CPUs used in the A523 SoC (and derivatives)
> are missing the EL2 virtual timer interrupt. Add it.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Works, with [v2 03/17] and this patch I see the arch timer IRQ being
int ID 28, and working, where it was 26 before. dmesg confirms that:
[    0.000000] arch_timer: cp15 timer running at 24.00MHz (hyp-virt).

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index 5afa8d92acbfb..d3c47966e8fc8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -101,7 +101,8 @@ timer {
>  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
>  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
>  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH>;
>  	};
>  
>  	soc {


