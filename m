Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDEAC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 11:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Tabw9Z4bIh3i478fwUir3sqjYhIhXJXxI7g2bFV4tk=; b=si9bUj8Uepr16p8fePzI0mqUeb
	Gv0T1KuZ7wfjU+tG3UidDMppTd39dIX6GKJ0LHK+Sis0xHEGBycp7z3/qDls4ISSLbR2jsnOpUen3
	6hLSE8Fo/YCo0ENgebah3+2ElIzGaZSq0zfWYurIAvNXyvkWtiscu2AVtILpeh5uCIsPOYWS/VdEW
	zhntRLRBPGLMv9r37gWhv/jO13wRLB4TiQxpptqqdljyYnXorlXriqvwBlMRHT3PwQWQhrNMBMwnt
	eYHs20HIgDC5bROGcq/RjdBrwPnCHxT5eyI3k/idnS9+u3VR6LV+ReY9kTYYjYGiUbh8vQJBVu+4V
	mGYWZt8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2pb-0000000Dw9g-0exr;
	Fri, 14 Mar 2025 11:03:59 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2TJ-0000000Dsoi-1Gk7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:40:58 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-549967c72bcso2202211e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 03:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741948855; x=1742553655; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Tabw9Z4bIh3i478fwUir3sqjYhIhXJXxI7g2bFV4tk=;
        b=mgGQoNNFMBSFlGX7zKJIai6Vz5TIGkC3+i39V+cPP5nWtf+h5g/dbwsMrxaP36sBmm
         WlLuNqnz2ORQNELlITIgNfsi316gpOZav4QECoTcTocmIhFSF0xdF8hPCg9F+vhdpyw7
         J8fklW6hTSL8dXXpfI5GTQWwgcpSTyBRtj/dNPa7r/BUJsQtREUMDvhMbNHK/VmvK64J
         IdJVo02dI6lrCBrvJ2hiZQpRF7rstnroq2Cwr0ZdPYEoCwK/4+S5kgqK5MRTWwoKPV0w
         sjcS60g3qbwhNvXVY2fnKxcIvj50g66l4SdOX+kd3dwFCeMsunrxJuzXe4YDouyz4ndr
         ogBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741948855; x=1742553655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Tabw9Z4bIh3i478fwUir3sqjYhIhXJXxI7g2bFV4tk=;
        b=DGkAjG4MmmnkMGZmGL/yBvT47yCPr3uBttpOgnpO4OeSzRSxvcyLM07MzNVj3uavw6
         zNzrIwrOq1kpCOdFExiUW4zrybPThcH5zkImRBMMjxPrbaOviRwUx38cyJ99ur06XPBP
         t6jpFO3MGZ8qh87jBq/fuvYwBHpLnIttS/vinyPzPEV4rOazRAzETBkM1k2TMjFHHd55
         uBnwHwm6O9IZL5opJ32DlZRS727FkeygtQ98CUt6hRGXv5Ff2N3Rd2tpAw8fHxbAkoTL
         7ebGz5EbQDCxxT4sf6uY8/VsTzVRPswhYwx2VKH2zmfXEHk2Zuf6keVI4pNsW52rZCVj
         W1cQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7E/v2aUEZ0i4zekRNTLyIQRCza5lW/p6XW2vDKYI7FLigMgw2xL9ERrPL3if2KNwv7qTMNf/aIL1uYwrIe5JK@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjv5ZffB8GqD0s6bc1Z0+5YFkSua76pxZuMkShOU70RwQ3KIMg
	0psp1j57whM6OVKHOGACm6v02EBldupciTUfSmtdtWSEqTFDPUF5w6f8xqAf9HWOwHWmYAgQ28K
	01+cEisdZcdzEjQzSmLidTBWw091Nc5rtKBE1Ng==
X-Gm-Gg: ASbGncvrmqcDTkfh5IXKwENr2p8ffabEXF5gbhL6Oz8FeKOlynuC5kOZRxUKysMpV2r
	r/htjxHxMZIPJz2Z+8i+dwtvxnGS1CxgzNxe3Hacv/J9ZpOHd0GYzQbUzNSqfk3yMCqL4g8oHXL
	1Px+4M/nPvSYR2Bqi+aM3FXno=
X-Google-Smtp-Source: AGHT+IGA8lu4+YUGRbMGDeqXVRC8S3Eh82gixaqk7ULSw2GQfS2l/K24FNsAjmYoMd/QI6TcqRWxeO06lBY+iwQoWKM=
X-Received: by 2002:a05:6512:b0d:b0:545:154:52b0 with SMTP id
 2adb3069b0e04-549c3911fdamr634456e87.22.1741948855425; Fri, 14 Mar 2025
 03:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org> <Z9CYEZloamPhVdBS@lore-desk>
In-Reply-To: <Z9CYEZloamPhVdBS@lore-desk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:40:43 +0100
X-Gm-Features: AQ5f1Jrsfi01k9a9ZZG_NbGUIuQtjx3Ff3ESsGiVH3198fMHG_n5Ix8wLorhDCk
Message-ID: <CACRpkdagLPe8Mt1imjeBhMuxn5rUMMgsF0KceQpGyQE9ECoJGg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add gpio-ranges property for EN7581 gpio controller
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_034057_340751_866572F8 
X-CRM114-Status: UNSURE (   8.64  )
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

On Tue, Mar 11, 2025 at 9:07=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:

> is it fine if this series goes via linux-mediatek tree?
> en7581_pinctrl node is only defined there for the moment.

I applied 1/2 to the pinctrl tree.

Take 2/2 through the mediatek tree.

It will all land nicely upstream and works in linux-next.

Yours,
Linus Walleij

