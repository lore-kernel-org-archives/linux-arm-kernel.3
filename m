Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE720CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 14:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mS0vWEZVIqHMvdYHxtl/gPz72taL4dArTwSs3iG1N4=; b=A+sNn11l+gTK/xgtB97qmx+D4m
	H0dhj6FxWIPayxip/v0CVpxMtw4/xCbL3KhJbFqghrk1ec5ZEhS70HVVEfRMSOFC13SEHwnB6lJs/
	NQvsKHh6EnXRFBQYCw5gZadiK+EotrQ+6N3t7wnQeLIAwWneIWZjNNDspYoEafUTBPehJX6sGhhnY
	yzrOFxy/C7ohWqdaa/5RhaZ1YRqDnPODFtQPrpITFcrDnkhmpbT5sloHU33PdwWbVrbVKuq3bOx8n
	eQPwyl2tn3RakMxpavpFBCgo5nlH1083BEtyq6teQ3zWFcqu+Wukj6Wqgcvp0Ck2w3hJ0ynkJ3KlG
	5y6tSSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLM09-00000006eFH-3Wzv;
	Fri, 08 May 2026 14:16:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLM08-00000006eEi-1FY8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 14:16:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 61F52600AE;
	Fri,  8 May 2026 14:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4531FC2BCB0;
	Fri,  8 May 2026 14:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778249783;
	bh=0mPM2x5yjFYiozh6QP24TiAE+7o6BbL/98CcdObaOsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uL5EkSyBEoLZMXFNWFH2h4PDeQC1iVaVfb48l4K6Pw+TWcnf5BTphG597YLBXsxx0
	 90KJX39EdMvIHgf66iNrnxupkrWQpKkVlYAUC+qdRL77BoXzh6kEcV5nJRUyH0MOVx
	 oEO6gUnjwojCEzqPagFywsPdPfS9YROlIMCcYE1tHgZrHOgkbQXIlr1liITnnMo6WN
	 ineRCvsa+vRdcy4lFpqLRq144y8Sw/cAUvG8g5zIaEP4kTRgZrGYMUVhu9f+GAie1s
	 t4I70GamTY+Xsuy6BGwaxPBKPqk1h7R+aO16qIGNi8bj8dW4mT1NlW0ZcMHxy1tGht
	 5yHq5iD+uPcew==
From: Chen-Yu Tsai <wens@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Andre Przywara <andre.przywara@arm.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260506-h616-t113s-hstimer-v4-0-591d425863d6@mmpsystems.pl>
References: <20260506-h616-t113s-hstimer-v4-0-591d425863d6@mmpsystems.pl>
Subject: Re: (subset) [PATCH v4 0/4] Add hstimer support for H616 and
 T113-S3
Message-Id: <177824977994.59995.8659881692173986596.b4-ty@kernel.org>
Date: Fri, 08 May 2026 22:16:19 +0800
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

On Wed, 06 May 2026 17:10:25 +0200, Michal Piekos wrote:
> Add support for Allwinner D1 high speed timer in sun5i hstimer driver
> and describe corresponding nodes in dts for H616 and T113-S3 SoC's.
> 
> D1 and H616 uses same model as existing driver except register shift
> compared to older variants.
> 
> Added register layout abstraction in the driver, extended the binding
> with new compatibles and wired up dts nodes for T113-S3 and H616 which
> uses D1 as fallback compatible.
> 
> [...]

Applied to sunxi/dt-for-7.2 in local tree, thanks!

[3/4] arm: dts: allwinner: d1s-t113: add hstimer node
      commit: 7c86694a7b8c9a0b2e29b312b21fcaf61d54b474
[4/4] arm64: dts: allwinner: h616: add hstimer node
      commit: fee10a33d08ae73c87a87d464f29198b6de687d0

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


