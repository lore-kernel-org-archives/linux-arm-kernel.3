Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD46C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kwna2xOk6dGjGj7gk7txAhtmP7Kn7mVAW9LcJaKhew=; b=ETnkBWNX6/1pUdULMOjX/uNtJq
	hVUDJ3Y+tCkPyOIAlnJQW7lbcr6z+5N3aH1sa+Xb5/FAFiOuoXnVuvWdJLs7zjkGipjUTvO8ExSoo
	iad5Y8cSiTT5GPM76SftspTjDYnQBkLojFafp+3cpcInU4QRjamuEbJCLq0eCONHOCfjTY243/AVE
	3eaLkziRj3VTrFter7ZIUpZMT7PfQzOoqt7FPzlhvxXrCBCnukk846qHynVkA6zTxaqWybY1CVd5R
	pwuGAGr3fUH8QekwAPG+q1mYKzDQKhzVujI4NFB/BGTZOiv8PXbMRo2LaJ/QYiIiFdxPXEWxhcu3A
	pO1OWG9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpsLY-0000000DQ3g-3MOn;
	Fri, 31 Jul 2026 18:52:40 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpsL2-0000000DPsa-3soD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:52:10 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-9030f8ea3b3so12607296d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 11:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785523927; cv=none;
        d=google.com; s=arc-20260327;
        b=Ig6TKKTyEeBlCTAs6nwMB366t4kFy3Nj8bfb3uwP6e62IhL3tyCziiDdzyes/3R1kc
         oYn0z5iO0bpfJfO080aRdmhGe+LdKSsgdmxTGAFCLYOPl+WakXaex1NNQAp8LXLiXTKI
         LOOSjGQijPZhQke3d9CuRv5brKFzP9QeEGLgdRQ4bg4My3WcEUrlcIHcp+bYba7GlFOV
         rGkvDCkHXZMFkOFBIVpLy+u9gEYl6ZMbMmB4ydxIR5FhTEgIFgHzcGlrPLB+dYZlIfv3
         LHJ/885Pj2A8UWBAm8JeKTOC+QcusKE2hDUKGd24nw2YeZM8yXiqgkwhwQhJnDFj4POl
         UukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5kwna2xOk6dGjGj7gk7txAhtmP7Kn7mVAW9LcJaKhew=;
        fh=MMo2ceZ/YuDrubn00v+z1VQ30X3ZsMGrA8VqTflpgzg=;
        b=RtjDPGTr7EW1g3H5IVAh72FFzydKE/DUqqYaYIbUjsGziqHGC836AL5vwixxgNm4bs
         vXdXfRWUuwcVm+LYiLbJ3GFTpzOsy+lOWjT6bmdcqlNqM7ejtzHJw4RYKJy7CSA9X4YU
         JPCL+4Pj7yc4cEqBM7HzEQWpuRDoaJxyyAfRcpX9bOYEI36pqO4RA8Ii9iJSvmBuR01H
         LroLfnwU8SNydfr1hg9Zk++Ir3o4H19Oi9KmG/AtuV9zMfaRKqyr42V9kamn5IwBBNei
         hMrG1lBTrSBvSDBUddcc/OH2Mkq/1OiBipsqBHNKEA+9fHuLcBMfgrpLpGoFQ+sj5CZt
         ieCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785523927; x=1786128727; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kwna2xOk6dGjGj7gk7txAhtmP7Kn7mVAW9LcJaKhew=;
        b=tOAXRyG7utLccrNWCawVWgY2ILO9gEYECfWDyDDOzlj74VeUR7bsz8dz0nXYSJg97y
         6V7SCyI3A4uM3/8fxFscmqIJbBOArDbRdIlKOpXEzI4H28p5JOLUIVNnKmqcQX7lvq25
         hgQiXKVklg7lan0FKqNRgYEVcW1Uy+R6laBWA3N39PTDRAAkVw18HFu26/xorg6HiszI
         X5ADBXVMHlVO0Za4IcDHRDRUewQE4al18eCIizI2NLbZOh1nD2CjMhWHqTk6roGn5Gkc
         0p1D39/gswobSgjBwzS9JT8D701i8u6r2uHJc9IZpW6of/qN3trHUybQzVsHcqLiV0gn
         PobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785523927; x=1786128727;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5kwna2xOk6dGjGj7gk7txAhtmP7Kn7mVAW9LcJaKhew=;
        b=E9/rko6Nhx9JaPWJu52dgiw5JP5/H5gtRYKD5YZcNBpcxkSCMWL3SdJZwWrZ3quEoX
         7AEexB7LdT+Z+IJWwwL2XkqnDENIGtHP/jLgB4A9NMfXyTiY/Y0mGSCo/14Ucw+5sw3S
         0XyzhfLmEpsKF7nrfX7nkbxK2bXnVsPUJSvDj1l0COY/13cktPGqNkayxm/avwA/ha0U
         VWP/NJSJJ9xB48ZqhG+q+jZP2qrselfZF0H06ciry1MsKzXpt0Pkeu9BkZbNffHI0732
         gaStPML5HPh6ucral+ZDmeSJZOT9qU1d1nwXXqcsPVmiXr4oJZDnkXuu0alk/SXOiJA6
         ZmsA==
X-Forwarded-Encrypted: i=1; AHgh+RriezQrC5h3zpbfKKuxA34cGkozkM5O1a6hgQjyQ42hhoXEMnzL7gqGIdZ7d+gmin0TQO8SUroWKtyBby3VSHlp@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4pENZkBer0FeZqtKG4/ucwRDgSfbXT82DBJaZ+t8jl9AyyMBC
	5idyfUenhCHyvaR1UhZXbY3g86zePxULa/QjCWV6Ic6DT4G8toaJW0OHb8Er7VM4kU1Pn5ZufaJ
	twkDP7rIau5efQBdgYerkMXhBiOVs6bo=
X-Gm-Gg: AR+sD11pyLwWuzXhyRcVFs68JWsWJZ9pOst0kSAQCiocX1lvqBq24F1aFnojNxTwayH
	OcUCFGEM6XWx/P5WI+R++oJo+EVpwF3sdyaphzdr9QIfafErtO4v/MyK3kCiIFDXkOk0W7sfN1k
	549ctxetW/6p9LChck9Uh+AkGQFdjeKBNoU+B1OIvwYJoDUr80UY61JBMp4uJCicLJ0kGzqf+j1
	XkmIOCbN4yd7Upis7JMqjiSvpekEKSME9aztkxvO0mmMgFWPfE58JN96PZUaIyYER2EsV48xD42
	amYeVsdlK8/OmJgUkkNZ5M3WhWKsxb3qhGOP+CU/GfOA9FodKz1goX1bfi692y9UgjX3cS/8nfs
	b5YmBzISjEbF5UAR8tyQtu9sb5RBiW7hNPhnm7+u8bDVLkstU1Hy+YX3J4RegTDL7c0We/oR2VS
	wwtVAQ4EEq7Sx9UAqmfAgwTG6XhwUO5qNGii9kYmviazeYSnKRpw==
X-Received: by 2002:a05:6214:4303:b0:8de:25f7:98bc with SMTP id
 6a1803df08f44-908496a5548mr23058966d6.22.1785523927226; Fri, 31 Jul 2026
 11:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250924085712.1040284-1-pbrobinson@gmail.com> <37220187-7369-4b20-8e00-0846ee0ee6fd@broadcom.com>
In-Reply-To: <37220187-7369-4b20-8e00-0846ee0ee6fd@broadcom.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Fri, 31 Jul 2026 19:51:54 +0100
X-Gm-Features: AUfX_mzQnZLWCFJQhCZHQY17kUuP3iVdbulRTa2AVQinjNouiLe0xQFMr_sqY84
Message-ID: <CALeDE9MfhU+hL-d1vruhCzN5vvb9LsR8YwDPOR1XmpLcygLbLQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: adjust display status
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Andrea della Porta <andrea.porta@suse.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_115208_970085_B9411772 
X-CRM114-Status: GOOD (  16.57  )
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

Hey Florian,

Not sure what happened to this, you said it was applied almost a year
ago but now I dig I don't see it upstream.

Was there a problem, or did it just fall through the cracks? Should I resend it?

Peter

On Tue, 7 Oct 2025 at 22:11, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 9/24/2025 1:57 AM, Peter Robinson wrote:
> > Typically non critical IP in a SoC are disabled by
> > default in the SoC .dtsi and enabled on board specific
> > configs. There are usecases, such as some CM5 carrier
> > boards, where display output may not be desired or
> > connected. So disable them on the SoC .dtsi and enable
> > them on the RPi5 board.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Cc: Andrea della Porta <andrea.porta@suse.com>
> > Fixes: 25d77bdd7df2 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
>
> Applied to
> https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
> --
> Florian
>

