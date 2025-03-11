Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D7DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 14:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVGY1YdKpatvu9ORUu7u/Y2xJ4feOuJRGzkvoJubghM=; b=unILyr94MeaDzq2IofKxb4Pw/P
	vnsc2WHZkNdAxCIxkVyW/tI/3YPfcHrtC16pI06IQIbbrr/tcB3uk682vEM5TtYf333IkflArMZx6
	rgQvaYxR9cX+cT8IDFFXJ2gsBYcGhe3zB8biTiAb9Z73CK02rGR72Yq8s9YfLh5o8tROzVw+5X6ZF
	E86cFSj6ntgsxpmBmuTBeOckmJkLpbdVoPRZDiOmsWHTW5RZlW9fLYAVlnwIM0hI5ESXcQcANbwU3
	FR1a/9nFO1f6wPhg4/Opm8Xhz0JdDDsJPoa+HmGzRQHhaMj7A6vQpckubqJPl06guVwMXtTgO8e9G
	Mw0Oj59A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts0lE-000000060Xs-2kc1;
	Tue, 11 Mar 2025 14:39:12 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts0iN-00000005zus-20cq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 14:36:17 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso4325157f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 07:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741703774; x=1742308574; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QVGY1YdKpatvu9ORUu7u/Y2xJ4feOuJRGzkvoJubghM=;
        b=GmL+93j1wNxnK3FNt28QCddGUC0SxZ+7jLZHHFqt9Jm6uMnhN5mTyaKaiOMCoEfB+e
         qPGG9FaP3rUXXVGhJFric4LgY2cz/qIFvieiUMO1NjVn+Z+uZWztOfqJIupuzMqFG4Ok
         JwOqiERQkW+DXPysmVrMITl3BprZYjJrvU+U4HQKjTY9jp7yHq0LyNNajMGI2m4AxFA6
         ESXBLHtlinysQ0LoywQDXgiG6+bdS7xewv9FQRMJiagfO2WdC9T1/q4UIvtS90Mq4u9l
         t94z3Uq4ECNsB0EjO9plaTFrfrLpzRDtVdPsZaYpnZXkG0HTL9M7hTvN6AfdHqOVbKkE
         OXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741703774; x=1742308574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVGY1YdKpatvu9ORUu7u/Y2xJ4feOuJRGzkvoJubghM=;
        b=s9PjY5dAFKM6ZVYKRaObuo4t9Zj0gsbMxwhdfGJY828DuiQoEenX/agMBCmK0RWPU2
         4V0uOgkswiU4yyAO8z3t/T+eWffSzW07f5ydMbSG+ehCOIny/JFCF8/GYCvrn5cmX9n5
         MMFmdl9AIFu705oflHwbeNMEhYoUS72XFtGHDHf73iGpcTfasg9RCnkVXrOqLZHJgfc1
         i97Xi0s3vVUe3VAdU5nqYyKABgOLAORcoYOSkYZbf51xWHDcqDjvM0Tzz7i6LEKxqbwx
         RNlBbSCZ3VpJ0Zd7zI0+9yQVR3CtqscZZxy4gHS0+CGYrsoTxRr4bRu0w9RuHRUYZw60
         zSfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDlr0UXIhNl2dkD5lHSubaa8/7FT+Thy6uewMI+bIuJnl1iyg2ah7qhH0lLyNdk2RUk3KNdLw4ud7BMymbAo57@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu5iuRVHNljtV/BnXwJYY4iiWsSbK3Yl97N673bUp0/FeC2T/J
	HEUZzfESNQ7UbCX+E3w1zomxZWLX7Lid/x3ffch2GXYKk8cozHcara0qRhE/7gc=
X-Gm-Gg: ASbGncvQFYP+M7CruWVqpKSC4nzwsN+Eusc676fo1v9qCIuG+vJDInq9sgLFCyQdiPv
	HNjyakfbifqfjCHXYi8O38baPmWAfSLwwneqoubKVCWd8rIlJxhJ65DpsP72ndKqknd7JCung2c
	9gYcBKHxMoQe9wWka2vLDInLxUH4KlyO1Crp+UjcEedazJu2U6GDFo1DxzT67mK2l8BA+/nOLIP
	HAqtRXk/U9jdXUeNqhFlZzx9vaVWDd19fG0KyCDCeGtApLzCT6WNp+98tTVsVfQPqVWYlmJtDEx
	AX9bKdnqyoQj7hUtC4p2OBm8VbrUdTnt0bU41aUXmEsW/AJTkjTCVxd9KA==
X-Google-Smtp-Source: AGHT+IErzBNORRKa85qMLnrTIo9THTPP0FLW0fdPXNcjP60zrb0rXKoRA/K5g0/ZRtEM4ho9Q+BqZA==
X-Received: by 2002:a05:6000:1fa6:b0:38d:fede:54f8 with SMTP id ffacd0b85a97d-3926cb664eamr5073516f8f.16.1741703773763;
        Tue, 11 Mar 2025 07:36:13 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfba888sm18559270f8f.16.2025.03.11.07.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 07:36:13 -0700 (PDT)
Date: Tue, 11 Mar 2025 15:36:11 +0100
From: Petr Mladek <pmladek@suse.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liu Ying <victor.liu@nxp.com>, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] vsprintf: remove redundant and unused %pCn format
 specifier
Message-ID: <Z9BKW_06nLAOzYfY@pathway.suse.cz>
References: <20250311-vsprintf-pcn-v2-0-0af40fc7dee4@bootlin.com>
 <20250311-vsprintf-pcn-v2-2-0af40fc7dee4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-vsprintf-pcn-v2-2-0af40fc7dee4@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_073615_516116_A2CA5FF0 
X-CRM114-Status: GOOD (  16.54  )
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

On Tue 2025-03-11 10:21:23, Luca Ceresoli wrote:
> %pC and %pCn print the same string, and commit 900cca294425 ("lib/vsprintf:
> add %pC{,n,r} format specifiers for clocks") introducing them does not
> clarify any intended difference. It can be assumed %pC is a default for
> %pCn as some other specifiers do, but not all are consistent with this
> policy. Moreover there is now no other suffix other than 'n', which makes a
> default not really useful.
> 
> All users in the kernel were using %pC except for one which has been
> converted. So now remove %pCn and all the unnecessary extra code and
> documentation.
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Makes sense. Looks and works well, so:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Daniel, if I get it correctly, you have already taken the 1st patch.
Would you mind to take also this patch using the same tree, please?
Otherwise, we would need to coordinate pull requests in the upcoming
merge window ;-)

Best Regards,
Petr

