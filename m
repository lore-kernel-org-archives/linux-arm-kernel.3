Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69A8D79768
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 10:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ItL+KuU3NssOW4iSFWzG8BaWPjmeUvrfdgCiScCiS0=; b=DNUj1lhdC7XyFxr4hTxClj5lSU
	0i4MAbX5T7KR5pNI9+1SSsOkS8NVudHc5fYchcT0rW4cTdr+sGDYxjZn1ogOKHuTvbz8aObY+I8aI
	a5T9h9Dq/5wqgMt3kbNtzTwni2DMGQx6KGsw4RQkVxe+0GRmJ6fKwubyIXORIlsv8XLUpenR2kq0E
	VjWKfbPX7t895iN5ejMdK5+qMoqUM4IoIV8cpdRxxAxJaV91brkaW1Es8IcaiuNqn/birVWUP8SQt
	vhcsJvIvY+sY3TL948HsviQ0bB56eGxT3zLuZX4RrsHBvz0QFIvHWE7WO4CpHSDbe6mzhL/8xpCyu
	BDBos4Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8fY-00000002Vrk-1ljb;
	Sat, 31 Jan 2026 10:57:36 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8fW-00000002VrB-3WLx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 10:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769857055; x=1801393055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3ctKiyNg4ambyWt7fnVocvftWSiDr2Re2IDPMzawjaA=;
  b=Y/qSOi+tx1+d/Zv/tDBUOSivNWntvyZW8qVM2hsLaXpDidQpRYLnQl+4
   saLB85yFikI5tK2Wfj9aGNL6/25LWPi4/0rJPrwnMJhM/D464JBc4KDeB
   5SYMrlcs0gFQ1mcwCNXbC0HEMCRHZ9QclXKcsmga6kkIlSJ1wjBCsc0AW
   3g8dnoQi7Bd/U6K+uX8BKxUQkFz4CvhIvSZC/NIY9p9DFwcBSVPEDXsjs
   PS4KHTUjDJQdvyoqicL6rJGOhAhKOOUoA+zi5yZMqztRsW0+eoVSAS3+d
   c0nplC3OQlt4n6CS/XQY3QYEsyMKC39qaYN/m4BpUb1Is8/J6ftaFzoZ1
   A==;
X-CSE-ConnectionGUID: VVD9X6ZzReKrZMXvh3MvpQ==
X-CSE-MsgGUID: ScTBSzxlSTa87xzG51Ustg==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71003723"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="71003723"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 02:57:35 -0800
X-CSE-ConnectionGUID: 7OLvNaPdQF+ihKc+/98WBQ==
X-CSE-MsgGUID: uxRy37pdR1S6Od9dDDT+CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="213964787"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.97])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 02:57:31 -0800
Date: Sat, 31 Jan 2026 12:57:29 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: abdurrahman@nexthop.ai, Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 0/6] i2c: xiic: use generic device property accessors
Message-ID: <aX3gGYnBnA8otdMr@smile.fi.intel.com>
References: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
 <ec8693a4-e982-4227-9558-0b1fac543e62@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec8693a4-e982-4227-9558-0b1fac543e62@lunn.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_025734_916346_59DBE06C 
X-CRM114-Status: UNSURE (   9.71  )
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

On Thu, Jan 29, 2026 at 11:36:20PM +0100, Andrew Lunn wrote:
> > Skip clock setup on non-OF systems where clock cannot be provided.
> 
> I think 'cannot' is wrong here. Non-OF system technically could
> provide a clock, using whatever binding method they use. Not having a
> clock simply appears to be a limitation of your implementation.

Abdurrahman, can you rebase the series to move DT and clock changes to be the
last in it? This way we can move forward with the cleanups that have no
objections.

-- 
With Best Regards,
Andy Shevchenko



