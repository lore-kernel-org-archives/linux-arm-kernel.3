Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7411C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXgwaRmrIT1e61CcqNADChnh49sRUzXRY64HlZB1vaw=; b=W3+IgrJu8OPIDvMAAJW6D64yjo
	RvRQ7Zar0sLzVVYl1KhtT4grCd0ruDlhIahHpd4/5jU0+cXBuAlSsjfe5ha1VFye9O+bL5rM41/kO
	JecO6r+DCKYPCPeqwT6Dc0YgI/GxHKsIWuEkFeN3CaaqixiYJ+eKsm0B0EYdwQhC6+XsZP9SRwMuR
	WQbJwluD0obuUoJ6Zig0vYRyi1+/R4AnHn76RgW7a1L7oTeS68D0ZjFrW3F82Sq6MAXeXrNo22cEk
	umS5077DUTZ4GVqBIGiYf3/q453fP6odKTLp6V5SLlSqcojfE6JTQZh4QfIOy6a0cQZ6I5Q0HAcR9
	NaRhNX4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zRV-00000005HuA-0HM4;
	Tue, 22 Sep 2026 12:17:49 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zRS-00000005Htd-2ICV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790079466; x=1821615466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hHj6ryPUb7nCKma00OFgMT3n+REclaknho5AYIRnK5s=;
  b=GnIR0JxTyA/agIhgmx0Tbz/8nK+aL2e1/HdwjVL+PQ7btsXLXvlIfBfm
   jIkRTR+RhI81Uerbv22Bb/h5YSdsbJmTvw3wnYX9kpRIVHx8pM/CIGthj
   TFksYyXxiaUaMNDZZZSoy29jRdgECmAYV6N6HgynXB+to+Xklwrcp2Jv4
   rvMtqjluP5hEWWdLScZX2GkKfArSlTyrcLLVy8ilYHlq+eiy6cvS/n+8O
   Ivok0KXxULSgwnkoos+RBFqMOzAi6K5LZNw3d/5VCW0mOQ4y6ij16CIni
   /dEqslV0bHHt6ehXBSmCQe16hNMcdfTwSFZ8FHA4IX/N2bAKlEOTaqjbL
   A==;
X-CSE-ConnectionGUID: eahWwnAFTAeEjg4HEtouXA==
X-CSE-MsgGUID: 6s+tVmg1Q2KeMmaR8ex8tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="116198220"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="116198220"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:17:46 -0700
X-CSE-ConnectionGUID: c7UPVCiESLqxHGnmfdg0SA==
X-CSE-MsgGUID: HZklwC3/Qae4HYUIMKmM0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="271677477"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:17:38 -0700
Date: Tue, 22 Sep 2026 15:17:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wentao Liang <vulab@iscas.ac.cn>, Miaoqian Lin <linmq006@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pmdomain: imx: gpc: remove all initialized power domains
Message-ID: <arJx4P11hZAqxE0P@ashevche-desk.local>
References: <20260918031323.3376849-1-lgs201920130244@gmail.com>
 <aqzqvfbeh653jUce@ashevche-desk.local>
 <CANUHTR9ipEFUGteK4TTpnpN0yUmxjop1v783aOhyq6AE9cwO0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANUHTR9ipEFUGteK4TTpnpN0yUmxjop1v783aOhyq6AE9cwO0A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_051746_597362_B5E745B5 
X-CRM114-Status: GOOD (  10.62  )
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

On Tue, Sep 22, 2026 at 03:41:07PM +0800, Guangshuo Li wrote:
> On Fri, 18 Sept 2026 at 15:39, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Sep 18, 2026 at 11:13:22AM +0800, Guangshuo Li wrote:

> How about this:

...

> Does this look OK to you? If so, I'll send a v2.

Looks better, assuming it works as expected I am fine with it.

-- 
With Best Regards,
Andy Shevchenko



