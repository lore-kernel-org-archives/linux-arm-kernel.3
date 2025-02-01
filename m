Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E73DC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 05:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G85DeTf/oB1QdDKSnZYOTyqELILiv8N6DE1BpyFXcGE=; b=CkLF9u3K1HorTMsLvpiNeab4sV
	D/XkMVqiDW+F9V+i7IgaM0HCohbX49VOpgxHcMK8jVNSRuOJxXBkUl5uWW1Y+oQhuhvThsLxSHrBI
	Wo1XYhKCstubS7XfoexI5gY5eMJei2YeRaaXF9vF1LxjZVgWHw0V9hUwuAxBorRd0KeUvH7b0jXN3
	GIVQYhjQojaKpsM0xowCT1Yu94YNJ6c6RoxF+ZEOyYNDVVE4vi58M0DdedoAt5QgGuTqgfKFMT7uW
	uYtYOZhcdptDOAFlhc6OamFlAE8423S/vfzA8bZEqd1m6pTXyEE8He5et9NxzyDL5OqXZemOq/JXX
	f0rBumLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1te6Lh-0000000BvVC-1HK8;
	Sat, 01 Feb 2025 05:47:21 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1te6KH-0000000BvOo-2YBE;
	Sat, 01 Feb 2025 05:45:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4363ae65100so31698935e9.0;
        Fri, 31 Jan 2025 21:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738388751; x=1738993551; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G85DeTf/oB1QdDKSnZYOTyqELILiv8N6DE1BpyFXcGE=;
        b=Mk3Qh46p+Fw6eIodP5Vi4TkFEPiPbhvevSkFlBswUUt9PmW2cFMBiMM46RSr2NLgIM
         /LWK8G7gcqVBr/NAWm+Ni5wylwQzKX+4qL2UOZ4sZu731uSDJ8i3nQQ4MjC4OL3dEamm
         iNcs3EeFT0rLwlYfyMyvqAbLlvfNEpnIGoU020nZIZGQ0v+vsSr592nNlRjjJ+P8vgz7
         OnGS8Bk72mSWTY9Rrh/fTMs54IS9ezoE+5t6kzWSNeA+yg/pKfg3ErgDNa29yvgch104
         b/ZlM805TeirNAg9GB2bA/BaKaHHY98NNZF21zyP3I1C68hKV29q1PiIQOo7emmrXP67
         bOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738388751; x=1738993551;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G85DeTf/oB1QdDKSnZYOTyqELILiv8N6DE1BpyFXcGE=;
        b=ZqwlQv/Lq21cy8QmxUa672nveXauzAY9iDY8zMl4Ah3JbyDGQRf2QW+iBIw6HdA69C
         EOUGTkAMq8dVdcUBJODJCDhZ7l+MfQaVxfN5wvXiAuKu5O3+0o/GyX16rIop+f7sUSWx
         Z6peELkKIl6rAdKkckAE3njiPOMh2Vz2v0jsDIvl+9ngRZO84R3gCdysnIwKxuZr5HIH
         Rx9N85vnyLXFd2JDEnauzSKt2RyyhuEtwVRyOFWmBALfRs2+ao0r5HQfQW3IlDK8XfmO
         9i8u2dBAm+rPfsIMqj1zF5D+XhDJ1/7EXUtpNS69zZx4dYYIGG/xMpT49BiqZ0i4tRnp
         uwCA==
X-Forwarded-Encrypted: i=1; AJvYcCUub5NNNG9zgYrEZ09tollC8m7oHlrxOcKb2OcTg/e/Eh0q7UOX5L0cdrFv26hugRXfeDi8vLXoCCWp2sEoRavS7g==@lists.infradead.org, AJvYcCWW8neTTnQXXtLAEzgnTpe8Vxhx/FpCBrrYzkf/u50kXzxpAVTDXTp8jsHchQpxLrYYgNTge8GYVylvHa40@lists.infradead.org
X-Gm-Message-State: AOJu0YxaaOT/690QlbKUc92yj2SFIoZKpfkVNtgtmjN4xEaO5KpQSk+8
	kpdiiWPEa5CMnj7Tb1jfUzKDyTyvd1FdgUwzxt5yx9ohRSM+mSyO
X-Gm-Gg: ASbGncss44ByGG3MO/QCBkiQJg1y1j6i02lvBwdb9wekY7hlOxWhcnv4bm6SIWa5KX9
	5CaPJ7WH0Cs8jOaWX5hv4/AEPtO2AuhgCgAd/GTgEj2IODQdaNGlkuWz2jgNdtzqEV5o5HZ2LWe
	ylWhdGf+M069F8tI3K4ZIMd+jlZjSyIwKIfY3JwZ5e8dRaPCOPWh4VulPBKcuMNPU6YM/o2Oowx
	GKB68KpTPpncihNoCFyXZGbGoodKaohC1PHAQHjdbtzaJnz2orDFjvbSDH7cDhOwf4m6tdiLMBq
	+ZHD2lz2AS3tnJDZrfhsZkK6u0j2CL8PzcLdRw==
X-Google-Smtp-Source: AGHT+IGpv3U1XmTljvPm+aRio29IyVxb1CqNPRL0HcUV182tHRVmnYjMR4+uddkC3ZNgOv4PVJZSsQ==
X-Received: by 2002:a05:600c:5027:b0:434:a26c:8291 with SMTP id 5b1f17b1804b1-438dc40d36emr133099025e9.24.1738388750948;
        Fri, 31 Jan 2025 21:45:50 -0800 (PST)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c11b363sm6349836f8f.40.2025.01.31.21.45.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jan 2025 21:45:50 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi TV Stick
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250131200319.19996-2-funderscore@postmarketos.org>
Date: Sat, 1 Feb 2025 09:45:34 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Artur Weber <aweber.kernel@gmail.com>,
 Karl Chan <exxxxkc@getgoogleoff.me>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5D2DE475-BD47-4AAB-9638-3F1BF6C57811@gmail.com>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
 <20250131200319.19996-2-funderscore@postmarketos.org>
To: Ferass El Hafidi <funderscore@postmarketos.org>
X-Mailer: Apple Mail (2.3826.200.121)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_214553_663159_4BB438B0 
X-CRM114-Status: GOOD (  14.60  )
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

> On 1 Feb 2025, at 12:03=E2=80=AFam, Ferass El Hafidi =
<funderscore@postmarketos.org> wrote:
>=20
> From: Ferass El Hafidi <funderscore@postmarketos.org>
>=20
> Add support for xiaomi-aquaman.
>=20
> Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
> ---
> Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml =
b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index 0647851ae..0db7038b9 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -70,6 +70,7 @@ properties:
>           - enum:
>               - amlogic,p241
>               - libretech,aml-s805x-ac
> +              - xiaomi,aquaman

If this is S805Y not S805X, you should add a new binding section for
S805Y devices, and add the board there.

e.g. I did this for S905L (GXLX) devices:
=
https://patchwork.kernel.org/project/linux-amlogic/patch/20240604084134.33=
15841-1-christianshewitt@gmail.com/

Christian

>           - const: amlogic,s805x
>           - const: amlogic,meson-gxl
>=20
> --=20
> 2.47.1
>=20
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


