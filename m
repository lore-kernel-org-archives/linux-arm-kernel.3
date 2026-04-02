Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F99D6AAFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 19:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofPgXZblW8ELQEADO7eYp8kSVBKt5eY0/Ab8e9t8nZY=; b=zffTFz4mj/BEAasiMvnE9mG+Zf
	UsQ2opQsB4VW96jdUEidWZxqC9wEzIp5L+6B2e93vN9MJ06d3iohjX0W1QuzxzPGimlBDPne4DjvI
	3yj++funN+YAP89b90HKexJ2wC0F5SoZp+mRtELN4HqV70WmnXjZfu41WJd+wl2qybnawhXibz0+/
	RIvZz89dRX4HDfhjmrHRRPDNKfNUCVJfeBEWh0YPs6Dtf0Ypu3i42CZ+WThm6PwhlNUXe5eE3XFgx
	EE5R0C9khesxGlN/sijIlcbPgYBj3/VdLEQSivacmHoJKk0Sg7eNEQPEE5z2oMtaSgPx4jr8k8dfk
	L0m08Fvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Nzx-00000000jMM-0oMT;
	Thu, 02 Apr 2026 19:46:37 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Nzv-00000000jLy-0252
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 19:46:36 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2c54c68db4dso2343620eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 12:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775159194; x=1775763994; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ofPgXZblW8ELQEADO7eYp8kSVBKt5eY0/Ab8e9t8nZY=;
        b=LyjPfpImGBaYZ7pWNby2M99NIvKdZ11h66v6F0H+P5tMs5jhTl3u0edm+Ta8yZvGPa
         jwcPlXptKN7nWLxBNRtZBDhZcXaGcliKh6eBs9X67hHmj2GW1i7HHoFI9Kjit3F6xZpJ
         hvJXlYa0c9MQm88AH3UpOlrmv5V3ID3BxlKUBcFPYUcvK47VeOc5Vr/+AlNdIRuKJ4si
         +SVKQPz1IGjJge30vjQgBKkGkTL+twdimooooyNbXQYRAuTh3xZfBQhIuPZuYCOeCfdf
         1tmJKDMdX1e0mxsg4owXBX72ukmCdyzHWfrbeYuULM10d8lzOvOWFlZY4tJxyEWy+k4H
         z9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775159194; x=1775763994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofPgXZblW8ELQEADO7eYp8kSVBKt5eY0/Ab8e9t8nZY=;
        b=St9nlyriuftClKMaWh7wppehP+ZwBICnPAkE+yBRhVGXP06LoX9E8U6G+ifp39d7YX
         5WVAxpqSEevh0U3d8h0Ruml4spswXeeXbbb3dKpyXWE4WP0IrD7tF7oEaI24KiC1rOHp
         G0J/pDDN5Zdly+3aoovIaCOcYff6XBdHsKZAix9NJrKrqeXIsYKPP+SYxbNRSMC9LWDY
         gXxjq+xQxAW3EsyQ7merSvcEaVZ9pOKes9NEgm33BAGOpeXTSmeZ1MIHgv0VCJjjL2IW
         vRAOnYD8FJ1KxSN4cE4yMjlBO28Ct6rgWCGsPiS5C/6XwbpSSUsf6T56xsV/x/3ty24+
         jYyA==
X-Forwarded-Encrypted: i=1; AJvYcCUoAeVhWYVb+yZP6CtmvScsCD+WZde5hFY/Go49vW4bcx8A8rCso0m7GZKIn+O9GPzvaOnOezDJ0WMNeqOvGDP5@lists.infradead.org
X-Gm-Message-State: AOJu0YxdG4rWQl5h7NQy3q/FUSzNnQRZ/Vvfu8VB4+wnxxfcIMKlp0N4
	ams8m/3K7rh8AXwOV+XhnknDWTqoD9dWMewDWRzYceitMGTTYwnsGwGX
X-Gm-Gg: AeBDievTsup0+MP/SxOvb4WCxIy0iMHzH4Q1SV6VWCECaFssAyz0sZwEGLxze+aaTKz
	NBIieJUR5EVBdskqaRwSyxNjka4BNUvvBR7tlyFd6r5J0mnbl6VUg72Md6h6Vbvm6Yc4C9hd0wk
	Qtv0PrgR6Vx5RIrnzkrJ2W2ScvAMfvLvo35h2DR2g2Tjup97fAld1m281WypyOubauEs9W7uzv+
	i4IEwMRFH7ItJiFamcxlNPdJNb0xuIOKTzOy/lRo4ZNWb/ugcx4TfRPATfPnKjrHaUaujHmQJ3P
	FHDfqpO5I/yWamSzaWtPE+7T1iNcBi8B1H48tljq9YUYe01THcmWlSRTuPOR+OzWIGqwZMUdkXG
	EJGrDyrebLr94H/hfwLCIamWm4sifOtzO1ffeuC0sdaVA0WbFkTlgdWaZFaBhCsndHFjfF5iyEB
	nAdEG+c1PtggZEI325JEd6wgajvTilVO4uDMOsKCfBC3Bv+p5AX9fwfgTnTPhjZHn9
X-Received: by 2002:a05:7300:691d:b0:2b9:80c1:bb5 with SMTP id 5a478bee46e88-2cbfcd4876cmr252532eec.33.1775159193940;
        Thu, 02 Apr 2026 12:46:33 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:902a:cd8d:1c0d:8926])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca79e1d331sm3349493eec.13.2026.04.02.12.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 12:46:33 -0700 (PDT)
Date: Thu, 2 Apr 2026 12:46:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, brgl@kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v5 2/4] software node: remove software_node_exit()
Message-ID: <ac7G9Vp68MgvV2rM@google.com>
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
 <20260402-nokia770-gpio-swnodes-v5-2-d730db3dd299@oss.qualcomm.com>
 <ac6XAyjxTct_WCEI@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac6XAyjxTct_WCEI@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_124635_065998_0644F60D 
X-CRM114-Status: GOOD (  12.66  )
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

On Thu, Apr 02, 2026 at 07:19:15PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 02, 2026 at 04:15:03PM +0200, Bartosz Golaszewski wrote:
> > software_node_exit() is an __exitcall() in a built-in compilation unit
> > so effectively dead code. Remove it.
> 
> a dead code

"
In technical writing, "dead code" is typically treated as an uncountable
noun, meaning it does not need the article "a" when referring to it as a
category or state.
"

Thanks.

-- 
Dmitry

