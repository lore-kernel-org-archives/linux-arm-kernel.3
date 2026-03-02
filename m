Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8268E9B36D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArgC6tchR6EEgYRqqpyMGswMfqPtVUgik7Fa59Flxok=; b=t0gBp8fjZ+pNrT7gBILHxf0Ru0
	KsE9YqxuycdJe6fvPEmICIgQDmSVzQHnqSP10bYYMzy6wLQ+p34uNc/f27SfLEoHgASBcAnBfFCJq
	Ff4TtQ6dj6VSQocJtVA2tkdTh7tFGNLIYUfRb6tiKm0deTi4FP1DwdBjgnlLkeHrnA963mTdA1aTl
	gNPIhtyA4Pvqgz1XyFhfTAWwAMX6j9HSdi5MNX61kMTeltdlOTNztxo69bJpqW/oaie1e3eZV0iAR
	wwtayoJwbrAyqAQZULV0PuRPk82sSO/pDx3T+QIdfROS7mpRPWYFpsxeHSeoYlxyo6syvPE7Mw8vI
	YHwWVdcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1wy-0000000CtW2-1o2w;
	Mon, 02 Mar 2026 12:00:36 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1ww-0000000CtVK-0z9h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 12:00:35 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ae50a33ff8so6267875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 04:00:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772452833; cv=none;
        d=google.com; s=arc-20240605;
        b=N/F7dbbFpVBv/ftp+lj4qXq8LWQ+dsOR0Lzy97IJR3UiPgZ9DycexiZDT5g0SzLkVx
         k/jLwQ7hBrOj3pkQC0hWe96ZLlEx934fYAfPVNQo5V8JtY7pP8tZVAQLCtYp62AFNZKT
         bRC7yqaKN68twVZP79v2KmWuUZZC4qXMLBxF3S/zmw10AtVzbbDnsTeqnSgjDG6kBvmz
         rraltXkzB1HYh3i3RfbW51xwWy9D/QIstX/STmWBJBwLW34vo3pMe2AnzN/O2NhJiQtU
         6rC6pxZ9NhqZgnturHlBdp9u31W2szuRyIt34U07yh+Pe9yLTZX/MQa+DpW95ASAhsEr
         X8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ArgC6tchR6EEgYRqqpyMGswMfqPtVUgik7Fa59Flxok=;
        fh=gU0T6csEq68yxqLeaajkn/5yI7aoJSkurInMzt33Lak=;
        b=FRjJpvBnH6qB/+Se4L0Mm+vxK3scV5SGUmabcQeRcjqg+8m7IzoNqy3/k2NawSF2IY
         DIrFOlP1RkM0Oq+j8i3bPTQTUKa9qLCAPvvrSqxJOVZeiowq3TwxGDtRXppf2V8OH6x+
         BpWt/aEozcuCSD2+PkTJUu5VoftxALxIW28kQJGKdbTpvaAMsH65sre1TlZdRXUZ7rS7
         ZNW0lLydkg/yqpsXqO0/YdHozk/N0O1dJ2hLDqph1pqzbvkjqnGjapu7PDezYexf/mC2
         cF/fx4MFL0aWJlKTbGsDauo40c0m48ljABxyxG9wiVnCKzYU2w9hjflbEKMBVvj2afeC
         RTfA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772452833; x=1773057633; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArgC6tchR6EEgYRqqpyMGswMfqPtVUgik7Fa59Flxok=;
        b=axN12TeZxHItut0/d5wBFt5s5Z3FA54T2Je7F0It48TkioUUuqZ4uBTVih8/z9zozF
         90iZouC30PAMP0hwam57YytZ937OhXco8krrIIOnTEFeTkfvX14wMYwFUC5XF5B9Yno7
         rUnI4K0PRtmsDSlD85rUnbT+J2vHz3+LoOd2sHLeQK1oiDbNL9FkF4imVeG0EJ0fAx5M
         hVKUgiOVtYx0RbOaVDE8mccIGj8WkJFuIIjQ3MhWS5luKqSTGyJGZFtc/TsWdEOZyIoX
         HAigrJepgrJ40Xkrf6nBcaxpAjFPrmxAZx9NJYdAczm+7/sf0QoKsUdYO0OcmthAkWfD
         WuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452833; x=1773057633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ArgC6tchR6EEgYRqqpyMGswMfqPtVUgik7Fa59Flxok=;
        b=gXxo/XeOXlXUXC07/vreJQQUI3UFojgFDmtsBImP1VfX/mzeWQdeEQLIZ29Gj3j8WX
         RzhX4z6JH8e1TNQDFeMFpVsqSJrnKsX5Bs/BOjEoermhORB3jgdQYRB75L6SeBBRZAmg
         jmdUQ5lBUWdcPjXcyVVEbAhgmKRt6DMJmjZrdjz6CeytgmL8pge5jYOgkO7cteQIdY3f
         xpe357kitTm1J+TwbwhRdWRdL8M6+IdzeL+pIJOIvocuYxmXr+pLSqTrdLrguUzvcYgY
         SLILgJgaxCg5lc2iRoCSyST/ePQmITlgXlwCvj/unNrwFqgf/ZNIuz+y2dF4IFKwq7S3
         TGBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAbSi9Oot1HUbKZH/bvDROZAIH6DtiBu7mLVE4Jqk7g0VTdaXWUipiOjyxoSx3YI4ZuIrpIMM/5xySOUHulIIO@lists.infradead.org
X-Gm-Message-State: AOJu0YxKiUH+bm83Ok2R/y8KPJRs2l7XrZtY/nZe/JUT7NfngfGy5m+1
	UwuJ7kjYdTYSk8ObKei6Ts+7MShRjOqTzOW1YWDCGkVioSIKuhVlD/wm0TiL6k0vsX6Is3MM+nu
	5wC3530SGr/s/r4CFSxi1+VHZThDTTWw=
X-Gm-Gg: ATEYQzyhWO/Cy9sTXYToVVfzv5rf8fJhyQD0JGhAqe/jDFHGfcshcEQTQpIhDVvv4vK
	t3M60s2beDxONLlG+cBuAR4uWV1XnUgzFn5XHskWg9WLeQd6wphfAVP9g0ilPPaF2G7vwARuXc9
	WhPD8ICYgHx4Jd1Sd/75caoXGtGGy6ZIbQDTMo77unP586xX6H+G6+skqjenQoP6tgOSWq9moZy
	HbUjW57YmepQQYceN6ddFrRVEEwJ8TSw0yk23K4ecrM/pnJW6+evl9C5UiIRzS92XnZ2Mbb9Mvq
	PmT9h+iYP0bDPj6GZnzsXzCM3I4hyY+9AaqvQPVC
X-Received: by 2002:a17:903:2b0b:b0:2ae:5a44:ea73 with SMTP id
 d9443c01a7336-2ae5a44ff28mr9115965ad.30.1772452833138; Mon, 02 Mar 2026
 04:00:33 -0800 (PST)
MIME-Version: 1.0
References: <20260228065840.702651-5-nick@khadas.com> <202603010009.VfPuPoeI-lkp@intel.com>
In-Reply-To: <202603010009.VfPuPoeI-lkp@intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Mar 2026 13:00:22 +0100
X-Gm-Features: AaiRm506ikB27OOPsiZaHy57remzQl6Z49Wi7FBnTFU4vfPVcSRrRPvLCZYsf3Y
Message-ID: <CAFBinCDBR=cgQjhv9VxYLFAmTp2p+Fm_mWCZ5o5P_SA=Rb0R+A@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 add Function key support
To: kernel test robot <lkp@intel.com>
Cc: Nick Xie <nick@khadas.com>, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, krzk+dt@kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-iio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xieqinick@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_040034_270315_A758E63D 
X-CRM114-Status: GOOD (  15.43  )
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

On Sat, Feb 28, 2026 at 5:16=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Nick,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on jic23-iio/togreg]
> [also build test ERROR on robh/for-next linus/master v7.0-rc1 next-202602=
27]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Xie/dt-bindin=
gs-iio-adc-amlogic-meson-saradc-add-S4-compatible/20260228-150346
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git tog=
reg
> patch link:    https://lore.kernel.org/r/20260228065840.702651-5-nick%40k=
hadas.com
> patch subject: [PATCH v1 4/4] arm64: dts: amlogic: meson-s4-s905y4-khadas=
-vim1s: add Function key support
> config: arm64-randconfig-001-20260228 (https://download.01.org/0day-ci/ar=
chive/20260301/202603010009.VfPuPoeI-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9=
a109fbb6e184ec9bcce10615949f598f4c974a9)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260301/202603010009.VfPuPoeI-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603010009.VfPuPoeI-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    Lexical error: arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1=
s.dts:50.18-24 Unexpected 'KEY_FN'
> >> FATAL ERROR: Syntax error parsing input tree
It turns out that this series is supposed to be applied on top of
"arm64: dts: amlogic: meson-s4-khadas-vim1s: enable LEDs, Keys and
Bluetooth" [0]
When applying this series on top of the other then there's no more build er=
ror.


[0] https://lore.kernel.org/linux-amlogic/20260228063750.701887-1-nick@khad=
as.com/T/#m2f4d30878fc8252f853bdb3005042c3aad97961e

