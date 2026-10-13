Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D7CCA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 01:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQWCS2dkzE8iTKDMzcf15gZGdS0SUXomK1lT+byEss8=; b=xtIabo5RtLo3ODxANwZiQ+ELiI
	9VBnpTil4eUrqxeEFXZEtog8zwwi1SHPoLZrBZ2FhV+FaCWe/dYOeqio9qyMgN/mjfaWpaAVBizyZ
	Tgp+Ga3Kj5ruimAQhnl2JrwQZ5kUkEG6Pt0TUPZTmC2oEX0no1/nJd14eLezMIYsd1DRSvWw/fYjs
	4yWGtOMYcIlmAneORe1hQzl89b4trYYVMnCyAufmJSjBC90dK7LCiPUx2LheYT2Jrob85SKSIu9+6
	QlEgdm+hmMGx0Fo64JVZlW8mL/RH8HLSJXSLaiK9UzjUDyvKfrYlX0Ma/Vd/WmdaM7YyP/oiWQ+1U
	hisDYzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGR1g-0000000BjrG-1Wtw;
	Tue, 13 Oct 2026 01:09:56 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGR1d-0000000Bjqt-3nRt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 01:09:55 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5ba3fba0080so1518880e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 18:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791853791; cv=none;
        d=google.com; s=arc-20260327;
        b=ed9l0/2RRAcwdLfMAzF0d/5U0hBugRAO4/4Knc2OC00GzfEmtf4XQfK2XOMQx3Bv6S
         B+N2ZIp2+ZEHfq+P3tMrqJwVepDbh3Msy+z7U2PooUb6XF8xVnd/mjzRU3ERvgjM0iX0
         TE+m4z7W/RU/4ev7tFg/YuAU0CZkUq1Wj/kwx+PmYxodpuysbb+1xA97ZHdTcRm/zXSM
         AzhViRfo92rC7rdOUGu4nKkKfvX8qIiBhcQPAy5HjpkvfDxmqUunxsKVZn5g3UTT+yP4
         Mqx65LnbzFxEicwtde+XpTSp/2NNnWEWW9j62UgQPo99Zrl6xr1YsBpk+IhN+wo9vrzz
         cIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TQWCS2dkzE8iTKDMzcf15gZGdS0SUXomK1lT+byEss8=;
        fh=gKC76qrLI1mVCmJ78+4etGyYF+NHui8AUkGR/9wVhRU=;
        b=VZsKFa/iYdOYYZkrG4MQdLXD4CL5trGZNHrkVSv0KHi3j8g9f1Ic7eYPg/qKozbe+6
         yZ9Ryf1JDbNr2qrFCFaKIcBcAAHX/u3uEaLEbg1Tp9i3pr3Vh82egQFkNW9xMYiGHhyl
         dIaFg/XKx/g89VMxJ33HV3MmJsjgsFfi6jDwjqrJ67lnTLf8HhgpujLfWbzcUyZldLF9
         3BLu/sZY3hlwJKOg+3y8aloxMWNjA963EK8bujOj3linYb9T2EvibBEYCMMFXN3QLPFx
         C+VfhJVSnYxLmfeVp/eYAKELkOxR5f6YlH/ParNbYLQMEq25ihEm+DSZ6xqcXwvqFOzN
         JZAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791853791; x=1792458591; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQWCS2dkzE8iTKDMzcf15gZGdS0SUXomK1lT+byEss8=;
        b=dhtc0H731c3/cH9DbqYZkyYigN8xF5h1pv1olZXdfx7oAmEEVulQEOX0StRdcXfCmW
         TaGVowhn3AIClA1E0OO76/spNsFkM0tDadYwpOyk4EzlNXKKnOHtfeeR7r7+uJypjdL6
         6EaC7pnabR/0HHjKkWy065BStA729BGiYeDfMo+JzGEbkY4R0KtzjD6ob+/35ECpXbNR
         ZxqTdzsMEzhsk82YdBLlJcm3dn6ZMFPWJBXZUcw6AI7la8GDwYT43Uyt6CUU4cHdBXqC
         zUVC9edCf0o+WR6kP1NaI3KD12tKscP9CYKP5mwZGmjCm23lHkGcBB9j5Q5GikJdI2Ty
         6I5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853791; x=1792458591;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TQWCS2dkzE8iTKDMzcf15gZGdS0SUXomK1lT+byEss8=;
        b=JOqlJp5/qfS3g9UAUG/XRrVgvp3lufpGhKtT5ojDLFcIT4y4HBfgJdvqVVOzqNRDao
         Sc9wM1AYttsJ24B3c5hRyB7JJjZGpZtVCLxJUfQphEUzNDSinlzOGfw5ET0fX1H6wZhr
         5Z32xpTz77rP9tLKdq+zBwvg9rOKpN1AKV2P0c+Ms3804UhA29EeJ7GYAXlKrEQuLsP4
         EO/xt1x3Gt33YP+8rxZZe0jfMftaOvzZf4pbdoAUWAUNXD5sSfUk42KuSxGcRKaCaJfv
         GijVv8ZrTnWSonjpKm5taYjGlBOOackPGjdu/wZ7swLvniiMChDJ6iXuvEp/UrgHTexY
         8T/w==
X-Forwarded-Encrypted: i=1; AKwUvBzXtQ7ywsPksiuBK4jqmdxR2/KKsMfmeRg6vb2jqG0bSFf1zDqCNSUM/9G6ZuI1YGFQs7n9aGoJXBWlxZDCn/Oy@lists.infradead.org
X-Gm-Message-State: AFq9FYK7gBqTrd8cydA0TYyLZPCpY6e7Tx0cJ5WgBXtFuIuPMWQQQTvY
	EQJdEZx5L+L4FUvfoptpTYs8fq1itlO7sPsDHQGmW8wHYzxP98mwC8xLgNovyUx/WH0bj4kEiQt
	HxqiJ/sU4hB4eyaRq20etBHa2vbkpl50=
X-Gm-Gg: AYBFou11tT810bkd7r5iFLFEHqIiYwOoG+hBp2v3I+MnCHcgAVzu5T3p2My0IoOz752
	ixTRmnsZsNu3MMmDMfji49oytV1cDljZIY/xxNb11Vc36ow+LJGzyWd9nmL0HBAFho7f9Q8jE74
	yG7Lq9EcybBSrrnnCNNa0JdGnHVK5xRq++sOAU638wiyShrmAK9xrr8iPSTx4MhoAhnpCBNuZn9
	FEA4pr5Hizn+qi2T6raRsEKSnsagNTHO+XpkcTIP2+iN12RicyfMSfxErjPz5kVxwxEOlD2aud9
	xIxKzMfJPvc1i0HDGF2Ypd96XHmawFeHcAFc4YPVAmvp1iqoHCAbbCdehlZK9hKm0gtvGyI3Gs3
	zo49TtAQKeA7AnfhKUE3e+NkPpmtjhtcccMDwdN6UP6ke0t5WPCAifpfjyVjZ9pIEBT5bFg==
X-Received: by 2002:a05:6512:3d8a:b0:5b8:bc5e:b58b with SMTP id
 2adb3069b0e04-5bcde8e872amr3334571e87.67.1791853790708; Mon, 12 Oct 2026
 18:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20261012230527.750567-1-aaupov@fb.com> <20261012230527.750567-5-aaupov@fb.com>
In-Reply-To: <20261012230527.750567-5-aaupov@fb.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 12 Oct 2026 22:09:35 -0300
X-Gm-Features: AclHuK90-dNnoxwZ9xm_7cAhII9ZWo6vVER80Mmoo8VfMl8VsyHGM5XUC-R765U
Message-ID: <CAMAsx6cvv6XZY=LdayuEvBAXV3NN09Ru0KCcdaufscCtMeXoJw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] coresight: Add pmu_pulse/extout_pulse
To: Amir Ayupov <aaupov@fb.com>
Cc: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_180953_997657_B7EFA6A2 
X-CRM114-Status: UNSURE (   9.53  )
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

On Mon, Oct 12, 2026 at 04:05:23PM -0700, Amir Ayupov wrote:
[...]
> +  perf record -T \
> +    -e cs_etm/pmu_pulse,aux-action=start-paused,timestamp/u \
> +    -e armv8_pmuv3_0/cpu_cycles,aux-action=resume,period=1050031/u \
> +    -e armv8_pmuv3_0/trcextout1,aux-action=pause,period=1000,call-graph=fp/u \
> +    -- ./workload

The CPU PMU name depends on the system: armv8_pmuv3_0 is what ACPI
systems get, while on devicetree systems it comes from the compatible
string, e.g. armv8_pmuv3 or armv8_cortex_a76. Maybe add a sentence
after the example, along the lines of:

  The CPU PMU name depends on the system; the available PMUs are
  listed under /sys/bus/event_source/devices/.

I applied the documentation hunks and built htmldocs, no new warnings.
With or without the above, for the documentation part:

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel

