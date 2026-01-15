Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9168DD3CC9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 08:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=761qAaK7V7rfrhybCC+w6WFHIytheAosUTTvMDH0Sig=; b=18l+qTkxiN4xFJ8IU0cCvQTBf8
	haNjOvc+Fxb09w0bIJljGY0c3jLQonfrZYLRcBVR0RMlIlh0/CGiuzbMrC4I/qWbjx8MkLtH970Wt
	EgGLT54pPK8ogjvoEgZOkPH88jJ0/Y8LBm1KdsaiQFMI3DhH6mXdVBzBqSFNaQdHO/kkyqMnnTY7U
	1j6dV6megwgpaGYt5sSq3IQMC4OF+ChFxsTcQe3/cbd4k/WzHh63dmsJfWVg51WH1h1FR6XwFjt72
	fq5Rug7ghjzak+TYRUpU4g40DmDWhdZBZpbtwShEO0uIUF62lLqfh0kZiUvZz8m/tl8ws7TnWVf72
	PJ3e53ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIPa-0000000ByR9-30AJ;
	Thu, 15 Jan 2026 08:08:58 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIPY-0000000ByQm-0yvL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 08:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768464536; x=1800000536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4J1FcG4dxmkP5PoBZ0hZyfoKYhf61kzQ7mIPLm/KVhs=;
  b=RzFuYWF8QtUge0Up0yPTwQSti8Ath7Th6xStPoaPCeZCruqp2p+tgdED
   t2ubuJZqUthe9ag+UiOJPNYhMsnuI8sOmsq+0tQCPJNx8nxAjJtOh0IzX
   5yvroxawsui3gjrpvXxIBLwu28flW+i768L3GGg52oym/zzexenna3THl
   YijgIDSdJH2nEb7lWRQ3IbcvhB0dH+pHFIl1gqS7LkeXOlCtU37ISyLkU
   7Ml1V+ojnZz3ijG1RJ/pUpw68NbDiBbofPNr8uD8/OdAKgnDopPdSxZ3g
   NLw5dCtexyg6+IlyOpU7rqsZwU6kl462DGQ0ls9jFtpXOctKqcB0LMnAv
   w==;
X-CSE-ConnectionGUID: PN9guOQRSQOj5yFOxej7OQ==
X-CSE-MsgGUID: iSwg4+pnQlyheUyTRiySqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92437288"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="92437288"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 00:08:55 -0800
X-CSE-ConnectionGUID: J6vCKZaCRcK0EcN3RPBO2g==
X-CSE-MsgGUID: hlrtToK9QmO45010/8J97Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204103732"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.216])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 00:08:50 -0800
Date: Thu, 15 Jan 2026 10:08:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Sherry Sun <sherry.sun@nxp.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, hongxing.zhu@nxp.com, frank.li@nxp.com,
	l.stach@pengutronix.de, lpieralisi@kernel.org,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] fsl,imx6q-pcie: Remove the deprecated
 "reset-gpio-active-high" property
Message-ID: <aWigj011i0pGgTRi@smile.fi.intel.com>
References: <20260115071816.115798-1-sherry.sun@nxp.com>
 <20260115073418.GA4366@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115073418.GA4366@francesco-nb>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_000856_323259_1E5EBC98 
X-CRM114-Status: GOOD (  12.67  )
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

On Thu, Jan 15, 2026 at 08:34:18AM +0100, Francesco Dolcini wrote:
> On Thu, Jan 15, 2026 at 03:18:13PM +0800, Sherry Sun wrote:

...

> And , the property is still handled, see commit b8b80348c57b
> ("gpiolib: of: add polarity quirk for Freescale PCIe controller"), the
> DT compatibility was not broken as you seem to imply in this series.

This is a quirk and not a 1st class support. There must be no such property
in new DTs, it's only present for the backward compatibility.

For the old ones, indeed the property is needed. The problem of reuse of Linux
DTs somewhere else is orthogonal to the Linux kernel. If this is a real problem
the DTs should have been maintained outside of Linux kernel and, if needed, be
synchronised from time to time.

TL;DR: we must discourage people to use deprecated and (historically) wrong
properties.

-- 
With Best Regards,
Andy Shevchenko



