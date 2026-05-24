Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62241CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 20:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HTBQyePaHVmHHrsauW9DhwKjo0QZV1SOvIWr7DAq5o=; b=IVueqU9ksS3+EdQOLHPh78WhaW
	Q1UIr8kPNHwUYTRhtRTTB1aapM3gYfp3y8uChydo76ylGa6hF5OheXT+PMawOEPEinMgKMzClZhB5
	30o4g11ECKWJTHr4H+KNk0bDSTt/PlTjYZsi0rknlE3uradKS/0t22r333ukMEwHLcx4d1fPHfux2
	FLqLfwm+xOzdupuWfZZnFXSlsDw+05CisVgk3pE+8Y+4mO8sB7hk2vz2llN6kf0ZHz1TLVEJKeg+N
	uu0xk7nap5yRzOSoaccXe8LG7cWznIPK5LF+ZRTu32K1aRX8LrW8mKBgpA60uEHlv2dXjJlKySVN3
	cw5FexmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRF0P-0000000FY1Y-1fNS;
	Sun, 24 May 2026 20:01:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRF0N-0000000FY0j-0Fyn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 20:01:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 383B040148;
	Sun, 24 May 2026 20:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511001F000E9;
	Sun, 24 May 2026 20:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779652858;
	bh=3HTBQyePaHVmHHrsauW9DhwKjo0QZV1SOvIWr7DAq5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Nf1v9JFCTQGRtLm3jZ8I45mGn9GIW8Y64UyUkOfZmmzk8HN42vBNxQwHb/5cW9rzb
	 Yqn4p5Mtd6eojzbr8tTEJJPWE34wNHMD4Lwb4RzjiKEX2AfYrh0hrngdXVG8i3gE6N
	 yosPxD34CJMAqoeyrxS49JuXZRLtFHOh7kM1PTjPzzRNtfSon/H9VvCXXA+tJZPguz
	 KgSXJY6whqzKofM93ZC0GfCIS2tL5wJNc1xgYlL2YFwyqXANSXfd1+F7yJkXVgL3MD
	 pghyiWz5HjajvWqdFmmetZMOqBDrpzmYIoaRL033NbKaKiBDIu9t9N+gaCKuqz23bb
	 nkjsBJ7iSJC9A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Ge Gordon <gordon.ge@bst.ai>, 
 BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 =?utf-8?q?Yu-Chun_Lin_=5B=E6=9E=97=E7=A5=90=E5=90=9B=5D?= <eleanor.lin@realtek.com>, 
 Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Michal Simek <michal.simek@amd.com>
In-Reply-To: <20260523140242.586031-9-maz@kernel.org>
References: <20260523140242.586031-9-maz@kernel.org>
Subject: Re: (subset) [PATCH v3 08/17] arm64: dts: exynos: Add EL2 virtual
 timer interrupt
Message-Id: <177965284903.36046.11355001676395450278.b4-ty@b4>
Date: Sun, 24 May 2026 22:00:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_130059_128041_9327A34B 
X-CRM114-Status: UNSURE (   7.98  )
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


On Sat, 23 May 2026 15:02:33 +0100, Marc Zyngier wrote:
> A bunch of Samsung SoCs are missing the EL2 virtual timer interrupt
> despite using ARMv8.1+ CPUs. Add the missing interrupt, except for
> those broken designs where the interrupt is documented as not being
> wired.

Applied, thanks!

[08/17] arm64: dts: exynos: Add EL2 virtual timer interrupt
        https://git.kernel.org/krzk/linux/c/d0298724f901d45c76f1f2193225706200f565e4

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


