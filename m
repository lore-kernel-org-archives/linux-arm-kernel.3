Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4FBC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 10:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6vdhp2EWkPtq+IAr0ObGae8XoJd1fUV2G+NSQOgeB0=; b=ISytZoawSAPcpbLeorau0i36W9
	NadSgjRJ6BkkWC3c6T3xHU9aTJ1K+XUwnqUhzGG/ceiySRctrl+Xg+VQ4ORuXzZ+N+XjqND6mnZEy
	zqJgENRz9mio4hHcE9fTIAFnjbsUX0k7EE6AAD2Cr6J0JCBINsMIsYZ4kSwRGnff6LNwPHy4AMP03
	P26voIq7XKGzDoh6pOqjHA4ZDkcbrT5jCko+UkQWE1XkzTr8ieWZn5fI1zkYiaMUo3eK2tA6nT/6B
	2Ohbyu3QtemQQ8jgfAKZxupJ+aCIXX78cpGBwYqT32wwR1Z0OvuYdW77y0Q9Qjm928JmqdcIUpO1M
	yvoz+oxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3bl-00000001BgR-0mMe;
	Wed, 30 Jul 2025 10:00:25 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3WO-00000001AqD-2Dsv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 09:54:54 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55b797ad392so1238331e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 02:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753869290; x=1754474090; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6vdhp2EWkPtq+IAr0ObGae8XoJd1fUV2G+NSQOgeB0=;
        b=QbEdC91KDi1VDmOsyei3Pmk9KLKN5Sclvgq473nR12RIwg5wGwJNMgXyKc7IjKTPuh
         PScNSz7a1iAaVQP/NXZjAFAqPOQFe8pHuW/sIfS/95nHvEM1WAqSEl37MSn+tccULt20
         DUB3JBXHNQcfdv3ikEv+gEsHeGai1ERAhkugGlP3J0olwf9WjzmCCsEy20e7cqlE7k02
         DHzk574MYAz87T7EVrlqz1DsjnF3PjsLg3K3Emxrb0L3XddSDswf0rqSaH8zRPwQWCIJ
         xvZoKY9W4laUgxML1aGYm7ozX6W1HYKRUAG7HLm9ve0zR71E2J1zDQmIaSkRyykyhFoj
         EvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753869290; x=1754474090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6vdhp2EWkPtq+IAr0ObGae8XoJd1fUV2G+NSQOgeB0=;
        b=M/GlhreO+Ot+vPZRfaqsXFXHG6Q3V4++2RPQ2UBwI1JbQh9VA20S/l4YtQhY7ZC0L5
         IT9s8/A2JVM+KZ7JjG16TSIN8K4IROvepvK6C+fwk/Lfa8dzWdHIJWxZyx+gmYA/W6V1
         WmGtHVDxnFNJjqUQ45428D+VmSP25c7h4FPCenDN2u8x1S160pATKSCMRXOGLAf29Efo
         Zhgdsjac0I6JPconUogJhcDYfIcw9volBJ9gMPY0wiGIbUNze7VHO7NjhwzPNu1AFmpl
         AMTkWeObsqiDn8EaUkdfBfG0Gtq3gddHG1+K3Tckqrj1IQ10QnRMtSiFELRBZE7S+PVE
         3HCg==
X-Forwarded-Encrypted: i=1; AJvYcCVweW+bBoMWegsGc3+X8SoYsQMcbJlZSYhT9wnoMHYt15geguCxC06ewm/y39aC9SXihXBMDSNyn1e2zw5SfXd7@lists.infradead.org
X-Gm-Message-State: AOJu0YxBGHbvyNpzDGqbaw7KocINUdq4AZlu8sE7H5YAXNnt57u0xZax
	Z1f8y43YnUN4fBtzw3zagDlL3kDb2qa2fao9JNYdhZ1mTfuVd2HcnY1qN7ik7gXuqlq1A0hq0Hr
	CcXq3E0uz/hbXFmkp6xK3ZRYbeIiF6OnZugR07TEv9g==
X-Gm-Gg: ASbGncs689yvmVloiaSPkhBpv2QpOyn8TGqFCELHpNsrzcSLUtTBC2ReVWKdpOYTTB+
	qXOVB9qVUnAg128woGfIx1j2HU3pU1nYeyUM0fwJyH/eiOFFNbDfQs+Z7arVfHfKd9ygFEDZC5T
	U/Okf2CGBS+3KK6/QEExPQT03sWCrTdgWYLJ0WlSdYUwMF2GO7EdUUuc+rBH8xzG9h4s4f4Q+uI
	6nux5C8iAe2uI00n94UzvcOTwrjvaBcyNwreiA=
X-Google-Smtp-Source: AGHT+IFD0mC+adTu2tQIUqoYqi4YbEm6lb9KfHl4WlQUhUVwQ9owZPBnvnUOvhF+89ksRVwAv/r0YIR9B2aVVdKhoAo=
X-Received: by 2002:a05:6512:33c7:b0:554:e7f2:d76b with SMTP id
 2adb3069b0e04-55b7c0b0f66mr939851e87.56.1753869289592; Wed, 30 Jul 2025
 02:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org> <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
In-Reply-To: <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Jul 2025 11:54:38 +0200
X-Gm-Features: Ac12FXyouWksKyGI1Z-cYawOTPPQ3IbuMxJxWat2oIDr-ST0nxIlLBCifNIDusI
Message-ID: <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_025452_806797_C6C9C98C 
X-CRM114-Status: GOOD (  11.34  )
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

On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> >  struct pinfunction {
> >         const char *name;
> >         const char * const *groups;
> >         size_t ngroups;
> > +       unsigned long flags;
>
> Not sure we need this. If the function is GPIO, pin control already
> knows about this. The pin muxing has gpio request / release callbacks
> that change the state. Why do we need an additional flag(s)?
>

I'm not following, how does the pin controller know that the function
is GPIO exactly, other than by the bit set in this field?

Bartosz

