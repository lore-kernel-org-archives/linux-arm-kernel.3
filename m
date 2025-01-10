Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5D2E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 03:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RR70wLeoCQ1eXpWC969kci7NhDWn4+pUF9Yw82krK6o=; b=myTuq6a0m3FmvceH91swVJR7uQ
	u/S+SbGqjfiRHSALofjAznHTZGCjBB+N32JZFg8FG+yDSGciZt4b5cXof7GbY0vxIQWsUdEHJjcwc
	jhaFu/calp2Si7HkMS2kY14yUYnPMJRUP+tHgxPQ1eIXeRIxPhLxtwbZOd5pKzZDb6THy0EWc2mN/
	kaHjODgKzF3mcBzTnPwk1b4t7/N5BuUpH5+SVDOWfQfvF0+HWj2uLJlT39yuJNTvZr1da80TH2qhn
	4SdK8+j62WubC8rZkVqE5u+b95rBizoVgU6k/bMUIytWRxSMRmW2ZRnhUCixegeFaZDaYoxbGlCAL
	ymbElWfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW69Y-0000000Dwex-23CL;
	Fri, 10 Jan 2025 03:57:45 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW68K-0000000DwXf-2kfO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 03:56:29 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2166f1e589cso31862105ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 19:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736481387; x=1737086187; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RR70wLeoCQ1eXpWC969kci7NhDWn4+pUF9Yw82krK6o=;
        b=oEDwrQ06mfrEl8RTX6fSJiF/QAOtEdwWEhl0DB8VmZI3A1bHad+cKAMAJlMREg1XLj
         /tF6itw3jEKK4eV2GGKmjRHoLjWWWdYpDD9+mv8ljAdWiQWizPZ2wZl0QxVr4JEMwMeo
         CJd8In+h+y5L0wNRPiJX7nkVMnquYN4wKjEGLPIPC/szOO9qk6pHj3p13tKJ3JcqAl5p
         +1hNeCOtH9Zgrt5rzTbQPfSfDrWgKwuMY459Zsjx1nCybG6co1+GtRh/Mu1+xIgEH9KP
         7dP20i/7pphkJHlRLE1FSrmo1ccH/HyFGf4shEaF4OuZqskfQGQeHq1NtZWTllimBHwT
         Lxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736481387; x=1737086187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RR70wLeoCQ1eXpWC969kci7NhDWn4+pUF9Yw82krK6o=;
        b=DHvIZjgveJ3P8lfwE5k4xri0QJ1CIerxkHC9iMOZ+dJQ8QpsoHDqB6ktRlUiyiRB85
         EF9ogYfNIemwMPJwrnV7PR/bHDc782Hm2E1TtZwZ53ncWkgaUDLTjlatKULrVjk24jnv
         d3LtMobv/DQaM8CsT5KRvJ1Qoak69qoNZRUZ+pH/T9hU38AA7GvCZqSNZNr0dMyWc42V
         Woi2FXdigIZVryj5FCFR6ir5oE3uSCqrvWScSXAXk+1jHa+HmDSB3zbjotdZMBEqlSFl
         2L7M/1/OcKGlypmbUEZyi7L6Pmaky5Q2Z+tpfmxV8VlzZBpcq1y+2L2zr6R90aOHT53L
         G3RQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4ih0zL5mdFUdmTlCRgmkDsZNy/9SZtzAbOSRdQHkWegmHgcD7Ey2/I3PxLfU7nLhP0rKGxOtoZOeeb26Boczi@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/y+g/6YqG29XFbihzU1qdHn4gFMSXpbHiWnwje0keGcBEYU/U
	V2SLc5bU0HnZ3aXUIBX9elo4l9oqr0c7M7kTb+hIIZcRq9fL5vJN+5MBB28cQmE=
X-Gm-Gg: ASbGnct9HttkfJ9wjqXwD2rlDjbYQmTYrfPEZF/Nph+S0KcCt7nzZ1nFzK/rUqTAkIw
	8Fe7DvlvLKLd86HS+CZMWg+HyHGZDVU8OXg4HRMYkcSoPYBO0S24MKwSNbeW0/jZL0MFAHeU5n7
	NF5SFd0D4R42tWtryMyXQ1DD56sN4lLGQ2kQk/qfSrkiKLt1Y2Cl9zlG5NsnY+4CIb8Jx200Dio
	M0gUmadnWIgTfJv+kVsxa9eQK3w6Lfj9EaW0+9GfWQgzxJKjs68CO8Sptw=
X-Google-Smtp-Source: AGHT+IEunIAD9f4eEA0vglmkpTO9Q4e7DF1K+CQ6YgG884ITThUtecdS0LjbKH//YuZcwL4Fb/98ug==
X-Received: by 2002:a05:6a00:1ca1:b0:72a:8b8f:a0f1 with SMTP id d2e1a72fcca58-72d21fd29eemr14066244b3a.20.1736481387167;
        Thu, 09 Jan 2025 19:56:27 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40549408sm603419b3a.23.2025.01.09.19.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 19:56:26 -0800 (PST)
Date: Fri, 10 Jan 2025 09:26:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Cody Eksal <masterr3c0rd@epochal.quest>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 12/13] cpufreq: sun50i: add a100 cpufreq support
Message-ID: <20250110035624.wm52tnag3lneuwtz@vireshk-i7>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-13-masterr3c0rd@epochal.quest>
 <20241111041311.hleaz5fgipsyxigm@vireshk-i7>
 <CAGb2v646NHFAni=P+iC8OZsWMpg0PJc=kYbuWaY=C0-W-q6qAw@mail.gmail.com>
 <20241111055504.2f3szrd5ahudvtqm@vireshk-i7>
 <CAL_JsqJJ5A+nYKg1aU5zqGZsmtNJxpS3Gw04pSH-3xOkQ9Vzew@mail.gmail.com>
 <20250109225312.GA434678-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109225312.GA434678-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_195628_747547_91684BEF 
X-CRM114-Status: GOOD (  11.33  )
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

On 09-01-25, 16:53, Rob Herring wrote:
> > You missed the binding patch, so
> > "allwinner,sun50i-a100-operating-points" is undocumented. Can you pick
> > that up please.
> 
> Still not applied, so I applied it.

Somehow missed your previous email. Sorry about that.

-- 
viresh

