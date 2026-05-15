Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A375CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+pupytczKAjPJGodDLVEr1rO2j5I2ZpqEZPCdYnJ8c=; b=RatqQqiaha3eURXJ/AFKZaGFnR
	4/mxJaeNlPFm8bWbXp1QFKDeNmxt6thkvE/P0cJ6CnBii9o7edXkdHBhKyYSBfOErgCMEPC9V8ieE
	QenrxLzFWFD0I+Pry7Ojv5patl25YgsQe4p9z3aFpS122biMa2i5/HTZE+S4D0Jk7S1AX6WfcD0PX
	X7b5iruc4YZgP9J7k/vSBRmMwk7m95aBPuYsk1QvEJlLiIY+LAJdqee9L8WIlDBYHt+by4Gjs/eGm
	9J0jtkR+xTtsojT79NHSwynBpbT0ZvakiHFXy/zHqTw+thFm1r2Wf+T6IiUxrlty7HHwj/hloY6Bq
	11rWnI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNorB-00000007tLw-2Sys;
	Fri, 15 May 2026 09:29:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNor8-00000007tLF-1xPX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:29:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso102762895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837356; x=1779442156; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v+pupytczKAjPJGodDLVEr1rO2j5I2ZpqEZPCdYnJ8c=;
        b=mSaGmCdcyLnVD7/CvLE42J+SC+8xo79aSbdM8PdipClVSPLdQBJHFkQgTF/MhtRQwG
         TQR/9ehqP/7qC3+GP/gJnWKWApJQ4B+0FTPvHfcQunkgVrBdFTv6+8sHlvOKj6pq3DJR
         1edei00oHwMr58fmGE/VAfmMZTf7wUCanJnsYKgp1YiAWUEn/tqGdOUEyIvJLElBtNoU
         dkHZkiaY7SpNGwZrEGXddmnrApNNhgDI9zFzpncl29kahYE+SxssY+2w2xhqSMcbr7se
         AWr1ckop1GgbShk6zMQEDZW+s6AVh1+ncKDClFSNCxpv/ANFibJIN+Gw7vMwSOOqzYyh
         jU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837356; x=1779442156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+pupytczKAjPJGodDLVEr1rO2j5I2ZpqEZPCdYnJ8c=;
        b=L2iLlfDvkPfLG7MZTnVsRwtROk74gPTnEiQQoKiiHfT2F5Dz7mYeQ9FbEEG5O+sVzx
         6VeKqwtTCAsreTn2PpNr3qPxGqEXQjxbr7yHDIrxfDr6A/ozPdlstbqKbV8lW6k6wad/
         6Q2BOCAVwALLWaOFQuQ4MEUcypLqKiusM7knkeCHGYJ1Tbl2o5DBu8tU0iYGceVrESpp
         G0ypKOQyl4mtxXA9BPiyR/ApNrRbSHCttv0lmcJ7yzi0I5qJT/bxsNMcrfHfE498pR/m
         q/zau+ua2yaVemILQ0pGyLWdcYGQDppXbz6ijHBjwObTscSBluJG/9uZe0XFqHW6TP1F
         3zjA==
X-Forwarded-Encrypted: i=1; AFNElJ8tAfTfXixfqC0wxTVL0RKk5IpZU5Q9YGxw0jEawmKWBIJ9qpUvXhFzXSII68Bt64hdyrSFiUo7uLcJzYigXhbP@lists.infradead.org
X-Gm-Message-State: AOJu0YyhpqlRvMf7sYaMToHfP1D+wdn0J8qiq/NkrkcbC5zNE/8gT78P
	pwL2SSKXeLcGeJ+W/ZLDChrWo+4RVoQsmBPu+VTGCH0b45ktCpBvsITC7jXmic21vQE=
X-Gm-Gg: Acq92OFOvYjD7ZyRvnZAh/EBeA7KuYMrQVKLaMJGbgH5W6AwccSAdmEg5ZHgRWtPCQ2
	owdRpqP1ks3ciuxk2x/fcIANNhVq28uO7mzLpnYBLnIBgdKqoh9HfSRRpXInzD9N1JYk4CBgNkt
	BdXHAATKtIjzcRkIhgQMDZDWBsBvosBAXjqOiUPO8R5E/+kR9a7zhMT55wUG2A5YfZgPQkPPC2j
	s/YmKWXtF7bAkeJc5yOuYccDaZ537dSfqGiHRfkgNtYxfM/qLFHkgsGnNyXRE8NMhP+XO2gLGD4
	5UloXo/mg1J+3tfJwh/vmmH0uO1qU+A21W8cSrHkAk0UgLxamBc0fobz2z+0ZEPK6MXNMAddpfM
	hDvbFqq6h+UYwrARZWrpKLvnQ7Bn/Y9VbmR6nSP8+ag6j2cNNHoX/2Hu7K4wIctAgdhLfRJfNxZ
	E1QOC3lUWsMacXX5adNMVWs//RgpJNgmU2
X-Received: by 2002:a05:600c:4455:b0:48e:8dec:19ad with SMTP id 5b1f17b1804b1-48fe60ea94emr41434695e9.12.1778837356485;
        Fri, 15 May 2026 02:29:16 -0700 (PDT)
Received: from [10.11.12.109] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe66544sm9672215e9.23.2026.05.15.02.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:29:16 -0700 (PDT)
Message-ID: <f15efac1-0df0-467b-8d75-18383d284be2@linaro.org>
Date: Fri, 15 May 2026 12:29:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH tty v4 2/6] serial: Replace driver usage of UPF_CONS_FLOW
To: Krzysztof Kozlowski <krzk@kernel.org>,
 John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Fourier <fourier.thomas@gmail.com>, Kees Cook <kees@kernel.org>,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, sparclinux@vger.kernel.org,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alexey Klimov <alexey.klimov@linaro.org>
References: <20260506121606.5805-1-john.ogness@linutronix.de>
 <20260506121606.5805-3-john.ogness@linutronix.de>
 <87lddvy2dl.fsf@jogness.linutronix.de>
 <1a5abd2e-e9ab-4a48-94c2-5e082f57adde@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <1a5abd2e-e9ab-4a48-94c2-5e082f57adde@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_022918_531993_4EC5026F 
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



On 5/13/26 10:50 PM, Krzysztof Kozlowski wrote:
> Cc-ing also a few Linaro folks
> which are using this platform and might be able to help us here.

I think that will be me as I worked with the serial.
I'm a little bit busy right now, but I'm adding this to my todo
list in case no else is taking care about it before I get to it.

Cheers,
ta

