Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D39CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1X6Ak1b5YnhMEpM33yKsTItIXYeyxlIqpx2Kl/jIFo=; b=cf/1Z1+6/m1sfffrdNq8sJPbgr
	bX3cdpQLor654SRo4Rf1OjuanpmX8jds8ZuFt6dobVnp6nd0DtZ6QPvzmUi4faaS5Y9yFOJbdkIc9
	oBno3/Hw2x+GVJcXXjAU1nkBtq5Ff4WBXKzfortB2LWsmXdFT8hq0LHX1PlDnQyqBUUCGITUD7AsN
	0p2qP7RwFgEKiZ2U4lGAi8ztU3B6s/BosrAEew9su6ut1XhMPUtJhPFsBKFVlxy/yK2uWOv+DzIgW
	xq3mzkf83o8rEZf9s1Gp8YiYLo3c8btRUM4oGOplB8GrqCr5DBWnS5yVHNWKbHxh58PH+M2d/roCS
	6I8/Rh2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiWf-00000006qvq-3mgQ;
	Mon, 19 Oct 2026 08:15:21 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiWd-00000006quu-3int
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:15:21 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-66fbdb0a5a7so245855d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 01:15:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792397718; cv=none;
        d=google.com; s=arc-20260327;
        b=dxSSDX8xHh/aX2wbq9HHMjltp92h91KpVPmiSb734u3Mkt0JVjVEtCZI8gYgKVbufk
         NuJ8JwvnDhfVT7Rn+f4r84KP9izx/IWX9HIULPc/qY+RvJFsYcjBjX07vEgtX1+Mh88/
         9x0mxENqgAPH6F0fs2DDhKN/uvUcNVkFH0lkFRQSfqrFLOWaYfg0ce7dMas//fdA+i2Y
         2TycHQn7p3ow5gXaVdYTM805fNbvFWLlc3AmTtq1yaHEpFwvKb0CxPB1xlOQpiYMxLV2
         dSsvu3dhmiJhBr3RqQ6B5EeXnujUNaTToz2BbWAG34U2gjpKqAxE5+OFxQCKGXba5V7F
         6xGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U1X6Ak1b5YnhMEpM33yKsTItIXYeyxlIqpx2Kl/jIFo=;
        fh=YwIzgkcU2TQGccn9+O/ommb7HsFgFbTOxJO23U4isFg=;
        b=UKTIK6Akje7e41ylEyFzV8FzFbnJ7vw1HmPN/yKrdhtqT4JLFwpdcW+wxSgKqnqq1r
         /Wg0P8PmvgXH8+l2VPtU0a9l2pWsjxR3ASX5RatfJsNE/l6gW6xLeH/r0VPf1l6mz962
         yvKVGc1iwKZw9+gvaXh5LsdqPZHtt4joWnA1efyVBWd8o1BwB63yhyp6rzUUe/390D0n
         aok1UrKahRP9UbOpVO49baS6ykIrAgPzD9ydglCSIEKqm0yxom5vkEc8gUZOXY85v/1A
         E8Z85qfPyv4/mlMagKVnhBA2SrDRaMnMRigCey73fVFfMsfGWlouUuxBh2MczJyrgKYx
         VKEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792397718; x=1793002518; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1X6Ak1b5YnhMEpM33yKsTItIXYeyxlIqpx2Kl/jIFo=;
        b=fsm5SSCw8bVv1e+oL1c+Fo3bs0i163BPOjWmRbkPN/IZIzB2pkAzAkPi71WXX9TXkD
         uqf6Vwai4N+nwfLudyrupJozFv62N6pGDuXrCP0BZGBlT7e5tWRwRcAdmaObfcOWdGRL
         lSd4tw6/ywrL4IyOZgY+6vlE5W5qqMkae13aoXt913wUeUlxWuk8eo6PkCMNvuzKYQt6
         gms1b5veaCWQaDpnbmpv73r/VEJtgwwvSVXaKejaqwvNryqR/wncHANYx8Bbqr8hXMtt
         hSgOI18OxdxdH/fh4HtJeGZZ+7V0BdIFywiDHnyCD4c8ctcukB1EQfQwH380r5DLroay
         QlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397718; x=1793002518;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U1X6Ak1b5YnhMEpM33yKsTItIXYeyxlIqpx2Kl/jIFo=;
        b=hJl/lOHHPO4eb11k4fvfrmMkpumrfKRA8JIYULtrVKIeaXlNwDt8w/fAOJuThMaFLc
         ZOQsT4sOjatqmNWrlzcFtQAYwJmdfMWPpYMEn8WLJIFyfbLcTMYjyHp+2WDsB9OL5jmx
         ZwttISIyJe1QbXBiuqySfUsFWQtKnmSwTgobFSD/Es0wiwv5b9ROSEpvbZHbD5tH+/lg
         PibfP0nYtoJDgAYWBhMFpWNX6rPyrVBtu2cn7GTNHGPGbe0ZUlsKQ5PdbD5f9q/rPSA/
         z8Ug4DgzDfHutuNjMJD8ceKdbHDG+vCli0svO/gl/asP3jNZL5cpgextkXRSj6GKviiA
         Lq1g==
X-Forwarded-Encrypted: i=1; AKwUvBzSEbhz4io6PGokSBuWmnx6oKcwYu4mEDorPjPZ6UJ3jZ8vQv9bmZmYabUsxbkyXTGPn5KvS70E3QJ475Ze8zh/@lists.infradead.org
X-Gm-Message-State: AFq9FYL4g8+xzo8hOw6ttfwirN++eJAKqAuWD5SVi/vSRhEXIMYZNDW7
	8X4BOT8gTxq556ZxmEAFil/WFLqfNp6kh3vKVb9sKmuuQ4w66bujhCGKAjK1Al2+BNLHQb1sKgC
	NB5Ij7mjS2wdpAbXBGNB3I7i1D8J+FoM=
X-Gm-Gg: AYBFou0g9JMoRaW9tS39nVIo2eAn+ia4NszAAy0iZqHBCnnJjWFL0gDp4/3f+pd4Mxy
	iYgmzd5D/V+2qz5Yll1HWmwxoQqQ+Ur4YL43JwWWeS5BMgb2wgslAxfVBkJikWayuKRODEx1z+1
	BKVpW+J6s7OD50O/qpAbj6ciKMYHX/EEmmd5jEjuFBloNAPGd9cx1LP3AlL7O5QN4SVzpJWZqfa
	QuaiNsRoKUBDxNHmNNwUPi8fy8za9wPiuAHUPDz10etoXupUBNe/aND6LbhIQ1IdhUsFC2osWTg
	GCEaPtj7m53/6EcnZ3t4efaPlWRCen1oY7pI2qwy48is774cRh5Q+Q==
X-Received: by 2002:a05:690c:686:b0:853:bc96:d834 with SMTP id
 00721157ae682-8b0f2149354mr41098877b3.2.1792397717882; Mon, 19 Oct 2026
 01:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com> <20261016140115.GA1798470-robh@kernel.org>
 <20261017-gainful-goldfish-of-climate-bef863@quoll>
In-Reply-To: <20261017-gainful-goldfish-of-climate-bef863@quoll>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Mon, 19 Oct 2026 16:15:03 +0800
X-Gm-Features: AclHuK9_kQhXB8k-ejh4iETHQ_pbinYeRno2QSundTfXAhMLFdEsJrbL5fs5ZiY
Message-ID: <CAPwA33+bR1BF9KeA9my07Yz7gXW7TXq8EPhwQ4GvHMSFDk+uWw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_011519_937663_67F28139 
X-CRM114-Status: GOOD (  15.72  )
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

Hi Krzysztof, Rob,

> Existing OS should ignore surplus cell if the driver is coded properly.
> Same as adding new properties or new front-compatible.  The question is
> how the existing driver behaves?

As you pointed out on 5/8, the xlate checks args_count != 1. The DC-PHY
driver was merged in v6.15, so every kernel since 6.15 fails on a second cell.

1. Keep the second cell. Add the patch as follows:

- if (args->args_count != 1) {
+ if (args->args_count < 1) {
    dev_err(dev, "invalid number of arguments\n");
    return ERR_PTR(-EINVAL);
  }

+ if (args->args_count > 1 && args->args[1]) {
+   dev_err(dev, "only the transmitter is supported\n");
+   return ERR_PTR(-EINVAL);
+ }

  With Fixes: and Cc: stable, the stable kernels maintained at that
  time (currently 6.18.y and 7.2.y) keep DSI working with the new
  dts, and the receiver fails cleanly instead of getting the transmitter.
  But EOL kernels (6.15, 6.16, 6.17, 6.19, 7.0, 7.1) stay affected.
  It goes in with the series, since two-cell dts only exist after it.

2. Use a flag in the upper bits of the existing cell, as Rob
    suggested. Existing kernels are not affected, unless a board enables
    the DC-PHY CSI-2 receiver on 7.0 or later without this series.

I will write the impact clearly whichever  approach is selected in
the related commit messages and the cover letter.

I think the cell approach is easier to read and more symmetric in the
long term,
but it breaks more. Which one do you think is better? Thanks.

Best regards,
Jason

