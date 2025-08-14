Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF6ECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 07:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6lyA0E3BsgF3c0Firp9DhkX0QGDczU/GAUF9m624y8=; b=W6I1/XnMHWW9JxJ+YQMyYZH3Vb
	hRLUufzaWNH/d2bb7/AvOLGQx4+M6dbwJG8Nj9zi/70YFasfuH/wlvzo60nZJmIupwt2av9k9FLp5
	gBmSRYBtCQlV33ZFFaPWZZK8FdM/UhQj6Wy/27Modxa9/ndaardwU4XSXQi5fdbNF7zORXgIBKKzG
	hdNWq/o5SDbdpgi2JnQ2SSI+UUMmpaduXtogTXLvG2+ENZwqIlg9FTXA8koDJUlfShEioxmqZL3op
	GzxSB6If3OO+2TWHqKsYNBHwZ2P6kIf8LVML2a0cl4rm48t9CBYYr2bf782nlQ6SS71XHhU2dF6sW
	zI1305vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSlK-0000000G9dJ-2m1j;
	Thu, 14 Aug 2025 07:52:38 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSWr-0000000G6qH-3oe8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 07:37:43 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55ce5253a57so666729e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 00:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755157060; x=1755761860; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6lyA0E3BsgF3c0Firp9DhkX0QGDczU/GAUF9m624y8=;
        b=AfEa4pSDP1sF8d/G29N1mP/doRJ8p8Zzs5NBVCPdzsq2Hy0WFbyjLs0lHe/XUSDA/i
         Msxk8QLO1tMuCv6lXkey5eVuL/9JPGkIwaxstbcyZstde8kDNzkVoSaV2rSk/13MLjWs
         YxGkD7325YL9lNNmm07ivYb7c7obkgrsWLMN4nHkGDoGr3uQLIib8J32DHVF0ZzdM55M
         fjwdLfVqT6cWMcKD/BvwootnWXgyRMlybHBqNyx2tAx4+MhrGF7zu0Gh2A3FPQl3LT4i
         MXKnjRWkGmOxA7QcAk2x2HxK9nQGUgGIq1J5VjEC27QdqpCt/UPJQmO5smuATrD/5inx
         XeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755157060; x=1755761860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E6lyA0E3BsgF3c0Firp9DhkX0QGDczU/GAUF9m624y8=;
        b=DkgTe+Ip4VhbEcFkFwKhXEHbxm5e8q4WcRATNqdT3+fyc49XHNeCs05Q8/rwba3NNs
         ZLMnHQSa0Y43cjKkFaS7uz9akdhPB1NXuEtSvu4Pebpr94X02YSFPvRcScP/iWYRXp37
         cMO0Oaw/i2MBL+nv+nnUFMJRcjNtoemTTgU1+YAKZ8arMZP4XRBDSfmO0E585+g56YxU
         gKSPAlVkyDeIxzEtM5368Jhp3owT+2qELQzh2qkjc7s1YD++UTK2ZWJKRpGyAjY1o8vM
         /AO4Vjxk/ipaM30qM9NHRKbGcnQNmTZ4M0ekbrX6YdGPhs+Z+kjzHSctK31r2bXgZgWn
         9xJA==
X-Forwarded-Encrypted: i=1; AJvYcCX7JgzzzZM6a/3X5IRpyt7TzeSaojnhyrxzLueeufpq7pHPWCDGuNG+QC4ALRMIbteatm3Jw/2psRrjREnVlKuD@lists.infradead.org
X-Gm-Message-State: AOJu0YwdrmoXZdNp5CefUsHO6gfdEzIqDjPBh32W2VwzUgiXNom4w5un
	1QMUM+E2eHIOijTeZcofLK2wQRAS1GWDsql8fWW8m/Fve5gu6K5wLnfMun5F4yHCDMLX8D9PiPs
	QNIk9+062QC8Wk0mXo8Nyn/6g4Yvv98I0Hb2Mi0EWvA==
X-Gm-Gg: ASbGnctLF+jhFBo9UxQ8BPdZSB0qVdY7DFzQBVXDglt7NPJqrH56zB8IhcQ2weFSeUh
	0kIdPO78q920zhn4n/sRRsPA/KJgT7QDocpwnCg2u4TAZe35ZXNGf895OaF7rdgYuz5idQxyQo4
	MoC+srqsuvFd5uNzR6DfS+fl9yZXEnHDQfK6Crd0dMtYvy2bV+6krqU7RxGxAMOE0HB1l4amKUc
	1GlC+Q2U83FCOFRK0fqrbxCZBNe8TJaO1FipmM=
X-Google-Smtp-Source: AGHT+IH95og7bwOhUuHKkvwv0kTue2EveWatnb0pXZcfIY30oh+DnenMVeGiemPUTLNRulqOQX9vjsDh8YkJvs9r6SA=
X-Received: by 2002:a05:6512:3d29:b0:55b:8f02:c9d0 with SMTP id
 2adb3069b0e04-55ce4fe3984mr762477e87.0.1755157060157; Thu, 14 Aug 2025
 00:37:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Aug 2025 03:37:39 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Aug 2025 03:37:39 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <CAHp75VeSA=AYDKOV5XQ5nnz7EZRmnhbbVyJrcBUcMO2LrRMTmQ@mail.gmail.com>
MIME-Version: 1.0
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
 <20250812-pinctrl-gpio-pinfuncs-v4-3-bb3906c55e64@linaro.org> <CAHp75VeSA=AYDKOV5XQ5nnz7EZRmnhbbVyJrcBUcMO2LrRMTmQ@mail.gmail.com>
Date: Thu, 14 Aug 2025 03:37:39 -0400
X-Gm-Features: Ac12FXy2K4h4wcbTuyQHNLoBpmiM4n8vonnKvWP5_H1uDnS85jqeBZjb-G5DXZs
Message-ID: <CAMRc=MfzSq+7EY8cV+J_AePve6r+yV5QEHqG=Z2N8Afmy+Bc2Q@mail.gmail.com>
Subject: Re: [PATCH v4 03/15] pinctrl: airoha: replace struct function_desc
 with struct pinfunction
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_003741_950601_914D505E 
X-CRM114-Status: GOOD (  13.08  )
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

On Wed, 13 Aug 2025 18:57:00 +0200, Andy Shevchenko
<andy.shevchenko@gmail.com> said:
> On Tue, Aug 12, 2025 at 10:27=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
>>
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> struct function_desc is a wrapper around struct pinfunction with an
>> additional void *data pointer. This driver doesn't use the data pointer.
>> We're also working towards reducing the usage of struct function_desc in
>> pinctrl drivers - they should only be created by pinmux core and
>> accessed by drivers using pinmux_generic_get_function(). Replace the
>> struct function_desc objects in this driver with smaller struct
>> pinfunction instances.
>
> ...
>
>>  #define PINCTRL_FUNC_DESC(id)                                          =
\
>>         {                                                               =
\
>>                 .desc =3D {                                             =
  \
>> -                       .func =3D {                                     =
  \
>> -                               .name =3D #id,                          =
  \
>> -                               .groups =3D id##_groups,                =
  \
>> -                               .ngroups =3D ARRAY_SIZE(id##_groups),   =
  \
>> -                       }                                               =
\
>> +                       .name =3D #id,                                  =
  \
>> +                       .groups =3D id##_groups,                        =
  \
>> +                       .ngroups =3D ARRAY_SIZE(id##_groups),           =
  \
>
> Can this use PINCTRL_PINFUNCITON() ?
>

Yes, it can. I'll update v5.

Bart

>>                 },                                                      =
\
>>                 .groups =3D id##_func_group,                            =
  \
>>                 .group_size =3D ARRAY_SIZE(id##_func_group),            =
  \
>
>>  };
>
> --
> With Best Regards,
> Andy Shevchenko
>

