Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E049E77184
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 15:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//mDW/gsbivh5WLVGk2+QEkus5s+/UGSEuoa5vork+c=; b=XS48LhT8ASirmL2YIjPk/pdun6
	NQr06eNcv7XKdA36Ca4jGM+sKJtUgL3cIE3b0TsVAjmxf+27zG7A+wG16IRiX3j5mlMJ1oGHCkfKa
	lJC1VXqybTc9eeofSjItYsZQtpvKAyh+0OQ51o9caSARYwAN7ZbmB05c3taPQmTY6bcbjOIS7XcEf
	VlfGM65AgrzriWGEes7X16KYskHmonZZfejVHBmRHAyNSxANTVZ/DXzNRY9q78cOQ5/gNIBPog7dr
	x6rHvvUrMVOdTLYqkYWe5/8K+5YeAQQktRdkA+lYasJdzRi7Tq1DTodhQABYdNJ8+VTOmCnpCxpAc
	edt+cMYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOsY-0000000FItp-2hFa;
	Wed, 11 Dec 2024 15:43:58 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOqc-0000000FINM-0MfI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 15:42:00 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20cf3e36a76so61472665ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 07:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733931716; x=1734536516; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=//mDW/gsbivh5WLVGk2+QEkus5s+/UGSEuoa5vork+c=;
        b=Ay7NCdhS2LogFSsQVxGpXb3/1roqEe27GnK29scIN18IJsUVKzOEkGp4DjxH3yvYYb
         MMoc8v+4DYwUjhaF0EWJRGzIJF/SDEzombiTBkSj69Nslxpjh0g3uFNzpp+jI0S0f/xx
         VtE4htgCTABnZ1jkrts0PZWDQjZbj8J8+4CIzALx339iUSR3qBr37v8lHC8xdfunv47L
         9axlx0FtpLyTrabS23V35FxiNhCOcCztS7mGMF588s0Xc7KtxX36JVF/zFjM6hAvEJr5
         sHEoKPz9L63SDxPLkFRbRxrI5Clvf1mBX2gYQpAFbsVmMmhhrjZgcs79vrZFjSBjToJS
         CUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733931716; x=1734536516;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=//mDW/gsbivh5WLVGk2+QEkus5s+/UGSEuoa5vork+c=;
        b=eksUqdaUfJHeplbtt72bjPvDqJBMa28JtShYN+TaYdC0OVIzBXG0ojDS+sXg1dF2Tk
         l1wVK3IYGJgbdylLG4tuIcLbvqvpOSW7X1d8iNdpiF2njL336uF1tx4KqbeZy/N1ZNKD
         gqjZ8eUsK20ZW81l7AffjRRfSWrFsWPVKkRXJv8TAk+upDWRbWe+jMx2Dar18InAfQC2
         Ybi1rQ09hIJq0qD7PNuFoqvBKdWklY5KFdkdd5qnDS3rs0jQUPoTJRt0fNXEz/z356hf
         Q+ZidP6qxWe1vQOwcl5CVuUizUz8zXUXWb2j6RDz0LcdCT46/GuHCFfAKHOInNywTq8H
         UwFg==
X-Forwarded-Encrypted: i=1; AJvYcCVHHhtdVU4Fz4+bQeSnemihkfHcert5OuqhvCfp+Y1oyoS3mAcX3Z353EVlukbihanVHdnIx85FrTYHUiXlBN+Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxPB7GZBzrsJUKHgo2j1Xyzx2xdYCj3atmenQEh4VmvAbiyMeGR
	NfhkwVdu4vw7mEhaMoP+c+x+XoN3G7RlAaOdH9NK/Ew6s0JEW6KrNObEYqyxLwI=
X-Gm-Gg: ASbGncvUu/naR8c8ZI8NPhq/vPpTov/wol9iCSC7YybM5G0EJvvB4UWqbOsdO/I58+C
	LHKoWShDQCw/jtFawqbxSAMk6blaU0K8VA453ZouEyO9GldLkUvPsEoPyMrFl0VuHvuxD5gictr
	KMxK54sciOP+BvyLN3HqlrXQEJ2imppZyamEfuF757RfcP4M0MwXcfynXf8dQRhWqdaj0RMIxks
	waSy4MHTVg/YIFpj7ZtddyxUrpPwzALK+n8qqeDQsLlSU87QCx1
X-Google-Smtp-Source: AGHT+IGgFiqQwkckid54v7HaXWCbBV/jyXAb4y5c25/cFVUIUVFXXoOTd9qO/0TbDhMvaeZjSbFGWg==
X-Received: by 2002:a17:902:cf0a:b0:215:854c:a71a with SMTP id d9443c01a7336-21778532306mr57358265ad.34.1733931716599;
        Wed, 11 Dec 2024 07:41:56 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162e21321asm74338275ad.279.2024.12.11.07.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 07:41:56 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-pm@vger.kernel.org, Nishanth Menon <nm@ti.com>, Dhruva Gole
 <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Sebin Francis
 <sebin.francis@ti.com>, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] pmdomain: ti_sci: collect and send low-power
 mode constraints
In-Reply-To: <CAPDyKFo9N8M73Z6Ltsbnd-WR-jYAqBedAHndViSD7YaKKYgBsA@mail.gmail.com>
References: <20241206-lpm-v6-10-constraints-pmdomain-v6-0-833980158c68@baylibre.com>
 <CAPDyKFo9N8M73Z6Ltsbnd-WR-jYAqBedAHndViSD7YaKKYgBsA@mail.gmail.com>
Date: Wed, 11 Dec 2024 07:41:55 -0800
Message-ID: <7ho71ifcqk.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_074158_330570_5480C0A4 
X-CRM114-Status: GOOD (  20.55  )
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

Ulf Hansson <ulf.hansson@linaro.org> writes:

> On Fri, 6 Dec 2024 at 23:13, Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> The latest (10.x) version of the firmware for the PM co-processor (aka
>> device manager, or DM) adds support for a "managed" mode, where the DM
>> firmware will select the specific low power state which is entered
>> when Linux requests a system-wide suspend.
>>
>> In this mode, the DM will always attempt the deepest low-power state
>> available for the SoC.
>>
>> However, Linux (or OSes running on other cores) may want to constrain
>> the DM for certain use cases.  For example, the deepest state may have
>> a wakeup/resume latency that is too long for certain use cases.  Or,
>> some wakeup-capable devices may potentially be powered off in deep
>> low-power states, but if one of those devices is enabled as a wakeup
>> source, it should not be powered off.
>>
>> These kinds of constraints are are already known in Linux by the use
>> of existing APIs such as per-device PM QoS and device wakeup APIs, but
>> now we need to communicate these constraints to the DM.
>>
>> For TI SoCs with TI SCI support, all DM-managed devices will be
>> connected to a TI SCI PM domain.  So the goal of this series is to use
>> the PM domain driver for TI SCI devices to collect constraints, and
>> communicate them to the DM via the new TI SCI APIs.
>>
>> This is all managed by TI SCI PM domain code.  No new APIs are needed
>> by Linux drivers.  Any device that is managed by TI SCI will be
>> checked for QoS constraints or wakeup capability and the constraints
>> will be collected and sent to the DM.
>>
>> This series depends on the support for the new TI SCI APIs (v10) and
>> was also tested with this series to update 8250_omap serial support
>> for AM62x[2].
>>
>> [1] https://lore.kernel.org/all/20240801195422.2296347-1-msp@baylibre.com
>> [2] https://lore.kernel.org/all/20240807141227.1093006-1-msp@baylibre.com/
>>
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>> ---
>> Changes in v6:
>> - fix build warning on arm32 when building with W=1 and CONFIG_PM_SLEEP=n
>> - rebase onto v6.13-rc1
>> - fix latency units: convert usecs (PM QoS) to msecs (TI SCI)
>> - all dependencies are now merged in v6.13-rc1
>> - Link to v5: https://lore.kernel.org/r/20241101-lpm-v6-10-constraints-pmdomain-v5-0-3011aa04622f@baylibre.com
>
> v6 applied for next and by amending patch1 to deal with the sorting of
> include files, thanks!

Thank you for the fixuup.

Kevin

