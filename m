Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4376CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43BZO3RAppnebCnCAQY4LIb5j3YiQqsMBJqVptEFktE=; b=mypYdSW0OoLiiHBo/zbxBIlkkW
	+qi53/VEY9qKiqCEfBTUJzdOTbAHAXERdwTv3jXoBAKBPOTMcqwjnRt4iqd5ruMPDpzfeSyaILayl
	exEwk0r+oy4HEQoj3oLpR3nt4IAN+kkLH0pcBfwlrWNr5XMo0UaI6veo/qJNvSxPWi2K9vw3mm9kK
	ySdvoKzQg4TRjLDnzrx3CcvPZfDZMbgeMm5hLRVzVV2bmsWlBa7nnyrkRtDRsu8rzFrq3zXdTq67T
	4OwV8CY7/9t4A7YfE+dLIHuNIrXZZ09hb8TuYBA/RxmnKqQA23iww112J1MHsqN5XM4WF0mcj7kEi
	C48FqwVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Q78-00000000TDs-37ot;
	Wed, 24 Sep 2025 14:04:58 +0000
Received: from mail-yx1-f51.google.com ([74.125.224.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Q76-00000000TCi-3X2Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 14:04:58 +0000
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-635380a4a67so2327274d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 07:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758722695; x=1759327495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43BZO3RAppnebCnCAQY4LIb5j3YiQqsMBJqVptEFktE=;
        b=Evrz567csPTl61m/HaKGKjjjPau1mcMFH12jaJ3eypmN4sC1AtNjHEPf/IdRFRycX7
         2MUh/k7yt43XKRjtodiY/sUFEW8Rq9y2aGNdCbVMLecOQAil7ki0FsZEVNta5omcDolY
         iILDS9u2qXZEjQ0yN9f20ecz2YOxLEbrQu0s4W6MAfYEfdnsdhYYeeNtgqWVGk9iALMo
         CqpNa4VQ3Oo8AsLWWKSeufMOHLQSRmrf7UFPAGGyKV4zbliIJvR1oxRIuNaqCkHePSVI
         R6+0hRLzf5QaGEZ2NB4eEFDsz99WpK4RMiOF89vMNQ3hxX40rKWnXho/5fzQ2cMzlx55
         iCCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMhmVHfwkzdUowQBxtAdol9kxbGGqeBXIrcG2hO5En+MVMjhQgpDL4DKE8sZc39eSNLL5DjHle/K3ASUqJozLg@lists.infradead.org
X-Gm-Message-State: AOJu0YzkRHSGWoZwDt1wBv9SB9Lc3HM1hu7FbmkNVDnR5tSNHSKwbLeo
	7slKtnuldHDLuaZRgGYbus/n/tAdz3WN35z0N/d7WjLkH1Uaq+crvyegKifEdcEg
X-Gm-Gg: ASbGncsizyFPZt0Y503I7cx69LWlKVTnnK7rZnrUWgWADUEEPNha2srbLwbgP8+RMsm
	56wv1yyHIYmh7eEbGboGLuuyx3g/zijBY9fIxSFukQ1vxhEMydKERrXWMVFSjkrWT6Fubra1DaZ
	qIJ6LYrEjcWjvlNKbd3OkUuMVZ0IYmtm0C3Uxz9NlosA67GAaq5dH10v+xooMgPnSW5wv0/BfIK
	NoiS4Nlx0MLm3Mfvurh4MsHz2Hj7VDMQd6jRI7xsfy2SEWld7B8dYSExEIVYwMLUOz82sw4fG/d
	wlMl/xyevAEPw760oddwSGq82GsHc+4a2cm7fJK4KjATKbo+FNcwkmsljQHdoSNWlsBBoE3LaL1
	OF7xhQ/hpF+Bke6WET57012Z+kQbmKduuESZ/1MdY1n4mxivl0cKty010td5hTDE04mqDH8PN4e
	ilaGM=
X-Google-Smtp-Source: AGHT+IHUqYA/3AGkTU9bYOJWvpb2gkngzODK3U14F/GdyqufaQDCtaS/SKzEW70BKJmo8C4qWlUlmg==
X-Received: by 2002:a05:690e:44c:b0:62d:cb07:f098 with SMTP id 956f58d0204a3-636045cf560mr4007121d50.18.1758722694893;
        Wed, 24 Sep 2025 07:04:54 -0700 (PDT)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com. [74.125.224.53])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-739718adb9csm48240807b3.58.2025.09.24.07.04.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 07:04:54 -0700 (PDT)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-633b6595287so2489450d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 07:04:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWg1Vmxo/5us6UzYmUWsgITT8t5aPiAuIVLbLRox2Ktr5lcOJPny0m1nnnMUwB+GQghI0j2jUX/WIht5vx3buuD@lists.infradead.org
X-Received: by 2002:a05:690e:d4b:b0:635:4ed0:5717 with SMTP id
 956f58d0204a3-63604666409mr5129283d50.49.1758722693635; Wed, 24 Sep 2025
 07:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250909113840.122785-1-john.madieu.xa@bp.renesas.com> <20250909113840.122785-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250909113840.122785-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 16:04:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfN2qK-Yd=ZAaLek=UMkLK+NzdU5aFr0ET3o9m8RB4pA@mail.gmail.com>
X-Gm-Features: AS18NWC4NdZL83Kq7qZvbj_wBXjrH_GSLKGUTwSbCh3zlppgYZIteZzcvWX4tWU
Message-ID: <CAMuHMdXfN2qK-Yd=ZAaLek=UMkLK+NzdU5aFr0ET3o9m8RB4pA@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: renesas: r9a09g047: Add TSU node
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: catalin.marinas@arm.com, conor+dt@kernel.org, daniel.lezcano@linaro.org, 
	krzk+dt@kernel.org, lukasz.luba@arm.com, magnus.damm@gmail.com, 
	mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org, 
	rui.zhang@intel.com, sboyd@kernel.org, will@kernel.org, 
	biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_070456_881040_502BF3C7 
X-CRM114-Status: GOOD (  16.92  )
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

On Tue, 9 Sept 2025 at 13:39, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add TSU node along with thermal zones and keep it enabled in the SoC DTSI.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

