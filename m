Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1501CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufdypkJNjHswejxJubFk9kEYQm8Yr9F5qH7/Hz14nEU=; b=kIOnPg0gBLdPWiKBet+4NHvCz1
	gmIHZfV7AztAJpquPGHlUTevtRrtj6zjXTCECuoWfinukHONiHVNhLwCKxDoM+qnkfTzNO3uPXzb1
	MeuD82hKAP0M75VY8RpENQ4f7L2GcK9plKsnPgPmRL6GAHoxKH1jJjVgGUXK1R4VhyCOKlbws07+X
	JFpA5eMdNgi0uLibYM9WW71MNOjiwQYCmWfzbFK1Ou55GLmC5MKox5AnVMW3mZJecSOwVygIraD3b
	mtADtV0iUvMdV7VN0iGmFSaCIMKq9osdi7ZOgcjp4WR1rCf7MjrUia0U7pspezTSfVzfUhTU5HsqA
	mrTSRziQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAQH-0000000Avm4-17pU;
	Thu, 06 Mar 2025 12:33:57 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8ye-0000000Aigb-05lz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:01:21 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-390effd3e85so508060f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741258878; x=1741863678; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ufdypkJNjHswejxJubFk9kEYQm8Yr9F5qH7/Hz14nEU=;
        b=uYHQeXKLo/sZkvewrxft3Q8Bepsim8FY79He6iFu2D7EY8nbyomWqPzULsyKSdEsi5
         uNhyEQTDjKdjVJotPC+buy5jjkrlRb3IrTNlTWYUvMmcGtHw1oIxbY4lzAOQVTZMpvug
         0wDxPs9J5/y2MQtS1uur8ZJZ/2xQl/7xwI1DJHcGHkAE6OH3V856J4UHqawsB2eJlSET
         RIETbzL6QYlBKfblpd6zXCuEf+fMeazGIR59xsebdcKeOzmLyaiTOD9EuwJendC8pDHh
         CMuhvr49OEW3Lwf9yl5NJ5GCLMQxjyW1e2Ksex95twAFMYC83MNLOwn4b2RlANzJYNr7
         6BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258878; x=1741863678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufdypkJNjHswejxJubFk9kEYQm8Yr9F5qH7/Hz14nEU=;
        b=MdCvSwIaPUtSIHWPoL2e7JkTkobzAIUQyFmzc+jpba9ixEgQsyURoXNE/6vZGMMV35
         pCYIwPGfJFCKcgdpmjW5/hYuIevPFqgdXIf3owsLBZ09HixZCbLkBYlA2SfX+a0RbaXE
         Yp7oGB1OFHwTefNU7n6J7wvXRY3+ddBB+84A1278JfSL8wulzhGrSR1ILATnBbY+2cOU
         aHrQFjRgHC/8w0C/sbtg300aa3njOiJ4m5pKuiZqW8UuOwIWI3J7MsjgipeAGyg8B0wh
         wYCIpqwAFaVXvrF00oVQN332eaEHArIfPiySOa47BkA03q4ggonU3wiRgdbB/gCcjL89
         WtqA==
X-Forwarded-Encrypted: i=1; AJvYcCWFeutYTr8j4Cr3GJQlyLy8hrHWj26HTcgZrlsMOlrUYP/Z67Q77pBU0Cv/ZDzEuX2TDOvgfjRWo3gE0xBinJek@lists.infradead.org
X-Gm-Message-State: AOJu0YztzxdL/6mVKILV6Du66Y7v+Wd2VhYg/8/pgDJd/5htqXIUYrJg
	E40mQgFmEafhG0yeFlSiFreuW/fwif3B01Gfsasg6LlzFxXvf/ndRErHfXL78CQ=
X-Gm-Gg: ASbGncsNau8W/dLCzgen6oXVHSdEZ8fWw5QKcYxV/KqcDjNe7tE/Bw6c+25AC2pj1Jd
	QLFN3CNYX7c53BOWtDCglKp1cmrxXio5+gRYoXVIAmMixxIlubrwKifNt/sc+GDZv5OyGY4gNiC
	3Jt+hLpEH+sL+glqU3vu6g7/5/yhBFzzYc1IPSTbZPCLjOreZ+7rodPH/+YEOrumMiklLik/DpY
	t27GRGQmB3ezQI9hZDn2Ggtzy9STXDLwtEmTcka3sZmtsZPH8kgPTyaDceUzr7ZEQ3CNx8Uh1o2
	JU9Q1YAtmdCkJVG2c2a9+qZ6/pOSILMeW2aiIECTdTtHVPdKig==
X-Google-Smtp-Source: AGHT+IFaNI6+FuJB441Zt0saVFEq17tskKV/m1XJhXDsSDNyn2Dt0uqOjvxwn86BlqWjcXdpYtDX5A==
X-Received: by 2002:a5d:64a2:0:b0:390:ee01:68fa with SMTP id ffacd0b85a97d-3911f741aa8mr5660504f8f.24.1741258877759;
        Thu, 06 Mar 2025 03:01:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd8c327fsm16444235e9.13.2025.03.06.03.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:01:17 -0800 (PST)
Date: Thu, 6 Mar 2025 14:01:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: zuoqian <zuoqian113@gmail.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	viresh.kumar@linaro.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: scpi: compare kHz instead of Hz
Message-ID: <c6b8aa98-b5d3-4fc4-9f5d-4bf2471c3d6a@stanley.mountain>
References: <20250123075321.4442-1-zuoqian113@gmail.com>
 <20250125084950.1680-1-zuoqian113@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125084950.1680-1-zuoqian113@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_030120_062088_E49839CD 
X-CRM114-Status: GOOD (  11.40  )
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

On Sat, Jan 25, 2025 at 08:49:49AM +0000, zuoqian wrote:
> The CPU rate from clk_get_rate() may not be divisible by 1000
> (e.g., 133333333). But the rate calculated from frequency(kHz) is
> always divisible by 1000 (e.g., 133333000).
> Comparing the rate causes a warning during CPU scaling:
> "cpufreq: __target_index: Failed to change cpu frequency: -5".
> When we choose to compare kHz here, the issue does not occur.
> 
> Fixes: 343a8d17fa8d ("cpufreq: scpi: remove arm_big_little dependency")
> Signed-off-by: zuoqian <zuoqian113@gmail.com>
> ---
> V1 -> V2: rename freq to freq_khz, change rate to unsigned long, and
> update patch summary.

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


