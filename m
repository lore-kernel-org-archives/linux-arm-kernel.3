Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F1ED42BBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 13:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdm8/Adv+5ZGDymXWImoKTuoeLBiyC6kmUm06DeTBBg=; b=5DdyG9I7+OnFUwL6cGuxOUI1oY
	EcPcyAnzbFXLvjufcluZdD0mJhvwb925+5SisuNff3MY6FqgezRSlPDr+zFtz2XlSEI9jZhgAXI4W
	gu6aHG5+aOpyRJaEKmYf/Lh4Xm7wBaH8vbWdJqUJrwafP8mXsZ877MoeH3Y6HN4mV7l8VU7pj+73H
	xvmk8vVCdsXPbs440HN1jrBiFFyMo30CvVzoE40x1kahBGFGDDaoxnJ3O5RdpMljKIfEnwB0qvpDC
	fMES78YIqL/WOgK+Guo7iOu4+LLzi/RAM5Hq8+RUfylu4lYLanT3pd7AU4kT+bqcDL9poney2EDnm
	APhkQG9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDQy-00000006ujb-3Fms;
	Wed, 13 Nov 2024 13:29:24 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDN7-00000006uDI-1nTy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 13:26:15 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so62643371fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 05:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731504323; x=1732109123; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdm8/Adv+5ZGDymXWImoKTuoeLBiyC6kmUm06DeTBBg=;
        b=jKVs68qxoKHi4TkDAVz9MMm5t1D9wxEjYzwmd2rSRizk/uvzWKbBFSq0NxvNTprwFG
         +nF7Lg1ZMy/Vdeum7Cfq9Mtun9RjFyYT3MtyrCJBOdwHQS+yRWYtHu+Bp8qtbJt26/YP
         22q+VzrwIchP7I+J6OM3mtIek0Rdy/Mnd446IK22g/s1edTRXkK3w32+TwmJGwfd4UH0
         zYDreZ6Lh/BUekmjEGrbO80Y913X8Xx/iCJaYTcz1rPnuz/xjTbPiGkwZVexnBJe4/70
         oqSXDc0Oi/6DC7cckw8SBUghLsAETcMau3hPDlztcRDb9mRMEYAsrEfAuqeUJtbf62SD
         WLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504323; x=1732109123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdm8/Adv+5ZGDymXWImoKTuoeLBiyC6kmUm06DeTBBg=;
        b=TrHNo0L8oG6WIgjYc6B/oaeXoGAXuVS07QBtneFOkORqkLWAEN4usSs2DVS1GaGTSP
         ziieeQfa9wIic9yLgVwD4q2FTKv0C0E6VOUCAxd1d1koTG8OUqT+2v7RacIG+nJyOiE4
         Nnyqm+BQGossUpNwSpXVUTVU0fmCko0l+FJGYhoyA/AnFdX7SagEgfOYfPcISy8le8XJ
         5/ON3Gxm278hvCo9irIc8Khoro+cgKw1jQcHHvuyeW/Fn32dBfTP3azIxjb11ke1Jp5l
         X9FBNGPXYhQOc+TDtfKBF6P/lAX4Pbq9S6mtfSxTvvs0f5jxUAG/VkwS4LDhoSgi6O+y
         HiRA==
X-Forwarded-Encrypted: i=1; AJvYcCXSaXj4UbtGrJd2SXhepm2LeuQGKzwPcd3G91oolqr9+Mk3CT7+c6bO0SGU83KU5eq63i+qMxRhJGI7oChbYMWG@lists.infradead.org
X-Gm-Message-State: AOJu0YypoARV/6w+u9NBNag5/tPVbdQwmZMGlH+FH8qrDe7qfEHkOE7B
	WuZR7gc+7Iwayz97hF6rZRcZblCJdYA99H6TIPT76lhC+lT920JUoqjE4pXdf2ER//UzoTAgV8c
	+mfKRyDFLsZz92mhQX5tOFNNeZVWeKxg/2pW3Ww==
X-Google-Smtp-Source: AGHT+IHX8+zHy2cRQuozOk3orjfKceKGL6x8ZLfWGh9apX7pumtVpc991puIgqUN2OLaLTkg6vBcgQb/2f4+fVGfe7I=
X-Received: by 2002:a2e:a90c:0:b0:2f3:f7cf:2f01 with SMTP id
 38308e7fff4ca-2ff4c674adamr15664021fa.41.1731504323148; Wed, 13 Nov 2024
 05:25:23 -0800 (PST)
MIME-Version: 1.0
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com> <20241111023412.3466161-5-ye.zhang@rock-chips.com>
In-Reply-To: <20241111023412.3466161-5-ye.zhang@rock-chips.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2024 14:25:11 +0100
Message-ID: <CACRpkdYSBTvMdQtJrLza2=--dz49Xz667h7p15P+5zVm5nji5g@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] gpio: rockchip: Set input direction when request irq
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: brgl@bgdev.pl, heiko@sntech.de, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, tao.huang@rock-chips.com, 
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_052525_472507_B7B79732 
X-CRM114-Status: UNSURE (   8.82  )
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

On Mon, Nov 11, 2024 at 3:34=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:

> Since the GPIO can only generate interrupts when its direction is set to
> input, it is set to input before requesting the interrupt resources.
>
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

