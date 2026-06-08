Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21116CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVNzA+YimPCo/s+zQoYkCPo7qeLSIJKww/AqXzNRCrY=; b=PHOVfnK/7T+RrPnAlzV2of1Xa/
	E7OwwukvIX+ywj+4mgklMkTQR0ZxPqzSglxKdNL2BWawD44BawyM96q4tdx4yBQSxLzJwTDa/FmP+
	AtOPYlbB/+JfsGP0Z9KaL75TlvgpbPW9nt+8IOakpByAVi2jQ177phjyP8wAb2uRKwbwVpDxk+2+5
	ihS0HUvDc7v8NO4uq5XOA9s/XbsjCi4jIbk0QI/8ztNNQAqu8dvhpYqG+5KE352TMraFF1QUtxOTC
	8De7Sbf3+andhOOSzaGR4IAfObnpFhGd4PCXSaWfGUCnwjzAiVSD9BOIuVcmMYM528+qDhgzG2E3M
	WggywARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbIp-00000003rdb-08cs;
	Mon, 08 Jun 2026 14:50:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbIo-00000003rd8-0M9h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:50:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 843E4601E2
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 14:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C441F0089E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 14:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930209;
	bh=mVNzA+YimPCo/s+zQoYkCPo7qeLSIJKww/AqXzNRCrY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=TrIIizPtQOgkzaa+GxeDtKPfW60MyqU1ONtrYnymBFbmmpCZtxUqUup3bzaQQPPKd
	 tAj/+o7ldAPervKxCXljVrSNnnVq7o0KTup4xhChoOaINKNyD+eKPTM/73A66/a8gr
	 p76HRluvfS4WZKRcD6BcKNG/LDsXY7yAY+O7YHqa2Q5Jf/t5tBZUteik/pdG+I79+5
	 TE+eOQUzAS5FG5c6GzIkcSrNLaTUVA2ev8ohezUqB/vrIj1AxPPmPJBtJ9IAnXkhOk
	 6b0KOI24YGpsR965rKKvWQ9ja6OAaeyRFZj3GCncGEv1va69MPELTNerCcSxvgLzcG
	 68umfE9R3kV9A==
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1363fe80fe8so6238067c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/4yD5nS0U50HT5QVgKSnMiatwFYLi3lTYBfWY4pxXzrrzg1j1f8C96QcziNYuNnwnGA9khQeS2kx1DoWC1pKwY@lists.infradead.org
X-Gm-Message-State: AOJu0YwXSKHLQmakr5vQfvrIuehQOSyUXkrUxHSi9yuraPDDS6TCuCTM
	4VLQG2FOYyEh7zVmU3hWAj5sGBeTXBh3npFzYgQOTV8EhPj5pXdCwcJmGERlqRvKCWYta/EzBzO
	9ejQCe/jWkPWkkMBP1YehTYtAVmQAUsR/7jQcSdR4eA==
X-Received: by 2002:a05:7022:219:b0:138:144d:35a9 with SMTP id
 a92af1059eb24-138144d3684mr5766531c88.13.1780930208569; Mon, 08 Jun 2026
 07:50:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:50:05 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:50:04 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-4-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-4-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 09:50:04 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfdwrgHU-uQ=23SOth0W69pEnWOBZNADW5V1TZehDrggw@mail.gmail.com>
X-Gm-Features: AVVi8CfLdQbnTOwyGCfZAp__4hziGPZ_SRIyQWjmiKLBoe_O8lP48fbaszTAsbQ
Message-ID: <CAMRc=MfdwrgHU-uQ=23SOth0W69pEnWOBZNADW5V1TZehDrggw@mail.gmail.com>
Subject: Re: [PATCH 03/18] pinctrl: airoha: an7581: fix misprint in gpio19 pinconf
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 7 Jun 2026 02:16:39 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> Pin 32 (gpio19) duplicate pinconf settings of pin 31. Fix it using
> a proper bit number in the configuration register.
>
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

I think the term we typically use is "typo" but I won't die on that hill.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

