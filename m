Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D61CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 21:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jg+48cepgWrDgUNaKNya1rXBAe0v3PkEajJvFhN8l1Q=; b=dh8Bx27ulMYL0JeEAdeVuPwOte
	g2m3hit8DebNX007JoFGjQpRA++KEsT/FWBRn2maMT1nGcGiN2IGtHilneHmVO0Q6IAIDSTH+IuCa
	dmiMWh1rrCpY8syPBQkOSp3OBO//i8pt+WtuqftmnhqqoPB8Z8HoBez84DbHFl2NW7c5hyXC8rb04
	cIsOIYjDcawIVt+xqOtjzgg8bgrbCCiEXSNyJxx91VjSFT0ZBsj2i6WCwgp3m1AkSsdM4GxFs/X0I
	HFKmTJWCMere9HZ8wyq7YVLbfWWt5GRgA9Bd/URLfOtjXIOfxNsUXZ9Obzg0TyuH9bLyazZwAtulo
	Mxlkdghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDq0b-0000000HBGi-3IMI;
	Mon, 05 Oct 2026 21:14:05 +0000
Received: from mail-ej2-x08.google.com ([2a00:1450:4864:34::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDq0Z-0000000HBFi-2y5t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 21:14:04 +0000
Received: by mail-ej2-x08.google.com with SMTP id a640c23a62f3a-c2e2e238134so151271466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 14:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791234840; cv=none;
        d=google.com; s=arc-20260327;
        b=QHukyGdVniPib4UzKyjcOYJazfybjNGLWbKEWzOMM4vPl4N/88IFW/WEeluaE0zLkl
         nCC1hp1yQPjpmcNv2qUg/c/699nnZ/ct9KzIJhLYy/QuvMj3x+nlp9Gncr9W+WwB1vDU
         nSlkmRnj2htgIqKZExTTwJUUCAP2Po4m33vejUjQsogfRU+OP/qHsZ6o8SUIsJ+aH95m
         TnVEIZO8vJMID4+2QWe8pQyDYPQGp5+u45hPiA2wG65Pa5a9Oscn/fBw9JHP6AOkES0E
         KXWh9zMs8Ucxa+WxdyKfPcCvUKpvzLevDDaoOrovfI/zlTvPesnA3NxkBIsuVaPbmyoT
         jZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jg+48cepgWrDgUNaKNya1rXBAe0v3PkEajJvFhN8l1Q=;
        fh=fAzXEbjkHRbbpcswu0TvpYvh+TW4ERPZBHQjnQ96rDo=;
        b=idfGzieUOjrVlYc+yT2n9u9KJaFr2ZaD5mJ6cvLCnoJBXcHnY8ILkCsBBskP8gnFAp
         xMwxcAf1Vl0qj0qULEU1pqxuWMws2SXtH70NIM9danmDuZwQ1DVdJRq+9vKxAIejhRtm
         lVHUMUsOshEKhSBzgwKPRDsSMgFEBTPmSRgtkf5kc7rcqav4zJDmPgdzn++IHPodi3Bs
         UAWA54GVZcdEaUnr2fr7rifzsHf2/5T+Fc+TZNY9HceY1hKwXSphuK44WXM3TsZG58ol
         ojqmzR94CXtzAWiNxjOz0wpyvNUdEiw2rvLbrtUa4y/Z4FxqsNawt4fueE7JEqgRmleb
         fuwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791234840; x=1791839640; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jg+48cepgWrDgUNaKNya1rXBAe0v3PkEajJvFhN8l1Q=;
        b=VNE2HbwRFa7XmXYFCM4W7tQiz8w+wvhB0UyLbgVLvgM97qPYAu+jEDwWCjxWQsty+M
         7fe16B0iYotz+HMQx0unZ3OO5yibfnx6aPSF+RhQDo1zTl6kcquyOvX/Gop50riDq52S
         heGQpqumLQ0/ticjejHchgboXY6/12Wjl9VM0TVoLWsITVKjYZjHc+VuILr5hcnq/Tja
         HpbEVdKV5TmAKw2t1noGPKdnI2vRXdYe64DNcwXl9cPnBDCod4Wj6sT31h2DCmJ5ikKy
         vFsxGLLVvttV5WwFtJAaOwIYhT46Y6AkMSDZ7Zpi7k3au0aIEKhhyRHxcyN2Aa9e+tOs
         d+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791234840; x=1791839640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jg+48cepgWrDgUNaKNya1rXBAe0v3PkEajJvFhN8l1Q=;
        b=XYFWkS46cyD3MhaqmQz0kuTxMyD6a7YWy6Ho9KhPSLjTejJz81Ge9RnPvouRSgbZqX
         YrqIIBzIm8WRyBeAnUYcVT3dSzjsXMTHIKFuFQU9gsSgTF0+1ypOwCWS8C1tFOwokK0G
         ownZJY5Sum8BKdZvlk42NZiVCQ/PUgXcem6bWrtdstxupEt4m8MVFOV6JdfOe5zgI74P
         b5qlTjowFZPoWUQsmVCYkrPOuGlPQNhA++1LCmZRDJugcDpe5+zDp9TzJn+g86kMbd36
         iU/n99ksArzXX6QAnjKg/fIDrrymlxNMyJThxTmNuJWwEkJV1NvvuP1EpLLdrtP0BOau
         ob4Q==
X-Forwarded-Encrypted: i=1; AKwUvByjfyrysGH+S+dnxHmyryBs99Ew4Q6aZa6nKrtoGKhRNiLhtk9vBoFh4yydNGfMC/QRQs/Co98AuDHASseLOaLv@lists.infradead.org
X-Gm-Message-State: AFuF++mcKlDgE+wdptA4vrwbQiYdyP2v4Eew5V3IxCjR8dOSkTkX5xLK
	pq6NWi69BZapw+BJdWJujXEtKe5ViO8vA8NEmv+EoQgZdTzkVhwl+mSRhqwXKOKAD8b41UOeQcD
	7Ov40G2gILt0IvYjym9BhP7v2rx052IM=
X-Gm-Gg: AYBFou0KygSgNyUvyyv60oJfmcCJV5AnCt/jHnTMR9UHfLoo5Yefk3Ob/7cxYXgv18R
	TDd3NYsvezzBCyjfPjOxTHn4IJME0SvQRYfXxNjj34PbYDyP7i59gLHa3j0Y6tfMkilN7GcJl98
	807IpeBGcARqiEjAZnaJ5xxpCeJe1SRfwfs4SCFF0wRV44lh6dV7W7d0BfVBdWskryLDF57zdnh
	NaK/rqg2WUrnWw3ApymPv8c3xRSVAXRtKRpXuclY5famWBUwcGeV1N82yTgDomgaMO4Q9yxQa41
	5g9MAIbfovSUX1toKlBTlRV116nMCOFDKS8YPTy1dnH6chSrxR/vvZAh/A==
X-Received: by 2002:a17:907:940e:b0:c29:62d8:68af with SMTP id
 a640c23a62f3a-c2e4b2bc542mr1047723566b.47.1791234840255; Mon, 05 Oct 2026
 14:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20261005135833.37376f20@kernel.org>
In-Reply-To: <20261005135833.37376f20@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 6 Oct 2026 05:13:49 +0800
X-Gm-Features: AclHuK96Q0r6tDkOyMFxRRlJTRgYT5CZFZq3doTRuVETMpVpnBIKbah20Qfa8QQ
Message-ID: <CALj3r0jgyhtmwSR03nZm4UJZ7dw6Y16X9N6-ASq9puY40zeBfA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 00/11] net: pcs: add basic support for RK3568 XPCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_141403_776691_424260AD 
X-CRM114-Status: GOOD (  14.36  )
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

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=
=A5=E5=91=A8=E4=BA=8C 04:58=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 23 Sep 2026 04:03:24 +0800 Coia Prant wrote:
> > This series adds proper SGMII support for the Rockchip RK3568 SoC
> > using the integrated Synopsys DesignWare XPCS, along with necessary
> > fixes and refactoring in the stmmac core and XPCS driver.
>
> Someone marked this as changes requested. Not sure who and why.
> I was waiting for an ack from DT maintainers.
> If it wasn't you, either, maybe repost to re-queue this for review?

Hi Jakub,

Thanks for the review.

Regarding the "changes requested" state: I'm not sure who set it, and I
couldn't find any specific review comment explaining it. If it was
accidental, I'm happy to repost the series to re-queue it for review.
Please let me know if a repost is what you'd prefer.

- Coia

