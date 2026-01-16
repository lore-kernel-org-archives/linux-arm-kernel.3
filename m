Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6011D47CDE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 11:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jV2nDw2Vhgr3ldkqV0sU8zgZ6eVl5hW05m1W3wHTqy0=; b=MV3iSP9bGQh4NOKF+TBzeevnDt
	DYUuWbke3BUIaFiNgXy6oZkBg4+nQnlfPz5fPSmTwV43raJ+JksJEdFtH7lW4MOM3N9oKr/l/BOLA
	8WaY6qTsgaIInPwyWBpbr6RN36ZAxH+haRE5WV7OMEU0FnwA8AY2zSQbC5YwSit3XA/+ame4bmfMW
	Gkb6+fr99K+ILLegwsRUVnjsgQrtQR1LVj5lK3YSUCihMiCyxwKxeV6MJ9aIDoStNgtH2H+9BvVoH
	+CSlXt4l/MnqZNwxc15n9D6PDvYn4wwCkJiAENiFL4NrhxYIbd1cm8AZgBKl/gwGxx9KMXEBA3gI0
	OsOCUttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghiE-0000000E10i-3bt3;
	Fri, 16 Jan 2026 11:09:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghiC-0000000E105-2f85
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 11:09:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 366C41515;
	Fri, 16 Jan 2026 03:09:43 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CBCC3F59E;
	Fri, 16 Jan 2026 03:09:49 -0800 (PST)
Date: Fri, 16 Jan 2026 11:09:47 +0000
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] perf arm_spe: Minor event configs housekeeping
Message-ID: <20260116110947.GB1286628@e132581.arm.com>
References: <20251212-perf_c2c_update_event-v2-0-27df9a6cb1d4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-perf_c2c_update_event-v2-0-27df9a6cb1d4@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_030952_715783_AB790F85 
X-CRM114-Status: GOOD (  11.49  )
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

On Fri, Dec 12, 2025 at 05:24:58PM +0000, Leo Yan wrote:
> This series is to clean up event configs and update the doc for the
> memory events and related options on different archs.
> 
> A quick verifying on Orion6 board with commands:
> 
>   perf c2c record -e spe-load -- test
>   perf c2c record -e spe-store -- test

Gentle ping for this short series, thanks!

