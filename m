Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A829AC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkFp59Y/yQp7/MaQAN5/ilxVOcGMaaG1A6uxiMrD4l8=; b=JKYur3jiPp0xJ1ZAB6YM5txof9
	aRlGjvfsN12tlQP3vouTixJyyBjIgq4PpR9gb1pbs8+po/qvKiDvL8z3CPZ35sP9/MA8nknCFKKzJ
	ECT4WC4MuL1hkC1W4kkAvw0iZ9zRcA+MhbJo1x1/+PkNNMIXVdGknzw9gQoFEmvZiss/OskpiJXGp
	uILCf9u255eGnCH8m7iqx1lKL1qBUmKBzeLqTQTXLjGr0QYWZ8Z82lPA71eJyPN6UbD4qTpNcL8pJ
	PomV0W4HZCRPPabQYBIsWSK5v4nNk0cyE/cict/XifQm920tlOXIbUadUthdtb1lN2ctRYEW8Oh+m
	tRI/bzeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KSP-0000000HV37-3N8K;
	Fri, 25 Apr 2025 14:55:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Hzj-0000000H66P-2T73;
	Fri, 25 Apr 2025 12:17:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D3DE4A9C0;
	Fri, 25 Apr 2025 12:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7D8C4CEEB;
	Fri, 25 Apr 2025 12:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745583446;
	bh=doZ6qDg+DbMAdbR2WmMDGL0y6rqGhwvvHGOPXHeICvg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hrTQkfhREHEQrTBngdq4FzGBs04WnOfpesHXqkZTIgR5zS4fORwuqnvaT6O5cPQk1
	 FQ/bAruUnUvTU6+wBMhsEDFibK930AulpcpVNgDoP1X0WYMBGO87/dgoea+WS9+W68
	 FkmTJocHck5b/A64LFtSk63boY49y1SeNDq0pMzqPT58J3f+1xy0BucuCJDi1XR6l/
	 NGNUQmrgQwYXcEUgmZKigoP4uwXFghthd84y+0jVPlQmdSmfmmB52EVxEC3yAMlLua
	 6/i1yjsF1OYsfAaK9zIU8j8KR6K0tl55vKjBBJZ1GKwSMiI8SC3TxzwjvtCGRCJnvO
	 eiOexV9/w5brw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: jbrunet@baylibre.com, lgirdwood@gmail.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>, stable@vger.kernel.org
In-Reply-To: <20250419213448.59647-1-martin.blumenstingl@googlemail.com>
References: <20250419213448.59647-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] ASoC: meson: meson-card-utils: use
 of_property_present() for DT parsing
Message-Id: <174558344482.35587.18106901736438016481.b4-ty@kernel.org>
Date: Fri, 25 Apr 2025 13:17:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_051727_654856_FE4C0BB5 
X-CRM114-Status: GOOD (  13.62  )
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

On Sat, 19 Apr 2025 23:34:48 +0200, Martin Blumenstingl wrote:
> Commit c141ecc3cecd ("of: Warn when of_property_read_bool() is used on
> non-boolean properties") added a warning when trying to parse a property
> with a value (boolean properties are defined as: absent = false, present
> without any value = true). This causes a warning from meson-card-utils.
> 
> meson-card-utils needs to know about the existence of the
> "audio-routing" and/or "audio-widgets" properties in order to properly
> parse them. Switch to of_property_present() in order to silence the
> following warning messages during boot:
>   OF: /sound: Read of boolean property 'audio-routing' with a value.
>   OF: /sound: Read of boolean property 'audio-widgets' with a value.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: meson-card-utils: use of_property_present() for DT parsing
      commit: 171eb6f71e9e3ba6a7410a1d93f3ac213f39dae2

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


