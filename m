Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6A3CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 21:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8dQxia5J1MmyVM4Wf+kPysZJUtiLa+FQRPlQG2Mos4=; b=NQGmH4hIZQYEQTDVOX3quVQGf1
	69DSn3aFe7mYEfOtonQfWGfa92d2/h656AUnaTCGV3e/r6tYneGAvfs0a9/fd4aNsJTrzodJzkbBO
	QzGQ1qud7unZ6+JGtoRcr6EdM72G1vPlpVR6DDG8mYox7NsAeKGW1U1vPObB+TJQWrA0BSpKQugSA
	xLQQG/4PP0yQRIr/MCgQPJd9vWtc4NQJYMffrujZwQfANtmSGqN96CS6iMeAu9Naili8EWZnIuN+Z
	cSyK0VLvWt/DZGeHZ/ceIzVgNYwGMuY4KDfxCbDQrbq+TE8AQsUSbZH52CsMIQZIbSGpsA5yUNsIx
	/RIwtoyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSieo-00000006QTV-4774;
	Thu, 28 May 2026 21:52:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSien-00000006QTM-2LT6;
	Thu, 28 May 2026 21:52:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A2BF860213;
	Thu, 28 May 2026 21:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88461F000E9;
	Thu, 28 May 2026 21:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780005168;
	bh=P8dQxia5J1MmyVM4Wf+kPysZJUtiLa+FQRPlQG2Mos4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dSrZbO0O93XdYJoAuUqJjm3qKi3YT+FSmh7gAfFm0uRSiW61McQLiH7hL6SchZWl7
	 yMhTFsLgDfL/SIJV38B9ZuUyHqtJ5d5kwvbl4Wefe635KU/LIm2z1I70Fg9uoN04zh
	 WAVBB8zzqlFaFhJ46LlgnFRiDg+11IJOKqyUcSsx7mbecr++7Qkl0nohtarstxiRmi
	 33f2D4Z0zxDmPmjOrtD40kRtrrUU0zUdDb1fdfMcOxF+D4ESwwN0oIIF2QSp2WoqU/
	 YNw8IMaJ8hAFr3LWjf6EggRItNXPAc8L6Owhx2kjWi8Ua5jjzELBZPU6M+XUNmEjL0
	 9xNEmlSu8PF+g==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Brian Norris <briannorris@chromium.org>
Cc: devicetree@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	Julius Werner <jwerner@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to Chromium-based DTs
Date: Thu, 28 May 2026 23:52:42 +0200
Message-ID: <178000515404.195040.3052014015963581433.b4-ty@b4>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
References: <20260428200712.2660635-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

From: Thierry Reding <treding@nvidia.com>


On Tue, 28 Apr 2026 13:06:52 -0700, Brian Norris wrote:
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
> 
>   ## From a RK3399 Gru/Kevin Chromebook:
>   # find /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware/coreboot
>   /sys/firmware/devicetree/base/firmware/coreboot/ram-code
>   /sys/firmware/devicetree/base/firmware/coreboot/compatible
>   /sys/firmware/devicetree/base/firmware/coreboot/board-id
>   /sys/firmware/devicetree/base/firmware/coreboot/reg
>   /sys/firmware/devicetree/base/firmware/coreboot/name
>   /sys/firmware/devicetree/base/firmware/chromeos
>   /sys/firmware/devicetree/base/firmware/chromeos/readonly-firmware-version
>   /sys/firmware/devicetree/base/firmware/chromeos/active-ec-firmware
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-version
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-storage
>   /sys/firmware/devicetree/base/firmware/chromeos/vboot-shared-data
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-size
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-offset
>   /sys/firmware/devicetree/base/firmware/chromeos/hardware-id
>   /sys/firmware/devicetree/base/firmware/chromeos/compatible
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-type
>   /sys/firmware/devicetree/base/firmware/chromeos/fmap-offset
>   /sys/firmware/devicetree/base/firmware/chromeos/name
>   /sys/firmware/devicetree/base/firmware/ranges
>   /sys/firmware/devicetree/base/firmware/name
> 
> [...]

Applied, thanks!

[3/7] ARM: dts: nvidia: Add #{address,size}-cells to Chromium-based /firmware
      commit: e6d097f575338738ba597b1d836e7fe655babd7c

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

