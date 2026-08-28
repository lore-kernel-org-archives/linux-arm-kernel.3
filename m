Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA017C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVqcZ6+gECK7UdiJSAVLCAiRAq9LtXJGwIyE/KiuV5s=; b=B5h2EB6jLID2O4UcF4Sa+Y4xuw
	2b6uBujYEb325Q9qd1VEL/ovsI3tYqpPuqMsptpk6gTCr0+pRWUtfF0HmL6bTAmPjfsq45cshPim2
	h4P04BrqA0+zPJUd27H4yGZjTRfi6cwL3CdwU46PplQ6ZdAHiKe4WyO3U1HfSGqubiRCgK4ZPE+hy
	H4Ooj4BxQTXQ0ieBaWZuJMvjPaOwmiCy+h5Z/f0YIF95a6zGvIj636R2aKkEoMacmNq+E3jzo3Ja9
	fuz41Cey5uJ17CzucBsJhA+LtbKlS20es/jO1wO91GRr6gbIafOeqXr7f0ZqQbqFVewoSD6gMfihj
	WfdaNnmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwzF-00000005uNj-3mNs;
	Fri, 28 Aug 2026 13:51:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwyp-00000005uHI-3wK8
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 28 Aug 2026 13:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Subject
	:Cc:Message-Id:Date:Content-Type:Mime-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gVqcZ6+gECK7UdiJSAVLCAiRAq9LtXJGwIyE/KiuV5s=; b=NElUgAqqAvK2C5VpPg6ZJuTWF1
	do6bHCdxHsQdm/MUlDP7RFrkyke46fqwEvikmWlBuwjWInnCxNxCuhPTFZm80a3WeXP1P8/gkWMlS
	X6wF0NkFaPF4t/M8D7+j2pBp20W5s8M9xoSxh+gDPxZstf/D4L/zq3bN6SvI7MsZZPxpXQG2FjnQN
	fIxKXqOMQ/dUjVVJyXIWPP8MmI5M0QvlxBORsQwadCfERde9dLoCo2mFovIUr6znE/K2WIgmxBJWa
	vfey3xZQCRIzBwO5DBfFgLaYbnFD/7QljHpHT8XBCSL9oPvuUfyhHeIniKhnBkR18fYVAc4zUF50p
	qYIposUQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wzwym-00000008HwM-1znT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 13:50:50 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso10173055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 06:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787925046; x=1788529846; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gVqcZ6+gECK7UdiJSAVLCAiRAq9LtXJGwIyE/KiuV5s=;
        b=HQxMlto+0Un83mW32ZaM3WC5HRl0DNFkESIyp+kY7M21a00NlXCmuskini3vnu1PbT
         k1TcziYwuz/4c1gxlWyQWe7ulQBSPTQvIE+Xnhr50GrhM8Y77Am9anqQuuFslPKJeW/u
         R0jEfFq9BauoEGaLByaGlhQESOOcfzVEf6iq6g9+kfGnrFQ+Wu/ptYMenNrvbsVZwgSN
         kafj0xURsKuS3W1FHFKoKmLPopdVZ/AoGpulQKRDtzIe9bMURDgqJRHtnCm3rLfLyx6A
         Lz5ZjojO4T3Kyi9aOJEYVCr5dRmRmxOGFR0zqeTsRvVSR1OA6/gK7luhxhVJ15MKVcgS
         8/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925046; x=1788529846;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gVqcZ6+gECK7UdiJSAVLCAiRAq9LtXJGwIyE/KiuV5s=;
        b=oL30lhYCvYK8Jdr5mUPFpDZyi3UjBhz4NM56+o3+Kr+d76Lty0QtZIYqvlNo9pIqmq
         Iyj2Kw8K/Eme1Ue/NERvEOQskcS9d+m4MR3vZpdvfWWEb01MHBFZ8X1LIqb9qNqlTv53
         T63dW77usM6DqYu2WnjC6O/CZFM40sRawfr+RSSLi0pp1547lw6d1RZ6zIbcAHQdwMc3
         xpoUcEfwXBDNhVsnevyg7C0GYUgpYmEHvBEOSJEiH45Q29mvV13Cjnb8zMCOBvDPFYZ4
         k+bQgj/L8fUKuGVNWogrcsXz8ooDRK0p1vfzMWr5eWJYg/NUnoYbxkzVeuBuXmmVNEj7
         tciw==
X-Forwarded-Encrypted: i=1; AHgh+Rqo4+4Ac1A4tqjGy9tcRD8rcoTYbVc8AKpeew56E+WaTYKtD4xTIsFs8ZwnVS8AJVHy47glSaKfX7YrTw7C4NmO@lists.infradead.org
X-Gm-Message-State: AFuF++nmZ4hWZ4WX5cThM3fVayWKPF+oEKk4GLyCKFvEtd/7pnZ/ALHs
	adM2dIpx7/xDOuJrb70zkdEvJ2b3+BujVdmAkgT3M4u4osmevumAd8HCbRK3+8QLvec=
X-Gm-Gg: AR+sD10/uUFtKvk0M93XgZ/EvV4KHAZqoRAi/bXBlKO09ZGc/n3juOaF8jm/pkTs4Xh
	aknjLuM85GuoKFT8kCytx9J+mCQmQzlgJn3qJg2yu/rLvzvbkGLKLlANBQyXjXAAgUIpr6UNsH5
	Di2H7RZ/1vpNE/fbj/oQuv70QXsTX+701Fwpf1D0moMAIOdWALaBZx6ZWlJj++NRbvRoBTcFGTm
	/w4PYpCitqTp1p9KRJc5JezdpSG+tMNlNG3Yu6bp/HgygQsdOAhlpRRee1bOAPjA2ZKRMu2O2nF
	IzBrOQUXKqUq08Vwvpwya10VdmsVp4h2U9FwSHCPdUDouxUOoQxtUhAXsHeYldMVOkDlQyIlt39
	RN1JchReJItpt2w+erPd2rEoT5x7y3QRiwGk2vIFewYMxPAWl2ji8rzsZWFsQO9L7W6R+D9a9bE
	tGcal8dYueBHO6FTOlDD44q1GYXAJ8alN4T+8AvOeuCFq1a0KsPLX+9QZQ
X-Received: by 2002:a05:600c:a403:b0:49b:924e:9a28 with SMTP id 5b1f17b1804b1-49b924e9b14mr89881845e9.1.1787925045748;
        Fri, 28 Aug 2026 06:50:45 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:489b:7642:1b32:84d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm43176955e9.1.2026.08.28.06.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:50:45 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=130b19770e787f0ec56abe4062c3593d0b0b259124c35d3dc8132e673162;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 28 Aug 2026 15:50:36 +0200
Message-Id: <DL0MJ2ULPZL2.20ET2TL52T7HI@baylibre.com>
Cc: <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Andreas Kemnade" <akemnade@kernel.org>,
 <letux-kernel@openphoenux.org>
Subject: Re: [REGRESSION] OpenPandora (OMAP3) fails to boot since v7.2-rc1,
 bisected to b8eeeca5545659
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, "Markus Schneider-Pargmann
 (TI)" <msp@baylibre.com>, "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Tony Lindgren" <tony@atomide.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <2013A99A-0502-4128-ACFA-B04886224393@goldelico.com>
In-Reply-To: <2013A99A-0502-4128-ACFA-B04886224393@goldelico.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_145049_167791_0C600541 
X-CRM114-Status: GOOD (  23.50  )
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

--130b19770e787f0ec56abe4062c3593d0b0b259124c35d3dc8132e673162
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Nikolaus,

On Fri Aug 28, 2026 at 2:49 PM CEST, H. Nikolaus Schaller wrote:
> Hi,
> I am seeing a boot regression on OpenPandora (OMAP3) since v7.2-rc1.
>
> A git bisect identified:
>
> b8eeeca5545659 ("clocksource/drivers/timer-ti-dm: Add clocksource support=
")
>
> as the first bad commit.

Thanks for reporting, I am sorry for the regression.

>
> Reverting this commit restores normal boot operation.
>
> The regression is fully reproducible:
> * v7.1: boots normally
> * v7.2-rc1 and later: hangs during early boot after about 3 seconds
>   after reporting
> [    3.631072] sched_clock: 32 bits at 33kHz, resolution 30517ns, wraps e=
very 65535999984741ns
> [    3.643341] clocksource: omap_dm_timer: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 58327039986419 ns
> [    3.660430] clocksource: Switched to clocksource omap_dm_timer
> * v7.2-rc1 + revert of b8eeeca5545659: boots normally again
>
> What caught my attention is that OMAP already has an existing DMTimer
> clocksource implementation in timer-ti-dm-systimer.c, introduced by:
>
> 52762fbd1c4778 ("Add support for using the TI Dual-Mode Timer as a clocks=
ource")

Yes, this is the implementation for the old platforms omap, am33 etc. It
runs in early boot.

>
> while b8eeeca5545659 adds another clocksource implementation to
> timer-ti-dm.c.

Yes K3 am6* is much more complex and has more dependencies, that's why I
added it to the platform driver.

>
> The commit message and patch series state that the driver automatically
> selects the first timer marked with the "ti,timer-alwon" DT property and
> registers it as a clocksource/sched_clock.
>
> I have not determined the failure mechanism, but the bisect result and
> successful revert strongly suggest that the new DMTimer clocksource path
> conflicts with the existing OMAP3 timer setup.
>
> Therefore, I would like to ask:
> * Is the new timer-ti-dm clocksource intended to coexist with the
>   existing timer-ti-dm-systimer clocksource implementation on OMAP3?

The implementation is intended to coexist but they shouldn't both setup
the clocksource/clockevent for the same device.

> * Is b8eeeca5545659 expected to be active on OMAP3 systems?

No, it should not work on that.

> * Has this combination been tested on OMAP3 hardware?

No, my testhardware was am62. Sorry for missing this bug.

> * What is the solution?

I can create a patch probably early next week that gates the clocksource
clockevent registration to only run for am654-timer.

Best
Markus

--130b19770e787f0ec56abe4062c3593d0b0b259124c35d3dc8132e673162
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCapGSLRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlM9
/gEAnktWVuwC5R1ZeT01TGPkBnos6X5QRQAPU3SGK1NrzxUA/ilWRihV90+G2v1p
Vs9dDH/wV/9/C2/WgpqhyfA/Iw8G
=UzTa
-----END PGP SIGNATURE-----

--130b19770e787f0ec56abe4062c3593d0b0b259124c35d3dc8132e673162--

