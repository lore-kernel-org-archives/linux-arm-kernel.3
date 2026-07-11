Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADEBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 05:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qesMdHKmyxw3NJ4a67qnIHpz73OEBeBHn6uWkzO1uyM=; b=bdvygiOl//vY0IU0pvueSeG7lR
	fdNN+EDqHy5OjItIJMsFNk6dzexVIsqUydg4I29J6LLUQQBkkb3DBfYAPJcMoaE+YcXwJZdEQuEiQ
	UbUN8azYb6fa4RyFs/MfFEkAj86iCPN76rdGlyT8S4OExicW5nfZqhhDaRrNa+0gkQl6h/dIxbhD4
	QmXq17GoEumY+ERdKal324QMaDZ8KUb+bk4+vdRfM3GPyYh0proBAUItionrAkG0og6cLjSSgqGBb
	nhyslHxZ5sF26LtuuRhkHQ0IRTR6CT6kwHrIbX6fr39wnge686hsv9u7wgIAi/26E/ff/hxwtc0RW
	AjydDefQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiPeo-00000006CwV-0Vz6;
	Sat, 11 Jul 2026 04:49:42 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiPel-00000006CvR-06Uv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 04:49:40 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8486ac3f347so1949899b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 21:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783745377; x=1784350177; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qesMdHKmyxw3NJ4a67qnIHpz73OEBeBHn6uWkzO1uyM=;
        b=ojy68frid4JlfDR2nn8rSAt92jT8B3cNedtXYQxUrDE6jAvZk//n62HcxOJ1U/5/mb
         Am0xFQ2rWf6ZmbUqScTaj1sQe8nO5CVaaPNilxSu26KVxUAVSV87+AFBRrvamLrxI7Fr
         NPW1P5/0Rb4utY8EOyO8mVWVn+p/AZO+/CoraGfwkIKSRBJHahguWjrwUrZu4rMVhU6u
         mtu8jXQ5k2TcJBCNP4QxIFI/XpOWgxl4Sc0KrK+VklYtLswiBGp2iR00IUNUfSXhyFCn
         qVVdaMVLqTR/p6smkCmy3VcQQmCaOREF6qDPNRpQH4rhoJ/YYbs14uDoy71n51H+jCvg
         0Zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783745377; x=1784350177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qesMdHKmyxw3NJ4a67qnIHpz73OEBeBHn6uWkzO1uyM=;
        b=bvpkwBAt9J0mr47slfmT5boloIRgpgh9DWTmRh8hGE/sNtwK+dMpSu6kZu76XCaCkk
         PRSpX0qgNbWhIUij+EhdHG66GUi/wMk3QbtXVdzD0axLY2yZhGCO7QBW92R6OEmgzdZD
         4MkmoJt33BoCBEjlBpGaxx5mDOU0rleehCdPg2d3bU4o++cih+f3JPrZ+fD8nRdE7sB4
         bQwlZEXApx7zNiBSSpReDtP67KEmTlo1uSc9B4ZpsbjchLZf9PN/OV27nwFMMSa9ZbSk
         4BRhVz0bw911ANyFVfjJTxNhN57ojOXbEvWR/7a5EmQTLEjvi6ao1/jEWdJQvqW9YdiO
         d3qQ==
X-Forwarded-Encrypted: i=1; AHgh+Rql5lFVE6gx35lfr55ewGtsbePzjxCP+c/IC3T7rQHQvb5eeJN9o1FG62oIiAuu7olkJpDRWW7Q4TQCSMvrEOaE@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvj9frsP5/jBwQ3QAhanseYxJuTFKdgeM+uz3KtoY4GkE508Or
	27ZNx0ENQnwvzsXl+Y0TsSct1Pbmqtf1cfl/HLb2R9sE/brq+MkoJlDl
X-Gm-Gg: AfdE7cksrGYRRk/oe8GXmL40aZsxK60YMFH/dPIifCYGy7fmOI6A1tBedVVeXMST8Li
	RcjKWB08LU23daMg80W7s2zXbp0TR7zFyoxStLBmrWF71GO6Cs/1THIrDCvXgPF1r3nUoigh3p6
	y8IHaXQpXY0OmO0Q6Ai+wG8Ij9WRjUm99UI91/R2hp3feLTt9FyEhRxhSsRgtPWPL6RVucThx2E
	keIZW+CN1KbvuPLbOH7JuxQO6+rIoGeNtg/OpxbDYLoOM5St5VEZuXYcl1+bsXclrya0WnV7sA3
	/ZRH8xW5nFQEk19NMrh9SpCEFVMKOzz54v4Gq3aWSvCYSe2YDuKDAhiM7ZM7Z9dtyujJEL/Sl2D
	lTy84b8lotPdUlM5r7kTJz9tQYioFiEd52VhZt9KJ+M9/1OTE6wvgQYCXE9H1BqkQmwqHlSEzWv
	WcqWX6/xlEhxdqAfVMbhRUvMq9BOVtzuT9sCu2NxJMQ8rtHjdjgiRAKA==
X-Received: by 2002:a05:6a20:734f:b0:3bf:6763:f0d0 with SMTP id adf61e73a8af0-3c0f085657fmr7458822637.4.1783745377459;
        Fri, 10 Jul 2026 21:49:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:d42f:71b6:335c:aceb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm25970082eec.22.2026.07.10.21.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 21:49:36 -0700 (PDT)
Date: Fri, 10 Jul 2026 21:49:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dominik Brodowski <linux@dominikbrodowski.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 09/10] Input: matrix_keyboard - replace linux/gpio.h
 inclusion
Message-ID: <alHLK4O77khiKwtW@google.com>
References: <20260710211954.1373336-1-arnd@kernel.org>
 <20260710211954.1373336-10-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710211954.1373336-10-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_214939_057000_4364D3CB 
X-CRM114-Status: GOOD (  10.25  )
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

On Fri, Jul 10, 2026 at 11:19:54PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h is going away, so remove that since the driver already
> includes linux/gpio/consumer.h.
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Adjusted the subject (s/replace/remove) and applied, thank you.

Thanks.

-- 
Dmitry

