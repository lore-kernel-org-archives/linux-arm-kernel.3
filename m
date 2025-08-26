Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F90BCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 18:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQz/VrYK3cwCtAlJzmwCDIZSeNenI6Rm8ZKZbd4vuEk=; b=mtB8D65SxpJ9raxnl/QLUh05J2
	lBgyh3PFqNIiRRNAPd/Udfo1k+lXykj/xizkTPsbQ9kJIGto06tW74L4+0/d9sJSzYcpcyABOSJc5
	hFct63nwg2mC6shdCKg85LJgdxgrxIrz6c0NBDKVY3SwJu7xbE1qDcc8asc7FabaX36pwctZ21vDR
	4rhByVWYyorpXhPH/UzUFyq8EjhpHikVlR7vSNtQ/oKsh0UpTpDI+gRM/USqqC11rWpa7heFPXp+g
	MG5zO1UW4hPOOcCZR1ZoeESBhK3rgHzIx4Kb75n55bt3vYEYavJrh0ulvGQ9qewiw2T8KUDeIevRI
	iBqQPKnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqyJc-0000000Crft-2LGL;
	Tue, 26 Aug 2025 18:22:40 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqyGs-0000000CrFt-0opg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 18:19:51 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55f53efe803so102769e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 11:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756232388; x=1756837188; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQz/VrYK3cwCtAlJzmwCDIZSeNenI6Rm8ZKZbd4vuEk=;
        b=Dh8SOfUPg1/GjcA7fL8lP3NOudRSMM+t3OnUNic5ZTrILRpeTuLe7pH9P40IClLwT0
         TNSaqrVXe35BVpcoduZ3TEAnS63UFhLBpjWjDWsLIc+csR9iu+CQ0TTEPww54IZL0sYj
         UjVHXu0RgRLMCjmwcfEI1n462U/wK2YhKgV34exQmciQeO1xHNvDh1uf7OVz1f4G1qJD
         DWxwNeNIrdKQvGodvi8PbLOOQW0WJWW0AcPpfGloRTx6k+rtd0/UlKSqOgWhhmz5noXc
         PDLloZKrUMnlkLchqIT6895n1HjVUiBdCN1HGGE7WtDWlDjhaDBezRdaQfT6/sC5XOya
         Rxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756232388; x=1756837188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQz/VrYK3cwCtAlJzmwCDIZSeNenI6Rm8ZKZbd4vuEk=;
        b=uLXmO1eW0gxbytYjOpOKbmWQR7LIBjyx2RVASIJWAV179ZLd0KyZXUbJxkJyuimS25
         5PyP3BauV5kWk4pnqNeEDc4WC73vnLK2qhQZ0WNGCCRAo9KSxKHtYXyEY/etn+nePhcf
         OJUXE+Luz1mXYct5DWQQ9P8fNR2Tzb6ypTzcm4j0MLHHgUIu+y6MW1rXIdXazNm3vZZm
         EI8WiYZv49NXprriunPRGqAtFM7e6LEnY31WegVKhKaOa+z8L/G077ix4+tytkwqZLeB
         352U1oNHaUQWBwM84iSNcA/gsKL3Y3v2j6wWkEMvjCQuq1AmlB4sK15T/xbPKtc+WX2h
         fKEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDaac9bPvUZ1FukIc1198GKM7IeMsf8WWD9fNGG+KFYUThIuN+GBA2cVYvTNC+vh1bY4j6ApKIWJjRodQy05J5@lists.infradead.org
X-Gm-Message-State: AOJu0YwCEhMgGcZ30dIvt0kLt8Lqv0723N4kGQeckp8NvNf0zalbdHnX
	oy9V+ZeZs2AU/VW9NgONRidtbuYiXZFADISFCyR4GB9IpA92GlqQiuCszF5nAgxDq+aU6qoIDuu
	JOS0hOwoJL8Vsit2cggFldqX4PHgOZVndFpwsaz6OqQ==
X-Gm-Gg: ASbGncuFN4C0S/IhHVZVwb4D1ndjEN/vctiqfyL8qUJUWV56ci7xagkEeXRfiXqe2kL
	+blg66/siFN0yJZ/Fvy6VOj0Ib2Yvd3Q2VZlBZnXRHvnwFB84xE+K4fhy8d5VXeIPhvGUbAn5RM
	+/cHefUATmeWjrewbdC4SDthc+TvjGze4WWylcEX4kKa3J4CkridL0zN5FhhdnAnxfoObNEgkAY
	wOoJtGPiNfyZrc/L2SI9IaO/LbC82kq7kRoQ5Mc5N2I7fL561LJKAU8R7jq
X-Google-Smtp-Source: AGHT+IH9/wDD1C5c1pzIo5M6703fhe2Ju79J3Cg57MCbuHB+kMzD9Ry2MpuHtwyxY9EgNTzhw0WfnDm8emGE0JQOveU=
X-Received: by 2002:a05:6512:3d87:b0:55f:3d7c:387b with SMTP id
 2adb3069b0e04-55f3d7c3badmr3365498e87.12.1756232388100; Tue, 26 Aug 2025
 11:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com> <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk>
In-Reply-To: <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 20:19:37 +0200
X-Gm-Features: Ac12FXxAYIw0w_2T1YaN-IyY2JYcpKwwddZS_ZNL3wGJGwAsl60-M2w6oLQOL30
Message-ID: <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
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
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_111950_470755_CB12F77D 
X-CRM114-Status: GOOD (  12.97  )
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

On Wed, Aug 20, 2025 at 8:41=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Aug 20, 2025 at 09:12:49AM +0200, Linus Walleij wrote:
>
> > The qualcomm 32bit platforms fail in next anyway so I dropped the patch=
es
> > for now.
>
> FWIW the i.MX8MP also seems to have been broken by this:
>

I can't test it unfortunately - would you mind sharing some info on
what's failing exactly?

Bartosz

