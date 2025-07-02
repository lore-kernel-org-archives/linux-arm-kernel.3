Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF77C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+vISXamBlP3ozifS/SwZ99717v8q0Kc6KegIFog+sA=; b=PgbTHmIVBWQrHih3+pWzgd2Iw3
	4cSpatq874nAkajmUlK8y70mggWnDOWCf/X5W2trcShXiJ6ahXN7Zz2EHmSbfgPGrv26j7fZc3BsK
	LYJknJvmwabeqGeJ51QZH1O1qonk7NSTuzg+W4ix4Cw/oBZv42+oRYDyXpOHGQtKPOceW4/eE2upD
	B0gdASh0+heksmFEavC47qRd6DElGtb2/Fn6WYo7YBSuA4JdjmBLM2fqJRhG8arRWvalFrXAWPSzw
	XjyRupP4S//fD+RelTV9AbZ4fov5X8XKzew+bT9xMZSNKD4sCQbZMR4BQu4Lzine8zJ+hfb99+vs2
	O1GVTQAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZH-00000009AKJ-38p3;
	Wed, 02 Jul 2025 17:48:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0vg-0000000947A-0Jog
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 17:07:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-451d54214adso51284945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 10:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751476046; x=1752080846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+vISXamBlP3ozifS/SwZ99717v8q0Kc6KegIFog+sA=;
        b=GnLYb+d6q0QU35zCouwoaP430JED9omkZkIrZbQgtTVKx0+5JcRxJUPvadygRcMGBZ
         9qkipHci1QaoBUGZANL5EpBjpcPeNZ9ODRoZys6MTBWiXS1mqt70677Th4gAob0WcKVT
         IPI02FSaF+DfPXjTZhxyEXdiAjHmwBfkv3D4msuD2YooxiYP3Od1bz3NjoCIlcaAuIZh
         KTqh9g+CFtiSjd7d6SL4crU8F/2MKmdBCVVJGWxwwExeYy2A0CV8VfeJlRgs2of36aek
         1cKMt0tT4dMN1RfZS47VHgfBwYMsVk9MnWsn67nJw7DTwwrsKlquZJfZP0BArvo3iAC6
         7jRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751476046; x=1752080846;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M+vISXamBlP3ozifS/SwZ99717v8q0Kc6KegIFog+sA=;
        b=AnJQsAd6q0VSBxp2So4kYBB7V5KSjNqYDCZHyu+BMfU4nwgpSD9T13VashqhW+/aqF
         0o44ObBAkOdmtRUSfNMmsvDVyhbrLsI1HDsmcXaa1IO7k/D92UMDL6tl44Su78WtmPpV
         sj7jF9W4KndN/X0pgZkiN1+vUpYLypXaYC/sH/2YGUZ0bDRR3q7iMYkOhq5QR/l9YfiJ
         6pVssurE1NyxHno4Lg/Nalxj9Ap1cCi+A9rAfrgA3g22U50WIETNRgbc1zywaYVJn4yq
         l/MLnIUPde9TVsInr7Ch2uq1WQvakGnDApBZ7g009q2SwKtbVy2wdbsG6/z1Y9Lj8hwd
         D6xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcVMhSMg8dbYDaE7Et4Kz70gsPQDMI5W+fstIsSZUozmw3nQLBJofJJHi/7XX+XM3BzlJiolp6a4NaA/Gjmh0l@lists.infradead.org
X-Gm-Message-State: AOJu0YzbL3Ppzw8r030phWAMZExaO80PJqRdT7r1RvWWYj6IuXDCbL1V
	WJABO2fuxpt4y89U5Nzmr1lDq3XOIpVrbzagrxYn9LgS9ztMYFE9MeShs1cYvbq8b40=
X-Gm-Gg: ASbGnctDyuX4qRvb0BCCcg6QHq2jPCvSA5INg2yW9T+wf0LEZt1jNQaJ2AEnlrnqoKw
	ExkOkzGNFiH0qYuba/2guO2fZgpr+fCpIer1M0yPX0h5R8fRjCqxCXu5ZUwi5QqMXxQii0Ixx9v
	WM+9AOzRTB1V2PIAKMuOrUFjjUHe4OI3RVGLmE06yMej2js6ExoXbKl3qLqehGXRaFVBCLPyy0S
	0L5779sIkwW+FuRoNqopRfSwoGcQR1umKVB01Ru7APZi48V7PRIb/tddR/G29sl/szEOihGoEjn
	smdXIK8cV4qIpnqR/3tw+cWjWFq7Hln5mMJtDJUjuv1ubfWnVdqlkQl5+tF4kwdwKUcW0awz
X-Google-Smtp-Source: AGHT+IGsc5GDljzmbKBoFeO/zgtvwlzCDxGi06+LsKgR6vPGC7cmyTyt4ATYLRK/0lVoCqPQXxkzvA==
X-Received: by 2002:a05:600c:3b07:b0:450:d00d:d0 with SMTP id 5b1f17b1804b1-454a37083b6mr36766495e9.19.1751476046563;
        Wed, 02 Jul 2025 10:07:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a9bced0esm3171085e9.22.2025.07.02.10.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 10:07:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Anand Moon <linux.amoon@gmail.com>,  Da Xue <da@libre.computer>,  Ulf
 Hansson <ulf.hansson@linaro.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,
  linux-mmc@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
In-Reply-To: <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
	(Martin Blumenstingl's message of "Wed, 2 Jul 2025 18:27:55 +0200")
References: <20250628015328.249637-1-da@libre.computer>
	<CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
	<CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 02 Jul 2025 19:07:25 +0200
Message-ID: <1j4ivued2q.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_100728_350888_2C17ABB4 
X-CRM114-Status: GOOD (  25.81  )
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

On Wed 02 Jul 2025 at 18:27, Martin Blumenstingl <martin.blumenstingl@googl=
email.com> wrote:

> Hi Anand,
>
> On Tue, Jul 1, 2025 at 12:00=E2=80=AFPM Anand Moon <linux.amoon@gmail.com=
> wrote:
>>
>> Hi Da,
>>
>> On Sat, 28 Jun 2025 at 09:15, Da Xue <da@libre.computer> wrote:
>> >
>> > Regulators controlling the SD card power need some settling time for SD
>> > cards to fully reset from UHS modes. The regulator framework seems to
>> > ignore falling times set in the device tree causing a few boards with =
the
>> > same hardware implementation to hang on reboot because the SD card sti=
ll
>> > had some voltage and did not reset properly to be initialized again.
>> >
>> > Add a delay sufficiently long for the voltage to drop so that the SD c=
ard
>> > can reset properly. Otherwise the reboot will hang at missing SD card
>> > especially with Samsung cards.
>> >
>> Although the driver defines reset identifiers such as
>> RESET_SD_EMMC_A, RESET_SD_EMMC_B, and RESET_SD_EMMC_C,
>> It does not implement proper reset controller functionality,
>> specifically lacking support
>> for reset_control_assert() and reset_control_deassert() operations.
> I think there's a misunderstanding:
> The meson-gx-mmc driver calls device_reset_optional() during .probe
> which will internally call reset_control_reset().
> So I don't see a problem here.
>
> The patch seems more about power sequencing, where either the SD card
> or regulator used to power the SD card requires a certain amount of
> time (delay) when switching from ON -> OFF -> ON (my understanding is:
> without this delay the card sees ON -> ON which fails to update some
> state internally).
>
> To me it's not clear if this is a property of the SD spec or rather
> the regulator.
> Ulf, Jerome - any ideas / inputs from you?

If, as the description suggest, the regulator framework somehow ignore
the timing set in DT, maybe this is what needs to be checked ?

TBH I would suspect the delays before the regulator framework itself.

Those assert/de-assert delays tend to be just copied from boards to
boards. Maybe some boards need different delays. If those are too short
for the actual HW, an ON -> OFF -> ON could result in a NOP.

>
>
> Best regards,
> Martin

--=20
Jerome

