Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9E1FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=; b=tvzREZodPBEmdYR4EGNCfkoPCG
	zOKUKWtlDNWl/LCIyIyftDJibIUIErNRa3Ipr01PFhwwDH6ommWIlovg+NfGYXX0WCw1n5W4fiNRG
	k8vfYzX0s4JeSZo7mmazVt3veMOw5YiMstaQgxUno/dKXDGxFL1gx3JI1XEdNjrRU3rthapKQudB8
	3Q3QEmlWk4DAKXoh51OnauJtir+vnIpd60bTgqsHTwPHcaBLsdRTMSVXRacvk2nFMOAFZNwrEF8TL
	5YIN3zsbaa7+HjYkI+AgE+MaGGh8Vz3rW6/yYDAKqCPRHJOciktKEThYsWEvtwGoRt2I9hG1qxl+z
	H5K5I5Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTg4-00000000Be8-46Xq;
	Mon, 27 Apr 2026 21:39:40 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTg3-00000000Bcy-0xip
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 21:39:40 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-bb3c4d8cc29so236175266b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 14:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777325977; x=1777930777; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=Yv+o7R5eBLhTVpxe8c3kmlZ7vm56bxohD9cxeoZCHfB0O74QsNnh4MndSR88d4/+Xf
         US1Mfll85aqBPgYQexKJ71XTSw16ifIHeeoEWg6KOjbaMUEis8sVez4I09gvcYgxOo6M
         jp4iapPfLY8Un6uER+pKNW/SLEezTaz1CwpDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777325977; x=1777930777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=h+UW6t8c7xTbH5OaMnFH2vGmrcxs/t2duqgV8lGNJcMaQ8LPBY8utEZiov0cixsOCe
         fujVdEsbh+yQt0JlzGl/vJK4Wo0CnBLMZRcsUetxpM2iE/w14XQwTWq1wUw+XGqGF1Ep
         WO/kVt2XKN2upPJ54qj4lWX0Dtk4iG3eeU4INjXoolXdKiEZ076QqSshqN7jvGVp+D2U
         017Iq3rv9dDqiYoQBegj7ecG3S//5IE0bk7fpzKr424cIPdP6c3TmtcTUXMV6TtUs6g7
         cp5WcEFQR3x+lEBdTIvw+P0/kxp5Qf1oqer2qdoezKD66Fk4TrAgcoy8OmonWH3Wf/P4
         w2yA==
X-Forwarded-Encrypted: i=1; AFNElJ+cvUi2/FTvRXPR0XBZOb1Ua4WA/RxwNkZnzgkljwFQKypggqmI7kOvSZWjuuAoA4xxijI8/4UDyQ8Yvim1p9Xg@lists.infradead.org
X-Gm-Message-State: AOJu0YyTI/uehcJkCfepYdtM88fkw5fqVfLqfc97M2W/eEn+kMlOg8Dy
	7CijsLF3ZSTwDDwASscWfa9sOcCkcuH029CK3q9vG8NHgtMg4oBgYpBoXhjeL11l7OEdxGNGA13
	NOEKup2seOg==
X-Gm-Gg: AeBDietiE27fuMbJbXUnXW7LHlVTKd0205nlf9xx+C7nnlwCZa9ctwqLt2dT5SbHKwJ
	6TuoL3vX7Zyzun5A0ltivDAVAVhJNIBsGtmV68uz0w3R3aY1C/zpWjix0/nkedC17dlA7S10fgH
	HLOFOF7M10W4YrrOPzZpq7dOumVSCQ47CU3bewhZu7tvNesk98cbCe1HDaAN+8g7ezi+pWqKLyX
	Fb0h+V3nCVNl8Qu0M8Y0qiryEBNdObw0R9iwsK+F8FllQPjzcAL1OlsTuOv5BFdPdFf+uzJPmeV
	WeRQXCz8hqrfhtnan2kMBBx2fkMv3agcGW21FFgzG8Ogb8iAE8TYKgjuklVc33aXGjHBWUeaV58
	4CRw4jP1LxOe3DUIGPTluQQsx/xtF/iOrdLY3rrVe4OBliDKylfbbUsPXOnXgdtZItkAH4r8524
	+PDlH7NSasTC4MKBTPXyTh70BbNSRhhcPpvHAh+VAdjFNyZ3O4rMzXPsKvpw33PX369glgFAph3
	5BlJIWxHoo=
X-Received: by 2002:a17:907:cc08:b0:ba4:8288:b464 with SMTP id a640c23a62f3a-bb8020c9f1amr17571866b.6.1777325977234;
        Mon, 27 Apr 2026 14:39:37 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80bd9377bsm9062866b.53.2026.04.27.14.39.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:39:37 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-678adefbd26so5624853a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 14:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8sqZEOobXnoEBqhMAF683PdgzkK0q9sOUwMhynXtj1D2WBx8oU1/7d5ukJgvW5yVXw6EeqH3JHJfIrZVXlo+/n@lists.infradead.org
X-Received: by 2002:a05:6402:5216:b0:679:1f4f:9d30 with SMTP id
 4fb4d7f45d1cf-679bb04c1a2mr179970a12.4.1777325976937; Mon, 27 Apr 2026
 14:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
 <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com> <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <20260427222914.1cb2dd3b@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:39:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
X-Gm-Features: AVHnY4I-AxqvQRk42MegvhKMp_z4sSEpEzhzpgw2GyV2bV8dezSPoI0JTlwB18Y
Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
To: David Laight <david.laight.linux@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_143939_311644_033F203C 
X-CRM114-Status: UNSURE (   9.42  )
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

On Mon, 27 Apr 2026 at 14:29, David Laight <david.laight.linux@gmail.com> wrote:
>
> I think there is a slight difference in that the normal copy_to_user()
> will determine the exact offset of the error by retrying with byte copies.

I have this dim memory that we decided that you can't reply on byte
exactness anyway, because not all architectures gave that guarantee
for the user copies.

But that thing came up many years ago, I might mis-remember.

            Linus

