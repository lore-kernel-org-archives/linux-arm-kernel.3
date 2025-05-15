Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05990C2D0CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 06:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPyG0mlit4Fqvc3ieiHFbClT0DklwqbFDL/14cm9a+o=; b=XzeAcoDWFxh1W+0EWXp83Me0+k
	67dyt5rqCC9q+hCONOrDjDZ5Zp6GdptHhzIwMJQYgDjj145C1d8tCp7g/qiZxnvE4w5yiNUOIo/VN
	EZ5eRz3fCL94wi5dhynW8FFH6Er25hlOGN65eTJE2tU9WhNwCs+I78aOJW580n8t9Me1ztOL7Ziai
	mQF/dSFu3Y4KXI2O8179KmTI1a9/X3aR8CSwrYGyMDrzO3iCoZohdkRNxhTCTFuU5r47JzNBk8v3n
	6pstkH/xfG+zxN3axlRcfZkjYY5KGWfenRnhr1WFqlJsgLClmDaHIoASWMS8aMZqKT3CNKNp3DEih
	DSAST+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRdM-0000000H6lh-2Fyc;
	Thu, 15 May 2025 05:59:56 +0000
Received: from mail-ua1-f50.google.com ([209.85.222.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRXK-0000000H660-1Whf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 05:53:44 +0000
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-879edc092e7so131328241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 22:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747288418; x=1747893218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPyG0mlit4Fqvc3ieiHFbClT0DklwqbFDL/14cm9a+o=;
        b=dQ/jR++YSGd6ye4PICcWd0cJM4qS8ifLFeGQ54kAI7GJVCa2Q7yWoO/Xv1EH+1/YJP
         tW1qjAyqCgTFV6+kIePX1TLwsOKWWykG7DfpyhIQ7sjhZnOta0GpGvmFccJWDYsGV1ys
         xaVuHsrF2K3cUUS037o6d4dapivi97vE7rRdk/dPhPiUgterdtGfC8fNrGuI9wnLZjOw
         aonD0NolqxRhmI5CCQusMYouWNNF5ttm3KR1Z4zaSizjgoVh+/R69N52E/A040yry8/e
         gH8vrh/fP1pThCMYGWCjGjhpzgioLdSUM8gl3JLLh42lNsHYg0JrF8I2Pe5nGUdHHkR8
         DU0g==
X-Forwarded-Encrypted: i=1; AJvYcCW6AHeLkHHKjb2HwAfGEOtHHrTDzHigAtlgK9f5C8jxa740+XiR8z6NoyqBF5i8ZFajBeQNcOlTvT6RONLP+uaD@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx8Fn+WC2qmt5rNdJoWlFWYZEpGXUCWB+TCZ853eRWnZiHk08O
	tzLL3Gl39Zsx7RqcvNv8xEoBZGo5w2VHo4f8DmYD8/BUE8MjceP88yO/7RI2
X-Gm-Gg: ASbGncsrqbZzR/DnJzqFWK28nR9yhGt4kgg/uWTcfuIENwD+kMynOnrxIVox+yYfu/0
	uiWMp/8Em+Ib67cygSiB8l8m3Lj62wHbvzHSojMvV3yKAG4a/TyjFqe+lDI6VSjh3DS+5P1IwNR
	dRbNuiPbfu6W/8PWrJFh2uyS1fQJbvwhfcPmecO88aHv8V9JoMCgeA6T+w9Axaknp8icIYawsW4
	dhfmitseUKe8SoNminmOYGcb2WtKCPBd5MaJQKPWBY+lDdlJUgf5Ns48Av2pfU6auqfkAtRT0S0
	m+B+kJHRZQio96blLI26VRcSY7kxQhuIMS5TZPD3ft8XrGmcQufqg0pmW4xBUXkFL+wppOQaIi2
	QRCF++XS643SW9g4T5A==
X-Google-Smtp-Source: AGHT+IGAmFLipnroGeGcR6/11nbPbHPeVEYpA22LgEQcFtO57i5ILWm1KN/XyDwXhVP+yReR53IeJQ==
X-Received: by 2002:a05:6102:468a:b0:4df:9160:8e64 with SMTP id ada2fe7eead31-4df91609182mr1078846137.18.1747288418555;
        Wed, 14 May 2025 22:53:38 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f613a084sm9889848241.5.2025.05.14.22.53.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 22:53:37 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-527a2b89a11so185091e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 22:53:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvQXGzbnmCbKRwWxIflTPIn+QK2KsBmcuHqLM7ufCaIBGGlaEHQB+cNVsgbSstv29gp/6Ard0pODwmR/qLKZpf@lists.infradead.org
X-Received: by 2002:a05:6102:3e0b:b0:4b6:d108:cac1 with SMTP id
 ada2fe7eead31-4df7dcb5c78mr6484774137.9.1747288417074; Wed, 14 May 2025
 22:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <202505151255.rCHp8Bvu-lkp@intel.com>
In-Reply-To: <202505151255.rCHp8Bvu-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 May 2025 07:53:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUh3oXniR3b_g+SuqXXeB=3YRFSVOONOth7XRNpHC=a8A@mail.gmail.com>
X-Gm-Features: AX0GCFvo3GnsTZII4bhG8cXLylyB93OgSRrkVG13kj0dt4dQMBXBbYjIu4GDk6M
Message-ID: <CAMuHMdUh3oXniR3b_g+SuqXXeB=3YRFSVOONOth7XRNpHC=a8A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally
 enable reprobe support
To: kernel test robot <lkp@intel.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Chris Brandt <chris.brandt@renesas.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_225342_404286_3884082C 
X-CRM114-Status: GOOD (  27.08  )
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

On Thu, 15 May 2025 at 07:04, kernel test robot <lkp@intel.com> wrote:
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on tip/timers/core]
> [also build test WARNING on robh/for-next linus/master v6.15-rc6 next-20250514]
> [cannot apply to daniel-lezcano/clockevents/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bindings-timer-renesas-ostm-Document-RZ-V2N-R9A09G056-support/20250506-223636
> base:   tip/timers/core
> patch link:    https://lore.kernel.org/r/20250506103152.109525-3-prabhakar.mahadev-lad.rj%40bp.renesas.com
> patch subject: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally enable reprobe support
> config: hexagon-randconfig-001-20250513 (https://download.01.org/0day-ci/archive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505151255.rCHp8Bvu-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/clocksource/renesas-ostm.c:235:34: warning: unused variable 'ostm_of_table' [-Wunused-const-variable]
>      235 | static const struct of_device_id ostm_of_table[] = {
>          |                                  ^~~~~~~~~~~~~
>    1 warning generated.
>
>
> vim +/ostm_of_table +235 drivers/clocksource/renesas-ostm.c
>
> 3a3e9f23c2cae9 Biju Das 2021-11-12  234
> 3a3e9f23c2cae9 Biju Das 2021-11-12 @235  static const struct of_device_id ostm_of_table[] = {
> 3a3e9f23c2cae9 Biju Das 2021-11-12  236         { .compatible = "renesas,ostm", },
> 3a3e9f23c2cae9 Biju Das 2021-11-12  237         { /* sentinel */ }
> 3a3e9f23c2cae9 Biju Das 2021-11-12  238  };
> 3a3e9f23c2cae9 Biju Das 2021-11-12  239

The table is unused if CONFIG_OF=n due to

                .of_match_table = of_match_ptr(ostm_of_table),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

