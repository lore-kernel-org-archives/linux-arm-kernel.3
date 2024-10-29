Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B711D74945
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 22:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3amIaBqxn/MRk2a7GLzyv4HMPzhNOSMDMorth6/EHs=; b=fWNqNRzjSGTdynf5vi3RbfQKIl
	rA7B/oiPQzN7Qy3ndGuz3R5A8FX0SyVEH1qa//rwpM/UWvEDtXjousPwcQsCWVFg6StMEfD1HyITv
	d3ST8FOe2msmfPa0y5JAvGiN1UL8cmzuqD5rpNBDucOjheAXaccTfLBgxicF9s26vLxKpC1B2X/Wh
	mT8cQ05chEeJbZSHp/8BqRRndeM4DShrpXcq08p5i9b3Tsys9kilgTgKe98zS7YZKFt+VP1W5cSEK
	lhGEac0n8AvYDwdQS37tPF7O4GnbvpBZMXTeNEjTd0RPaxXEjs2AtU/F8WxXKU2O2M2X1SA5iUhz9
	FiwnPUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ueT-0000000G2q4-0Crr;
	Tue, 29 Oct 2024 22:25:25 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5uco-0000000G2cY-2HE4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 22:23:43 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20c6f492d2dso67557535ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 15:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730240621; x=1730845421; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=S3amIaBqxn/MRk2a7GLzyv4HMPzhNOSMDMorth6/EHs=;
        b=JlGcXYYroImkkI2P//4li5PWmzt+Ej6Mx3k6cDG/6NtDubELuWIbccRTWFjKbGYnCS
         17h244uKAzBO9stduhaBdYVgW0Fk8i3tqUXFRTH9QAUQMwKWhLkJ33yW8wb4k+vpnEXl
         +MaaVrJnGE+JMe8JGwEh2X6hW9YkL9QsGRAHMPcHSeWKe3dSAM45R+K+bagCAjsmo67N
         Ga871EX+FlRCOTeFpMdJriXBrSNwxnSGds0oBXvg/nJMTcYqFNAqrktPETRcj9ir1dF7
         NO00IY9L6haf3ITDw3IDw+Jp8GyquLcWkktfDo3Wdv1cVujVQ2ASqsUTnUiWcU9ShcNp
         EuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730240621; x=1730845421;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3amIaBqxn/MRk2a7GLzyv4HMPzhNOSMDMorth6/EHs=;
        b=bPp6ui7ppAnWo1NLSNRoee3aJ/prUKPwZiTlbsufIq/BA/qA3gc+mXSeD8lBeWSA87
         ETzcQB7kwduuo0POlCtKx799WhjmD6Gi1uZ7aaEG8t6x05fYdsP9LkAb/LUW4MAkpw/P
         fNklQVFKKA3ZFdU2/jHY1chFH/0zsrXvVUdzXnzvL9IIbN34ZyYU6xWYjFnlHPi/9jPp
         SaPVS/d+fLuKf/KOpo7HTNqB1xrUM9gydU/qXANPnv31q5Hmfb9KTCPhE6lPDucPGR3a
         dmWdiiRGMGk5ZDITEcsK2JOTMVNWsyfFLjLp/G0NnmCwwJ0ep52mbwehGJyDouRgbT0/
         8Vfg==
X-Forwarded-Encrypted: i=1; AJvYcCVJbHVh4ePfVemny3PK4/B910YkB9+WlB02JZFSHM2YqKigTg1J82Sa0yAdVC6+M4cyvczRWEb6mqlAhHEK0Rqe@lists.infradead.org
X-Gm-Message-State: AOJu0YwhLIcirox2BGthbLQMEnXpwjsDWQFCjIEMLi9wU46hMlKmZCfd
	ytWEd9g9kcjQORSb+FKbqLjXQrCQjgQrZcNZ+76fI1zj3LCmNa7V
X-Google-Smtp-Source: AGHT+IG2OJ1VL8fU2/dXLJtV/JilmSF/qgLlzh7YDYRMAY3fyaGBjvcMUfU2RkOk3ukVkrg9Pj8vqA==
X-Received: by 2002:a17:902:db0f:b0:20c:92ce:359d with SMTP id d9443c01a7336-210c6c6d8bamr214657625ad.45.1730240620917;
        Tue, 29 Oct 2024 15:23:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc082bb5sm71477175ad.295.2024.10.29.15.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 15:23:39 -0700 (PDT)
Message-ID: <58e98acc-d7b7-4160-9504-e5a7201f25e7@roeck-us.net>
Date: Tue, 29 Oct 2024 15:23:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "watchdog: s3c2410_wdt: use
 exynos_get_pmu_regmap_by_phandle() for PMU regs"
To: Peter Griffin <peter.griffin@linaro.org>, wim@linux-watchdog.org,
 krzk@kernel.org, alim.akhtar@samsung.com
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com
References: <20241029191131.2329414-1-peter.griffin@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241029191131.2329414-1-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_152342_618796_9EEE4653 
X-CRM114-Status: UNSURE (   8.67  )
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

On 10/29/24 12:11, Peter Griffin wrote:
> This reverts commit 746f0770f916e6c48e422d6a34e67eae16707f0e.
> 
> Now that we can register a SoC specific regmap with syscon using
> of_syscon_register_regmap() api we can switch back to using
> syscon_regmap_lookup_by_phandle() in the client drivers.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

I hope this won't get auto-backported.

Guenter


