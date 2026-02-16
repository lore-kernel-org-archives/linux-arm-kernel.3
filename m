Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843A7E63F2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 07:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GEM2W2W2mLvGC3+JoevZF0ShNYbCQJ9Oe7weqUqtJw=; b=srXF+g0kWHXgT6NGdUKlkmSV/H
	YAA1hOeBnGH1ZIq8BOPyefvHY8rZsixFnPW1cSUMCTsXs26IoMxL7K8wDVg43BlEoObuFZFsp3asF
	GPHGpBozxAXD/PKu+/5807e+aEfrjQnGMjHCAkOoKGplsZnoXpobQOdDCQ1XjgnYoYsn1xv+X7LyO
	p1XrKt+yVIFrOx6RpseNSg+Td/UTfHiiaBwpSwAlSWsFqaICgzRUAWEErkGTdbHoRQerZHSwQ2oWs
	LNyhaZLbuC4Or+vqGyL2P+4WeJZXJHWANeq7jdq65In8KLO0SHj2NDfwiapq3gwYyUWoYf2YhGHcS
	qTHkyhKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrtBN-000000065l5-1Qoq;
	Mon, 16 Feb 2026 07:38:13 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrtBK-000000065kZ-20kr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 07:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771227491; x=1802763491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nCZ4NiwuDsoLiBa20YbgHZ5csgZ2EwKqPA1Cf/2HJSY=;
  b=CEvqauaAsXH02rUZcTASMQXdCZGJt6uhjy0ZHpkkLIyMP4CMGuwXIDbU
   q7h1gX60G8FePU8quG7DH1uqivfOh2XsW7tT19bvhopWVpYYsXNqiOcY9
   vt/1sNBzWWZybvwwghUULdGSZHEJZT8gwsrbHm+kpj57f1QkkLx6b+1kE
   Z+13Dq21SQsW8emvKw8kJ6vjbGmqwDFfZG1bN6njYFyR8XrmXqhpRnIAk
   UBLgwRIjN5om/sYrC+D8pht8WW64wp8ylfZtdGihv1zAeuK4aFuX4RChR
   06rfyxcQb4lb5YjEbHYMBIHNjZ6WDrdJYDiOvxs1GLd7KZzQrQ955QY9i
   Q==;
X-CSE-ConnectionGUID: aOOL6L+pS4aHC88ho2BvPg==
X-CSE-MsgGUID: LRBnDh7dTFG+fz1J3SjkoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72477189"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="72477189"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 23:38:07 -0800
X-CSE-ConnectionGUID: EdsirQxuThy4pZ//UAUwww==
X-CSE-MsgGUID: 4FbVnXzOReaqw6nAKXK6Tg==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 23:37:59 -0800
Date: Mon, 16 Feb 2026 09:37:57 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: Re: [RFC PATCH v2 13/13] hwspinlock: refactor consumer.h from public
 header
Message-ID: <aZLJVfTe0-oZzb3w@smile.fi.intel.com>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-14-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215225501.6365-14-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_233810_578581_3266874B 
X-CRM114-Status: GOOD (  11.33  )
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

On Sun, Feb 15, 2026 at 11:54:53PM +0100, Wolfram Sang wrote:
> Factor out the entries only needed for consumers from the generic public
> header. This allows for a clean separation between providers and
> consumers.

> FIXME: separate driver changes?

To me the change sounds quite small and unlikely to conflict in the future, I
would just mark it

  treewide: refactor hwspinlock/consumer.h from public header

-- 
With Best Regards,
Andy Shevchenko



