Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBD6C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 08:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G38oZPD0ZUO+4eufUOOmiC+1nFVfHKSYBYFSxQkb+SY=; b=FiV1zy06jtPnggbNebcQFOqeqU
	sraiC6fldtHs6mt43vUUjkE+Q4cnL3x0NT1VZMsf+WVj790Vw44eokRt+WYL9om7Bhxd3VHwie/Tw
	VOX7yq4PsVfyXDfrB+8/rHOUAO12Spkt9KwsgLIFU8cT1V+bUvLn357Qcch1a09w+6DgVYea0+ilZ
	yW0/DYMqbTRjnABW7j7GJvQL8P+qtlSjC9KYbRaidcfTVVJx2GkMeFWaht+9T/QLLLzIpuiCofk74
	6PhURdAe/kjEP+rCMZXs1zzZKiHRkcJYEfIQGUoUyOfchHr9f6m1PFQRxBEJQt9+rcOVT4hJGeZ6F
	cmreypgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULhe-00000007zmW-3Rte;
	Wed, 25 Jun 2025 08:41:58 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKpa-00000007rMj-1Sji
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 07:46:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso48104755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 00:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750837564; x=1751442364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G38oZPD0ZUO+4eufUOOmiC+1nFVfHKSYBYFSxQkb+SY=;
        b=0Ys3Ivtx9v08r9NOfMXBZjO/AMbDyVWXDX/141ISjRZ2oGEbxckWl+TuWe+d9+q2RT
         DgjjTsyLvZKVBe+x3mDrukRRcj6x1dM/VNCFnN0PJGspo4gPl8Hx04vAdU9lL1ZdnuWj
         fpg54Gky/i3l9R/MeCsOp/fpl5Ibrffaa7gbLZswnlbPA7bPYmWb8nvnNUQJ3wBDr3bO
         KDb7f4DCJ1QqNkx4DDhA/smd1fwGoencVuFamI9R9YoYpTdKz35yvtiEwcLSXd/72y/C
         GJd0O9sW7P/ajbi6VpzryMCunqAS/Nm9FqcHqEhkGSXVHOTB7V8Qrwzys4fyDd4bHOWT
         Xf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750837564; x=1751442364;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G38oZPD0ZUO+4eufUOOmiC+1nFVfHKSYBYFSxQkb+SY=;
        b=ityMtpLCRhoMOWgkL7W8jOmwNopJpyqAm2BJQGJ80ijng4kjylWHekp+N/6UNThAEp
         a31x+sPZ0r9COJd+Q0uPiaQocT5iGE1X7x8n2uBjw5NhV1/wqTDwc+Srsxpb66LsUC+L
         w9MvGZhBzfrnUacHlWbbtZ3c17+OR+MULR7NBYZDXIbBmuVZCNWEyUqhgUCwKZUBpDp5
         7b1nbd8PviQ4l3XPHyf3J1zje3qOEsyjh3qowisYluCJBas4PHzulwUm5XPfLgdE6GQ4
         YRZmo6QI9a4k/5/N/m0d3uzmSQeft4GG4TUC2JyJhg8f/DTg8IWSajIgoGSNO3FEw+5q
         ZWcw==
X-Forwarded-Encrypted: i=1; AJvYcCUqMc1KQ7Ed96ONQydXzi7b+dnbPwSpqUNwiEaUFikj7M4URSIPvTToGm+BDLDN7dA11m+5b4b0buPszX6JNO7b@lists.infradead.org
X-Gm-Message-State: AOJu0YwSVM2NXF9MaJAIHMXFBSPDurKGoQ0e5Yoa1HDtp5p+ryYspUxo
	Eajld5seXrA4uqduJ8rYX5l6aFxIme1D8XP1NyXqpHbr0gz5qznjcYS6VxJZyFwr+1w=
X-Gm-Gg: ASbGncvytO6P3hIfl5IQjjGZ4ynFWVS3jjWlCTdr/q8Yw9lCrx92IpkEZJKhf7ZX7oO
	ySGCOQoHoFM9CvwKeCDf3m7rJE5/MiVQ2bCy0q21hdija9rqylTGGH+PG0KhirAkOJtRmPxjpDA
	+35VZbbiXg4KjndD9E76NKAAbs/JevLgZCuHpJUHVFZCIrV+qNACo1YXI7B0OpNBbS8z3oZ4OHH
	QE0tzdsqpb7ohXrNcdjoCany4oKkd/TIP+1lpshe6DMiAqAglrmr3ofGKaO5oOWvnRt32dlKExh
	jiiNCFyBt+gJsskfREAw29ok3JCWahn0fZp5vTu29RmBWH8gly7lsQtawXzToyC4tpimsCSj
X-Google-Smtp-Source: AGHT+IEFcmap2xUg1PMroE0rTK44KQv6jBprJalyHbE1zkENpItZBZ87xVowh0/gWqyHbHbnprwUrg==
X-Received: by 2002:a05:600c:4684:b0:450:cea0:1781 with SMTP id 5b1f17b1804b1-45381ae456bmr17467905e9.16.1750837563946;
        Wed, 25 Jun 2025 00:46:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:87a0:eae0:c854:b578])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45380fd167bsm14015175e9.0.2025.06.25.00.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:46:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Chuan Liu
 <chuan.liu@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Dmitry Rokosov
 <ddrokosov@sberdevices.ru>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 4/6] clk: meson: t7: add support for the T7 SoC PLL
 clock
In-Reply-To: <22a24fe6-9e62-4aba-825e-aee214f683ee@amlogic.com> (Jian Hu's
	message of "Wed, 25 Jun 2025 10:52:28 +0800")
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
	<20250509074825.1933254-5-jian.hu@amlogic.com>
	<1jtt5ny6gq.fsf@starbuckisacylon.baylibre.com>
	<4dd25114-212d-44d6-938a-63871750c292@amlogic.com>
	<1jh60fd52u.fsf@starbuckisacylon.baylibre.com>
	<22a24fe6-9e62-4aba-825e-aee214f683ee@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 25 Jun 2025 09:46:02 +0200
Message-ID: <1j7c10jmbp.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_004606_501906_7E826601 
X-CRM114-Status: GOOD (  17.68  )
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

On Wed 25 Jun 2025 at 10:52, Jian Hu <jian.hu@amlogic.com> wrote:

> On 2025/6/17 0:27, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Thu 12 Jun 2025 at 21:02, Jian Hu <jian.hu@amlogic.com> wrote:
>>
>>>>> +
>>>>> +static struct clk_regmap t7_pcie_pll_od =3D {
>>>>> +     .data =3D &(struct clk_regmap_div_data){
>>>>> +             .offset =3D ANACTRL_PCIEPLL_CTRL0,
>>>>> +             .shift =3D 16,
>>>>> +             .width =3D 5,
>>>>> +             .flags =3D CLK_DIVIDER_ONE_BASED |
>>>>> +                      CLK_DIVIDER_ALLOW_ZERO,
>>>> What's the behaviour of the divider on zero then ?
>>>
>>> If there is no CLK_DIVDER_ALLOW_ZERO, there is a warning when registeri=
ng
>>> t7_pcie_pll_od.
>>>
>>> like this:
>>>
>>>    ------------[ cut here ]------------
>>>    WARNING: CPU: 1 PID: 1 at drivers/clk/clk-divider.c:140
>>> divider_recalc_rate+0xfc/0x100
>>>    pcie_pll_od: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
>>>    Modules linked in:
>>>   CPU: 1 PID: 1 Comm: swapper/0 Not tainted
>>> 5.4.283-09976-ga803e94eed88-dirty #91
>>>    Hardware name: tm2_t962e2_ab311 (DT)
>>>   Call trace:
>>>    [ffffffc020003750+  64][<ffffffc0100e3e3c>] dump_backtrace+0x0/0x1e4
>>>    [ffffffc020003790+  32][<ffffffc0100e4044>] show_stack+0x24/0x34
>>>    [ffffffc0200037b0+  96][<ffffffc01130a2e8>] dump_stack+0xbc/0x108
>>>   [ffffffc020003810+ 144][<ffffffc01010c484>] __warn+0xf4/0x1b8
>>>    [ffffffc0200038a0+  64][<ffffffc01010c5f4>] warn_slowpath_fmt+0xac/0=
xc8
>>>   [ffffffc0200038e0+  64][<ffffffc01061d364>] divider_recalc_rate+0xfc/=
0x100
>>>   [ffffffc020003920+  80][<ffffffc010624e84>]
>>> clk_regmap_div_recalc_rate+0x74/0x88
>>>    [ffffffc020003970+  96][<ffffffc010616a54>] __clk_register+0x62c/0xb=
78
>>>
>>> so add it to avoid the warning.
>> That does not really answer my question
>
>
> Sorry, I did not get you before.
>
> I have set OD to 0.=C2=A0 And measure pcie frequency,=C2=A0 It is 37.5Mhz.
>
> 4800Mhz/2/32/2=3D37.5Mhz, and the OD equal zero means divided by 32 in fa=
ct.
>

CLK_DIVIDER_MAX_AT_ZERO maybe ?

> Here is the test result:
>
> devm 0xfe008140 32
>
> 0xD40C04C8
>
> cat /sys/kernel/debug/meson-clk-msr/measure_summary | grep pcie
>
> [16] pcie_clk_inp =C2=A0=C2=A0=C2=A0=C2=A0 37500000=C2=A0 +/1 3125HZ
>
>
> the OD divider is N crossover. it is one based.
>
> and It's possible to go from 1 to 31 crossovers.

--=20
Jerome

