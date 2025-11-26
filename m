Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C10D10F4D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 13:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYqC5VqW18CbTRA/bzdW/9ZxP4+JQNJgMWyBxI64pjg=; b=b02xw13JIwEG7QUQ8N5dLXvGFT
	GZezxPjVEb5eGm3td91t5uRC4ttCH8zqi1wdvp+2lwA7YHeXZVuCxqgQnGtyItZsVElxkHJTiqfee
	2vTzmWfEsM94C33Zb9ChMTqW/arrCMv50mn2hoaVVhlZIOd6qcMbD/q62EWqxVXPtcyzBbKwBCKyg
	RVdCZkyM/Ozu+0qXWEBH0bBrIKC3oXI8eBvSSfAU1Cgsg8iUQYxZGgtGFWRzbLnG48Azjrki50NxV
	YhZWuCNLNUhuHrlcGXpXMJpfllxL8IQQXw6ceyIDmZC5WPJZ8DIW5aICVUrdT05K9SJjvtpiTG7Tj
	YoRVkWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOFnF-0000000F3MK-0OYZ;
	Wed, 26 Nov 2025 13:42:49 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOFnC-0000000F3Lw-1GsY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 13:42:47 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-8b2dcdde698so984663885a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 05:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764164565; x=1764769365; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yYqC5VqW18CbTRA/bzdW/9ZxP4+JQNJgMWyBxI64pjg=;
        b=dd3g/9mL5XXR2rzp8iD05+Ml/J8ZBqxkYi3C5RmXc4LvD74YvoE9AZ6AFKYPOjIvTG
         2uqsGi7LeHLAnG4EGNVT+21rdd4gSrEaBWRbDW8F6ndLz738c2zjz4jptAvuMWcIhsdf
         rgAQhtiN9HpOg4WuOzpO8ZwaiUx8XNphvWxH5fV1ToRNqBCgRyTAHTnzrE7FerSWSr3d
         b7Li8uxalSYWZslxgxBO/cG4SSqDPV+38srzhBAsEHhQS29aS5dvq2TsVaVlAJPdTmcD
         xz7W3vUVelmrakTtkyw89wOwi7AL08+R9q6/J4f3yJ0Py27BbLfWJrCkh0zv75SD6Igs
         /agw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764164565; x=1764769365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYqC5VqW18CbTRA/bzdW/9ZxP4+JQNJgMWyBxI64pjg=;
        b=UvQ6FvqmqAnkXidOdX9suXtHzU2dDdkgz4IPY2To+lpIrjzhyn/+JgEx1OcmyOhgGw
         UnUEq6Sq7vYSm6W6k9iWPiXgn+RWCpgLWE1oC82qSiidguPE6Tb83JTDLoO7XhqoUcpr
         A56P9vSySuJixkALvKvOgJW48kEvSNt1EeBfyUMnBl/4UvbKY3rm5TjXeerPKim6VYQr
         zb98A79w8f8Nq+0zbFWLDM1ZbZXVvPPg63rIDYXpyqbAxvkcwAWJCy0a2cl5a84fvxr+
         Sflgm1NKYdDxx9yzQKs68uNVCGWF+rzeegaVyXI6KTaHi9bL3NPTiXi+jpy+Rd5a4KKl
         ZhPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqRDzAGs59Ybsk+h6QzmzODKhn8PRv+XEsrLDw+ERRF32DZikUiNR0q9vqMestJm/ushqVF41JzNU5A6BeiBb1@lists.infradead.org
X-Gm-Message-State: AOJu0YxsnyVpQ3xzIrxicZ3D9OZHYNbb3b1pPiQ6w3VW/YnInxQHsaUR
	436OdqgUwiZZaCdi3MgoDFTn82Zdj5PkTrzCQKpobCFfL95efL4/3QimM3QnJf5xE3ut8lm0Dl+
	qhoAyhZg8mPAZ0Jjy4leJoKmRKyEUmLc7liyC+LSDTQ==
X-Gm-Gg: ASbGncsIiuwno+8bWYgYh+YjjJAt0l2AzSgInAnq4uG5TXGZHOPM1qyPI/1xrGClkqQ
	WI9FHqWS6WTHFxD86lqUrERyh02n5DzzbTuvL7TD4ZIzmfFL7DdbMIjzHr6cdR6T/Ck5hd4e4/c
	73IKBFcQTSJvlK5TWLg5wVDu1xOxZ8wJbin4tqC2BAx07Zuijcl0pVr7cWqUhLcWxolijM3GWr2
	2E76pHRCLM4iH5hK2TO9BOxexMRl/GyM+KLywBXYdDfXfc0AeSiysTGdaUDIgDLXqwKvZsGv06e
	y2YDw0bO5NTYTl+2FP4kdnb/qEwQ
X-Google-Smtp-Source: AGHT+IF16f+LBozWfSlajgVtiNEHe7YwB3yeI33b8xj/QmKG19UYrToXkagFpmBhiNJbfaVPhOYcGETkgy0Ug82F8FA=
X-Received: by 2002:a05:620a:460d:b0:8a3:9a05:ec10 with SMTP id
 af79cd13be357-8b33d1cf9famr2449174785a.14.1764164564714; Wed, 26 Nov 2025
 05:42:44 -0800 (PST)
MIME-Version: 1.0
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <20251126120914.GH724103@e132581.arm.com> <da2a3e18-80e0-4aca-bbc7-45c1353217d3@linaro.org>
 <20251126123147.GI724103@e132581.arm.com>
In-Reply-To: <20251126123147.GI724103@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 26 Nov 2025 13:42:33 +0000
X-Gm-Features: AWmQ_bm9xMV0nAGtFKkCsxx02xoDxeRHGq1LlXck1Z4k6q6h1wStzWViyiYh1jk
Message-ID: <CAJ9a7VhD2p3qMGXNg6deYjE8myB5euHR4FcAFwgg0KWF2HO9JQ@mail.gmail.com>
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
To: Leo Yan <leo.yan@arm.com>
Cc: James Clark <james.clark@linaro.org>, Kuan-Wei Chiu <visitorckw@gmail.com>, suzuki.poulose@arm.com, 
	alexander.shishkin@linux.intel.com, pratikp@codeaurora.org, 
	mathieu.poirier@linaro.org, gregkh@linuxfoundation.org, 
	jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com, 
	milesjiang@google.com, nickpan@google.com, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_054246_361477_8A613E56 
X-CRM114-Status: GOOD (  22.56  )
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

Hi,

On Wed, 26 Nov 2025 at 12:31, Leo Yan <leo.yan@arm.com> wrote:
>
> On Wed, Nov 26, 2025 at 12:11:05PM +0000, James Clark wrote:
>
> [...]
>
> > > This fix can still be applied to older kernels, but seems to me that
> > > now might be an appropriate time to consider removing the ETMv3 driver
> > > from the mainline kernel?
> >
> > Yeah, if anyone is using it it would be on an old kernel surely?
>
> We can confirm this in another way: if I don't miss anything, over the
> past several years (since 2017), we have not received any questions or
> bug reports based on hands-on practice regarding ETMv3 on the Coresight
> or perf mailing lists.
>
> Thanks,
> Leo

The key to this is not the questions we are asked, but which platforms
are still supported by the linux kernel.

The ETMv3 driver supports both ETMv3 and PTM trace (the programming
model is the same, even if the trace decode is vastly different).

So as long as there are  platforms supported that use either of those,
we need to keep the driver in.

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

