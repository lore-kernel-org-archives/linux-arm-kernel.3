Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D142EC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=; b=HKXMIoav7u9HzJ/gygu5ZUBjbJ
	zskNRMBtumLM/kNfiaUliGuw7v8Z7DgcAm3jYTi9ulQx4aKxVm3GZP76GFD54YKuN8xnwMFfAHuQR
	gpblMUTU88EVxab7ebCTiW7Zj3dnMXsfVz5uPfbqW4ji9kQXzYSq0YuKblZI2IsKA4NtgMFEvbQOQ
	bjOAW7pVw9H19Gg52wVpHP/7qWNVFvLCjXMbWqDEjoQyR6L7q3Tu+W72tx6RFZ+hLbUOarIyIH88H
	p/Ph/7b/pe1T4rZ96IKpCQTAhLLMl/PV5GmSUxjoB64pefNcY6pkaYmst/yxgnnmnjftBFhoyzoaJ
	yz01q/7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtR7Z-0000000C1ut-3SEL;
	Mon, 10 Aug 2026 14:36:57 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtR7W-0000000C1uF-3q5A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:36:56 +0000
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so3056174e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372614; x=1786977414;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=eC97L1SA/5ECkDuXapIImr/T8/eWHCgz5VPN2og44/qDBa4uI6AWBQKOrL0B3vJPeN
         P4lOlEcMj8m/ZmyPumJWUwmPM/Il4KgIiy0BBlNUcyZW0mRiIwMvhMMAE4b+8ecSs3tE
         XVfkq5BjPQFIZj4bHHT+dgHD63tJMUpIAz3slRIZQR2DH+ugnpXYcOWIFv1wmADDiMvm
         83FbBarw3ULnlo9kJfvCJ0UN5J7EgwOUl4sViiTTciksVkgQnbU+y9ZOahfd6HNGTYqE
         0Zx/thU4QAgsapbPzV4wGyqU1T1Eu0EIMW7oO1ok5MnOY7S00QEsr/X+njrsGLkHfnnZ
         cjyw==
X-Gm-Message-State: AOJu0Yy9CqXQGxiu9+BKLxt3dt+e4ekhhepJRnZ9focl3iJyvywJwWFy
	5ubq4Rn60jtgL60vnn1zMdd1ZcVjplf3Q2BJSAu7bVj9JEyVInFTy8vh0nPpTWu5
X-Gm-Gg: AR+sD12Cx8Ri0ZsFuIvW9Yf0m6IxA0owtLDC3HR7/NkWhpl33I2k6wxO9iFnw6ImEjP
	QlyKlDMwSHcZeWHUqrcIdB6URlbp+XEcXYwzwOXHESjEaF/mddcCSB4MhYN+IOOCNpHgkll884d
	qVqvt10mH9sunEAYXvRfctYDXWHQExQjYuvE6levCvjlwLRsDPfq/cGNlSmdVQWyGxDkuILn4IR
	MaPKpn7q9Nb1WrBBem8DbWULZJ62wG4go7KOF44PTZzVr9eNnHS1HBiXZd4WmuR4/D3Sqi71D8b
	wVJOKwI3qzA/HLnX6r0yPMyXziUvS5bEG5jZl19PFFlIbkrjfOBlqfjso6ujEjMJ3TeId6D/q+2
	EMj/tI6ip4t45BgBqVXXdGGKEtog5STuJ82B27yGigIuQUMTBKgPo6suUSf1qTVdwPWXWwMEaAs
	FA++XfT/j5vn+w1GGA0bvG3Ge4txli8APaz+h0WRai3BfxyX826Uc3En1H42VxYIAzMKPjAQdeO
	vTTcSOX7qu8OqKiip9ilYkOcUL4CQ==
X-Received: by 2002:a05:6123:2c2:b0:5c3:5806:b494 with SMTP id 71dfb90a1353d-5c4152feee0mr2186505e0c.6.1786372613642;
        Mon, 10 Aug 2026 07:36:53 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40ac786eesm4449460e0c.0.2026.08.10.07.36.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:36:52 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so3056162e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:36:52 -0700 (PDT)
X-Received: by 2002:a05:6122:3b8c:b0:5bf:9b0b:5b27 with SMTP id
 71dfb90a1353d-5c41535b76emr2107981e0c.6.1786372612728; Mon, 10 Aug 2026
 07:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:36:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNWH5P9gb5oknZx1epwxromNv1YesG2J3yVqnqm7ZZaA@mail.gmail.com>
X-Gm-Features: AUfX_mxCJ0ZS0nGlmcMm8LzPuT-W_y3qMEElgtPtAf5z9mDwsGw7FQLMUFJtO10
Message-ID: <CAMuHMdVNWH5P9gb5oknZx1epwxromNv1YesG2J3yVqnqm7ZZaA@mail.gmail.com>
Subject: Re: [PATCH 3/9] arm: dts: renesas: koelsch: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_073654_958270_B5252623 
X-CRM114-Status: GOOD (  20.42  )
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

On Tue, 14 Jul 2026 at 15:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
> the system wait after deassertion of the PHY reset and before start
> of communication with the PHY via MDIO. Opt for the same value as
> used for KSZ9031RNX, which is 300 us.
>
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
> reset high is at minimum 10 ms. Set the DT property reset-assert-us
> to 10ms because the KSZ8041RNL RM does not explicitly spell out how
> long the reset has to be asserted, but this at least covers the worst
> case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the URL corrected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

