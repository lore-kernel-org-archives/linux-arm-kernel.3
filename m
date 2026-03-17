Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE161FED9F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgFlZ8aTptjtRhZcXnFarsRhYrGzHZGbc2ExB55l1Js=; b=KhzO/yk2jTfrxD5D825mgKVhGw
	6JocO4Z3d04u+d7WaXYnEOcK4nIkTpEbZ1Ci2smWe6QnVwfPUi5zywwfGceO8ulQgL6WuqRlPOcnC
	TsV26KNtJs6Mx4m3kaBHuRiX0/Ag8cnET4Og1gHG5VVLNgwTp2v2MtGqZW/raYD8JFHtV5CFvehBA
	JX5xaXhlGiTvxSYUoN6/u6WBNBPfnNNpWI2h22yTLPMy8Z1mn84OllN6LDtIUeqhP9Ej2WeBLm7j7
	0fzjtc0Bb1fP597UmAokjnWsVOroufYKWbiJMGxzjt2f+WjbfV+9zmASh7w4xsFB1Ij32CBiIIUzW
	OOHpV7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XuI-00000006tDz-1IxV;
	Tue, 17 Mar 2026 17:08:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XuH-00000006tDn-0IzS;
	Tue, 17 Mar 2026 17:08:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 753AA60018;
	Tue, 17 Mar 2026 17:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE03C2BCAF;
	Tue, 17 Mar 2026 17:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773767316;
	bh=OYKACKHn9r18VVAQQYO3XCrcZvWsa6eEUXZQRmgI5C0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rhvZZBY2U1mkFiKJSa826Kc7/gzYFZ5jEiwCXQnVS1v18/CpcQgiD8yLe10ccgZw6
	 rJlFDbVK80uWDDmJujHFEyNr8h5sdpMmPsbx4bou7op6cEftrXfe2aI14MyVyefzlt
	 hFlf0rFejR8e6OWjf1GEuAHpNP9Vkt9oxLGV3CWZ4Ox1fhf6QZpHKjY2lkwXFSDtlG
	 t4ibFiC8FcvggvF2ld1UFYcQravWyOc2zuLlTAL29stP+rNb1HGzHLtW2Kl3u6YzVX
	 jAaeF21hSn+OaQVE9dlnA3dfV1u0xT7/sLjg3EVyKaue5fLzuKpTEw9BbZZ4iRLGI8
	 SEbfKRPG6l8Xw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Alexey Charkov <alchark@gmail.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com
In-Reply-To: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
References: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
Subject: Re: (subset) [PATCH 0/2] Add SPDIF support to RK3576
Message-Id: <177375071091.66172.9619091096870411031.b4-ty@kernel.org>
Date: Tue, 17 Mar 2026 12:31:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-e1b5b
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OYKACKHn9r18VVAQQYO3XCrcZvWsa6eEUXZQRmgI5C0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpuYqQC0mSRbvylEYD8XOwmbfCGbStTFm5gcpB+
 WMc5ukRc5qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabmKkAAKCRAk1otyXVSH
 0HgGB/0VtBFyeChYr02uBJH0w2HPP0KbeANerijwZkJYYAa7H7iiNfnxSOqKy32XDMYLLMFSmSh
 9ANd6QWMUNAiM7awG7MWSMr7aUaKM0PFWlO5Guw0Z+m36wqmLuwC+f1/shA71QEKh7FDbSyXzQp
 pQGlcivQjzR0cVYGA5L0HU4fhmgMRj59s1NtA3ja6USpSwAot4tO3GKBHwIQWTz+lq2TJYwsCve
 jtLg+2dVCHiEN5CE5XaqrL5eTjNoWggtsg/z/Nf66rK2mCtFO01gBPtiAMbJpZ6Y/wiJk9j2zYl
 C3Ig1w9XCfUVoeQXyVHXKRtCjgSJvaVaJ/DUZ4PseKCiZuXw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Mon, 16 Mar 2026 19:22:59 +0100, Sebastian Reichel wrote:
> Add SPDIF support to RK3576
> 
> Add SPDIF support on RK3576 in preparation for Displayport audio
> support. My expectation is that Mark picks up the DT binding via
> his audio tree and Heiko picks up the DTS via the Rockchip tree.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/2] dt-bindings: ASoC: rockchip: Add compatible for RK3576 SPDIF
      https://git.kernel.org/broonie/sound/c/4eae391a8e4c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


