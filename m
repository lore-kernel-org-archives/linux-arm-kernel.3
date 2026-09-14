Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCD7C88E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeRItUB0SKWeM7RCyFdOuICI6kxktnCIuLCLXkG9px4=; b=pqUq105jsZ33zja+2VPNeYoyOu
	GiMD9u7LbUn+smSL70aJl5j7jMl9WOXbHjONRz2LZFys4I/pwxj80sn02MYPMUD76wAe+EokASwfl
	9E/80kfkcMrRpBHVEcynGUfvOlcKroQ9M4+mqOLBSFNibv05SeR3uF1UOyKLoiIKMsINIIE3Vz1v6
	dZFpcDBFD87c2uuLDVn3yA25MTn6rSfLK1O/rnav7GgdipQHpZ2uLE7AhcKJZTG6G5smNm18QMDLu
	RjpULUcLUetzAL3Ku5QTvYqENuR5CEJNm/7a7b6AnDsj5ubwvkKoOqY9pzfw8TArRO0WorJMJxTkx
	ee82XDGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65f3-00000003WJz-3Vav;
	Mon, 14 Sep 2026 12:19:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65f3-00000003WJ5-0L9X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:19:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D32C343959
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 12:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B259C1F008A0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 12:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789388388;
	bh=eeRItUB0SKWeM7RCyFdOuICI6kxktnCIuLCLXkG9px4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f++EZOngV+KQ6P8a4fRPKZ8M8KorE38aO7zH6dh9ssZka8v4xc7QMeqQD0UGv7Yns
	 bqH7r4SEO7dXwTX1E5hKqLa/FRBVBpTwMR001g+C2r3AolFdMzVuBfBxdXPcTC4peM
	 V/IXS6xRPGX2C3vhYT8k5jDxCF4COFh2jNH0rEJ0VrkjTIowhft+IlZ6AJAgygBdgP
	 01tr2biAyGu6iKRhTSIiR+IKQ5Le7CdPjQFU4APduR371c1QJqu8jkLebbvwyitMXA
	 0pTgqnDHOIifXdLoCA9JHWaHaQBZy+4ztIhLXMbrNhb+lW2Ly8vhn5HHgfosN2sBmd
	 sk+7KRKrlRvjw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a4a82aa383so24024271fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 05:19:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzp2BznYMjlBpLEUD62h691TCcIV1qIEe+B7TJNHJniW+1geQBGImiLe2ZAuLdi72GF7aYrJcx1/5MJHpCNdebT@lists.infradead.org
X-Gm-Message-State: AFuF++n5mpC98VpRkEBI+PABCVPYI4B+mQP3Rfwj39Hot2TqbYgEWsQC
	Ym+DXMh/u8znk6xPH7EgX2zuex59b4WQDUrw/ovGWtL/xRzjHPV2bIEAhZ+uZkpbDkT4orCwjrr
	FJdEui+tv/NWi9W3arsQltOV8GuDiiXY=
X-Received: by 2002:a05:6512:3d8d:b0:5ae:ba8f:f9fa with SMTP id
 2adb3069b0e04-5b8ae6899c5mr576202e87.18.1789388387340; Mon, 14 Sep 2026
 05:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260903-i2c-fault-reporting-v2-0-fedeb91792e6@mobileye.com> <20260903-i2c-fault-reporting-v2-2-fedeb91792e6@mobileye.com>
In-Reply-To: <20260903-i2c-fault-reporting-v2-2-fedeb91792e6@mobileye.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 14:19:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLk1HGeROeeofBb61BP-sYSimOmMeAYQOp8HqV5cD1Bkjg@mail.gmail.com>
X-Gm-Features: AcwNN1XsXRmmAsjKAUdlCFQTuHSxsVr6HzbI570jO09tnVrZgTvieadHZeOTTSE
Message-ID: <CAD++jLk1HGeROeeofBb61BP-sYSimOmMeAYQOp8HqV5cD1Bkjg@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] i2c: nomadik: optimize struct layout, change
 unsigned char into u8
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Sep 3, 2026 at 7:38=E2=80=AFAM Dmitry Guzman <Dmitry.Guzman@mobiley=
e.com> wrote:

> Change type of `tft` and `rft` fields of `nmk_i2c_dev` structure from
> `unsigned char` to `u8` and `buffer` field of `i2c_nmk_client` structure
> from `unsigned char *` to `u8 *`.
>
> Put two bool variables `xfer_done` and `has_32b_bus` and two u8 variables
> `tft` and `rft` together in order to reduce struct size wasted for paddin=
g.
>
> Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

