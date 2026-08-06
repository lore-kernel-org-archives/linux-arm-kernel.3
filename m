Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A237C55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 07:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/Noaa1/5CoT0jOkbG3HQUWESYiE8Rvb0ack3Temr4U=; b=i0aOwJAysn5ezzX2nh66mfVj5u
	Uw1cnBPL4ovroCytf0SgWMlg+nZOQFvgcoUs48gyocfAuojUI/+arL8kt6Sgigj0wtY+sXYCc37f7
	GL9iJ2vhsyaSOkoB/vvwG6DUZVvsVXAGVViEQ6JGKCpHDexZPhdMUTFsRfBgLE5A23BXSyZebNNlv
	cYhROVdTaPhjiOWPHBmXpElCP1kczgAJF+yMMVrALwnr5HtVM7QicPaCp3Pmebuv5TWyqbLz+R27Q
	oRMOtVBINNBoMoMusXltaxq7qRA1PPVXAHnVaRZF+6pSJBcPs5nG8nBPA2eZS9c6yFEODVHxlRsoK
	hGeqRusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrLY-000000050rG-122z;
	Thu, 06 Aug 2026 06:12:52 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrLW-000000050qi-2s0a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 06:12:51 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cc73e322dbso21452645ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 23:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785996770; x=1786601570; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N/Noaa1/5CoT0jOkbG3HQUWESYiE8Rvb0ack3Temr4U=;
        b=nl/PIG6/sIM/RznEonhRq0cNELOt/1glQl4hD1rIwj1OabcAVc8Kli0K4NUUCnQJ1D
         28EBZE/ENjRZauKqgmZMsEMLNTsJYQjgyyXxXjPiG8mXCu1y+7o14qY3F+ZTLS/OYgQr
         EhZrzJI1hdQILzNv3m7oNrIKht/IVphxTaUQzit5/x9nWXJy9m7mJKolUuDG8XMTttMr
         nFKSzcJe+fh5osG0pbYa2tq9AArCSdhy7fJZ5ObVhyoC5JhsxzEQLxRkJVMLHAe8YM2C
         CLeaZ+q9b5TJpVs07NnJFyQG2VNPyQswvZsefkDE4tBnXe70X4anVexJ5VSNR3ZSLaeF
         odCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785996770; x=1786601570;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/Noaa1/5CoT0jOkbG3HQUWESYiE8Rvb0ack3Temr4U=;
        b=iLOT8qvqCPEQa/OKVaM3KWmQCJvHingrcknLU/q5N+vJKAY3E33JULAiBvcKEo38ht
         WspLdRRrRWU2iurqGXdNokn2ItuJkmRbwxmFS7VzEHYo6rOtjFTchj1gnkLtzH/Cm4oQ
         Mcu9a/0Cb3hMqoW5TxUb51Ra8JTIu4DXzFx5nlEA1WE7GMtWZDv1rzl8AqS7x8NNSHM6
         Jx6t5Hg2W4P9gaRk573TD/zCISLNDY8EeN05owvltRQDvcXNFUGUJUFo1Drp49zM5o1C
         HlKMHjc3AO82hQv+V+lPB8gblPD9U/oEoytYyAtoaxBgloV1TpMmzq9DXeRQgaUKRwsF
         lIqw==
X-Forwarded-Encrypted: i=1; AHgh+RpxAdqH1ulAZ/C9I8NUnTiJBURfIVMjSY8YC5RC5atrP4oy7PyLwzIe22fa9YiPhMFD6cVLqPP7LNFzYq5WdztP@lists.infradead.org
X-Gm-Message-State: AOJu0YxGb0GTi4crZwttZVj6wNhBqb4NKx0WbJqhy5R6dpcA/MkFi73M
	RzbnSXcp3GC1cMPh3rsSs2r+luVL4tCzODrnAIwqsKVgxFfUcQKIwQhR6MeycBdmyyZoh8foG8p
	EI3X6
X-Gm-Gg: AR+sD12K5068cXB0FBTrRplvM5/z8VGRp/kXfS5harD/APAMaH+lpi/r+9aqMEX1xn8
	La5ErNQj8qhclU7rvm/QeW94608yVe82fCbhX8txwGnNX8lGcgvi/eyqeYTFpUf+H4p5YoT1Mc4
	R2qz6BE4N/MuRVe7IwSTB8zoDJ/pmzQUMjqnyCfi+aDArtV78l9awM5hhr/h1PDlSJlhI2Q9loM
	LR0T3bZCOloqlCyj4QZvaDMErx4XlGj0uO1/W16zgLRboMefTbpI6qeEVGwU8zbFzAXk1VP7liH
	stnyG/Z4jDYmqnFDAr2N686XlSFywFRdqGiumXAKC4KfwMvFAsWrcjvAO9B9v0TSM8+dId+2zCS
	rbZFtM0+vgcFeH53j0XmHurecnoFnStW6jH6amVa3GPDTcfcOWfCv0Am9sIHhBxbyM1yzwhLEeI
	imCX7nNZFe/6GnVqRrJcdEoDCq9necPyD+AJxCQ4TzEwKkhrfrt1WhsEYwuE91
X-Received: by 2002:a05:6a20:430b:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3cb85ee779fmr14662992637.16.1785996769547;
        Wed, 05 Aug 2026 23:12:49 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863fb350sm24210421eec.8.2026.08.05.23.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:12:48 -0700 (PDT)
Date: Thu, 6 Aug 2026 11:42:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, 
	Fabio Estevam <festevam@gmail.com>, Anson Huang <b20788@freescale.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: imx6q: fix devres accumulation across driver
 rebind
Message-ID: <xale3cobuizjnufkp2fkvxmq66dl2cmuoh6szd4d4vhwfcxizp@4kp2zcpu2ndw>
References: <20260806050902.90550-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806050902.90550-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_231250_727271_60DDFC88 
X-CRM114-Status: GOOD (  18.26  )
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

On 06-08-26, 07:09, Karl Mehltretter wrote:
> imx6_soc_volt is allocated with devm_kcalloc(cpu_dev, ...), where cpu_dev
> is the CPU device from get_cpu_device(0). That device is never unbound, so
> its devres list is never released, and imx6q_cpufreq_remove() does not free
> the array either. Every probe therefore adds an allocation that stays for
> the lifetime of the system.
> 
> Allocate against the platform device instead. Its devres is released when
> the driver is unbound, which is exactly the lifetime the array wants:
> imx6q_set_target() reads it, and nothing may reach that after
> cpufreq_unregister_driver().
> 
> That makes the array actually go away on unbind, so also clear the
> file-scope pointer in remove and on the failed-probe path, rather than
> leave it pointing at memory devres is about to release.
> 
> Tested by rebinding the driver on qemu's mcimx6ul-evk.
> 
> Fixes: b4573d1d657a ("cpufreq: imx6q: correct VDDSOC/PU voltage scaling when cpufreq is changed")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/cpufreq/imx6q-cpufreq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh

