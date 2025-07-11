Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FB6C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 20:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0H6HqwurK8du4Yig7CnNYD3RLplnogpWij/DKV6wnM=; b=jF8nkPGm3TY5v5KZPyvjf1O6PC
	nK9iz2piWO3CRd+E6H5Wctj+0d/PEdw1fKBaHqHhrjer2XrgS65L+YrVgsEE8J72GHET5C09YxHbX
	KK5p5ZFw+0mxUv6Rt9oxmqahlr9oC6EGrNWF5bsuewIgcvnGHtLj4bB5X8CMDeUqQiZxsdRU8D9IC
	ZA/b+iwVK39nC+oR47dhMz5llpxzen9SIhCgpyU9yhZ+8inNzpFDaBX5wM+KfU0QxbSP9mrBpRIRe
	JcrmaHWenrcXyKvEb+Bl2Pa6nnYiUuRNqcW7vwXdpbeWTZERqyiI2O564EwcJ4CG1q+Xhvcd07YjQ
	2unHgbMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKCY-0000000FmB5-14FM;
	Fri, 11 Jul 2025 20:18:34 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIqw-0000000FaCX-3pGh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:52:12 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-710f39f5cb9so23053717b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 11:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752259930; x=1752864730; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0H6HqwurK8du4Yig7CnNYD3RLplnogpWij/DKV6wnM=;
        b=jGTw/9PcqqbDCeTkNTeGwDWREUPStPdpQUBbl/garXeee/0cr5QNCaluebUrjDeIb5
         5oPkzDOvoNat7Bl9wUkdpAmoJpwfJqaZmk01ol4UCpmnZlbpYlVn2F+Iktf4XVmZiNrm
         mkyebQcbzvvwhIq8kNSCefO6oEqVgmeQdln1pfm41k9PFrDnV6b8H8PAPcCrhtfIHC0I
         QWx8APlJVJLfTEt1uS+Nsqkt4roh5Z8hVC0m1+KGauGSMD2yKsPVfz8kRu1+IjDZ/wEp
         klrI4wqNkoflVeqdW8jhAQMxiA3JbpEg61OBXZvhNqX+CE/baxif4sSDgvAWYx+g9EZu
         uh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752259930; x=1752864730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0H6HqwurK8du4Yig7CnNYD3RLplnogpWij/DKV6wnM=;
        b=mg5xdQaN8up43uoiUIPQrLCvFzt5/We/sDniDWRCmKLj0jBcakBIVjVZG4ZFiSmpAO
         s2ZCQV8R9x/WqrAASzWZ2w3GioLBQPqGJHrLAUsdXGtSQ/CmKzv9vz2vFYYpMGGW6ZO+
         qQz24oEk7r85+AD4vJqkk5lQ5E48MwH6LSHQ28dbbnQfUb1tOS4zDsGX67teTzw7kQBG
         XjlpdL/h4ET0PQCbayNY3BQ9UVRVJgd+Vlj1XNZVsO3qs99GEtX0sldR6LQkUFBu3at9
         Ic4hBZvoGdr2ylz990YdnI17ITF7PqL+e/1ly2SlpGDkGCTstXMGGsDemGQMLy0njrj5
         1LRA==
X-Forwarded-Encrypted: i=1; AJvYcCWW7nEgTujgZ+4nyTRFLiNwM1VTenzdAzwA0IdfppENzFIuAPaJPUWzjdWeqWHFoU7iZEfC67esNnEz9SknBE5p@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu3ZHWWUBxyDWhK1KmSSKH5GUmZdbpWIRfpD9vA55vEEekEmPx
	5cr+fmT344XhnUaxKhyZDa+r2J7TPpb7rECxS4uVLZiAFMgBQhNpptKDpEO4uA5IA07JBIWp3Pf
	6m1VlFEyOYY2Zs3QZctC+gtuX1xal3lQ9uTM5QzA2tg==
X-Gm-Gg: ASbGncsdkmedCikhy1UmXvbo/wHT5CPWpqN95wtWwe0xTMs1nLJXAcSK98bcsJlLdSv
	lbih3iKR1lydAg+/G93Igq27TTam+Ma8Buufaf4t50MbMSyiKHPUrK0eZQOZuYIUvMfvj1DHMOu
	dh0V13hkErVL2D49eYtUJTqVDLsHzrnuqwd1VfN95r+8fDdaMy/9T3Kt3wBaG7DSxUcfe1TQk2o
	Rm8Ry4=
X-Google-Smtp-Source: AGHT+IFufbqtAPFq7ox05U9WlMb90rIorTP+4zmeOZAsbdsvZ9oDhtS+8uVsO137m7BSFuFbQhKQyBmLxkmw/Jfm0ww=
X-Received: by 2002:a05:690c:6ac2:b0:70e:73ce:80de with SMTP id
 00721157ae682-717daeb302dmr49577697b3.25.1752259929914; Fri, 11 Jul 2025
 11:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
 <20250711-hdp-upstream-v7-1-faeecf7aaee1@foss.st.com> <11a49801-d187-479b-865b-810ca5adbf00@foss.st.com>
In-Reply-To: <11a49801-d187-479b-865b-810ca5adbf00@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:51:56 +0200
X-Gm-Features: Ac12FXxNxgzgzDBEHJS_Xpef7MtqDivB9Et0gKV7kxfFrSfbv0PvRNxLHxkuJiA
Message-ID: <CACRpkdYXQRGO7BrF9+08StWyOkDoqLhNQdgk=bhoccg1BogpqQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/8] dt-bindings: pinctrl: stm32: Introduce HDP
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_115210_954048_A3B5D6C7 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jul 11, 2025 at 10:04=E2=80=AFAM Clement LE GOFFIC
<clement.legoffic@foss.st.com> wrote:

> > +maintainers:
> > +  - Cl=C3=A9ment LE GOFFIC <clement.legoffic@foss.st.com>
>
> Oops, need to change the mail address here too.

Don't worry I fixed it while applying the patch.

Yours,
Linus Walleij

