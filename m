Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F402C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CX0cKuWIN/izcmRShlftpFObnQaAOxE9smmXy7S4rN8=; b=Etd63xKYjsVM+F
	OgbNeRLvKPF6cPYEqwyf+amsgDLuR62UYv5WCbKjGY7+JGModfo7KTnFQ2qYDIhM9UaJW8tenLVAk
	4UEIO0Gcx/BoAAwhHGhqWASIZY6qJIFff/vBNfCescIjKPZpsacaDBwGJCjiZL05g0qagejBI+HiP
	8+eY7hv5bvlAzKkI0/fwO2J3UieQW5LwSIqSCN1EM3GmVTIPN0LLOLUICmu919rKikpbemAhW1F52
	nRgA5h2LLLmrH4GAswH0DfkV1dgtqwujJMjn17a/zS0jbyAlBzu0I7Zve5tnppCqTBQzZk+nm0PBj
	VzsWkJkHykEy3DJZEc2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2uj-0000000514G-1o35;
	Mon, 17 Feb 2025 15:20:05 +0000
Received: from mail-lf1-f49.google.com ([209.85.167.49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2mo-00000004zts-0oBQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:11:55 +0000
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so4478404e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 07:11:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739805110; x=1740409910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CX0cKuWIN/izcmRShlftpFObnQaAOxE9smmXy7S4rN8=;
        b=Ye/Vqn8c1bfJnwK8lUILvFiJ7A9JUaa9OqGByvVzckISqmaSVx0M+lAKfgpNpt7Bu3
         ZGvBFvbIMJJ9n+ix6TFGDNFvcmh+HhNpDvMGXA0tBg2Axiwcg3CMEfXcunzlSsshAaBK
         9wi1bCjA8SCcj8xpJjupmlBRCjLukArH9D0rZXFdIvqBbO7JtQRlIo1Uu5pOTmAeebRX
         VyHRwBcIyoOrk2+qzFN4CF4S8fO0hh51QeplTaWh9px7w154BU6LdZAoZx4HQbrVKiRP
         rHhWghPhv6OBkxI+1c30NSsVZMbElMPiO8PuSeZJ7De7qpkuBduBkpbpR8hks/LFzKC6
         9FSw==
X-Forwarded-Encrypted: i=1; AJvYcCX03QG2BQVbokBFhKMAB9x8mJ6TgZH1RI2O8SgTv1oHjGNxGe4hs7Fm9PDBW+RfDZpxl3RQ4hARQ52H7oz87gIV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf8hLEQRnruP3kxIcaeSrVpcgt56eUxEF6POV7fOg4ybNPSguj
	vNGLoip/OYX7QPY0saKtkXj3pe1lCL6z8v8AgD4AXUFBufT3rldWxwgevJGK
X-Gm-Gg: ASbGncsj/BOnBtToAKsaJ+OnzAe0t991JfVcImzFpoRpHSbJaZ4GJ7L63kdOaaHLHXx
	ANTsU+1PMDSkRIKSrXIbJClyMleZ9EvZdavq9nYMhOFQYxOZc1hmtGbXTsBmfaUzuCOq0hAqLYS
	s7iOPeAcDdSYxLVXnHN/xjU0znYV032gM4TsMz5NPIUDxFMPFN7m000j4E+nksW4IUlYKFHgAu3
	7hPc6POiUKyhmkzTRUJpKLeKjoI1cNc1rk1gR66sqXyi6WPOhWq9SWo0ruZtbHTc3PZn7CWeFeZ
	1Hze89tggye1J/rXAQfV14btTBLyB9q1mRwWwyTGp+sCB6xP
X-Google-Smtp-Source: AGHT+IG74bLhKlZqctRh0cx+lisoFHlFryydlPvsb99VYF2WOPMgU2P/5aEh7J3WE0FJfhLnYsaeBQ==
X-Received: by 2002:a05:6512:2809:b0:545:a2f:22b4 with SMTP id 2adb3069b0e04-5452fe82d23mr2268653e87.40.1739805109651;
        Mon, 17 Feb 2025 07:11:49 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5453035f233sm997606e87.215.2025.02.17.07.11.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 07:11:49 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30a29f4bd43so13223451fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 07:11:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVwpz49KmPL8S1d5m16gCWDO/qWB3w2yQWfKjeJM2cfL/fj2sDS9jQoOb2FGO9QRW1vnuIwIy81lq+ff1gdXCOO@lists.infradead.org
X-Received: by 2002:a2e:8757:0:b0:308:eb58:657d with SMTP id
 38308e7fff4ca-30927952830mr26737901fa.0.1739805108110; Mon, 17 Feb 2025
 07:11:48 -0800 (PST)
MIME-Version: 1.0
References: <20250214003734.14944-1-andre.przywara@arm.com> <20250214003734.14944-3-andre.przywara@arm.com>
In-Reply-To: <20250214003734.14944-3-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2025 23:11:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v66gSuv6egek05QfpRZNH=Rn-eZXxQ_GVfDWpJ-HuojX_w@mail.gmail.com>
X-Gm-Features: AWEUYZnwpP6pvAEUU7QbWQG6w8gtn-pOi6TW3aQOb0FOCh7uCxrlelNQmMUxnZU
Message-ID: <CAGb2v66gSuv6egek05QfpRZNH=Rn-eZXxQ_GVfDWpJ-HuojX_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] pinctrl: sunxi: increase number of GPIO bank regulators
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_071154_234004_E8533839 
X-CRM114-Status: GOOD (  11.57  )
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

On Fri, Feb 14, 2025 at 8:40=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> By design, the Allwinner pinctrl IP always supported up to 11 GPIO banks,
> though no SoC ever used more than 9 banks so far.
> The Allwinner A523 has pins in all 11 banks, which exceeds the number of
> per-bank regulators that we currently support, as this was set to 9.
>
> Increase the size of the array to hold up to 11 regulator structs, to
> support pins in bank J and K as well.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

