Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFC3C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 04:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7i9JdeVJzDWpjjDEXDdnp2erjUKykrkBMYRh4KI/Og=; b=ZT6Z3M4thb4hMIm809eMxeQ65o
	O2ILxh6ae+S45YtNRsLiyX4bEicVbBXsjeLSmjiUkbVsaqJe4al1T5mGSYMRQiW80tidaaplkZVsK
	rM42QXI7QpCedgaBOW4muGSOKcgZ3vHTF6ovfNsmHTw9GOj55iB+K36OTd+78INXyIpKJWrtpBctk
	14G3syu74haLZ59ZYoI28CtbtsPGdL7YrAZFHTFI8clV8jG2zx1FoU3ohvs5BKRB1mLUiuUNmlPvn
	Cs3jbobit0HRKTiQmeAEApTZ7f49suCpdmJ3FioeKU8UtqEjvezBhgum3u50q8SYYBazDUIs0Dnc1
	rflpyWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqMcN-0000000FIfc-40Mc;
	Sun, 02 Aug 2026 03:12:03 +0000
Received: from mail-ej2-x01.google.com ([2a00:1450:4864:34::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqMc9-0000000FIeX-2HCa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 03:12:02 +0000
Received: by mail-ej2-x01.google.com with SMTP id a640c23a62f3a-c15dc93e168so112318466b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 20:11:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785640307; cv=none;
        d=google.com; s=arc-20260327;
        b=GvVuwH1OamtJ78EzCyZKUSEoxvHvQxJlhvc/qC5TPTS/TJLW56nTjyRJymJbrztpls
         zsy+hzvTte/SkqK3VcydVTpPl8ZsvIp1Zg52fXMkuZk5mY1HckLnlomozjs89kDf7N7B
         qMC6O8ED1bwvZTnpBJtzVZediprwpN9MmSRYgKUvHSVmjL7TgD/geqxVNYayH7XvCw21
         Hdz55kEicxZ85ZGvVSzeGMPy+4B7GivezwZTgysuVxmkzJedcTDthEjL/ddxX0AlSb1T
         3/QwhkEs586OwDDK+Tx1EQd0hsR6re+4oKeAQbwOo9WEZydbzHDIEWsVWzyksbVAwHRC
         kjaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c7i9JdeVJzDWpjjDEXDdnp2erjUKykrkBMYRh4KI/Og=;
        fh=O0DuusXFnylKeR2Wbbh2iCA7oVynC6ue3DxjwsZ+gpo=;
        b=Wfw9b0jLuJlMM4WmEqieORYN6Rx4Xj6+WQaNxrar4z7doF5eFUd7CvXyPDKhqaU2Wu
         Znpvlwn8gORdtM12UUHdrUj414iXbuvWlzn0RIMCYeCqWdM6fP+hl1lPeqQiOooGJS1m
         EnnULP/QJ9PyX2KRD0r/38DSfjlelYyzfRAsJsZC3gmJp6RuyxwL9nOIb2dTE0/8y9It
         GjwrjpU6ZkEl6ajTSfFPQ1Q+a84c3zGK9PiW87R7oxP8RcMwkcn0CAocFoxf2XoD7dv5
         MgArHjgxu9yq6eNUgg3/hyvM9QwHKHTb2E0xLFRP3+LjsdgKqvCJrE/YkKR+ui7y5ECf
         5Q0Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785640307; x=1786245107; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c7i9JdeVJzDWpjjDEXDdnp2erjUKykrkBMYRh4KI/Og=;
        b=Bvzh4E0eua7Sm815cfpXF0e9LabI8LYQNEeSi2I+Lwd4rG9BCTD827IKdM1TZkGmRV
         jqkdq8DGpOligfrHL0uSdF3LaFIu4Wi7xZiiy5lpi8qzTigLiBkFSzPtyNf+Tm27mZgc
         zbvkXn9/qoe+a4wB42USdW9EIciZ3FQw0Ucp1m0AiU/WJEVam8F5XBeBahB0EpPW+0a6
         D7IwMVQJJSfsW3hGzt+tq/rgWng7MQdOjCmgBKf6vSEbQksZxh67zZus146J58pQhArc
         TKg2WNmtlKcNDfykqjKTShe+WPFEc+1vnfTDV7Bj2S1DokxkFDnKURPKQ+cbpomk8GlY
         +xSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785640307; x=1786245107;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c7i9JdeVJzDWpjjDEXDdnp2erjUKykrkBMYRh4KI/Og=;
        b=s9WBbWu3pev8Js0hvrKHAl//IoAMMRez7Eq496ZUGZZm09t+y8ugzdU2nF8vzL4fv1
         uqO8qTngd9lvUc/4dRlsMf6sjV0YCzILz2mkRGVFdMgCt9ueP5wI2efk5r8DgK6ra1RA
         paboxzoXgQQP+jnJPosu4LIurO4/xE22LV6DaRp/faziOsuqH3EShKDBmEes6jBNBzcf
         qCZuMux7ZBKt1GYQ14D6WGaD1Gae5T5New0f3us1aF9uR0kdTLbvHmPMAF8D9+ElbOUc
         WT/lkAdwSgMW5tqA3rcyn91hGywx83pDzfrLZFeYLZrpermoNVaoe+BrP3K/S1GtMIZP
         IFfw==
X-Forwarded-Encrypted: i=1; AHgh+Rol21AsVNeGWL+Q5hW7Ayq4Oh7iRfT/YHbI/t2hfvoaj/UxTI72Lih9bZrnGHMnv25ts1+4UX+btpFPnD2nI6rL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8a5c2GGwi+LU4py5n0JDm2nScryi6JoTSlJXIZIghmw0KVqkx
	R3RQ/+GuP49R0VkOMtfLlFGz6Tu7/XhHyUS7eyoq5TzLjOh+sjRrT4QqFpio+4J6xy/RfzWaf4E
	Zhvuh+zKNbWVitDnnC409v4N++wwkL/0=
X-Gm-Gg: AR+sD13iGRNWS712z4vbpRAJiKiBQCXlZgAhGGxi6gvIv0JTyYaYZj8ONSIN5Em33gL
	B4rPLUCZZ0ZBm0k25OGIu78/4wMVkjMdft3ZQf88cAxPNhLZLV0F+kdRY/FDTwpbOwy5KqXC05i
	ymd5oCeYu+EIhzjAX2iD4rRF8LdgO+CWybe51jaS1L5N3T/psDZf/0l+FcJzfMZ3wO27UrjiZ3f
	WvcFg23ZzlZnX+F4Xv9gNWy7QU3etnhu0/fuHMaGnspP+TWVe0H3WgDPxQCxMQC8ORcz625/IAe
	EctAIbh9qtW4uDyinwUX5lZHqeQyHhorXQoZpLhmhSqJhJzP6qRscCAt/AU=
X-Received: by 2002:a17:907:a0a:b0:c16:318:34e3 with SMTP id
 a640c23a62f3a-c1fe7ee16b4mr409057166b.16.1785640307171; Sat, 01 Aug 2026
 20:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260801142244.679437-2-coiaprant@gmail.com> <20260801142244.679437-8-coiaprant@gmail.com>
 <cfddb747-11d0-476d-8402-e0886cca582e@lunn.ch>
In-Reply-To: <cfddb747-11d0-476d-8402-e0886cca582e@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 2 Aug 2026 11:11:40 +0800
X-Gm-Features: AUfX_mxry2V8YGgxr6fvsxNhCSaA_pBDCP69byM5eyulpGFZP2LcAYzvhwycRyM
Message-ID: <CALj3r0i1TCTgvm8FrJAJqmZgoJp61NCxc_xmVYaDFd-gh4H=7w@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] net: pcs: xpcs: add ANRESTART support for SGMII
 link recovery
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org, Jiawen Wu <jiawenwu@trustnetic.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_201149_606357_9E517E28 
X-CRM114-Status: GOOD (  15.20  )
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

Hi Andrew,

Thanks for the careful review.

> This probably needs more wide spread testing. I would be afraid that
> if you kick off an AN cycle, you loose the link until it completes?
> You would of noticed that on your hardware, but other hardware
> obviously behaves differently...

The trigger condition is: link is down AND an_complete is set. This means
auto-negotiation has already completed (or completed with failure), but
the link is still down. In this state, the hardware will not restart AN
on its own on RK3568, so the link stays dead forever. Kicking ANRESTART
here is the only way to recover.

For a working link (link up), state->an_complete may still be set, but
the function returns earlier at the "if (state->link)" check, so
ANRESTART is never triggered on an active link. This should not cause
unexpected link loss on any hardware.

Regarding testing:
- Jiawen Wu has tested this on Wangxun NICs and reported no regression
  (Tested-by tag included in the patch).
- On RK3568 (Photonicat board), this fixes the SGMII link recovery issue.

I agree that wider testing is beneficial, and I'm open to running more
tests on different platforms if needed. However, given the condition is
strictly limited to "link down + an_complete", the risk of disrupting an
already-working link is minimal.

Thanks,
Coia

