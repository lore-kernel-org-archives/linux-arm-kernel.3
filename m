Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EB9C55174
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 01:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmtSbhR0umzoPCNMklVcndk+0d6Cbu71OPbe5cqrdZM=; b=UifjtLMIoRZcqn7Qjp6fViY06+
	dmhELHuv7FF3zcyzJDwZilWmCvw/ll417MBmYbTuyB00wGgk8f0mPOYbw5n3VPsUPwdLZ2VtXoMaV
	Ta99j6hUo2gCvac2HV8Di/BiQmhaHEQD8B8SWtBuuMuEl3tqie8/am4bEX3WBRv1fzLlStgzBFva7
	XM2ublK7p5QMuWFYQVrNToJI6eXhMc3mpl1BPtBr6rUBMhCRumxAH4zEVwe0ZprgT0ChuzZec1MNo
	jay2crQnJbs3oeSd7niEaHXFYE3nIr0yX76Zu9wFk2yW33H8BzMlv8BMi7aEgaUi+ruGL9XQoGSsB
	GnkAkOGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrn2e-00000004mAT-2KO5;
	Thu, 06 Aug 2026 01:37:04 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrn2b-00000004m9W-1nNW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 01:37:03 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-5c38565e774so486170e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 18:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785980220; cv=none;
        d=google.com; s=arc-20260327;
        b=WVtHih0OX3SiaCm1Rt2sVG/gqXQkKDitAqjvtMCxRfuErknECJ2lLF0KKaIQ/nQe/F
         dnaDtzDubFoLuMI7Q3sFm6ocAn1n8mUsK3CkDzP02ArBoM5JsFU0lHTbvoXG8vYaLl5A
         aj5TGd0x6c0KtiCM4UN5qq/CjuF6+JLgRLxI5NqQs9n1xjjd3s0AISRxZiFlhFO69YrM
         zQBjCOwSmjnwdBy6cUcSzQAJySTKn/pnhPaBXd90mcDTr7P0AGT/evNsUTP6BL9niIIC
         szhAU5A51TOcRMDjUM9flQXO/fG7Ve7Jgxom1PgMpBReLb4N43YHEkrSUURubX2ng4fA
         l+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CmtSbhR0umzoPCNMklVcndk+0d6Cbu71OPbe5cqrdZM=;
        fh=grNhG4+A6ZfA6mBLGBaTPNpqi1qliIhC9T4Og5t44CA=;
        b=WgjvxtI04K9TmBSs1uRHMNHHl0vCgkz7A78TIzFtYNtpjda/INKobCgEHKASYPsr+E
         SpLNgjWbHLKu0R57tBUTufOv5cvW49xo93CF74rjJNXaQ92ysVK112naEVPXx8CeyIwm
         +SkrRdFmx75V0g44K+ZM7lb0ZNRv3QRYh8c5NWXYkLEKCJ3faHXfqnLqYhWtbb7EuLLj
         9243W94ttXQkDngu5Wop9ZzSH4l83m60gVUxlGEinAfbH65ErpJMmFd3DC9LvvazgQi4
         mIIJ+8i6MA8ILZvMUa2PlbtFOxvwfbIjGTf5eISHNeQWvyRq8SLhfDG2rPpdENtRbYU4
         7WBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785980220; x=1786585020; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CmtSbhR0umzoPCNMklVcndk+0d6Cbu71OPbe5cqrdZM=;
        b=ic4WxjUMI8zeQMrIGKmYMnImuJgWlUel6WAKEKrM0dNDFZ7gCm3BbfkqCS+WG/gARx
         4jywxNyAXt5joK95A1vOuPsNnyRoqcvuBBcaPA2B1My/IbLFA4Lt+VFklMqtv6lEh5GO
         YsdA4YAeLOyEGPsml6sDufa4k4Duh8l+jrpXpy8JHJB2/kJvgrLJM78UvGu8oUrnx2ay
         QS+HV4HDwCG/Yd7TF/Xr3bRMbdMQcv8CwJOzC+Vg2qbn9K0/jiYKuzbwVZwZLeSh8PKl
         pZ61aH0LVrbaz51tjZSptyrs/DmokEMM3AF+V26L5Q/Jcq4ORlpsDLaJ/4V/qIK8I0EL
         9rtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785980220; x=1786585020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CmtSbhR0umzoPCNMklVcndk+0d6Cbu71OPbe5cqrdZM=;
        b=W5GjLPQwjIEZlDAlT1kq4S8y4Li0y5H2vLwVD+0uRYnBrOSa5z7Iq5xjOi+DxYBELJ
         uYuxXZR0S1I8ARjw1PF6CcgHg5srih5xCLMeJwIWRAVS1ZHJvxA+NAgbof6YedW87RuK
         4ftUuZR5d1dnkATUrjGH6XnU44mJ0rrPf/ZMpx1Ags9zzFAcr/RphwaTkRUtBajjX6Pw
         AukLLiJ2lqNbvJl1Kt+AfUjr+qN37WbgS2kR9b/tDWyxzm40pjf4mLseQ1IKF1pELwy/
         WKHYnPSRmQEtMrogdQXHnPZMPGOsSu0cBr51iL2hkM2D+MRjqjwqUEvFuKkBaHtGz5AN
         C1Aw==
X-Forwarded-Encrypted: i=1; AHgh+RoyafToYQBT0nxjmpehXqc5BUkn/1Jqg1tThWDS3s5tzZnmICkTdPa8IjAO19JJhA6C78KMTqJfF9LAzqjTl+ZB@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1ns/20/O1xyHOeqrOI0Rt5x4Troft0Zqg4h8SNMe21YhPJLAX
	TWke/kyrs7i1dx8gtpRiTqA1ATBuUWmVEb51/tLTk3hHaE/xrkYXu7HKNa3bkv5N3pRlu9mT4Y4
	6h5acFWVQBfNkdDFNLAd73GPqDMsIKWQ=
X-Gm-Gg: AR+sD11ZjeoFBiSEEUQ7Wrnr2FITp0XGKztWU+HDv40yG/bQEBQkW0XsEojbnA7sl58
	SD+irLIjXk0PALV5Z+1CpUd+w11Mj7e0YsWYMcpDm/KuDhPATGQEJJlQ1lpgskrJOMEC6W0/aNB
	/qoJcXXczO7TMWzruFnG4vxurTmsMgzMfTHt6WVqfcTzHUCoBSwRFMf+PcJKTq+07pRcd6Jpv3R
	e3KSuaRQOmqsXrS33dI3tXcLMlcta7NAJQv7saRv9TuNR0PTqUJtcHv04ViSmdf2J9Pt6O3qIZ6
	F5HOmRgdBRq97IvcS2vLY9DiusF7Z4jrw3JWZbU0edbHsmvYw3ptOQNFpBLFdZjLLcYp+a8bcux
	KSQ27hLseSNrqQFY32xalPN9l5qbgfLX2cvTgymyFZhkReFlyC4LBuV0vz5WzxEpdm7jzLEpwpz
	D7LvQluy4zAkPOp0H3LbLROK5XhzOHGe8ED+Oq
X-Received: by 2002:a05:6122:4f8a:b0:5bf:bb66:414f with SMTP id
 71dfb90a1353d-5c3d93a8410mr1586273e0c.11.1785980220218; Wed, 05 Aug 2026
 18:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
 <20260804-submit-acx00-of-dynamic-v1-v2-5-3eef49ff1d8c@gmail.com> <20260805141737.GA715959-robh@kernel.org>
In-Reply-To: <20260805141737.GA715959-robh@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 5 Aug 2026 19:36:49 -0600
X-Gm-Features: AUfX_mzQwafoGswTs6dpUFv2c34FSJlAsZ9bjOHCBKQRghZLcM4QQZUZyorkfog
Message-ID: <CADvTj4r7qwdb4+-k11HD7d_8kYhJX3=XE1ftaRKP+-xpSiST5A@mail.gmail.com>
Subject: Re: [PATCH net-next v2 5/8] dt-bindings: net: x-powers: add AC300
 EPHY control
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_183701_487542_86B53D8F 
X-CRM114-Status: GOOD (  25.56  )
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

On Wed, Aug 5, 2026 at 8:17=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Aug 04, 2026 at 08:27:03PM -0600, James Hilliard wrote:
> > The AC300 exposes its Fast Ethernet PHY control registers through a
> > separate non-PHY Clause 22 address. The manual defines that address as
> > the link PHY address plus 16, giving control addresses 16 through 23 an=
d
> > link addresses 0 through 7.
>
> That's not a separate device, but just a second address range. You
> should make 'reg' have 2 entries.

I tried a different approach in my v3 using ethernet-phy-package to
instead of ctrl drivers with the AC300 control address specified by the
ethernet-phy-package register(internal it's doing a + 16 to get align
with existing conventions).

>
> >
> > Describe the control endpoint, its required VCC1 supply, its 24, 25 or
> > 27 MHz input clock and its SoC SID calibration cell. The actual PHY
> > remains a separate ethernet-phy node and supplies the MAC-selected
> > interface mode at runtime.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  .../bindings/net/x-powers,ac300-ephy-ctl.yaml      | 70 ++++++++++++++=
++++++++
> >  1 file changed, 70 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-=
ctl.yaml b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.ya=
ml
> > new file mode 100644
> > index 000000000000..8a616ff3e89f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yam=
l
> > @@ -0,0 +1,70 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/x-powers,ac300-ephy-ctl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: X-Powers AC300 Ethernet PHY control interface
> > +
> > +maintainers:
> > +  - James Hilliard <james.hilliard1@gmail.com>
> > +
> > +description:
> > +  The AC300 Fast Ethernet PHY has a separate control interface accesse=
d as a
> > +  non-PHY Clause 22 device. Its address is 16 plus the address of the =
link PHY.
> > +
> > +properties:
> > +  compatible:
> > +    const: x-powers,ac300-ephy-ctl
> > +
> > +  reg:
> > +    minimum: 16
> > +    maximum: 23
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      AC300 input clock. Its configured rate must be 24, 25, or 27 MHz=
 and
> > +      determines the corresponding EPHY_CLK_SEL value.
> > +
> > +  vcc1-supply:
> > +    description:
> > +      3.3 V supply for the AC300 I/O, bandgap, Ethernet PHY analog fro=
nt end,
> > +      and internal digital LDO
>
> Sounds like this supply and clock would need to be enabled before
> accessing the "link PHY address"? If so, then 2 nodes is really a
> problem.

I think having the link node depend on the ctrl node was preventing
issues there AFAIU. My v3 works differently though.

>
> Rob

