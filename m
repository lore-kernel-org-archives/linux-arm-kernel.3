Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF66CCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1gUzBC1ARlSvBwQvEBNEn0E8UVlfynnMcLaRNra0OY=; b=nBJsyugqGRxju7V36jOByCVYQN
	OW0ah8igwl4ptFYFPvotxGIgDTwXcPFNAeuB30nWNMlCreA2p6lbVHAFzly+2IX1jzpSj9lU1zqjx
	H4uk/SuMz9uacW1B65AzXt5ZyJrEcqEhE3DW6wMjVEoT7+nAWuMuvMl54AwENn5YvgmS20Z7OJIvx
	mBwzCC1xaLdDXKnUmzDlHzhDFuF3oVCP2TZGFj03okL2ydAtt7l0KY8dHQtPTom3K4ff/NiKFgqsV
	fFOwFnKWrmssaFFPXPLgIT+WDWnWU1GHsI5e7S7j+1q8xYTFIZB4pk5KRSS50PpKXP0hgStn46SHk
	FeU4tkOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOs6z-0000000EX5X-3rNp;
	Mon, 18 May 2026 07:10:01 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOs6x-0000000EX4T-34OM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 07:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779088199; x=1810624199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WR9oCIPIzojPSo64gRHZlaaIuIGSxs3/FGy0IJZb8Xg=;
  b=R4aC2thbOIxGNcOG1L+ayGFJHSXEf1X8EhshyPYNEMdrt5tnYK7rHx/T
   KBDbw0CettlrpRcZpIoZ5sEvCoHa6NDx8utAQG/4Gcq8shY7NhdPCsnj8
   P7ocspWG6IyfodKsfnd0U18uTgMpqYqCGLCUtRPqI/gY5X5wHvo5BFNuF
   qY0QiPvlj5r8Zxwd2XhnyD1xJ40HCRcS4WrNdDVpp+QlOwJNUNLtWVjtq
   T5NoFz8qFDdwE+Ha2/J4GJqNGgTwDg9k6k3d1qBhcW/85WOMhblvVB3Ls
   fFUeRALvdSFK7EzqrfF0rFUVbSbK7xiI88oQpqf9E2cSEzvQV+/EEz5f1
   Q==;
X-CSE-ConnectionGUID: ofSMfhI1S0eHXNR/YZO7MQ==
X-CSE-MsgGUID: OqncguRDTeGaPAzX5fVSeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="67462364"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="67462364"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:09:55 -0700
X-CSE-ConnectionGUID: WGMBSQXVQDaI/vj2+b6cVQ==
X-CSE-MsgGUID: fPi187sZTs+h8vWOE6IMeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="277443483"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:09:51 -0700
Date: Mon, 18 May 2026 10:09:48 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 0/8] iio: timestamp declaration cleanup
Message-ID: <agq7PPw0qupI_8Dh@ashevche-desk.local>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_000959_781619_58538DA6 
X-CRM114-Status: GOOD (  17.06  )
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

On Sun, May 17, 2026 at 01:17:17PM -0500, David Lechner wrote:
> While looking around the code, I noticed that there are a lot of places
> were we are manually filling all of the fields of an IIO timestamp.
> 
> This is error-prone (as seen in the first patch) and more verbose than
> it needs to be.
> 
> I went with the approach of using the existing IIO_CHAN_SOFT_TIMESTAMP()
> macro for doing a struct assignment. This does require a cast, which

No, it's *not* a cast. It's a compound literal. And instead of doing this in
every driver, add it to the macro (in a separate patch). Oh, let me just cook
it for you (I added that to several cases in the past).

> makes it a bit more verbose, but we were already doing that in to
> drivers, so I went with it anyway.

> If we want to consider alternatives, we could make a iio helper function
> or macro like the first and second patches did.

-- 
With Best Regards,
Andy Shevchenko



