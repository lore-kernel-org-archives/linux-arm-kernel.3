Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90EECD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 18:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1PcHSGBvgZW5P2F6dMBtrMfykPfq32b8uGkfymAHYk=; b=L+KrUUvd73YD11SA96ChxFBSXF
	IK5UpRNPxEcddbvXb72ZV0ob+xqWJiTfFR6xtX6g37ecZR4CPaWRvlPC2lePsOdfZptlo8Wom1L78
	bmOXvKYIvniMMY2FJ5elst2wX03EqQQ2WB3cLNZoCzWNzqWh5Tp6POsBQ1oDufOyd+bPdeifMDkGT
	b/rfIgeojhEffl3nmf8ewpQ7Or8m5HnsGTettJ6MBMfeaENq1JzWT7jSh9CSp7JJPpHr0seBIhgy9
	qZ+n39wxz3e1z3dPl2eWnX4NyiSQq1NmDdkCoUz8ncYdLlx0OorGB7rvx0mrDN3GTS0KKmoNHJBdm
	RXonBBSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDyo-00000003QyW-3OKY;
	Wed, 13 May 2026 18:06:46 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDym-00000003QyC-1FmN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 18:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778695604; x=1810231604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZBx/OcXX1kCL7sU4jKs+HFRKwNh+FG9VZnZXCN50i2Q=;
  b=Z+FKnQEQQ9O1U95GwKW6Fs1PtsGXnq6M5gRw0uiS9i6DSolf4j7CCEAg
   cIcEWiIVf/Q2pQz1kuT8gXs9JpF6B7ymasJW4IANcZFIvxm8EwKSELYU4
   9FVMQTbEL9tS8sVweGEry6Qm8FhGUqH8FGZKSId5bBCOyS7f3XbB7Z26/
   cM9SPpCRWPysBr95r88i57c/ZGOuMNEioJi79D9f/Q/VVnagHzSiCZYQU
   W6kNM9nIBoqLEAf86/bOLi0A7va2a5gddocWyLB2QkbdzKcazOG4Brcpj
   h56VK4we9BlojSMfKisa9Fe52BaUm1/YnpSZjkiDYlSdIoZeklc3CZh7t
   A==;
X-CSE-ConnectionGUID: VaOJU8DlTmyu7RUaVlagKA==
X-CSE-MsgGUID: JRYNgt0LT2yS/mZPX1Nj8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="67162824"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="67162824"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 11:06:43 -0700
X-CSE-ConnectionGUID: 9sRVOiwXRlWuIgJYFKtNwQ==
X-CSE-MsgGUID: 3KoQB6heSr2BoG8A6UjFMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="243130244"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 11:06:38 -0700
Date: Wed, 13 May 2026 21:06:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Alex Tran <alex.tran@oss.qualcomm.com>
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
Subject: Re: [PATCH v2 5/5] pinctrl: pinctrl-scmi: Log number of pins,
 groups, functions
Message-ID: <agS9rD_EUTv2pyjQ@ashevche-desk.local>
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
 <20260513-scmi-client-probe-log-v2-5-36607e9dd540@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-scmi-client-probe-log-v2-5-36607e9dd540@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_110644_348750_90448C6F 
X-CRM114-Status: UNSURE (   8.52  )
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

On Wed, May 13, 2026 at 10:16:58AM -0700, Alex Tran wrote:
> The SCMI pinctrl driver does not currently log the number of pins,
> groups, and functions discovered from firmware. This information is
> useful for confirming the firmware exposed pinctrl resources during
> debugging.
> 
> Log these counts after a successful probe to align with the existing
> SCMI client driver logging pattern.

NAK. Even for debug level. This can be easily derived from debugfs.

-- 
With Best Regards,
Andy Shevchenko



