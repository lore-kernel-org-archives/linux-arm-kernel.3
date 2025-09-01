Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCDECA1002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7ewcbrPHINPUvrYPT4zyhNXGIzXoRLTJHpyb8YY7mI=; b=g0w+XjIHrKJaWyHJPhBa6AbOtI
	jZLbsgL8xIeCadegkg9w0Fkkq7uPaLnc+wXcSGYH0PO7BmaVY0nCH425etyEB/t9uzRYBxO5UpFCi
	YDsJOZ8YxcbJFWVJeVfIVhRnwjKro6E32Rt99X8WdWzO84RxwOgaQiCu7vqcaiGNIQuLqdShSu51j
	gZbmP8AcFY0+gNE9Z6R1t4VRn2AyE/C3h/zXsZZPLeVNcUfFHKvvyLHzMZD9z1EcxNhLjk33+qEg1
	Ea6+HMt4PTJBEvynCJOWp9w3BbTsnzCj5482qRXcPfX1Sroyxzmi7SLrmw6/hz37zabzzorNDI1ud
	s56DcoFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFFv-0000000EY0D-2TPm;
	Tue, 02 Sep 2025 00:52:15 +0000
Received: from mail-lf1-f53.google.com ([209.85.167.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utA6u-0000000De9T-447f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 19:22:38 +0000
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f78f32580so1135080e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 12:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756754554; x=1757359354; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7ewcbrPHINPUvrYPT4zyhNXGIzXoRLTJHpyb8YY7mI=;
        b=jL2JUjBMRbf+v0t8lsluvN/d72NJgimzSxS4ysjuYgN7ejM9g96aDUKY5hR/oTGzP8
         7ZdTWJfNmdcRSfMJ/etJaK818M62gQg5czTNKbhvePQSe7qkFz/tjBwmA7cglgGM+hZS
         r2cuIWDMa6QcG28CXf/I179XFvp9un/x/zDkyjq+akUQZjPvIFL5w12JsAgfyPI9tG4t
         4m6F7MhYfsgAJZvL7QsOpJ5UBXQn3MlA2s8JUzSWUhz7zkcAIhG+cIBkEn13pjS3Smsa
         dlokgt+xKBoLw7MUixtvVkVVNC/pGvvYTd7uDFNQ6YslIxzvHuPVrawreldA7KVU1AQB
         VqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756754554; x=1757359354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7ewcbrPHINPUvrYPT4zyhNXGIzXoRLTJHpyb8YY7mI=;
        b=uqZ/yfRPE5pB28jVGgcUWSzU+IxgBdn8E0gFRFiG7IxSK/16kN5R1Lb5lNAh9WRDso
         1DiK6AJ1Ucn7tKDXNw9r1Dfxh3/HML+X898qYVIRxsaAzrgqe/RzHC0a66BN+55gJyOS
         5/L7N0e4nhclm3OqWE9zgV2e31KHAjdKIRm5kcQnxKhlyMsNZ2IdeUvyM5WHwmpvn/hn
         NfMiKTXWULWar2Wq/dMQQlyMS90J420XIW4zycn5fMm05wuG24kLj8FxVw48iY6+6boA
         I+y61R1Ep2zQEgDkdEoWV5/g2PIEsMUoER++n8irLQxnOaO8xaGSjP1H1/jixxArj+cv
         utfg==
X-Forwarded-Encrypted: i=1; AJvYcCW7ZWR0mAf1oXZ5xa0KyI8GvR8dVba7XZS49LQvPEoWfCQonsHbleyDCm+T4Jg9DvLr5xMHDXdhOyc0fTimqA68@lists.infradead.org
X-Gm-Message-State: AOJu0YxiEZwQcavixrfsYxby2th/Wrwq98TmEsAerSLcY4mOjkID3Qpk
	Qde3noiEwBO4l8+g1wH2rVGdveSyC8Giaz//ePm6mhedO2WL6T9JNYL6yFa6LPNKkDQCnM5BPqp
	/GrOLOSGOaUeqXpSK89AHAE/iV+KiPuFVhMvDnF7kgQ==
X-Gm-Gg: ASbGnctnBtw1xi7qQ6ZNdEiCAq9wQ+NPFis52MffocmHkIB7/UHIDE0iOTITKj/zQCN
	QxQ5qCyMQC4YwxS9cMl/PUynL158IKG74JBj07UwUxTjrWlFnxFAhlQJKPvWEqEBic1DsrhMazL
	DjrtC3lGL0x7etuvcuxaCIl+0YyP6yc0CRt1ytIa+D43Ik84utG/fG/JaHjbF8pOzQ9mL/XQO+o
	Q3cfEBKM41dSGdOAj1QLbS9mUVMsNmH8paeaiFGMvrZA8BG5g==
X-Google-Smtp-Source: AGHT+IFcWj/MxjmrVdPmxch8QritOIaLTRMlhZkDbys4s6fntW4mvCl/nwD9FPfF52jhBYUT32dL+MvS1Koz6TeQoRU=
X-Received: by 2002:a05:6512:1051:b0:55f:4f46:9f2a with SMTP id
 2adb3069b0e04-55f708b5e26mr2212325e87.19.1756754554484; Mon, 01 Sep 2025
 12:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org>
 <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk> <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
 <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk>
In-Reply-To: <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Sep 2025 21:22:23 +0200
X-Gm-Features: Ac12FXzmS2jWw7xFpjYhhy0Ln3t9KFQZe_l3JIooPobPNCmkv86DLX_8q8OSWPk
Message-ID: <CAMRc=Mf0dOvwsWb6uraCQXeauLYP0TqY6xsQnV3fM0w=wROW+Q@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] pinctrl: imx: don't access the pin function
 radix tree directly
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
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
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_122237_000975_975F802C 
X-CRM114-Status: GOOD (  17.86  )
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

On Mon, Sep 1, 2025 at 4:37=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Sep 01, 2025 at 03:20:44PM +0200, Bartosz Golaszewski wrote:
>
> > That's not a lot of info but it fails in strcmp() which - I suppose -
> > is the one in pinmux_func_name_to_selector(). Any chance you could
> > check what the value of np->name is in imx_pinctrl_parse_functions()?
> > Is it NULL for some reason?
>
> [    0.628245] imx8mp-pinctrl 30330000.pinctrl: np->name pinctrl
>
> https://lava.sirena.org.uk/scheduler/job/1758947#L705

Linus,

FYI: I reproduced the bug on qemu with an older ARMv7 IMX SoC. Should
be able to debug it and figure it out shortly.

Bart

