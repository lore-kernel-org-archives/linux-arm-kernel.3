Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076ABCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b952kGpEMvRiit9FTFHTz6P7HfXCrJpbJbKuJYF3T8s=; b=DFGaqVo02rcAFCcyN1mPb3Eujm
	0UxQeARQrtMko+RRyoRz8TAnG43iGujomafOYVjbAx10NAYT8RXRxswjd/+Nnwbrzl0gYGeU8XuqS
	XfxKz1qxuDXL/HwpjQV2MT39EZ4fGWiluaZhxGAJCILcrhLqAmnUwrJOuVO/36wzGvgJHhEkKosZY
	81kxT1upQ94uQyZL019GXMuplV1O3zTbq57KErHHYIt1blej45p0c7Ufp+F57g1/AkI1Qz6waB6if
	lm+BFAOQ6WFRa8bJ9aT3d0VRmSRYE3rFvYW9xbPdRHu6F7buLTQg8gAwjMki76UH+nbJClz9ql8jY
	EogPWbmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG5w-00000007O9E-4BEG;
	Wed, 10 Jun 2026 10:23:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG5v-00000007O8e-18MM;
	Wed, 10 Jun 2026 10:23:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A52C343F78;
	Wed, 10 Jun 2026 10:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CA21F00893;
	Wed, 10 Jun 2026 10:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781087014;
	bh=b952kGpEMvRiit9FTFHTz6P7HfXCrJpbJbKuJYF3T8s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SnqPRjW8N2AK3UIZlbRblqGrklySyh7TGWdMw+XrdGXogaIqJdMEBovqwtnfVK6rc
	 xVlENf/nhxE7Z89+A0qBE8fkFV57IYZeRD9b44H3X66ILN5gAsHUK8pgWehRzrvNT5
	 UhrnGLW0pajIpTigHI78JrPFQQ9M8AphGXo85xAGY6+NiYldlq+VCezAME1lX5POOZ
	 nKHqU10FPtT9m4LQPphCANBYRFD1PlcLi1iHbqD0BqVgNiCl55ekmMj7nV/0qv+Jmf
	 29gjF/cHrDnSkeCGLPfECNzjzmn+06f0dTPN7D0rAXfNgAiBFBvg2DUOPJgRuBRVoA
	 5g1r6DB0U4RWw==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260609052647.5-1-ruoyuw560@gmail.com>
References: <20260609052647.5-1-ruoyuw560@gmail.com>
Subject: Re: [PATCH] spi: meson-spifc: fix runtime PM leak on remove
Message-Id: <178104640986.212106.12502273738645325347.b4-ty@b4>
Date: Wed, 10 Jun 2026 00:06:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106; i=broonie@kernel.org;
 h=from:subject:message-id; bh=C/czuiP9grpMZXO7aleQvnc9q8khXKOwwS2Z1kdf4dM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKTsjUnvIDFUOx+gx/OS+/TdsHBQ/1dxwRtkt4
 eRn7TEiCPiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaik7IwAKCRAk1otyXVSH
 0A+iB/0WiyEFVlvDGYdaAGsoWZEnfDSyFifJuz2TPP9E6pBgh64emn3QWgwcBQPgGWvXqn0fbQ/
 v2oH4KY+wkat0DQTiFDDVC57bN+dder0Fo48vQKpkmloMIsUxEScrVtRQw6J9IHC8wygFeI5/+d
 zwaqmFNKIIPHLSe3BmtG8M0VCwvAgvSCqmEHFsVwjPLDEbTPMn9OX2JqPU3ivsW3Nwuat0lmK8V
 CF/GmHrxQnewc12i7OZAjq5Hhs156ip0RLXS7IFJC4QDn3c0/zLa7S+8nreSIm86Up3XXiUk6oP
 BAtOduaWpapGNvH3rEGh6scqCbX8O67Z6xYcIpJbt2pNLBCZ
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

On Tue, 09 Jun 2026 13:26:47 +0800, Ruoyu Wang wrote:
> spi: meson-spifc: fix runtime PM leak on remove

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/1] spi: meson-spifc: fix runtime PM leak on remove
      https://git.kernel.org/broonie/spi/c/606c0826bd90

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


