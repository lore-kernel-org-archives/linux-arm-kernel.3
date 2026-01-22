Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A11EC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 05:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDSH9T22AnGw42Msn1988FOkNE4f4GpObhLMn2Rva0M=; b=Um1Rl4PbER0gEwPIuTmQFrjDgf
	0790/H7fWSEMkNQxe/cm9RgGuegGBZ3N621n2xPsVY6kCl53d7pgw+ESAxLVb8+06DiHYjrSXp+hZ
	qwwr/UGENjpHczxC7yIZpSqeRgYBTeOwuxEolWaUXVLIglliMajzaQwM5grsQPGJzGMWVAZb2TuDa
	UnVxcb+pf0bBCzZ1VBN1MPeUexLgv4/HGQVS7VmGoG4oliPx72fWU8yyLr8B5w0ct7lGZf0CjnsJ6
	0abkuGWlbmQnDkT9i5IpkHavc26obqqY+fpdKtkxJ0pIpd/J9YowJUyKeGuwzHUg+I3F72p6jkgaC
	iCHz2VFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vin26-00000006SNm-1Z02;
	Thu, 22 Jan 2026 05:15:02 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vin22-00000006SN4-3n0X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 05:15:00 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so378341b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 21:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769058897; x=1769663697; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cDSH9T22AnGw42Msn1988FOkNE4f4GpObhLMn2Rva0M=;
        b=tuYWEhOd/29wYTkaRrfiUkwYjOmXsGiTxD2Pqn/UUUWFXMrm8RrRa2BRZRs7m8v8dL
         UeEEr0xGe+QXZgxRiyENKjOaorZD6RxJ/Ftw/2aE630K7w1c4/OGOptoEy0GluuAg0+X
         dvAMWs42+/C1PqDD2JJQTm7vMFfnNjEaYIAaH/Mk0x94wIdPFbamDvAfGCeZDZ/BR/Ip
         tMHMfbkjMrbPD+Tuaz2q1JALDS8Wjl70Kp6SuGkBaNlAUEYbJPpZi2y3moQivsXOrIU9
         kyJNbR/EG0REIQ6l6uiG85mbo2Lrrt48p2CEAwJp16/7IYndO8cDg2scf4aFELxN11Qt
         nTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769058897; x=1769663697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDSH9T22AnGw42Msn1988FOkNE4f4GpObhLMn2Rva0M=;
        b=qId4ImvKWZgJ5Q+yIqwl0ekLXqu0HeWmLmSCOEDP21+Pk8YJDLTdFkyz3dkSMuHG9b
         dQg3q24b+/9DVtmrYhZnzpcDYidYeTDvPnzwVQAt7harJEzcC5UYTDhfAWGOH6KMSmjZ
         IvPOLhrlAmkdPMfNZv01lP3lC0tHym+9bq3tfGEscH/zuKEGGqqMPMvHmxoGp1lXpAL+
         skOGZRvr2z9o+7mB0A4w/XEb2fjjZ3Mlq0o9ggGUY/A2ca/RMlTaa3ZtV/no/+zmSuH3
         a+EtQIjEDLwZRYg0JuC3Qqbiw5T3g306tacoUEJ8k1trx83sDrmFoAgVnIO6IC1B/1ZY
         7vyg==
X-Forwarded-Encrypted: i=1; AJvYcCVfY4TJt6B56Dj0PiLibzQRVIw4zz8txGdOoLq7xUiq730Yq14V2xgr3rbi7lrkeo1VjmpyU3lQDIPnvGt2XzoW@lists.infradead.org
X-Gm-Message-State: AOJu0YzBeBmwDZL815P69lC797WU+BzRigwd5rUsRx4OJAbP56f8YpC6
	teHM11xTFzRMgxhZB/Si2nuP2vWmq80RQqE8YwYpDgSrNzaZLLlRtYiCuTtVyk2B2uY=
X-Gm-Gg: AZuq6aKDppkBkB+XUCO3HhvYMb5fbJd27qLx2mswOOMEkeUqMg68gUdswmjSMFE3hEf
	AlDXs2VkUyLCDxMtuGzOigvBl5NQBg18Czm0EeNSEHLbkeqKLlCwyO0HpunJKEGIbprs+NWpemz
	Rb+MWZyyY69hTGAMI8GZKSQ1CF9d90sle38EWu5LGsvOFwfQeYDzTdtXygewFuK26h8VE1IOfQD
	E0UcBHgFTWrqzOA5AaAjKA13q1th094lKK+v3Fy/WLYqPP1MJ1Vgo3qbaO9/S03sLpZP3PL8pdH
	xQ4SlAvnYFwY3RxiCiKkHx3RXvaI15Nbsm2TcOCL5sC/zyzD+w/XKlBO9ZrSgRngsMk7Vl0Gk5s
	noaM7OVW3+wA+QcFATyaEu0hd+m9L9rMSvav5Xl37VnV0UEeMfzyGCxo4HE5LziVBEB3dUjvjo8
	AjxHkX1JkiCqk=
X-Received: by 2002:a05:6a00:3926:b0:81f:b97:14a with SMTP id d2e1a72fcca58-81fa189099fmr17209182b3a.61.1769058896603;
        Wed, 21 Jan 2026 21:14:56 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10bdafdsm16573033b3a.15.2026.01.21.21.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 21:14:55 -0800 (PST)
Date: Thu, 22 Jan 2026 10:44:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: scmi: Fix device_node reference leak in
 scmi_cpu_domain_id()
Message-ID: <yjiuqamotpwvojo6hhj6w4nqwkq4i3ynhzemkwughyxmtlyrnj@wdhojg2m344b>
References: <20260121-b4-scmi-cpufreq-v1-1-b0547210feac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-b4-scmi-cpufreq-v1-1-b0547210feac@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_211458_977129_057DE543 
X-CRM114-Status: GOOD (  16.03  )
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

On 21-01-26, 23:32, Felix Gu wrote:
> When calling of_parse_phandle_with_args(), the caller is responsible
> to call of_node_put() to release the reference of device node.
> In scmi_cpu_domain_id(), it does not release the reference.
> 
> Fixes: e336baa4193e ("cpufreq: scmi: Prepare to move OF parsing of domain-id to cpufreq")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/cpufreq/scmi-cpufreq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index e0e1756180b0..c7a3b038385b 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -101,6 +101,7 @@ static int scmi_cpu_domain_id(struct device *cpu_dev)
>  			return -EINVAL;
>  	}
>  
> +	of_node_put(domain_id.np);
>  	return domain_id.args[0];
>  }

Applied. Thanks.

-- 
viresh

