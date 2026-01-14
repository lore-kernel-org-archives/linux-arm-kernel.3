Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377A4D38FEE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdrv3VzAX1sePc07uYRf/xB810uiq+YaB4kHa9DcteE=; b=k816cnbq7udEzV4fTt4sqJHT/M
	ylUjnLn13j5BjFcoOk2HTweTFti53YIMic9jqqk0xNRuEchXK1UldI2Ky7mtJVnuWuuOcKFOtcD8L
	YOETSPf1gBxVXnmf0ekoENAdGZTJQi2dYgkk56ubO3lg3Ju/vXqeZ7KQXVnJyHj/fsNWQL7z2Egjj
	isoZE2W5APHEZ9AL4T3YXfSq7N8/Behlq7Y+K5ia/LzBRtAYkkD0ONpnMAdIB5bwHjKjTF+HKS5BO
	KZ+ruy1gecDS70iYcFh7OK0FPjFtT6R7Xx1ahMX0ipP2Z+vUM/tG0ASRltkuyDC5SFugh+dzA+p7G
	X4nPu/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg46K-00000009zis-27Kh;
	Wed, 14 Jan 2026 16:52:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg46C-00000009zdg-20lQ;
	Wed, 14 Jan 2026 16:52:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9352B60052;
	Wed, 14 Jan 2026 16:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5081C2BCB0;
	Wed, 14 Jan 2026 16:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768409519;
	bh=eqlCfJnhCcOSzYTuVouxRFGgRxB0pW/KJp9s0tKygyY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b+gKOpMl1X7HJlzsLPngl16ni5+Dt6EcXJx6uDM/C6Qms+KnILawHmbM/KWKYVmqI
	 J6QLWJ2ADcf0hOODqliXraWI1Xgh3ALNDWjG0Wa/be4sxN9BUOWT70wsYkuNxDUbq3
	 M/qdWw2AxkuAepIhfEFyKS+fyM0o8kRFHGN43pRzcfKlejjLDq3lo0EWvYzkdfFQSl
	 NGFJ6lVGeSeskZeL2oUlAq4HI/c/h5bhrE1FHrNEZIs5xrP/QjBfGld3p5IR3ix4SK
	 UHnz1lujxwEK5wEcFDbiluAN2wCULpqlIExP4+q4A8Eg3w5A4uXA3xvKkuLJaAxHOQ
	 TEQWnVkJ+yrfA==
From: Vinod Koul <vkoul@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
In-Reply-To: <20260108-atcphy-coldboot-fix-v1-1-01c41c6e84f2@kernel.org>
References: <20260108-atcphy-coldboot-fix-v1-1-01c41c6e84f2@kernel.org>
Subject: Re: [PATCH next] phy: apple: atc: Reset USB2 PHY during probe as
 well
Message-Id: <176840951656.979558.11996676069511198685.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 22:21:56 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Thu, 08 Jan 2026 20:12:06 +0100, Sven Peter wrote:
> Now that the upstream Type-C PHY code is getting broader test coverage we
> got reports of USB devices plugged in during boot or those plugged in for
> the first time after boot occasionally not working correctly.
> This is partially caused by the USB2 parts of the PHY being left in an
> unknown state by the previous boot stages. We reset all other parts during
> probe but forgot about the USB2 PHY so let's fix that and actually reset
> and power off the USB2 PHY as well.
> 
> [...]

Applied, thanks!

[1/1] phy: apple: atc: Reset USB2 PHY during probe as well
      commit: bc148def8924e43245c353c52ced47079a5026da

Best regards,
-- 
~Vinod



