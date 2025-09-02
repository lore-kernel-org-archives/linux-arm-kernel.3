Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5FCCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=li67uZ6xqKQCADV810jgcapd5oaTXRr3DZZuD3FIP0o=; b=x1y9asfq88/ZKesicphaQV0MrU
	B5xnYBo4eTqF+OpIg2eb8ZG7ZkHE1lSFkKOx9eGzDYOq4p/OCG8D20ZchfVyrUR2p7dud7ea02gAT
	XszqaRxKbtm0JOlk20asNGB3LIZm5mqUXsuWZ8UwSKvavSkjqWnATT/cwkhyRcmUx54NHAhCdsTjs
	qwDbl4y2kweKaq7sY48WdSNrRYN6++0tJsei9k+Am5AIOopl7qg4ShTK5OHUqxjpkswAJdjmGon5d
	ptHd15v3s5WZf0uaHI+MxhBgeZaNJfB4/8gRBqevz/UmcZPzHKMIaCtpmrXNqBFU0Vcq4UK9iDX9P
	2mH9G3SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbeB-00000002smQ-1016;
	Wed, 03 Sep 2025 00:46:47 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utZKh-00000002LJj-3tMN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 22:18:33 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55f6bb0a364so5096197e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 15:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756851510; x=1757456310; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=li67uZ6xqKQCADV810jgcapd5oaTXRr3DZZuD3FIP0o=;
        b=Wsg4gz4NUYVHBbYZ6yfyJ7BMtHn4ZHsttXR4KzSkHzoEDMoFa9NS/Wy/DUQMH8nz1/
         3TdXH1hrA7ST70gvAM6MfUGWZSeWulSxIC6VyE/hJpmLbqQJrl1KLcukym49YVR4esLD
         yAyYD03pBlbI+ja7cp/lA6nrYx0UWArE/Xf8IcFnMZaDs7bz/dd0Wf5HAbXhsveAxEBP
         p8crOp9zlLBhzIDZn/BO9N/5rY+lN4v7jgV5MX1/uy38mLwakqvaBrBS0jZT6qGSmV7C
         dxxWLmxqEfmacZqugLwpLwvlPRv39OX8YDkhR4sVl+ytXKd4Z44SDKXvgeUk2ovYK/9y
         nLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756851510; x=1757456310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=li67uZ6xqKQCADV810jgcapd5oaTXRr3DZZuD3FIP0o=;
        b=J8EwLglP4eVVgjglJxA9gUgHLQCYa9NltkBUAeVHYWOdb7ML7HsboQ3eD6yzazJZCk
         wy46q5RYefxV7GdwJ9OdGpnntrhr6gjFxVP0fGczSwmEvEnnQsMIipSRJHIdCOsLLmKZ
         HV5WE4cehQdRDWz5snIPHn1JNUO95poTeYK6pWEtrgJB1dL4aGhaCvSVA9IcDMz7xqjV
         niQTcJL/ZWgPcJzwNAZOa3pvBFISr26tWZ5YOiNyt3H9G8hFcNuvEv1edPaS1jBNMiFU
         TQd/WLeUsXzgtmIHKQ0wvN3fHIysQQ3FuyJ4Ndxt+WjGfzc6SPsTiZablyBi/VEvY1Tn
         zPeg==
X-Forwarded-Encrypted: i=1; AJvYcCWU/kXiM5IT0vxMIlz2SudluhtNojRKoyCKJ6CseUyp7uhtEIKftOUvg+GxAieJMpmKQ3RFqlmllTQpukrreCC7@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr9v/IR12ct+n3LHZAPo8JxaiQXlPkbm5hw6D//qvx99N5O0Vt
	OtNrSnA6VTAWuyDm9EUQNmFS16rUE2zhzEYP7QdbI6Y2UOcbE7QFpF9wfWpWHMN6A+fAOv73V46
	VzCBUwWd3/fHMGYm5xZNoDKdRbovcV+JGvL1epvYEzA==
X-Gm-Gg: ASbGncsndx8gu+4282OmKQCm4rf+URLUP2jK4Iv529+kBZANQpSU6a6TnbZFdCX9SI4
	s3mg8RY+h3J7AWwA3hOnJuQaYAkwmsJSzc2CqCohW3QvX9tjSaMiuai6DTMPqEDe7yCD13r/mJv
	MCTTfdUgd0Sj9P9988F2JRESudXIylcWCT0CkbuNwaVCEntQSTpSR5DJ6zqA2a4q3X5g/WmHqu0
	BsQ5c00vu56cU8HQA==
X-Google-Smtp-Source: AGHT+IFb5FJ4SVuaW/MZYjqlxiCtjVdy/Gs9hCmULK5gWsYMbnHTDsvg0XfXKbqBDAFJs9xAYF0giEeS6uNYA+ao+FQ=
X-Received: by 2002:a05:6512:3d11:b0:55f:65fc:8db5 with SMTP id
 2adb3069b0e04-55f708b9c56mr3711945e87.23.1756851510074; Tue, 02 Sep 2025
 15:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Sep 2025 00:18:18 +0200
X-Gm-Features: Ac12FXw-1tPuaZxU9kVS8RfwbL5AeZ_YF1A5IdRwoR4crjvnC6JAL_oHeKPOKoA
Message-ID: <CACRpkdZ-Toq9MziPisZCcT7zcL3rosQYZ1Jw=RWCH1KZTbeBug@mail.gmail.com>
Subject: Re: [PATCH v7 00/16] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_151831_970311_7EF5DE0D 
X-CRM114-Status: GOOD (  17.59  )
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

On Tue, Sep 2, 2025 at 1:59=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> We have many Qualcomm SoCs (and I can imagine it's a common pattern in
> other platforms as well) where we mux a pin to "gpio" function using the
> `pinctrl-X` property in order to configure bias or drive-strength and
> then access it using the gpiod API. This makes it impossible to mark the
> pin controller module as "strict".
>
> This series proposes to introduce a concept of a sub-category of
> pinfunctions: GPIO functions where the above is not true and the pin
> muxed as a GPIO can still be accessed via the GPIO consumer API even for
> strict pinmuxers.

This is what I want for pin control, and fixes an ages old issue
that pin control has no intrinsic awareness of if a pin is muxed
to a function providing GPIO.
So patches applied!

Any remaining code nitpicks can be fixed in-tree, I need this
to be able to apply the much desired Broadcom STB driver,
so this needs to go into -next now for cooking.

I also want to strictify some drivers using this, bringing GPIO
function awareness into them, which is a good thing!

Yours,
Linus Walleij

