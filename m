Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78744C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 12:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHuGd1o3geC90thSCnWisGLP32owTrOKYJC4wfO+xvA=; b=hqPKrcDML6PYvR7Vnrmn4lrpHg
	tK63QAiXGx/2ya3eQ7pYw9slrjujUQcN8HUHyuBOylqx4qOrAs8FobO0ugffJ+saLqc42MoHPkspn
	rY+cR5aMp3r0Wn9OhxwFtIsCJasfHNPt3bpKR3wYc3+rrT33iUWQeuBRAV57w7zPfCSR8mZwq6LmQ
	y0EDC4J1zEy2MOiN+gK2WCtsojThdRbxUSEZ927CIcrV8hZ9uehBPpQbTFE7i9CEUaMoEYotILT4w
	eq5o2Ce9q90OvZCSrHjjguvNuitSGQiMe+PUbF9DbGjma7lrz6wCPGvN15ee+On1BKZDeFgnAwx3n
	+7/YqkRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6Lh-00000001X4q-1W0C;
	Wed, 30 Jul 2025 12:56:01 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6JC-00000001WfA-1aZm;
	Wed, 30 Jul 2025 12:53:27 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ae3cd8fdd77so1405695366b.1;
        Wed, 30 Jul 2025 05:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753880005; x=1754484805; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHuGd1o3geC90thSCnWisGLP32owTrOKYJC4wfO+xvA=;
        b=KQ3lYTbvKaT2f542zW4OfoQSaEd/UxHijtR5Ixu5f46gAyly3tuH766frtEMctdHUJ
         y6VCBNN4MMCBoavJRSVoDw06W4UZFcYHc6k3hYYUO8c8jDTA0KStN7z4uV4Fo9Bz8oDz
         QthJ5XRDaFt/dRHyr/mdeGTYZjhE4y+bEaW0B44LIh0fzJJnRWL/JlYsZI+uVhmjTQdZ
         kV9Tyx/ZodORgGW9fq6zGoFjr7igZPObrvyHsayQzmcOpO/wDWOhfyr5EORn6QE3TF0L
         4wYWqZdgoA0rokwf43oIwwbsjo8AOL/I5BTabFaMDlIAKmo+8N1SnbvpEK7SZm0dun9B
         AZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880005; x=1754484805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHuGd1o3geC90thSCnWisGLP32owTrOKYJC4wfO+xvA=;
        b=L+sfrfpfw1QIicbgnGQcv0BUpCYFy1Dv8FWfqEiJRP+hh5bRVGufLH5hUdbYp2HDX4
         QW2wll5LC9nu0pVjmoZvKgIHGw3N/4ftEh7j+YZHBXK1d3WTZmYNLnvbBefj10CHAYPi
         o5ZyD2WCwo9vXcJA+gmuODGWdTpD0CdJjTuwHAFcXk+Ai4lXiCtDOBwQSk8Ub2pCM8Py
         iCRbEx9dNj6sPegJNem+d/zvEcNBV9e2grBQ22euohV/ke3tCUvqImuf6AII3UMD2eBV
         FSplqsX89B16oFTc464kQTFj9zzOWAd4LxZRlJe3Bw1Rp7hOYUFfzwZpGa02gu4x2L/r
         8BiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZNNokKKuqMS5sD1OK6cnB5Bzv43bySS+dzIkY4OfnxbQvTR4nXxmh2lRwrk+640tOUAG6ZQ8ftIaGdnNosyWg@lists.infradead.org, AJvYcCXvceQqI9O+WOBQvUrRxSDBUSuHW/eKQc0CoR9wXMahkX72AmgQSW97ubazWoZFvYXfMzT6dN2fRTjmoVXWvQQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhfWsXEY42R/453NeZ5Z9BWD6jJ1YkVfhSqsiRuMf/WTqEXwoI
	71ET9WD60u369eD/6SaTrp+l+nROlnBrg0p+zQYJ9USD+nfDrHHmYThfZD1yfXaC/4GOJNFYqg0
	n5nkCs29R5UpmHCGnj8ueMSk/ohMtPBw=
X-Gm-Gg: ASbGncvz6VUntlhR/go9dgAJDqmvmSO38kg2L0HzEEUj7YpgJxZjl4pMIjdRVK0s3Mf
	s3isZ0/+sLQASI6VCGFigWF3AmqvnVdKOboTgiOh6Nw+uvRtO2WmKzQ5vLG9gWjYtc6YdamtF7w
	EHvo6abNwCBq0qMAwEBxTwbXgXf3OiejNeK+4dzrsiKc9NREZ5DGgFlQ1SgMkN5LZtHvIB/QbiE
	bacE8oaDQ==
X-Google-Smtp-Source: AGHT+IExcFLcRiu5QtKTR/cGupB5CiCW+Pjw09y0EZqUm/lnXA4CrvfRLkkrfhzcJE8+pxyrQnSgTbf1NQKA1MoVcOw=
X-Received: by 2002:a17:907:60d0:b0:ae1:1a30:6682 with SMTP id
 a640c23a62f3a-af8fd739a45mr409970266b.18.1753880004488; Wed, 30 Jul 2025
 05:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
 <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
 <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com> <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
In-Reply-To: <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Jul 2025 14:52:47 +0200
X-Gm-Features: Ac12FXy6gmS688CUsaG6BseFKvaIP4Sk1EUtOxMURXryhfGHjEY11oJr_rDyuZs
Message-ID: <CAHp75Vc-kFPz9J5CQgrwb+5Wgzyxne4RVn5efEDwwATAHTxC+A@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
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
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_055326_416934_59BF9A26 
X-CRM114-Status: GOOD (  18.81  )
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

On Wed, Jul 30, 2025 at 2:49=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jul 30, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> > On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > >  struct pinfunction {
> > > >         const char *name;
> > > >         const char * const *groups;
> > > >         size_t ngroups;
> > > > +       unsigned long flags;
> > >
> > > Not sure we need this. If the function is GPIO, pin control already
> > > knows about this. The pin muxing has gpio request / release callbacks
> > > that change the state. Why do we need an additional flag(s)?
> >
> > I'm not following, how does the pin controller know that the function
> > is GPIO exactly, other than by the bit set in this field?
>
> AFAICS the gpio_owner !=3D NULL means that. No need to have a duplicate
> of this information.

To be clear, the pin control and muxing core knows about this, if the
certain pin control driver needs that information it can request this
from the core or do some other shortcuts (as it knows the state as
well in the HW). So, I do not see any need for this flag. But again,
maybe I'm missing the subtle corner case?


--=20
With Best Regards,
Andy Shevchenko

