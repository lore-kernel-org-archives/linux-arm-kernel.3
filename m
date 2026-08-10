Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DACC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/J6pjqX1tkN7ol9r0yPzfB+nnpzebdTRaebsQQSoZo=; b=ePpsmPuyuiDBuhgTlyyWPT5izI
	XKqRV3rvrrro5dT8LU8EJz3mJECcwxGiTVdy/bjjxqpaVSnz9opJoHJCqCdmZQNQIz5nWKVW1ZKBA
	k7HU1kFR5AFbxRpGqu5wTojRear8PW+xymYFLCfkyQZwfjVcCG2RS1e8nfcy5NJo2oNBEieDCGRhU
	sFVh+gDYwL8OoyvBM3WA5vmUI18+pxHFmduNVxmrHzY5wiepQI+O5mV16JNMQErkni/SgvfUDthJi
	HLo7FGF1l3WWnCcnUwLYJPqwofAz4xy9KfNXTzB2Ctht7JSOGOUrlyU/M8Xf4scvQ4jhJ5GZQuTvM
	4ytCj2CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFb-0000000C3Pl-3ws4;
	Mon, 10 Aug 2026 14:45:15 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFZ-0000000C3NV-1FtH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:45:14 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bfb3347ce0so546550e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373112; x=1786977912;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c/J6pjqX1tkN7ol9r0yPzfB+nnpzebdTRaebsQQSoZo=;
        b=HxC/H7qpt9+dsMhG88tifXdZmMF6PySwar7hXq9mkRsr4HKrymuFac7hLtOcFM2Zn2
         DtAjnHdGEnwKio9kwiIJSGNmbKnutEdmvTiX+z/eQe0bxQPmgjNfTqvrVWIqtI+TdDdc
         nKQte9nCuxJtuX24MA9bo0hjrAffd/MCVQz3bcV+yIAfyuDZ7mhxB8SAv/oDk5jel8rg
         JzZP4LPGaOaU8Lg53ukWOO0OKH0FrmjK3WSByrQuRoKB328vcHbiMguU2qxlgRmLaQLl
         t0WgopwafTBSyV40qSjPiMIsCqWOiwDvc3lY4jrHun4r4Rn6+WTh/sqqtDVqKtoQRnQb
         A30Q==
X-Gm-Message-State: AOJu0YwAEu98e+9WFQn4Jax9PZy51BAa4NT1rZFh4z49RysrIKC0eVjV
	9t+P/vZek4Buv5A4DF437SV8yRCwLSkwVPzQZuGWnvasE45kgVQa0HYArCanecvq
X-Gm-Gg: AR+sD10xh7aRCHXXepy7ysBygbmBxHH50oUZarGeJTB0cm8IuMPgkCrmERI/uuHYj9k
	gVrSn+/NzEmVX/OJYITJBM4BLj+ZKxqnhCzbLfmbH0T1qWMwZ3Xa99vcYKdE9Apvn92YfjvIvfg
	Oo8Rrm1WrkI6tFhMs/Sh8m1a69uVZpfggmR9Php1b+3eOpBAP1HKHz+hUr+7YY8P8l1kXu8FM1c
	k/Qg1bmdHmUqVBmStCgs8xjfl+fNNxFkmxU1iRXoit3yGyU5hqVlFUX/1Va+BuIU/CcODRSi9OG
	KqRuAc8oembVWVRLFMAU5cAuXP1HdXwnppGOyHNxXGaopAaCBKeOqq+6Q5lHAGAK4AZBEcqupDa
	aWWCh0uF3oxg9yxGpca2lTelZd86ZMVMLndrucnq+a7/q4n1ab/9+6hGLMYOl9ubVSC3M2qpUf7
	hyP4kxFCxgt+8v0SEzS7Iw1ByhAK2Y2y8VsWrc0tFw5chw+KWinEX5r6A97DOoh/p5e8YwntKgF
	gjUxCR5cXCDhsPFl6r0TxY4bV4OXA==
X-Received: by 2002:a05:6102:b0b:b0:74c:9177:35bc with SMTP id ada2fe7eead31-760e62c93d8mr9393669137.2.1786373112089;
        Mon, 10 Aug 2026 07:45:12 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979ffbdd8besm2803335241.2.2026.08.10.07.45.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:45:11 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so598761e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:45:11 -0700 (PDT)
X-Received: by 2002:a05:6102:3e03:b0:738:1fcb:f276 with SMTP id
 ada2fe7eead31-760e62c939emr10465315137.1.1786373111117; Mon, 10 Aug 2026
 07:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260714130515.11262-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130515.11262-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:45:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWvPtnH0WUjp1+jTn=K9=RCydq8_O2Ri+FfedcanRWV8g@mail.gmail.com>
X-Gm-Features: AUfX_myZKLorDtb3K9UCtKfuAHnzr1O6LnLSBddvAzpsfFWqwMDXcCTUWFrA9oc
Message-ID: <CAMuHMdWvPtnH0WUjp1+jTn=K9=RCydq8_O2Ri+FfedcanRWV8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: cat875: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074513_350785_12530DFE 
X-CRM114-Status: GOOD (  18.08  )
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

On Tue, 14 Jul 2026 at 15:05, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The RTL8211E reference manual [1] page 38 chapter 7.16. PHY Reset
> (Hardware Reset) states that the PHYRSTB pin must be asserted low
> for at least 10ms (Tgap in Figure 10) and the system must wait at
> minimum 30ms (for internal circuits settle time) before accessing
> the PHY registers. Use 15ms and 35ms respectively to provide some
> additional margin.
>
> [1] https://files.pine64.org/doc/datasheet/pine64/rtl8211e%28g%29-vb%28vl%29-cg_datasheet_1.6.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

