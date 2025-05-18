Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA92C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 16:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wD0Py1Y+nYCa3T32gfjqbB8qmXGi889eEZKva2VRulI=; b=zfjKN9yVN5MfpJ
	OU3ShaiZ1KRz0wwJKTfCZPMtnziukOjLwdlh0Hwtc8JSwpyajLMvpP9cUyuMVdxeMGZjxBoRjuiZ8
	N0Ccy45XCQpeK9Pp0jZftpmv5/SW2/RIV95L2dRWUmjy1Mm4rRAA6xydm1h7A6bbgIOkrBhBjAuHz
	Spilb76Igty+XYiH34yo7ged0DYcylvpvUWMPookf1/Z8SxSs3GjdYBHHrYVD64oEZYdPb3z0oZEE
	M1wR1nglnsTF97JndIPPvuiOXK+KU06IJ1sAgBk1/rUnPHjxpV1q1PAOdrw8ARq2VYrE/h+oWMigO
	EqjgK6ZWScwrKNV9eI+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGhCD-00000007J4g-1llE;
	Sun, 18 May 2025 16:49:05 +0000
Received: from mail-il1-f180.google.com ([209.85.166.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGh5O-00000007INV-3OHp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 16:42:03 +0000
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3da8e1259dfso29298045ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 09:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747586521; x=1748191321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wD0Py1Y+nYCa3T32gfjqbB8qmXGi889eEZKva2VRulI=;
        b=RzK/zRY6EasyIcA6JkRyRyziAzQKLc2QvwD7MPiSqqc4whW/uxb7E1KpJjyxGq+bN5
         9HWbM7CUy1PEHTmatj9OXlW6YMmm1vzgZSy+5BgzTqHPMhebcxx+MzsnbFjnQYknu8pE
         8nj3kLfz4AokbUHM4NuIfcV5OzuxUtp/kTSTNA31RVW1XNSy72h+MoPk8R67dt1nkvE6
         k6BhlYrx2ePFV5c6outqsSCZuD53bqb2rSWG5xrXdbSDNlkIr8fgC3bSz6MKDOif2yxW
         86dY31oNxPYv3rUsxSYhYalQM+Fo038736b713Jj8/bXMcMGg3EjijnPc/N+ALts9WfW
         pAqw==
X-Forwarded-Encrypted: i=1; AJvYcCXljBgJy4XiJSNdVdZRHg8Enj7yKuZS6cHTLvPLvslYoHy8mwsGqDJnfHOXNlNazGiTS9DDDxCSeDI36WNbfEuI@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ2HP4Atol5poKsrrBB+X1xPWZDshdnpEvH6trohdXfmOqmLBE
	eT0PytGrspZkjqqsyezPzuSLIZ4gTJC7jl/1XhKWGEePVLppzBRNGhR3/yZxcWk7pCE=
X-Gm-Gg: ASbGncvnRoBXakQqUOJ0Sdc2+cf/bphrVZk8At6eEO8tmhd6IeU6D3pUtc+IUunWjrw
	z0NFz8wlyRJMXeuwTW1qGOEc9Bg1ZYjPzL43IJ6VnLlCUgpBEhqQN3149SAksQOX8oMU3jbnIDV
	RzN2B1Ui91bnYUFekCeY6Dvi+ojXbB4JCHvDN3bJUZSyt/QIS/75vAy2mFOBR0WGVqmoCJFruGQ
	XNzl5hM/wMTvpNy3JEk/MVkZ3fpYASqmc104ChmPCOSmGs1D18QYdX/iMByV6idRonvO/CLrSyX
	8JhPmOgfTU9qESiUYDhYOZ2ONtUmGICVaOzgcubdf9zWIYrq7BGc4ygoLUc7AfsvsB4Aw/szuDl
	p8Tor
X-Google-Smtp-Source: AGHT+IE0wsSvN76YM0n8nyNhA7ocOa1lINxM4P56k4A4egBOIaGQkc1XKOSnHH2OqesPNOdKtdIfSg==
X-Received: by 2002:a05:6e02:2164:b0:3db:6fb2:4b95 with SMTP id e9e14a558f8ab-3db857a6f7fmr111584735ab.18.1747586521401;
        Sun, 18 May 2025 09:42:01 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com. [209.85.166.53])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38a563sm1343257173.1.2025.05.18.09.42.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:42:01 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-85e751cffbeso275522339f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 09:42:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVySax68wyTLAgPiTdFqlGiDo5YUxu7kZM/NS/BoIx6YSp6uMB7wc1MFliDdO5wS1BXdpTodllXAL03zcbvFy4k@lists.infradead.org
X-Received: by 2002:a05:6e02:2164:b0:3db:6fb2:4b95 with SMTP id
 e9e14a558f8ab-3db857a6f7fmr111584635ab.18.1747586521124; Sun, 18 May 2025
 09:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-5-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-5-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:41:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v66+c9j-uFn-d59VkP6Fk1_af7i=0sWJxSTmp+3+A=+V1A@mail.gmail.com>
X-Gm-Features: AX0GCFvx955idocxBLHWdxaZkcNf0j8vEssSsAEhRIcCueVqPuT49DZqnymord0
Message-ID: <CAGb2v66+c9j-uFn-d59VkP6Fk1_af7i=0sWJxSTmp+3+A=+V1A@mail.gmail.com>
Subject: Re: [PATCH v11 4/8] drm: sun4i: de2/de3: use generic register
 reference function for layer configuration
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_094202_842289_D7007EC3 
X-CRM114-Status: GOOD (  10.23  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Use the new blender register lookup function where required in the layer
> commit and update code.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

