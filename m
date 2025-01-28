Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF638C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 11:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krOWEd+g1upwe3edf/FUPzHG6VEvFaBxOzWVAtUCkLs=; b=JXR/VKUsmf7E+br3jY9AAFJ8wj
	I7uQUSN7ZHR3+5pszGgJbDG+TprsUh34wlWKYHc8ihXvb0EqhrkCtBKdmDvZhTKB0gcWvWxDlS2JZ
	dOvpyWMcAhZBewfZmLbhTlmuBbqFQMWfRn5TtteR5rCF05fwavFsdTIMTYlA8Vtjvh4su1wmo7kj/
	/NJKLA8tzGDLVY78yXwshNbFYUqHpp10nefoCOISDusM3qV638EYmJnKPW9fmOu1/8cwcn5fEGmEx
	DrrCu1Oetn7XRrh+sABWDJwCpEtrNIXPSiv6BOLDog1xFIIJuy8vm+cwbmuQ6xXyVcvyw0GQKbvUh
	BMMB4ZZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjm8-00000004mlJ-1K6T;
	Tue, 28 Jan 2025 11:29:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjkm-00000004mdH-3nwG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 11:27:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 540E1497;
	Tue, 28 Jan 2025 03:28:02 -0800 (PST)
Received: from bogus (unknown [10.57.36.4])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACB553F694;
	Tue, 28 Jan 2025 03:27:33 -0800 (PST)
Date: Tue, 28 Jan 2025 11:27:01 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/15] cpufreq: scmi: Set .set_boost directly
Message-ID: <20250128112701.s2kgegovz625nuac@bogus>
References: <cover.1737707712.git.viresh.kumar@linaro.org>
 <ec27aef491c1b71ef5f1240480c52d051cdd821d.1737707712.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec27aef491c1b71ef5f1240480c52d051cdd821d.1737707712.git.viresh.kumar@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_032736_994934_39D5E270 
X-CRM114-Status: GOOD (  11.97  )
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

On Fri, Jan 24, 2025 at 02:28:15PM +0530, Viresh Kumar wrote:
> The boost feature can be controlled at two levels currently, driver
> level (applies to all policies) and per-policy.
> 
> Currently the driver enables driver level boost support from the
> per-policy ->init() callback, which isn't really efficient as that gets
> called for each policy and then there is online/offline path too where
> this gets done unnecessarily.
> 
> Instead set the .set_boost field directly and always enable the boost
> support. If a policy doesn't support boost feature, the core will not
> enable it for that policy.
> 
> Keep the initial state of driver level boost to disabled and let the
> user enable it if required as ideally the boost frequencies must be used
> only when really required.
>

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

