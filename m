Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9404BC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zs08b7N7JXgAEMDwiHf505SxhscoZzfgeqelXaBrSH4=; b=YvMkC6Br+YVgIVtlBIaCGD2f9z
	njLWnGBT9WsZHTK7UTYnsXJdyTzjzCOK2O17kjb5u+Ag0hNACx7xqZ5QD/CV56ubXQi3HAx5KyFuu
	Y+hwJGOqTPAHQR97zRy2bhaBWSuDVE2ntSIz2M1reybTFvHou8zHkd7b3O+/+PnVN1+EzVg3thP9x
	/Dpz6KZGOS5CNDp96ZFqror4v0beT8OSOBfiW9F1/6oiyh+/BSWNHbeKf6nBpZHoL/sEEhWalTBZ2
	feEJpmzle7ZlZTsrwzXVjdOgTJjlSdX/ej+ZMq6+zAw4gpbAYQ15xLzQwuCygRXhBEvaeeqeKDeSZ
	5MHRqLVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnuu-00000006mR2-0i45;
	Mon, 20 Jul 2026 13:20:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnur-00000006mQF-3oMR;
	Mon, 20 Jul 2026 13:20:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31B2A60A8B;
	Mon, 20 Jul 2026 13:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4731F000E9;
	Mon, 20 Jul 2026 13:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784553616;
	bh=Zs08b7N7JXgAEMDwiHf505SxhscoZzfgeqelXaBrSH4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jplMdewH9fT/Ln2t3TxSLb7JzgDFzasPQHhaw6fWsQhTpMYp0vfzmnLQ6OtNgm4LK
	 mLYdXxdePnn5DQbGYkLMLCNKcgZqhjQElaerdyUFQczJkPxpviqvGEtGMxkoOVbQsY
	 wFxj32W4c4mNyE7/Y1mNEdBPHNyfIESYyOzl5VmMzNYnZENtaV4URCiQAH1smx0k1C
	 Vh3CT376eO8Uw+emvi0r5REA9CH5qfOz9AU5g18rcI7Y8lwZeYd1HKogP0UplXRmfK
	 E7cssTHFj/0cGIH0UvwPNLJtKj4OouQIVI3QHTZKTlr90WMkaOwRBZgzAM0ECL1xfA
	 hKN9o/xBPe2Wg==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Linmao Li <lilinmao@kylinos.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260717012433.1432285-1-lilinmao@kylinos.cn>
References: <20260717012433.1432285-1-lilinmao@kylinos.cn>
Subject: Re: [PATCH v2] ASoC: meson: Keep link pointers valid on realloc
 failure
Message-Id: <178449187119.33801.9637758292671659213.b4-ty@b4>
Date: Sun, 19 Jul 2026 21:11:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VoXJfGpB/ta/YC1D6FKPsSCtqeizSV15Kd9VWuadT98=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXiCN+7Wvw9kJ0foW8kHNsOI8DGcv+eWNcAOIW
 SZLP1T1ERaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal4gjQAKCRAk1otyXVSH
 0IwMB/0XbFAgMNm1ubDnf+qduGvECWpbopGlp7M+qJ6NRg3MwksJBDgM2oAD1ZxBHdGDKw8NVv4
 GpeK4kUApRRqSTyxJo96T1PAexwKwO6HaUhZrOULi3DXqiP7Jq6RgawejRHKGqHruXMye6Y9+tA
 O0oCsKVoOBApkw9GMJeXNpdkJLRMa3zrj+tBJwFLpY1ZeSGFS4z5FzHe8Rh6QZTNh0ufNPUADZe
 YWllLESrMwfFrhS4RkMk18etEclvFHVmDebnT1RCHneX00od3o1MCFPtAzhjNghroRnbaJNRxFV
 7h+BNIQW295dVF60FcCiTBqKvHa1nln2P0VGBRrmtPqMM4mz
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

On Fri, 17 Jul 2026 09:24:33 +0800, Linmao Li wrote:
> ASoC: meson: Keep link pointers valid on realloc failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: meson: Keep link pointers valid on realloc failure
      https://git.kernel.org/broonie/sound/c/2aaa41cf974f

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


