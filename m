Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F029BD41C18
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYPA6nWxJUsYUlpjbB6I1lZwViDm6ZxacBmzJ+ckWi0=; b=0esle622gCwdWrOLS5BLI9LRcm
	4n1rnQIsoBLYT5H9OrW6gvZfgiJobRI4jvDGP3ghD4Gldjf2mmtcNgaaIpAf2q3JO6wM7H/55VjKJ
	EYr2NEIIxZBiGv/uMNsa8aNNxxtKrW3s/Fr3A/EzEzDEUiZ95sfvH+m7dovCaShu9IJ85gqNabdzc
	TUy5c82op82NnPdebIQwxGTVhO4R9jrVix8PXDhs47Y4I8ZZwfvEcRVOVUR6E5QKENHniiwi2OROh
	yHqMX/McJe8/cn9jEaxXg/+iNtuGbEf5f26hWwCKQ+zVIdwJDoiDrAtjsXWkVIb/HFqcFdgYUzRJL
	03FeSpuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8u8-000000067vd-0BUn;
	Wed, 13 Nov 2024 08:39:12 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8rM-000000067NC-0uPF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 08:36:22 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539fe76e802so7252300e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 00:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731486978; x=1732091778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYPA6nWxJUsYUlpjbB6I1lZwViDm6ZxacBmzJ+ckWi0=;
        b=XaQJQdr5vdkTYaAFhdqH4TkrlMoaF3fWE5oSyrctDb+4+tkfsumSw/EhS1kePJ6Ey+
         KGwTkFO7tqAEnWALwgcza0QFdtfV3iSpQGh92CzhSyeIaJQku+e8B0KVD1GmaDiqjiTN
         CVrA1pt6+d2Duhl+P+2oU7ZS2coXkYK43D1IUUz+u+wYbyhfh4WMdS1HWzlNrgcZHRjw
         QWwlqIxFGBYEwjTFW04/kleUCKgZUKxW5DfwgDYkChAaZiP2l3klDKQwgXNH4lfrGbIM
         VJduf8c6VxY5k3s54kFtV7v+B1KGTFzUB6bqUZF+lJbcsYr3nNgtaiw91HSdDYdKSiY/
         0zEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731486978; x=1732091778;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYPA6nWxJUsYUlpjbB6I1lZwViDm6ZxacBmzJ+ckWi0=;
        b=jzEamgfHrgD+HMRl4hO44RXRRr2ns0pJL2+MIPdEl9jlYnUW9A+smHFHd3Ro/ckepN
         GtI3udEKcsAaisOrds/zsFFgqSk6TaVoC+yoMGiXO5oySuNq4++fH+ULmnYj/eKHqLom
         GyMLMd2gqDGe9iCDOG1TRElu1p5Z5H4AAUrOvhnuKDJLyrdGpZjnrqL4Wakhwdp4FbOm
         YTod1M9K4nlh2vqqmL5k9fPn5JXLC2BLCkaxGFhhnx55eryHaEz+seS8AJ3OW12aRBQu
         nxWRi9kdThZhjXzff3izDkoUMb9ovEaG0K74ZZ1SbR4pJhwRGLm1h/rQnTG1xjNCEU5+
         qx3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEgPJ74PSR9eLrJIgripb+1mhwM9x20XWH9hCasYO4YNmbSm10yvzHaqZ/f7Xh6Nvl0wCWnvoGKpxwbtkScGSS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj/ko0By/NTRYyHjrx9NTWDpqtgHuPM2du90ssNzheD5qw2SPL
	j8uPDjgG735boB8xujwrehGMFfr+4V467+hz7bb8QzEq1eZL6FHoWBI4Hbvtjy8=
X-Google-Smtp-Source: AGHT+IGWfeeUXb1J7tNUbkIyXcKwhdZi8cijjSk5i0m1HIdGPU3q+vOzGiu/Ie/Rwn7qF3wDur68cQ==
X-Received: by 2002:a05:6512:3b12:b0:53d:a321:db74 with SMTP id 2adb3069b0e04-53da321dc7cmr28537e87.50.1731486977586;
        Wed, 13 Nov 2024 00:36:17 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:1230:8bee:11e5:5035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d478511dsm18535635e9.0.2024.11.13.00.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:36:17 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: neil.armstrong@linaro.org,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Jian Hu
 <jian.hu@amlogic.com>,  Dmitry Rokosov <ddrokosov@sberdevices.ru>,  Yu Tu
 <yu.tu@amlogic.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: meson: Fix the determine rate error in
 clk_regmap_divider_ro_ops
In-Reply-To: <da391fec-738a-4044-a598-fee1137dfa5c@amlogic.com> (Chuan Liu's
	message of "Wed, 13 Nov 2024 14:55:50 +0800")
References: <20241112-fix_childclk_of_roclk_has_been_tampered_with-v2-1-64f8009cdf2a@amlogic.com>
	<35307d7a-a110-430d-9ba5-808a05450adb@linaro.org>
	<da391fec-738a-4044-a598-fee1137dfa5c@amlogic.com>
Date: Wed, 13 Nov 2024 09:36:16 +0100
Message-ID: <1j7c97v8cf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_003620_478794_EBE7E277 
X-CRM114-Status: GOOD (  14.19  )
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

On Wed 13 Nov 2024 at 14:55, Chuan Liu <chuan.liu@amlogic.com> wrote:

 file changed, 20 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/clk/meson/clk-regmap.c
>>> b/drivers/clk/meson/clk-regmap.c
>>> index 07f7e441b916..edf65ca92c7a 100644
>>> --- a/drivers/clk/meson/clk-regmap.c
>>> +++ b/drivers/clk/meson/clk-regmap.c
>>> @@ -80,21 +80,6 @@ static int clk_regmap_div_determine_rate(struct
>>> clk_hw *hw,
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_regmap *clk =3D to_clk_regmap=
(hw);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_regmap_div_data *div =3D clk_=
get_regmap_div_data(clk);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int val;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 /* if read only, just return current value */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 if (div->flags & CLK_DIVIDER_READ_ONLY) {
>>
>> You're breaking current code by no more checking this flag,
>> the new clk_regmap_div_ro_determine_rate() is fine, but you should call
>> it from here if CLK_DIVIDER_READ_ONLY is set.
>
> My idea is that the newly added clk_regmap_div_ro_determine_rate()

Whatever your idea is, what has been submitted is broken, as Neil
pointed out

> implements the functionality of handling CLK_DIVIDER_READ_ONLY in
> clk_regmap_div_determine_rate(). If we still keep the logic for
> handling CLK_DIVIDER_READ_ONLY here, it will make
> clk_regmap_div_determine_rate() ambiguous and easily confused.

That would just shift the problem from one function to other.
Please apply Neil's suggestion.

>
>>
>> Neil
>>
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ret =3D regmap_read(clk->map, div->offset, &val);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (ret)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> -
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 val >>=3D div->shift;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 val &=3D clk_div_mask(div->width);
>>> -
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return divider_ro_determine_rate(hw, req, div->table,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 div->width, div->flags,
>>> val);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return divider_determine_rate(hw, req, d=
iv->table, div->width,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 div->fla=
gs);
>>> @@ -127,9 +112,28 @@ const struct clk_ops clk_regmap_divider_ops =3D {
>>> =C2=A0 };
>>> =C2=A0 EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ops, CLK_MESON);
>>>
>>> +static int clk_regmap_div_ro_determine_rate(struct clk_hw *hw,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct clk_rate_request *req)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_regmap *clk =3D to_clk_regmap(hw);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_regmap_div_data *div =3D clk_get_r=
egmap_div_data(clk);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int val;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(clk->map, div->offset, &v=
al);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 val >>=3D div->shift;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D clk_div_mask(div->width);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return divider_ro_determine_rate(hw, req, div=
->table, div->width,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 div->flags, val);
>>> +}
>>> +
>>> =C2=A0 const struct clk_ops clk_regmap_divider_ro_ops =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .recalc_rate =3D clk_regmap_div_recalc_r=
ate,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 .determine_rate =3D clk_regmap_div_determine_=
rate,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .determine_rate =3D clk_regmap_div_ro_determi=
ne_rate,
>>> =C2=A0 };
>>> =C2=A0 EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ro_ops, CLK_MESON);
>>>
>>>
>>> ---
>>> base-commit: 664988eb47dd2d6ae1d9e4188ec91832562f8f26
>>> change-id:
>>> 20241111-fix_childclk_of_roclk_has_been_tampered_with-61dbcc623746
>>>
>>> Best regards,
>>

--=20
Jerome

