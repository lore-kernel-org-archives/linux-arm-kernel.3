Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E8BCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 03:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4ijuTp5svOtTgrjejnJF22Eh5tEOHO/CkeB5GXCR3I=; b=iUmLTCcDisGqdD+qiham9yRSeg
	+jaz5HEB6YC7u9cMUv4TWHtIO0uOXDT2KaKPgkbyhgW+2OWC3UYUbh/oiARKRG+8ig01tBA3yOdX8
	y2QsLnk3bEf1KVBtHHuRaX3wqNhiLjJhdZKlfNQRA+locOWw+TScHgPl6WjRWSLJXEFM/ISRZ0L1Z
	fSfe9s17kBrjb37oNWSMUXbBp5REe9BN9YMZXaLG/I/HqyRQj82u6wmY6Ku7dhel8sHe+eX8Iu5gv
	oFkv6W5+ChBfxj7Wr9DKsXqxFy7Ik/hR3d9x53ErdyNxOa+I5Ffex/ARfL7e/ubwufYRd23U8ZKJm
	72tm0Dqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7iS-00000007guq-22IJ;
	Thu, 01 Oct 2026 03:44:16 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7iP-00000007gt8-26WR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 03:44:14 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6d95185ee17so2090664eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790826252; cv=none;
        d=google.com; s=arc-20260327;
        b=aPFiszv+jdSSK0V3raDIQnlV0U5+LeJfwjXjAbV3WMFf5hnnuS74tkgVT8gsWL6dzT
         sfRrrqZV8IuZDmxED97DEOoroqahWmdTBFKJyKA1c/WHbNsE5/YnCvsFCZhXFSd7m6GS
         rty5pCiLPpHwQkEpf773E3J1e9WyK3GW+YRbZc4jk/0cyQB3mzTEap/YXoeoJncOmvWi
         dQZQkrcCZicIZ/cM1+G1jOigiOCuJ/Eiigc9cPUnlefXgJBKELTDLEV3V9kAQkhB8Z96
         iwmrngcewjOYsQc8urleF6rXkEHOgHDqGSa3G5Jz5EZ0ZxP0CD5kYYI3jHTz5+YOyFBG
         CXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w4ijuTp5svOtTgrjejnJF22Eh5tEOHO/CkeB5GXCR3I=;
        fh=RgoPfxOdkZCkgDuX1YsT9OeNPRXOv5GnHFxTzPEeyLk=;
        b=K/wyTpA4/6P0J0HGlRtS3y9MqbDEqajZ6Bpw5wHkfMFUvuc/eMKtryoRxf6VHkAMnq
         UsqFC3jziKNLUkjGsxEE92Twz9ndwIBdwP6YNGCX51ufQhixy7d5fdYRTKYicGYG60vT
         4l8zeMZ0ocqDrwspF/2fEx8p/Y4SXL70LzsqioxKzRCXxkXbaMS0Jw7eDEKrHUi9UvDn
         icfSi5baui0uLcpPjtQv0SqWvJg8RJE1zSbA3kb3vd2kowOhe4K5ppqyUjMAOG0f+EGC
         J6ihzYujQGCPo3YpNi8koPXDVo28bcwIi4jGnxgpVsexmrcagqSjJsubHVFx4oyBq8Ug
         TpAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790826252; x=1791431052; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w4ijuTp5svOtTgrjejnJF22Eh5tEOHO/CkeB5GXCR3I=;
        b=MPdSxzunuqBpc/isMDSJBdZTpjxlRHnLusP0cBm41B/idI+zGqS2xQyhL6gTXM9NoN
         0Cg01w5TAhr78K13mQdUa0cMhTeYxVLmmau0EkoZaMW0y0O5RUJlvwHRNV7RvF5ExDoy
         VN0r5ngl+CavejHQMGeMgwwnAPExkcl9aH9vEca8QsKtRrOY89riF9Ec/QWuBrFE82aI
         abeHInl6dWnO3Wih6yoKCeteoaE0snEwYKX/M94uzT3Rnt3TKo7J6NmJsD22rJIPjj5+
         i7i7RrVfUXy3lyQYzCObJmtpfYYeNdZq70BHTpf/ciW7mLNFsP2dmZt5uvZEq5F8Aq6w
         i30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790826252; x=1791431052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4ijuTp5svOtTgrjejnJF22Eh5tEOHO/CkeB5GXCR3I=;
        b=fYGWQiphluHvl4tZYXf+44WNiyGLwekzOWAPSPzpR+H6ynA0ZmAnqluB/jAMH7qYob
         r9BNNu1PuFrmxfzfncCwGeFxGjJ+bB0GzcjXdxmfbMsXhOLL43YBnezmdop8Bu6ZpP2b
         D0zEj1u1JJ+RPf6yjOuc+BQ3kgVsEZZD5J+A0F5t8mPy8vr0N2RqUaglUO9dWrUBW2H3
         m9EOPSOuWE3VgmB9cK8Q76z43ykqvh528Zg1tBrSXWBs7Z7djWGDniEG/7kbd0f7odAm
         4lXdhM+fgRT1A6HqTaFzj2GB3JNHgvyvfllCY7vha5u9AnWKnI/8wAFlFkDBOrYqB2cv
         Qfzw==
X-Forwarded-Encrypted: i=1; AKwUvBzQ/uqx5DPY/3T0AoQQU+1asQ4Ge4rA6a4IB7DZGt2qh6M4dPqNluUgOXBJIwS4e7iCRYd824YibXUm8TC1UPbT@lists.infradead.org
X-Gm-Message-State: AFuF++nydF7rM9mIfdtQelC7riWhJBG1YhZGSNRBR8cJgSJ296atDp3Y
	6Uz6baWNK/iZFAeuOkZEgRky4X3mcN1QfZk/+wlyqWi122f7xtyPt7m9snuLoZkMRbz/Lkokdee
	j/3qZtn4RyyF5+qRyPfMXR+S9F7fR5QY=
X-Gm-Gg: AYBFou3c7zQBWMJDlm2Xi17hoMlJwa7Ite/G54J6mtbaq5UIAUsVkaMHVnRsEviCvxZ
	iJaLOWfAuEjlaA+eKoagCR6r5Eqk3ybRsQE46Mf2NseHRFJwaRuktE5Rk2KxT5EV/89xoRw9U1B
	8ZU7ZWbqyeCmLZsSLV094mYhqkXzb4m/GxKANp+NuMy1DzZmUQue+hvsIl1soEOdA0n6fWnrrlX
	8uO8It859mcWcqG3dq7TfyoFysbLOGi+Kg25mUvx/bEucgAkK7CNZoPnqtbx1yGXj9oBJIiM5rJ
	jTLSq/Q+yLUskBIo3kS/SpjDR4Ib/Hfefc+aiymBygfp7Sdu/FgH8jFZiyIlgR3k4No=
X-Received: by 2002:a05:6820:4cc7:b0:6d9:58a1:824 with SMTP id
 006d021491bc7-6ddba7942ffmr1480642eaf.22.1790826251774; Wed, 30 Sep 2026
 20:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
 <20260926-b4-mt7629-toprgu-v1-1-c124bf9ac273@gmail.com> <20260929-spiffy-harrier-of-snow-b78e7b@quoll>
In-Reply-To: <20260929-spiffy-harrier-of-snow-b78e7b@quoll>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 1 Oct 2026 11:44:00 +0800
X-Gm-Features: AclHuK9LNVBWetA4umqzLuoUjfCXVTn1WDE30aATZ75mv1-R3SpbZ9mzZOo88bg
Message-ID: <CAJsYDVLimYZXk6mFrnsObCYFnK3HxqVJpuee+msnCi-GAUTXbQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: reset: mediatek: add MT7629 TOPRGU reset indices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_204413_547510_07BF2CDF 
X-CRM114-Status: GOOD (  19.98  )
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

Hi!

On Tue, Sep 29, 2026 at 4:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, Sep 26, 2026 at 07:13:59PM +0800, Chuanhong Guo wrote:
> > Define all seven reset IDs documented in the MT7629 TOPRGU SWSYSRST
> > register: INFRA, ETHDMA, DDRPHY, INFRA_AO, CONN, APMIXED and CONN_MCU.
> > Use their register bit positions as reset IDs.
>
> If so, I say you don't need bindings then... but fine except:
>
> >
> > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> > ---
> >  include/dt-bindings/reset/mt7629-resets.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/include/dt-bindings/reset/mt7629-resets.h b/include/dt-bin=
dings/reset/mt7629-resets.h
> > index 6bb85734f68d..828919eee298 100644
> > --- a/include/dt-bindings/reset/mt7629-resets.h
> > +++ b/include/dt-bindings/reset/mt7629-resets.h
> > @@ -53,6 +53,15 @@
> >  #define MT7629_PCIE0_USER_RST                        30
> >  #define MT7629_PCIE0_PIPE_RST                        31
> >
> > +/* TOPRGU resets */
>
> Didn't new bindings switch to continues indexes?
>

This is written for the existing reset driver in mtk_wdt.c. I don't
want to add a reset id remap when all the other SoCs in that
driver use binding ids matching their hardware bits.

Is this OK for existing drivers?
I can also live with plain numbers in the device tree if that's preferred.

Another option would be to include mt7622-resets.h for mt7629 dt
as their TOPRGU definitions match exactly. But that would bring other
unused mt7622 definitions into mt7629 dt, probably not ideal.

> > +#define MT7629_TOPRGU_INFRA_SW_RST           0
> > +#define MT7629_TOPRGU_ETHDMA_SW_RST          1
> > +#define MT7629_TOPRGU_DDRPHY_SW_RST          6
> > +#define MT7629_TOPRGU_INFRA_AO_SW_RST                8
>
> Best regards,
> Krzysztof
>

--
Regards,
Chuanhong Guo

