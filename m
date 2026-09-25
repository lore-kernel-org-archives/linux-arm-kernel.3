Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C82C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 09:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUy9AG7lIgjavOAkd4pUReRQm+p1laq2n2IXc5r/9Fk=; b=GpRAhIeLP70uRsDG5Dp1VEN2yz
	6A+KciOqH0mikeoD71eD8FGmLc+WZF2PzRDhvFQowQfhEAyddoS1Er6lfjsMql12+YcdQNiQxGBns
	GKSI3VohHrCpOI/FpOLz47aGOJKeuZKDSIJabeHjwpK4OTtP9zqQK3X1nJJAODDgPVmZ8nwBVmmff
	IQo47my8lt2wn6VYDAlVJ/y+uXqCn83/6/+f0pnzgzR+cwtFqV06nVtMjNXvGmrOqYtg3mGJVZaE3
	LG3bLZwRWUQc98JvPRn6kPzku3bvB3aTFwcJwlurrB2s+LAZtGgWevfjSoDYAKWxWsi69p4/jcuhZ
	1TnSBofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA20b-0000000Cz4U-3ebF;
	Fri, 25 Sep 2026 09:14:21 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA20Y-0000000Cz3f-4Bwl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 09:14:20 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843796e373so367582f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 02:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790327657; x=1790932457; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RUy9AG7lIgjavOAkd4pUReRQm+p1laq2n2IXc5r/9Fk=;
        b=Bira7E1IFuCMUIWYJ6Cj8d/gL0ngsrPYO6JmJjiHFllQ/1d6V6Llh6zJKZ3LJTSE69
         OJ0Wezj2eP/gX7bUGV4RVjwaSpgdMyWyxwhexjk6Mq26RoX+K9SxYuQlXuHPKhJvVh72
         OgRcv7FAf4fLwqXl/GXrNTJn2Afye7IJV9iVYdsqXvkPynMJmhOCL/9oS1HZ94K/PVS2
         GyPACaNaD4M3lUWTfDzP5YY1UdXlsXyszBZ8Q4u+0YcC5aKf2N4jA2CnbT9SPkv6Mvvb
         pP8A8bWzT3kD7F6A2BAwCO6aSGj25N4Q5AGzZ4b5FIh8XNpgC+nFp6bQn0mfVWewXra4
         oFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327657; x=1790932457;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUy9AG7lIgjavOAkd4pUReRQm+p1laq2n2IXc5r/9Fk=;
        b=WIPHv6/rVvK7CpgjqGISVnVPJ41ujFx1kGWUaErpSG5xbKNE70IHmqg2e8a2O0q31h
         vl2dzJGogSiQJdvsuwAu7av8pE42y+UlXSQdATnWPtDqrT+uzF2sv2O4esFnDocx41Im
         5rbXnmM7tXOByxyTvCxFFOu9DRu73zvLS4W1P6nI05Wi0GW3d+350Asn1ZA5uWRB6czv
         nreS9XbPoJsL02zFBPwjtzEijbjEIJR86w/dj7InHmtMj+hsMQo+tkYr9LLeIyZPmQrX
         xQYfIiadv8mxUfdvPSaufmZpJ/3kHbFxoSS2YLTQq2ionn7kpsGh+u8yBiMsGpKJPnLl
         cu3A==
X-Forwarded-Encrypted: i=1; AKwUvBznwJeZ7CfmDXZyFTACefk8eoAMzofh/H/zzUcgpgOhCIkt9yiKkBoRL4Rno/vMQSlZYHI/H60itZcMgt9LApBU@lists.infradead.org
X-Gm-Message-State: AFuF++kgogNoLvk59vlz/cT7AU9JCdAsVdcVSjwzf7WGlB+vVTUyH10p
	IRJQNFQHP6umySTfckAfUs3tLMM8k27fw8dETiDLAb4OnFszSNUJuCGXsA4uScPmoJg=
X-Gm-Gg: AYBFou2uVEk1buY8Cg3IRHWLfVs8JuX2hDUsZVZP2xhqiNWmRp+I6Kq0LGvnfrgwcwJ
	CXDqRYECAGL2cfKYqlYt4AJoq3O0QPdGLfmGbXLPijVf2W9Lc5FO6+Ope3ZDJM+yUkO0ZrzXB6V
	TUm0uLzNOJyUvgXgC6TFz+h9u28b3IbAQEECZ8N76cqwRNJBPuwhG6c6YQM6fDDIWCJrwLnALB4
	5pCglziA9APPyvQZGsJO2tUFtJFlwX7l9yYgDqyL3y78utupSY9U4ljvnVDVPD4m/F4zPqKVFpT
	ymWBS32v+X/2Xn6EUy3gIguPGcvFuwPdZsgu/NfcimCcnxEO0yDQseWJQVVWwANpU9cMaewaI9q
	oA6cpB0WgiZfFQ9vZFJ/+tL1UmjjTakame0Z4+RkgYYs2WYy+T9PsNhwmimmsQbDAHcijY9sJoH
	dsVn9hD2PkWLt5RX6cvAB8pB+TuIIyk5eMVohzd0A4h8+hp6gKWDWgZygUjrb+gjGJnFbN/MKV1
	U5krdZUYKAmCAVyZ5IQlWNH6WyU
X-Received: by 2002:a05:6000:18a3:b0:487:732:9964 with SMTP id ffacd0b85a97d-488716befa6mr10307474f8f.13.1790327656987;
        Fri, 25 Sep 2026 02:14:16 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm5295892f8f.9.2026.09.25.02.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:14:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "sboyd@kernel.org" <sboyd@kernel.org>, "bmasney+clk@redhat.com"
 <bmasney+clk@redhat.com>, "jbrunet+clk@baylibre.com"
 <jbrunet+clk@baylibre.com>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
 "afaerber@suse.com"
 <afaerber@suse.com>, =?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?=
 <jyanchou@realtek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>, =?utf-8?B?SmFtZXMgVGFpIFvmiLQ=?=
 =?utf-8?B?5b+X5bOwXQ==?=
 <james.tai@realtek.com>, =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?=
 <cy.huang@realtek.com>, =?utf-8?Q?Stanley_Chang=5B=E6=98=8C=E8=82=B2?=
 =?utf-8?Q?=E5=BE=B7=5D?= <stanley_chang@realtek.com>, Brian Masney
 <bmasney@redhat.com>
Subject: RE: [PATCH v14 09/11] clk: realtek: Add RTD1625-CRT clock
 controller driver
In-Reply-To: <b9d5a1a82df34aadaee2390af871f7c8@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-10-eleanor.lin@realtek.com>
 <178947735404.448573.10061486937030065064.b4-reply@b4>
 <b9d5a1a82df34aadaee2390af871f7c8@realtek.com>
Date: Fri, 25 Sep 2026 11:14:15 +0200
Message-ID: <1jjyo98zh4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_021419_064264_7EEE98D3 
X-CRM114-Status: GOOD (  14.04  )
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

On mer. 23 sept. 2026 at 05:43, Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=90=9B] <=
eleanor.lin@realtek.com> wrote:

> Hi Jerome,
>
>> > +
>> > +static const char * const clk_gpu_parents[] =3D {"pll_gpu", "clk_sys"=
};
>> > +static RTK_CLK_REGMAP_MUX(clk_gpu, clk_gpu_parents,
>> CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>> > +                       0x28, 12, 0x1); static const char * const
>> > +clk_ve_parents[] =3D {"pll_vo", "clk_sysh", "pll_ve1", "pll_ve2"};
>> > +static RTK_CLK_REGMAP_MUX(clk_ve1, clk_ve_parents,
>> CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>> > +                       0x4c, 0, 0x3); static
>> > +RTK_CLK_REGMAP_MUX(clk_ve2, clk_ve_parents, CLK_SET_RATE_PARENT |
>> CLK_SET_RATE_NO_REPARENT,
>> > +                       0x4c, 3, 0x3); static
>> > +RTK_CLK_REGMAP_MUX(clk_ve4, clk_ve_parents, CLK_SET_RATE_PARENT |
>> CLK_SET_RATE_NO_REPARENT,
>> > +                       0x4c, 6, 0x3); static
>> > +RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_misc, CLK_IS_CRITICAL, 0x50,
>> 0,
>> > +1); clk_en_pcie0, 0, 0x50, 2,
>> > +1); clk_en_gspi, 0, 0x50, 6, 1);
>> > +clk_en_iso_misc, 0, 0x50, 10,
>> > +1); clk_en_sds, 0, 0x50, 12, 1);
>> > +clk_en_hdmi, 0, 0x50, 14, 1);
>>=20
>> This is a lot of clock with no parents which is a bit suspicious especia=
lly for
>> gates.
>> What is really feeding those ?
>>=20
>
> In v15, we will do our best to reduce the number of gate clocks without a=
 parent.
>
> However, after discussing with our colleague, we confirmed that for some =
of
> these NO_PARENT gate clocks, their actual upstream clocks (like PLLs and
> Muxes) are located in separate, independent hardware subsystems. The regi=
sters
> controlling those upstream clocks are physically inaccessible from the Li=
nux
> CPU domain.

Control and input are different things. It feels like your DT (binding)
description is not complete as it stands which will eventually be a problem.

A clock with no input is something that does generate the clock by
itself, like an osciallator. Pretending it has no parent because you
don't know how describe it yet is wrong.

>
> Best Regards,
> Yu-Chun

--=20
Jerome

