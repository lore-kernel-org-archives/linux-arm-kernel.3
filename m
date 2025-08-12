Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD71C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 14:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FH40Q72Hlv1Q+FKRAVO0gIDPDVp0pGWeafDOUhL/q28=; b=X9NQq6Ndhyd682us29weO6DBp/
	vXL6dzQAUOr2XNKR+TuwKavJN78ymSWK6AxtTJ6jdTnG5CsnwmXfDpk1gW277m+e+VEq1JJjVu+h4
	eloH3eBBkxy2zQFTBBhE3BTxVevnEt+jgsqRd08N2xl+fdkyQ1CHXDfouqI6Mkj88t1GPuIjlRLCt
	UeD6gk75nh5Zsbt+ESF8e02PM26mDCYbOc8F6C09H2Bf4d3QXx4RVHcqzkBgeFtAdWB3Wssb7m8vX
	NVN47Ie0V0RRdnEwpV9/EbvyM+2tSBgJVbCE/A2qW0ASmBUc43qZxXKBbDOYo0ZiCpLDIN9rOiqqv
	iyltHv8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulqMm-0000000B6xd-0iZU;
	Tue, 12 Aug 2025 14:52:44 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull86-0000000ALt0-1MWP;
	Tue, 12 Aug 2025 09:17:15 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-3322bb2ac6eso40322731fa.0;
        Tue, 12 Aug 2025 02:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754990232; x=1755595032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FH40Q72Hlv1Q+FKRAVO0gIDPDVp0pGWeafDOUhL/q28=;
        b=QwRth15+kHqWjQ26XuEwQhh91sx05883QTwTVf4BIpLz7R/bBE1o49aYRjKhhCD4iQ
         SGY2E/ck2AxBnvWUjdju4Sa4mWy2VsUvQVX1EhbDs/kJje3c+iaVk9vZycpq5GQKTwtk
         Z4kolO4MqOh/Moe21ImsHUBK4yK7fqrGvFHbAqrfnx6hQBZoIUmRiuLKT55Yl9GcDE/w
         nEnR+e+bbzq9k+2DJdWUs722oZV68kdeUOxme2cHtMoaHpEdm1GnEDgwK54Nwh6z0tGT
         SwkEi7KK/SZMI0boatsnYJi4RHxt9sqQOps3G3+nt2vWtsm4uz34cmFEtpWtb+33F0wi
         nsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990232; x=1755595032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FH40Q72Hlv1Q+FKRAVO0gIDPDVp0pGWeafDOUhL/q28=;
        b=Hr2Nvc3hziLgesZKdDnPuRDlMQCEfMxKU0LZ6xBOwcmCMeRmzJu7kpUDw6QKQOVGB9
         nBvAUKdnxW0iMcdsXYHfB750I0OJXATzZR3nXw+XB8+FEF3eUmZ7dRtrnLPfcbN9eATl
         rqBCV8KBCQ5sXIzXHkta8k3Y6ltAWfbtfk2Pw5aQrv4lzNxpa9985X/MHZ24rrMNt46q
         iIRtmZ0P9kWhJn12gWXFmDa/ugD/QqLN8Jwx0Zj+L+xCz8Na3CaGXvdR8o5h+zHKWuXB
         7+2UZxluNsqXJ0T5APCzwTjzk0B2cacprMbnhD6jT9yEI/bwWTsB+61XGF3pcrNcxq9Q
         RhIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfhJkxxSF+/xRz5Ov8k0il0sTyqH2nCVfgpj7y6Me8HdgZ6iP1q7uhj3eRYZl12e8sMSKMmHy5uY5XBEOHZxM=@lists.infradead.org, AJvYcCXhimWKIMAUUcl2xCahccOWHgcl0CtdxQO/IDfei40D829Xi+dhEpW8kMjF6NBSpMH4rN8Fd9NSfGojzVQS7RQK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz72rfpHERw4VN0+OCLMQj1DZlxRRq7KRjBSB2lKjxJAooRowjj
	b956X6SXb8NFzmbc94gjpVGQ17qOCfgIHB+wze/29ZxqqH2hrxuU79EzA2SBPGeDhbUkrj6MLtR
	ch+9cmXoosveVdmvbWqufbJqW4Qbs5MI=
X-Gm-Gg: ASbGncsmCtD3w3vUVtcYCjnmkFyt6iZpwcTK0XjTaggUt+cYLg39jkykT84qclirhoV
	9b6pMUuMTEvvc+KmQmrbv2O3JY3zL5ordyEQLa80Ws9WB8lRM973oulnm7e8UaWZVM0UKxiNEXC
	5tvhx4iLxFjQC4Yf5A5MCCjbrExiYUMS1WueCZXVaDB42zlPI6nOkP5IP13R5rlB3oks7aS5dQc
	p9bJeatvw==
X-Google-Smtp-Source: AGHT+IEhcflI5Ydaa1GuiuNmpjFNx5ppiNgejnDAuoNiBIEGufTrSOsbJvRUoZYThN0W3IOGq2XThl67s2szsla47bM=
X-Received: by 2002:a2e:a7c1:0:b0:32b:59d1:7ef3 with SMTP id
 38308e7fff4ca-333d7d29e55mr7575061fa.35.1754990232270; Tue, 12 Aug 2025
 02:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org> <20250812-pinctrl-gpio-pinfuncs-v4-1-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-1-bb3906c55e64@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 Aug 2025 11:16:35 +0200
X-Gm-Features: Ac12FXxOADkY0Kt68GjCLZnzoIn9ZUx9AbefjcCXbQIHx05RgPhrrqXj4qTh3Ik
Message-ID: <CAHp75VecVi9XZ25_qY3vX97xbDndPT+O8z=+V=Jocv_8yOQ=4A@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] devres: provide devm_kmemdup_const()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
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
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_021714_369146_B57157EE 
X-CRM114-Status: UNSURE (   9.74  )
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

On Tue, Aug 12, 2025 at 10:27=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Provide a function similar to devm_strdup_const() but for copying blocks
> of memory that are likely to be placed in .rodata.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

