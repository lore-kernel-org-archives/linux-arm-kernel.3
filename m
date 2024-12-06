Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A214E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 06:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMffPOBou4ApM/oKbk7Jpz+gd/smlJwjIwPuRVUfC5s=; b=L81yZP3vdEFnm1XmZJ6xWv/9pH
	m4uS+yT0BbImsKUBDNZL4nob/vD7LaoEXLLBwBXar1NrUUZ4wB42hW+G9lV18mt0q2HLKeeTY+1eu
	HptCjKWRNlltdMrEdAY9vrez33sIP6zOK56uR6XosyT1Eg3UG3TdaHyb5ndcUgl/Ab46HsxE35kaM
	M8LrtpGMtMS/trENAdMx/DxRqax81Qt6/4r8hZjeaBOx9K073EMoMlIVA0VliBY2cr7s5kLQ4HiRH
	Vibvt9CouYf58kGDazgqzS0NFouqceIrT7dloWBVdRpGD/ZTLEUSpnDPruCcJCQ0BG4QBHBCI5U98
	oNf2NJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRNY-00000000f8F-2DIM;
	Fri, 06 Dec 2024 05:59:52 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRMX-00000000eud-2fWv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 05:58:50 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7fd10cd5b1aso1267037a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 21:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733464728; x=1734069528; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lMffPOBou4ApM/oKbk7Jpz+gd/smlJwjIwPuRVUfC5s=;
        b=IxkdoIlDeS5ylJxSt3rMvnQ4U0Cr0PSE0xrywc7Ql6EQSyOcKoQVjlyK9B/oiH6kjr
         HievUNDHsAtaTVZHQ4FSuAJAKm8lDnJtqXKYGot9ynTorGOpl7q/7r+uQ1OSN04kVXR/
         bLye8nCC9N7k+rCWslpiZG3BlWLCF9ZNO+hQyjgLx3cHjGxfwCwTlI+XBHSNv3vCDTb/
         IllNKyrCUMUuTw6QOomwC+Ry25inbhPh80uYw3fMb1JzqDgFnmrksRsAIt7y9N1YZBGZ
         LXwJGbJEHu3WU1CQoMK07krbDYuSciso0ZRyBsV83ZcFlB84A5e/4oL2AaTn0kWt3wkQ
         6I1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733464728; x=1734069528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lMffPOBou4ApM/oKbk7Jpz+gd/smlJwjIwPuRVUfC5s=;
        b=BN1K6e4p0bcTQ+7pONs5EHkyJMxCVrgMtg2Mloqa5gtsARKexxLA4//axDjAksW4sk
         UizZwSrMX+svoQKMABm75U2IRZIGQT857CLX0jS3d5tFMtBBk8ldvIYO7YignFExgwDL
         b7dR2BbXYaGO309Ri6HFjtLCBG3CUFy0tK/fEWgtZvb9poNP1/YRmnx/9iAEeGc7DNYF
         SKZZ9pYnL02VA906MTd4Bz0ft4kqUwnJJpw+EYFAlG1K33c/WQf56abnbwx8RcDnlPn8
         fqK+kgxh+1M0LPKLz8zMAG0r9yeX2FvNTuwXYPbeZsoomnmwoh48IVlFmpMzFyzFrSDv
         NDqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu/4T59/Xzh8rYJL++Mwfy2Lem9pU2tdxDhgoCYPFH8HZEzUO2jxlHDLbfi35F6PtTIk0cXk8R23kjA0x0FPI/@lists.infradead.org
X-Gm-Message-State: AOJu0YzdOicLb7W5hm9okDo0wDWgV4rAVahAZjkFur6+7BtXbP5cfnza
	wVNhdYtPli/C7ia0e8hNQMTB/zwFH9Z8+N9AG+p6PvqSi/9N5mR5
X-Gm-Gg: ASbGncuCsglWJ0cLZCHDBjYHFew4T1k6ZjV8sh0IDtQLNgqauvE/JQ/AyGrZSDdimCz
	3lx66DyRsvsc+TV3tJ6Fuzu6PUN4UmckVKIpqTdpQnaYfV0FIk8yXqv/s8VvIrpYYT7QOO78pWo
	8CdTCUPsijRqPigi6ZRiqI4iSbvQO/YqyS0AZUu3Uk64Gk7STBzJnd6wu2TA8ujWGNM1BojKxn7
	VOCSPTLuQybD/cFMjxr6VpAxf+xSCUJKUylQutT0LLbZcBWof2qpfyv4DGSUtiMW5zM3+YDWdjQ
	c5qQSR4CRH8sBUjN2SZxLUV72iE=
X-Google-Smtp-Source: AGHT+IHPfPT9xNQNvD9xypuyp32gyiz193e3lLstgaForyQc7I6KAvgXXUi+e6BBqDK4LtBmwvD8/w==
X-Received: by 2002:a17:90b:558e:b0:2ea:4c4f:bd20 with SMTP id 98e67ed59e1d1-2ef6ab293a0mr2793171a91.32.1733464727811;
        Thu, 05 Dec 2024 21:58:47 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef6ef14312sm451774a91.46.2024.12.05.21.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 21:58:47 -0800 (PST)
Message-ID: <57648ce7-7c43-4ac5-81d9-35e8a624df22@gmail.com>
Date: Fri, 6 Dec 2024 13:58:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 2/2] pwm: Add Nuvoton MA35D1 PWM controller
 support
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Trevor Gamblin <tgamblin@baylibre.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
 cwweng@nuvoton.com
References: <20241024104309.169510-1-cwweng.linux@gmail.com>
 <20241024104309.169510-3-cwweng.linux@gmail.com>
 <5a6ad0dc-f777-4129-962f-e10a0f7d6ee1@baylibre.com>
 <fllw3dv6juj2vepsnrb4lajh2j7b42jl6rzncmvt57gfaalgiv@sypw55h54oag>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <fllw3dv6juj2vepsnrb4lajh2j7b42jl6rzncmvt57gfaalgiv@sypw55h54oag>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_215849_719907_CA8337C4 
X-CRM114-Status: GOOD (  12.49  )
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

Hi Uwe,

Thanks for your comments.


On 2024/11/21 上午 06:03, Uwe Kleine-König wrote:
> hello,
>
> On Wed, Nov 20, 2024 at 11:49:48AM -0500, Trevor Gamblin wrote:
>> On 2024-10-24 06:43, Chi-Wen Weng wrote:
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/pwm.h>
>>> +#include <linux/io.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/math64.h>
>> These should be organized alphabetically.
>>> +
>>> +/* The following are registers for PWM controller */
>>> +#define REG_PWM_CTL0            (0x00)
>>> +#define REG_PWM_CNTEN           (0x20)
>>> +#define REG_PWM_PERIOD0         (0x30)
>>> +#define REG_PWM_CMPDAT0         (0x50)
>>> +#define REG_PWM_WGCTL0          (0xB0)
>>> +#define REG_PWM_POLCTL          (0xD4)
>>> +#define REG_PWM_POEN            (0xD8)
>> These too, I think - it will make it more readable for others.
> Keeping the registers in address order is the usual thing to do, so
> please keep the order of these.
>
> Otherwise I agree to Trevor's comments. Thanks for taking the time to
> look at this patch.
>
> Best regards
> Uwe


I will keep the registers in address order.

Otherwise I will modify per Trevor's suggestions .


Thanks.

Chi-Wen Weng


