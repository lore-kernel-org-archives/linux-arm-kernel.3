Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19970C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlfwFDH+X8G+NwPj7Vy2IIvOezxV6eu9OtIzRCGvuLs=; b=Q63a1kGcNqf2QF4MIAZI/SIU1c
	APr2rWIjMQ9XBgc9QLMwkJQnjicAeTVrnJOPOqqlxUOiCiLeJ1yyzdeh0I3IvOcTY+Ng32VwH68FO
	3VvqRfppI47IVGBEbV+zlT4dLpcAvM0LNM9B002SClPax2jf6lyYw8fsYTL6MmFBg+AXj6HWJEcq7
	WoCIfpi0brkpzwk4EQWCM9neYKM2ER3f9GEQk1a32XTgPQNIUarwyrI6vWxhkOTDlArRWhbcAc8Y7
	OS4AD6olr8A6cAmQZeWN+fzyCoYbe2fEJW4HErYzMXoWFwaA9XOVHCBwT99htkxmehu1otWc0tdv4
	cllzeSqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23bo-000000037mF-49QA;
	Tue, 08 Apr 2025 07:43:01 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23T8-000000035Gy-0aim
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 07:34:03 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso2950835f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 00:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744097640; x=1744702440; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IlfwFDH+X8G+NwPj7Vy2IIvOezxV6eu9OtIzRCGvuLs=;
        b=IhvrFNEn4+zeeLZiotd3vTI62iAbtw4FmHLvsM3q3QKPk2sGmNiLqRt9H6k0quGpqs
         ksUlLfaAPOBozTWRgF7UU7tAI+ObkCNJGuiXmvRoe1ThgnMJhzWIoQxMamUgV/6Adfj/
         GEneMrrg8wbi9NEs7O0L5HAxFVZ6x5YVg0Kj7NZ1eq3zXryvDU8s7AKzh1yRCI3fKj3s
         taF6wh7PTujEzj/I0H5sP8TrEaFkDOPcYyzpWs+/+MIuYh325gPK2j+jDo76IyEI7Cov
         9LIhzYlG1FM7F439k/JOxbyUH1Nwds3OhUmTZrePqK5+jCO3JGAlaeaVYOjQRWBAeBEY
         JjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097640; x=1744702440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlfwFDH+X8G+NwPj7Vy2IIvOezxV6eu9OtIzRCGvuLs=;
        b=kD1KXJujEx5jgJlPxjitMwg/mYZvPuWturgNfSD6IwnXLVdu+9iHaYuE+QyjAPOoa5
         p9Puq+rY0RtI3XnHkm3UH2IvpSoxGizALtu7uThmORIFYQ3H9SAxzE5GEf28SidEO82+
         qkefLemWybUdFg4FhuTK/JgtJBAGTqh23ofXO4wt0Ail2Eskm3qQikLEUnPBO0814ikX
         DQD6ZgadFd3Pbi0qEFymP8uex4bZCwmvVewWF0RBBIxnMjSGD/0vDBXyXP3hDLcB0Qqo
         HLxbhfJsyY4szX9gxEztDAjP8w5c3uyj4nIiTayUUXVnCkevMRyW5vvDfCo9ohsBdGV2
         kW/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUy1WzlgjFkJlUAP+q5cAZG9nDILlaL85G7xAsBwIlA8amPYFWRhiYZIAnvU9J6ZqudkIFKsL2XUXq3H5PmTWia@lists.infradead.org
X-Gm-Message-State: AOJu0YyRILpVrsVEdwn/bTfsmNe+1GvJKxSbJZwAE+AeQzT3Rrvf0Jep
	JFJ+AXpNokmWgbaPt2Jq/1LtjolXj7gdO87p30Cmm9L715udjXuK4MeFCegoxKA=
X-Gm-Gg: ASbGncuGGFHwB6i2sfYmgi2JZDQr+V5il61VwKg7gdYrg0Z5Waq/VGouwFvURFkY3rM
	ehbsYovm35iv2JHFowmooMNKuWDox2PwPPMjMYmFVvoULtfcoZOlYkj9U8zJLwaGjqWmW/hZNFK
	H3ihlWFekcfNaZ4d0ALndzr40m5S7WanWFk9AcZzQQbZtYUdo+3xXgC4z4CxYIC+25e7rfDHWby
	o8wynJwReUZZxyoLGcq6ju7F3ut+K+fSoIEPeb/3GlddlpDLMXob2SFDIax5p7keunRsbSgyFjF
	DixVHlEdDz7rpLjQ11hS4DD73B0/snOQl4NMGCOOYqbcLaE=
X-Google-Smtp-Source: AGHT+IH/VksFsEyoBKI9nFdRHY5jYoHhuOC/STuFedynMg/f/yUaVw5RUYHsEjKD7l2EEe/Jqd89dA==
X-Received: by 2002:a05:6000:4616:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-39d821116bemr1896403f8f.24.1744097639781;
        Tue, 08 Apr 2025 00:33:59 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a8952sm151781455e9.10.2025.04.08.00.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:33:59 -0700 (PDT)
Date: Tue, 8 Apr 2025 09:33:57 +0200
From: Petr Mladek <pmladek@suse.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
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
Message-ID: <Z_TRZSxwzfAZ9u6I@pathway.suse.cz>
References: <20250311-vsprintf-pcn-v2-0-0af40fc7dee4@bootlin.com>
 <20250311-vsprintf-pcn-v2-2-0af40fc7dee4@bootlin.com>
 <Z9BKW_06nLAOzYfY@pathway.suse.cz>
 <20250407184647.3b72de47@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407184647.3b72de47@booty>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_003402_185436_F3D95AC3 
X-CRM114-Status: GOOD (  24.86  )
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

On Mon 2025-04-07 18:46:47, Luca Ceresoli wrote:
> Hello Petr, Daniel,
> 
> On Tue, 11 Mar 2025 15:36:11 +0100
> Petr Mladek <pmladek@suse.com> wrote:
> 
> > On Tue 2025-03-11 10:21:23, Luca Ceresoli wrote:
> > > %pC and %pCn print the same string, and commit 900cca294425 ("lib/vsprintf:
> > > add %pC{,n,r} format specifiers for clocks") introducing them does not
> > > clarify any intended difference. It can be assumed %pC is a default for
> > > %pCn as some other specifiers do, but not all are consistent with this
> > > policy. Moreover there is now no other suffix other than 'n', which makes a
> > > default not really useful.
> > > 
> > > All users in the kernel were using %pC except for one which has been
> > > converted. So now remove %pCn and all the unnecessary extra code and
> > > documentation.
> > > 
> > > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> > 
> > Makes sense. Looks and works well, so:
> > 
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > Tested-by: Petr Mladek <pmladek@suse.com>
> > 
> > Daniel, if I get it correctly, you have already taken the 1st patch.
> > Would you mind to take also this patch using the same tree, please?
> > Otherwise, we would need to coordinate pull requests in the upcoming
> > merge window ;-)
> 
> I see none of these two patches in linux-next.

I see.

> Anything I should do? Resend? Or just wait a bit more?

Daniel,	Rafael, Zhang, Lukasz,

would you like to take both patches via the linux-pm.git thermal tree?
Or should I take both patches via the printk tree?
Both ways work for me.

Best Regards,
Petr

