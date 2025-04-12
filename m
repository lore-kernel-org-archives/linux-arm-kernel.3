Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799B9C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 18:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CyrR9KNkaoIb+djhhX7+16j+DQ68McNR1nNH1QOCtU=; b=QhldXbE0EA4Zp6G+iLjARx0I0Q
	J3Hf1NmPp7/qG1HlIJudzxA6Vrr9CJMscEJKQmGkqzt88uQBe6nk/0L+f6He/CAVCaxVmjwhINaLX
	L4QZlQsjNS6Kw6WNYI4R9PXo6a13e2P4fESggjb7YSorjBb5c3SUOAmmTCGx/mlZ2j8zzPOcut2sJ
	yC1GzbgJb8xp/x/deeUPIExkEMTGun+MpXQsNXERqtd2gGf12flVB1KOw559K013GZNnZGbJ5mOKA
	CVgII4oX/2Ib7y4vIDRRVXK0IODtFHAGdphPaA8kzxmOOZewokatvtrsUb62Et7Qp/f+CErxYublv
	nfSN2PtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ff6-0000000GHDA-3OyE;
	Sat, 12 Apr 2025 18:33:04 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3fdE-0000000GH2R-1yvM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 18:31:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cfe574976so21629135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Apr 2025 11:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744482666; x=1745087466; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3CyrR9KNkaoIb+djhhX7+16j+DQ68McNR1nNH1QOCtU=;
        b=Yi/IOXug/L3Gs6gn4J1JrcLIFoRTTbsDenjX/RqX+HWi+z696YiYbtPHrsfiP/juR9
         LNPHZo2R5jAb4ZQZ3RpbKyYENYvz0A1qD3tPZD19GklocBDpEMxAhCd3xUhaBJSN6xiX
         i3RC18rd+MTfZH1a/IxGwx9wkTuex4EtkavXiJtzHPYFhOxPS3KaxTdFoAzRgMIsy90x
         Vz8LMj1CInlOkH4YHrBIKdbjHSxUh92D2S2qXINam3w0I6XskcRSEK2bOQgDRPokCHp0
         PuI+C97+AYo69n+ItvBP/xIEBJqk0RY6crMqgwF2ebRsSVyD3VyxynuIph76TYa1qeF+
         Wf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744482666; x=1745087466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CyrR9KNkaoIb+djhhX7+16j+DQ68McNR1nNH1QOCtU=;
        b=NYorAsd17xuoq1H7txbYB25DhMFxy194A1u6VNspwL0aY36y4PoCU4qteRTuoXWVdH
         VdSHo+vU9GOHYzTtRc/uCQeVb9EojYojdT+K+sGeHryhq5dycfwneIKRD+k6jH6N/1cM
         z7ioxKxsoudyM20oCZINS+mj535UtKUYAHKQtwi9oVx0pgYbTI1/YVvdUfmJapARAfdh
         qH69d1BCIn22Jy2U+8fbbhUJWMff7JGoBIuhYnXDZCOvw1l4TlkvJmqq0w8yk/VGndnU
         1YfdEmuXo6zSkj+70cMBxqNJ58FNt+BN2rrp+b+dU5GlhMNHwSQ2Yvl0J3i6iqZvhE0Y
         ENlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvFYEh5Mv/TsYOBrOMnbU68zv74jhkpRhZi42VCy2LDAZ7Hp55HRuLZ+2nJdHGwaclDUauA/6g0IyNAM/CC4gg@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6Eduz+x9/T3+xtONwXznGxvWoK1eoOBxweK2R7E0xMRJTnMlq
	Dk6cuk9JLVmtMSWkFZT7IGPO0vPSsM+9emM74hM6lWcMHkQwNiz+iqrvmZ1VJ0w=
X-Gm-Gg: ASbGncsM1VwLarM7mVA4YpQO5d0tp+8EBmAd4gv+5UrlUVITsA3qG3IqJwEWXgcMA/j
	T/azpbTpgHVndBmMwop4WnfjQocx12DYqMwCBRKs6lRffnfrAIdFfeL/8rBW/jfMIgKSIe4xWuY
	boQ7wChmkHk8JKWEe0Y/0yyCD70flTw45ARxR5VP5Zz0yXOdw6Zm1pvVrHj5CFnGUkbAruZ/SE+
	PrbfoQmHT8NGFQmllVzdr6qjidWLcWsWJHHEEGBPhLwXeMuPCKRhbW0e71teP7R41RbmSRfa2yA
	vxq2HvqIzPelSAMkBei6sxpWXlI0iciHzDGauvPX73jIVg==
X-Google-Smtp-Source: AGHT+IHARGq36rcwuoUqKZ76aegRkcgHirTp4EATHkOfGBZZRYyZYhGL+bYneAm7wceJLq4bHfWKmA==
X-Received: by 2002:a05:600c:a53:b0:43d:fa58:81d4 with SMTP id 5b1f17b1804b1-43f3a9afbbdmr59892105e9.33.1744482666250;
        Sat, 12 Apr 2025 11:31:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae96407esm5776966f8f.17.2025.04.12.11.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 11:31:05 -0700 (PDT)
Date: Sat, 12 Apr 2025 21:30:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	viresh.kumar@linaro.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: scmi: Fix possible null pointer dereference
Message-ID: <0081fcd8-da99-47b2-b136-3ea04232046a@stanley.mountain>
References: <20250412180831.3252963-1-chenyuan0y@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412180831.3252963-1-chenyuan0y@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_113108_522336_BAB5C0B0 
X-CRM114-Status: GOOD (  10.33  )
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

On Sat, Apr 12, 2025 at 01:08:31PM -0500, Chenyuan Yang wrote:
> Check if policy is NULL before dereferencing it.
> 
> This is similar to the commit cf7de25878a1
> ("cppc_cpufreq: Fix possible null pointer dereference").
> 
> This is found by our static analysis tool KNighter.
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI message protocol")

Henry Martin already fixed this in commit 484d3f15cc6c ("cpufreq: scmi:
Fix null-ptr-deref in scmi_cpufreq_get_rate()").

regards,
dan carpenter


