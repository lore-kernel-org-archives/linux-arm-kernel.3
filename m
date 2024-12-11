Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B042E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74wusGcBfuJxxiu3HaMI2SAkHBbLte2qbusEcT7vvRw=; b=tVIY0GzCDvpEBU0k0G3zMfTAzi
	1kueJYpu9DUd+KqD1SiUqT4SeP5h7QL/bAH5Rsw/jWX9qWnRhvumiU83KSd8vj1WmB2EdpnLC4XWz
	UEp9e6Y8ZtfLKy8sS4rgIFqcBL8tdHL5Bwi4/BGR2WiOJwKA9IM0kAtt3neXKeN/yhkLbw1f/7T95
	K8BljhY4z4mouwKJsA72STAMSGyFsBNHvC0jJC+bBmAM0N0v0HfVf2/VIxOXbFRib4QiAZvtiu/G+
	t7cAlcPXqZsWry2LgDGXlzkVbXcNevSSJ0AiG2QKG7FyT61ykKtq1oGuCvuwFChNgcOGTSA+PJJv1
	8oyCtfIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMR4-0000000Evyb-3XMz;
	Wed, 11 Dec 2024 13:07:26 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMO1-0000000EvEn-3XDs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 13:04:19 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so3927325e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 05:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733922255; x=1734527055; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74wusGcBfuJxxiu3HaMI2SAkHBbLte2qbusEcT7vvRw=;
        b=RQWUCfKaTJu3vuDf2BLeE9DEEAduKPUq3Jnge2/9iFZvzpXUNQE+bPpvuTD5fytgY6
         1l+rnCtBTPqjhBYX/CrBBqJcGAVE216DE8uULsNRUM76JYOdj9vf1e4ziN4AkVUsisly
         P273evw2gO6i5IeQcI+6yd8Q0z38iDOgHSWyk0PDjQpzocct1Cue0sj8jIbCUq8V76bB
         2y2gsAg6CaSMqnsejhV5vDtYwEvrPNi/cGW8LsKvwaJ/jg/9unQ8Iiy7R/fqn2ODr7YE
         EhT/d/hiviD33KFNk16D7RUSOlAoGfKNtSKHJX1Yh3Uah8m5hWFHbntUsRpGnwQfSLdh
         c+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733922255; x=1734527055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74wusGcBfuJxxiu3HaMI2SAkHBbLte2qbusEcT7vvRw=;
        b=SlL37WrmjsCKfftFnl2UXhccCoR3cVVpUtr7muPY42lXaboMJEY76CefgXUNw/31Vv
         kfYNT9I3FLnTehx0+/HvhMWF/PRQXw2buZD5lwsjiq4osbR2b8e9ccDpMsdeMqqtybq5
         o+4JYnlIRiMnfKA1hWYfsZCx19qzKqjBX/sZInsIorpUs9jG3MRFvkuCbJZvkVRO0aBo
         jcb2UvTu055wNbw9joIDjjafbSV/esJ/Y/QjeGXsNK0smyTQms7B+4Yd0zkfHB0s3yKd
         Tfgq8oeN44RpHeo33FYjcN5fgPHZVOw1EWrn3LalleUkWbOgvXuCbwBYd7OPqVRI6E9P
         9+Pw==
X-Gm-Message-State: AOJu0Yx0oLJTBKHXmAWMeOnfvAEMM1VwfbcC0+H/pfE4vEM0AkAYKcnp
	wyHQvmU1HlnVOsql74Uw310wpY0tRjh7Dm+ZUd5xsCi1FBs1hQfyPDYv0bQRrpfz3FcZQ676YfV
	cD5ejAGda9DIugqV39u1TwlM5dDZ3KNlPwPxM8Q==
X-Gm-Gg: ASbGncsRX/ZX+NaOs3WxSovNZ8PmgL0qpm20D48rSbEbINH6UFy2CarpLHJFX4L1tk1
	+hw7HDlHF3Ur4VMwvCDif08Ev+fjAauWv0A==
X-Google-Smtp-Source: AGHT+IGB6//Aa/9qdBUs97OqLI01wh9FfTforqMFQJWtL6U0HM26bdGgt3fd2jPfYC1+ZrQOgriT60mCRL7KIvudlxQ=
X-Received: by 2002:a05:6512:3e01:b0:540:26f2:3e18 with SMTP id
 2adb3069b0e04-5402a60c377mr883807e87.49.1733922255058; Wed, 11 Dec 2024
 05:04:15 -0800 (PST)
MIME-Version: 1.0
References: <20241210160556.2341497-1-arnd@kernel.org> <20241210160556.2341497-2-arnd@kernel.org>
In-Reply-To: <20241210160556.2341497-2-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Dec 2024 14:04:03 +0100
Message-ID: <CACRpkdYP6yWHuWGwHZCe7SQLg-BFtLb-KKHxqrXbeM2hhrsgfA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: Disable jump-label on PREEMPT_RT
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, 
	Ard Biesheuvel <ardb@kernel.org>, Clark Williams <clrkwllms@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Matthew Wilcox <willy@infradead.org>, Peter Zijlstra <peterz@infradead.org>, 
	Russell King <linux@armlinux.org.uk>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_050417_889410_340FEDB3 
X-CRM114-Status: GOOD (  18.28  )
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

On Tue, Dec 10, 2024 at 5:06=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Thomas Gleixner <tglx@linutronix.de>
>
> jump-labels are used to efficiently switch between two possible code
> paths. To achieve this, stop_machine() is used to keep the CPU in a
> known state while the opcode is modified. The usage of stop_machine()
> here leads to large latency spikes which can be observed on PREEMPT_RT.
>
> Jump labels may change the target during runtime and are not restricted
> to debug or "configuration/ setup" part of a PREEMPT_RT system where
> high latencies could be defined as acceptable.
>
> On 64-bit Arm, it is possible to use jump labels without the
> stop_machine() call, which architecturally provides a way to atomically
> change one 32-bit instruction word while keeping maintaining consistency,
> but this is not generally the case on 32-bit, in particular in thumb2
> mode.
>
> Disable jump-label support on a PREEMPT_RT system when SMP is enabled.
>
> [bigeasy: Patch description.]
> [arnd: add !SMP case, extend changelog]
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Link: https://lkml.kernel.org/r/20220613182447.112191-2-bigeasy@linutroni=
x.de
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Makes sense.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

