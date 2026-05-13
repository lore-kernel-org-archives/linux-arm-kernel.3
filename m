Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E91CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 18:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2nT4LAaMYDrmMArQ6I70Mfy0vDRfjR4UrTSTpxOnBw=; b=utEucHamyFP4pr/WFHeSzSDM9C
	Sn7W510d9x2YSX/nLLCqddWc7nl/H8on4nEJ1xs2LdZyA9wpsnWyklCA/eFk4gU3CkQVcPMuCGYmJ
	tN4IhRf7adpwv/Vl5SpV4F3Bo4Y6JlU4qGeGGN9aVdG/8i5XwOS7lWsAtP5Bjdne8EnmM01FpM3VB
	bOkpp4n/iKwIMjnuvnhlmNQ2+TcniXyEpVt5pDrJ3NUB5TzYNMKY5UJ8QisHKgQgUKM2d/c2d+pW0
	m/+dOl9MG+9h7WA7BAGf0WOjG8cGxOuRXTBGrRS/tI9hgP3KzmfsGHhAIQ+FKwJ6TXo5M4EwAUBg4
	i1UmwYKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDwq-00000003QYJ-0VYr;
	Wed, 13 May 2026 18:04:44 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDwn-00000003QDN-37uu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 18:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778695482; x=1810231482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aHZIz4hYTuSjsATQj/AJOW5Udmy+w4c+hHTnvk8Qu4E=;
  b=LTC9YcyoilI5avhIkFSFFKihTQh56vO3zIgfPDaKj8zwpwWE/qkjMbYd
   e+4dfy7IFdfhb/Kt/kWmMXU2ioW03hoTmmqbLjjLuFnoEs2X5uDHQdzvX
   paa1aC1OEbHt4tOyzbb+6HKLkPIoZSYkVz5cFN7ftHXWpC0Qqjr531Oua
   AXXK5O2h9R3FfvFTLaM0uw726oMzvMbWGg4DMfTPHEec+K0rbNv6Iu9S4
   pO2I04OBiph6A4qbhtdhWLp6rtO6iZwTccBkQaWbejA2BGwF1IeiReCnU
   Nmmhc1LW7UWEIswkhpKaTqo8zwYC8kGcgUZIRoJo+vjVG+WV2Cn/UQPYN
   g==;
X-CSE-ConnectionGUID: 4qijKzOMTiidzZNg4lfW9Q==
X-CSE-MsgGUID: QEbSR8zyRCyxu/vIGrNG7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="97201735"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="97201735"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 11:02:41 -0700
X-CSE-ConnectionGUID: uHI03tMxSxWaY8esQUwn2A==
X-CSE-MsgGUID: 4yUmGZg3Ra+2Wl66l+e5ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="268488853"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 11:02:36 -0700
Date: Wed, 13 May 2026 21:02:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Alex Tran <alex.tran@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 0/5] scmi: Log client subsystem entity counts
Message-ID: <agS8udcvqgQmiqB4@ashevche-desk.local>
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_110441_831082_3DE81E60 
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

+Greg (I believe the trend is to drop such messages and not add them [back]?)

On Wed, May 13, 2026 at 09:44:18AM -0700, Alex Tran wrote:
> SCMI client drivers do not consistently log the number of supported
> entities discovered from firmware. This information is useful during
> debugging because it shows which domains or resources were exposed by
> firmware during probe.
> 
> Add logging of the number of supported entities to the SCMI cpufreq,
> pinctrl, reset, hwmon, and powercap client drivers after a successful
> probe. This aligns these drivers with the existing logging in the SCMI
> power and performance domain drivers.

-- 
With Best Regards,
Andy Shevchenko



