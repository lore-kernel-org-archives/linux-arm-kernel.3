Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74311D12D6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 04:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8MtdHLQlnE39Q/Ipi2Y33s1bnwJbhLgXZcQQfcZ9Dc=; b=PWCt+xO9xLGJCgAgLzM2A97szm
	7uTrPnSVHDn5CImzPIsL2HgLj9g7xXjO3hFB1g4XssvtehDuiKJZ/a6EoFDURxS7cFRcUnqhpzXky
	ZHFj7o/IJaNpZrrLyTq0qvMUn9gOUlhTiXxpLx+kSfEPdHj+aj+8MJeKAQrUMQ8FatpNLu/mkINzH
	SHeWJuZI4zRDO2VMoghkd0tLnY4lxY0ItNiNGNxEstQUfLv7p+srM3sXUPEQXORfp8gQbe+44vVQD
	3Yd7xKKueXhVhMKrV+qIBMQPWg8EqjlfnauKZISFlT7zols2Dtk4NAYciVGyDXfy5glX5MFw/JYdJ
	hRZxsGpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tALst-0000000GIx8-1xbK;
	Mon, 11 Nov 2024 04:18:39 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tALng-0000000GHpl-0udo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 04:13:17 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3a6c1cfcb91so17265995ab.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 20:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731298395; x=1731903195; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q8MtdHLQlnE39Q/Ipi2Y33s1bnwJbhLgXZcQQfcZ9Dc=;
        b=ofNTpSxyzytl5vl+s5LOZHkhHqwdazCbwnBSBJ3ZnU6ulQoffI0TxNSJlJuvKYkQVr
         ck/PGw0Gv3eW1z6/Bq3+6wbeT3lesYCbZ0qVdVTykYa0FqNXSR7f+E4dZAkG3N3ryuJY
         2cqy+Ohbsa5eJs92qqvnrlE+rcyhhhGNDAdSzLFOPfTVq2YZiu2ObNfelEu0DLSh0A5K
         q3L0gOw0rd5QLrwOonxWSYkYNPRDO1R8oqyDbjmngbbVjheXDVG8NR+gyn/OOfHDEwNY
         eVWqvPD8GdzzrPfoXwXyIZC7Udkr0F3mJe9xdFHeJcH1hT6Sw01qtxDdYZK7rRPJWbJU
         /t5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731298395; x=1731903195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8MtdHLQlnE39Q/Ipi2Y33s1bnwJbhLgXZcQQfcZ9Dc=;
        b=o4XFj+tCFj/eUPUwd/hKtPO4e/cYWbWqVP4Rjb0D/9oYk4YPZDrILJ1zNOepwLnAqu
         dRdi1YkUPjHkAwhx82hfyTNB7Qu7uLeLmK25pFcLvKVUi6Ag2juind75vheNtVrT9FHR
         XZZ2XhyxsXUwVTT1JIRZx2Q25GMxNHgzItTIZTDs1ILkEv693rPbSWvchC3C6NGLnm/i
         ZVK4n9qYexLVMrMhGtAcC0AjKI6RmFNfMzdugvjVJbMd7ovIrtktYjtKXw8WT5BkGdN6
         bKdjKuWC7QGfvQSrKrtptlm5vEaGjcMr41W+xTcFPkOSlH6LRMZDVgzzBACm/ad++Pb9
         liug==
X-Forwarded-Encrypted: i=1; AJvYcCWPnslq/tvRLFHwVa34GSq2ZLO3SM3oPOOuGBNpWc07xAgMF0Kwf1WMLaCsnsF700DAVT0JIESyMbNLiYgck5YY@lists.infradead.org
X-Gm-Message-State: AOJu0YwncUatuVGqWC8haTftiFhqZOuBEe1AsROD+E7vE4q/gyKfU1Ln
	tXvAQtX7ElfkrfvvwCy1MbBpIT9Nej4O9cqioNg4PnN4zU6B5N4D7IYcBnqhvLY=
X-Google-Smtp-Source: AGHT+IE8pyAAVUtA2paQ66tQO5vUZ71OyT+KLnUQAUEAU5tTlgSVZPHhBhmkiVG+VvVFIMNzcTXwGw==
X-Received: by 2002:a05:6e02:18c7:b0:3a0:9952:5fcb with SMTP id e9e14a558f8ab-3a6f1a2e2b3mr121627285ab.17.1731298394659;
        Sun, 10 Nov 2024 20:13:14 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f5e9c61sm7533387a12.49.2024.11.10.20.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 20:13:14 -0800 (PST)
Date: Mon, 11 Nov 2024 09:43:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 12/13] cpufreq: sun50i: add a100 cpufreq support
Message-ID: <20241111041311.hleaz5fgipsyxigm@vireshk-i7>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-13-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031070232.1793078-13-masterr3c0rd@epochal.quest>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_201316_277816_7683DFFA 
X-CRM114-Status: GOOD (  12.03  )
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

On 31-10-24, 04:02, Cody Eksal wrote:
> From: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> 
> Let's add cpufreq nvmem based for allwinner a100 soc. It's similar to h6,
> let us use efuse_xlate to extract the differentiated part.
> 
> Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> [masterr3c0rd@epochal.quest: add A100 to opp_match_list]
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> ---
> Changes in V2:
>  - Add the A100 to the cpufreq-dt-platdev blacklist.

Can this be applied to the cpufreq tree separately ?

-- 
viresh

