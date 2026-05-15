Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB56CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 08:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9V6I4GZCvQ4hrO105EvkXgSgt7ay4sYDZs2i7Ub+jlc=; b=MhioTwbY5jnySwer9Ck+d7XNrr
	XLnIUSBf6eam2koT8Qko1q/ZUmXUgzDXgZ1OSm45ZPIXBpeoA5cj616aw0bNwh2BOT8SJwbERMo1p
	HX4RJhg7iAnvs2+6YC3ATboadQKTSGA0xV1hqD2UB0WE/pOJJrUuI+J+/JDBPTcTBMic1JFziAGkn
	1jlRJkxO/YY+uHuE1XbQuYXDoD6Myy2neHtMvxYy+dtu3Gg82mwYp6Nii9LuyeIRGhRTlYJticF3u
	Di9CSmgn4nozHZ4r+nxEYJhRUCD3rgM2n6JR8NKo9ZeNAJWt+j66tf70mrqbWSJqsh2eSoaa3ccbk
	QFQtt7gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnZw-00000007h28-22fS;
	Fri, 15 May 2026 08:07:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnZu-00000007h1a-2RQ2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 08:07:27 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so385951f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 01:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778832445; x=1779437245; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9V6I4GZCvQ4hrO105EvkXgSgt7ay4sYDZs2i7Ub+jlc=;
        b=bF3DjP63aDu8Fss2frH0ISH++y7g2D2H0I4D17Cf2tdwgGzi9IUQ+jFvDEyzirMfSz
         xipRnXrZZKNQ28/MT0A+ZJwQ5dLY2ns5gMhu2C+3M/E62Vp3R4Wu1ie9xPSEbaeFDGOt
         c7zy3tziPMNMJhPVfP83bg6uGAjwLXMTDizidrwnP5vrMX9/NqjFTVk7kSAkzuCl/Ls/
         kSk6i6FrlgBz1JG4DA/SHQwsd+z3JOoqyDO+1zPFA74gBror1rNbLV5v6vFHbuurCwcG
         Dm8GsYmMDsXJSemln57KFSXakhn6oSa9qvccGqM3apnxom5Y/WHZytuGtVMPTWS5Daa9
         rGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778832445; x=1779437245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9V6I4GZCvQ4hrO105EvkXgSgt7ay4sYDZs2i7Ub+jlc=;
        b=JrSbD8QCMhUEwPP8xHKAikysXuD6P5eWvTV59tWJ9Gc3Jd4HL5AhUWIYlVttbrCLGz
         WXtAwnYQYqxVKYP0EICA8cHVPKNxoHq9ib0wjcOJJUoDapoqXbHQnMjhLcf9T0LCAu78
         vADUoB8OEinI2qEZBzJJBO3JzKR721mPFVCnnqdwCI5KO+8pEFLByxR2A8TXiBySb2Fr
         lEkYXcP1WYZwltuIqIVAAIMWFZ/zol9a+JGYgJCJInl11R4boynxkjjsiE8ErFezJp2P
         oxTI5HjOC1pjG0HubJLFD+ot9CLE/u6NOJYt6Xkc+tPft/e6BGypo/hkY9Eo7lZHMKIL
         idOg==
X-Forwarded-Encrypted: i=1; AFNElJ+IbT2lqMNzIllYlcl1vHObiRzQZ4FQSgHMNAukjLkS9Lo+Fpk0cOR863wQqk+bPp5QyXMQfkYfSaQuVf16CVAe@lists.infradead.org
X-Gm-Message-State: AOJu0Yx32mM2Tm4+9SYXJsX6spaPMsIp0kMI855oMIsTaVPM1BAMOxGy
	PNSmW+9JDTjFJBRz2N4hFoqdNpR1fmEIqrwyq5bFzewVTbZTSRbMrgJoaqcF53a++AU=
X-Gm-Gg: Acq92OHvfhN3RmWkwnBMNjUml7yLxjMw2qYXe9gm+07E2DeQE7YKT+igcDPnucEU6vC
	UhC08V5MU38JjeeBWKFDXOSnvQus6080sahuZFImsnQtATzZOLuaI/84wzjM5QvddEwVhINetd9
	LUzijXKpCUkXu3XWWqlLkrTYuPBK6DorTp4r/DXUONtH7IeaULag0p+eVwsN6LnlCwSrZ6rtQgj
	8AjCSOmjKNUdQkif6BUhxqhR3PGnEhVrSvT+rAmk+OnToOP4PXbGfW1++Fe7SIGcGikAXBA6IwX
	+nyT5hG17TVTZbeItvMa+zssAH/o/IFzUUsN6nUZPU1LW4FGa0Z3pUZPJ2RLOT32b/1y890kCwU
	dFjssAqqU4zl7LFvnWE/cGj7/2HTO9UkROZOO+PsbpTbqK6kJrMHxOORl2B0zMdjZsgeGnRDXAf
	tgoMrhYcSa5q7FP0if9GF6xy1X0Yo7cixe9+Yz0x/FeBA=
X-Received: by 2002:a05:600c:5010:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-48fe5388407mr35383865e9.12.1778832444691;
        Fri, 15 May 2026 01:07:24 -0700 (PDT)
Received: from [10.11.12.109] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb029180sm15226925e9.4.2026.05.15.01.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:07:24 -0700 (PDT)
Message-ID: <cf52c805-a08d-4184-8520-4aa126360b6c@linaro.org>
Date: Fri, 15 May 2026 11:07:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] firmware: samsung: acpm: TMU support and cleanups
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 peter.griffin@linaro.org, jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_010726_638325_4C757F93 
X-CRM114-Status: UNSURE (   6.04  )
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

Hi,

I'm going to resend this as it seems sashiko couldn't apply it:
https://sashiko.dev/#/patchset/20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355%40linaro.org

Cheers,
ta


