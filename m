Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9EDD5E147
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUTRSMTXrdg5Zyft5yF6+XKivEJnOQQBelPLhQbyq08=; b=kSpTFnWRtbKbCl+5+34ch1mudh
	3DGxfU5ic1rw80Dz8qxIJNOeM8PFhjeWZvULadaSXXwVtCx8/flVhkSQ7c/4Py168yyzMD7e/VNoD
	KHeK+tlzGQuxA+elvYOe2BSMvK1DwC1JBo6wTMuU/LjiB1Ig5B5/ISwMH4Bl+bkv7UaXldbzY1siu
	e/u2Tm462gIp1rTpsIdyJD/qtcNraY0cTCijCtHK4OY/dzEXb/5f6h3823EX1w1AEXJFpcF9w4e50
	zpmbEwn1XAiZdULKOv4gVy+UnETp0mrlvt1CJ0ydGh9nUkZNWoVKaUdCN2HtGBeYgncX6sQ2JX/hF
	39Gx8LZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9JzV-00000009iGz-3env;
	Fri, 08 Nov 2024 08:05:13 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9JxJ-00000009hrd-3EOY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 08:02:59 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso29880861fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 00:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731052975; x=1731657775; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUTRSMTXrdg5Zyft5yF6+XKivEJnOQQBelPLhQbyq08=;
        b=f7bKrIWlM0k3nl1jkkHXaE0qtKVJsdfYWnjT6YVNgJ5Q9Fe7S8Jw4Lhq4hU4AHrWt8
         6wX96TegcGmpi+AEGKYMeiz1wZ5pXC3pcYsbHT+3AasLXtlMC/Au5IaMrw5BCROxmcTY
         5kGzX6ViJVvcKQmVs1Nt8I41mQPbVLNJ9SOsSRPDPtTI+gp739DHEFzuMXvLQKWmayr6
         1qSNCXSQuxgharniQjQJhsgKVA/U7N2+J4KdB+aKPyyDm+DHzq/ia7SXFFuUIZ8TccxZ
         SaqB/PO9iN8EVmWChMew2VXGHIB2+yVZHtgW9KqqiXYBp1bFnc3lcoQuTs12QXceeWqg
         WCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731052975; x=1731657775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUTRSMTXrdg5Zyft5yF6+XKivEJnOQQBelPLhQbyq08=;
        b=Zj3p6mkIUvHBdVOHKnFkp3cTRPk7cUz1na6QevWo1grM60+pIURC9hbORrKkqLVUy7
         aQ/Cc3a6FvgeIFHaylsFqxFyKb0h2l2U0X4LbJvxHUdxIMjpywQ4+LIV9BHpXHqVhtv3
         Zrtj7d5uXMRZrAEwv/fPuVtSBYjKCnkPrkHLsc2/0ajaVsCycrFlAKpZi/ogpsZw3SRO
         by9VXbGSpFr75prUSYmmeH2ESg+dTfMN8+0QPznbevh+Qm7KN1oAnlgK8j8VzxHz3cS0
         nzcBWVS6tUqwvqgyB7hbhPXWf5vXmLuxe+itiJO6oBUzvvcFXr4mswJsYAD2xct3W719
         x3Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVTLrjDiBQ5tv9HwDbSZpcTlMUNEaNeMH18cr2jyFUdXug5NRWesy45qegeASUP04rnJTCO1Y6gu8fNrZ+XqT1R@lists.infradead.org
X-Gm-Message-State: AOJu0YynSQ3DNaSGiNGGc9ApFvnFIdWn1SWRSNWDNHLy2bXOf45ne/JO
	rzixOhSOkbvJjryMMTITt9M3ZVVLnSxdTcoDiKKIyx8oiSr4WCvL3HVp840HauaQQT9tApbtu78
	tiJgA5NawNOgor9LW40N7xaqUL5P2bp41AG4rmw==
X-Google-Smtp-Source: AGHT+IHU/p5ucmbmja2ZUVCS8fngsFc6zkmCp3xSAKppUYK59btpa33qjaOf6+2FVOvM6vBZDak2yrRRRPxlKbfHz7A=
X-Received: by 2002:a2e:9b96:0:b0:2fb:3881:35d5 with SMTP id
 38308e7fff4ca-2ff202ac3ebmr11214621fa.35.1731052975268; Fri, 08 Nov 2024
 00:02:55 -0800 (PST)
MIME-Version: 1.0
References: <20241104194437.327430-1-robh@kernel.org>
In-Reply-To: <20241104194437.327430-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:02:44 +0100
Message-ID: <CACRpkdbiAKX-o3GYqVP5bz_o-GhbvgHLkSDM4ZMXgMMteaoKTg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use of_property_present() for non-boolean properties
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_000257_854825_7ADC4394 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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

On Mon, Nov 4, 2024 at 8:44=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:

> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Makes perfect sense.
Patch applied!

Yours,
Linus Walleij

