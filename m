Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD5DC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+a91oW+XEpT6uwd1XGhqfpSXASpWO0V95HM9oxBjsHU=; b=tcyxhDZUQ1eMoBUexlyA5Du812
	ToEXSfj5kInWMXPUQW13ynyeu+23tPuahvr5TRwREAoNg3uGGR/AZ81HHBvbGbCDqzVlJjL/p55tR
	cFwtWAWHLIFgU0Pr8OOcL4PNZYwTx6iJxYxwA87i9QCN+Ho1hCMUGKoszYduEf0y4RLjIqwYz9DHr
	hY3n3AVeS2Gxx57z1TtqZBNtj4J2pdZT/Qe4QJoasi5A1yjRmy3F7nMyY9a2itjxz0KmN7FYq8J9X
	/hachVODHSEEiPCcJXVwsGP3NwGR8YmkTCfumuFW8Lj+osRcov/lG/MuaRS9h/EFi/3ZcvOX7mUgV
	HkCzxN1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7b7I-0000000Exzm-3HQj;
	Fri, 18 Sep 2026 16:07:12 +0000
Received: from mail-pz2-x28.google.com ([2607:f8b0:4864:3b::28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7b7G-0000000ExzI-25zS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:07:11 +0000
Received: by mail-pz2-x28.google.com with SMTP id 41be03b00d2f7-cc1cea34f01so761823a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789747630; x=1790352430; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+a91oW+XEpT6uwd1XGhqfpSXASpWO0V95HM9oxBjsHU=;
        b=JWkP4I2Q1HnWF1Bf3mOPgGTYbr/qz8u4BgkX0RhK3yLaQAC9G/cwddPRcns5LRmLyl
         jsVTjF6VZOXc0jDgpm2T56kBjQduPrLPqZsLb5HGKH65C7L8iGelKxY+wVOWjnKuTZFI
         2t0x2jLzMfcBwTpdBXJNnaNoorJmQRuwOhxwHw7YHFV/o+Dqy/FFoABVW0Kn3DvfcGW1
         2FKvy23tZxb64ldu+ebRSo2jsd29LnZAfyD0lTowhj3TAnYRQZIhWZ1WiKIuFlFSemHH
         Mggve9clhWIWYFnQWSPLlBphvp0AGHRTZQgq9+NoA8J8BPGXt8+ClLT2zBNZcZMqa+KR
         F9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789747630; x=1790352430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+a91oW+XEpT6uwd1XGhqfpSXASpWO0V95HM9oxBjsHU=;
        b=ogg49nllFvZR7THANpf/pExe1H0WZWJhJtAoSC4oPD1M+YGkzqB7Avd7w5wlmmtkZz
         i3SB+QddfHgyRgx7zL2dc7Zfpx6c+SzgnJRQFIc/kDLjoUkzmdMAJdTUGf2UNMlVkJ6S
         6/lBrxWN8ken3LRUlABuMLikJtYcJph803twmiJEY9Z2x4XjHtMeCG6Fy2lIg1cZUw2h
         /I4/MT4OXSxiJI2f9S38NDIU/kvd7ACR5zjDv/A4eJ8VaAxyDHPDDFJ5Y+wTYi+XZJwc
         9mypqrPJdtGeaVG6FdHMIttaU8DoxjPFARGDYAJHqgCF07FjrlKCN7UaJulyAmWd9aAJ
         WcTQ==
X-Forwarded-Encrypted: i=1; AKwUvByGpE4AudcP+6KaIb2lNh5GfXeN5UVbHAEkHAZA8IYbCOqdEK3KSuO2bGV+ZbS+qMWV8tI5SyXIt2imQOSB5ELn@lists.infradead.org
X-Gm-Message-State: AFuF++lC3+VI0yqJJHerAZWLYiuBnXPNbm55HbnuAgjPbg/TvNj1lOH/
	CD2qzF7Rq8jStdBuEGtp5uFU9PHIVYG4P5Is/JtEqm5udxKaleZ4dhSP
X-Gm-Gg: AYBFou273CUjYpIFeaiebH+sMMWCW+rFY/NDLAkLdve54fvZiheqOXLSsrcjdvnGgnQ
	vCxX6YxH0wWg5Ky8+yWfKFaxYUg6o7wKFHTNPbDyotUBDuZ7VumsnQv8DRJ5ircdelF052gXQNv
	yIUp+JcxcdmVQZEkZy3T3dWslIhAfaWeDAHgcdvCtwS0DBMqGOCMwIajkdRvwn9eTYEJgsh22LU
	GBojQyxmYP79kaYsdjD+2xYedbczZ9MM74eZ94ddhNefujoQaVhxFpFurMDxddBLfAYaJ8zXRkp
	gRWlTC8Dl/q4AimBPxjMB9JZwfKo/hofGf3ds3m+w1TuVwHOHsXL7WEqWkp5wvVwDTQlXJfe7eb
	wOQ1ij+UneyVBr5JjnUJ9PRF157OOveZ5QmBgEAgo6B6BO6v1UonNEbbwOw5fMabxGpL2Zj21ce
	BQcS7AIhoNBJebkGPwMjNvR6U80IwnzBb5O4opxd7qjOrabawnEyFv0XD/rNmDaLZXFW8KtLsv6
	0ZLfzFZ6HAv
X-Received: by 2002:a17:90b:28c6:b0:39e:6a82:afd2 with SMTP id 98e67ed59e1d1-39e6a82bbccmr686160a91.36.1789747629623;
        Fri, 18 Sep 2026 09:07:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32da4960sm39043eec.0.2026.09.18.09.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:07:09 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:07:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Quchaosheng <quchaosheng000406@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: vexpress: point the DT binding reference at
 the schema
Message-ID: <93b9a44c-d595-4ba3-afc6-eb6abf0c17c2@roeck-us.net>
References: <20260917115818.540344-1-quchaosheng000406@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917115818.540344-1-quchaosheng000406@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_090710_536166_867996DD 
X-CRM114-Status: GOOD (  10.85  )
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

On Thu, Sep 17, 2026 at 07:58:17PM +0800, Quchaosheng wrote:
> Documentation/hwmon/vexpress.rst points at
> Documentation/devicetree/bindings/hwmon/vexpress.txt for the device tree
> binding of the arm,vexpress-volt, -amp, -temp, -power and -energy sensors.
> 
> That file only restates the compatibles and the label property, which the
> arm/vexpress-config.yaml schema describes now. Point the reference there.
> 
> Assisted-by: LLM
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>

Applied.

Thanks,
Guenter

