Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E29CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 08:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbFXFjw4n1QivhuWIRmAWtZ9fMtej7RhLcACXFP/i3Y=; b=FxSUuNfcm8tQf8tJIfKvpDbCOJ
	/Q86ILmOwZIq6w66fJw1WMROvIDc16RxOEsUBIEtA/xub2WhApa+OTpZsN2RM1HfNYBAwC8hRzpQ+
	IFC+gVaJay53BD1WC1nxkOx7jGhpB0re6a4aZi9u78aR5ZL3AZ0WpnpBlB6YZbXePZsVJPTZwIslI
	FpU5NAP7xGkwFMtgDZOw7zOm2cMDyiPsTs3Z0CteO8SRJT+MdtunexMXLDpCutZcfsM+PuhqTcX91
	7GgN6p1wczZr/R62WuCBKhZD/GHTqmIrSEwsmXxEb0uX7aAzwK8GOObQ9PuxQ1Z9wlLfmYNd6HG7i
	xo11gtQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeFl-0000000Ckl1-2ZxA;
	Wed, 20 Aug 2025 08:33:05 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodno-0000000Cfq1-0fYU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 08:04:13 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55ce508cfe0so6017703e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 01:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755677050; x=1756281850; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbFXFjw4n1QivhuWIRmAWtZ9fMtej7RhLcACXFP/i3Y=;
        b=OVvOhe7lhwpucczoBszmgqbzjiGJDHqKr/hjal5p5dsoONMdil7GTj9xuM15e5BZFk
         w4ANgTqKLJaBHLDPOTs5jnXVVfEIlUh/7NeDk3ea6oOjswHwxwV3NH689IfPrRx6vURk
         W/iLi0xW9Zh40AZs+AUCCSsQytQ1OqhVPqgRKjDlzD5KejfVwZeG5IwDlI0bLoCAIG/S
         brttQ8eL/wS93aBGixiYwdD+FggUtnxQS7+i19ctTKLfrfuBV/f/eZb1EKCvIZ+xbQ2t
         QQe1yeT6nrZ5L4PfTwvHkVbj/XxUrZV0U/3Nrz7LQx8CDTR2Ej3oC69kzCAmfeNh0a41
         OOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755677050; x=1756281850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbFXFjw4n1QivhuWIRmAWtZ9fMtej7RhLcACXFP/i3Y=;
        b=iUnr0Kw7XbMed/Gl4bAZTVS1S0xpDVZfD2VEWPXDpBGGeDoH5d8JNwA6lPhpuZP0FE
         4h/kCUxkLHAr2Gh/QUacYtUHOobbjfvKikmw9kv74I1ukHiI4zywWOou+Rizk+UL6rSI
         5f4V8ZltH5p4PXlYHShMQsJVE7x3IEraab70Q09QmQOU9hQ70DArS+VLOSfLAPIfe+Xb
         xb/JXpHu6GLdcJs/mAYA/lBSZJXV5CXmgDoNAELjBCV+6jzv39bE687k1Ms6vV/D2LcA
         RP6/naYuI8BJs63tSIIDQG9X720mT5NUXQ72k6RZMAXTODtj82Ul/r206L1A5Fc+r14T
         UWkA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ0DJg2w+HWCIXzxM167zM1G19jToBsPKBb0vCskKHkr/NBjtnHRA9oPnNo901pQMdsarA32HsIcEL/I8zH9o5@lists.infradead.org
X-Gm-Message-State: AOJu0YxMfuM+/fl8uuVHKo699ss827caMe5lOFGCOv0v0vPNiObm7o3m
	pjVhda8N0P2PHnbd1jO2wMHoIqhMrrRF1xYMVlnGPon1EwcdQ51A3V2rGFJhX5lf709dWf+B++9
	NjgjNxGzvW3IwRLSmZDxS/IFH7/q5DBFo66T3a4g=
X-Gm-Gg: ASbGncsyU5I/g4EPPmqMSetNNmu/Rxuf9g3TgNEkoZiYGBDjaJn4qyrnvFh07s+YXSe
	zfq+yhOenpr9KCVYLHuS9W51JDC34tgnPA/UAtVp/KGrQSD9rcnGb23knfLy15jrCf9BO7qgMQ2
	JD/BdNC9D+wVTCKxTCr/s2E/mkVqIzlEhsOhLyG/h18jSg5rfIgEcBhY6wIwddRBUhErtAGT7If
	x2x3m0aqMHKMSEBtbAza98qnino8kAlQWjoslcVWegJuKbbC0dJJQ==
X-Google-Smtp-Source: AGHT+IGVK1oPtxH4WR1xR8qF9qbjjy/dcR0lYEGwtgT9scAs4HhXg+zq6box8q/WjPnqcqOrs9UAS7T3jjVlqulmz2U=
X-Received: by 2002:ac2:4ca9:0:b0:55b:732d:931 with SMTP id
 2adb3069b0e04-55e06b2dd6fmr405525e87.12.1755677049307; Wed, 20 Aug 2025
 01:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de> <20250701-vdso-auxclock-v1-12-df7d9f87b9b8@linutronix.de>
In-Reply-To: <20250701-vdso-auxclock-v1-12-df7d9f87b9b8@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Wed, 20 Aug 2025 01:03:56 -0700
X-Gm-Features: Ac12FXwkxxvaSnLooTWKfhclqEnR_RwAuKEDNHPFBz1DnCC5Fudpwl3wjm0bVsk
Message-ID: <CANDhNCqvKOc9JgphQwr0eDyJiyG4oLFS9R8rSFvU0fpurrJFDg@mail.gmail.com>
Subject: Re: [PATCH 12/14] vdso/gettimeofday: Add support for auxiliary clocks
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>, 
	Christopher Hall <christopher.s.hall@intel.com>, Miroslav Lichvar <mlichvar@redhat.com>, 
	Werner Abt <werner.abt@meinberg-usa.com>, David Woodhouse <dwmw2@infradead.org>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, 
	Antoine Tenart <atenart@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_010412_221913_952F47C4 
X-CRM114-Status: GOOD (  14.97  )
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

On Tue, Jul 1, 2025 at 1:58=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> Expose the auxiliary clocks through the vDSO.
>
> Architectures not using the generic vDSO time framework,
> namely SPARC64, are not supported.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Just as a heads up, I've just been bisecting and this commit seems to
be causing problems on arm64 devices, running 32bit versions of
kselftest nanosleep or inconsistency-check tests. Running the 64bit
versions of the tests are not showing issues.

From my initial digging, it looks like clockids that aren't vdso
enabled (CLOCK_PROCESS_CPUTIME_ID, CLOCK_THREAD_CPUTIME_ID,
CLOCK_REALTIME_ALARM, CLOCK_BOOTTIME_ALARM) are somehow getting caught
in the vdso logic and are *not* falling back to the syscall (stracing
the test I don't see syscalls happen before the failure), and the
values returned don't look to be correct.

The inconsistency-check output looks like:
# 5983032:0
# 5983317:0
# 5983561:0
# 5983846:0
# 5984130:0
# 5984415:0
# --------------------
# 5984659:0
# 2009440:0
# --------------------
# 2009724:0
# 2009969:0
# 2010253:0
# 2010538:0
# 2010782:0
# 2011067:0

Which hints we're returning nanosecond values in the tv_sec field somehow.

Reverting just this change gets things back to working.

It's pretty late here, so I'm going to try to dig a bit further to
understand what's going on tomorrow, but wanted to raise this in case
it's more obvious to less tired eyes. :)

thanks
-john

