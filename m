Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55465C5B568
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 21:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00UMNsZMIuwa4W4w9yZAhooOBNIlUqJFmFbp1iknh74=; b=Mchf7t6cCDgg4GZl1mMzA30BPM
	eE5+I7VgqWf0yZSkuJZnvJZbpewis8T9Fxeg7Sa9YweDmpHOa6lNwQzln+VZl+SvxiapYlfZ2djg7
	IfC7RWLATRDngHsUS5M4VMeltmzlYXKhf5FtTVD9omOXhpIz6eT2zlqB5J9c1hhrXwyNk+xYI34dU
	SZ5IPGP9HQQ+kxQd632aCnC12+QfMxd6JVnOVtf9tmr+w96iD6+o6M2T30M/hOvmOCsKEt2kkARKu
	quvZjzSfZG2wVjfggxtprCQxuGq4bGOAzRmcR6o32hiNk08AF3GSftOPLnqk/ry37AfvtXOn0MojA
	DN8YOQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtXtd-0000000FcRb-1TTt;
	Fri, 20 Feb 2026 21:18:45 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtXta-0000000FcRG-1Rdf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 21:18:43 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-65b9d8d6b7dso3586478a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 13:18:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771622320; cv=none;
        d=google.com; s=arc-20240605;
        b=NYuUCpQC8IXK1kCSkxWdgXDyhwat/D/MyUqhMNdgkOagMcgWR1rx3gJ0ofyx6Nux4q
         9vlFMh3tbCgMZJvwJb/ktjeFJOn7AmjWeVW26rVA9Pk1PxaYIn/FE0GgIN8NUnMklRrI
         2DOyO0+m1URhXomCpm1AEZ5X/5NMyEEHw+vnXIzwAlBI1TVdgIYK8x0EL6B6D1Z3Xkba
         aNza3rBzKN2Lsvp25Xxi+beDbwlHi8wdfrihVpDFzqlM4ghAQzosH7TyyxkA46yCAfJE
         WUQ8FA/9km67HMIAehnAFkmz0pgEj3z9eOm0dJ155bMwhOyCZJZ7hI1At7O3YYMCUruM
         wPmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=00UMNsZMIuwa4W4w9yZAhooOBNIlUqJFmFbp1iknh74=;
        fh=ghSlh07yCpfpLBiHICtAQ9Q5/jQi1DPF0U+V/1I9QeU=;
        b=dx++Ee5NMyLXoLjzmRV8hGPQI8iTQYDKuxAPrE2YQpbqkIAcH8z5YXUmv5CaAh/Rut
         kfk5vN6O1mZ2FtABqLyejMFRkbSUoDIzur4Fya6plNj4ebIWJuLz6/8bHs/mgbMPi3XO
         CIXnrtYokUrr3Ezm15lsVrJniNoqQZxjlkbIrrta9Zvct4s89pFFzXsdjUsb3/sh4qkh
         kb9oy3cEG/Zcf0w3vWTihLEeQWMLRZgNfOA7sNSpCutDzkrR+HFzMeNWeWVpVpWVtN4a
         Ph0ChneGxZZE+olCo5Z9YIg1eXrRRk1sw8WLhB0kruNBQj0N64cMYZ6MNRVfI9fFyY/L
         medQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771622320; x=1772227120; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00UMNsZMIuwa4W4w9yZAhooOBNIlUqJFmFbp1iknh74=;
        b=VlORYmnTDHVTufXKADkqcbKe52CB/Kjul+4lj8SXaID3YwglULIBdnOzS5Rrud/JF5
         XWzYMJGdOifDy1dRhuNKfRrTDzrcypy9XwmzVLZayIeU/mK01iMv852sdsquiuGOCsU+
         cCqxMppEZuzl8KUqVe487PkVA6HuDR844lNwg+nV0v1DoDyJbigzopbzWKcUM8wv2hFE
         4TB9Jlx3TTQ/vEYm+J7tCc4IgsZYc8sr8Z1jD8qYKUsJd6vNrLB1JzhS2D7NcA/lTDK0
         xPc2vpOVeZq5gmvwMO4Rq6LtxuKFMKJQiSM7n5furIlDayBaTLiyPpJugoQrc2QYOmyd
         eSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771622320; x=1772227120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=00UMNsZMIuwa4W4w9yZAhooOBNIlUqJFmFbp1iknh74=;
        b=WJA67BSEiPovXWWV13DC0oOVhW86pQYO2RoG2QEp/ocnKsaTx0RSVJWdNr+nPW+EYY
         qho3IHwzYWP3oHvhfjkTolPo32wyhQKsYluHEoqE08Udw3xXVVwm0uCK0TVtQii76F9K
         BCNYDv5J2nOMDqif6SqLVEImeey5PyMxrWEYaI/ZUoc3UBD9A8p/AAEX2RpqNNyJ9uIL
         Eyh8fvWILaDBS4AGx/UU6eI2hHeol/E/z2cyJzLivLXjqy9o3K2Q5bKTpkUa5/X4vO6M
         f5yD+bTTCk/vNu0vA48a9okfLweIxw9pwturvBRFuLdKaLUKO6j1xWlvtj08u4I2ttfz
         xHPA==
X-Forwarded-Encrypted: i=1; AJvYcCUeK+Qs0IGc5Yb8CbMFNvhQ9IKuYS/+7hIEwJn9z/0qPQLPZT08+1SLeUwygaGzeztmGqLIQptbKsB1DCdinvQR@lists.infradead.org
X-Gm-Message-State: AOJu0Yxui0oEdF2GEgsqP7A6khA0iHjjC8L6Gke2X3KN+lh10NJRpveB
	P1RAwoqGEQBG2O06keCnGzTNmuurawO6as79k4mknJPScWKTa8PbR4zheghdotfbufIPSHMHdaD
	PjRMJZ+ROLMb19IB58lyfGHddt/3JFTQ=
X-Gm-Gg: AZuq6aJQMhgrUlqQ0lw9euSTrRHDZ8cxnJ/44Npt0J41ag6VsWyRlKjxVBGvuCEyxX+
	tvrWQ/F3w1RKpNGTBDsTv20Z3U/iSKgfSYWc50gWL4DWBNAIepHAUifz/f4urlRI6Vs9I1d8sEk
	brYx8pqgUTtEXFvFtdo5stOhtvPEg3nUpe5iYzuFYFaqtGUprkLXXO72+c6eUVyy9/w04CkSS2F
	97jr3ZX5LTdyw5qsHzTaaSF8fcZdTWMnZPwgSaHlwn/e3hqL1iu9xEVzU/WO8eJKgRyEv06levp
	ZOpDOgUHYdoE77sZuFrh
X-Received: by 2002:a17:906:2485:b0:b8e:7208:ffe0 with SMTP id
 a640c23a62f3a-b9081bd50a9mr42926666b.58.1771622320189; Fri, 20 Feb 2026
 13:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20260220021353.40554-1-rosenp@gmail.com> <20260220021353.40554-4-rosenp@gmail.com>
 <CACna6ry+K6q_JY84j7OjRWALsUDU87mpAiikF7cpUGDUUYhZJQ@mail.gmail.com>
In-Reply-To: <CACna6ry+K6q_JY84j7OjRWALsUDU87mpAiikF7cpUGDUUYhZJQ@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Feb 2026 13:18:28 -0800
X-Gm-Features: AaiRm52dBh1cJLACjwstU2ZyGWFeLePJIQVxzxC7WdYWCADMe8LsfJaH7Q_6fMY
Message-ID: <CAKxU2N_V=VWXtpj3qYcPQ-SOYDyA+wrg9Mb4AZvWMQUDnARVFA@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: bcm4709-asus-rt-ac87u: specify switch
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_131842_397474_CA9D361D 
X-CRM114-Status: GOOD (  13.22  )
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

On Fri, Feb 20, 2026 at 3:18=E2=80=AFAM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
>
> pt., 20 lut 2026 o 03:14 Rosen Penev <rosenp@gmail.com> napisa=C5=82(a):
> > bcm-ns.dtsi specifies a default layout that is not correct for the
> > RT-AC87U. Also allows setting the WAN MAC address properly.
>
> How the basic ports info from bcm-ns.dtsi is not correct for RT-AC87U?
> I don't see you doing any overwriting or /delete-node/. It seems like
> a standard NS device with BCM53011 and 8 ports (0, 1, 2, 3, 4, 5, 7,
> 8), three of them connected to no-SoC Ethernet interfaces.
This comes from a local OpenWrt patch. I just added the nvmem
definition for WAN.

There's also the addition of labels.
>
> Except for this unclear commit description, your changes look good, thank=
s!
>
> --
> Rafa=C5=82

