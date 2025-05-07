Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38520C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 13:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMwJyAtJK/aLIyT6CLn61d8dMsByyOcrMzhv12s06BY=; b=LuX1U5Bx5tiIzk25YTgZYFobve
	kq7749kzTJaHMJnHINEJU71N0m+cMmnmq7eP+EuKLt7e9+WKU09SrtQk0pxYIFlkMzaJjRiTnwvQe
	JnasQXlsZqhHgMhg6ixyN/1qg9gjzUNIcKcxxPy4x2DwbmR9GyFLqelFpwo25RdSbE0THwwb2LjfR
	EC8nq2XkByBBXacUGOBwKiXRt8Gl13J+yweidjFv4WpFBW4CKS6VgWAZs4CH1KgLIgWVW9a0ThjTB
	DtRXjJHRmmXMGk3yLgdJNz256Mhfq0uxzhvJXJ7d0QHpfi4A2zzTnR08a9yDUbVZpMATfpVfCVr//
	wLkntKmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCf5P-0000000Fbzm-3CWe;
	Wed, 07 May 2025 13:45:23 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCefX-0000000FY4D-3pvf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:18:42 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso66656745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746623918; x=1747228718; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mMwJyAtJK/aLIyT6CLn61d8dMsByyOcrMzhv12s06BY=;
        b=M4u9ngG4xwTmeCpiHJushjJWazCGaf7kmRukkxeMjSnA5dYr9qBMxSz2sYxGHY6Nx3
         BXg7BNrq4K0B85wIZYBW+Tcc1OJsBrBbJRGof+mezzPL5I7S80+zCBl/lJGDyDnJW85M
         LZix8WEl3ltv7rxAOzMu2FD46KpQTgmM8laSQgJZpL7W9/j8uHEtVBuVHliLRaq7BUxV
         auFw0GLIAW2Znk625zEZEU5ExGz5cSkeuRRgg8i+/67ce1OhvjzP4CIN5sDvbHCw/UAQ
         PqK2ImcYb0JeZqiDWTpwqDm9Ae/O3g6s0shUOHtHKKTSKWrrygLQSf8JMOwTofHAkptC
         YzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623918; x=1747228718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMwJyAtJK/aLIyT6CLn61d8dMsByyOcrMzhv12s06BY=;
        b=JXkLVyu+clRjCQ+oyT+KSsluLZJazc9Jgrb7Ywd+NqV1IrNk2pg5LD94UO7RnLMKPT
         sAWy3fpdlezz90ZhXHnkxv7yrMnEmpkA0Up5cEjSokpB+1slgS55Vb0anIXDMyWGbRKd
         xYqtbQ6RU1cXngM2y7oLi34uxV64uwalAU1ssajP1Q+CU78mRigGTZjAJPsiGLCrN1EQ
         DN60ftD2eVAmnxQby5PUbL0T2+Uro81/RH+cUDKNEgTKJu71Dw3gBaGqHylIU+Z2Hm6D
         JE4r7YcRVMxYR7bB0g8M3nYMDQvktVKIa5GywgMtSAz0Y36kS9nM14kCPux7I80DfjHx
         ZzYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2+XHoGaISWJW59CCJlBuEWPb07ts4GtQkrYgG/YaawHNSxlnzAtoAkRiP02kogBG8DKpR7223LhxJptSX4Zw+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy53cM7HvC2RCIXlUU877+usp/wuClU8pDZbu5zARC4OhbCT+YE
	Nj/vlSc75jDGyZHbl2Rvs6mzLMQyZKNYkbEyAsBXphcEHSMmzadN3D+Q80AXwgw1wXo9YfbuWHS
	R
X-Gm-Gg: ASbGncsY749aMT4hDWFVWplTUaod0VD0o1a8rHaM7IxSUqlddn4sUCUpH6lPgmydmWC
	z6Q7oIUt7TwEtJ2/b1c26hBDo8/FMVlpB53zkPqiPxggYRTS1FyjQMhef5zEvqG9ZlouwxfpOvn
	lzK7KXY6qZ8TzTuaVDkdpKw+XAmpPKuWkQPorQh3IVJ74/EtgKZvNHuQtoi2kGYOU2bGY8zaGr9
	iX35z7/8yJREC9UtNDyOqgf5OVKlwXBd+kjPqH/UqooLp67Ffpa1OMK/Q3GCHXzOfKOTbWA/Xun
	rMxCrLx0+iBpJ3fhlcoQobNu9j8Ro3wBLcGSjBXwWqMlmw==
X-Google-Smtp-Source: AGHT+IH3Qorr4/m1vHEg7Ot9UQ5uCqOCNeK+Gmt1pu97YiZ6JvL10Fw4EinSPUDzBFREtrSqd0/vwg==
X-Received: by 2002:a05:600c:6085:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-441d448ca1bmr37445495e9.0.1746623918101;
        Wed, 07 May 2025 06:18:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd380ca4sm629535e9.36.2025.05.07.06.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:18:37 -0700 (PDT)
Date: Wed, 7 May 2025 16:18:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Mike Tipton <quic_mdtipton@quicinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3] cpufreq: scmi: Skip SCMI devices that aren't used by
 the CPUs
Message-ID: <aBtdqvyT4Ded8Lht@stanley.mountain>
References: <20250428144728.871404-1-quic_mdtipton@quicinc.com>
 <aBtLMYqcnwacGJuy@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBtLMYqcnwacGJuy@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_061839_964835_5AD83795 
X-CRM114-Status: GOOD (  13.85  )
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

On Wed, May 07, 2025 at 12:59:45PM +0100, Cristian Marussi wrote:
> > +static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
> > +{
> > +	struct device_node *scmi_np = dev_of_node(scmi_dev);
> > +	struct device_node *np;
> > +	struct device *cpu_dev;
> > +	int cpu, idx;
> > +
> > +	if (!scmi_np)
> > +		return false;
> > +
> > +	for_each_possible_cpu(cpu) {
> > +		cpu_dev = get_cpu_device(cpu);
> > +		if (!cpu_dev)
> > +			continue;
> > +
> > +		np = dev_of_node(cpu_dev);
> > +
> > +		if (of_parse_phandle(np, "clocks", 0) == scmi_np)
> 
> Shouldn't this, on Success, be released by an of_node_put() (or, BETTER,
> by some OF-related cleanup.h magic...)
> 

The cleanup.h magic is __free(of_node_put) but dev_of_node() doesn't
take a reference so I don't think it's required.

regards,
dan carpenter

> > +			return true;
> > +
> > +		idx = of_property_match_string(np, "power-domain-names", "perf");
> > +
> > +		if (of_parse_phandle(np, "power-domains", idx) == scmi_np)
> 
> Same.
> 
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}


