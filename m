Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CF8C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ky0slvl2m0Skj+7SoImzSsZ0KF7nAf3DtsbkUIFEsgs=; b=r/5PBv8SkpPMd2lsAD1EqYH4LX
	H4oySxToIGzccHDfgATmxDRr6Z5wgj+HOHx7TKq2gcLaKlkAMqHtgHZdAdHUW1w10dWtLvhArRSns
	LH/amxYbgW4q+nGRE+9VB2M5ivMvyrvdSp1hEKbhr06u2jQzFJuSlQhv4fUzQYiiGu04bxtQ9Di96
	31c3BoZzHUyHxnjdQptd8HsAJPhll5rLgew8Zhpkf+7y4yD+xdCYagqarc98gQNXQePvljLhdBHj+
	GfVIUdDRXikvbOsj9ZWA0NN/e5UE5/NjLdNX5pDRbUBo9qXqXLzUIQ6iMZbqMLPjht1bHc2ZjTIOI
	DALFJbAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GiL-00000007xQg-0Fru;
	Tue, 22 Apr 2025 16:43:17 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FVl-00000007hrm-3trH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 15:26:15 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2295d78b433so61969605ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745335573; x=1745940373; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ky0slvl2m0Skj+7SoImzSsZ0KF7nAf3DtsbkUIFEsgs=;
        b=NutR9BRNgOljWyi6LPjPrcvR1m5Etw4qDrNfKiWSVYeUKu/3mV92yCHlx/kndAcg8P
         0ATL+qJe/3dQM1Tiv/rRuYQsia97QbEIuIiYWf7GLXP04fkDFezwwOKqPsIs1TFSEgmS
         xXxHoooh+9wR7dy1Pa0Nd+GilHz+wADlCbOixv1XPgnfLWGRlY4ZDfvl9MtVN9mJlb+y
         ym12+z1CJEzLzNdtjT3YEwUdct2VdF/OxvhzYxvvq6A1GK5YAxmIJu9zeHEkpOJEEqdu
         Aw84LK/afGlxXAHO1onAaVQzjQD5zRT1Jn0JwkYIm2/cwmiHwFUeaNko0vDuCGuZ9EH7
         oL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745335573; x=1745940373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ky0slvl2m0Skj+7SoImzSsZ0KF7nAf3DtsbkUIFEsgs=;
        b=noHkHPxZJ5RYwC+YiiP3BZg5wS8KS2QCimQUb5HKkV+HiA+mqRRcIX33GxJc4sOxNI
         rhnh00CjkDkl0YxKehbUTYErsVzoTNpa3z6gT9X/+ZQtFQ5kfMFzjS/LzYBz0NFJ7UkS
         kjbIwvGw+c/uiwh4pUnckbE7ljkebDgdA2D2/gJrdy7VPk2yj7d1fF8R+jrDGTmIJWvn
         Enn3wBrVWfo7FyNJ74YiTNCxUEtMpOIG6H2AO2RKOI9F0q4UhFg2+rvO3gkoMV6DxLmm
         wJ7pZ7VqjKDalOak8mg+T6jWDzD3+GfcYSvhC7YO+Oly3q2WsZ1DzlmMkLiHh0xtXEVS
         TxJg==
X-Forwarded-Encrypted: i=1; AJvYcCUTU8pYPiurFN2Hvib8s2uRag3VCcR9JmwM4r9x+hM9V5BM/3mVP0WIbss2Twp1gQzGtRW9ZTB/rLTG1tRZnyaD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1FZnh3LKDH8wDliYgXv4oDL5vx8XlZYhtMv3iaK2fBQ39vpWt
	qCMPt2EqdoK8vdgy6UuaeeMTIt2+CA6sNyGM2cu/z2tjy9Plngzn
X-Gm-Gg: ASbGncvRF70KrU2J0273qgTvE8/2pPJZCKDmUiGdJI7PyfX1ktskEJZ60H32OJXldm7
	phFxqi8WGFTkQxv6kgPrVlUJR+sfTz0GfpGZc/8/BgAdDRgVqRm8/08XEXWwnerq9/V/BbR2SQe
	qPVegZJkjNbmtXExA7RsHllbpOu3gQTv4iw8fZDNIJoWMvTh+ZFcuOglb1CbovtDq+m4CbAFHh8
	4GhEAp7ubDO1wfq5x3b1DN1LQ84XFzOTzLKlqXRlW1VeOpY9OyD8X0zo52zLf3+jRj07ITc6C2y
	oHBmwZATpkUkPFfpiKBTKZIOet4ADA==
X-Google-Smtp-Source: AGHT+IHYPLeKGWL1fyxBzXyLrmUfwx8HCx9qyTTP5pFdjq3MaUZ0+J0RZxkXJTfIv6je3bWU3Fj+qQ==
X-Received: by 2002:a17:903:228a:b0:21f:5638:2d8 with SMTP id d9443c01a7336-22c53620bdfmr218015115ad.53.1745335572548;
        Tue, 22 Apr 2025 08:26:12 -0700 (PDT)
Received: from [192.168.5.101] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf16b1sm86663765ad.89.2025.04.22.08.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 08:26:12 -0700 (PDT)
Message-ID: <918e0177-8e26-405c-93ad-8b0d2dfd3b3d@gmail.com>
Date: Tue, 22 Apr 2025 23:26:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yongchao Jia <jyc0019@gmail.com>
Subject: Re: [PATCH 1/2] i2c: imx: use guard to take spinlock
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
 <20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
 <20250422161213.0000597d@huawei.com>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <20250422161213.0000597d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_082613_965529_9B6D192B 
X-CRM114-Status: GOOD (  20.57  )
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

On 2025/4/22 23:12, Jonathan Cameron wrote:
> On Mon, 21 Apr 2025 13:36:38 +0800
> Troy Mitchell <troymitchell988@gmail.com> wrote:
> 
>> Use guard to automatically release the lock after going out of scope
>> instead of calling it manually.
> Drive by review, but this changes behavior in a subtle way so we
> should have more commentary here...

Thanks for your review!

> 
>> Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
>> Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
>> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-imx.c | 22 ++++++++++------------
>>  1 file changed, 10 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
>> index 9e5d454d8318..cb96a57df4a0 100644
>> --- a/drivers/i2c/busses/i2c-imx.c
>> +++ b/drivers/i2c/busses/i2c-imx.c
>> @@ -23,6 +23,7 @@
>>  
>>  #include <linux/acpi.h>
>>  #include <linux/clk.h>
>> +#include <linux/cleanup.h>
>>  #include <linux/completion.h>
>>  #include <linux/delay.h>
>>  #include <linux/dma-mapping.h>
>>  
>> @@ -1125,30 +1126,27 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
>>  {
>>  	struct imx_i2c_struct *i2c_imx = dev_id;
>>  	unsigned int ctl, status;
>> -	unsigned long flags;
>>  
>> -	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
>> +	guard(spinlock_irqsave)(&i2c_imx->slave_lock);
>> +
>>  	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
>>  	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>>  
>>  	if (status & I2SR_IIF) {
>>  		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
>> +
>>  		if (i2c_imx->slave) {
>>  			if (!(ctl & I2CR_MSTA)) {
>>  				irqreturn_t ret;
>>  
>> -				ret = i2c_imx_slave_handle(i2c_imx,
>> -							   status, ctl);
>> -				spin_unlock_irqrestore(&i2c_imx->slave_lock,
>> -						       flags);
>> -				return ret;
>> +				return i2c_imx_slave_handle(i2c_imx,
>> +							    status, ctl);
>>  			}
>>  			i2c_imx_slave_finish_op(i2c_imx);
>>  		}
>> -		spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
> In this path the patch changes the lock release to occur after
> i2c_imx_master_isr(i2c_imx, status);
> 
> That may well be safe; I have no idea!  You should talk about that
> in the patch description if it is.
You're correct that this change slightly alters the lock release timing.

However, both i2c_imx_slave_handle() and i2c_imx_master_isr() can safely be
entered with the lock held — there's no requirement for the lock to be released
before calling them.

Using guard(spinlock_irqsave) simplifies the control flow by ensuring consistent
and automatic unlock, which improves readability without affecting correctness.

I'll update the commit message to clarify this.

> 
>> +
>>  		return i2c_imx_master_isr(i2c_imx, status);
>>  	}
>> -	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
>>  
>>  	return IRQ_NONE;
>>  }

-- 
Troy Mitchell


