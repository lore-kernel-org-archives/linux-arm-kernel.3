Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E71AC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 05:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NB0nHoebXQJILemQcp89vOlxV4NeZBSLk4VRg3eTpU=; b=Dj+AJ9Od00UfjAjZ5vALj17KaG
	6B48JYcQvTibs91pn3KuzNETR0hl6PRzU9xgHtXupIKWnc/iI9r8TEuC/BiQStddBBvJToKz2o9He
	QTm3EbLXQ1/DwRz+ZyTOQbWnoTYFjylOs2YLhlUxJwaT+3CLflR8ZLOHp2/8Fk8CrvXrBajTBsaQj
	UNnEVjzhG1ngt8FqQWnTCucoJ7gHFkqpD8NlDw4UvabgCd+FqEsVVynDFs3XNRJb9VA+PAUkE+92o
	STLWcsbhmmgXkfXHZDvxNhv9niJhgs4KK50zf+289H3TZncNcBiCxb0StyjlkDANHyT28qn3Bz7JJ
	Lsqo5FFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u21xC-00000002p7p-0mWl;
	Tue, 08 Apr 2025 05:56:58 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u21vR-00000002owS-0eLG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 05:55:10 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-736c062b1f5so4222732b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 22:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744091708; x=1744696508; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5NB0nHoebXQJILemQcp89vOlxV4NeZBSLk4VRg3eTpU=;
        b=L72jEOpOBcixyyT5vc8YUyIPe8qoxsQ4UCwh/+OgzE2qoqBiWpsag7tFBWG2dpdDuL
         EjT1OMYZ+p3z5vDbVUa9QORxmd9AeL0go34+aeJwQptMyD9yyiNbPpos4xOoagCbuppQ
         hZOzfsfBgdxJKchVgXUwMtcZ1Q9g1mNxQLjIIsBI6pnsxwL3GDrvv3tNgE1TfGIRWuaT
         vjvlMIefGjFOYSpcoO9p6EiSR0dSRSazYyo4DwCM21c+81bxW2nNoydxLOK0dd+zuoWa
         tdIcSAw6ct+Yb1huCai15PRH/sZSMvJ+42i2iO2+KV4tmsS+Kj0ElF2NRxLPhg4F6yqg
         kv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091708; x=1744696508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NB0nHoebXQJILemQcp89vOlxV4NeZBSLk4VRg3eTpU=;
        b=teAieLal1K7IR64VRjcIzAvPoWzIU7gHzFUxZR/n+cOpTDndyohFq1HPsywZWjKO7t
         9uyyH7Y4WSSu+IPIGum64Vzl7eWZo7sL/bWyyrbdPKpdzph/DdPb/B7ikW3s+hcLcrqs
         WTv71fsnBtErt8shrBQ5VBdlntVs9oG15P2PmZ36rAxG5DRJxVxl5nnSo1CjB8WcTMHU
         SK41wrXEdW8GbB+5VIs9Crss8e0PZ8Y3GsU+IYeIzSrDh70czt7qQq30YLnzPkUynn/R
         tkljYDeIIOMG+mQj4nW9XLsgd0VMfEQ2de1eaXcvApJo2l9dlD2UfsEGIPBJZFOKgnyF
         tw4w==
X-Forwarded-Encrypted: i=1; AJvYcCWNW44dfOcuY3Jnsg2t8G4Z/G5eDcvawQOMXc1Xai+2X+g/P9JstFCEer2XtvpbjzCH7TJyOnyIUQwD8Ptk8i9l@lists.infradead.org
X-Gm-Message-State: AOJu0YzUt4NzIbX0T56zAWMwv6tho/7Ef2NwatqkFvAFI0pQ5M5ktAP7
	V85VyFkW4DNF4+9ME5JlCm+/8cxhYPjRH3hPLeEALKPAt93RExJ1fPTUsFeBeng=
X-Gm-Gg: ASbGncsAGl+whHgHiafN4/pmudlsKR99sDbw5+I6lAqWYDxOsViSJpJV02Mu6gWATnD
	ZIjvVR0o0QThrIJb5nYJozgopyPSW0JR7TBHiXr9ZUVTiOlD/8oDjvscsCA20+3jFgC173HvLAb
	zvrP/3SWz7BSvFuZJ7Br1JYfFgXlQKAb6uyKTFmbkU42R4wgMZJG4D69dSEDTKt9U6Vp4jxTfp5
	YNXtXRgXi7tcX1T75WJM2mPEpS2Ce/wDC8URWNmFlk5TcvzHz2lVhguYa918FVMOqRssDaF/l2w
	7qgAfSptjuO/pOPfNgI1CcsOtTOyNJmz+/ejc0XPLBGXCA==
X-Google-Smtp-Source: AGHT+IH8/8MnEU5W15/zDVbhBHdpldSTqXJSklAXnGqc4WwlEqny15brb73QCGi2KHBhsKrotrm3cw==
X-Received: by 2002:a05:6a21:6f01:b0:1f5:7353:c303 with SMTP id adf61e73a8af0-20107efef49mr21361016637.11.1744091707768;
        Mon, 07 Apr 2025 22:55:07 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea0985sm9951195b3a.104.2025.04.07.22.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:55:07 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:25:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Henry Martin <bsdhenrymartin@gmail.com>, cristian.marussi@arm.com,
	rafael@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] cpufreq: scmi: Fix null-ptr-deref in
 scmi_cpufreq_get_rate()
Message-ID: <20250408055505.oked4a3drsym46wz@vireshk-i7>
References: <20250405055447.73925-1-bsdhenrymartin@gmail.com>
 <20250407-wondrous-turtle-of-foundation-e92250@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-wondrous-turtle-of-foundation-e92250@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_225509_203310_C4FDD699 
X-CRM114-Status: GOOD (  22.55  )
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

On 07-04-25, 12:30, Sudeep Holla wrote:
> On Sat, Apr 05, 2025 at 01:54:47PM +0800, Henry Martin wrote:
> > cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
> > in the policy->cpus mask. scmi_cpufreq_get_rate() does not check for
> > this case, which results in a NULL pointer dereference.
> > 
> > Add NULL check after cpufreq_cpu_get_raw() to prevent this issue.
> > 
> > Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI message protocol")
> > Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> > ---
> >  drivers/cpufreq/scmi-cpufreq.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> > index c310aeebc8f3..c735f39245bf 100644
> > --- a/drivers/cpufreq/scmi-cpufreq.c
> > +++ b/drivers/cpufreq/scmi-cpufreq.c
> > @@ -37,11 +37,17 @@ static struct cpufreq_driver scmi_cpufreq_driver;
> >  
> >  static unsigned int scmi_cpufreq_get_rate(unsigned int cpu)
> >  {
> > -	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
> > -	struct scmi_data *priv = policy->driver_data;
> > +	struct cpufreq_policy *policy;
> > +	struct scmi_data *priv;
> >  	unsigned long rate;
> >  	int ret;
> >  
> > +	policy = cpufreq_cpu_get_raw(cpu);
> > +	if (!policy)
> 
> How about `if (unlikely(!policy))` instead ?

Henry, this change applies to all the patches you have sent. Also please send
them as a single series, as they are related changes.

-- 
viresh

