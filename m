Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCA7C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnNh4nAQm+RPIaXKRaRvi+wY8Sx0Yyg+NpjwoekcfHY=; b=t59lGC4/+VHoFDdEO2j/mprKds
	YvZdTyrGTW28KgCoHtGWy1HPxbmmFbCIFrlGnN51bFv1NzLdgv47qXf5umSFCgs7c4+AK7mJL+bgZ
	CnSk1vwMq6yokCjuKzmKj1B4csDgCdBN1a7qQeDuJAyINdtYykZjTir5AbCzLYavRDRWokZD8BU7i
	IqQfD1dH9hY+qTUdydIzstRGoYVocAUf0RbUMC6pdmDmkJTZiHHZfRrNYBVA3MwDJYeFE41tYFeQv
	WdWKSbxRImgafuCs78FYItFVnzWkPAkyBxMfSz8Wq4iIXZnV97cpGsyT4tkk6HJQ83RAhbEHlYEZd
	ugubgGzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aWj-0000000Agiu-2Fn4;
	Wed, 23 Apr 2025 13:52:37 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zu2-0000000AZdr-2H1Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 13:12:39 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so5072407f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 06:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745413957; x=1746018757; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EnNh4nAQm+RPIaXKRaRvi+wY8Sx0Yyg+NpjwoekcfHY=;
        b=IUs3K+jJ7K0UojjfF7EmGenim6Zh5bsuybvdDjhlgzA8/4SPMSFRYV9rjIwTU4DN2q
         iQC+EInT8Va2HBErYgJawgP00anyTOao78PlF3nNGOfRgjfej4in6y3xNcQ6J42cussK
         e7107pC56GpM9vXytK1xtScMIw1twak7ZC/ChM8bnGNECrWUssI6F7VQ2rKUXlWNIEkf
         1sH6DCRaHnBuW3bKLO9LE7+FBL8PacqjXv4O9J3RwcRDB5Aw1+HSfc5UOpH8Md8hfBqF
         +LVeIg+WQTLVmNr3W39H/tCPmLFK0koX9S9Tr0vSHUp+LVTmDDG8eHBVxQoIsxypkjYY
         /bDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413957; x=1746018757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnNh4nAQm+RPIaXKRaRvi+wY8Sx0Yyg+NpjwoekcfHY=;
        b=uoLT+gQWuPq7LsytfcWRs23fBrXdMT1tR2K6X3sGAAhy9l4fzIiCRqDYNmnR/ta/ja
         t7kVn86CO9vEAOww4NhsoYM2Hk20SifDqI7UkR8lV78LO6AgwBLJdxM9jd1DNS0FmV+T
         GUZii06E2l0qG36ehBCpZHaaSKTYCmiN0R+8s+asoE3RC8kgXZwBr9QG1ubEBsgTkxrO
         QY/Ak0p6SZGTbjh5XUiwZYw4bvhvnIXBXpaSeYynDTV1i2lm5rI2kDpILUHhC4z8idIM
         SUFws8AEH6kWV6QMsvvJonuaXf3IK+wQEXy7UAXP3Ff2RRcBdsKXIXhcxtRRGcpz3IzK
         COOA==
X-Forwarded-Encrypted: i=1; AJvYcCUNckQlBMZ6NFPK60JVYs3CFBW8pcnEL65sp0fWgXx03yWqZUir5QDlin+kSLuCy6NY86iUKyd0PIRvUEWlPPRa@lists.infradead.org
X-Gm-Message-State: AOJu0YyineIiG1ds9W5h1IbtSloJbtuz9Ztc49LnI2VtPST86/E0qplg
	X0mUPUdPI0+iz/t9J4tH+CO2ESNo4dUSwkw+zBBjwBUpPk2gqFPQ3YbiPJjiIHg=
X-Gm-Gg: ASbGncs1jJMgiSJ9pyo3tlCea5pLmSUIIILg4FmHXQpLiWiGQxPGRJKuYNHl2LCYgjL
	EMlKoAO2WIjFJzC5jlLtaPJ95BifTMnyRj+i9GaqIqZVfY3EMcI8NvVA4aNvKEh7qfOfltSEHuo
	+ULLfnkvI5kdFXoj+AyB7NzFSvismfdqZCNylk1aVfX8yuV8+5gKxx/vmObnRzP+pHxDuedH/Oi
	NYWU3TXcyvIKid4g4qKgo3t4N89JFd9OUpfszt/rc+kXFHWn9bpNulTixiuop4cEnJ0A0K/TqPk
	9sHew/07vysxXkx7u+c1vtF6mImHYVHGADlznPc0BsDvKA==
X-Google-Smtp-Source: AGHT+IFLiGEPtIUG41rtNhf8o9bC64yoKVgiB+tlF8MOvnBbCSYDUU6BGbHcm/6Whcb9nIfm+cjAgw==
X-Received: by 2002:a5d:588c:0:b0:38d:d666:5457 with SMTP id ffacd0b85a97d-39efbadef97mr14579817f8f.42.1745413956864;
        Wed, 23 Apr 2025 06:12:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa4207fcsm19078159f8f.19.2025.04.23.06.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:12:36 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:12:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v11 12/18] clk: imx: add support for i.MX8MN anatop clock
 driver
Message-ID: <09721eab-1adb-4001-880c-10ffa1961918@stanley.mountain>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
 <20250423060241.95521-13-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423060241.95521-13-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_061238_595163_AFAF0023 
X-CRM114-Status: GOOD (  11.21  )
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

On Wed, Apr 23, 2025 at 08:02:29AM +0200, Dario Binacchi wrote:
> -	hws[IMX8MN_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
> -	hws[IMX8MN_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
> -	hws[IMX8MN_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
> +	hws[IMX8MN_CLK_DUMMY] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_DUMMY);
> +	hws[IMX8MN_CLK_24M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_24M);
> +	hws[IMX8MN_CLK_32K] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_32K);

I'm just CC'd on the v11 of this one patch and I really hate to nit-pick
a v11 patch...  But I don't love that there are so many unrelated little
cleanups mixed in with the functional changes.

I also don't care strongly about something which is self contained in a
vendor driver and I recognize that re-writing patches is a pain in the
neck.

regards,
dan carpenter

