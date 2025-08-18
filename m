Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C48CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 22:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPUrzVX19GqRWO8uuoQNdQgJkUoqWb0AZHWYn8BOOuo=; b=CSHnXl679fRg8Oe9Pmy5H3LIfx
	CyY9EwZKb4/OqKsqs2YCjmVP0UnPMsOx2jZPDbRas+IvdVREQMPk7CXbAgluafk50O1WihdjVAae2
	zCKLI/BpmbA9B02pEnJYaRKrAP8iQM24afTEgElDzyawGkuqVTWhbMNXWa95KPMoLmpxxgHKeMEbJ
	rBpF50QS+pgVuFFB/TFzHz0E5MfUfkVIAaYQT32eQGQ25TuBr0xj2UVC4a3iiAyj+K4950ehVvV8y
	gBl5OPBaRUW45iyYUahL6XC45vdSOu6umYagktPlPcMzC7TClqaJK1ksCpTjshbtkIM2qV23jtQz0
	ohdwWs4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo8Ky-00000008q0g-3sYP;
	Mon, 18 Aug 2025 22:28:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo6a7-00000008diX-0yB0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 20:35:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C5EBC5C62C8;
	Mon, 18 Aug 2025 20:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1177C4CEEB;
	Mon, 18 Aug 2025 20:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755549349;
	bh=om2cfshnlMUz7DuvRjvZA14In9sewmxBtmoNs13zHqw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=uQEVHSl+duq+dWLUD9eW7eVtnhv2PmtTTxGShiVKLaoXm1AZwNzmFVVwBWbNLfnKg
	 94Rptxkq/91UxwElGtWNKiw3S7i/v4rMR6FWZ1ZU6f3UTJDV4YDtGBJ0ulG1WCgOz1
	 DSfa1jXtrrqlrbJE3cTEvmqjW4E2SWvBobJJfxl9qWfPRA16kgHJSoJ3jTGBtyUbUZ
	 0LNddIr0zP9JhbNdc9h62WWL6M/vUZYDls/huH7FMIPUj5utoSBbq8q1m+fUwsl8aF
	 N8Sv1p/4cz8QAo5VRqq6szY9e76eJ2vUc4mEZbqVB2J7MYIXScGH1mPu08d67/1H49
	 XmSHZe5KSNIgw==
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.Li@nxp.com>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <20250815082118.586422-1-rongqianfeng@vivo.com>
References: <20250815082118.586422-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH 0/3] spi: use min_t() to improve code
Message-Id: <175554934664.130972.8355246635589446804.b4-ty@kernel.org>
Date: Mon, 18 Aug 2025 21:35:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_133551_315239_8A192224 
X-CRM114-Status: GOOD (  11.05  )
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

On Fri, 15 Aug 2025 16:21:14 +0800, Qianfeng Rong wrote:
> Use min_t() to reduce the code and improve readability.
> 
> No functional changes.
> 
> Qianfeng Rong (3):
>   spi: spi-fsl-lpspi: use min_t() to improve code
>   spi: npcm-fiu: use min_t() to improve code
>   spi: spl022: use min_t() to improve code
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: spi-fsl-lpspi: use min_t() to improve code
      commit: a750050349ea138e3e86c66a8a41de736619b9de
[2/3] spi: npcm-fiu: use min_t() to improve code
      commit: 1bdc716023a78c2c41fdcb3fc37f09da1be4b7df
[3/3] spi: spl022: use min_t() to improve code
      commit: 90179609efa421b1ccc7d8eafbc078bafb25777c

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


