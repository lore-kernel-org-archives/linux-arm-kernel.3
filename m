Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E30C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 06:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SW9FatXBBr9uVZr3p1oMLELHRqOke3lhi3vQmmUuOgY=; b=txpeT7DiIocwKbztEYpazaZL7q
	+ObDPVnaM++QmFl25QwHvwSlOSAe0gC5uk4QeyqcDDNVRpcODXi6XJvfQE4atB4sUog23BBcB45b9
	S2lrKHLCaQ9gtja9MKqyEH540qZt1YbtPoIwk3OWNE1e6RcarIKtKDY5A1oGwkr3SYLbxSJyGPC0d
	6SJdT49jxBg33LynZArlI87nOE41PhjuPlwUGJTrcipaTVR58RWvVkcmMoNG+hnzhXxUQNqdJmKLw
	y6KM40sjzFsU8lJ1JGf9DCI8P9jroRjV8Lc7zvqIXGbpbQ4SRl4iQFkKVxyx/yMoJ7vrOM+uNr0qG
	PG+Kznjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWrDX-00000007R7L-2oI0;
	Wed, 02 Jul 2025 06:45:15 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWr7i-00000007QLU-0yop
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 06:39:15 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-235a3dd4f0dso40338635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 23:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751438353; x=1752043153; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SW9FatXBBr9uVZr3p1oMLELHRqOke3lhi3vQmmUuOgY=;
        b=tvjDelLaxTHLXgije/fF/FRVLimmX8WZes7694g8tPxwvQF6Xzdk8XcZK2aykV51vS
         ttgFCSiEKwi1RIgGoDESHhJwJwCLo8Yeqy28I2j3tzaYxUPfP1UlRFrA0WOb9Djh+BlE
         Kxp1NixJnKfsE2ryJmoQ3ED4pyuvjkRv8fEgmPYHaiThPrAaRoJE3TIaXlKxr5hIhsur
         f5DBDmGK3bfjXX1/kiY/3OEzBRzjris7+8b3jufmhNVoowymXjSc0zAjLQscwz6Ceei/
         0jsGfEs4IAUm0hkk61qPxLTVB0eI91SgOpNu81NQUn0GAt8XUwliaymQ+7nNLF6rnQZd
         PHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751438353; x=1752043153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SW9FatXBBr9uVZr3p1oMLELHRqOke3lhi3vQmmUuOgY=;
        b=o/HUcOEu1xa62OmiDy3daZfND8YJNcym3224DticNmDQCJ5dvAP4U4PMB1N8tuqho+
         R0NmVG14eIcsLTBJ/fmdMkuwzW/NY69A9tZhCPNS2NIi75D6JYMBgi8x493lhiYRvVxQ
         /1gCu0xt1IXfdP1yZ2d07xv0D6eFGevgs2fh63sTK59SzqIVy/9aLKBQUaSAvXmVlcfT
         MGMp2hJvX27fSMPgRlsXjVU/XLn/4qwubygrv5vP7RhqLRjtG/dHAijV1BPBhbqhJMbY
         Xjn3Zk0GMsifLCOSuTCUh+uSv06hWCr/0EZ4fdBvVHJxuGSGitHaSoBCr0sgfNjjvseO
         kewA==
X-Forwarded-Encrypted: i=1; AJvYcCU3j/bkvQkyXnPD+Tpt43Lu/A+V1xwJ4oaOYekeAIK7JeuBL5E2N+xbecX+ujzztK2VmIT7aixODnxq7H4a6Ghu@lists.infradead.org
X-Gm-Message-State: AOJu0YzTCJ41L4fGNVncZVBJeX4JJw887OO5Sz/DRxtWQ94uh0sW8xGJ
	S7buunT4nFtH06YXUA3pvEQ21H8oxOwyCPO8yzGztPwbaaki5tOa/30kuvTPhOr9WC8=
X-Gm-Gg: ASbGncu9MDtQxkvNSnoGb85IvFvESA4zEcw/oilLC7ggvbIR+xtNxLMZVjQw76IX6p6
	CgpTbyMXK5FXIEzNbJYktRhqm7kMuPKO7YaGEjZzgZmxr9ljRJ3wnO8upLGj4mQUCkNASQzL5Aa
	Gu14Pet54wxiFWKDwmn+Wr3U7taM0y+8loJFMMEJzmwNntnlz0rnST8nrlnarDe8dq+DYUhFA/s
	4tltl5WoIl+3GZ6kC6MFZrKuhVYDsY7cV52vq5JbP3un3+PydccDzdnNpRTxCIg6/JZPKNi2emb
	+Eh29HMREZrLsosupcL/nzExAPpV6PmlXIVlT/5oxA3Ge302nsw0xP1WrQqFNcg=
X-Google-Smtp-Source: AGHT+IEyC4KmfLegb1B82Q909aH2SFqeih6Xb6CMFnbeqXshdOd8HpJJu9yHcNKFqbkSWsfoNu5s9Q==
X-Received: by 2002:a17:903:1b04:b0:234:8a4a:ada5 with SMTP id d9443c01a7336-23c6e5b5d10mr21914435ad.37.1751438352997;
        Tue, 01 Jul 2025 23:39:12 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm128787855ad.80.2025.07.01.23.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 23:39:12 -0700 (PDT)
Date: Wed, 2 Jul 2025 12:09:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] cpufreq: armada-8k: Fix off by one in
 armada_8k_cpufreq_free_table()
Message-ID: <20250702063909.zeplodhdbvqscefm@vireshk-i7>
References: <7ae149bf-5e4d-40df-b1c2-31d5ef418f05@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ae149bf-5e4d-40df-b1c2-31d5ef418f05@sabinyo.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_233914_270465_A5C7172C 
X-CRM114-Status: GOOD (  13.24  )
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

On 01-07-25, 17:30, Dan Carpenter wrote:
> The freq_tables[] array has num_possible_cpus() elements so, to avoid an
> out of bounds access, this loop should be capped at "< nb_cpus" instead
> of "<= nb_cpus".  The freq_tables[] array is allocated in
> armada_8k_cpufreq_init().
> 
> Cc: stable@vger.kernel.org
> Fixes: f525a670533d ("cpufreq: ap806: add cpufreq driver for Armada 8K")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/cpufreq/armada-8k-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh

