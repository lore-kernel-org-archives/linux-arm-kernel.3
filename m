Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C70CC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 09:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHGgD8K9zQ4es88RgHY8FFmbRbAWwqwav6HnZA/PD+k=; b=gandsDLEvBmzqQYcaZGz8RmL+d
	smYCCvV/WkM/g6bnaZNyKr82eV6hWRDa5xBb3zylhBydjbrC1znMzPsHsFHbVYDCPQcBgQEbhOYUt
	hAzrReuf0ZR8vXNd51MzG1T/GO2UHhy5cudN0VBUK1TKsqVFt/Ih10dp9+zZCnqBKc5y6b369jHY3
	A6RsC3mCwKFuYFPSnMLujjSJL1EGr8AsrHPipWftt5BLnoSgUhsJh//miclXWbdJHqwDjrqWGA2yh
	JPi43+fa8Z/mRaLo23adPsK/56pHUFHVAbStz9IR7wOn0Y+/8lkrkv5G8lDKB8Ho3ixFpPLMQT5Iy
	LD7eRgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlODq-00000004teR-1Xrk;
	Sun, 19 Jul 2026 09:54:10 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlODn-00000004tdY-3SVU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 09:54:09 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-81cac794377so5988887b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 02:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784454846; cv=none;
        d=google.com; s=arc-20260327;
        b=h5Lr/KBUktkOMtRseJMiwCzRZmDgxquwXeHyFnaNSfjzfcHNy1Ha7lttTo77ARRpop
         s9eJ3r4IoDaFnu9C5XgScd6mdZQzHl0JXgphVF1Qg2chZiUWGZ7bU6+X81dwKqlXRTqi
         oKEdX6BY2CVHZMZ3o0n2AFTLMlyaN5sOZtsyGJX+I/Q/hNI6R0tcVuV6L22nIy3yXt7Q
         KVjXsiOLSsUKsqajegKL2tOzy5M08QW2VZcCgw4Bn51OgC8qDAAMzJheTFv8feOgs695
         6K/TO9TSi1/OLoy+t5xVXNp6kYRLBukGGNpwJPt/Fv12c3RHDXuNKZBFNRqrrtGeTo8z
         ZYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xHGgD8K9zQ4es88RgHY8FFmbRbAWwqwav6HnZA/PD+k=;
        fh=2NE7Bsumae3xLaXsz/07xIOeq6UK8sWth+PaRyIssxY=;
        b=cOR1sFwHTmEyWWnVWvHMifT3Ok6evQx5+GMGqNKAxlY8JianAmmwcP9+jxsLovBgu5
         TvW0wNBZayHEuZ6JaNKVAiB630PmpjJ9TrYIhjA4NFA0NSdqUep9XEKgycuLoiq6KvwB
         Ti3Lx8Q24SgbNfq4U5tLslF/9On7rQWqlQ3TfwuQYjVtVPbxT5s34sfqwQUjR8gJGuFH
         efc2fyl2c1J1ZC+KZqPoMth+q96wFHPbUq5pKioydDUKZkIYzz5SoMNtBmNod+LHSxUp
         610rGM4qtSz539te30+YPot6zP8f4wkWsDYBHs983Mk9gVNvYbouHmjXs43szHRWq30W
         RwlQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784454846; x=1785059646; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xHGgD8K9zQ4es88RgHY8FFmbRbAWwqwav6HnZA/PD+k=;
        b=sU9sAR9yr3aXg1Oj4jTT5LoDvjSrZIVSO+5E+ZKl7GfMLxGNmefWo7MR34F4oOXmTr
         OoO8AWBnAT5SqaMzFkfawxLoDjg/9SZDcKkGgomFEV0fx99zuu85cTFN6udasixdnn/s
         yu3y7GPSYT/SBT2sXjtqMkBTd6fd1xhUo1zuFIhM8DOTl8GtQ7sxgnxMWuyiN0ZArfcK
         WNuyCTeBM/Jbfj07y5T9dqVbFLDlgqf8A+yv1h4AFauLxxVRdJAmocNmP3Ti4GpaDBmE
         6J7zqtRy3IL0uZGvrIH2/QUCaTLT1FrSGAQm+wqYeTCLcj5faFJcbpbYN2BP8vEGe7wH
         J3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784454846; x=1785059646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xHGgD8K9zQ4es88RgHY8FFmbRbAWwqwav6HnZA/PD+k=;
        b=JiaMpazu6fvyED5dOnZ8NFoxhHnN5A1C/n52tpFF9IzdYlNdm3aD4SqAzVyDpT4sR/
         HSujiASNwxgQtpUo81R43ND/lxsaBJVShmL206FWI3b1cPmBz6jN+IhsaxgQnHym0d3Z
         W6AbHlU0JFVtTUv0/WOnYeTvhtZDJM8Vm00biSC79vjjAKMHPEWZKCBQHzscbUP8bik9
         Fg2hlbGp/Ws4tKLf+1jQYqFKJvFVajZPvuMQ7Hl5aLwgXoM+tB/K4pBuSv7jnw7JPRf1
         Iyazwv+HgXyXMCI78ZcU9AF+iuLPMw6n5HispMCcGb+Q5bH7g5KLNFIMNaQ4hIykTax7
         FrRA==
X-Forwarded-Encrypted: i=1; AHgh+RoNbh5xNyJ/QWnHFZY2EU6CwrXIcFfEFATkviMi4EAEs383xHMX8xJXq4FZojLL4dNKN7PXid1sNJ9WomNM5lSP@lists.infradead.org
X-Gm-Message-State: AOJu0YzhNy5p4SUPGjywuu17s+YEidllRTV/Z5e2/IrJSsG7GsL7Hut1
	dJKtgB2ui5k4FfCClxwlUETvOxgVs7sXJzc7Vpolz4l89mcvRT8RrpamomjsK4cMWgZDpoak1zx
	w/lOko0W7ieKHgZz1rwZd/bxshJTcR3k=
X-Gm-Gg: AfdE7cmTYqTwwrAbJXSPqvQUz1uExiMsTHWo8+EJRENHzdOlrwx9L9L74DlooGyj9Iw
	yDIkI50QBg6P+pVD2Tj9nOmt2tZqAyZJ8zTHpYqM3bcYkAP050fNBtHctLHH9hrnH/79TmDfiM0
	U4A14DrU/N0yKTc/SCK5bRYHnzlcDeHjh2wZfWC8RONUG5qNUszYiJlMDmKlsmyLb+2mOzkY3XI
	58jd51Wac5mBtvTWaBMkQmhgAUFZCa4dyPDc3129xrki//+0bn4l4Iu48b/mDv7fCpRoq/1mBu4
	gVsreRu9pL0oa7hkBRffv2OQ6bdQKcU=
X-Received: by 2002:a05:690c:60c3:b0:80d:8bad:2ceb with SMTP id
 00721157ae682-81ef217a008mr32451757b3.0.1784454846106; Sun, 19 Jul 2026
 02:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-2-royalnet026@gmail.com>
 <20260719-sassy-muskrat-of-finesse-b426b0@quoll>
In-Reply-To: <20260719-sassy-muskrat-of-finesse-b426b0@quoll>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sun, 19 Jul 2026 11:53:54 +0200
X-Gm-Features: AUfX_mzrG1Pq4Zo417YCDgy1H34zh5K02k55OjzpmQP6GATHpyCvJf-ba4NVTOo
Message-ID: <CAEWPSH6aUOzxhweOdwi18LgtsUQhQEfJ0usWJvsC7WHF6XMQzA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_025407_917606_8F073F1E 
X-CRM114-Status: GOOD (  19.32  )
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

Hi Krzysztof,

Thanks -- both done for v4: the schema now references
/schemas/sound/dai-common.yaml# with unevaluatedProperties: false, and
the consumer comment is dropped from the example.

I'll fold this into the v4 respin together with Sebastian's dts
comments, holding it for Dmitry's testing round on the driver side so
everything lands in one go.

Igor

On Sun, Jul 19, 2026 at 10:54=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sat, Jul 18, 2026 at 10:57:25AM +0200, Igor Paunovic wrote:
>
> > diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.ya=
ml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > index b7f6c87..fa6cd0d 100644
> > --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > @@ -78,6 +78,13 @@ properties:
> >        The phandle of the syscon node for the Video Output GRF register
> >        to enable EDID transfer through SDAIN and SCLIN.
> >
> > +  "#sound-dai-cells":
> > +    const: 1
> > +    description:
> > +      The HDMI RX controller has two digital audio interfaces, one for
> > +      I2S and one for S/PDIF. The DAI cell selects the interface, 0 fo=
r
> > +      I2S and 1 for S/PDIF.
> > +
>
> Schema should also reference dai-common.yaml and use
> "unevaluatedProperties: false".
>
> >  required:
> >    - compatible
> >    - reg
> > @@ -129,4 +136,6 @@ examples:
> >        pinctrl-0 =3D <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &h=
dmim1_rx_sda &hdmirx_5v_detection>;
> >        pinctrl-names =3D "default";
> >        hpd-gpios =3D <&gpio1 22 GPIO_ACTIVE_LOW>;
> > +      /* referenced by a sound card as <&hdmi_receiver 0> (0: I2S, 1: =
S/PDIF) */
>
> Drop comment, not needed. Consumer is not really relevant.
>
> Best regards,
> Krzysztof
>

