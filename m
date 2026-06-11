Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD7CCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tm5i8T8VZHAsFgDZmgdDx63OEi2Pnzx5WTlvbhLyDEY=; b=cG6QloGbJzAfPAQaOdp6EgRJc/
	k5H10anH9UwAlmru6evQduixEYq3MTms2DscpoPO2Kw90zW6ipWSWA15ky8o/SxTm+ptU5Ipt/m6G
	HfyIgJ+JkJ3sXUITsfoIjPDq9i1clDMPuh93Gq3gQyh3Rd8FSHdZkSsN4FKG3zyOIvfEG04UolNHO
	3+rZD7TqgJMe6vrmNI5G/gIlWrxCjE6mG1McrO7Nnp/61Kq0YpdLOCf25ZgpJ4NNo2mvpzYoB0GTX
	6TEwzftb4OvPqxxeNkrC4V3bb957R4PQLELxdAbuyqz//KPP2WZ+shkBklLJR9Nxxzp2o/nMetVSy
	RULIGicg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXftg-00000009Z0t-449w;
	Thu, 11 Jun 2026 13:56:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXftg-00000009Z0n-2HCc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:56:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B7C33600AA;
	Thu, 11 Jun 2026 13:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789761F00893;
	Thu, 11 Jun 2026 13:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781186199;
	bh=Tm5i8T8VZHAsFgDZmgdDx63OEi2Pnzx5WTlvbhLyDEY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NwftpBK5CQsrefCUB/T7Xk7OemkFlvqXsHpPq927dHUF7OJ0nwVGSlO9Gy8oeGDoj
	 SaLxy8dEs/2skmWCirbLljexcSYRhqfr0IppnxanbAc2wXh7m4mpa1iUXJGjX7vaXU
	 NjIbYIBD9W2bGxRdp+F2Ae2Y/Wn3Hh5xtftUGKrRcoiI9vGwHjNrkGV6Ymi9WZut8Z
	 0dhBKq0Ws0g6bXU0yuCLWoiQm3nO0XpmSAAydBKihgiq2bXHLEtDBgeT7AKcTqR+OG
	 I7z+wzMwZyV0EH+P3OW/fjBUGVAwdi50d7xJJQGP0N2B1CyjtTGbSlSd+2wBTrUzlF
	 sAv/TuyPpayjw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260327113006.3135663-1-andre.przywara@arm.com>
References: <20260327113006.3135663-1-andre.przywara@arm.com>
Subject: Re: (subset) [PATCH v2 0/3] pinctrl: sunxi: a523: fix GPIO IRQ
 operation
Message-Id: <178118619718.1357770.10179454069567879597.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 21:56:37 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Fri, 27 Mar 2026 11:30:03 +0000, Andre Przywara wrote:
> this is the minimal fix version for the GPIO IRQ operation on the
> Allwinner A523/A527/T527 SoCs. SD card detection is broken as a result,
> which is a major annoyance. Those patches here fix that problem, and
> should go into v7.0 still, if possible.
> I dropped the more involved fixes from v1, the risk for regressions is
> now very low:
> - The quirk flag is just dropped from the A523, not the other SoCs. I
>   confirmed this again with an experiment, for both the primary and
>   secondary pincontroller. This avoids fixing the workaround code for
>   now, which is more involved, but for now unneeded.
> - The DT patch just adds the missing interrupt. The IRQ association was
>   always wrong and never worked, so this can't make it possibly worse.
> Together those two patches (plus the required binding change) fix the
> problem, I would appreciate if this could be taken ASAP, into v7.0 still.
> The generic pinctrl code is now untouched, which makes this also much
> easier to backport, and drops the dependencies on other v7.0-rc fixes.
> 
> [...]

Applied to sunxi/dt-for-7.2 in sunxi, thanks!

[3/3] arm64: dts: allwinner: a523: Add missing GPIO interrupt
      https://git.kernel.org/sunxi/linux/c/6b81aa0c8a4f

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


