Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED654ECD9B7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 00:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGOuefRthfS2xjw22mQ+CecVWH3uzhJRuM5v6k15q7M=; b=TyAveuhhc8OC8S6y+wpx1Pkc+0
	hBxo2UuscOxw0eihaRYUvW2Y0oWV5324+F74L1cCDQ/SrmAWYlqn0UPvsOmY6XnwpzKXPM70UPXeL
	eE1h6hkDBCrAC1bZrLm5erBaolPBzbPHz5Q9DUteufWNBpZ/WpOMh9kTWuhMZM6/rHdAVGurBCJqT
	uUWWX7JdQUKSEnmLfgzpsbo+XlFCz2iKyc38u1CJU8QuZR6cch8v5C0EZt2HKwrI5wTGw58f64tvD
	y9lD0j8qaXKk18Le1ikb5oe14G3zCCv3LftlOMw9/xk2vIWCLWrOvroaD3p/LHZrkV3IxQ3Ba0UnY
	/Jmemx8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9ia-0000000AfTO-2F8f;
	Fri, 06 Feb 2026 00:29:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9iY-0000000AfSb-0hvv;
	Fri, 06 Feb 2026 00:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0414444A9;
	Fri,  6 Feb 2026 00:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E86DC4CEF7;
	Fri,  6 Feb 2026 00:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770337741;
	bh=apBmKVMnwTAS3R0uk13bUBoQgoQDSo3+VEuXU97IqMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Im5BJplu4iNPz6yJY488GVY+zYsWlySGUhf5cOH0KXAFVAxxLHpuP7TJZLYjMw4V3
	 Xv2S3qFosVtzrWS13RYWSWuBwQ2WZ1MdTTPYOSOy7XwlTAw+Hqm1YCCl0SQR+/LKgR
	 vTVQ0rXj+em/EPXcsWX8LGvbYTsTO3konHV7kX7b8QQsxlvPOG6AwOIeDLQVf6ghOn
	 Ssp5EWhu1DwFf8H9rYQjJC1MdE/RTlhvEfA00+YAC8S5IyIw6q86ngEFoPfimjd5/3
	 5o0A1RBYA2eHUbBEosoqWQX6lIMXJw0zHU6X+09l0vpURA7oiFBWqmk96ZuCUXvJch
	 Mp2cj9wd40x9g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, Zohn Ni <zohn.ni@rock-chips.com>
In-Reply-To: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
References: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
Subject: Re: [PATCH v2 00/10] ASoC: rockchip: spdif: Cleanups and port
 features from Rockchip's BSP kernel
Message-Id: <177033773886.236064.14543193521688333504.b4-ty@kernel.org>
Date: Fri, 06 Feb 2026 00:28:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162902_558797_BAE3464F 
X-CRM114-Status: GOOD (  16.53  )
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

On Tue, 03 Feb 2026 17:46:22 +0100, Sebastian Reichel wrote:
> I'm currently working on DisplayPort audio support for the Rockchip
> RK3588/RK3576 SoCs, which preferrably use S/PDIF as DAI source.
> 
> Apparently the upstream Rockchip S/PDIF driver is lacking a couple of
> features right now, which are necessary to get things going (i.e.
> setting the sysclk from the machine driver). I found the missing bits
> in Rockchip's 6.1 BSP kernel and ported them over. This series effectly
> brings the mainline kernel on-par with the BSP driver, but also contains
> a couple of cleanup patches of my own to bring the driver to the modern
> age.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: rockchip: spdif: Use device_get_match_data()
        commit: 27b5096ef0f3a78441128b993f0353a77f2f5f53
[02/10] ASoC: rockchip: spdif: Move DT compatible table
        commit: 45df1f66b99340e1d6e90501f1e938400a3e9768
[03/10] ASoC: rockchip: spdif: Fully convert to device managed resources
        commit: 7e2de68e4dbaee65864b0c5972e1b03037243632
[04/10] ASoC: rockchip: spdif: Use dev_err_probe
        commit: 730b0af2748a74528e0ad25f2bcd3272e96db10a
[05/10] ASoC: rockchip: spdif: Improve sample rate support
        commit: 72bcc223032cb71e640e466eb644537e369959a5
[06/10] ASoC: rockchip: spdif: Swap PCM and DAI component registration order
        commit: 7bdde9a2fd6577e18cd99e4f0e71e466ba626e77
[07/10] ASoC: rockchip: spdif: Add support for set mclk rate
        commit: 298082783a0d6d07109f8ce09ab410a1de12876d
[08/10] ASoC: rockchip: spdif: Add support for format S32_LE
        commit: c43ec509019842c0b836e858dc486c216b51b087
[09/10] ASoC: rockchip: spdif: Fill IEC958 CS info per params
        commit: 07a791020be9b190d4a57b5ee823ede1e98df493
[10/10] ASoC: rockchip: spdif: Convert to FIELD_PREP
        commit: d94ea902462ac39846d878aa67b78408727e0674

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


