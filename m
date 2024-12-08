Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA7EE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 02:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZjbRKhMOCLvsh/fbuGewVnDsfkV1Y6IoPuC3JohNPQ=; b=u6cqSHZ4YPlosYcljUu6K7eM7P
	SLJ/3uevHVwWaH1U9N4D5+WNk2eIN3RzZ57gASM31J9WGUaWeaG+BelxjxPzVe2VWhEByYjCPs7yR
	qMheIME2BLAzLK9t/8R3GIs5cJDGVbuNhiN1vbwKxZbm8E40KiDUq6Clp2KCjfO8SyQZmNDVssi2K
	Cu9FkUJQIdqwCxROAEmIC3UsLs1paP9gAsJVVenTxyrUwpENZXlIdgCXB1f8ElImWlUWv7gk1GqBl
	BUrtHXlbwuy/GrTWfUhe1ma8kXWnFHDcOJ6DKE7qPRRhnbHCIgJ+uZpu6EuNM2qC7sWuaHN6TM7/Z
	kntsf4HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK6aX-00000004gyl-1HF9;
	Sun, 08 Dec 2024 02:00:01 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK6ZV-00000004gsZ-1K6s
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 01:58:58 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa62f0cb198so395352366b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 17:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733623135; x=1734227935; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EZjbRKhMOCLvsh/fbuGewVnDsfkV1Y6IoPuC3JohNPQ=;
        b=VKiXRqClDy6IcKjA7D4ooQubRDWlXGvJ6xO0mdPCEGMN5x8tBFBVQt1hG7KITkMrdw
         7FIfdwdIOrQDgZ4/Qu6LMrGOPgtTjRydbsj86w4N1TgYSO+kBuwnyJV7DfL/mfpVcUG4
         dRV74kM1h/B/XTXnjLnwdxHOm8PrvAKAYjRb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733623135; x=1734227935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZjbRKhMOCLvsh/fbuGewVnDsfkV1Y6IoPuC3JohNPQ=;
        b=O1mCQFByr0uaNQp4vDLb1OFaS8gvM1gbh4et5cyFzXKzHAxPJlaOAAMjm8KHFNZO9r
         TBi6qL1hEz3AjMzNQ749Lw5faEF6ipKzvHLYOdcRbZoDeb/FMKHuZjjOj8iCgM/xWCbX
         dBmIro/3zpGjLqibmOQh5cpFfcLSBaWS5Mjpe2DYDSAjwvo2NWl3qjCs/fAEHIXxSCJy
         hO3H4vJk/Rz2lRV1Q4Im+rV1QjdNPxdkOs3rn5DOngb4IpKuJl3s/Ug915PCOuK77Fgj
         43IJrMM+ZTJFeGkx9n/MI7K0rbODnhVAH6ihg51kkjeppz53QINXKnuSzYV5ZaYC8N2k
         OezQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiQ7sPfccSri/LllNRM1T59uj57ve8sxQTE+sWBtz7rnBiO7722tjk5MDcYWM21fAdFpnFh8P/RI2oBJK3fCii@lists.infradead.org
X-Gm-Message-State: AOJu0YzPS/2FsN0GWC4WtwolJ08ZYYufridQtTjbBEREjE49/yv4sNCK
	DzTteRdmJD0YsAHPDl8jxFk0Qic2c8rcHh90gAU0mL396Z3k7f/PGidWdZSJnkriO6Up+JwDc9I
	YWzdG/g==
X-Gm-Gg: ASbGncslF14oKe/V0fk6exx7s6n2xJichzSrTvg2FNcDyVf8sqznMuL0oNylvoJsmII
	6zMku/IdATshGDFzx1Urtg7Ku5PU8ux0fS+Nhn7MIuOscmLTDG8IuPa5t8SgfATNaIjczB+MPRf
	f/PmAcAzhp4bNZOnBAtFlBb8/dsoFeCPR/S9OpJmdrtvKiP/O/IYcNOTljj3taRRaR2QoEESVWa
	ezwT3IUMtHvYhtOQEnyjzUfhiEBBZlvDoDENTDE+fwZ8XmiUHde2OWExKsb7YCWrHqmpAQGhYUd
	V5wcklXdKv3XMRDAopRwugD3
X-Google-Smtp-Source: AGHT+IG7Xjdk58rCP1ut5qm2YYZEgOfMbiR1fQccboHgCfmkpu3L1yKOrli1HsSv5195rPuLTsNJ4g==
X-Received: by 2002:a17:906:3d22:b0:aa6:6b7c:8a64 with SMTP id a640c23a62f3a-aa66b7c8c61mr183269966b.26.1733623135122;
        Sat, 07 Dec 2024 17:58:55 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6701b08c2sm68440166b.124.2024.12.07.17.58.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 17:58:54 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa629402b53so408365466b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 17:58:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVshyh2EljB9HFeyDEZzLCdRMumYOgmkW3KHFyb/io7UqWFSByHWYq8e0wFYUzV//OuZ7Poq3JgxLM2FdOHddeV@lists.infradead.org
X-Received: by 2002:a17:907:84c8:b0:aa6:2fc7:71aa with SMTP id
 a640c23a62f3a-aa63a24f1famr565813866b.55.1733623133832; Sat, 07 Dec 2024
 17:58:53 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de> <344b4cf41a474377b3d2cbf6302de703@AcuMS.aculab.com>
 <9a0c041b6143ba07c2b3e524572fccd841f5374b.camel@gwdg.de> <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
 <0a2996a7c63930b9d9a8d3792358dd9e494e27c1.camel@gwdg.de> <CAHk-=wjsfYYKBYuW8_6yKjdwHih0MMa2GwUJh_LHcuUNFR7-QA@mail.gmail.com>
 <9d9567dbdaf39688bbd0d240e29dec826a5931ee.camel@gwdg.de>
In-Reply-To: <9d9567dbdaf39688bbd0d240e29dec826a5931ee.camel@gwdg.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 7 Dec 2024 17:58:37 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgVGmj+nAju2XuWWD_FZHdeytRW2XX5D-L3MqDuRRciVg@mail.gmail.com>
Message-ID: <CAHk-=wgVGmj+nAju2XuWWD_FZHdeytRW2XX5D-L3MqDuRRciVg@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Martin Uecker <muecker@gwdg.de>
Cc: David Laight <David.Laight@aculab.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
	"linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_175857_378168_8BB678D0 
X-CRM114-Status: GOOD (  15.60  )
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

On Sat, 7 Dec 2024 at 15:52, Martin Uecker <muecker@gwdg.de> wrote:
>
> Can you point me to some horror stories?

So the main issues tended to be about various static verification tools.

Ranging from things like the stackleak plugin for gcc, where handling
VLA's and alloca() (which are pretty much the same thing with
different syntax) was just very much added complexity, to perhaps
overly simplistic tools that literally just check the stack usage by
parsing "objdump --disassemble" output and then building up
approximate "this is the combined deepest stack" call chain
approximations.

And even in the *basic* infrastructure like gcc itself, VLA's simply
made -Wframe-larger-than= just simply not work.

I also have this memory of bad code generation (again, this is 5=
years ago, so take this with a pinch of salt: dim memories), where gcc
wouldn't end up re-using VLA stack slots, so VLA's made the frame
bigger for that reason or something like that.

We explicitly use "-fconserve-stack" to get gcc to reuse spill slots,
because gcc has been known to sometimes makes insanely piggish stack
frames when it just creates a spill slot for *everything*, even if the
spills aren't live at the same time (think big functions with lots of
case statements).

We also had several cases of the VLA's just being silly, when a simple
constant-sized allocation just worked fine and didn't generate
pointless extra code.

Pretty much none of the code core actually ever wanted VLA's, so the
end result was that we had these bad patterns mainly in random drivers
etc. Don't do that.

                Linus

