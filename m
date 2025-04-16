Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736D0C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 07:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OojZ/Set6ofgNmoLSDBYOLQFH7SYSkSj18BSfmQvXU=; b=saiCWPWYUyY0IYTyjEQ417nCPI
	3JT1QuVn6S1uh4dzbK1nm4+tWj+rVTdJUz2vTQ2dt7ZNXn7jMMzB/Efn9+Swa1Y5/xV5x0yCXyHFS
	EZIMdXRKKHwT5xADQEl2xjcMIEk0sxxdJuPH06uWUKfB4/4N7a9hKBmOoXoVybQMy+vWXSq6rtY0S
	HJfy59R/ieZh8KswZMMPfupMI+jrgETCBgd/kGsfeJYa1TM5r0RW24zLljTUzD4nzBayymrpiIENu
	l21gXkr1lvDhzY3TQ5M+YG6m0MrH60otd6/SKdaproHXrmmfGHDnU9FScTYMHSKyFLa46oGie5EPm
	zvyF3hbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xJm-00000008dw9-3SXX;
	Wed, 16 Apr 2025 07:36:22 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xHs-00000008dQt-2nnn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 07:34:25 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7369ce5d323so5155236b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 00:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744788864; x=1745393664; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9OojZ/Set6ofgNmoLSDBYOLQFH7SYSkSj18BSfmQvXU=;
        b=pDjV7mtd6bHL1GtPdnUxFizqOSo9sQFGHOAxXLffH6znOdQ1ECXki6KGiJdmZQchDj
         mAv6jLip9Q22Nb4ZW/h9dFyJ5aYhXvHD4YBhiUYhTG6iIjr2b1E1jzVXKzS+3A+iVKl3
         nUG3BTPpt+Jhl50ZbQ6fpmy1SypXGqk6eeOivUMZ6Zj4ab+np3ZJ9MJKiX0PuG/VGm7f
         38840j8ZeRG4Gm3eZ6XOHSIawSQW2Rdli7lQuUI7neOcgxbDdqT2goS/BhvcquPhAxZL
         FG2uvVPYBNwoniB3Nysiaz+ZPaA94ahAoFBTElIewj2VJFJNbf1aocr5yxCdkvLsK2uW
         3iHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788864; x=1745393664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OojZ/Set6ofgNmoLSDBYOLQFH7SYSkSj18BSfmQvXU=;
        b=gANYxmTUHVnP22Gw+jiT9LcTCvBEw43MBx325bx2uYB8qyla20nAKZ8sTm2O/VjSDu
         OtgrcqDm692jWed5UbqG5CnbV8drSJSHcf2Kz6UNmcp9IhCQfMQUd6D4F4W2mufKnadq
         E10qKAKcZWW8PhBqWIxt0ZSZzjqx2MEXjWp2FOsrHosSMruvI8NxCcIuLOQnviO2Ijf8
         u51w/9f4G8qYbcCOxNM5MsPI99CenBzXZWfKnluTCAjguB2TQaZY7XiPKo47mY5Ydcho
         f5Et3fWfnjZjgw+rAAXZ6Jd0ivXlo/3CnHVxWzxNRPjBcLaTVGJ1eA2Z6EkI4rslb+X4
         R3zA==
X-Forwarded-Encrypted: i=1; AJvYcCWNpJms3YvoAYzauF6iZTKVnY69mlGaCXVJBiI/7fjd2rCxIr/jLtlwdfuIO4WdXNZeKhw9JbRIfXzQX47VGEBT@lists.infradead.org
X-Gm-Message-State: AOJu0YxqZLjFR031OPgGhjAcBVM6UUBeSR3cJ8wD39z32gc6oG86+/4A
	56rQi9u84uzwCwVooDC9zZke7jbITGDZ+Wpo4JH6Tvt6VgJUY32lMg/D02MgxvQ=
X-Gm-Gg: ASbGncsCoF9yWDZg4Es9E9l14/YVo2jNbvg8bACGMXOoZROaQfA1qDLE69KMT0zur0C
	hWQlRaw5rbOLj8wAewjItxdrCOKAVET5uJfFaU4EB1fhMfJeRab4aoJxCCb0nFcu3ksJKeybI1D
	KrsxV68k88OhTyCZJPR5vZRW5kf3JgmKcqS36HI7POyshq5Uy13kKQ38Op9sutpJ7BpyqEGPzNr
	lU6M590KF/g+sPm/9oxeNSoJsToJ9AtOnoXFx6fjl2LLFc44OeCYyu3sc3DMrtVgCWBfpDYYAUu
	ze6ik12fZGB9S14PPxkLsbneEqkmQHncch87lUVzoQ==
X-Google-Smtp-Source: AGHT+IF5gr7KTNmsoqWboKzNZwhfvZjvETmtD0k891OgOb0tDlIqVA7ofglJmZDsPCASVeystx4Ztg==
X-Received: by 2002:a17:90b:520a:b0:2fe:8282:cb9d with SMTP id 98e67ed59e1d1-3086415c684mr1191209a91.28.1744788863789;
        Wed, 16 Apr 2025 00:34:23 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30861212c3esm872339a91.25.2025.04.16.00.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 00:34:23 -0700 (PDT)
Date: Wed, 16 Apr 2025 13:04:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rafael@kernel.org, Marc Zyngier <maz@kernel.org>
Cc: Chenyuan Yang <chenyuan0y@gmail.com>, sven@svenpeter.dev, j@jannau.net,
	alyssa@rosenzweig.io, neal@gompa.dev, marcan@marcan.st,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: apple-soc: Fix possible null pointer dereference
Message-ID: <20250416073420.xrhwnzy22zf6yltm@vireshk-i7>
References: <20250412160518.1824538-1-chenyuan0y@gmail.com>
 <86bjt0l6q4.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjt0l6q4.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_003424_711816_57D5AC46 
X-CRM114-Status: GOOD (  20.11  )
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

On 13-04-25, 11:02, Marc Zyngier wrote:
> Irrespective of this, it would be good to describe under which
> circumstances this can occur, because I can't see *how* this can
> trigger. The policy is directly provided by the core code and provide
> its association with a cpu, and is never NULL at the point of init.
> 
> And if it can trigger, why only fix this one particular case?
> Dereferences of policy are all over the map, and would be just as
> wrong.
> 
> So while this is not wrong, I don't think this serves any real
> purpose.

I have applied such patches in the past, considering the same as good
practice. But I do understand your inputs.

And so I tried to see if there is actually a way to trigger this.

- Platform with two cpufreq policies (freq domains) with one CPU in
  each of them.
- Boot the kernel, policies will initialize for both the domains.
- Hotplug out CPU1, that will remove the policy as well.
- Call cpufreq_quick_get(1), this will call the ->get() callback for
  CPU1, for which there is no policy available.

But this is the case only for drivers with `setpolicy` callback, this
shouldn't happen on apple-soc.

I am not sure now if we should just apply this patch to be safe, or
leave it as is. The cpufreq core may change in the future and call the
`get` callback for all drivers.

Rafael, what do you suggest ?

-- 
viresh

