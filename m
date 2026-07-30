Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BC3C55167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 23:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1swx6ZS7vRHB6s/IgYx4mgkiMyCPAEEjNZGLF7mxwyE=; b=zGMVm9ETMB6NXjgT+8knHGFXDT
	iL2kVGjEsquU94jha+8YqZo+b8Q92ZKT5xacNhebzA1ff1uc8iFN+qm8Gfv5GezAtphZJ8NaJuAVg
	Eyo8DIIdMs0mKvLPr1H0hMCXJK003lTocNsQJzaPaUnqQSGI7msPng4gSVVECFtSXTM+HDp1FI7eI
	9bBFKuAF8APA4YlUv1YcSrpOHBySq0siWRTeEQiwRbNGG2yTbzq3ZBi4aNQc5xHHWjJMQ1iS4oDi4
	XP+vx7XZCRzZuAQDoYlJX9jqB7kd05P+sfjob8fs7lx5qdcdp4BKvUSzvOpv9T1lxqCinFx9Be9AH
	A+Jyr89g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpaFy-0000000BVao-455F;
	Thu, 30 Jul 2026 23:33:42 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpaFw-0000000BVa5-1MsE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 23:33:41 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-5c30d9adfa7so157572e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 16:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785454418; x=1786059218; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1swx6ZS7vRHB6s/IgYx4mgkiMyCPAEEjNZGLF7mxwyE=;
        b=PQR8fy3pRUc6zoqK+2Dg1pUfSSyCE+5eR89LwAgMM2mxurfeCVjfmHPn/Kw4pBbrkS
         p57+8fsfs/iTcOGHswSvP5Awzb2CUPbozhEqI5rgh45vhctEn/hthyBrg+oIvBcHG0zj
         p4mxpPLcHwHkSiZ1BSvfIb+mZBo79Bfudd17Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454418; x=1786059218;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1swx6ZS7vRHB6s/IgYx4mgkiMyCPAEEjNZGLF7mxwyE=;
        b=RPfzOBvZuwuXG485ykUnD88avsbo5h6VYPl2qIFLYHpPjGBHJ43Fj8CtpJBEBpcq0A
         7ceBCImRtLCTlj01OYX8WEDLD3iBGhsWRz+4bBZZfgpo/dlgtFTG7QzDCvEyjCltFXRq
         4SYL9TNI4sKhB0/jdLPl9pkeDhzRUo9oT1Jr90+RyalkVYmuTrfMTvhCXPm+JOUxaqsE
         5B0H0iJjf6MZxSml9i53jiOK/0aKyXMjf/yQWhsyF7djgJc28L3MUbhpi94Jf9rJoZW+
         OYYUk+l+cNFQzbzj8Xb4a0tppq/kBMlI7Dv2znA1ctLW2pMwy/t0J7M+S24WNOYGbUzI
         5gOw==
X-Forwarded-Encrypted: i=1; AHgh+RogOCz3XGTeKc8DP1Ks2/1l1l+RQv9rDTdWJ7FKQ29podb+YhU3MHSv2hj29UkO9Rh4Mj+sH4oPS0dCQBONonSU@lists.infradead.org
X-Gm-Message-State: AOJu0YwZoiP9BawIfbAZNCBh/LZi14U7T/7ZOd07Ge1ppJBOMgRpKh/R
	24q7U2tH/+coQ+YXBwss1EqKLC+Lr242Y31xPssqDqNBDnhDDHIVNLUviAO7x3iplREToxe1aVx
	HbvM=
X-Gm-Gg: AR+sD10ilxnODl7GrYhym8HAz8hCCF70fG6GRYwuaudlkSIhAdboan8om9DpFcOWEbP
	WJT4x3teOHl+TjtONLD3cR8CXx/Apo7J2imCJt79TPygDvaQAAuteE50g0IAhQfgaGqzwAf84U0
	ptayQyC2H30j6pYEh+dPLX+Rgr2HNtmU2kZf5lyB4tof3vz7TbEI9bxtJJ7JKK4hGUkG/3drX0N
	+06ssh/AfoGbEXGvOyD1u/ecgUsm3JC/uNRQCL2zGASOxK8E9CuLP7Exb8nDg2L2/23Nj3bVpvm
	o7qDFCA2LiWqx5n82RQ9sgDvoacId2q9+7UUN3jp8Qr61im6mirjfPnDTQbixkhxBujSJEM+Vqz
	yIjac8mGyyZBKLWzuk6Nnkc2Ti+IwhlDGZmR7uVjq+X4yDNr0P6JNrxjpbDAxFcK1yc0+AbA5Oo
	CPhnVTgLPsbqh+99DP6yHfijFF5nmkCnTMqklm9/8KY+DPgcfwxRwcl1zmhdsfZsbflDG1ERctJ
	AeaZLjKGmWiVEi5+47Hc4WgfPQ=
X-Received: by 2002:a05:6122:1d0c:b0:5bf:92d4:5d3d with SMTP id 71dfb90a1353d-5c3660a49a5mr1435928e0c.8.1785454418192;
        Thu, 30 Jul 2026 16:33:38 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c3662af7b8sm2762324e0c.0.2026.07.30.16.33.35
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 16:33:36 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-977bbf2eb3aso75266241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 16:33:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoZ0PEXHT7+AxB1Cg4Q7Kr4Ti+9br0fuD5if+ZmdEei7U6fEB4gMKUXwOv4JeZYAPYaUyZCMBzjIvYXkNDmdDIK@lists.infradead.org
X-Received: by 2002:a05:6102:3592:b0:608:9a34:c8ea with SMTP id
 ada2fe7eead31-7574e6d1a1amr1650546137.10.1785454414391; Thu, 30 Jul 2026
 16:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-1-3abae9717feb@linaro.org>
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-1-3abae9717feb@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Jul 2026 16:33:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X32DiN2X26AutA97cpmywW9C3-76p-crT8sSQ+XqZNZw@mail.gmail.com>
X-Gm-Features: AUfX_mwLrAK1Nx-rPTyOqhPQSXAd6QqwkRvKOTa5fFmS8RMZbaeNFVMG8HEBq6M
Message-ID: <CAD=FV=X32DiN2X26AutA97cpmywW9C3-76p-crT8sSQ+XqZNZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_163340_411067_769A7653 
X-CRM114-Status: GOOD (  14.85  )
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

Hi,

On Wed, Jul 22, 2026 at 2:56=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> -  # Bootloader requires empty ect node to be present
> +      # Google Tensor G5 AKA lga (laguna) SoC and boards
> +      - description:
> +          Google Pixel 10, 10 Pro, 10 Pro XL (Frankel, Blazer,
> +          Mustang).
> +        items:
> +          - enum:
> +              - google,lga-blazer
> +              - google,lga-frankel
> +              - google,lga-mustang
> +          - const: google,lga

I'm not sure I really want to make a big stink here since I'm
certainly interested in getting something landed. That being said, I
at least want to ask about the "google,lga" entry in the above
snippet. "google,lga" represents the SoC and I don't think that's
technically required in the top-level compatible string.

I had a previous email about this that essentially went nowhere [1],
but I'm hoping to continue the discussion (along with other similar
topics) and Plumbers. The essence of the question is: how much data do
we really want to jam into the top-level compatible string, and is the
top-level compatible string truly the best place to indicate which SoC
is present in the system? While many boards put the SoC here, I don't
think anything in the DT spec requires it, and I'm hoping that we can
stop doing it for new boards. When/if we need the SoC info in the
device tree, it seems like we could put it somewhere better...

[1] https://lore.kernel.org/r/CAD=3DFV=3DW+jE_L_LLgAhD8K_4+CtivSD9-9t7Xe63X=
uKrKjfyfeQ@mail.gmail.com/

