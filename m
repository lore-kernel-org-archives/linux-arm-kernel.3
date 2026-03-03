Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4946E67A64
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 04:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjlYlr+TitWbiFWv5AnEceJILSm/y3zmJ+HZjyFCTd0=; b=eaXSMyQ6qUjS5vgdAHnomjMEni
	EY0xTMyFcgZ/xjBtQXnjnah/pPMqwSGUQgSsG6s0N6mQfk6ckMX5CLYiJ2T/nS4rN4js+VrwvV8Jw
	t5XPNCd44pLLYAR/rwnqfujIBxCjFR2lhFIDBFdDzrRreq5efB27qL5frBJOtkklAC0nX1gLXU1uU
	2F4cDDVayR7++nXx17RGHiJ+/716XNmV6gSGFl+AYxy4YAWUCUeZZ3HYYlUXe0JW8XZaIZFThHFGI
	LWcs3uxWvYPYaHH2BnNQacn6yi52TNqs9ezj+mrXoOjPZ7vha8o8S2hkaUusJ6IHjbdbLcadxILzT
	OPzSE+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxHFi-0000000EUu6-0RRU;
	Tue, 03 Mar 2026 04:20:58 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxHFf-0000000EUti-2pCs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 04:20:56 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8274936d2c0so5102436b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 20:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772511654; x=1773116454; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RjlYlr+TitWbiFWv5AnEceJILSm/y3zmJ+HZjyFCTd0=;
        b=v15m8LgavoGt93J+4HP2ZCtFWdcOOLpQGZbEWQNAVdexZvaMC0hjDC2Rzvpz65IAx+
         gKy7Q+UFFeSmoA8qhX4ymnzmF3a+FBnQxod2zA20TbNnPl18JXMsEgaaAj3YFNefhu6T
         aQg2QA7UetGalrX3tWzIM30vizH+vQNalZDLH6n4I+Ue87c8HLMKOTzJKRqLYHbFrgkd
         y0USMUmbc4a/0TAx2k9M5UbfLovMmjAcDL0ZUjMN7krzog4izewYYzAjFpHbsulub3bP
         S6OAiL0acRRRrNU2B61XvdEL84Fyl4hzCovXqZwKrKtZzZwrCLSZLLR3Bz3dC/L5G6Gm
         YRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772511654; x=1773116454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjlYlr+TitWbiFWv5AnEceJILSm/y3zmJ+HZjyFCTd0=;
        b=Sy6at6t7bXx+5Lv2f/ehFOFjSwbA90UJiXSH1qe9ofkwGvx02XJZu0e/bu8JNl3bR+
         TsDCzUzz7T6ir+QfisE9+Vi3nqz9isPcYy5hC8L2gjhHg3aUvGk8Wz2qNHnGUzNQdkVb
         jQgvl18RZhBPyjzl9KCID66Y7SI6AT3Wbm1xFBAqbYJV6WtmFSWNnDwrvt+cLtY0JhoT
         fUrfhfCROb4HfoY/MbZqsW4NRQia3HjqycqzUb4wGPkrvsMdv2L8Z4p4rYX/4Y32o1O4
         vxIcQzPxj6c/5zbPCiQVmI3o+D9+dFf09uQIXSssSvAG769pVXnGxrZGPjdu8bbq34NB
         YQBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz9YwDlEpRcePnlJ/5eRLAOvF3IS7KHqRp+AbuNBc1LV0PXx+WvC9oR0+VkzhntSeuceWuedlD+7vhs015ewgM@lists.infradead.org
X-Gm-Message-State: AOJu0YwiGsb5TrOPfnZ8oPlvhQhRg8KYW53dNHVQbviMJ5mH8cdVGH1o
	AflkZzN8RHxx5jnf6qNK6mfA0mHANWLpOZrthPDcwwDSSxBzHQlsdxVd6wdRmkxvsfQ=
X-Gm-Gg: ATEYQzygfKYpApFdh3R+JH4WGEx9ejHstEv6+ZIv+UzGJrTj87P92ymkDV8WcFy7vGg
	qGjIYbLNtRehSbBSPuaNLD27DEwLBoIomOHPXb2bu81zcOOvLVHOQfnLnimlIUpjJNhayO9o2FS
	uAe9rOOd7SQ9c2La30/CAhZEzbj4xtLh3WrWOyY4tuGivwE36+fUqRWm/4+s7VJ0ZTW3u2GjZij
	alh+wVGawnPLutT2m+ITIt4altcYNveu3U72kM/0YRjw4QLCh7C4lomDPGQtLhXeqvRhbvJLfog
	aVBaQ4Z/rCrkxccjSIjmb/XDemrJm1Qr0k5qWfdk7hdSxuAfIMc9Kb86koZJDM06QqitglAHFxq
	Zqpj+UpE8dfSEJX9xFyheAwtP5kk3dqrqM4sFz68MCrWcCgxhqJ+SpaaXB/EUUD/RSxGx4NPSug
	/KAXjlbV0TT/yV0sA1G7FI8bOE
X-Received: by 2002:a05:6a00:2ea5:b0:827:3d52:5d1a with SMTP id d2e1a72fcca58-8274d7927ffmr14626637b3a.0.1772511654084;
        Mon, 02 Mar 2026 20:20:54 -0800 (PST)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8805esm15330809b3a.16.2026.03.02.20.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 20:20:52 -0800 (PST)
Date: Tue, 3 Mar 2026 09:50:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: sudeep.holla@kernel.org, rafael@kernel.org, cristian.marussi@arm.com, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: scmi: Fix of_node use-after-free in
 scmi_dev_used_by_cpus()
Message-ID: <4lbgs3xszh75i4nucdhkbi2j33xvu6y3qfkilrshswbn73kpo4@kp36dhmrpogk>
References: <20260302155348.26374-1-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302155348.26374-1-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_202055_717776_1A7845B2 
X-CRM114-Status: GOOD (  10.45  )
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

On 02-03-26, 23:53, Hans Zhang wrote:
> In scmi_dev_used_by_cpus(), the code previously released the of_node
> reference via of_node_put(np) before checking whether np equals scmi_np.
> This could lead to a use-after-free if the node pointer was accessed
> after being freed. Reorder the logic to perform the comparison first
> and only put the node after the check, or immediately return if they
> match. This ensures safe reference counting and avoids potential kernel
> crashes.

It shouldn't lead to a use-after-free problem as we aren't using the `np` for
anything apart from simple comparison of value.

-- 
viresh

