Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B33D1D865
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 05:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNDnKlHp/ZUbhmRkZfp5DLTg2xmo1qEY2RoZ68xLETE=; b=HrbLTEGmzYkSW7JPy5q5FOIa5C
	63+KXRFLd0cQG9wIcchRB5KTipxAsS4TeR1EIkRUzKtLxl+IIsrkAebNSkeLY06NWJByYsVfLnAeB
	9ses+kBkK70Jfj3CfkXahAV8U4KqT91AeTLEiJVZ3f48FMe4fPkl4NpA9FzRNBg69Y9BeFvAiZpYC
	8oeIMTggqMlAfU+xs3ii+5K16KAK2Q4rClfVn+/G8qdt2htg4rUZ8m9ElbUJEz70fY7/NVzmlLCZe
	TN4qy2V/ZGPnynlnv4OCBiNGRtfUj9O6eUNTrsFGWI9uXFArT4j1SUUGTt2DQE5OuJCJyHCsBUbdd
	L5nRh8Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1jL-00000007UZU-0rGd;
	Thu, 04 Dec 2025 05:18:15 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1jJ-00000007UYd-06U0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 05:18:14 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-3f0d1a39cabso335705fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 21:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764825491; x=1765430291; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNDnKlHp/ZUbhmRkZfp5DLTg2xmo1qEY2RoZ68xLETE=;
        b=FO8856yWyLeUNFsYGdDwHbBQHDSqBlhHaTdF2+RPMlicGChhr7EvAc3FNf8i5l4Y6n
         kqYf80qI3R428f5nsZwbqL02eoIYrzLFKroJuWM1Nnh4Jq6lVXG2bducaHt0836jONaM
         /KokNzIrzpwe+wTa/Jb6loZOeWl8u8gj2NQgll6XaYNXV/Pv/P29DymWr56gZt6PudD0
         9IUBQrKDHCtmLbjFek+0sIoQF8stP+XBaA8JUNmrJpUb5s5ZtmhPr/ghrmKely4SASox
         35/KQLl3fZYQ3MhnYBnnGAKvi5Yqrkj4yuFg5DFV9hXU1oQsUuyU6Tu5HHISYK1uvbX7
         nOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764825491; x=1765430291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iNDnKlHp/ZUbhmRkZfp5DLTg2xmo1qEY2RoZ68xLETE=;
        b=YFs/5WgH3FUmswWGkKR0TdZ4DzukF0tcpvaB2xyCg5Z/UQR4FRhN15R0JzJvMAxVTn
         p/wMSR+aspO0Gz00kmkBpZcfTb49tDVrYfOxK+6vfWQMMwVsJjo+vshkTautwJeH+vIk
         tgC65s0ay3tPuovFAvHdYMd4RJb1JoAAAhWYISHKivBWov90lYBKtEqjPtGsPDmXr+el
         iFVrNMT8Yl2X15oKYnUBOnw+oMc6i4zF9kDo3g8VUukFBdFh4r2gtrUya7cErCIzUuro
         2EpPE//WoutplsEVag6eKxh56M6Uc1xeNTMHfclI1JoinIHoUaxDhK+VHiC3/1fnuouy
         DpDA==
X-Forwarded-Encrypted: i=1; AJvYcCX96ccmiNswdkl9+kevhMIBOuJ0Z/IeaAEdWAq5J+alr28/EqLwsFgrBDZOX9kmtE0FZi1J/wYmEXaOoZuQy9jV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd/CwzHv9WNZIEUVTLLo+WOKjRV+h2aF1qBmQlDN+UIvEs8RGN
	3c2ebMv8oiseM78v3VM8CbWoLibyqPYBP0eYGGUAri9E5wuUufRrEHR+1AjtjfcdZWvQIBwiCMo
	9Os/45Q8mxB47mZbt8alwBFiT7I6VsIV8sjjqgkhZQw==
X-Gm-Gg: ASbGncttm5QBUxlcc7btPF8nSk4/O+M7PlJM2PNX+f1wc3jTTb5RvwXm/DYGksW0Pfa
	WBDbEp6897Im3Z4rA2ZhtioMzAjj7naG+zw86Z30cjI0laQOIJRxBzBEg/c4pdPR5jt4/MavcET
	9TJdO19TLB7s2Vv5aHrDxVmTYP0rYuxUuI9BYmctEysT7X9nffH9loN1C7X5rQFViLOUOs+Zjo5
	9KT7NeEHQuEsBYYbp82XSGbr8qztUwIKvjBh5OJYLE7KE2LvgpN7MeKCiHmaFoArP9Kwky+RhBn
	tQ==
X-Google-Smtp-Source: AGHT+IE6Uo+mUT5GOvC/ChjVWxuELDhLbIjvw8L0mngRXN/XyCudJ4rOSwMT4tx1Bd5AVcgCYi5RjboTifVzzdPFKpI=
X-Received: by 2002:a05:6808:4fd4:b0:450:ccc6:4113 with SMTP id
 5614622812f47-45379e76627mr949636b6e.52.1764825491585; Wed, 03 Dec 2025
 21:18:11 -0800 (PST)
MIME-Version: 1.0
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
 <20251127125305.89961-9-cuiyunhui@bytedance.com> <DEP50CD8K22E.1JW7GL6WLK44W@ventanamicro.com>
In-Reply-To: <DEP50CD8K22E.1JW7GL6WLK44W@ventanamicro.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 4 Dec 2025 13:18:00 +0800
X-Gm-Features: AWmQ_bkci0NzLiA0LVBzrZMqySYI1Agon6sfMnpqxOwRNPLLk4lieoHNTIjoqIo
Message-ID: <CAEEQ3wkmFXAqBfHwJYbJRc5pagOJvtu-wEYGwXBF2beQiSMT1w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 8/8] drivers: firmware: riscv: add
 unknown nmi support
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: conor@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, luxu.kernel@bytedance.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	jassisinghbrar@gmail.com, conor.dooley@microchip.com, 
	valentina.fernandezalanis@microchip.com, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, timothy.hayes@arm.com, lpieralisi@kernel.org, 
	arnd@arndb.de, kees@kernel.org, tglx@linutronix.de, viresh.kumar@linaro.org, 
	boqun.feng@gmail.com, linux-arm-kernel@lists.infradead.org, 
	cleger@rivosinc.com, atishp@rivosinc.com, ajones@ventanamicro.com, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_211813_092345_2DAC757F 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

Hi Radim,

On Thu, Dec 4, 2025 at 12:11=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcma=
r@ventanamicro.com> wrote:
>
> 2025-11-27T20:53:05+08:00, Yunhui Cui <cuiyunhui@bytedance.com>:
> > Register unknown_nmi_handler() as the handler for the UNKNOWN_NMI
> > event. When the system becomes unresponsive, unknown_nmi_handler()
> > can be manually triggered, which in turn invokes nmi_panic() to
> > collect vmcore for root cause analysis.
>
> Is UNKNOWN_NMI what we expect the watchdog to send?

For reference: As stated in
https://github.com/riscv-non-isa/riscv-sbi-doc/pull/223, "Generally,
an external interrupt is used as an Unknown NMI pin, and an Unknown
NMI event is sent to the SBI firmware by triggering this pin. Then the
SBI firmware will send SBI_SSE_EVENT_GLOBAL_UNKNOWN_NMI to the
kernel."

When the Linux system is unresponsive, we can manually trigger it via
BMC (ipmitool).

>
> Thanks.

Thanks,
Yunhui

