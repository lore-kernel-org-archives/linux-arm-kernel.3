Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50939D7234B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 08:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MLUFqJfhMQzXQiovwpCcvnDfDmha2OYkkxdpqAEPN4=; b=3HSX6Ztj7rMxIb92OO2QofV46d
	5LCU9tZPAXtLrpWTsL1aKFRFPFGedncWI3ClgCC9WsEo0PQQ21r2KO3ByyOTMiKl7WrAwGBLW2JEQ
	3k2C5lqYj78eMzum/lrcXSjMKkVlZLQScF6ZFdzyRlcL9+aUABanhBPGA7+apAxIQUrb3C4eYqn4p
	mmZ3WXeQndiwsU8EVL8FrwWpnEKA9hKziUFv55QxwHXT6KyiIBl+u5kQ53zBs2/v4qDTLFO0UXKfJ
	EdxuD0jN4y1W/ZRt4eWDraTNEm4ChGiWZVtSn2Aro6Gfj8zQg3iAucTFsYvBF9mIK8JD35LtU3ihO
	eWiSvnMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCZZ-00000008Tyi-0r6e;
	Fri, 23 Jan 2026 08:31:17 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCZX-00000008Txp-0qJU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 08:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769157075; x=1800693075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wrxe/WpAWkOO8ZfQvMNXSIgzMIh+zwoBUGouZ5gx4uQ=;
  b=dnbuFgOFl6BEfA76v/psK+K/MwRCink73tuqbWr9tSGLshorm8AuFw47
   Tat9y0PrjpXAyayvUGh6DiJidwA3aURNXNgGKYfehxaX0EAtYOK4vPehy
   a8gUlICmTpVcNMnCc/MMirPkgvPnA3zv1gkzKQ248XiHIfGHPIeVgSuz8
   f4BEUmTz5UJhdwRSeNWv/rQznNgJCQKWV8a6pN1xkt6s/WqxUCM462DYf
   1AZ5eM2a2gRlNXEvcwjxwTaEO6OaK6wP4gXg9z8okDASNlkik+ajACkQ9
   hIVhz9rDlPNErQozTCbEtOUZgo4Kns4h4+J1eXZgYdKAl+ZrIb1djSvY3
   g==;
X-CSE-ConnectionGUID: 5Ue2RRTnRrKKdXwjNgp2Sg==
X-CSE-MsgGUID: 1nNaDWo7QYqAiU3o+4xcPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="95879590"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="95879590"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 00:31:15 -0800
X-CSE-ConnectionGUID: XrQTufygQmmNRvsPhmoMyg==
X-CSE-MsgGUID: e23z/7rhT0CvmExoizIX4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="244585847"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.112])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 00:31:13 -0800
Date: Fri, 23 Jan 2026 10:31:10 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] i2c: xiic: use generic device property accessors
Message-ID: <aXMxzohj6yD-8KSK@smile.fi.intel.com>
References: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_003115_249298_834FFEDB 
X-CRM114-Status: UNSURE (   9.09  )
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

On Fri, Jan 23, 2026 at 08:02:43AM +0000, Abdurrahman Hussain via B4 Relay wrote:
> Switch to generic device property accessors and make minor code
> refactoring.
> 
> Make the clock optional since the driver is designed to operate without
> explicit configuration in firmware thus making it useful on platforms
> where clock is not or cannot be provided.

Everything looks fine in the result, but one nuance ruins the series.
See my other comments. After fixing it and rebasing I will give you a tag.

-- 
With Best Regards,
Andy Shevchenko



