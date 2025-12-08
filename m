Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E0DD3B7DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 08:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=; b=S/NqUE87Xr9803NYjPF3eXHSjv
	P2OcaF6XHsw7UyFMSoso+dcCk1O6UxAZGzlIOuP40cYBjQ5ZS+kGfGcu+e6y+1Ixi6O2MP+nIruIr
	YQzq9+PncaB2B2vtTdYW7f9+pFuE9CAKh2RwIVxgZqoxx+knK6aRNQJOTQM/64wIYojhbeLrgePYJ
	Ym5jtK54mMO0ZsYY1DSGlWSQ6f1vNFofDcF2YqeWvpKtrNLvfLiYWHYTQnZgq0pDSQXySK4XduRys
	TVkIozroLgLOc6JWwljIpsfXJxiU75k/87IzvMtpRGpBYVw1W6w6rKOClg+nUGvMdvUDbrhnSz4WF
	Xw1xaU0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSWE7-0000000CnOr-1j3m;
	Mon, 08 Dec 2025 08:04:11 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSWE4-0000000CnOL-3rnk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 08:04:10 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-597c83bb5c2so3158860e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 00:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765181045; x=1765785845; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
        b=OPyswl7BQM2bqZIuL2kJ22PONmDzXCFVTXsDIGEF3Qw+TH+MsgY+//+FPsIsSlfGDq
         lZMjU4gSw9emvev1/rCaWH55eUOgT83eTjWuaemjDAKyf9XVswm3HGs/dydS0c4iYFYH
         0+SYRghZz3I6Fi5D4R3RWUBbh/tCJdCzeYne1vnz26u1x1Up3Q01E4z9Jn57IVTri3Q9
         sK1bbQODq45GqceH57DVAjtBVBdHieSl+HLOpn4PsLJrujOblpiSSmtrlLdw7iGbubvz
         ejkmODXWM/MmgIjEzeEhh/3g1a0KsEnnocqWTU9wxIyVLtGtqvOpGAIFyjz5Yd+mHWnv
         pC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765181045; x=1765785845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
        b=vQfLDZH0/pTE6AC8ToM6NOkRValtJArkWt1O9vJx8eQzAvTm3tg8vtE0U6cJlqH6cy
         rcXE0IMIamjH0BL/D79M9LIhfsWx0HKiQ7GlexdU+QwhRP2r7TAWlyGbavfoSJA2aYpy
         2troOlrumweaEcJW/R3tDtZZmx0MbP2fmIARHkfPzdmys8IhlJVuSS0LbNY+2+uN6veX
         U4rsqr5gBMkWlUy2wFRWCNmnNY+4hcKmqfzUTPU/3LPa72oL5yf7q2EH6ZDNwzP0WmHE
         V4A+59RUhkO4u6Ai4fDRT29VBLD4G4xn/M8l5xt5zIq7B7/1YVag/gk7bkkEb2Qb51Xz
         sXUA==
X-Forwarded-Encrypted: i=1; AJvYcCVctiaNt0VL/FzuRzdCKL4CDzo5acr+9ZeLEI5/DCjJdAGxcChvdxyspIAxEn4EvaNxkFKN4KnFP/GpOZQf+MfA@lists.infradead.org
X-Gm-Message-State: AOJu0YzBiNFple9JjNR6fg4VMu7u9AVDIvS1WJxY2R7xAZEKielLKlqe
	jSHpX2axxWZ6vElAZkvNsX1ROLIetA/JrrtReVPiiukp/hvsgNdQfzUc
X-Gm-Gg: ASbGncuBkOJBgvrmbxWLNFFslmDupLd9UhliAgBYwz5ifRWvKmG4AcjbeeyUuKqfRQi
	nuh4A3n7DcyEB9eYmT3QKvQi7JrdG68J1Q7b98lp3BI20+k5XSpkJyBzG1QzAlIHVt4ZvSeL581
	dYxI8qOBpvHbx/7pK8EpTh8pbyU9K99idVvZrJyv1vxXCKgS+05Fv3B//I72V9ymiAx+LulFR3+
	MhCaU0ruqSbgT5OeUMHRPzJ1do8WEVvn5YjYCYlcERhqZYvmHuubdOR7PDZmgDXPp1KJ8ampxce
	XbbuxNFIZBUuLT73RE0SqPJ1RFhOpJniXvDYBplwXYU98XHJ7f51T2f3qYaAAHf8bA0YIdoo8dS
	Nm/3BFToaiF06apxeX1b9oODBgLgtBSAYPTCdaTUPX3cn/eTSQgw64rzJnDsds4QCtQJdnQTUUH
	Hy0049YXvtT5oxABx3WF+jGetQSaQ4n41OXw9RMXVSj33M21Tr82Ls8adPPcnYqiamqvNrh9MA6
	Y2jXsM=
X-Google-Smtp-Source: AGHT+IEtsjzvo2jB+dbI9VQ7yZrjbx6yvK3VRttDJmqZME09yWJ/CiejjRuxkvbF6yvGpf9tC/V6mQ==
X-Received: by 2002:a05:6512:104f:b0:592:fb5d:6300 with SMTP id 2adb3069b0e04-5987e88bb77mr1971804e87.10.1765181045203;
        Mon, 08 Dec 2025 00:04:05 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2b7sm3942418e87.51.2025.12.08.00.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 00:04:04 -0800 (PST)
Message-ID: <bcbe66b0-23bc-4ba1-93ab-f2c09262e07b@gmail.com>
Date: Mon, 8 Dec 2025 10:04:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig dangling references (BZ 216748)
To: Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, andrew.jones@linux.dev, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-sound@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paulk@sys-base.io>, chrome-platform@lists.linux.dev,
 Paul Cercueil <paul@crapouillou.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Cameron <jic23@kernel.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-sh@vger.kernel.org,
 x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_000409_028780_61B911BE 
X-CRM114-Status: UNSURE (   9.72  )
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

On 08/12/2025 04:04, Randy Dunlap wrote:
> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
> 
> The bugzilla entry includes a Perl script and a shell script.
> This is the edited result of running them (I removed some entries that were noise).
> 
> I'll try to Cc: all of the relevant mailing lists or individuals.
> 

Thanks Randy! This is good.

> TEST_KUNIT_DEVICE_HELPERS ---
> drivers/iio/test/Kconfig:11:	select TEST_KUNIT_DEVICE_HELPERS
This is a config for stuff that never went upstream. It was replaced by 
more sophisticated kunit_device, which I believe is behind the 
'CONFIG_KUNIT'. So, this should be dropped, thanks!

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

