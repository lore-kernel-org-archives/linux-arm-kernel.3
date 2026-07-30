Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFDAC55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiODsEReZFxde+7AXbuA9TsINgA6XK/L0TB2Iycg95w=; b=uSef73/HTUi/EqgRT461JaAdMf
	oOHbmAUCM162RVnN9XDv47MUpmQxGOQeEvsuwfYJn4BdcAKLhDeslqecZkdRJzPawV60Prte3c5D0
	W2BZNRSDqAtpd7lQ/UaPwRMtOHhyTUmOoslCSGl12HLC4l4g4Xg1L1zx7qN7MYMJeoNcdzGQ6SxEM
	cm50H6zUWbpcSr5WatCcOjzCTGxsJX1PfVaLpvOO0IxPpQrlZtgYFSCeKMxC8fG8a7SiNT1PRZiaT
	y09assLQ9/blT0AkBhWB5q5U7/RdvO9/fkD6/wEqCtWYD8INWvnEabDpxuy7N6LRkFCApCG3YVyer
	DmKfIATw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRl4-0000000AkRY-2dfK;
	Thu, 30 Jul 2026 14:29:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRl2-0000000AkQr-0AKB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 14:29:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49550ec592cso5252835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 07:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785421749; x=1786026549; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BiODsEReZFxde+7AXbuA9TsINgA6XK/L0TB2Iycg95w=;
        b=ZOEzSPE3HQSHMdO92xJdiwDusOkEwJ7UdOixBuULiTqDfhoej8g9Ug0J45Pt4hWkIk
         /hEbilIZG33H5Pi9HfOtFKlO4rRisLH61SGI/r8CATLVt1Yj/NstxDMzHsvDUsr8KSa9
         0VlqFH/DCpchStIbjLoeT0wRCzH4X0VYlWTKwygrZz4vf/AQXSVfA5ZaiPHXcN6s3fz2
         jPPlzJrBGNS7CxQvlIghYTm5VY7HqTv10sgtVy61cf2SMQxurlb1PEx5AjzIjyiJzPsS
         6od5oEl8dJnywk3x5MBkZDGM+z4l+2lQy7x25rk7CepRpIDdCD4ktAZUFJiE91a/QFWu
         z7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785421749; x=1786026549;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BiODsEReZFxde+7AXbuA9TsINgA6XK/L0TB2Iycg95w=;
        b=WGRODgBDzVMBxef7+nWn4PQlLilcW0wBmyu+GjjQ8VjQy0pcJzRMM9q2d+8fIksnBu
         +pvFwrIPTgKzDCTxAAoRlnyU1qgfnQ3L1w86m/LuMTMuAUAWhNwQlB2u7h6EMEOBCXvx
         DAguka28ZZLJQwZ5Hau6mbtnHCBFehk/sIivXewtfeiqgkwJHxoeuVwV5vb4/i8YXhAh
         vTpweNHGz01utromv/t2FBH64TRRlGETfHdknMQKfp+AzGAiM2AwOlL7LE5fn18OYT2E
         IUdyr3mnqS61Hq/RK2r3f/f0aF4aETlD52M5qcibyhilW110iUFuAUi5WXR56Mq0eZkh
         YOQw==
X-Forwarded-Encrypted: i=1; AHgh+RqkyrS9TkFnlh0x3ufB5waHCMoMOnzvTpgbzegFFISgFlO8J8dCrdg164virVIrcjTwB1LVdHTp9Y3xubhUR8zu@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhu7Zw0RXsobG5qASAQW2okoHCGWOXAL6r2oQMlx7WubTovXFX
	B5SHvDPR36VBLA8rDQyQSeUouozKMMjgoN/AP00fT1VP3hBFrtDSrsvja0FN6/mqSPKrfw==
X-Gm-Gg: AR+sD11CmMqrvJHPVOBeTplE8W3/f+FwebRzTwSD9TpP5DViwa98X4Jf5y4bq4xpkn0
	GbdN/7+5x4XDhu7/SNdd6rUazqgpTetU+ZEQpf2jJdu7E6s1jusBiPpn0SsOINbwYRBaqzVln78
	G+DhFT7erV+OC0OIEl1KsOmBaZk0X7aq2MwrVV8RzLzZUkjPujfohm99xmfWORcIkUzFgfbYXiN
	BTECyZA+DhI4NCKCb+WOxG+Zj8mjO5rQ+WbsKLUxZfGMsoLiw1ErEQOuI0hCd02uSQZF4Ssa8MQ
	lcjCFvTzp/1BLOe8bN6vPnX/eIhnpoZD6aPz3b2WUaKQcMsCcQsv5LG/YYbk4TY4nl8eECG45Vf
	oZc2hlpuRfJyrrVfJXcx4GULfrDoP/X76c4TwU+MIVc5PlH8/2JtUZ0wOlK6va+VLP3n3JQz1IQ
	lJukfb11SzOEocsfPgWS1WnQd2deT8kqCWnoJonSWLtNqvt8e9uT6zRaMgCDije/VB6Rq4y0CG2
	ZGlxKLfFKZiFIjOKUb95wCD2F5XwIvKinI7s6mZaKjz8Jw2chaNfQqJsngONGwg0si4E3Q9xQs6
	qsL5DkzVRkgCdPc8JimWfLnWemYqVOVT9npOPq4uTd0EuGhL/GQ8yp9+FKVxtYo+5vCkDnH1kMI
	IP7iOtfUBpq//oHZgV7RS3URVdbzPnYd/wIN7iiizKxD0VBLbHI+fHzCPoowIBouvkWn01Bk=
X-Received: by 2002:a05:600c:1551:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-49804c8f0d1mr8791095e9.0.1785421748939;
        Thu, 30 Jul 2026 07:29:08 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010aae15sm66472515e9.13.2026.07.30.07.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:29:08 -0700 (PDT)
Date: Thu, 30 Jul 2026 16:29:07 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, David Lechner
 <dlechner@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH v2] iio: adc: bcm_iproc_adc: Convert probe() to use
 dev_err_probe()
Message-ID: <20260730162907.0000588b@gmail.com>
In-Reply-To: <20260730140405.369634-2-mdshahid03@gmail.com>
References: <20260727034009.5c6b0be9@jic23-huawei>
	<20260730140405.369634-1-mdshahid03@gmail.com>
	<20260730140405.369634-2-mdshahid03@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_072912_098760_DEFD51DD 
X-CRM114-Status: GOOD (  14.24  )
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

On Thu, 30 Jul 2026 19:32:45 +0530
mdshahid03@gmail.com wrote:

> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> Replace open-coded probe error handling with dev_err_probe() for
> resource acquisition and initialization failures.
> 
> This simplifies the error paths, avoids repetitive error handling,
> and automatically suppresses duplicate messages when -EPROBE_DEFER is
> returned while preserving the existing error messages.
> 
> Also remove the redundant error message after iproc_adc_enable(),
> allowing the error to be propagated without additional logging.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---

Hi Mohammad,

Please don't reply with a new patch version to to the previous patch,
it breaks tools like b4 and appears weird in people's email clients.

Since this is just a matter of resending, please send the patch again
(not replying to the previous thread) with the tag [RESEND PATCH] in
the subject instead.

Thanks

-- 
Kind regards,
Joshua Crofts

