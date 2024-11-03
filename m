Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5FEE67819
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 02:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ts5mJgx2UPMaUYQQ1cD8EkIgBpOKjbKDuYhTB6/VNzM=; b=evm84zR17lCAdV
	OLi6cX109knvtlk63Ig6JZonlB8e7gX+LbJE+OWOw7ULF58hxVBhZ6gPPS74nvwkL48KRdWsneRh1
	f7jLvrIBsGsjlmsiv7cBRXuhLUv8T9eWPkVEGHFI09uFgWJpSCIYQARrG6mZfYPAYC0yyrI1RtS17
	4T55dslG0Uilw4x5jMQQSZj6fv2mgya2ZuuoRBiR81DSxSNy8E2WiDEFq7rPqdntcB6qLPPZ0e3/a
	qR9TVVFoUGe+v5xTRyGOre8f9QwgxZNLf/q2T4Ox4LrPot/QdbIdiirhlN70ru5TjCSeIOv3doRBw
	dScrXlC6tvxhAJj8yIZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7QnS-0000000Aq6W-1ym3;
	Sun, 03 Nov 2024 02:56:58 +0000
Received: from mail-lf1-f53.google.com ([209.85.167.53])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Qll-0000000Aq0c-3orA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 02:55:15 +0000
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539d9fffea1so3253573e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 19:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730602510; x=1731207310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ts5mJgx2UPMaUYQQ1cD8EkIgBpOKjbKDuYhTB6/VNzM=;
        b=Ug+HEA7gWprkjHvgz69r19XPVBA+kZv0bywoJA1RJkGN+5tAtI4n605wZ9rc7eGLCD
         nLipx8qC8BhYztXsUA/FkplmA1BpIRkSI9YEKQa7+zgKq1/R6/4Ezc134M/b9J5V1//v
         YVwoFIjzqQgze+kZ45e4w38mhMpoQdm284ksRtxYk1HsHuKgDRQ1F7BPwvv/5Ab1JknH
         Nc5F2w1Il6SEmgum4Sdp8R4KixRSu7v7F435S22PXqkyTao53z5igG7VkNmlqHDhOziW
         kDmhrQdKR6ZsgfcbNxCdfTq0xfWhjjD76Ntzj/m4OzlX3mSZmMaT3AQSueCB4YfXREWv
         N8lg==
X-Forwarded-Encrypted: i=1; AJvYcCX3H/i1yYE7ytCCrw1PWnqFNFEoJhHaxiJeuGj2uxpxWsG7rcTxx/3L7dDYoTjuoTclStviZuUscKncv3yvp2DK@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq+sInwRAyzLks0mM6SWCuAepnXISsGHXlSgHpDk1azXfCK94a
	RSOQDMLSv3L7e9ltHRx909Amtlb0CioZ7sRomHONhMP9vrOtjljnpRjX8mc+OZI=
X-Google-Smtp-Source: AGHT+IG2gUQT+4Wxy46j6F57zyz901JAFANJmc9EqRBQOAcj1RoOXsUHMw6FXrEgKWt6N5/5R9sERg==
X-Received: by 2002:a05:6512:b85:b0:539:e65a:8a71 with SMTP id 2adb3069b0e04-53b34a19501mr13416641e87.34.1730602509420;
        Sat, 02 Nov 2024 19:55:09 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcc2bdsm1122101e87.225.2024.11.02.19.55.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 19:55:08 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso28870211fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 19:55:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUev/ITaZgjAg2T/vWChWg14hd6i9gS0Bm1KZ52cp4lyMuKTg4XkASL3E7cEj0J1HZD7rOvlQPf5kkoUYk6NwBA@lists.infradead.org
X-Received: by 2002:a05:651c:1507:b0:2fb:5e64:327e with SMTP id
 38308e7fff4ca-2fcbe079c43mr115559201fa.33.1730602507670; Sat, 02 Nov 2024
 19:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-11-masterr3c0rd@epochal.quest> <CAGb2v66TAttAezXE7TnT5N6XFW2482ipuqkcpwjeDud6v=xD3w@mail.gmail.com>
 <36415ea50a5aa6cec8c5fb281af73f50@epochal.quest>
In-Reply-To: <36415ea50a5aa6cec8c5fb281af73f50@epochal.quest>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 3 Nov 2024 10:54:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v67RHjq=5DMiP8YtvOww5B8qJxCqF9ofGTXPUkmP-5herA@mail.gmail.com>
Message-ID: <CAGb2v67RHjq=5DMiP8YtvOww5B8qJxCqF9ofGTXPUkmP-5herA@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] arm64: dts: allwinner: a100: perf1: Add eMMC and
 MMC node
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Yangtao Li <tiny.windzz@gmail.com>, Parthiban <parthiban@linumiz.com>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_195513_972857_F657CC3A 
X-CRM114-Status: GOOD (  16.66  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Nov 3, 2024 at 5:23=E2=80=AFAM Cody Eksal <masterr3c0rd@epochal.que=
st> wrote:
>
> On 2024/11/02 8:48 am, Chen-Yu Tsai wrote:
> > On Thu, Oct 31, 2024 at 3:03=E2=80=AFPM Cody Eksal <masterr3c0rd@epocha=
l.quest> wrote:
> >>
> >> From: Yangtao Li <frank@allwinnertech.com>
> >>
> >> A100 perf1 hava MicroSD slot and on-board eMMC module, add support for=
 them.
> >>
> >> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> >> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> >
> > So I skipped this one since Andre had some questions about the previous
> > mmc clock patch. And I believe this one won't work without it?
> eMMC (mmc2) works fine after more testing, even without the clock
> reparenting patch (in fact, it appears to work more consistently), but
> mmc0 and mmc1 require more testing and debugging. I'll deal with
> the remaining MMC issues in a future patch.

I think it would be better if only the eMMC was enabled. Enabling something
that is almost guaranteed to cause data corruption isn't going to be fun
for users.

ChenYu

