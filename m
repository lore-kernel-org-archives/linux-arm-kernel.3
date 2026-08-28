Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124CFC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 14:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTIogw4TSRkuHDeXsegqU7KIhcr5PJJOjQw48d6uweM=; b=0DI4RUbD7y/TB+CsaLr+BIh3Ik
	/lEv34ZhuQ0MgThv0tNMtsBwu6dzzvsfq4KRwnhTaBFEi0XHOy/hZNk5WnRh+AlWcwidUp0l4fvw2
	obXeu9VYzbGk3ClPngct4wOShs1vIatUJAYyf6szjMxj39vfgYbpBbEhTAdnuoAdx6Tk09dkqzYEj
	cKKWyTIquLTAYe1bPASwgQWcChlEevIUkNQvimosT+oJmigd2IrYtuEpC7gnDMgQm8gB03Avo126X
	PXFdm0P0lCHnAZXIsheC2+vzNuH2UbXjGcd/03wpbrUo0DAR8QfzxbS4pTUoagcePXXf6Rj1wzAmY
	y6btD43A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxlQ-000000060WV-0x8T;
	Fri, 28 Aug 2026 14:41:06 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxlN-000000060W4-0zac
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 14:41:02 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso1047555a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 07:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787928059; x=1788532859; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bTIogw4TSRkuHDeXsegqU7KIhcr5PJJOjQw48d6uweM=;
        b=h0Yyo6SqORIjYNZIjCvI/oQ2W0ek/V8VzoeMIL3sJW3ZO5y2Hwx/zyjCO0Lq/rYInv
         Ul+ihVmZnPdvCv3EIk7SIIssS2eG3T0YkUmP6PHHPOY571Ch7RqiuNbGhRzRC+/Yf/BC
         8hDu0/En8X0QBBYtvTsMe8etnNqEj+ngDHobKCY8nw8/EJQl01gYXCF3VDPiH7b5KtIp
         kPavmidSD9bQxNumE3XoMO0fZAUlXVuphpE0bg45q9jALN1jBRZszWdzX1goAjtmwMNG
         femT1bGA4Ba023988W6+fBVyzXIXX7V8+Pw3cpy/rH19mOddV8qr/hi+zFNhZ44nu2du
         DEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787928059; x=1788532859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTIogw4TSRkuHDeXsegqU7KIhcr5PJJOjQw48d6uweM=;
        b=P6vsIWl41BlV9b+wsJI9VdZn/6Ng8FzASZqILJX22UKSXEPfvDV9r8W55q9Ylg36y7
         tnp9aa23Lhm4WxVWgI6pocFWu4nQQhgouojb4THBpb7CmI07MVVNJU7JFprIE94dsUjA
         EAWoPHVhDETP+GeN9f/I6GhXf6HEDjU8P28AFrN1xG4X8UByrk4xq/Dr5eoWOwUwvO5i
         EDBSe9j3Guo1Ug4nqj70hVweCNRbrKR54o5gTM+Y+6FDgHwaLk/6XbabMkE4TqbQD/L1
         B2q3ZiePOj1Qt0us2Z7YKPmtWxRBzts8QyI8JBKluQxwOWtVhpp2xVOEl92dDex2zBqz
         KaAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqgQt7m13nnpQ7Lc3CL8FeNqbg6G99EGGbk+KiqlhA0dOugtZlyWrZDQTn/1W5FiNx0Y2zeLWwcH9FPCxE7BNK4@lists.infradead.org
X-Gm-Message-State: AFuF++mGLoQbuBwd5kYB+5nP34O6z5zedxzT0M1EloMzhKJXuuEN3/Y6
	s1U1WHBOKX465xVPqULJwWVi1El3qPRR7I/AlrP7+d7DwwNp+Ijytax5
X-Gm-Gg: AR+sD11ntZPmc7Z0KAH700/Jsv653/p6HQZqxP23mupOFcf9+oq5op/BuzDtkxJ7X6T
	3/XGadWSFr/G0ndJ6fM09Ultydn6UqIRt4CVyxYsnl3NqPuoL4X90NoMXdFdVr/PP9Ko4eDwSJa
	vVOw83qfjZoA8mWHBHgiMKnvP2jCm9jHRL/2UHvTUOP46YCU8u2D5t7NGeHKI2vrse9tgpPis7d
	FwHABKltUTByvhxatKQvFyIXepMmesjkUT2sn/64W14C9f30vukhbhKa6GDAkPRVCf7M2DF6Wg7
	Dr1j9BiePO9Bpivi0ynGD1v2SoW2uCPRWEVzHPvRrexImUkVASSyuuy/AKqtgR2Mi3ZKj8xSw8C
	+nkjb/iWJnyPxGfpbrEKUmcqcfKxtWJUJmnj0SAgji4/XmnQz7eEjd90hZDBEoXfy5BvkL+jsex
	DmcYBxc9XSjFRh1LkliFZ3dzUD3HFEY3GldJAAJtIDmIs2LeJTua4Trgi8iQ+XliBLU83NFaCxJ
	A==
X-Received: by 2002:a17:90b:5284:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-396d0e5f5ffmr15894627a91.1.1787928058655;
        Fri, 28 Aug 2026 07:40:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm6759748eec.24.2026.08.28.07.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:40:58 -0700 (PDT)
Date: Fri, 28 Aug 2026 07:40:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Carlo Caione <carlo.caione@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: sunxi_wdt: preserve boot-enabled watchdog
Message-ID: <e1332541-1751-4a9f-92b6-60636ffa0a99@roeck-us.net>
References: <20260827-submit-sunxi-wdt-boot-enabled-v1-v2-1-610d37dccc97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-submit-sunxi-wdt-boot-enabled-v1-v2-1-610d37dccc97@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_074101_280933_C3AFEEE6 
X-CRM114-Status: GOOD (  12.64  )
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

On Thu, Aug 27, 2026 at 10:42:31PM -0600, James Hilliard wrote:
> sunxi_wdt_probe() unconditionally stops the watchdog even when firmware
> left it running. This opens an unprotected interval during boot and
> prevents CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED from taking over the active
> watchdog.
> 
> Detect an enabled watchdog and decode its programmed interval. Preserve
> representable timeouts, and round the 0.5-second interval up to the
> minimum representable one-second timeout. Use the configured timeout for
> reserved interval encodings. Set the Linux reset mode and ping the
> watchdog without clearing its enable bit, then mark it hardware-running
> before registration so the watchdog core services it until userspace
> takes control. Leave disabled watchdogs untouched.
> 
> Fixes: d00680ed0026 ("watchdog: sunxi: New watchdog driver for Allwinner A10/A13")
> Cc: stable@vger.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied.

Thanks,
Guenter

