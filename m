Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18615C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 09:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a4AqRX4jgpQUQupuoQFqpmYTbRVzBhfX6O9GAy7aKKQ=; b=x7lYRx8zU/6kwRdrTrcdkbHP6J
	c+ExZcbhYbnGCV+FTHO25rvRs/MzKlu+M+/eEkyhinnM1KsaB8RGNWLUP78M9NjT+6bsqWJB5d3LX
	9Wxg6zv2+gIA7V+UllH6hM913a4SvdEUcfLhuJF8/oN80toIJNUOmR4p9apsqujzPIm7/FkgEtSyh
	syVYIzfV3o/D+mcLkPYosx+wCcQ+ydG+59YD0Xw6j4Z4odg7j+9tWnsW3AwqfQe8ZtWLG069mV8A9
	YlJuDIvcHaMRB/YbC3q7iNs79XWTg8055SoiY6Lsa28mu/X2jjs6AoZ3UDiCCR3kzGPhfJp7PkCy8
	hGGhwyhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFah-0000000EJhn-1YYu;
	Fri, 24 Jan 2025 09:03:03 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFWJ-0000000EIhA-03DD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 08:58:32 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2161eb94cceso22475455ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 00:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737709110; x=1738313910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a4AqRX4jgpQUQupuoQFqpmYTbRVzBhfX6O9GAy7aKKQ=;
        b=qpVAfa4tuZ24DcUXG/q7PxfFZAb2IsslCTxgOBbkxNQShdboVH64ayY3DoJJ6fzh9S
         +Ni6L8R3ko9xI9jN8nrrJKgg4P8zW3+9g8TdSxLvyUzEmIvoWZJJIShEo+TCobfyn6c+
         3vDhVxgNcDMmPGSH3M0oqOYuCzaY3aE39hYYckb2W2uFZ0kEnErzcl8Zn/z8noBRFQKa
         LI/+dOBihoLWgjYT33P/6bBbbmko1f4S71Vc8pvI7GPjvTsyA0wUCyocCCKhSl5mPemH
         C1JYbm98Un2wctaTQS3gSnkuLH4GWiFrlxDtqcQSXjqSKns+zXB9jI94F6DOUHCOFuq0
         +KAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737709110; x=1738313910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4AqRX4jgpQUQupuoQFqpmYTbRVzBhfX6O9GAy7aKKQ=;
        b=rXXe4xV59R0+R1kQQvAdRS3WTm1A5NkHnJN43mmci9EmPahmmjX5v/SF8IqTHEdSan
         nglVWe7pO1epEzsjuH088MN//hVpDodjactdjb7/72ohhyuI6+l9xdLGmO3A/OtIXUg1
         OmznTEBZpb2QJs4kWqUeNH49iglNr1fb8B4iFFKkAFPG/XBmS7q/C0hU8LqQW+JQRpKf
         +vyTwvvYzyaSX+HUZdYhEOz6mpHwZl17PN1K2Fsoz4hbUql6gxpIRbMPfhAwYT1ULgGg
         yldQ7E38vEqgrzU8wDIrs4uUvKFaz674UEhPl4SVy7T7+LyU7cUqTv24boISAF2Cys9N
         1lCw==
X-Forwarded-Encrypted: i=1; AJvYcCVS1ccC7QuikxnXJUpKIU10YMxdxZZs+Sz2R+8CBx/O2jMSh9EikRiMeHCS+SwhkuaN0Zi7rhWGkB8AcaVhrtFd@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlypy793wgSeN+uVXXW50x01kDKVFXYMK0aCCYrr7GQxggUe+w
	no86qNBQAxBb3pC6Gv37J7EIAodNHFeHBlsuVJeFoPhQ9tNhThQNCDffW26pukA=
X-Gm-Gg: ASbGncvt/YW0/HH5dJtJ+rUsdzcQkolvLvicIy55crhS91gJen6F0mmAXgZMgjs1Kfx
	YzyNDVN/mWPTL0nqCF5TaaQbu9o3sC10Ki6lxn8o7re0m97aq+rBF05oflYbzY9q39XOmXW5T63
	64cmTVn9RXiM94gOt8WhviVrNUkKG8ro+hzdf1NGhhwFU6Y1qQW0kQMHKrx6DkW11pqIXWkAslK
	TVxdNWuGeYkH4o9eYhN42De0OqavubcX4yPjlJAeZNeW4FvphGEpFPWLhhMy6I3NdUayBk4iwwd
	/uNVimI=
X-Google-Smtp-Source: AGHT+IGaLv3P86dnfhfsz8clY+KvPxRH7m/1Pd0NzNkAaLxjGYIDOwn76y4qMRrSSuP3v13w1OIdqA==
X-Received: by 2002:a17:903:320e:b0:217:9172:2ce1 with SMTP id d9443c01a7336-21c35544407mr480084755ad.22.1737709110054;
        Fri, 24 Jan 2025 00:58:30 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9e1b2sm11621015ad.17.2025.01.24.00.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 00:58:29 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Hector Martin <marcan@marcan.st>,
	Huacai Chen <chenhuacai@kernel.org>,
	Huang Rui <ray.huang@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	arm-scmi@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev
Subject: [PATCH 00/15] cpufreq: simplify boost handling
Date: Fri, 24 Jan 2025 14:28:04 +0530
Message-Id: <cover.1737707712.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_005831_071541_9A41AC92 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

Hello,

The boost feature can be controlled at two levels currently, driver
level (applies to all policies) and per-policy.

Currently most of the drivers enables driver level boost support from the
per-policy ->init() callback, which isn't really efficient as that gets called
for each policy and then there is online/offline path too where this gets done
unnecessarily.

Also it is possible to have a scenario where not all cpufreq policies support
boost frequencies. And letting sysfs (or other parts of the kernel) enable boost
feature for that policy isn't correct.

Simplify and cleanup handling of boost to solve these issues.

Pushed here:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/boost

Rebased over few dependencies from PM tree, will push to the arm-cpufreq tree
after merge window is closed.

Viresh Kumar (15):
  cpufreq: staticize cpufreq_boost_trigger_state()
  cpufreq: Export cpufreq_boost_set_sw()
  cpufreq: Introduce policy->boost_supported flag
  cpufreq: acpi: Set policy->boost_supported
  cpufreq: amd: Set policy->boost_supported
  cpufreq: cppc: Set policy->boost_supported
  cpufreq: Restrict enabling boost on policies with no boost frequencies
  cpufreq: apple: Set .set_boost directly
  cpufreq: loongson: Set .set_boost directly
  cpufreq: powernv: Set .set_boost directly
  cpufreq: scmi: Set .set_boost directly
  cpufreq: dt: Set .set_boost directly
  cpufreq: qcom: Set .set_boost directly
  cpufreq: staticize policy_has_boost_freq()
  cpufreq: Remove cpufreq_enable_boost_support()

 drivers/cpufreq/acpi-cpufreq.c      |  3 +++
 drivers/cpufreq/amd-pstate.c        |  4 ++--
 drivers/cpufreq/apple-soc-cpufreq.c | 10 +---------
 drivers/cpufreq/cppc_cpufreq.c      |  9 +--------
 drivers/cpufreq/cpufreq-dt.c        | 14 +-------------
 drivers/cpufreq/cpufreq.c           | 30 ++++++++++++-----------------
 drivers/cpufreq/freq_table.c        |  7 +++++--
 drivers/cpufreq/loongson3_cpufreq.c | 10 +---------
 drivers/cpufreq/powernv-cpufreq.c   |  5 +----
 drivers/cpufreq/qcom-cpufreq-hw.c   |  7 +------
 drivers/cpufreq/scmi-cpufreq.c      | 11 +----------
 include/linux/cpufreq.h             | 20 ++++++-------------
 12 files changed, 35 insertions(+), 95 deletions(-)

-- 
2.31.1.272.g89b43f80a514


