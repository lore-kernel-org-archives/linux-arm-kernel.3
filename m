Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08986C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 17:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCsfE2oeXgk17KlO6HGMktCK5aeGy+7VHisTD9GROeU=; b=46atOJajNe1+BLvBxKeJ94dWqC
	hB1YT+9v/t36rCd+sutBIxGAE4t/slc/1A7IaMc68QiXBEfn+9Jx7TYsN6QjV7pGWvqcFAAyzGRqg
	3EGL/fUp7XLb3n9C01mtoj3N44IkeDhWcJ8lByot0+Nlnl17P3mmb7Z6isxdYRuDkncRaCGkSIpC+
	8kTQzU7jOPRqADarBkPknRaO6HxSN7oxKjotlgrafzQUBueo3kNAcMK0jocumShrVKAkgWXGYLIkc
	ig5jfwcffFWwiPGV6GwR1sdiQlQFnZKSOFChqFF5pYZlW85qsP1GaRiZR1ymsTk6rl8szpU/OF85B
	E0MDYleA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuw9a-000000030zI-0evj;
	Fri, 14 Aug 2026 17:57:14 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuw9X-000000030yx-3wwI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 17:57:13 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1718109a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 10:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1786730231; x=1787335031; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CCsfE2oeXgk17KlO6HGMktCK5aeGy+7VHisTD9GROeU=;
        b=dpzhgy5hMYd5dCqOba1jkUuMki8d+pqDW9DWuazPsrdv89gkOD6srzbNq0lBy4ybAC
         s3XHtkmtDeszd/iK+LTVHcVyr+SSB2NWy5rSnLEesPLmz39/eKyodh6K4dkPiMd6d9c8
         Cjqo147b93ST9vuYvwcZFR4p8bhKqOj+neyiJWiqh4sWAORlld5OYt3K2q9+gjl8zGQS
         dY/Ujo+zH2sPS5MkBMNXPZlc9CQdy9rx9hyPgXMX4Zw593dVpLojQ7XnJ6nR7TtXa3W9
         wQFLrGQARYl9llata0ADKsBWx4ubrCiadiPja0xFUeeWWauBWOs6otNvDjBeJURKSdJZ
         2x0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786730231; x=1787335031;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCsfE2oeXgk17KlO6HGMktCK5aeGy+7VHisTD9GROeU=;
        b=IAB/0oAzyJTwxlMmBLC6PUbKwnuDfA0etNpdt+yjKrKF8YbNMdzpbBy1/sOOP5Ok//
         dbVP+fU5Z1NMjHs7hJijKCCtX4+4hirNv3MfWOh/ykMHo/svS05S9/tnvd+2kvnAljZp
         n60mO8ccMob9Xj/cgOkKYXqiFtraDVqs6xRi9dFK5te44885LHsC6pRs/s2YsA4yWO24
         zUCPMqfYNI4jGc5SE0b/2VFawgBz1x9hWOpvE1dwXAwlln4vMLrzeJwPMygdBfqUjw95
         kmM+oi/RPLC//MLMn6uE1zL4spksFp4TonOMM2SVTaHg1zQfZ6E22j8aLjMKH6Luhuuv
         FcQA==
X-Forwarded-Encrypted: i=1; AHgh+RrViQCsq0HeGT2ilo2h7neoLmrNQc0WVMFoTqyQCBbQFwXTIdBoMUT4Iqi/vsXcvoX3esXcIGSD3hmfKQPPZWkr@lists.infradead.org
X-Gm-Message-State: AOJu0YxgdDhWhnWCdb9iFqYd2ArnR6x2x2dvV8tZ4VqQF6RdIAEWrZEy
	wJCHrc9gfsdItRU/0G3u7lb59zZQvJvT7BhCZtNteQXZ1Ardon6ndr1+DANdToJfiubqkPYIW8I
	q/UNX8V4=
X-Gm-Gg: AR+sD11hEuEdCeIcUJkp4y3pV+U8nS3zubGuv267SGua23G3jQAqAz4Ri+5vH2XaErf
	fgCY5/u05ZRwByJnmSi7p0gCLNu4c5l8xGy2X24j7i1evr6ft4t8+pe3HzCl3mPELDWUNRMt0qw
	+k8cPfu/jo49HuCCxCDdPwTCHxhCyqcRJvUjYV99eRYFwNtRyAzJmMr69uZvmpdPXvetu/jkXYL
	oKXD28kiTZDeHTdjTZBsQ784KMxX7HTfirOSHTM0K3YIciHdooAIe6RRuMz1u1DhpSE+sgztFwW
	C6U8LymVVqkpDdsF8QmwAbDiAS7tZsy2/TrMF2N8JkktWbCAcd1WLl15t1/T3BWHQ9nBpzZefbP
	y4MheWJURwd5S8HAudDzjUNKnvGszvmzdoo8D+D8XJcQp7MWgF/zBUp+CXPsQ4Ib5UDi//o9Br6
	isLQEnOueBJ/hGaJX677AbDvkHZZfT40dXKw/XzV1piGVK/xKMBMRDA3j8p0/8FvNHoxk/pJE=
X-Received: by 2002:a17:90b:528f:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-3933e5d202amr8549727a91.10.1786730230603;
        Fri, 14 Aug 2026 10:57:10 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bdc5c4sm6924004eec.5.2026.08.14.10.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 10:57:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 10:57:08 -0700
Message-Id: <DKOV07N5ZCM9.1ZUFFUNICUUFG@nexthop.ai>
Cc: "Michal Simek" <michal.simek@amd.com>, "Andi Shyti"
 <andi.shyti@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: xiic: restore runtime PM teardown in remove to fix
 clk WARN flood
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260813-i2c-xiic-restore-runtime-pm-teardown-v1-1-0e7dfb206790@nexthop.ai> <an7gLYzltJgjIUNQ@ashevche-desk.local>
In-Reply-To: <an7gLYzltJgjIUNQ@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_105711_996498_EB812329 
X-CRM114-Status: GOOD (  10.64  )
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

On Fri Aug 14, 2026 at 2:30 AM PDT, Andy Shevchenko wrote:
> On Thu, Aug 13, 2026 at 02:06:40PM -0700, Abdurrahman Hussain wrote:
>> The devres conversion dropped the remove-time runtime PM trailer
>> (pm_runtime_disable + pm_runtime_set_suspended +
>> pm_runtime_dont_use_autosuspend). devm_pm_runtime_enable's release
>> action then calls pm_runtime_dont_use_autosuspend() while runtime PM
>> is still enabled, triggering an immediate runtime suspend: the suspend
>> callback clk_disable()s the clock that the devm_clk_get_enabled()
>> release is about to clk_disable_unprepare(), and every device teardown
>> WARNs in clk_core_disable() ("clkN already disabled").
>>=20
>> Restore the trailer: with runtime PM disabled and the state forced to
>> suspended before devres runs, the suspend callback cannot fire and the
>> clock enable count stays balanced.
>>=20
>> Fixes: 50c63491ff26 ("i2c: xiic: switch to devres managed APIs")
>> ---
>
> ^^^ Something went wrong. The SoB must be part of the official commit mes=
sage.
> Putting it under the cutter '---' line makes it disappear.

My bad,

Let me fix it and send v2

Thanks,
Abdurrahman

