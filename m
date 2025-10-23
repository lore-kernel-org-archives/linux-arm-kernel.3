Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747E9CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjHHHhlIwMyUNtV6qNO7lwTmbrTzq58N0AEeJA3rSmU=; b=tATxGCyP70RiTTeNjHPGCg/wkl
	3cqph0/rlYHg10La1agkiBErhrffUDoiMtP08248MzvM8Isn6IBS79Vh5ePet9wupIBusqZcyCV6i
	xehALdVyHXFHLCwCHAu6e2gnb7xhauGYuIZdrgA2SxhKv8f8YoXe1ZwP2EA24AG9vRyPPOoCE9lon
	BzInznj4tJd0nWEblciPicQMGFtzwjQtvjKkekJ2DHEXEvi9STKA/IIf6I6dZfMM78B8s6l2f44PN
	mStt9TKDmh5CpG7fwEPFB8lArldQu/6bSmYJMXOyrQI3ltd5LOSr4ymzfJ0rF++KBVF2ZtbNmwa+z
	wa+bL8GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBv8t-00000006KMV-1Y2i;
	Thu, 23 Oct 2025 13:14:11 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBv8p-00000006KKp-3Tlz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:14:10 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-373a56498b9so24652531fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 06:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761225245; x=1761830045; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjHHHhlIwMyUNtV6qNO7lwTmbrTzq58N0AEeJA3rSmU=;
        b=jwl7aQyros7RQSWLziQRi16Dp2HjjWIHEDiaHYntn4QL+3/eGneHddTSnchRC/JFfI
         GmiR9sqgGRXzY+GQJmbvtgED5nlD9CxgZHRLAZplkQVb7pOIC4VnhHLp+WUySGjYJeAE
         vThBySamZIjeKlFmw3W3y+CgjUz6ym5R1nPANqOzBFh3q0G1MCMuShXTKeku3Vm/tYjZ
         ysq5Jh81wQFYzAQjtbFA670JyKOZbyX2rbX417xd+vf0x5aBmvAfxL4p/byfNH1vD2km
         JZ0jQkNEvfodvMvgABrbvytU/M2C7w7nwONr8EwLHBVAaksKCBiuuxs7kIfGWmUWvQIK
         F5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761225245; x=1761830045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjHHHhlIwMyUNtV6qNO7lwTmbrTzq58N0AEeJA3rSmU=;
        b=pI4o1wtfoHiR/6K95He3w6yxl5aR430UmhrlNEu95KexdmWd0EYaSLCvbvcLOv12ZR
         6EaSG4duozbYB8jteh6bm7TMFdjSTEdGCFG0S2BxAyEEPYh/SKREFXEBWvzk7UDTz26a
         qnRb5Mk8QJiiEs0zK35Meq0xupFkMGHMMj9kYJIpPEmEDo9URMOq1woAxOoN7SgzVJCc
         R25SmgVvJriq8Cry0vZuIEqT6dv7Z+u1nH5nIqLA7fzfbCOYXSwW/XwzmSj+yK5H9Gbx
         QQ2xUflQsQ8pbTgyy2zUWz0c1FVOldJoVbiXLO5jgjmombO5/9O7023lyHgegwfWaiLG
         9HHw==
X-Forwarded-Encrypted: i=1; AJvYcCW8Y09lRIc9I9Z/OiXmR5JayNTSu9/pMZMNZkclgEhXJKYBmZ1nTmGpdTCl6RfA9vGuVU3pXLyMjwU3i7D1ufMF@lists.infradead.org
X-Gm-Message-State: AOJu0YxnhiBd9beLqWOXqEbMqm94tB2adazzZgpmyE24MbCtHuwG8XDa
	6LEAw4k918cV+zmONLEjXZw+TT6VnjG5z8C7OCxI7P+grgmRy3jRadSlS8NoeaAllPuT413L5WC
	J+CA+Rie8c9VTqEMNY9E46S1hzaelkNpCu2/WP5/sWA==
X-Gm-Gg: ASbGncuZa8AHoSHXDnGqAQMbkoOLsllEIo74UqsGCEYaVBRvtZs5oLMqVWvB1gcxWT0
	wY2TcGvVMnesZZykE9aDwYmvwyNMCoxn6Z4LOgImjGGzCuNc77WRUUjRqQdoYtp5s/dEsvV/dKX
	mFa0fIIA42ixGWLY1ogoms5Uh+u2wDU9qQnobHA5hzlccAkbrS4Hw7VdrTPa1kMb5GL2pUBr79q
	4mBdWnsnD9DilHExKt9Zd+AcTcVIZXwgqg24nrk7QlbH/udG073tU4S/3fn
X-Google-Smtp-Source: AGHT+IG6Lx7X4nwjjCbscanhtEBxXyR+h33EgNAu+2QCvEvhHwb326NmDGLUdbF/Vt5osp1coGpMRs1m4S+7/7joI7g=
X-Received: by 2002:a2e:be03:0:b0:377:d151:c090 with SMTP id
 38308e7fff4ca-378cf8633c5mr16810071fa.1.1761225245249; Thu, 23 Oct 2025
 06:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Oct 2025 15:13:53 +0200
X-Gm-Features: AS18NWDfHk0wnb9yCffDQKbucYaZNvR_wj0zVimsSTgrxikTdx8n5aED-luAQ8o
Message-ID: <CACRpkdZnmMHMWihudwYYuzCm9H_jN_0ZU5+mmS5G4R5m9XkV=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: toshiba,visconti: Fix number of
 items in groups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Punit Agrawal <punit1.agrawal@toshiba.co.jp>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_061407_876339_15EC9125 
X-CRM114-Status: UNSURE (   9.73  )
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

On Wed, Oct 22, 2025 at 3:34=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The "groups" property can hold multiple entries (e.g.
> toshiba/tmpv7708-rm-mbrc.dts file), so allow that by dropping incorrect
> type (pinmux-node.yaml schema already defines that as string-array) and
> adding constraints for items.  This fixes dtbs_check warnings like:
>
>   toshiba/tmpv7708-rm-mbrc.dtb: pinctrl@24190000 (toshiba,tmpv7708-pinctr=
l):
>     pwm-pins:groups: ['pwm0_gpio16_grp', 'pwm1_gpio17_grp', 'pwm2_gpio18_=
grp', 'pwm3_gpio19_grp'] is too long
>
> Fixes: 1825c1fe0057 ("pinctrl: Add DT bindings for Toshiba Visconti TMPV7=
700 SoC")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied for fixes.

Yours,
Linus Walleij

