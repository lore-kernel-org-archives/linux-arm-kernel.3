Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA33BC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 18:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qS+uYAlXoVgoA5y3VMmw6zK3k+dLYvW/w3xfEGuyUw=; b=L8e5EN+wpL4tNMiy7zBcww7NPx
	W7RdwScApNlTnRZDw/5dCEhsm8fKc3lFOWWk+yFZtB4qQTYvp87+ua3nCMDnSF+vieDZYQ2dmmj8U
	Km6MyMPLKfUKxkYc03UR8VtHjtZ/TvgTSluheyxjE2paT/g7RVKc6bnGiMtOFRP+DLZJjFEYSLXAC
	cGH6izCu3Ph2YEBsU40sTihtinFgGRyK+tU5ABisixghBFF3Ge6wndz4WA/W5Bs+mrDmbRO2KTOaC
	30we4667qrqC/xZi5WHKfVrPBJ2JEnolMlv6ACbsGVMu6Qhok3tjjlGrdybNPmLkg0qbI5/2ze4a4
	63HKzNIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3eWR-00000007cr3-4324;
	Mon, 07 Sep 2026 18:56:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3eWN-00000007cqj-1mNK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 18:56:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 300584183B;
	Mon,  7 Sep 2026 18:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0691F00A3A;
	Mon,  7 Sep 2026 18:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788807405;
	bh=5qS+uYAlXoVgoA5y3VMmw6zK3k+dLYvW/w3xfEGuyUw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oWOZAw4qVcPyIyz31HyUKxqgWVkfl8JJHlBJziUh9ea0iOFHvs5ahLfRVsNNc9Mjc
	 C4gE7jzD3ytTnCVSbPbimSDkzeCrU8PX6lqD7h4RmGBIIKtmRrmUIg0uAG2iQLCbqC
	 OO/8bJaZsbFnc6Cb56LcHmwyIZq3LJEz+WYOB++MTmIY8kX3iJe2iwvkNr9x92yNS3
	 QfpOTTzGlZ9iNaFJ4hU7NtS3Easgj8TyKgVqyapuuDcqLRpBtMe+dcveaHh1UngMJN
	 qNbiSnZOCanuuAvL16GvKifWp2C0pABRvraLJfHIUnNggpP4jc35quvvw+C2njduzi
	 OZhXOgOQuSa3Q==
From: Mark Brown <broonie@kernel.org>
To: Jonas Gorski <jonas.gorski@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20260904110420.13707-1-hemanth.selam@gmail.com>
References: <20260904110420.13707-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH] spi: fix typos in comments
Message-Id: <178880178905.118202.7414086624567890048.b4-ty@b4>
Date: Mon, 07 Sep 2026 18:23:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nTVRlglTD9ckzVBTIRaaAh0k1mLw5g26dmcPmA7obJQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqnwjmLMJ612y12jg5vNINZFQMuybqmkcJJARWg
 sf5MP2QFQ6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCap8I5gAKCRAk1otyXVSH
 0KZHB/95sPFMK+ZElZYPGxiFZhS9eZvnnj+DTWdk+xxvrMzkurYYLkBL487FgiKRyWzJVwjG9mD
 9AZr/e84CFxrfnWfQyB1GRG8i+Pi7zuNkkiPucC+gHfr0ArmCPLT7oPNWf+5FGpnFxVbsbOkNr2
 6BXYnokYv5PgSO5LSXsuuYQfcK9TqfpEdpt2a4QpX+rxof3AROAomc4P7osQT35hl+63TtsBlG1
 qkYqzU/Ec+SKZxgAo487B5DnFLbHj2lF0c95S1zxZiKFdpic/jtOj7EWUXJv69UsOAinMHbcyGb
 cXIB24cRqik0QWmVEuiv1jAMRUi6cLtQDFEIyhPXdWi/Y6xv
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

On Fri, 04 Sep 2026 16:34:16 +0530, Hemanth Selam wrote:
> spi: fix typos in comments

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: fix typos in comments
      https://git.kernel.org/broonie/spi/c/98477036fc35

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


