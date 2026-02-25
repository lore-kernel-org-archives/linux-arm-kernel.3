Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98486EFD213
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 19:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFyu3A9GwQlyjjoTHZvQcCetFCPVyxd1lllmUHUSHjI=; b=wJ3dVPscT8n6xZQkxEgGYzWsPQ
	eK2Emg+Cq0ipKzLzSWnUNkKn4e5Bwok8wdNA6vNVduG4qFDdgzhjGbXu0aCQjDfBHXI4R4X0VQSFM
	xVDUaiA/1vc7nsOUGYoeJ0EG2Qtdl9nrL5ym2LF51axwyzMnJRVHcbjX1iQDJVgVpJd+7A41V0JzS
	F6AEUFGoE3aKEe4ZDDbXs+OmpuU5+ctBScJ5cz7TMgPkec4e2GuHHiSEf4UBBrlG57GZk4jUlkkE0
	d4lmyTSWpeFhpMCBDTgDWcnTebm5UtqjkKOmV6SBSjZWuf29Danxf9pL8IYRm2U6EGP2N0b/IsbIw
	ISWpt5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvKEi-00000004llj-1LDc;
	Wed, 25 Feb 2026 19:07:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvKEV-00000004liy-15hP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 19:07:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 978BE4409F;
	Wed, 25 Feb 2026 19:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C736C2BC86;
	Wed, 25 Feb 2026 19:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046458;
	bh=aFuLYKEXDlVrxmqtiLhd3oSqmL8g1jZb9tt7+dTqYiw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=WpMaU+OoZFSMQpW3pwmXTF0cs/Gz1TV139ytIdNF6waEY62i4H6wRUchLNELO/K2k
	 z8oW9vByNyvozRTVMWITsu9FAOycUuZVLW/P0OZYIpM4kgxDqy095foS+dGCBgIexp
	 iw5+CStzmXENaSokmP2X5YdSVDobpc+6/C0/MsvvG8mX6MHg4Dj9WkcOSFqYCWGQCt
	 SjaOFDJAQok6BG2XF+jerExO6rY5hJEL3+e5dZaRyRT+PGr+Ie+/3zwiTKSfZxqda2
	 BKlLiV3Mmr+oU7DuxtZGTGNQmTIyHh6uiGtll6RfeiVWBSm/DLpmKXCQB2HqQzZVU1
	 X5SklZ++J9Xlg==
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260216085816.69888-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216085816.69888-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] spi: stm32: Use NULL instead of 0 for pointer
Message-Id: <177204645680.169139.6555103942757659163.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:07:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_110740_398370_FC6D1F06 
X-CRM114-Status: GOOD (  10.82  )
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

On Mon, 16 Feb 2026 09:58:17 +0100, Krzysztof Kozlowski wrote:
> Pointers should use NULL instead of explicit '0', as pointed out by
> sparse:
> 
>   spi-stm32.c:1659:65: warning: Using plain integer as NULL pointer
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: Use NULL instead of 0 for pointer
      commit: 5e897a498a6b45145350e9de5e4753e9eee7d4f6

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


