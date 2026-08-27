Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DE5C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 11:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WdDC4sV3epSU/xCoz/N1VgwbDwuBbVuoylTs5Qjj+4=; b=JTooLmb+FJldJynF/VQypGBdW/
	RILppnYt/JtWrqmdEDMy/vaQp8Av38QJsaywTISgFlE+4cP0LaALcmid0ghNrzzmglPjrfhkXHRLG
	f8Q+BBMkMnV/lz5FYG6lrLsdGXrGQ75k4TT92Lkp6e7RTjCIlvvpvSB3BxfjeAp3nd8+ghpDofMqE
	jWUYc71EsDW2mPPZu8PXAZMvH1lEkv5mVgwgWGe2UUSusQGu8aOkmlr2HCIUOCxu2RKFtoJlMmPEu
	/zGXjThczbkabH7Qi9GOWC0Ngux6Jf+udAj4jYZnc5VRXgp/1YiGRqJ7z02FRXlbVKXBJ//o0z1w9
	+72WZS+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYjs-00000003v0l-3soY;
	Thu, 27 Aug 2026 11:57:48 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYjq-00000003uzk-1nGn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 11:57:47 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c1600d040e4so142147066b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 04:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787831864; cv=none;
        d=google.com; s=arc-20260327;
        b=RiIdBGzEOaI3DesOugbGbhdjyR5fWKKCCJzqCmL9ovx00uhQG/XqLbrI2nfsixrMiY
         Qt3KJQqwJ1f65YRC0VyTRdsBLkLf0GKBeofDYIbIOUKF0sjePfY3mZv7yWAjPV6AMXl1
         fkJrQ46VuGbCkubg53Uo7TxZSXbrNZBgzz1LhEcmjKTbLZfOXhYPQ2P+cLAxQX+rvHD7
         lqYk49Dgz2IBM6EjK5JcrnbgHSz/P6VSG4xgxf4M0S318LCgan+sy3qRNPTy4C81mUwe
         oAMZD/Zt01dThYbFEhGkkEl93j/kOq+G2APDbDinWEeFKCaYv4iO2vb9J5EJpNg9THJP
         qsrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6WdDC4sV3epSU/xCoz/N1VgwbDwuBbVuoylTs5Qjj+4=;
        fh=H/ZjQs0jg7xTLquvoID2aN4HWZRJS19uSw951P9d4VM=;
        b=HWYWsmjczE9PBSD8kJKL5q7+3fmt1TwNhMsV4MksuVwO/J5LEHqniqcP0NTQjf7TbE
         LJ4IuECw8kFdGV9jFtE4SfUeQM2vQB1tUJyyqrygCQS/0k0+ceedPhO92dfMGNSroi78
         xM9d30RZytePNX5e7UikXLe46q27TiMSw5qwC8lRaCVXxTyU8Qeaguypn1xqWRqwd+lC
         oo2eYl0geoQRlngeEYyPcl6Gk59u4IhLC1AesnjyqIwMPzW3f5kBV8UQYILTE5qab95G
         Ts4VuKqZMelZdCiHdCM0PBunFywL+xpxhHDksZjpwwXAz7kj3HvnRR22zvGmjtbjzfvd
         Vl9A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787831864; x=1788436664; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WdDC4sV3epSU/xCoz/N1VgwbDwuBbVuoylTs5Qjj+4=;
        b=VQ6Sq94p3FUucPwmpvHPdWDMb+Lb/wObuALcAHL67kO0isL1UPAQ/3JVL0NtfMx0XZ
         Pi5ZafCOe/PsfrWazvC0ZQppq8JtOdgqLFJ0xLuXGoGNP4UuS/dMYbEBC5isOZF7SPSo
         mEkiFmQiFZkCyktHhB1MAzKLClfyYDZV3B3r7axz1ZAoGX42BP+EACfGcDbw/ayZcSeP
         8kbvQycsD0cwdvfMc9JQCvZISYuWbnYlAEkg7U5jjZSTuD+yCo9Jy1lklHh/QRDWogB2
         ABSEJWgrzkAE0P+9hBsFfupqWDo/b0zmiKsKMvArDIy2DXFCGLgrAdjCf3z8V4V8p6Xc
         Z2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787831864; x=1788436664;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6WdDC4sV3epSU/xCoz/N1VgwbDwuBbVuoylTs5Qjj+4=;
        b=rz2lkSYBL+8G6AhvqEz7i8Zzcst1RrNKaqTkcZsOMOOykevt+ugRSRtB3oy8cmKR8x
         OQEkKhp3YrdV/cFEXEq+D4xgXvRNOzkBNzRTP9ti3A8ph0YtSyGVNUOfB2M4Ei/OKPtq
         hExKaLPAohZFd8cF3i5T8fBTOjDzlItRV9Qsh+XytkiuibvV/NE2+6cRh2eGWO2eM6CF
         X9S3CjZwzaXZhIU1VLqSsKJfnOire0Jk4KfFl6tAJVz1RIiXvtXVm55OgaQVi4hi6W23
         jotup7a+rw7bJKl0ft+SeO37B6mNTO5Ml/l9By4RNf4UZV0TKOScki3CrCHGo/oEfy6/
         Bwhw==
X-Forwarded-Encrypted: i=1; AHgh+RoId66nqlQB+TJWVfJ83Ns3tijcCgL8BN0D40rc4TGCj1i9S5R8K44Jn9RTbQNPz27BgNxO/b+Qz6crocFxfxSW@lists.infradead.org
X-Gm-Message-State: AFuF++lUUl6jyteOtiYo0GmV7YITWYuk5Cy864nzenU2u9zJa6WvFeFR
	3YBCqphI7xLGreO9m5WbMTqw5XNW0BOdv58n+95vBS0TxKGqy6X3yY0GkSCRRnn56upkNC2spbC
	Zozcd3CCqW0nvk9TOIXw94Hjiob9ZZqQ=
X-Gm-Gg: AR+sD11AmMJf/KA4bEXE6z7I9cNYBgMW5wBeSxZmmR/e7113z36UoXqEQo0xN+xRZGE
	ILodBNAAoAZ5PjLgNKULN64M5voGy8jtTY3skIR8qMUxaYAFaSDAbfkZz8saH1GXB6wzD7t0fe5
	/lH6dOhnVQrNOWN8DG9rvtzuPp8cGTv8xfMqwprdB0dw1xwvbflz8ApL3jwlFhp09YXQsj0nJD/
	L7ShWLM1cMsVtt78VLBYOhK+G95rUjIC9gU2otFLVRwmwkyzlzstsjuv0D8+RrGry8J4TTV4GAN
	QDB6OHXbf5KLmSi0jyn5pP1nLF2FypdfdSOngCcESDg=
X-Received: by 2002:a17:906:4784:b0:c1c:49d9:4c34 with SMTP id
 a640c23a62f3a-c25360ae6f6mr459116966b.11.1787831863644; Thu, 27 Aug 2026
 04:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-2-l.scorcia@gmail.com>
 <20260811-amethyst-seriema-of-gallantry-ca9c7f@quoll> <CAORyz2KXJf4gU46649w1ncb7TAOErdoGmfOMzwKr8b+eGdAgVA@mail.gmail.com>
 <20260812-smooth-artichoke-kittiwake-f6e85e@quoll> <409e398b-eb8f-48eb-a0d3-ed8fa811328f@kernel.org>
In-Reply-To: <409e398b-eb8f-48eb-a0d3-ed8fa811328f@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 27 Aug 2026 13:57:32 +0200
X-Gm-Features: AcwNN1X9AttqB8t1bj6TQbgbNwwMvZ74IM7YuKbj9WRorR3Nx4t8S9M-g6F42ms
Message-ID: <CAORyz2JbOsiDYzCw--Y-tiRXEaZ69B8S9Hjvs-j5WZmtck-ynQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: reset: Add mt6589 toprgu reset IDs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_045746_597662_B0E19AA8 
X-CRM114-Status: GOOD (  14.62  )
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

> > Then these bits stay as is in DTS but bindings header is not needed. You
> > can have of course DTS header, as we did in the past multiple times for
> > such hardware constants.
>
> So I wrote above this to myself and can be ignored completely? Then why
> would we not ignore your patches?

I am sorry, I'm definitely not ignoring reviews and I'm actually
trying to understand and fix my mistakes.
This reply refers to v3, but in v4 you reviewed earlier today I added
reset table support in the driver, therefore in v4 those constants are
IDs instead of bits (and it should help cleanup the other MediaTek
existing bindings if deemed necessary).
If they're IDs that describe actual hardware capabilities, shouldn't
they be located under devicetree/? (Again, I understood my mistake in
v3, but in v4 it should be fixed).

I feel like I am missing something that's very clear to experienced
kernel devs about the boundary between kernel sources and device
trees, but I can't seem to figure out what exactly. I'll try reading
the kernel docs again.

Thank you for your time and patience.
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

