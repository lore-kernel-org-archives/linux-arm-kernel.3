Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A902CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 21:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BODH/PDG1/mEjAzfIXwGyZaoRCgBSiqwtAvUwN/rUG4=; b=ydhFlDUSFcqVUc20F4f7pCP0ik
	NaUFPBp11Lq+qpTB3bN2G+TAWVvyYleB2VwQ+r4mCLcAbXXP3Lbnlc8RWwwlsUNsrmUqbliVG9Kbr
	qIci1RtlAYnZLlB7Z/QIgBs8TWeYVZaNBy/g+JAjjvMj1FZ447HpX6wimJ0xrnln0NGU4h6Z7Ibt0
	x7aX2myrUMlSW7+vUBm+dik2WYDRInFQ9r+6MP1fmInjfz7Hfch0P2uhkGgYMbJ7IUCglzCJVflmJ
	hykbxTgu3bitsZ8qwbbHvhuoWnxmwlC31VPctHQbt5dhEccduQgJW4ka/fOBHc10Vpq71CAWLz0lP
	TI7E7aAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNFv-0000000BWWu-050O;
	Mon, 12 Oct 2026 21:08:23 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNFs-0000000BWWX-2AVT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 21:08:22 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5bcb3726952so569796e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 14:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839298; x=1792444098; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BODH/PDG1/mEjAzfIXwGyZaoRCgBSiqwtAvUwN/rUG4=;
        b=KfIGoAoYX7R5rmRopfgg/aXy5sWiAlZCx8XBIez/s3dhfsglGJemZL38j+H1UUlqVd
         jXzcBXR4g7DOtkl3YORahJIeMEEU8DwaO8WZdOBP4SYP0t+ZfAbf35EZkOF2pv8NZNHL
         EsFGcwNHii0vIFYA0A1gObY/sQy684YU1k05pw6P0VKScuas6YAqn5K7AncnXwAN+Bgn
         McoMIwvV/5v8GfpgFZOIHumKCdXr2pnr6Kf9y2Yb6FnUl6/pNt1MIEFTZsuau/sUFNts
         AZ8KR8AJNDhJm9fhGQ/QjiQKlkg5LqSGA0cUZMRHuAuAqUhcx2OFGjFwDVHQ3ObN6SWO
         s45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839298; x=1792444098;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BODH/PDG1/mEjAzfIXwGyZaoRCgBSiqwtAvUwN/rUG4=;
        b=IoNgfC8qFWpW43XaGob9GCJaZN1Zyfe+cumIskT48FaxYICLy3abV8IzNJKK9sCASS
         b5nzYOceBRmgNChVLQqHVEdSbaE3Od+93g7fLMQ6wL+SBwnN746z4tlayD40vE8LYXFw
         /reM1Yy8teV+6Yb80UmHiPzK67OG8wzaG+wHflsa/dJInZbbvi6anilTdBXvDqLSVRmw
         5J9vDwBSLGly5zzx/NsaDhg9ecK3EiuZLryffU3k6c5+ZGag39rB8Mw3ocEvBDeGkXEn
         a4d5QZS1BupJGR+L8JmjXgL59yQpFTKgO6lLQTZsMm+ogfqqZoqjFObpJiOlsWJKKp5V
         XeZw==
X-Forwarded-Encrypted: i=1; AKwUvBxuTrd8MZItlk2Hy1g5ysmBzJXBlKH7ch+3V+JnR+1+gwjpHaZ3Mc/guzOviSdoCyuqvcZ1ueaLL2bOUgRm98j3@lists.infradead.org
X-Gm-Message-State: AFq9FYIhyZVhbh1vlGi2mIOjSUJI1RU5BJvm6EaQggsEHJ2IKWFeXVkP
	kAdESn5FKGqNUnk6V/+DbzVTpKzwttzDk1ElHut/fQcnfkX9qclpKiGZ
X-Gm-Gg: AYBFou3FCX6dMiVYVKuIViRZfEeri1iwxUNI2Ihh5aiMfaJbKf2jgTtcyA3S3nkzDls
	eP+QOMP94x6toBA2Mqp/RNGNMnLIWb76Z4XKolyBzuBrlAPi5syfPidvLNUmo3ebI8IyyIlTnNt
	HxAGKgZXInGsB5sHHwfHRhKx2rIdB/LSSePRearN13cPX0nsUgCZvxg5NhdPZ2uLfDnSTuXAsN6
	KM9WGdMhJxywNFatBCralhm/sLJoyWNLlPQwpk9ARVa7cs3NkRTX9yFVzGvPoS47kbq7aq2QDpp
	Wz3tNEZBG0WSmdTzbjGfC7fUwF5uotmejudgoNERdF8J1x2goLE8Pl0SHMKo+0kdJLQ9q5hmMeI
	3N2yNEZ1WaBKGJMz2mQ3+ZXXTmnvjnnqsxuC6hxqKdA2CtcNtNgD43LK9UeIrP0P2klwoUy97K+
	N7iQvmNtlWaEDLQxE7S+1KDje3jduFYefeMVShLuFHJQYBXZXJRlcFpqpgr18V2HM8l6d43FLer
	fo9+BEdcGVRnQnhVnNNLWIm9fAleRn0eHlGvt7KMZnNWyQfdveSSzdx
X-Received: by 2002:a05:6512:3e20:b0:5bc:ddab:b793 with SMTP id 2adb3069b0e04-5bcde8cb6d0mr3744622e87.53.1791839297959;
        Mon, 12 Oct 2026 14:08:17 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddecc3d7sm3083561e87.81.2026.10.12.14.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:08:17 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 04/11] gpio: Add Cortina Systems CS75xx GPIO driver
In-Reply-To: <as1Dl08DwxOu-boF@monoceros>
References: <20261012-b4-cs75xx-s2-v1-0-8a7641b7b79c@gmail.com>
 <20261012-b4-cs75xx-s2-v1-4-8a7641b7b79c@gmail.com>
 <as1Dl08DwxOu-boF@monoceros>
Date: Mon, 12 Oct 2026 23:57:33 +0300
Message-ID: <179183865387.2445720.12278001692808149938@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_140820_563038_684B9CB2 
X-CRM114-Status: GOOD (  13.25  )
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

Hello Uwe,

On Mon, Oct 12, 2026 at 10:32:58PM +0200, Uwe Kleine-König wrote:
> On Mon, Oct 12, 2026 at 08:32:59PM +0300, Fil Dunsky wrote:
> > +#include <linux/mod_devicetable.h>
>
> Please don't include this file. It contains a plethora of defines for
> subsystems not in use here.
>
> > [...]
> > +#include <linux/platform_device.h>
>
> You can rely on <linux/platform_device.h> to yield definitions for
> of_device_id and so drop <linux/mod_devicetable.h> without a
> replacement.
>
> The same applies to patches 6 and 7.

Thanks, dropped from the GPIO, I2C and watchdog drivers for v2.

Best regards,
Fil


