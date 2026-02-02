Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9930DD172A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 02:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:In-Reply-To:References:From:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMiZMMtcuEUphHiFBhOZs43qw2Jy4XV2UcTsb9dz3D0=; b=mxUJOFI6ztwm5KyTA+QTq5xMAb
	RAgeFYyS50/cUI4y8P/dKUUmL8v+8/AoyeG11fv8P7K4hCH1XhoaOtQJGUJmZkD/Dpeu+i1+t/Eip
	F6R/SlR7oVL1VIniBRoNbWwmYkWC5fBRR+k6jRcTr1qcUJkPwJDa2vIs9hwlwbg9JRpovjGIj2+wI
	MbFbyiVChocHWqmzAnBe5zmNcaPv5haX8mWecof7csCGH1tQO6hHuMQCIEmD53IXdA3KTLxju/yIW
	v6ZJ/NyABj4F6n1OQwN3uHTWDdgSn0qBkVx3z0FPIbuOaiNFn/QuQe0rvf6S6YDmw/KySJwxowU41
	GyvGw3QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmjKp-00000004Kgz-0nE8;
	Mon, 02 Feb 2026 02:06:39 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmjKm-00000004Kge-24cw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 02:06:38 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-790884840baso35013747b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Feb 2026 18:06:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769997995; cv=none;
        d=google.com; s=arc-20240605;
        b=Tynidz8ywTrw1jr1TWG4DNgYqhusEu50zr5Z91MkocrNbUqrZ6Ru8ZATPRt//pyyKL
         aMIFLlkPoEi7Nd7XM6TaYk44jpTtNYDuDZgeLUdR9BVhyzJG52TnCI0Hwb3VQMR9XJoz
         PJhnEuptohLWZQl16r+ECHEDKeOHbcStk2jTGXVjGUEeHRG5Xg9/PuwSGlnfm4QHNX1T
         VHvQpHmGXoXjH6RUffiKGwyk3FwagTyjDNiZoSwD6N9Mu81Iz7qP8VlazKGgfyFfLc6U
         wz6h0mdZH1NJyEN74a7tY60v9NSygLDD+Up2Fk5moeEii89oeyHxLSR/qlYuVZ09gAFQ
         nbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:from:mime-version:dkim-signature;
        bh=aMiZMMtcuEUphHiFBhOZs43qw2Jy4XV2UcTsb9dz3D0=;
        fh=ThwIyRQusOOTiTx3Y4mK5Vo2grnYRJJp7aAyaUAMKjI=;
        b=eUn58p+gbG4t7LD1e8sb1IFRatHl4fk7E9fPNVrEiF6SpkbokVjymEY/hWTchrKDfS
         kr0bwj5AeR9iMpmGgvdQZ5ucU20Sh+G1GeVYbwluVGwyDjqPJdeB6FdBFc6fFPs2ogHX
         Ej86uLcm7Jj8GV5Zg2GBX+KE25CI2G0NSHKvi+DWjh88ONM0gNWKX9jSw8KWkWDSIiCE
         TKYDjmP+e6Kj1jukLeH45/uvOlx+H/fEqJfFQojnrq9R9oGnlO4WEI05n/aP57pMYoJB
         QAOiuxCu/bYNnxbYycFa119zaCINwwAHjvZR1N/5a4ZDoFQ/Q1sjwUStyCG4aDlDyNel
         ExwQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1769997995; x=1770602795; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:from:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMiZMMtcuEUphHiFBhOZs43qw2Jy4XV2UcTsb9dz3D0=;
        b=X3NpvXFF6mQGFL0sDGx1iqklFrYCOCMuxdxFV+633lnA8NiCTTnjp3HihDheT14elF
         5CqyovUesnvf7UkqRJJ6akbX/Tzln3m7hRRNxMarwQR3b5IaFI/6d/XPkBHKgQB6U4gQ
         of6EmegRJn56flMPwNUXFXh/nhntyGKTMnF9kHXq181A0xMTYzY8b/DKjLIC5iljTIcY
         Wuuor2BFSnCImMiecGGWxesdtg5G4P8Ii+qiK1e0FcmO3BSRy0vgzBN9XN4xc2fCWpYx
         CchX/c2BX7HfMxAe/uLp48FNukrJQjzNbnHxeJ+QtDOTz/wnqnWOtMpKsDIhsxDHVVc6
         Zw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769997995; x=1770602795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMiZMMtcuEUphHiFBhOZs43qw2Jy4XV2UcTsb9dz3D0=;
        b=ntZdXy4gmUohprecMtH5aQL56/SQi3PMA/F/AFkYlnDJ3faRXzeovtCNlDssrzYClj
         +5ljCHAbj43R0bDkCGp0LArzHvj8a9Lm6XeONeLxQODLcyVnE8/OuTuoBAG14Hub2gX3
         kui0H5bZAdxVblW+2je9wlghaIKDU87FULZQ6bkWZYwbAFmPamxRHe+Ddxpxa4152S7Z
         l6F8Rdj8Xs7nlLsQNkGjYRcIBG6X18TljsJqaMzNHZbJYbSStR0Uc/4MyKc2eeKAIND7
         eBMlDJhCE9hWSUxOiFK2x03Y9b1HjqUhGaP2vyaffoWfE4II2OD/b5d4tc6GJdxUSoYM
         lziw==
X-Forwarded-Encrypted: i=1; AJvYcCVd+QZ2PTQKbl1X2LRKgWDx1lzWe4Wywi+Mn5TWraHLT6FcSf8DPTp5Sl2p1LX+8xOo+dv+CkPOyrK2PRNUbbp4@lists.infradead.org
X-Gm-Message-State: AOJu0YyoMIAFrTc14hAlXvGZu1CiKFl0d7dHMxC5WYcXV90MwjEr1SFd
	jo5ffWNifmmgljervks9QwT2Rxl4XhxyJy4ulJjnMWX6J4zzv6TioykmvFV+M1XrqBPUGL0pob+
	0Q2Fm3+1GPoxGxz7VZIZz9+28cJZxKJbsPCsRDAeHFA==
X-Gm-Gg: AZuq6aIaUico396Mr1x9dIh+w6RqVJn6eYSvsWa7Qt2hCtrvbXYR5z7mahEf591uqPv
	U+P+TEfK+cXzL2tHAfEZJVcIOx2kkyIAs9mlorkLx7G+p3UMQw/iV7i8ZEiFy1+hGceDrtPTdrv
	REn4qEK1YaE3Dia4DYe2tyu/e032v4Yb8Ms8IobIqik53ZGAemMX/VohJVPwWnsvLSFANY3JDCE
	Sb6ewl2qV3+OPZQDYR0x0vrGRtK9AG2Wzjn4IDN+H1aV4OfhxOlC6oiE/unfezzxLgsdYEY
X-Received: by 2002:a05:690c:e3e1:b0:794:198e:943b with SMTP id
 00721157ae682-7949de7f6bfmr88706007b3.8.1769997994805; Sun, 01 Feb 2026
 18:06:34 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Feb 2026 02:06:34 +0000
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Feb 2026 02:06:34 +0000
Mime-Version: 1.0
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <202601311615.10yziOui-lkp@intel.com> <81522270-1703-48E1-B64C-8CF174E1EF94@nexthop.ai>
 <r2qkeep6jf7xxjzckn72z4avgx3qiqh4g2fkvzeyu2p2o54bff@xs4kzlong7cn>
In-Reply-To: <r2qkeep6jf7xxjzckn72z4avgx3qiqh4g2fkvzeyu2p2o54bff@xs4kzlong7cn>
Date: Mon, 2 Feb 2026 02:06:34 +0000
X-Gm-Features: AZwV_QgA40VM4P6w_-3GskOG6YPGtVtQKONh5VU7M0VmOxyGKRkaTPHiN25oam0
Message-ID: <CAGYn4vxTAJwO3GiKmRtD1gTit-Wm4VOMnxZPxUfUJ0JEwj8dEw@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, 
	Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_180636_564362_10276B56 
X-CRM114-Status: GOOD (  20.92  )
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

On Sun Feb 1, 2026 at 10:23 PM UTC, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Sat, Jan 31, 2026 at 06:14:58PM -0800, Abdurrahman Hussain wrote:
>> > On Jan 31, 2026, at 6:35=E2=80=AFAM, Dan Carpenter <dan.carpenter@lina=
ro.org> wrote:
>> > kernel test robot noticed the following build warnings:
>> >
>> > url:    https://github.com/intel-lab-lkp/linux/commits/Abdurrahman-Hus=
sain-via-B4-Relay/i2c-xiic-skip-input-clock-setup-on-non-OF-systems/2026013=
0-054653
>> > base:   63804fed149a6750ffd28610c5c1c98cce6bd377
>> > patch link:    https://lore.kernel.org/r/20260129-i2c-xiic-v7-5-727e43=
4897ef%40nexthop.ai
>> > patch subject: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
>> > config: i386-randconfig-141-20260130 (https://download.01.org/0day-ci/=
archive/20260131/202601311615.10yziOui-lkp@intel.com/config)
>> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 8=
7f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>> > smatch version: v0.5.0-8994-gd50c5a4c
>> >
>> > If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
>> > the same patch/commit), kindly add following tags
>> > | Reported-by: kernel test robot <lkp@intel.com>
>> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> > | Closes: https://lore.kernel.org/r/202601311615.10yziOui-lkp@intel.co=
m/
>> >
>> > smatch warnings:
>> > drivers/i2c/busses/i2c-xiic.c:1539 xiic_i2c_remove() warn: pm_runtime_=
get_sync() also returns 1 on success
>> >
>> > vim +1539 drivers/i2c/busses/i2c-xiic.c
>> >
>> > e190a0c389e601 Uwe Kleine-K=C3=B6nig    2023-05-08  1529  static void =
xiic_i2c_remove(struct platform_device *pdev)
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1530  {
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1531   struct device *d=
ev =3D &pdev->dev;
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1532   struct xiic=
_i2c *i2c =3D platform_get_drvdata(pdev);
>> > 36ecbcab84d023 Shubhrajyoti Datta  2016-03-02  1533   int ret;
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1534
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1535   /* remove a=
dapter & data */
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1536   i2c_del_ada=
pter(&i2c->adap);
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1537
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1538   ret =3D pm_runti=
me_get_sync(dev);
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29 @1539   if (ret)
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1540   dev_warn(dev, "F=
ailed to activate device for removal (%pe)\n",
>> > 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1541   ERR_PTR(ret=
));
>> >
>> >
>> > pm_runtime_get_sync() can return 1 on success.  Perhaps use
>> > pm_runtime_resume_and_get()?
>> >
>> > 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1542   else
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1543   xiic_deinit=
(i2c);
>> > 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1544
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1545   pm_runtime_put_s=
ync(dev);
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1546   pm_runtime_dont_=
use_autosuspend(dev);
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1547  }
>> >
>> > --
>> > 0-DAY CI Kernel Test Service
>> > https://github.com/intel/lkp-tests/wiki
>> >
>>
>> This maybe a false positive.
>
> It's not.
>
> The blamed commit 2557b4ba04df ("i2c: xiic: cosmetic cleanup") has:
>
> -       ret =3D pm_runtime_get_sync(i2c->dev);
> -
> -       if (ret < 0)
> -               dev_warn(&pdev->dev, "Failed to activate device for remov=
al (%pe)\n",
> +       ret =3D pm_runtime_get_sync(dev);
> +       if (ret)
> +               dev_warn(dev, "Failed to activate device for removal (%pe=
)\n",
>                          ERR_PTR(ret));
>
> So we need
>
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.=
c
> index 37a15065db60..a5334b7c46d8 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -1536,7 +1536,7 @@ static void xiic_i2c_remove(struct platform_device =
*pdev)
>  	i2c_del_adapter(&i2c->adap);
>
>  	ret =3D pm_runtime_get_sync(dev);
> -	if (ret)
> +	if (ret < 0)
>  		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
>  			 ERR_PTR(ret));
>  	else
>
> Best regards
> Uwe

Hi Uwe,

Yes, indeed, I missed that. Thanks for pointing it out!

Best regards,
Abdurrahman

