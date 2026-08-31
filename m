Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A667C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 17:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOcXlRKPdGaWyLXZRmYh2gsjN3nZXYDCKL0Pm8ihJIM=; b=KFq+MfVkTamxq7CAyKiXF+/LUg
	iCNYq+jzdXwFyspeP+/HTC0dN/pqma7cAVIxYa/86G8KSKTXw+uw9SWMqJWNgY3fLgobkWmNWYBLn
	rpi73wdUDQOvAKwHX97dGnW1mOj3EBuTbWtWAY8usIRNrUX7zQEKy4S5ClklA+vMpwRxoHUaV16F3
	mcMi5FttTAOJGJccpxAeAOo1vF7c3qCWwBT9wSO3aOPFd5SZtoQCqfRqEXDwAXn0W/x2JVHe2RUFa
	qfVC4rQ3MaeQ8sK4nTITwhcR62BfMjNRndzVpB0/xkFEjDNoABzHnV5fuQFzXOs1pVJ0ftZ6zOsDD
	rJpY/CUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x163z-0000000AEAc-3neJ;
	Mon, 31 Aug 2026 17:44:55 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x163v-0000000AE7m-19Tl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 17:44:54 +0000
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso26921a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 10:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788198289; x=1788803089;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iOcXlRKPdGaWyLXZRmYh2gsjN3nZXYDCKL0Pm8ihJIM=;
        b=KEFmFo/5gwj+g6uo23mSRXggrUVZcszkDaQdXjbb/DH0oynQmAa0BVff5H+wl/iCj0
         Ad6Qfbk8eMY385CTvW0jzcG4fmUDyw3GJHNRZ5VqzE2ierQbjn1/GVF7ptGhHiW4vSgP
         RAzY4vj5/OvHK9ISd0OUWk3FeZGJa7apYe9hx77ewIofEIIpipzfUZ8njtlrEuec4GtM
         F40L5jHYYa2nER4TYgWo/EXJrTBpTomwUDp4OQxM2R2FQm3O14X5RHmunQu6iyqOdeOu
         WcjojZfbPo2xJfWCnCR0EGiXFVm/h5G4nkansElnJXGjFKiv0cZi6lVhj48YHCPVvfa5
         73wQ==
X-Forwarded-Encrypted: i=1; AKwUvBykX3DuItp8XkuE+sWPLstlR/cH2CU6jy/HiSxGnwPlAnFFsOHKUBZ2FazS0S2HVgaEbAMMmpvOftZfOiHtGljE@lists.infradead.org
X-Gm-Message-State: AFuF++nKvYaPiUBJS2TjT6ConDxhbhU9PHDcgj2qhTN5ufZZuSvIiPeu
	UfnAgUL+/GnG0EAVxGMOQcCZQo1jC/dQS33foL93jzbtVW2+ZIxCqzrg9lZm3xkjpPM=
X-Gm-Gg: AYBFou055LPaV5fSJsJ/1yNd8L0YiV3AAslBHkpd1RmQsGtrf3YooqvdCmaTOdO0s2y
	RMK+F6xato1/cbGylWPMYroXXGhbR/jSOAyFD8DqcgGkDm+PleqgAutDapqNWPw37uRIVo2tHC6
	NNh7krihJvI1ocn7BfiFydyHtGpf5lhdMXdDH6t/0t03OtHxjrfKDtFtyOfGtDDdghO4f31qqAb
	GVY4QCpIvINRMqv3nZl7qyTJ3NNULWX9FnIJBrhUNQVIiSP3YJscV8rWyjPALUCJQ91NKbx2WOI
	PDHmupzGP8nLklndSY1VdTsPRDJBINsahbqcDmXZ2FAVEVv8f5iwYm9YxW1boSIwKPaMNRhq2aV
	gyeVGKOZ/Sp4tsorjhyE/jmHwghnHK0jjzgBzRhoQpNa8PIhbOOxfTKC9pdFZTM0j8gP4E3Ml2r
	q+eg9qlhfePLEkqTNC75Rmx7PBMLCsHpPQ1BPiaI8iUS0lelKjx46g/ok29Q==
X-Received: by 2002:a17:90b:1d83:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-396d1023217mr36121504a91.14.1788198289340;
        Mon, 31 Aug 2026 10:44:49 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3990d7bb7c5sm664546a91.14.2026.08.31.10.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:44:48 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, "Markus Schneider-Pargmann
 (TI)" <msp@baylibre.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, letux-kernel@openphoenux.org
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Register
 clocksource/event only for am654
In-Reply-To: <E27F05E3-DE4F-4C77-95E3-1701B3410E93@goldelico.com>
References: <20260828-v7-3-next-topic-ti-timer-dm-clocksource-omap-fix-v1-1-85f0e4dc6f9f@baylibre.com>
 <20260828230445.3c2510b9@kemnade.info>
 <E27F05E3-DE4F-4C77-95E3-1701B3410E93@goldelico.com>
Date: Mon, 31 Aug 2026 10:44:48 -0700
Message-ID: <7hzey26v73.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_104451_342852_241A01CF 
X-CRM114-Status: UNSURE (   9.66  )
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

"H. Nikolaus Schaller" <hns@goldelico.com> writes:

>> Am 28.08.2026 um 23:04 schrieb Andreas Kemnade <andreas@kemnade.info>:
>> 
>> On Fri, 28 Aug 2026 20:47:45 +0200
>> "Markus Schneider-Pargmann (TI)" <msp@baylibre.com> wrote:
>> 
>>> Registering clocksource/clockevent for the older platforms breaks
>>> booting them. The older platforms have their own implementation in early
>>> boot that is used to register clocksource/clockevent in
>>> timer-ti-dm-systimer.c.
>>> 
>>> With am654, the timer is much more complex with more dependencies so
>>> doing this in early boot with the other driver is very difficult and
>>> gets ugly. Instead it is implemented in the platform driver for am654.
>>> However the old platforms may not register clocksource/clockevent in
>>> this driver as that would break the boot.
>>> 
>>> Add a system_timer_capable flag that is only set for am654-timer that
>>> gates the clocksource/clockevent registration.
>>> 
>>> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> Closes: https://lore.kernel.org/r/2013A99A-0502-4128-ACFA-B04886224393@goldelico.com
>>> Fixes: b8eeeca55456 ("clocksource/drivers/timer-ti-dm: Add clocksource support")
>>> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>> 
>> Tested-by: Andreas Kemnade <andreas@kemnade.info> # OMAP3 GTA04
>
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # OMAP3 OpenPandora
>

Tested-by: Kevin Hilman <khilman@baylibre.com> # OMAP3 Beagle XM


