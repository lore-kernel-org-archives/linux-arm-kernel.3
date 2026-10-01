Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C618ACA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIr4K7N8tWlFElP154T0gDhZmtv6PLeTBLURDyjAzjU=; b=euU2Dim22XR7A0l82wIRTOR4OX
	+atlxqVKN87bVQOp+3lH9/Fx02do9qotnWhslRT8pxoU7rOXv/Xe5UoQsVg0zNX3R48++lmIxEYje
	4ZuATbsRTok6dGwRjUeiJ576Dd7RODyjIpxbunmYLQSFg2FlipzRy5m1hH3jKxjw47Kszymxo1+0d
	vBysgrEEObL/yp31TH/gwpSRCvP0Fz+XUpkAqXdZvt9FHmCvoPpGQe8HW+y0s1wBM4GGYfNsq6IHp
	7F/BG2HTyUdI04MK7IUWnoMBlYS785eAs3f9uDkNDi9s6VId41VydggwWRetV+EcLw8pjTrrKhHst
	T9GZXLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCODI-0000000AG3O-1P6m;
	Thu, 01 Oct 2026 21:21:12 +0000
Received: from mail-ot1-x347.google.com ([2607:f8b0:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCODB-0000000AG2f-1m24
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:21:08 +0000
Received: by mail-ot1-x347.google.com with SMTP id 46e09a7af769-81aa8dc3613so4834102a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 14:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790889661; x=1791494461; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dIr4K7N8tWlFElP154T0gDhZmtv6PLeTBLURDyjAzjU=;
        b=Ce9JN9WJzSmcv2IDu8dt3NNsE8Byo88mUL7JZYQIzbx43uq3JcbPQ9H7oSQ2k+UfAE
         8CI+vIPSr6nc1fjvR7XM9JLdJFcrsnO3usMmxFDWQeidCHrP2yH3XdCMW2MRhwBl5vks
         zxKmzA5OYKSxw02knD1jG5wC+H34j1gVtN80MgplE282HyQ/FViKpeJOTx7hLW8hK3Ae
         1NoPzHgWBe4SGK8F+YFZbVOa1N6C1xef6nj7E0fzi0OLl/q6ZAt3qnyqWHxaKf0OvS4a
         MVlT6g1VcmHPXySjpXYynN9FGqDCGPU0pso2EmxBpagh8eATXdvxTd7PtcPru7N8+rxD
         sqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790889661; x=1791494461;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dIr4K7N8tWlFElP154T0gDhZmtv6PLeTBLURDyjAzjU=;
        b=XztFEhE0pOBQUdGoEPuORFOPCamfnfp/ru72CApm/8S667WxwsDLvQDK0Ml8SQOuZt
         l63QS5y/pQYcVvipjlg0efCYJeNUe6v9jso7nb3OVAeOiwS7JTNCXc0UyVoj5WcyGK5o
         xpd9kh/aUnxi6U/nU8bFg9ye7WNHThDVzBIAUO/1duuSblJx5OS8OVOJ0s0fej+jCujw
         dfTWhReswNW1HuvMaVzJtbNZi+CWkdUA7xXQ5LYU+Tz5AML2N43b4rGcQF7OrqdGfRAR
         Q2GwHHgW8r5+8RBRejvO+dHZuUbsEE5eKXKSKvZWDWcaEWGfTCHnazBfO589f3o5koGz
         RxNw==
X-Forwarded-Encrypted: i=1; AKwUvBzGguIygDjnF+HWmMp0HJyfNVsQ3FKRloTrWHHgrn5ncTRbAFM0KAbI8REgSk0Y7QvEbY+1wQmtzIY6UTIAagR4@lists.infradead.org
X-Gm-Message-State: AFuF++nTq6ImE5syvs0qIdJyoCJIc1GfWL7bD1J6174aCeeF7iNRC+e2
	usVb3w94PtT/GRKyKJ0W1AgrTH+lk976XrCdEEShTcQ8zijwhQx8brTYAR8h+qSJdXwdEvpDf30
	hOpMFyReJYLDMVNaketQ+i6FoKA==
X-Received: from iobir24.prod.google.com ([2002:a05:6602:7158:b0:9c3:8b15:2c82])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:6905:b0:4c3:a091:52f9 with SMTP id 5614622812f47-4f526747d3fmr385353b6e.2.1790889660625;
 Thu, 01 Oct 2026 14:21:00 -0700 (PDT)
Date: Thu,  1 Oct 2026 21:21:00 +0000
In-Reply-To: <56d86280-fcea-4d2d-b6b9-b47449f3408d@linaro.org>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
 <20260924172928.2110956-21-coltonlewis@google.com> <56d86280-fcea-4d2d-b6b9-b47449f3408d@linaro.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001212100.2035442-1-coltonlewis@google.com>
Subject: Re: [PATCH v9 20/22] KVM: arm64: Add vCPU device attr to partition
 the PMU
From: Colton Lewis <coltonlewis@google.com>
To: James Clark <james.clark@linaro.org>
Cc: Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Zide Chen <zide.chen@intel.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_142105_465894_1CDF11B5 
X-CRM114-Status: GOOD (  17.04  )
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

Hi James,

On Wed, Sep 30, 2026 at 04:27:27PM +0100, James Clark wrote:
> > @@ -77,7 +80,9 @@ Parameters: in:imaan address of a u32 value (N)
> >   Returns:
> >   	 =======  ====================================================
> >   	 -EBUSY   PMUv3 already initialized, or a vCPU has already run
> > -	 -EINVAL  No PMUv3 explicitly selected, or value of N out of range
> > +	 -EINVAL  No PMUv3 explicitly selected, or value of N out of
> > +		  range (>= max_counters when partitioning is
> > +		  enabled)
>
> "No PMUv3 explicitly selected, or value of N > max_counters, or N >
> max_counters - 1 when partitioning is enabled".
>
> That might be clearer, otherwise it seems like max_counters being relevant
> to "out of range" only applies to when partitioning is enabled, not that
> it's max_counters all the time but one is -1.

Agreed, that reads much better. I will update it to your phrasing in
v10.

Thanks,
Colton

