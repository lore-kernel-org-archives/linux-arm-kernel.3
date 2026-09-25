Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECCEC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdJbeVGqh9AgSmmj5nG5sf7cECD5ZVbeKNl4YktWcOI=; b=SsCY3XyioKkgNlT99hntrFhZTh
	1rRhsKz8dr2fxWUD6lhkajvvnso00Sqv3uRM6BJRuivYqcRjmGUBhSTx3GGAUheGI9BBYa9t9RkQ4
	ekJj0XEgMCJKzwHSmUzmCSYdJ2/0064ypkouvojDBbfCDN8ghYp2XvlU6cJiRTBx3Es+bInk2mOcr
	PYf2x288p1kfV1EFvbyon3d+yKxGo38AKEVfHwu7HzbIXoQENECFKyg1T2LIWgY+Wey+67y1DaX96
	bD6esVnqVHGAQG0NOOnhQRbH9heCGrukRX/rGLIWvpiHFHR/HI5kh2zwmGhjszFFfvZeHjSuB6EVP
	HuICNgHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA84a-0000000DpdS-36o5;
	Fri, 25 Sep 2026 15:42:52 +0000
Received: from mail-ej2-x0e.google.com ([2a00:1450:4864:34::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA84X-0000000DpcF-2S5Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 15:42:50 +0000
Received: by mail-ej2-x0e.google.com with SMTP id a640c23a62f3a-c2b40e4744eso15705766b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 08:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790350967; cv=none;
        d=google.com; s=arc-20260327;
        b=DV8gT08CB+OBO7/MjSVBkBmICzLSoUQ9Y+ONVZPJpgIQq3E2VupQTs4cuDKlJT1P/5
         Zij7qaBRrMgTvBU/rLqY0bncFNirf6VAqtLa+Fn2If9Da7QfgIATGd7r3ju22iImUpn+
         gYcKs+teWYyQVFjqrr2V2aXT9wxFgPFzP/bPyiZSgslAgzZF/4n28iFaLoGJZircEmzU
         MCAZsUBxb1Q3gMO4As/7pkfrgTvCzD5HmB6vSVS1HpZ+0yLsXcGlcz6urjggy7X+mn6s
         Lc5FXyfhE/cMCmUa1kALoEtguvq09XdPsIFIX2TEaRhT3Lwg+Er9XvZoQE1p0xIx3t5A
         5oJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YdJbeVGqh9AgSmmj5nG5sf7cECD5ZVbeKNl4YktWcOI=;
        fh=ojfJmYAwguvwJ2z19SOwXI5Z5FlmkDlYtByak7jvHkk=;
        b=RUAlK1zQyT8NjmWMv5cJW7qnXZ01STGlqFpqasEaukrlLMGe3tIlTKo2tbVdLrXojY
         yQijcuC4wA9x2cOvprFmpJUyT/NHIAyMV71AZBMiTVTeJ029x+Ew7nj2JFHjUMAJMNHI
         YztHkPF7uNlF8KKHDQbtk7uvOsa9XVnUUW4MLFKs2Y/weeaNF5eMDL2wePUGgevzzMWi
         m03i9lIL8VP+OQmjtvjT3EIpsS/cJaFrUdHacxxySx44HIl7+jY5rf5nOR1NkZ6mIDoI
         8iPWeu23NPKfqy543JFG4UtkEkvldVDGp7WSTH3ND4yj/o68QWtcwaPHyZDENdofYPG2
         j79w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790350967; x=1790955767; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YdJbeVGqh9AgSmmj5nG5sf7cECD5ZVbeKNl4YktWcOI=;
        b=aFVSRYWrbRbP5it/+8KBwrswLFn5W/c5P3T3KR6RJ2FzHy8cNONFM89Vk9tF4fgmph
         7QrPUGyyuK3jzuqgeU5F8+jBiCs76jrwJfed6GQc7wfPbLEXM52v7cjbes1Y8Z1pgcAG
         vt7sl4dAs1YIwcr6WTCpcOLvPFVQcVWAoVEvBtvzoLdfL6xMlDLD4nOfYKUvVIeu02x4
         bnYD2hp5H6a08qenzt3aNTt8QAnOXkoWs31EIlK4jevhHvgmHqfNPBE0WiVr28KIJpIm
         vFkQ2d0DovvCiR7VXpiwkGwURxauHzQvcLiNm7hI5bFkccdLXF0ERIIAxGagGJ6H98Pm
         cApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350967; x=1790955767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdJbeVGqh9AgSmmj5nG5sf7cECD5ZVbeKNl4YktWcOI=;
        b=e5a/N+LsLdrFzAFX8zBsYOXZzqi8AGR7Kxr13NlR60FHXH2yB2NjjJOb+VFJZ182AY
         apYmyHWk621edpQ9+1wQP8EXH2NLnmAJWuqt6cdjuATf00IX3LtZWNhh0+E2/oDboMzp
         3sUtyFiMXddJ2U7fTwY1vlq51gsWghLpwNhWCiK4+xcl2KIYlvubMr11vLYqq4fgw7TR
         UybhgsMVtgT/yDYWCqkX4c30dKKLuVWRlhk2QrWZ3IVS0+QrXahpt3h1oQRwf0MaktfO
         oBEjbAoWBceQaEvDbNQWNt2yF1Tvg5DbLA9+5J8muNoknddwtIV6QzCXUgCMSx/z43W8
         NXzw==
X-Forwarded-Encrypted: i=1; AKwUvBw2U4HSvXhniC2/KNRFfH19ZnqXrxAC2r9EsCC18+nFFDmnCpYJC7+/qIb3PBqcn2GuinOVFkQfMx5Xsuh6fn4M@lists.infradead.org
X-Gm-Message-State: AFuF++noKTgQ5/fBbfX0DZeOZXiIyW1Iuj4F67YtwXkHsswCg2CK1i81
	s3Eh4p+lKX4TWW6H8dos4gqFKMUfNw6ivm5bPk2m4A550nKUOmXGu9PHIDuwD5BFAUU5ve+Trt7
	oC3Sb3kU/qta0ffeIOtEZOZGX/2AlHfpQ/tsWVrST6Q==
X-Gm-Gg: AYBFou12GtbGOjSEDLN3wq2BGdZ3xysTe2fT8YNrkkhGk7zuMcPw7DPRf/AeSPR7gYE
	1wA4Gi9/hUJEum9ZT3sDVJlpgHnZCZPLvQRnRc8OezurfbxLEV43fHFa7lBMoskq++9j4dxvkmh
	ZUCZOKcyX9H7KkD7yiBQ+GBYwkL+ffI+JsIpn7yQey4FvWVeKqIYdQfxqS2hVvj6DtXlYrkSDR+
	ifqZiHK7K/LLg3fiVgvTESEuKEu3Q+LMJ0Mig9NGRt5FjFbH168bCunrtqgDEErhppgj/VF3giN
	o1W4R4e+ubTZzb/VB3fG8ogUJYbl+4bi7gxYeKE4Y8orfSAdA4IoY0Pl
X-Received: by 2002:a17:907:c308:b0:c28:ec7c:27ae with SMTP id
 a640c23a62f3a-c2ac5396f65mr492269466b.25.1790350967019; Fri, 25 Sep 2026
 08:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260924071445.441822-1-adam@wermuth.pl> <20260924071445.441822-2-adam@wermuth.pl>
 <e03db2e9-085b-49ff-8d4a-bc112bc4ddd7@kwiboo.se> <CABkrwJ6uvjS8bez6j0MZbp2Y+O9RhyU09YOLrUzHaeUEVC=Qkg@mail.gmail.com>
 <arZ0nqBvHDzSbZOE@venus> <CABkrwJ5xdMcRJsjubSJcfMkTs5CzKdAvQK83Xar3gZPvO_wa0w@mail.gmail.com>
In-Reply-To: <CABkrwJ5xdMcRJsjubSJcfMkTs5CzKdAvQK83Xar3gZPvO_wa0w@mail.gmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 25 Sep 2026 19:42:33 +0400
X-Gm-Features: AclHuK-2aRN6dX_Oa2Kxhd9aYgpoKvv0HzTIcerNNDpaAcjfSDE1KhpeMcsyZ5E
Message-ID: <CAKTNdwG8YB7j-TrfJUr3f=7OBYC1Qx55Yu7ax=_C2NOtgNVrvQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa
 ROCK 3B
To: Adam Wermuth <adam@wermuth.pl>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_084249_632638_34411176 
X-CRM114-Status: GOOD (  24.10  )
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

On Fri, Sep 25, 2026 at 5:56=E2=80=AFPM Adam Wermuth <adam@wermuth.pl> wrot=
e:
>
> Hi,
>
> On Thu, 25 Sep 2026 3:26 PM, Sebastian Reichel wrote:
> > Why would this be better suited as an Overlay? Nothing describes the
> > specific card plugged in as it is auto-discovered via USB. The
> > overlays are mostly required for things that cannot easily be
> > auto-detected. FWIW we don't have M.2 Key M as a DT overlay either.
>
> The overlay was Jonas' suggestion, so I'll let him explain his
> reasoning. My own understanding was that it would avoid powering the
> slot (always-on supply plus RESET#/W_DISABLE1# hogs) on boards where
> nothing is plugged in.
>
> That said, I agree that the module itself is auto-discovered via USB,
> and the Key M slot on this board is described in the base DT as well,
> so I'm fine with keeping the B-key slot there, as in v1.
>
> > Something to consider is, that for Key E and Key M there is a proper
> > DT binding now: Documentation/devicetree/bindings/connector/pcie-m2-*.y=
aml
> >
> > We probably want the same for Key B.
>
> Thanks for the pointer. As far as I can see, a Key B binding would
> also need driver support to handle the supply, RESET# and W_DISABLE1#,
> so it is a larger piece of work. Would it be acceptable to describe
> the slot in the base DT for now and move to a connector binding once
> one exists for Key B?

Key B binding would be somewhat more involved than key E or key M. The
spec defines 16 distinct interface mux configurations selected by the
four CONFIG_X pins, which neither key M nor key E have (PCIe vs. SATA,
USB3 vs. SSIC, different audio configs, different I2C configs, etc.).
So it's a bit more than the supply, RESET# and W_DISABLE1#.

See for example [1] where just the PCIe vs. SATA selection is defined.
A proper binding will be needed sooner or later, though.

[1] https://github.com/flipperdevices/u-boot/blob/rk3576/board/flipper/flip=
per-one/flipper-one-rk3576.c#L41-L172

Best regards,
Alexey

