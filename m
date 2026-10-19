Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715A6CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZGPcgD9AFqKQnqdPo2/PO6pxJ4WnzRDZW0BsKuEGoY=; b=J0Q52nm89JuUkRRLe0BGq9cit3
	pdZWJs+8W/f2Vp4zo8ZQ6wd2tnYOkkCTBFNrkT4kO1eVzLKd1+baP0FvNjPfpdf3Bgm3PO1ho/16y
	axcmBTtldgMcQsrLezsR/TJa1o16XnxK+STd10VrmkdO9oj4nXFQWI2jnDcyuhzhcRrI8c/JM+aCx
	BC9WWctjG8CLXRsLMMuoM3xILPd1TU5tAvy6mxTvML0EDgkZgn6sFcnIpcisa8RmT28L6GO+4/WcD
	1mv0GG1U9ELIMt/jkxgd6grcMbNqO/U3tPwjHidw7evvv0srrcvTYXcLBdWzoWGWuDBDQpb/AoXLh
	1KlOi/cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIj5r-00000006uIL-09Yg;
	Mon, 19 Oct 2026 08:51:43 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIj5m-00000006uGA-21We
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:51:42 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6acbaec0d70so259930a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 01:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792399897; cv=none;
        d=google.com; s=arc-20260327;
        b=Z51Rja09P7Veq1ArLMtQNMstLTXvPhZVWJTfSfwdOWew+t2IMK7WDhenEnAd4Tqd96
         XCmoxwo1KvrTfAdiyjgyMCBN4sH9ZTo1NLmyScYB71AMvQx9GrymcgS9v2hujORT3M5L
         W9xGRcTKxlFydS9UWFpSNv7rnY+ndxhdwZC4ymOmgAiGTOd7yoCCvBG5Z/GJIn2FQVxK
         8ZbkvadGFmf35e19hK9OKlZzFOkH5/0aaU+NVeTIYS0QixumPPg3UNqH++kwBGwKAaJv
         E0kmNcGA7pnoqThY31ffFK+v38L5KIBIfkUyfIyCz8WRCXyVEP2sVhjeFqnINivGqySw
         qNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YZGPcgD9AFqKQnqdPo2/PO6pxJ4WnzRDZW0BsKuEGoY=;
        fh=0ZelLD0Lh6u8MQXcQhu6OTTqGWGE3vnWQDyJCWuIF4Q=;
        b=lKvUl0Y5JBZdehWFsF93maw2nlgmG8WTnzy/L/RYbnkUEoD2O5Cp7LNbq0Oxuu153j
         4nAbx6wyhaBHNrrq3majDScBSMFGZpLnZgCvZjYQdzCH7HiJy1+BlBQ2UVsT7c9PREaM
         GQBPEisjVMCiRSXy0M4vOAR00Pq4fyOMUnUAgAjX7bg7Kg4SVSwQan1MefMErZHVK2Ww
         C+C/ZvJ/WC/+0iwcgk6itd6MAN9mPeHDOuPB17rKuPsZzD93FaTL8scnliJXJnZvBhA7
         YeWu1PndSjLbv421fkePHoouuz3Cp5T5ccccOj9ixe0HEi/x0Kxd8pzSldwphpEyK5YT
         yeJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792399897; x=1793004697; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZGPcgD9AFqKQnqdPo2/PO6pxJ4WnzRDZW0BsKuEGoY=;
        b=MIs+xPYl67x0OCK2qjAYAJ7ZI1SAMpVWt220Ux0OLkKeac1s01Q+MsUi20ga090WjE
         4YYjWNAf5esA8q4k9enb3+t2qbhBzOW/vlrFnKQXUYW/YbdVpl391MKdaHBRMy7m1yVp
         6C5Jj944Z+xTFPlGcRKg3fMuNg0dFw2N+szGHZTKqzmN/0EGnQ3h5ABUAQcff32QSZre
         HjJk8+gLBOGFlXO/CaXNaLii10kkdyT3XePPrnMaW75icy9h42GCRAmYKTboyJVmuvA7
         +xAcgblDEPTbGWiVRJyxXRXXG0JYTvkzWgE2DRXz7GU6bFAIgS5skctak98Vjj1jEArE
         PYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792399897; x=1793004697;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YZGPcgD9AFqKQnqdPo2/PO6pxJ4WnzRDZW0BsKuEGoY=;
        b=I/zvRQ81BGzRB1aiU8ukDXH9dQnG5hgKMHOYH5SEyuhWRy0EZkSU9wY1+B7DrLWHAL
         aROJzFeqsAx45l+STLFzbwdwDQSp1CrjvhldTT4CpB7e9IZxggiWGLsHLzmxUaYPPRph
         0k+yVjukFuLLo90/ekd5UFxe3Y8Yk1vDRPNC5GGAVyid9lM6AICQQPV3Ac8yi1awVU62
         7FADRYw2JdgYzeG+66eLr3pAlzvuUNWjI69cmI9U1B8LdCrRyIDWGj3YaH/t5WVKHuzu
         1iZ8u7W7kyGBNecQ+9pKiyq60FAXOq/aGOfrY7+4lXIViVQweARvJJLoek9QH5a2n+qS
         uCqQ==
X-Forwarded-Encrypted: i=1; AKwUvByRPxTQk4uFH1Kwr+EQspfaBSHtr1BLMELMuKQDXCPJNQxkr+ygg7uJrdQdBSsWpCsH3j/m6oBvhhnlY6F09Zsn@lists.infradead.org
X-Gm-Message-State: AFq9FYKGPx+E7HtkwFplT5duAlROLr/qwVAaXiar2voGRSVsoitW1cMM
	TKNhAv4FcRKe+xdRGL+UF97kPr3PrkyFt3IJL7tUCDB+rMfWaiDE3wtQh43zQmDhSOoinDg7D+r
	jiG0TSOuE5HdIyJwqO10gF7A97r4yG2g=
X-Gm-Gg: AYBFou3r8gniYAXNBhZOokhmBXqC/4k0xs5rPNAiprzGZzEw+vUR4Nl/TZYkugcamaD
	0SnZlYKuskjVu7Y2Vcg9Y0THONqpYC8psXrf9kKKe+i2B51/wY/PrO/8b13tRk9Oc46c/A0ukob
	D3RASpk3QfzJoeyrEEEKFgd1+ADC5w8FLxKU3c0G21goD0c6UKQYSNq12wjPDdBEzQC7fVk6WPC
	iCC4fjXhrggnmObj5Vc70VDiaHVWggdH2yObRgeXW/tnH6vxOGRfDcSM1zmKp3GYmQ3JBszywkU
	6XZON3W1X9fWoanD+MBvJBiLNLDkFx/dXapXQEOHkkNBTN4WH1qB0w==
X-Received: by 2002:aa7:cd16:0:b0:6b1:a509:8a2 with SMTP id
 4fb4d7f45d1cf-6b3a8153c70mr3342735a12.2.1792399896018; Mon, 19 Oct 2026
 01:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com> <f337f41f-2ada-4958-b0f9-379e78e96a3d@linaro.org>
In-Reply-To: <f337f41f-2ada-4958-b0f9-379e78e96a3d@linaro.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Mon, 19 Oct 2026 16:51:23 +0800
X-Gm-Features: AclHuK_WAI6-16edIPrAFWjpLBUVloumDqFsNS60JoizZzHWBKP6V-AdFc5lP64
Message-ID: <CAPwA33KFY0avDH-F_5w01vqWu=RK=nXZ=za-Do5Zm3S8CPtGgA@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_015140_115076_300E4995 
X-CRM114-Status: GOOD (  12.25  )
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

Hi Bryan,

> Two consumers use them - which them ? Two consumers use the receivers at
> the same time ?

> Its minor but instead of "them" define what the them is.
> The second cell, if present
>
> -> you want to make clear it is optional.

I will check my description and make sure there is nothing misleading.

> Not really related to this patch but how do you envision that
> requirement being enforced, per driver ?

The transmitter and the receiver of this PHY share the bias block, and
the TRM explicitly does not allow them to run in different modes. Since
this is part of this PHY's spec, the check is done in this driver's
xlate for now.

Best regards
Jason

