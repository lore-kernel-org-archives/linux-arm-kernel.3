Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58D3606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 16:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rG6SjBK3;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F3qJl1k5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bvcmVD1sUQbK5xPKMU225rA7IaPtKD1enV8qr1Y7JII=; b=rG6SjBK3mxpqmodmvMJmX73cqL
	/1fh4Xzc8R2pC4drK9VFS8TUc0NzyDrKGe7eVxHnpeRwDd+6rLBO6A21G4gLLxLN/rTVki8DGKPZo
	3NuGdOC+moMZdAuDB62iY0+oj3Hd1wuiQs+f/nWNax3GYdLNujVTSlWnKzx25wpcuv7/haGFDqFjD
	KyhbOk9BVWt4hKmC7z/UdHKckQsiUNAPzzZZYvfRkfRTZWvcaX9oe2yA27AFeX1EXrUUnxfR7nFWn
	q1s9AiLGNt3QeBrgTEB3xhyI97f7g3suWMekp2uHMumJWEuUfMByYYPcPtwQC+qcJToGNZ/opiLI5
	IFLdIV9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvnD-0000000EVRv-3ZtH;
	Thu, 22 Oct 2026 16:37:27 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvnB-0000000EVRI-1KaK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 16:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792687046; x=1824223046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dHkUONcFRwNs8564YnpQ3UExvjh0fHy79c7uxbfPXd8=;
  b=F3qJl1k5tOWoPFtbbPREUo3S5SOO3jkSW0lngCRp7CyAkKPHOxSmFK6c
   MqDBF9uDVndrZAoAySS7K30Cd6kQ1jrV9Wy7+H1IB3q2PIjMfy9rfTU+a
   P/ijHAhvb2V1PTV3uZtkM8WHDIzyvOPwaNj2AgFlnmLrrBDXo8N3W6dL2
   3Yj8fJe2FI08ki6MQGqJe6bhfVB+OXCsFiqIjDp5GVoWv4AMQjnuzDzXR
   qR9IEFXvqYN5ONTub0HpTGuaCvz4MpNb76lBRT/jORHDBtwdhwsnz52HH
   Y5u6IyFlnsYRqfYFSp8HtJhSwwHrAU8mFS7ka2wHOHkKfi3G0PiPKFQHm
   Q==;
X-CSE-ConnectionGUID: iKaFFZZ5ShCt9r63HE4GBg==
X-CSE-MsgGUID: Vh8nY5CjRoG2vwtQn7KXcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1316256"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1316256"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 09:37:25 -0700
X-CSE-ConnectionGUID: DkuPoQevQxyACK2df7JvCg==
X-CSE-MsgGUID: wmqnUGbpSpeqzOE2k91fdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3351086"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 09:37:21 -0700
Date: Thu, 22 Oct 2026 19:37:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Arnav Kapoor <kapoorarnav43@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: fsl-imx25-gcq: check the return value of the
Message-ID: <ato7vgweOlpMA9eE@ashevche-desk.local>
References: <20261021225450.628499-1-kapoorarnav43@gmail.com>
 <atoyD5GpW-4uWKjq@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atoyD5GpW-4uWKjq@SMW015318>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_093725_390888_A7CC5CBB 
X-CRM114-Status: GOOD (  11.29  )
X-Spam-Score: -4.7 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 10:55:59AM -0500, Frank Li wrote:
> On Thu, Oct 22, 2026 at 04:24:45AM +0530, Arnav Kapoor wrote:

> > The driver ignores the return value of all the regmap accesses. If one
> > of them fails, e.g. because the memory mapped registers can't be
> > accessed, the driver just continues with an undefined state.
> 
> MMIO never return failure. if write register fail at irq, it will cause
> irq storm.

Strictly speaking it may lead to some CPU exceptions in some cases, but that's
different level of failures and not related to the error codes from regmap IO
accessors.

-- 
With Best Regards,
Andy Shevchenko



