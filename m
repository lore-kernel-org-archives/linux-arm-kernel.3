Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06890CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 04:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arjU8c0gMWG/kpgGcSvie4tGWMyvwYL1JUgLMfyHiAA=; b=oFFVHP8PH/gdR5T57wHCDS1rHA
	aVPvYkpYVB95PRnSTsRC2hICDN3STY1jtozZzCij2ZdysAx90Fj1ai22aUg19HaTvUsDJqT/rqBUr
	G4WVIrjx02GALqSHGquePp96Q+OSe9G9RUcYwitND/iXWbZgBSSg0aKNBKyPFK6FjordifKDAORHV
	sWlObOFkoFDzUBDL6P0GKLwKB8WNYTctSoLGG06RjTlejWOvyLf3P1PMpVQIOOMDuIq7TwpXDIa6M
	Eaktsm2AxEtZd2j0ZLNIzOLHbvwGDKDx4FR51+m54ujDfNwcAypznWUntwn9QSejJmDrdKuy4glqd
	m7nZeBuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8WTo-0000000F5xb-2Npi;
	Tue, 14 Oct 2025 04:17:44 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8WTl-0000000F5x3-26p5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 04:17:43 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-789b93e9971so462882b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 21:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760415460; x=1761020260; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=arjU8c0gMWG/kpgGcSvie4tGWMyvwYL1JUgLMfyHiAA=;
        b=uSzO+IMGcL1E9JyoyD2WE67mNugfoSUwULlro9xo8aHLafFo5zBDzUnwIv77HiGlU7
         QbrPcyVneg0/jfhL3FpghKb7DCKlUbVkK5X9RDDvB1Ck+MombXv20pfJp+z8M49CSIh/
         cmAn7IA3SqZ2bKS0OIs3YUjbnFOJzSWMic1kZjwGS0W52roymAhHKShxvuWZ97fskaID
         4Wa/P2hLfz+Gm9wWG5eV6trwqUEIN5vX7x6YW1vIeQakGgX8K3o/+sIUNHD8apnDuiNE
         ckvSMSPoHGNsUifRAVforoDG6j0RL31AAQE3GWa9H5EQoa8O/wYEuRhSXNm25A0SqVnu
         NIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760415460; x=1761020260;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arjU8c0gMWG/kpgGcSvie4tGWMyvwYL1JUgLMfyHiAA=;
        b=dACB/7mHfcRcZvXujpXx7F4vAB/idiOV3+kysQZRZ6o1Ck+io30f9Qxn6p5g9kbhCM
         ECpQYC26MTkBzkAvw3Re2cveu6646FFk9FOrjambOCuFD7hB+yQZ+tG8dK7jixsLmcPU
         gmiizVZAEBnunkjvG0XFsJcLjbU+TI0zdGwqE1glqKPEEgGZy8UfoXlmAQ2UdjtwYeGY
         0J5Sq+/hcWmgO4N/oVUghJbLYuNJaGCPUczPS8N6xa6lwdD4BcgVJ63ZG+25LZv4EnAg
         tL9vpxeJoQhD6fG8PT4Ww364yiBKYQTn7mXala333r/wjwUGbFpH3UdZbYary+HKqw/P
         Xqsg==
X-Forwarded-Encrypted: i=1; AJvYcCVFERaPksHtLrtns0+S4Uc0lPtgWG5OzdEThj6qiIMj6rYbLf32Lt+kg+XkgLXaPmcgXyNa7sT9SawfrktjFMMb@lists.infradead.org
X-Gm-Message-State: AOJu0YwtAdY/JBolad9z0mypkSTRriyCKK7YTr1tCEV1Uldj0SKUjIWA
	QUO0YmumXAakz0/99kGkOsy8cvmiF2dP+FJBqCtlF45aoM8fuTUl2B5P4AA4s6wYFb4=
X-Gm-Gg: ASbGncsw1dHSJaKMvHfPANLC9Drf9Xdi16Pon9X+k6cI+H9Yc8MvWW1Fo5LdEt/Md1G
	mffw+nD5Bumz7tQFDpmKpcKj6LRs8JEl+OwAjhlPNdWY4P3SXHCkcIL7Mr2GeZWVup18XiyBgna
	2c58PLDu+weNNcLNzGsUBKQi2BH4517o++IFPbFolpEqRqyP8Ys5sqLnX+0CFAopf4Jku0FWAgD
	fpkjIfW7ASZa7F/aw7NQ76pfmP8JdYwPtvBq4OsiC5+aQGZyXOndtTRB/L17Tavlmhz3vew6BZj
	f9vo2CzQUYmT+eow4yhr73KNDfR6wpTTTLBRBJlNh3EmEccAzL6IFiHpOkphHHmrgyA7yQeh9An
	IhuWMSRlJxGGIClTA1hocgVZ2fjrwbTRwJ0fKHIENa8XHKrl2EV+RmdxJhj8mC7bFmMc=
X-Google-Smtp-Source: AGHT+IHFEXB/njPZl5vxE8uZyWSWxsbxvMZmEol6YVsnCuQe564yWg6QCF5koIs1s2vhnIhRyiS0kg==
X-Received: by 2002:a05:6a00:3903:b0:742:94fe:c844 with SMTP id d2e1a72fcca58-79387431905mr12997458b3a.4.1760415460242;
        Mon, 13 Oct 2025 21:17:40 -0700 (PDT)
Received: from [192.168.50.149] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb19d3csm13348773b3a.31.2025.10.13.21.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 21:17:39 -0700 (PDT)
Message-ID: <19c67d4d-ed6e-4471-bec7-893d93ba7a00@linaro.org>
Date: Tue, 14 Oct 2025 06:17:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Remove the redundent SCHED_MC/SCHED_SMT
To: Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: patches@amperecomputing.com, cl@linux.com,
 Shubhang@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
 geert+renesas@glider.be, arnd@arndb.de, linux-kernel@vger.kernel.org,
 peterz@infradead.org
References: <20251014023158.500932-1-shijie@os.amperecomputing.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251014023158.500932-1-shijie@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_211741_691730_D370BCA2 
X-CRM114-Status: UNSURE (   8.89  )
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

On 14/10/2025 04:31, Huang Shijie wrote:
> The patch "7bd291abe2d sched: Unify the SCHED_{SMT,CLUSTER,MC} Kconfig"
> has enabled the SCHED_MC/SCHED_SMT by default for arm64.
> 
> So remove the redundent code in defconfig.
> 
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

You should send it to soc@, probably.

Best regards,
Krzysztof

