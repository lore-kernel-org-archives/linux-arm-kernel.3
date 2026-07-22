Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BA4C44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 16:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VgoN131mpCFDGVLEaTpJh9JaIowTJ3l5BSSOdIVGp0=; b=AqKrXMh7US3EaHYNAXAUbBfd4B
	kAjmwcaQvCEIWgcYelvZ3NNc77z5Fbfu7mTgK1WrEkJ9RJCZVOLYc6id1+jFQKpWDlmhENl1NkTkh
	sZ8Fqgdz8JKQ0M3i2g8hVPqh6/wbKoR0aQirYeoEgGYqu+f02yA12PhYwqwYcf0btfFoja1YvJIEL
	DYPD990ToPB3Cy3rimYB06yMnGxMZJX5hKiHaHK3Z/pKaWcCgS81ZsIsjYN/NMFvu8Z6E3LUy/me3
	mpp3f338jOkAVgfh6wI49wjjltXX5MQDLQUzkB/+7CCpzTPOJ8y/+1fshrLgj+79P5AeMotCbuAx8
	ZHPS96pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZoT-0000000CLR5-1agV;
	Wed, 22 Jul 2026 16:28:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZoS-0000000CLQg-26qB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Jul 2026 16:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0VgoN131mpCFDGVLEaTpJh9JaIowTJ3l5BSSOdIVGp0=; b=n7tUQ3N3McmrECa/cW2g3z+5eU
	GRm5WN2Y0GIeeif3YTH1cYNrILG3+i7zIffU6RE1cMyIi97RGrhDy77Y2PhO/0eOB2IqqKoBuIOVC
	7OThFX4LPd55bGKOzWf5D8EORD9v21PgdWlWSUjelEGjbHMPRdU5fqcPWARoxoO6jTyf254leH3/O
	LGeqI5oWSrQa4ywWBiGFYcgJQDjNPdBnzVScHsOTuY+sJ2nhl1oFjAO3yfBjlRtSUZvC2mmn2mr9B
	n/CBzV1rkl1C0HKVVVGgqQqk4BYrJHSJRSF+V2ZID0i3ZZBsKvcMADDDT66QxLKNIoHA4BqVQ3bWa
	pSjbVHXQ==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmZoP-000000011Xm-2jRQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 16:28:51 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4758bd3731bso5054154f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 09:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784737727; x=1785342527; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0VgoN131mpCFDGVLEaTpJh9JaIowTJ3l5BSSOdIVGp0=;
        b=ox/djEbPN24KJGZ67xcmyV3GbkYiHyZCdaMEM018DMSMPCaYYjXej5Nj84K5nhaxiF
         Qoo0tVprLgrRo/8krt4V56OLAk6Ro/mLVV1uckScQ72XhzqhGukQkqNGaIKAe6lsEcgN
         IE/vghy0Eo6O88P1Igxjwxt3HYnwPudxkizalLzSgaHRvA2gNfh1YpilpK3GOEQElT0Q
         BMINiAxPMIwDRmG9+5u5T93L0Qen0+BaA+CKRO1PUNnJL3T5Dcx0n0ReSdqb1lQBw2YP
         0CzU653cw+MyzOZ259mOKhZQiXFTRNXY/lmXpO1JEslI+pLonVjYDOo1dDWzs6TrA0qb
         f5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784737727; x=1785342527;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VgoN131mpCFDGVLEaTpJh9JaIowTJ3l5BSSOdIVGp0=;
        b=If86rMx2nqKf/K5ohjGLCoB3TRcbnext6v/Lr/YXaHxTyn3xZQNGs/m/IumfJA+BA9
         RAJeZOheoh4rJZbdoJaIxwRdG1TTVgQmg3nWXFtyVtwc6QWPABTzC9HgQ6dhtWfqZniU
         L/8WhAojtHQstFEkV6W/8w/pinwmtwxHtTHEyryPsTNy2Ymcc4opbOX0ViIk/pCNdifM
         slxr1AeCTqRGyvCGp/mueyoGlm+czgt6GuwIAp20QncVhUVyNJrV/zD23kY5PM6pv1S3
         N+CGTo0eap0OVnXbyxgjDDnOORQOMAcx+DXmV4i7Qp12D8b7j4XcIeva+V48lGNIXNE3
         UDKw==
X-Forwarded-Encrypted: i=1; AHgh+RoqS2U+Bpk+NcOpXDTVo3Rhx+lhzXp0j36jboQHGLDW8TwD2s14JZs9QKr57wkKBlhne62gzqr5ud8Vf800JpzW@lists.infradead.org
X-Gm-Message-State: AOJu0YwneRtnNvz6+jN51oKOXXU7C3fLfSAufYf1Tb3AuS2Khqlai5Qw
	S6bsdMO7TNJnzxClHp3PU84pXZvZA1RhY/1lYqSvEsnsZK4mkpPZCmqWpPBmx5C9MmU=
X-Gm-Gg: AR+sD10Rgi7h787R+zISZimNHC6gAtk1al2UFoXmNkarNVKcjy1UuRANwWINgd1uicp
	aDYOCdsNoSUlbNoICQhl+Gl5NR1Q0BVrETmr9WG5DlDmLfUs5886CDf9Cnd2crnKGZbHpIp0U3n
	bYdw1pkTBfQtKtNjVbm2Qp0cC8b5sZ5pgZm8iyKjgheTCOAHuGez4GVesySKdYD0VkJkUEs+UIC
	AUcFW/M7lJrph+p4p5kyhgWpBj/5GmSyhf1Dh5uqiQgvq0nNq7xa7f5fE59qtgeLw4dLtScyJey
	PF668Y9r7acpQjpS90NXsSN9M0f1mdWUH/fuTfUSwse0PQc9Z43wFD7+NCfwEt+3a+XAGb26tkr
	5a+KIGhrGn107mgUqLVJwJhtfz3b2kXywUqBTN9hEOvfvnSP0/UAd3NeJL7WpoQiktY2qa2aAGT
	4b
X-Received: by 2002:a05:6000:4383:b0:47f:8a78:e814 with SMTP id ffacd0b85a97d-47f8a78e864mr1966333f8f.9.1784737727656;
        Wed, 22 Jul 2026 09:28:47 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3382:6663:1606:b6ac])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c6d277sm7563000f8f.32.2026.07.22.09.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:28:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Maxime
 Ripard <mripard@kernel.org>,  linux-rtc@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 2/4] clk: sunxi-ng: div: add read-only operation support
In-Reply-To: <CAGb2v64HjXygw76zaNi9KaG-zfc+hZoeyp4EHyz68fcdK-AXNw@mail.gmail.com>
	(Chen-Yu Tsai's message of "Wed, 22 Jul 2026 23:40:07 +0800")
References: <20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com>
	<20260722-a733-rtc-v6-2-631cca28cc9a@baylibre.com>
	<CAGb2v64HjXygw76zaNi9KaG-zfc+hZoeyp4EHyz68fcdK-AXNw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 22 Jul 2026 18:28:45 +0200
Message-ID: <1jse5bc7k2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_172849_791785_DDFE38DF 
X-CRM114-Status: GOOD (  16.84  )
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

On mer. 22 juil. 2026 at 23:40, Chen-Yu Tsai <wens@kernel.org> wrote:

> On Wed, Jul 22, 2026 at 10:48=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.=
com> wrote:
>>
>> Add support for sunxi-ng read-only dividers. This will be
>> useful to the a733 oscillator detection logic.
>>
>> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/clk/sunxi-ng/ccu_div.c | 31 +++++++++++++++++++++++++++++--
>>  drivers/clk/sunxi-ng/ccu_div.h |  1 +
>
>>  drivers/clk/sunxi-ng/ccu_mux.c |  2 +-
>>  drivers/clk/sunxi-ng/ccu_mux.h |  4 ++++
>
> Left over stuff?
>

Argh indeed, that's no longer necessary=20

>
>>  4 files changed, 35 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_d=
iv.c
>> index 62d680ccb524..c385e0160f13 100644
>> --- a/drivers/clk/sunxi-ng/ccu_div.c
>> +++ b/drivers/clk/sunxi-ng/ccu_div.c
>> @@ -20,8 +20,22 @@ static int ccu_div_determine_rate_helper(struct ccu_m=
ux_internal *mux,
>>         if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
>>                 req->rate *=3D cd->fixed_post_div;
>>
>> -       ret =3D divider_determine_rate(&cd->common.hw, req, cd->div.tabl=
e,
>> -                                    cd->div.width, cd->div.flags);
>> +       if (cd->div.flags & CLK_DIVIDER_READ_ONLY) {
>> +               unsigned long val;
>> +               u32 reg;
>> +
>> +               reg =3D readl(cd->common.base + cd->common.reg);
>> +               val =3D reg >> cd->div.shift;
>> +               val &=3D (1 << cd->div.width) - 1;
>> +
>> +               ret =3D divider_ro_determine_rate(&cd->common.hw, req, c=
d->div.table,
>> +                                               cd->div.width, cd->div.f=
lags, val);
>> +
>> +       } else {
>> +               ret =3D divider_determine_rate(&cd->common.hw, req, cd->=
div.table,
>> +                                            cd->div.width, cd->div.flag=
s);
>> +       }
>> +
>>         if (ret)
>>                 return ret;
>>
>> @@ -143,3 +157,16 @@ const struct clk_ops ccu_div_ops =3D {
>>         .set_rate       =3D ccu_div_set_rate,
>>  };
>>  EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
>> +
>> +const struct clk_ops ccu_rodiv_ops =3D {
>> +       .disable        =3D ccu_div_disable,
>> +       .enable         =3D ccu_div_enable,
>> +       .is_enabled     =3D ccu_div_is_enabled,
>> +
>> +       .get_parent     =3D ccu_div_get_parent,
>> +       .set_parent     =3D ccu_div_set_parent,
>> +
>> +       .determine_rate =3D ccu_div_determine_rate,
>> +       .recalc_rate    =3D ccu_div_recalc_rate,
>> +};
>> +EXPORT_SYMBOL_NS_GPL(ccu_rodiv_ops, "SUNXI_CCU");
>> diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_d=
iv.h
>> index be00b3277e97..a30a92780a05 100644
>> --- a/drivers/clk/sunxi-ng/ccu_div.h
>> +++ b/drivers/clk/sunxi-ng/ccu_div.h
>> @@ -300,5 +300,6 @@ static inline struct ccu_div *hw_to_ccu_div(struct c=
lk_hw *hw)
>>  }
>>
>>  extern const struct clk_ops ccu_div_ops;
>> +extern const struct clk_ops ccu_rodiv_ops;
>>
>>  #endif /* _CCU_DIV_H_ */
>> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_m=
ux.c
>> index 4503c9780c39..12bfc99c9172 100644
>> --- a/drivers/clk/sunxi-ng/ccu_mux.c
>> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
>> @@ -67,7 +67,7 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_c=
ommon *common,
>>         return parent_rate / ccu_mux_get_prediv(common, cm, parent_index=
);
>>  }
>>
>> -static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *c=
ommon,
>> +unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
>>                                             struct ccu_mux_internal *cm,
>>                                             int parent_index,
>>                                             unsigned long parent_rate)
>> diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_m=
ux.h
>> index c94a4bde5d01..272a2c36a8f2 100644
>> --- a/drivers/clk/sunxi-ng/ccu_mux.h
>> +++ b/drivers/clk/sunxi-ng/ccu_mux.h
>> @@ -134,6 +134,10 @@ unsigned long ccu_mux_helper_apply_prediv(struct cc=
u_common *common,
>>                                           struct ccu_mux_internal *cm,
>>                                           int parent_index,
>>                                           unsigned long parent_rate);
>> +unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
>> +                                           struct ccu_mux_internal *cm,
>> +                                           int parent_index,
>> +                                           unsigned long parent_rate);
>>  int ccu_mux_helper_determine_rate(struct ccu_common *common,
>>                                   struct ccu_mux_internal *cm,
>>                                   struct clk_rate_request *req,
>>
>> --
>> 2.47.3
>>

--=20
Jerome

