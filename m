Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDFFCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 16:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DDEYJyH5QFUo14+NzGkdFMpja2S/pLE36Gor4bYTt4=; b=11RLHa/XK+/ISRLM+v3JWomKWS
	9EXJK2OW2cx9XlOQOSiJ2XcjzoambxGhHC7TlF6pfGmf6L3z2dWa1tqK3u3hsBpyLM1gPJ6nwCMoN
	vM6gzIOgLXW27lNb877hSD22C9D7DranXrlFtyRoUNcj/JRspm5ZdXTTPtYT1JAK4Yh8728ALfROk
	mt9Z75iyb8+1lKhy8MUPOY9+1fhj8FzQk0AbmOGV+kyxa4XeBWltaww9m+uMB1+MplMQ3K18M1oy8
	gM0aQvtMWJEC/sXhekdoZedNh0zWeOoEcVNft1RnqFtU9qvPB9gQRftYuWndzWH1xdnTz3LwwlNdW
	1/0e1PGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXLm1-000000086lk-0ICz;
	Wed, 10 Jun 2026 16:27:25 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXLlx-000000086ko-3tpn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 16:27:23 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-36d6bb38b44so4576649a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 09:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781108841; cv=none;
        d=google.com; s=arc-20240605;
        b=HxeEUFL/A3FPExO6JoylruL9jgpyTYAgU6HElbXLkfEVCuaGd/cLg+/xU+F7hIQJ3O
         Eo5LSNzf8+KlytVVM4k33xHSoQg77e4PdcS85lK90SqdpWaqFpmKBmHGwvA+5BR4uTQE
         QT5axAJmIlZBQotNqcMMJsjrASysVWnK3mxWP/iLEYkF25yEK8RaMKHL5kTAG1hjq32D
         opbkLbChkhawb9piPmCg4TgY2cKaoTmhdzG2kBwWUmJzv/YadJUny8UqVNMVFhudvTZI
         5laZYdznxV+ayEnwsnSH/De04x6yQzKK4EYfYhqTXfHLSayPJsS/4YhwrgtUW8XyBvOa
         4A+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4DDEYJyH5QFUo14+NzGkdFMpja2S/pLE36Gor4bYTt4=;
        fh=3nO9xbcodWwnnQBfLnQi2zJ2HFKCdbliCktOna+jeGM=;
        b=H6Ebg8AKLH+HlKrMR+sY4z9XRRC9Cycr5Tik7rPDFs3oy5gf3fb4cmuEcTB7maYos+
         ijBsyS1K2s8OeSrXk2jr1QJu2r8t6gGBl0M+0rA96e6SM+sMU7fU8Wqm4WYkkrOnzQMd
         J1I4jL1zRt9MML2ZdRgDQqbefH7Hv16tfwSB7Bgya1Y79aBq7rxQZ23JhCbm8bMBPv1u
         /CCvFFsLK4IGKSMhb3yh1p9YWLme72+6R1OOQPl17QVpRWgnw/x67C35VDQz7tTd4jlx
         QFsrAMxvW5TvVseSRxXTEmaQI9kPBbE7GyZxCtOgpR5ssD/Qt/p/122c9fSm+NfAQmmh
         Z3Og==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781108841; x=1781713641; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4DDEYJyH5QFUo14+NzGkdFMpja2S/pLE36Gor4bYTt4=;
        b=prTlZ1c4q7uv6ve6gPRTlmhtDPukGftqHf1DShkbWRslz3g3nuobZKww4yQWzTXBXT
         sHiLcwv1e6unWLGkYFXy6Cla4xlWBVZ2jOb/+P2TsMaLPaEHOdJjyDqbekE4dfMy6Jp1
         QRyRgaqHxvNHI1nYwkBNipVIHUadJx0a2Bgsjm30XJ6r9u5WiB82XNPAWvkv+OJ6iSqw
         wxuJOUxjazfiPtZpJFMRmzQka8jnXY//q7BUesT26atBwXxcXw/8JOhr5t+DrNEz/nkC
         kr34SeScPc351aF6m7+5ks93lpsxW32Um24XLYubMAr5bEPdiN5SdJpAETP0WnPniqBL
         H+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781108841; x=1781713641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DDEYJyH5QFUo14+NzGkdFMpja2S/pLE36Gor4bYTt4=;
        b=Uer13kC2jVdIx3ra1Ix49AjCc4/NnSWSZuIXw4vFgQnEKuvrB8sGhJOLYQCpvlwoay
         jveBRq/+UMzC5nOxBtauyHLslR0u6UNEDoR8rRjl25fFXJu9BCnyyxPrKDO1uSToixPO
         HnZqI1WfuYPzq+zNboCHVF1g0WiW4+SvYIdQk9r5DH+BvmXicLKGuJuz2XXctuFwC/Kh
         vQjJ3voAiL1h+qYspfFynamLB7xekJQBCIO9iCCdNvLl4tuKtTWvfS4aDs+0krWMkKeW
         OPUkBjF2RcfD8niiuUxEA5lOAiVXBoFdnM3FNM0c9m5RWiDBIlMGCOJYxipMAnm6uhs4
         9O+g==
X-Forwarded-Encrypted: i=1; AFNElJ86IxBF4dGYdsJHNNFvKYkc9edNwWjHJ6FsGJuIfrvj0VBCnl79x4/r53tEitSzpOFFNskye1iLhBw/qlLAsarC@lists.infradead.org
X-Gm-Message-State: AOJu0YwHbA5j2e5E5xMNduBjrH8kdkVWyPJpUzUkdXlSGsWE+jbjNeWR
	V4+SWvJpl1UfqTkoQpQKYe6cGok89iI7Bosr5jO32Rsnh4KAuP01RYuppNZO723v1dWC/HrE7rR
	/r+vsHZkWq8vUxMQzFfMuvn9VWojtilQ=
X-Gm-Gg: Acq92OFNlmqHZ0mUjyLBWw4Ar5xLw27oX5l0e2xRhqbV+rtrn0/UL6FioAmnUln5hyt
	p9nGpWW74AXXpPQhm6UrSZC62z+gjE9qrEajjb1cET8bv7T5X7fl6hMR6q1f3oMdKrh/BBmvegB
	rau5gTlNEg91QxS3oc0dARJGbu6bKc9GifszepYU7uliYe+OEeilYRCjpb3/FSnSkf+e0Yf71Ww
	lOBLe0BUxm4AuPoE1wQCZ3/iLS59jsKT2+Mih4NmzWF2/IiZNE6GgqKHry6Zi3Dd5oXKcn4YIzo
	LPg/bsDeBXNvB/Sm4Qw99foIPRsb2Z7Cnn36zyfGdGYkEfYeRR+ZDxcP7bnHe3e0PmMirnRXE+P
	7y5bgDg0=
X-Received: by 2002:a17:90b:57ef:b0:366:52fe:e749 with SMTP id
 98e67ed59e1d1-370ee82fe8dmr27418313a91.5.1781108840969; Wed, 10 Jun 2026
 09:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260610102153.83367-1-phucduc.bui@gmail.com> <1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 10 Jun 2026 23:27:09 +0700
X-Gm-Features: AVVi8CdWIBbIpW3MLG8tfEMGIpXySN-LRFKOF8FKPCNJzmWknUgBN9OHls3Pa6A
Message-ID: <CAABR9nGC=f_hO7FX2RnRHLb5D2Tt9=qT_yv-Fv2y32AAoQy+sw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex locks
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_092722_004318_B07C28AC 
X-CRM114-Status: GOOD (  14.90  )
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

Hi Jerome,

Thank you for your feedback,

>
> I suppose it is OK but it does not seem to really clean anything and
> make the code easier to follow in that instance, from my perspective at
> least.
>
> If there is policy to systematically use guard() whenever
> possible then OK, otherwise it seems unnecessary.
>

I have noticed that guard() has been adopted in several subsystems.
Since this appears to be the only place in the Meson ASoC code currently using
mutex_lock()/mutex_unlock(), I converted it for consistency with the
newer style.

Going forward, should new Meson ASoC code use guard(), or should it continue
using the traditional mutex_lock()/mutex_unlock() pattern?

Best regards,
Phuc

