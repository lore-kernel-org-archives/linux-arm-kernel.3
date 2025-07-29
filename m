Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D225C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 18:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwP3dr7YyDibVHyf7li9AJtXWtRFZLZZCBSKzcLCyxA=; b=AW/OWHSLJhlzeOvsQwSis4ZSPH
	kNhVF9ZbIaTEqWwcPSmTSaR/w/yIn5C2dOHSUvgPURO8dFdQzhYg4m77K6h+1m3z2SB2bLEeHzw1P
	VBKxO7OirKXvxDNM7RcMaK5+BPxFA6C6cd2EnSBTXXftYWRF2lx2Jrwi3DFOc4qBeZL21WYU0o2Si
	pW+/8iQcsvUuNAVByP+0ZT5pNeIvWs9P0Q2GLzERRbK2VSXktR4GRVARSFjI9Hy09ggffiMKypqDn
	cmpCn8fjjKkdiLPmhqnf8knBgucJmpySrxhTjMSDZ9zlSymrk7kz0Y4XzV3wu5Ht4/bzwpHM+ymyV
	bKHDMnvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoqL-0000000HQSZ-1vMZ;
	Tue, 29 Jul 2025 18:14:29 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugont-0000000HQIq-1fbY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 18:11:58 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-af66d49daffso372590266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 11:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753812715; x=1754417515; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwP3dr7YyDibVHyf7li9AJtXWtRFZLZZCBSKzcLCyxA=;
        b=gHhLpfEoj7np/RjiqI6n9+8kUKNUXepXxn85BZ1ibYKIwsJ0NOYIuLK0G8LVpLQ4Yj
         JU9lCS2DZkhcT3O6RqtFnpcs02wVhmHFD9Qu9+FF4Q3/4DumcmrHKJKa+FYGRzorjbAF
         tKq9RXzAaQcUM5xj68/8PpaKY76A4FfGWN8OI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753812715; x=1754417515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwP3dr7YyDibVHyf7li9AJtXWtRFZLZZCBSKzcLCyxA=;
        b=SMomvggbHFaaPk1K8usoGMXd/a0JHLV4eDEtPrHePKgjnPPIbbBKMaO1DiTfMgjNIV
         l4ArjFwEqpNXivicf6hG17m0nk0Q+SoC1dsvvTgAfeCV32cd3tld+g2GNA16iJxedfpC
         snQbNfcr2loVMspEixrzf64h7/HersipbN8k4URh5iBf9xEz6YtI5gexP6TRiRNVCbXl
         3p1q6hg452emaMrhFGai1ByVYKT4RebwRV4ohJ2idLqSQu/e7XDQVCjVe7YM9CpoQKWK
         5y/y0KaCbIIMl7unGghbDQcleHApDh1GEw+QQga94FV5WdULk1AVwsu6v6R86KWB58Nq
         jEpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs25W4Epty7zwzi5MM/NQ2qGQTUsS9n73ZzpY0/vFEGSV6P7tJWQf9GoCrALaNbuKnc+K85jiIl/MBCoxs8ftq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2ynolc164yqmjWC01T5qEvqxg50nLKfhjcx0hKUp5KUwk8ng/
	jxRIkxa/RIv8HNDmq00gJiq8tTd+EOGnhA+PNBPFLztxLKgMB/yXN4Ptuy4oAJIoVqbybaHNqjp
	2qSpxsd0=
X-Gm-Gg: ASbGncstAinHWtX2yMM7aT5uxxlW7fRDFDmUfDJNWTgkXFStC9X22LUEd7Cd3JjqnRZ
	VmH6bf7xA/uZZ5oWZInDwci032rNA7Vvi6Q8DmY+ZodW35sxrJcBD28nD9iipIOHHkEL9K7SwqU
	TDV7QGnQSZLoNIA+V8vMgO28Au6VmZDenZljm6WFdOCOvh+F4SMhUu8gZoFlJq1pKuQfeE4Jd0o
	6GFMi8DGxHnBvXkZ+YeJb8H59vCLaAK17EjaG+TrYAX236AClYzD34JZ98rSphrSTWla/zAp3CA
	Ce5gTfz3EctNu9x1wVZbqGmazzJhaEbBj9DDYPoWXDeGaA20DuhzTsO04C0KAuWbfvmO6+UulYV
	mOhXkz0/ps5cC0CHwuahE2vrkSAaHiL1Bpx790rymaP1hkxl8o4K4VZOU0Csnlt06OXWtMruh
X-Google-Smtp-Source: AGHT+IFuiP9V3nJeeLc+XPTiqTPeiy9ux/1YGOd4ODScMHtTGpKSdUOanY5hhsJC/rJd9wujMJXvIQ==
X-Received: by 2002:a17:907:d649:b0:ae6:e1ba:30a with SMTP id a640c23a62f3a-af8fda1235dmr51058166b.54.1753812714950;
        Tue, 29 Jul 2025 11:11:54 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af8f62b27a1sm51436566b.54.2025.07.29.11.11.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 11:11:54 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61571192c3aso1317586a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 11:11:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUo2kYQToQuFiIUxjgftdCZFwZ/T+SwZ3z1bXOfh8nJTXxebmRQPsfAxVFoW4nB30J59xqXEQAZOe4cmIq5FIG8@lists.infradead.org
X-Received: by 2002:a05:6402:278d:b0:615:399e:d3ba with SMTP id
 4fb4d7f45d1cf-615872038b7mr479533a12.32.1753812713808; Tue, 29 Jul 2025
 11:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <564b7ace-bb5f-430e-a7f1-9f6a41305e10@app.fastmail.com> <cc7b0bd2-53be-4981-bef2-44903b64dd6a@app.fastmail.com>
In-Reply-To: <cc7b0bd2-53be-4981-bef2-44903b64dd6a@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Jul 2025 11:11:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi4JiEFZ1ofX5Df5mvhYS4Ob0_JpHGd2VxNzDypWknqXg@mail.gmail.com>
X-Gm-Features: Ac12FXz1Qxn4crxv1oBy3yf37kVc7TYxrFXCgROlz1H2zNpBoR4Q1XkLw2GtmWA
Message-ID: <CAHk-=wi4JiEFZ1ofX5Df5mvhYS4Ob0_JpHGd2VxNzDypWknqXg@mail.gmail.com>
Subject: Re: [GIT PULL 1/5] soc: dt changes for 6.17
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_111157_459726_5D60800F 
X-CRM114-Status: UNSURE (   9.36  )
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

On Sat, 26 Jul 2025 at 03:28, Arnd Bergmann <arnd@arndb.de> wrote:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.17

So this caused a trivial conflict with some of the usb additions (in
the freescale s32g2 and s32g3 dt files) I just pulled in through the
usb tree commit d1b07cc0868f ("arm64: dts: s32g: Add USB device tree
information for s32g2/s32g3")

The conflicts are trivial, but I thought I'd mention them just because
they put the DT info out of order wrt the addresses things are mapped
at, and in one case also had some odd whitespace.

I did *not* change either of those in the merge, so the oddities
remain. But I thought I'd mention them in case somebody cares and
wants to fix things up.

                Linus

