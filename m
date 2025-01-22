Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB8FC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 06:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hu1FBq6m+bKSyxVrg1AK520/zGRA5VRp+1CZ8HCEcTA=; b=k3onzesNPTflaRCkCzq7svhM+M
	Yn1JhSn1VKBaq1WFcz0iGO0h+xWd3Ok3+ysuGjgQIMOm8BcIir9u7zfCsmAbVldYfCpbNNBT4jetx
	RUc09lMR3NDJbRZomJ2Zl1Fo37aZpAs+8NIZkaFYQ9B1/ZXPRf3hB/rgRbFHKQ5zSDH+54mIxahQQ
	dyGKaX1evULaZf7xRnsOd+6Yewy2eLOnhFEyvZCvpiGBwGxGUh1ECOPH+rQTzwwb/Uyiio6jyWDag
	U1YZN21idRCiVcSS+LSe66RjtjDZm7mTIEFRD90XUTDjYzJNnOSxMGDASBe72BMUYMbZW4SEzbzt0
	tEvojPVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taTwZ-00000009SfP-2qtP;
	Wed, 22 Jan 2025 06:10:27 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taTvG-00000009SZh-35OQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 06:09:07 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2164b1f05caso120673595ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 22:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737526146; x=1738130946; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hu1FBq6m+bKSyxVrg1AK520/zGRA5VRp+1CZ8HCEcTA=;
        b=btzC1/4RlbRF47DjVcnLN3qvUVE9tLNcNMXNrq6KUBMU10Ph8AUpYkaIEZac9ve/qw
         iBPjAgUbtZxc+0AJAgzBKcrNVP0MmYMGEm3usPGV/mSJC9OAFhNLZQI5byxtc8/RDEpH
         DJwx3is7GCzjk/znfKlXtu4LmLKo2Bh3Ae/LsdZHB4w5Mk+yF1glItCiij8KztwDKAWU
         DeGx9a0APjmNSQcPBtntDzqOgU67Dt6rsi2qrXotP15eNArioHve1BQXz464cLnezAFY
         NDgYcefx92hyYhxdeIvVxjrrE75UKMKahAUkfpVjmRgdwHuWVte/yBpwkR1xmE8Mvgfn
         cFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737526146; x=1738130946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hu1FBq6m+bKSyxVrg1AK520/zGRA5VRp+1CZ8HCEcTA=;
        b=Q39jPXcx9G80jlDxzAYxUFAYAYoGp64tAUxs6glmBGFG/fTFBqS5nQjqQq7nNSaaPC
         7FCoOGyCNeQ5vcnJZamRdR9M/DM1ztv7pTe3haXh8L8AEvJne5hF0QNz79z6JB5uOWkc
         RHG1AyqU54cQKACf2Axw3lU5M0uwfXZ3bkDfvz5GoWeKp3bOwspk/ch5s1vhjr3j5FxB
         h/7DBaYWf7WVVgIUQngkE4J5XV1BY/Y5pGt/j2YQ+FiS37AXJXW07rqNh6ErSRFVpoTZ
         C6vVR9FNMw90nnEZ+CPHWhzJfioVDseCc2RYdEyPEOnBp6y7UzMEDM/6o+MzH5x6Jt/d
         Ip2A==
X-Forwarded-Encrypted: i=1; AJvYcCWpe02JR0vYRlMGxJu34I2erxboYwjoDVGGYJokx0SEBY3mQo3nSd3F4CYgF86kSxMdUvviuXP2hdJ50ETJIoqi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt8gntxg+Bk1+ng8TKBAYxFXvD7lM+YwqyuKx+5a1q2IOMbPTX
	vhDbxEprDE/L7slnMpRZht6JzTUFaWmLjlesgQPRRrkwDXN4x8Wx2HFPdKEhQS0=
X-Gm-Gg: ASbGnctXi8ozJ+uy4DHBPyWAIfFA40QC/HESrZ2vbKKKWAO+fpfUp4rmUfOtNgE0Gs8
	eRzmpgY0HhoqzpAxNXy4CYVVQzXaOUNzyhZowV16ICfLtPv7IWu6PjAUIxc3zJ7SsBJpoipycEc
	UVikVgZPi9YZyLk8CBwKKGQ2sl0GgCUE3Z97ndX+r0g5Mk4T5eWdmQqROAgN2+8D2MC0rRsUHrt
	4b7Oow8N/2KpFrt6GKFd7ZKC5FqqHbnw9BrDhZLmmM5frpDg9fnGTZa9Qi6KvQ0HpWqO01T
X-Google-Smtp-Source: AGHT+IHSJSlo3/oMvXCYUQyNeEOcz3KKCPVH+2Nq0e8HvWx+muYZ0l67x8Jr4dRyzyqkWmyMQacOtg==
X-Received: by 2002:a05:6a00:288e:b0:727:3935:dc83 with SMTP id d2e1a72fcca58-72daf950d22mr24987927b3a.10.1737526145753;
        Tue, 21 Jan 2025 22:09:05 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab849e1bsm10121392b3a.80.2025.01.21.22.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 22:09:05 -0800 (PST)
Date: Wed, 22 Jan 2025 11:39:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 2/5] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <20250122060902.5pgfr5g24jpjrxw3@vireshk-i7>
References: <20250121084435.2839280-1-beata.michalska@arm.com>
 <20250121084435.2839280-3-beata.michalska@arm.com>
 <20250121105355.sdrgmjv2w2256qfn@vireshk-i7>
 <Z4-6bsDzfe9CLcVf@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4-6bsDzfe9CLcVf@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_220906_783113_9F38C397 
X-CRM114-Status: GOOD (  24.45  )
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

On 21-01-25, 16:17, Beata Michalska wrote:
> On Tue, Jan 21, 2025 at 04:23:55PM +0530, Viresh Kumar wrote:
> > On 21-01-25, 08:44, Beata Michalska wrote:
> > > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > > index 6f45684483c4..b2a8efa83c98 100644
> > > --- a/drivers/cpufreq/cpufreq.c
> > > +++ b/drivers/cpufreq/cpufreq.c
> > > @@ -733,12 +733,20 @@ __weak int arch_freq_get_on_cpu(int cpu)
> > >  	return -EOPNOTSUPP;
> > >  }
> > >  
> > >  static ssize_t show_scaling_cur_freq(struct cpufreq_policy *policy, char *buf)
> > >  {
> > >  	ssize_t ret;
> > >  	int freq;
> > >  
> > > -	freq = arch_freq_get_on_cpu(policy->cpu);
> > > +	freq = IS_ENABLED(CONFIG_CPUFREQ_ARCH_CUR_FREQ)
> > > +		? arch_freq_get_on_cpu(policy->cpu)
> > > +		: 0;
> > > +
> > >  	if (freq > 0)
> > >  		ret = sysfs_emit(buf, "%u\n", freq);
> > >  	else if (cpufreq_driver->setpolicy && cpufreq_driver->get)
> > 
> > Maybe this should be a separate commit ? And also I am not very happy
> Initially it was supposed to be one, but then the rest of the series justifies
> the changes so it made sense to send those in one go.
> > with the new kconfig option. I don't want others to use it as we want
> > to get rid of this for X86 too eventually. Making it a kconfig option
> > allows anyone to enable it and then depend on it without us knowing..
> > 
> > Rather just write it as "if (x86)", with a comment on what we plan to
> > do with it in few release cycles.
> Right, those changes are based on discussion in [1].

Ahh I see.. What about making it depend on X86 for now, as we really
don't want new users to use it ?

-- 
viresh

