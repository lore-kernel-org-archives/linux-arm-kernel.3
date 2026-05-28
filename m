Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C1FCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 23:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Jc9Dg7/uw4mInrHAZejSNv7lp5AIrnyTQuFVoQJqhs=; b=fotzwMKtLUCggtBQWf13XQXibi
	yhDeiUyRNpWue5AgZjqpruVpkRnc9u9RQcQHGP6jh0FV4Of0r/ivKip7K83RDcBT0rhak+tVKGJq4
	S8b0lfNx8H546wAysHc6TVsQttmkR12g/FYOcCW2lAw492QpiV/wm67vsBjqyzMx+iIo9aPec4yPY
	7rNC0QI2ug8ESQQZsypGoaOVOBQY53cYMOQfJx08zWefg4fo/IpK5Qq9HJpqjMpYmTB7t4XnKLlX1
	7jBTVw8SwJo/Bzvqw4TL4xGyusTbL0mdozklSIRlZXn6waA4X2uNoKvovDj8EOAO8olcjB2OnCPxE
	zuSC6i/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSkAY-00000006XVm-4C23;
	Thu, 28 May 2026 23:29:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSkAX-00000006XVR-0NpI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 23:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=0Jc9Dg7/uw4mInrHAZejSNv7lp5AIrnyTQuFVoQJqhs=; b=VXW1qxgEKrcmlsKlOupkd9a7jA
	Gxpo4WpuKhKf5tJwDkwzKNyfQ3dGSLjiPYyW1Rq+T4nd+TTpnw3wIBHnhBp+WkbffgqcukroGZvQ7
	sB1kpes/ZWjTwz859lE/Fy3MpVsWUf4SRRQhDdHevoigwwdGFelIvnmUdU5IFXztUco0dtupIb2kf
	GXG9Om9Yi3BDubaP0iaf2PtV/NeIZlEz0RWIdxMEpcaRIgKtlmkxTXFJ+HjUKfBr3RKBWYFEK6o6T
	PELRIs0kD1qQ5GEnvgj8nGQ2d3H9h/p4K2hLtq1OeNzkjzY0AW+BOkmlqKgTnjQTsT80j8tKKoyLf
	CEa4dJXA==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ge Gordon <gordon.ge@bst.ai>,
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	=?UTF-8?q?Yu-Chun=20Lin=20=5B=E6=9E=97=E7=A5=90=E5=90=9B=5D?= <eleanor.lin@realtek.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: (subset) [PATCH v3 00/17] arm64: Use EL2 virtual timer when running VHE
Date: Fri, 29 May 2026 01:29:28 +0200
Message-ID: <178001096324.4059716.11429048314090179300.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260523140242.586031-1-maz@kernel.org>
References: <20260523140242.586031-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_162941_152286_8E20A0A0 
X-CRM114-Status: GOOD (  13.52  )
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


On Sat, 23 May 2026 15:02:25 +0100, Marc Zyngier wrote:
> This is the third version of the series initially posted at [1],
> which
> 
> - updates the ACPI GTDT parsing to deal the v3 layout and the EL2
>   virtual timer,
> - moves the architected timer driver to use it when running VHE,
> - fixes a number of DTs to reflect the reality of the HW.
> 
> [...]

Applied, thanks!

[15/17] arm64: dts: rockchip: Add EL2 virtual timer interrupt
        commit: d8d7e7549312c50fa5dcd69a6dc6f0035e770c09

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

