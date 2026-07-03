Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89620C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHBixXF0joeUv/ZwlLB2ZHCvM2TQE0OYai8QhyfV/nQ=; b=Wq4Ykfuks/fsQVBId9ZqlSSuHC
	lfRdpPIhIp+T6H1iNqVcxux8rR7dN2TQQs0z0yZfFAiTUUCmgbNcDmksOhSAWtHa8aBvI4Y2ZATcP
	z2PVh8//LEwGViBH72bCommIQoAuiEvv1k29g/HI22tl3o3Q78iM0ieEns8MabmJcOjE6BqV6Wu30
	bfpMakZALhWM90O5qldUgPZFtcYOKnEJlH8jez0J7lEWmigdPOU8hbAOIQI/ur5NjIi/Am3FrFAwn
	gYp8+VJLHyslffWDALS13TD7B1b3Z64gm368QlqkDD6GqXD3SvAeR98U9GklYWpzGEDZx/MSuvN+G
	8UXfW28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfksV-00000007tQt-2A9Y;
	Fri, 03 Jul 2026 20:52:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfksS-00000007tPn-2XXl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:52:49 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so6638525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 13:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783111966; x=1783716766; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iHBixXF0joeUv/ZwlLB2ZHCvM2TQE0OYai8QhyfV/nQ=;
        b=BLUzFCW2BQM2cp5VcIM0kenj6ETLvJ3oOq0ePxTmPr+F6ZwcVbhBxclZ5p3YWts3r4
         l6EwKewDJK5bTzmGZZNoE7S0E4+S4HfGB9+1T4Q3llRwqG2KjFb/O1IqaJHODLrJ+KSc
         kLKrXdYo1M26HO4EoXZnioDsWj0RzBOGK2Lziq+Fb/y988dsZ3RQs55baA2eDoR7dmdB
         kZfOtGqFKe7ly4V4AeI5bMDph3Nu74IdMZsOYIWFM1b3cL7QLdch/r/djJG1KXpHSz4t
         sr4djnfPrFiC5A/3Bc8LHL+0SqvxJNRzzA93IURpBXptGEytI9m16Me7Gau9tAY2Micy
         shhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783111966; x=1783716766;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHBixXF0joeUv/ZwlLB2ZHCvM2TQE0OYai8QhyfV/nQ=;
        b=kfy9KRLRLYvaWnYbaF2EXBIbcDlmugPdj5jFmtnMATGRHZE8eRHTfeiaU12RqkFoy3
         fp6/qbfJphKNIS+GmKeQyKkPpYLMVkQ+HSVwnaWBJ2lVCLaspPZvWbLXwhDhqy0KKUWw
         wPZ06VdavzZ6GDvn0uyV2tG5koeftdnyO1OfoOHvDWuN/X7uY5xzyJ0ujoMFWc5nEwN2
         j72ycbSOHN5FtIK23QD9CrX8g+tOGEAawdyC5v2JmfBvJvRbZpN1Qunnf2eNGR4m1f28
         31ysFSUYGZcwdvqCsbtng9bIhpoR15yqts7ipjS+0uoRWDugcissuu6LM+ocYyNd4ReS
         B5LA==
X-Forwarded-Encrypted: i=1; AFNElJ9aqk3Mtv6WoKTFXAyBRNK7BMgv319/egPl7LBn3hKR8gEU4ZMZ2xUe4fRCyJ6Nb1jdUv8xoh6Lusaqohqctppf@lists.infradead.org
X-Gm-Message-State: AOJu0YyJOL1QdlnwI32UHdX/9ItMwhv4BGs/hYvKSlWM8JcwvcgxrocA
	a2ko1nuzmPLATvoZKAK7hbKelFFU+S64buq/5Vu55N924k2A5yTc44L/
X-Gm-Gg: AfdE7cn9sRmzhOyuUx2ozb9pig1in2S4O93yMhLdO4GBn3ZjlRL9TwFciPOuVHQ0aQs
	r6MmGcotuazXV8lGw2XuxdUQiZ4QByammCEJTAD+nOJS3ExyMAKDoHmpnqzrp30hoj+tHw+bafC
	57JyErn1BI7r17YQud9qjmf6OY6S4aH2LEBrV6mkCP0f9gcC2qlu50PSe2Zd7ypHY7ZtueLMB8I
	Od+RrBs/vAQRoXm1uT5+lR+3NrGExYmSp7j7A55bLvs84ZaCPl2qosP/vta2lZZn3Anyn6Qg4P3
	WWIiNEB4RZiMIYfXrgQlI/5YUrJrRZJa5xHVf6J9j78UOR0mmiPtnVNOimfe+LsWypewqnpqk0f
	8JrvQlsoToAs6rXjigBC+EIJR2ErIIvl14IMtAgRLpabjldUbY9JiemYdAWgtM+xJF+8JHjJExl
	94Hih1V0trngbSFw8NJZTEdbEJsrIkadlnPK8FdZfPrHHBbLURQBzlgDqv
X-Received: by 2002:a05:600c:4e13:b0:493:b729:3a9 with SMTP id 5b1f17b1804b1-493d11f577amr8863935e9.27.1783111965965;
        Fri, 03 Jul 2026 13:52:45 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef183e7sm259988995e9.2.2026.07.03.13.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:52:45 -0700 (PDT)
Date: Fri, 3 Jul 2026 21:52:44 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa
 <neal@gompa.dev>, "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: apple-soc: Calculate frequency as a 64-bit
 value
Message-ID: <20260703215244.437ec9ac@pumpkin>
In-Reply-To: <20260703-cpufreq-64-v1-1-c406c705319a@chaosmail.tech>
References: <20260703-cpufreq-64-v1-1-c406c705319a@chaosmail.tech>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_135248_670223_C996EC87 
X-CRM114-Status: GOOD (  20.75  )
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

On Fri, 03 Jul 2026 20:52:48 +0200
Sasha Finkelstein <k@chaosmail.tech> wrote:

> The current frequency calculation is done in 32 bit, causing problems
> if run on a future SoC that can boost higher than 4.2GHz.

If it matters you need to fix it for 32bit builds as well.
It is pretty much really wrong to use 'unsigned long' for frequencies.
IMHO the should either be 32bit or 64bit.

	David

> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
> index 638e5bf72185..6a0f1d36578f 100644
> --- a/drivers/cpufreq/apple-soc-cpufreq.c
> +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -288,7 +288,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
>  
>  	/* Get OPP levels (p-state indexes) and stash them in driver_data */
>  	for (i = 0; freq_table[i].frequency != CPUFREQ_TABLE_END; i++) {
> -		unsigned long rate = freq_table[i].frequency * 1000 + 999;
> +		unsigned long rate = freq_table[i].frequency * 1000UL + 999UL;
>  		struct dev_pm_opp *opp = dev_pm_opp_find_freq_floor(cpu_dev, &rate);
>  
>  		if (IS_ERR(opp)) {
> 
> ---
> base-commit: 4a50a141f05a8d1737661b19ee22ff8455b94409
> change-id: 20260703-cpufreq-64-2a23d7261e09
> 
> Best regards,
> --  
> Sasha Finkelstein <k@chaosmail.tech>
> 
> 


