Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504BAC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 09:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffUuPnzh2TPX+Egfe8xlfZU1R5Lxar6mQlC3Al+aYrk=; b=rwusAWjXv7oxGoVYzXbWYfdNQL
	25H35beNSuXb/qazvtzDaKOMiZHEcviGi18T1+r4r0TXZBqHAfZNYCpjbrpdscksAtxGJx68cbl3f
	sL8Tk0ywpooc2wD2VHJ5S1yj9BYD1Tp1lWp6xALDoWOESFZ4/J02Mwxel4c/sbxQfO1hjlPPmRSeQ
	K7fJ56cMq+Mo/leSS2P1J8RNKVEteu9KqR/ywnm0lVcQNCtk7I08KP/HkExWGx2XtDIaCSDZCp5L+
	lDL8ZIqRIGDHvBURlO6pjc4RVBOA7/r8V0laI8T/x3+mXPFTxXdZjiVBllptWLWayWkQ8UuS9vMDg
	0tSdoqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2KF-00000000BFo-2FYo;
	Mon, 03 Mar 2025 09:43:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2GL-00000000Abw-0Yf0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 09:39:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1F7E113E;
	Mon,  3 Mar 2025 01:39:11 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F9C83F66E;
	Mon,  3 Mar 2025 01:38:57 -0800 (PST)
Date: Mon, 3 Mar 2025 09:38:53 +0000
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Will Deacon <will@kernel.org>,
	Graham Woodward <graham.woodward@arm.com>, Paschalis.Mpeis@arm.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/12] perf script: Refactor branch flags for Arm SPE
Message-ID: <20250303093853.GG2157064@e132581.arm.com>
References: <20250217195908.176207-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217195908.176207-1-leo.yan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_013901_211829_10CC5D3F 
X-CRM114-Status: GOOD (  10.02  )
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

Hi Arnaldo, Namhyung,

On Mon, Feb 17, 2025 at 07:58:56PM +0000, Leo Yan wrote:
> This patch series refactors branch flags for support Arm SPE.  The patch
> set is divided into two parts, the first part is for refactoring common
> code and the second part is for enabling Arm SPE.

James has given review tags (including the new added patch 06).  Could
you kindly pick up this series?

Sorry for pushing a bit, as we have dependency on it.

Thanks,
Leo

