Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10678E6F069
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGN+519eYtZuRigBuYtgvVW5FkfJE2dQGYi4tNlzHFY=; b=en3Qa+de0ZQ03hYK4ITwBe2NCO
	bIAcrLNHz5uW5FW6GJjYSeZeMmlbV+jK008LjixV4kgx97P+3peRmkdPLgl2sSt03YZE462BlJge/
	YQ0kerkUe57NNrbZmzzVOji780FUiUYB2ThaAOwm1OlcVEicOYRg4lPawQtqVd+nQGvwO+qbHVaQ3
	JD/jNnJRqyUeINKAhAEFl9UBLOLXH6JF+Gld279SAiFpv8xl9i+C9Vz5NVEuQMw10/3JSTlXm4BNf
	GLAMqgInOeu+RTo2YjXq3irKU1jjo+XyaLtLUTXdL7xr/lSGgL4Umhivx1yecWqORoW7pPkQij5C2
	HAskp9tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tkm-00000007XUE-1rz4;
	Fri, 01 Nov 2024 15:40:00 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tgR-00000007Wmu-1FgX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:35:34 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20ce5e3b116so17526925ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 08:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730475330; x=1731080130; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FGN+519eYtZuRigBuYtgvVW5FkfJE2dQGYi4tNlzHFY=;
        b=0o43+4olSf8T3daYBkHp2vQ5nt2I5PlFUf2yUItjnvQASwrfr1d1f+xyxLTxUT7xFQ
         T4CxOEy2h9tEkzonCNvVyCxZI+onONROORYdbhq8KwgNdOmr+Qu0sCLpkZJktOgAcCKn
         6iwnAj3soZV+theA9r9bEwwNwi23PNpG53IzlzJj6HFMTIA+YbzfAjGRB+0sUTGjRQjQ
         ZxUJVbwvIlwQ515WhFHlNu76mQ8KFbh8dilAxPZY6tE22q6nY3fTW2CHJ1G9OfUjYrV/
         Ce5uOTvifWDRZ/+YMfCqEN4S7zQexjWpUBOVKQ6DiFfC/Cj6t/mz8qwRHnBSUN/jiHMH
         UWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730475330; x=1731080130;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FGN+519eYtZuRigBuYtgvVW5FkfJE2dQGYi4tNlzHFY=;
        b=As3RXthCNaQDJzu9oaa3HsU2jh2RfFfbIFmctw1HwF6lJ6msuH+u7BZng03kh0u9cU
         lHcWX3d43rPbDHLegjnujJudCg+mNsi4XRgZpwdA1XwABuGzxjzu7fm079ZtnOe/2Byh
         3/dpvkH4/EVSeNb/NHyiTK8QEBYMxZysQN4wQjJNJchB74L3KBnd49ejWL6PWOtfsrE/
         8rzM7yOtWG9LOlWO0ecxUoHCmrmbyP5yuwg1qyLKAXNNcA/4tS874QhFcjZpX0LVvD/r
         InkyrpJezzZwQtvpew1EgqRxZuo43GyG81HRWI56kREQ7S9imkudokpywIlHcvclHWeK
         KRQg==
X-Forwarded-Encrypted: i=1; AJvYcCWVZhRq+wmDojLGmuZUdT6HVk0XniP7/xSFNeSfhKUpoTp2xH2xI+dfALeevHQeZG5p9TLN6AI4Gwzc/7rQZeRc@lists.infradead.org
X-Gm-Message-State: AOJu0YwF+Dien1kaVs4yX+qwkTuVitCrBQGYnJfBT6kf9oqu0ibUY5H3
	IeGLpt7Q/3MpQIp5e/C2NMKo7X0uvfaCrU1/ieDY8Mw8COIOnWsdOmNgzcHegXk=
X-Google-Smtp-Source: AGHT+IHdRk4WtBzIprISHrwlWueLoJHqAZ0Hi3OqocknTJdFlMfcN7iB86YkUJpngGBacYjvD3vJvQ==
X-Received: by 2002:a17:902:e74d:b0:20c:7898:a8f4 with SMTP id d9443c01a7336-2111b0276a1mr44569875ad.60.1730475329852;
        Fri, 01 Nov 2024 08:35:29 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057effcdsm22717175ad.302.2024.11.01.08.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 08:35:29 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-pm@vger.kernel.org, Vibhore
 Vardhan <vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur
 <a-kaur@ti.com>, Sebin Francis <sebin.francis@ti.com>, Markus
 Schneider-Pargmann <msp@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] pmdomain: ti_sci: collect and send low-power
 mode constraints
In-Reply-To: <20241101144445.56ejnuoxshqwns37@boots>
References: <20240906-lpm-v6-10-constraints-pmdomain-v4-0-4055557fafbc@baylibre.com>
 <173029317079.2440963.17313738472826934777.b4-ty@ti.com>
 <CAPDyKFptHq6xkKSAmeHsEuhBoEhzvudcMf2+nG08MFPwnMi+ew@mail.gmail.com>
 <7hv7x9qsvt.fsf@baylibre.com>
 <CAPDyKFpdgg+kM_Ot5GPTpMUtjmBF-pUhCeRpVb=j852_7qm=3A@mail.gmail.com>
 <20241101144445.56ejnuoxshqwns37@boots>
Date: Fri, 01 Nov 2024 08:35:28 -0700
Message-ID: <7hwmhnnf0f.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_083531_643123_C698C120 
X-CRM114-Status: GOOD (  24.96  )
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

Nishanth Menon <nm@ti.com> writes:

> On 11:11-20241031, Ulf Hansson wrote:
>> On Wed, 30 Oct 2024 at 20:43, Kevin Hilman <khilman@baylibre.com> wrote:
>> >
>> > Ulf Hansson <ulf.hansson@linaro.org> writes:
>> >
>> > > On Wed, 30 Oct 2024 at 14:01, Nishanth Menon <nm@ti.com> wrote:
>> > >>
>> > >> Hi Kevin Hilman,
>> > >>
>> > >> On Fri, 06 Sep 2024 09:14:48 -0700, Kevin Hilman wrote:
>> > >> > The latest (10.x) version of the firmware for the PM co-processor (aka
>> > >> > device manager, or DM) adds support for a "managed" mode, where the DM
>> > >> > firmware will select the specific low power state which is entered
>> > >> > when Linux requests a system-wide suspend.
>> > >> >
>> > >> > In this mode, the DM will always attempt the deepest low-power state
>> > >> > available for the SoC.
>> > >> >
>> > >> > [...]
>> > >>
>> > >> I have applied the following to branch ti-drivers-soc-next on [1].
>> > >> Thank you!
>> > >>
>> > >> Ulf, based on your ack[2], I have assumed that you want me to pick
>> > >> this series up. Let me know if that is not the case and I can drop the
>> > >> series.
>> > >
>> > > Well, that was a while ago. The reason was because there was a
>> > > dependency to another series [2], when this was posted.
>> > >
>> > > If that's not the case anymore, I think it's better to funnel this via
>> > > my pmdomain tree. Please let me know how to proceed.
>> >
>> > The build-time dependency on [2] still exists, and since that was just
>> > queued up by Nishanth, I think this series should (still) go along with
>> > it to keep things simple.
>> >
>> > Kevin
>> 
>> Right, that makes perfect sense to me too. If we discover conflicts,
>> let's deal with them then.
>
>
> oops.. I missed this response. OK, I will let things be.
>

Oops, 0day bot found a build error in linux-next when CONFIG_PM_SLEEP is
not defined[1].  Need to respin to fix this.

v5 coming right up....

Kevin

[1] https://lore.kernel.org/all/CA+G9fYtioQ22nVr9m22+qyMqUNRsGdA=cFw_j1OUv=x8Pcs-bw@mail.gmail.com/

