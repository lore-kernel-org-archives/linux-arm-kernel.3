Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A35DCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1teV5v5SqS6pFrvXlRn/4yX/VJMz/VkOekGlZHXTNkk=; b=lnIaZXBBkSnkMSRXlnebvMnqdy
	QfJ0zdOxmGtEHxD+P0IiPU/EZyYzX5WqtAjCLDZL8ssd/wF42k/8ZP/5WCCkcTIoSignw01mDQP61
	OXR1FpFzLyCFcfLeHQaW5uDsjzYrZAW9tjiUw/1XjR8C3dul2r0HNVDzpQQ6ERg8Vw5U50gk5keRI
	mHpN0WHoJqcKXBAiniLggYJZzFMfri/DYpKGodEMRlLgA59BTeHEP1gxuChYRoId/vQGIttKCme9r
	Dm+FChKCzKyT5Hfvarzbi43gdJOvJUbu5cMZ9UMSfjwGVt/+GHt09s2TB4mpobX1Zk+lhbQXY2p6p
	7WzUproA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPkg-00000005GaN-0b4d;
	Mon, 10 Nov 2025 11:08:02 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPkc-00000005GY3-1Rv5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:08:00 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7aca3e4f575so2296332b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 03:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772877; x=1763377677; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1teV5v5SqS6pFrvXlRn/4yX/VJMz/VkOekGlZHXTNkk=;
        b=SH/3n36O27tBeQ7b+Y6wNUrbXqHuX+VCbf5qXGTMdBCt9j1P5OOLU5e9MLW3apLOk5
         S+Cd2bBYqNYCUBpP8wi6Y6hGSYNyH/W1QbXZWNK+mDKihLxbE2+0CntbYGaX8znIMyv9
         TcUVx9OV3uRdEltvX+Eh9NCma8kWyf25Q2evEnNJ0To4c4FRbwl3776L8w1Vy2NmW1sT
         EQ9FfV0Z9WAych8uMRbxkrD3IBFUAhAKWfzIvz8VGJZDy9a2qbClVWBv3xfxsiCDlZuz
         yZXz0AmqvoroEJcBaxnL3xA3cd0PehlCuSdSHjAQrVynYEo8Uqprhxj5HXAh95+4QIqd
         HX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772877; x=1763377677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1teV5v5SqS6pFrvXlRn/4yX/VJMz/VkOekGlZHXTNkk=;
        b=Wkskc+Auobx1CO1L1VvqR7ZgLq6V7HWDaYQTKu+XmZWbWWlgIYXQRHfzM7Goqlpobh
         gHpCSeDbEDayAloZT84ufbEtvH4B4k6Hy1Tcr2uVBJW96AIFu6ME+MHiUNvQF3GcONTF
         ZocIa4ud5dDEjD2HJr8nnksWsG7ZjxvsQCKtuhXl/9POfVSoh4QbFoWPJiQwNHitEPBn
         ibQsMjwjGEhIwg+J9lwhv4e9QojZcc10cxzeLH/uJZiykUBaBfie4sva+s50Qy/zYaP9
         QZHS4obStNew+fTzdssKW1IYVA/2hD8djjMqasca8t0tp5irumh4Hndyi62Y43TL8Gcx
         2AnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc/FzaR37wXB5Azxp76DNmfcdy3zSbNEZyjjCpaksNHz8SgqmG/RjGZFLCsOxVt4s/LbFyfOgdjdRw51uFbsMV@lists.infradead.org
X-Gm-Message-State: AOJu0YwCzf8ZUOEzlXoqgwlGnOYYn0KJ3CmKsomVL6OaBC9xfSFajoOj
	k8aH2jBI039FP61fvdzabiGuG/Gtg3DEELh1utaRA6ZLEIRFK+2+8lNL2OIFTGtE6S4=
X-Gm-Gg: ASbGncuMC/KigmuewQDmMdFU6urE7qvJP0Yv6Vqy3KhL0n1RVeBRsl8Rh6ruVHSGXXZ
	E2uB3xsdCD1x0Tv9c2EvwVA3FMzAFF3O3eTf4xNsECwdsfHKgDcrXpf+hxgP5iGjd2VyIoNnfeB
	hOk0pXIeb9aOOysDuVKBhiQi7Up5S8ajfG2slFitSNE/4GDADsMqi+CLPxHzUvPyG7jie7GmNm1
	FBiPywjToKU7DWCYCmPGsxipksMAoedQVQwoJeqVXpbdtHI7FZiFu2HGw0J3Co9vIyQ1vjax85j
	Xyn4r3mXk0Jo2EYIGbnG4+vfzXimKAnHRCNJCOC6SEE7FaY6FNNueXqC3MhLA3D/q3b7FyNt5Yh
	PzFDNnglbrKbux8xEw4aqqfLiWkd9qOuEjT+/u60vNdlKNQVEQ/GJIhSm8LfNVtCNozqu2V4j5o
	nV6qCDrlCNTqI=
X-Google-Smtp-Source: AGHT+IEI5dvtjpf7UreD77ujcsma8Qc91uG0xXgrZUKvQ1Ri3S/fmPHsBQ3EzHdR5mFgTf1mYnto9Q==
X-Received: by 2002:a05:6a00:1990:b0:7aa:2d04:ccf6 with SMTP id d2e1a72fcca58-7b2232f8c80mr9070041b3a.0.1762772877004;
        Mon, 10 Nov 2025 03:07:57 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c09cd6sm11397368b3a.23.2025.11.10.03.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:07:56 -0800 (PST)
Date: Mon, 10 Nov 2025 16:37:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/13] cpufreq: sun50i: Simplify with
 of_machine_device_match()
Message-ID: <awphoxojc3benzdam47mcx7pqty26ohrwpgv46kimg7nl53rqc@szq3aqjqsbrc>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-4-d780ea1780c2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-4-d780ea1780c2@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_030758_395521_C390512C 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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

On 06-11-25, 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node and matching against it with
> new of_machine_device_match() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

