Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A311FFB44BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 06:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaYxt9AMLkeN9IM6ftUBSYmqelQZmEG9oCJlezeiK0w=; b=xLYxWgtvicyMBUH6PxIL1F6aqI
	PMjO1ULBVXUtk+Qwd3/kZ3j7qclki9JJhPQb+hyrHSmvcgqUzZgDKnRTT2pnx5VRQxaiqDoDdn0XL
	RaWHq6ysrd+bR4ucxPp9szmiWsqAs6bDbBVlLriVNBpGzO7WCskMesKt48DwO2f+fUYFGBCVY4r6e
	BLtpAjPoDr/YxjMs0bHrHQOBWq3ksxaBP4ZeOnufIs2iK4kejCxFb13JJBZgvMNrV8Z7gA4CDB20M
	Gyeor80ti+GOK62Uhu3G4NlE2PZmyt4T9cjHaDJI2I5H6A6qXI64f1glVkefqIDvY9sq45JSKHrFK
	rY/u/WkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAV9-0000000Cl5T-1wJr;
	Fri, 24 Apr 2026 06:58:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAV6-0000000Cl4g-2fXF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 06:58:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FDC0440E4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AECC4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013936;
	bh=iaYxt9AMLkeN9IM6ftUBSYmqelQZmEG9oCJlezeiK0w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KD1cH/wVRAkhxpKyIgGwnVwNKO9vS8algf9lCpvMZ3LD/7nBABa++dWRLhEjBBgek
	 fLzD4JgFrJadUBppjNykTLoHN35FXEaH6n4NXnYMv3ZndzGR1axbdsR+hnorJ3Oc/V
	 Tc4Q9iocyGxz3PM3yYtcRGmlrm1oaJ46wycrmIES0GbSBHGIWGXokhrfc65IRlEgrI
	 7Ble80djXX8hX7YVoNsbk/Tn5uN+M656P8PgHvGMyumKh+o/25Rgon+yv/0C8BhKZu
	 WZcjTp4QqNrIS33YAt6yKdLX3cc4r4NVrpjnx+vUOP5/ldUIGFnqdsLzwOGiyO5Hs+
	 UUwvvec2eST/Q==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso7408980e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 23:58:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8geMNOOVkMJsaT8Omh4squ2IaAUHNYokj6LNLI+8t80xAw5keyuQwU76QQStzvUjn6Yph0VQs+RxPyF1iZdGir@lists.infradead.org
X-Gm-Message-State: AOJu0YxPiXLGXHvVCw7xD8CtmGZlIZ6KUXt3xvgMu0xvsQZrO5o5FY+d
	10IyuYivp2bsGqaI7PRA/8ZsIjDkM/xWdtiNNCslsXfaQ6s54NzDqKphSByrlrALp4fJUJ5Zsy5
	r9TPiQA/xnT/uxeYj2Y3UuPF9v3t5wVo=
X-Received: by 2002:a05:6512:138c:b0:5a4:6a5:9910 with SMTP id
 2adb3069b0e04-5a4172dc698mr11347475e87.23.1777013934905; Thu, 23 Apr 2026
 23:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
 <20260412-b4-defconfig-multi-v7-v1-3-e76de035c2df@oss.qualcomm.com>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-3-e76de035c2df@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:58:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLm1s4FWZ+zoKs-UkEhKgMEFVOTgAJrrbhjuTTZkPBUsVw@mail.gmail.com>
X-Gm-Features: AQROBzBE7No9DY5SvJhFb2KBRmdi1-NdT3J1fO5lkzFDj3-nX3LtfUFmilbfCTY
Message-ID: <CAD++jLm1s4FWZ+zoKs-UkEhKgMEFVOTgAJrrbhjuTTZkPBUsVw@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: configs: Drop redundant SND_ATMEL_SOC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_235856_695147_06539B9F 
X-CRM114-Status: UNSURE (   8.31  )
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

On Sun, Apr 12, 2026 at 7:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> CONFIG_SND_ATMEL_SOC is gone since commit 4f30f84feb77 ("ASoC: atmel:
> Standardize ASoC menu") and can be simply dropped without effect.
>
> No impact on include/generated/autoconf.h.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

