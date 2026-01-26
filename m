Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB0CCF65D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XR/OmZb/QjQPz3fuoAIjvPGrYyR0WhX5AnPGYSpyPn4=; b=zhH18sJPqMEJWTFMRd0a8uPqeh
	dk1NJGHxf+HeZNZuRQS/Tr8hOd/xS5LgnW6ekwfvHXE5QmDmSX+47m1gkt3kQi4Y/D+pAYkOPZ5E9
	z2lbbJrEuPj1rCEP7mhlovMkV6v9ra7A+32gggUN0rq6mu3zh+x66DuaW+CmY14QJoBhSVcUad7l1
	b/yYerkjvjoi5fHrQkUgJPnStJssrnRDBhZWTPhy+oOwG3JnqjLj9eF/PE4AAARcPijeiOlFRmNvN
	9VmUS2LIpBo5p2XM1MJ6WHxaq65XuTusFLwHK+r76w/XQywHNMS573oBHYAe1cMr7nPUEZ0ZVru0e
	heHidRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJic-0000000CGfo-11pP;
	Mon, 26 Jan 2026 10:21:14 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJiZ-0000000CGfQ-3I9A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769422872; x=1800958872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yHsGG1s+KxBZfz9QWTQm5s8Fht+yShIb5G86SJ5W6iE=;
  b=megGyUEEmwdQjTkbzS+LVe05I0OtGPFvV9msZJ7rsGn3pForBoo6CA/Q
   rRXYz9paQ2hROIZsptRUl7CY9MqmVS7r3HiAYGmZtfHvh+/LkiT/wJuYY
   6QxHKHxeqeLY+4zKHaihewf2Uum1Q97t1sets/cA8q1dKuuENZuuk+WNA
   45Wc1qH+yi5cxCNbat1VDpGxCtwnnDoxGcaCSYkkp21KQvvoFuaVeu8Ru
   kcraLH/MtNfkcF4R+i0m2L9sH+fTnBSrMV/XtOJVprTrwrzj28vK3eRHM
   aKGTJpVaBGyX3dP6n3TG5GWm0mNeoJSmWX1+BfWuk/C83BWyjrvt7gTZN
   Q==;
X-CSE-ConnectionGUID: Xbc77Bs1QCmq3tblhIkOfg==
X-CSE-MsgGUID: a2otXa06QTGdpgwJek4XMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70498304"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="70498304"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:21:09 -0800
X-CSE-ConnectionGUID: YnKlWPcCRcqfgZi/t7/nLQ==
X-CSE-MsgGUID: eFzilmYxS/OtDc1LQB6YAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="206878454"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.122])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:20:58 -0800
Date: Mon, 26 Jan 2026 12:20:55 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH 0/4] hwspinlock: refactor headers into public
 provider/consumer pair
Message-ID: <aXdAB2bLTy6u8G8c@smile.fi.intel.com>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
 <aXc-Zxw05XQLb1Dy@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXc-Zxw05XQLb1Dy@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_022111_871481_32229728 
X-CRM114-Status: GOOD (  13.41  )
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

On Mon, Jan 26, 2026 at 11:13:59AM +0100, Wolfram Sang wrote:
> 
> > I don't like the idea of sharing internal stuff. Why would we need to have
> > a struct hwspinlock to be visible?
> 
> Providers need it, especially the 'priv' member. Consumers won't see it.

But can't we make it opaque?

We may have getters and setters for the priv member...

-- 
With Best Regards,
Andy Shevchenko



