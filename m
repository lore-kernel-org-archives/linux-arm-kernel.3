Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319A2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 16:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysgGA9FNs2LC6p8SRgBycN6NLmY0OUHVJV77+UK20Sc=; b=Cw3pH4Oex7TpkSFNqBhAY3NOnU
	Dia+OdY/FIy9fd7ZDa7eCv+hNM3GAsflTY+G6pzTjzjfxzkzfXL8Lekxbcv7rQ329B+N+ZidAlC4x
	vM3TtDdyn7SvS2ySqAeNLLO83PrlbnS70vmz/C+t56X2O8ClERHyobLKTwEOYX2bWNYvjmvYbWXhB
	+oQGkASKcYkpslHFGSnnpjWa65PNuFMFl05BeY/BNrHhmnBTTs2COnoGh8kal8hYtWymJeT0OYmvN
	PUZTfHvX7RZc+c8c1G/JKcpfX6apx5TsEhRe3ZDDtJAT0x/VRt7znfZ5a2K3bQRG6C8N+fTnaJYgl
	T/sYOO2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrHa-00000002zxy-3zGd;
	Thu, 09 Jul 2026 16:07:26 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrHX-00000002zxQ-3aAy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 16:07:25 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84867f07d63so538284b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783613243; x=1784218043; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ysgGA9FNs2LC6p8SRgBycN6NLmY0OUHVJV77+UK20Sc=;
        b=ms7NDE37Xw3PJVWW3P1xePaF2c68k7J1a7Ng3jG5b66ccUgSu3NVxc3qbY3Sau5lp8
         CBX/4vy7z+QwuF9NF8EPh4+q0g7bwh/QxArfStWofyElOU5lw4oyiuAsixvOiNr7XtJJ
         aBFjUrVKER4waoA6RsNojuNajs8CccY3dDzKGsn02R1lW72VHd3o/6BapBP1MtnWuR72
         QXuapckwjSLch8dB3mKfyXbVOZjSHbpP5NJLJ2Kxg5fCKMB53CbPYipx2jpQs1BgzKUt
         CVRzgfXBU3dFRia2J+Hu7I7V8YKsCO7M4/3MuFjL3cr7MMSk3b+IytlvOXZT3XcHO44B
         xYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783613243; x=1784218043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysgGA9FNs2LC6p8SRgBycN6NLmY0OUHVJV77+UK20Sc=;
        b=X7xu7XFxgdKsndZan+OBY/xwV6JctwaLVpgfPIjbBMjf3BGJCq9HMrKqAamA2A/I8/
         BssnWUxo3Jh6cd7zDhJXTflBpVVvKTYVSS3AOtAXTuCNDIMp7ZUsExoglRDP2KxS7dOS
         a880sUVv8/DK5w1nULAsnNSP5FYZSGB7LWd3kTHxcCRmMVfssR2M9dF9W+/zAtM703P+
         XTBlj6mj6T+BKbZ8U6kU4gqqxX1Ve6qNe+uHo4R0UGEUopf2ua/ViCf8/dwd3jt1yrlK
         u9SENraeWC3nOwjXfLNSpN+Kop2Vt2UYta7j52XPIg6qPC/tiKqJDuRrEBRfOY0gxYYs
         0TXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6Sq4U/XJVa0F+VHCTJ3TD5eaUr3dpoWStrUGT2w5crP2eQRdlLpDbo5q18Vdv2pB1twbAkq00+dpNVDL9YZP7@lists.infradead.org
X-Gm-Message-State: AOJu0YzqttkxSZTZe6QGHvX6h4cNLq3OuTm0wHiIK7zzPdtXcVpejeZH
	nlRfB3Lakp2jhm990NY1hQheIQnW2nD1MTINq0QQ1bZoHeu72qDeAcmy
X-Gm-Gg: AfdE7cnQhBocH/A1q4K/agkSuSbugp2fGUuA4QRmmPPippWJJIyS5ot0zsarRHa+3++
	gnF5+4BEmL3Sg/XQ9zEh0qyzgoWzrmNn8FiLGqDfrGl1YjLpWutYW4xbhAoYmqFzrmou0G8PGYf
	v4SrssZsUvvfcs0UoO12U7u+QqH7LAcBs1u7vhekIcyTsSMoGnTkb8+7v8ineHYcEz6rDPcSwXr
	+lDAftPT7P73cfhOOlCdx63eYzckwF1qQ4r1LFETqQZ+Q5FSV8QfRofRDO0UzmqIHRJfxilJ8zY
	Ze7kOADQjLGziVdMnk5QfdcnMWFss0Gx7ZO24i7XXDISZbPUKQ1ZBT+6um9Nbetky5XcLfU0Y/2
	D98NjCsj9iHLw5Ykfjb3Ppq4bplRcPzk1k7se3RU2fc5qVtcQEkM30T15jdnXHG5uf648J47B0M
	NZVU90TxGt7ds0zYulqMXqIQy0oQ==
X-Received: by 2002:a05:6a00:91a9:b0:848:44d2:72a2 with SMTP id d2e1a72fcca58-84844d2940fmr6740302b3a.27.1783613242449;
        Thu, 09 Jul 2026 09:07:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8484d465991sm2206257b3a.47.2026.07.09.09.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:07:21 -0700 (PDT)
Date: Thu, 9 Jul 2026 09:07:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
	vincent.guittot@linaro.org, Souvik.Chakravarty@arm.com,
	Alex Shi <alexs@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <dlechner@baylibre.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>, Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Pavel Machek <pavel@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
	"open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
Message-ID: <6cc90547-a3d6-40b4-8914-a1ff60944cdf@roeck-us.net>
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_090723_918415_E6785DF3 
X-CRM114-Status: GOOD (  20.54  )
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

On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
> On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
> SCMI server from different architectures than ARM that's why remove
> ARM/ARM64 Kconfig dependency with also remove ARM from description and
> rename folder to reflect it.
> From specification perspective only ARM specific transport layers should be
> available on ARM/ARM64 architectures.
> 
> That's why get rid of ARM prefix and description from documentation, file
> names, folder names, MODULE description, module names, Kconfig and
> comments.
> But keep origin Kconfig symbols not to break existing users.
> 
> Hwmon, pinctrl, powercap, regulator, reset, clk and cpufreq scmi drivers
> already miss arm prefix that's why synchronize all of them to be without
> arm prefix.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
> Likely I missed other locations but I wanted to send this RFC to have a
> discussion about it.
> ---
...
>  drivers/hwmon/Kconfig                                 |  2 +-
...
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 2bfbcc033d59..cda0aedb36ca 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -401,7 +401,7 @@ config SENSORS_ARCTIC_FAN_CONTROLLER
>  	  will be called arctic_fan_controller.
>  
>  config SENSORS_ARM_SCMI
> -	tristate "ARM SCMI Sensors"
> +	tristate "SCMI Sensors"
>  	depends on ARM_SCMI_PROTOCOL
>  	depends on THERMAL || !THERMAL_OF
>  	help

I agree in principle, but I don't see why this would have to be done
in a single patch. Also, both the Kconfig file (SENSORS_ARM_SCMI,
ARM_SCMI_PROTOCOL) and the driver itself (""ARM SCMI HWMON interface
driver") still reference ARM.

Thanks,
Guenter

