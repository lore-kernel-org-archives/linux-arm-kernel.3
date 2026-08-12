Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E8DC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 12:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7YkQ+Bc7EQX0qDaijrFEUTuOpQfKm59tZjQohvjtGA=; b=YTSe4fylyGtphdIBqEpaajKVNn
	MgbT4jfjpsMWgag9ep2qXwbE34uodrxBe+0jpo/kImafbJaKX9csmbqY+MWuok+L6+6xAKT80kWsx
	jZKFyxKzjMnAuwLH0tBEWPA0iZKVlQsEY30U52vTg6IObT2nl3myDkE2NOGiPBRwDkB5Ox1x7I+o3
	wmhqzs+ejVnNzXSIRtsUNrTHMViyfGbZ3XuwTkEwofvlBznpy3+y35ycOZuO/b/ER8MXC3fqEn2vF
	Ag/PfC5JKzI7vF4/DdkA5fklAwFf7Mm/y2rPq4QqoyTtMD3qASEIcnDEhugZlBzVzuRn9t1Cc1SBx
	oKXFyFgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu80T-0000000GBZ3-1teu;
	Wed, 12 Aug 2026 12:24:29 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu80Q-0000000GBXx-49al
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 12:24:28 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6a09571dd5cso96580a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 05:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786537464; cv=none;
        d=google.com; s=arc-20260327;
        b=ba8sMrjti0T0iBgK0lKhovJAOS6AptcBEfQCSNdXI6dc1cjGumKDr0lLR184F7Krms
         PcmQzJxmBMI8FwbqNXxMYy/lkhYqmEzm+xqFoSUe2v+D9zWerdPIIez1Ou6MMNJKCVjK
         v2dAaYhr+UuenRsaKqAYNfmoJsF3zuEuW279sO40hGrfWocf5wHo9EkVKyqDG+LH6DkJ
         JrBjMg2/7ejwKwkk11qS643YW++MjSpiuDZiYGZFDl7fy3iIcpOjAv3wDaRdB1s3JElZ
         +1CR3U1B9kyU+jo3ruocC3otfKsk7k2VbDGQwCtQbCLi45hij5RlSXIk7ps132l1/wb5
         IlSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k7YkQ+Bc7EQX0qDaijrFEUTuOpQfKm59tZjQohvjtGA=;
        fh=X3dmO5gmvDISTRxRQp7UOvjLZyxZswZoYb9PnxsS0pw=;
        b=gAzaxIucfr37DE39VSpJDi+znWmajOevUCSWJWgyUlRgKGpPR3VSqj2ROpm3cQTEev
         dn5Fz4yEYfmhqYTl3+lB2pv7y1qjsR6eWm9uF7zCmv+IVZXsAhMfIEa490lLZgGFYUhg
         3HaksXmPUNW1OBuqg3co1OaG/sWha43x1xwZHW4MqI//ex+SdbjCkH1536+a2wKiCKx4
         6AUxr7W6EiKUuJFcKD+eziY5rQ/4MRFhy/QW/qP6uEikIcUKJuwSuuugFO/MZHuguwvS
         pMpPkRsUhEsgf2CA+oVKtJxMzULVDeGXGnGhlIFTVRVT3nN5DMkFgzMDl24yKqfCeI8J
         4C1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786537464; x=1787142264; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k7YkQ+Bc7EQX0qDaijrFEUTuOpQfKm59tZjQohvjtGA=;
        b=PtvKqZnb9o8XoDZNysagzjOYIWXibMhv0p1q6ZCe54aXLkyLEWfl3MJRKR/rWajWud
         V3zKxfeR3g4w+JLAE0PC4X6J9hpM71ORWS5S9TGUcdV28WS/MYD+Rwj2yGjkcXf76Ave
         LSZyvp5ywjyUSqaqTCIw43dCHkTq0vZ3o1hFg3HUa5PRkSBNMZ8q9wTviYI2W8y+6h1l
         YxzhzcPqQL7j2rQts9mEEpJlAOXRO8l/U87Gmy4spSmWeCJGAO6qigNOM3z+Dm4jpXq6
         nJ4veKYGYrsZqnrKmFXFIlJ0q8iwEmESDSwqYcYWaWd5UdBT0ldKarcluJ//MQQJwwiu
         O6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786537464; x=1787142264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7YkQ+Bc7EQX0qDaijrFEUTuOpQfKm59tZjQohvjtGA=;
        b=HSnU06+1d119zcOxLbRLXxo7TP3J0bmq5ibL0+A3NQM5Pz7NnO9S3AW9DsL17xN71a
         kMZl170irJ+C1UG8sXVNuMtV7tjWkrqZ5HEfbG/wB+tgxzyxbA5MWP7vR2QakvjxEYLX
         zu7lM1IN9ED6Z7+mcPSBOmiDobYJvzyn6Nx/HCV58ZBqquetI/5dBCyhXwR+IJ/q38dW
         RZgzn0hMIYaMojQmTMT9nAc+OHh0iGvFonlklwbUz+hcu9aFdnscG5aySjSisc7/rWb3
         gaHfpykTy+EmZR1l9FfN4xh+by3A7BLkNmaqGEVWwoHNfeBkQiUreb8VVJdREpCpukWo
         +Zxw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5AZ/Z1lzSGvJh6lq5qI3GK1eeY3LjRRuohHnbp/moGyBm38g5WJEpA4FBAwRT8ZmWtTwfsIIhwmYrpHdU2Syj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8Yrv3sXwBhHoOZrXmid6h1gAT6aCRr54Ysax7XcmmDA1/vGDL
	g1BLXTyi4pir4bZlQhSxH3joYuBP/zT/4kE25GYWTfTTSVLkdhdPQdA43X0uBLiVlFzHCTUGGYd
	ekVlEV+x6afD8VdSKkb10ADyiFvaTTkQ=
X-Gm-Gg: AR+sD11G8GJbqzYpUTJDFkjLD4avUl6Ra9+3GfYY/oowR6REz2hwNzQHwXhP6TkewtA
	LzeqBXTbKo1+G1rZ+rsNnjg4zuA+nlvyUN3HozQGIassBAr89OJc40SKF8ghG4hSs3P0O1mqUt6
	4gc2Q/WJ/SVUmVfGlamYOmQlTcLK4z5XOPzEWvF65nYiycTZn9C8U0zMh33pPD6beJbK4bqEu9s
	hsHb5WLl0OHCEcLhRC6oXq+vmPVBinwDxtskUtYL8rSQyWoi1tPBz+1wvN20Hfwz00pv4JmuBS+
	v6XXN/DMQnmXY1FbA6U0iz6raiNlYiZGZrIKSycLurj/Wg==
X-Received: by 2002:a05:6402:5515:b0:6a3:72bc:7bca with SMTP id
 4fb4d7f45d1cf-6a375f517b5mr853527a12.3.1786537463007; Wed, 12 Aug 2026
 05:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
 <20260810-dcphy-rx-v1-v3-1-a2d25c29adfc@gmail.com> <20260812-refreshing-rampant-gecko-b38ef9@quoll>
In-Reply-To: <20260812-refreshing-rampant-gecko-b38ef9@quoll>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Wed, 12 Aug 2026 20:24:11 +0800
X-Gm-Features: AUfX_mz6P0tpS0X_aTP21idLy0_k0ZDj4Fov-0axes74Vj1me73dhQSiZbhCnY0
Message-ID: <CAPwA33KM-sWkPVrP1h+swLinvrCZHzxPeS7h25KEO87Q_6WZuA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_052427_049451_E719EBF9 
X-CRM114-Status: GOOD (  29.71  )
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

Thanks for the review.

> I read above, but still do not get why TYPE_DPHY/CPHY is not enough.
> Isn't DPHY implying it is DSI?

I see your point, and I did not explain this clearly enough in the previous
version.

D-PHY only describes the electrical layer, and both MIPI DSI and MIPI CSI-2
can run on top of it. A CSI-2 receiver's PHY is a D-PHY just as much as a
DSI transmitter's is, so PHY_TYPE_DPHY alone does not tell us which one the
consumer is asking for.

That is the problem here. The RK3588 DC-PHY exposes both a transmitter and
a receiver from a single PHY block, which can be used by two independent
consumers at the same time. This is not a theoretical concern: on this
board a DSI panel is scanning out while the same PHY receives CSI-2 frames
from a camera. With only the electrical layer to identify the PHY, both
consumers would end up with the same phandle cell:

dsi@fde20000 {
phys =3D <&mipidcphy0 PHY_TYPE_DPHY>; /* wants the TX */
};

csi2@fdd10000 {
phys =3D <&mipidcphy0 PHY_TYPE_DPHY>; /* wants the RX */
};

There is then nothing in .of_xlate() to distinguish the two requests.

I will make this clearer in the v4 commit message and include the example
above so that the reasoning is easier to follow.

For context, v2 described the direction with a Rockchip-private
RK_DCPHY_DIR_* enum. Michael Riesch suggested using generic constants
instead [1], and Vinod agreed [2].

[1] https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabor=
a.com
[2] https://lore.kernel.org/r/anSuxfeitSqmSHNr@vaman

> Your tag goes the last.

Sure, I will fix this in v4. The Signed-off-by tag will come last, and I
will check the whole series again.

> Two simple defines needed Claude.

Yes, I agree that these two defines themselves are simple and do not really
need AI assistance.

I added the Assisted-by tag because I used AI during the development of the
series as a whole, including cross-checking the code, writing additional
test cases, and looking up the relevant sections of the TRM. (I checked the
corresponding sections in the TRM myself, reviewed the test cases, and
re-ran them on the hardware before sending the series.)

I also checked the current mainline guidance in
Documentation/process/submitting-patches.rst and
Documentation/process/coding-assistants.rst. Since I was not sure how much
AI involvement should warrant tagging individual patches, I chose to mark
the whole series consistently.

That said, I am happy to drop the tag from this patch in v4 if you prefer -
I wrote these two lines myself.

Thanks,
Jason


Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=8812=
=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:51=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Mon, Aug 10, 2026 at 08:10:09PM +0800, Jason Yang wrote:
> > MIPI D-PHY and C-PHY blocks are increasingly direction-agnostic: the
> > same PHY IP can drive a MIPI DSI display or receive from a MIPI CSI-2
> > camera, and combo blocks like the Samsung IP on RK3588 expose both
> > directions to independent consumers at the same time. A binding that
> > needs to tell the two consumers apart has nothing generic to reach
> > for: most constants in this header name a protocol (PHY_TYPE_USB3,
> > PHY_TYPE_DP, ...), while the MIPI entries name only the electrical
> > layer.
> >
> > Add PHY_TYPE_DSI and PHY_TYPE_CSI to select a PHY by the MIPI
> > protocol it speaks, which also implies the direction. They do not
> > replace PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice
> > where the cell selects the electrical layer. First user is the
> > Rockchip RK3588 MIPI DC-PHY binding.
>
> I read above, but still do not get why TYPE_DPHY/CPHY is not enough.
> Isn't DPHY implying it is DSI?
>
> >
> > Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> > Signed-off-by: Jason Yang <jason98166@gmail.com>
>
> Your tag goes the last.
>
> > Assisted-by: Claude:claude-fable-5
>
> Two simple defines needed Claude. Great, that probably makes AI
> conglomerates very happy that we do not type even two lines anymore and
> need their resource-hungry data centers to do that for us.
>
> Best regards,
> Krzysztof
>

