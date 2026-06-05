Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22772CD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 18:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioOexlgIAwcyFsa0piqZdNARQhBCmk6ySxz8VyvegZo=; b=Bl0saQt6HtjKL2yQgSDbVaeEHT
	zKAxUO7ninmPGS6CvSAqsyaA24SRPemVTQ8Wkn2Pkz61PKGPNQmoBD+YvpdK2nykRtCDUi3hI1aXW
	RVHobLqxZ9mLqCS/8GD+oMdFoOcTew1a+RZB5tXOLFLILZcv2P61p5zpUvuC/tl8nqoe7bdkz90dM
	06F5LcFrgqVeXC+kxBRkNckeeOD3dwiWggvoxGuLntGMsBPBw/H/gE4B9Rg4JE0LjixP/rsaWpEBn
	JvvZEJsnx/5n24+tM2Qsq801Sk8C93/fP6V5OCECU7ByI1xqw91HQ5lS3Tr8sN4hNbw+3OWsn+SUG
	qvtGvcZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVZ66-000000011qx-3A2C;
	Fri, 05 Jun 2026 18:16:46 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVZ64-000000011qX-0UET
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 18:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780683404; x=1812219404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Czu7M7stp84IueL4PgpIZQSP3xMQW5xUrpR55Dpa0hM=;
  b=J2ujLPrnTAFdSSi3ftxnUKs8DsoBaIKLVeA5q3M9PZsqjJfy5qNCxjQp
   LnnNgFZs5Nr/YOkGVseV40TQmRjFSf6cWL0EMByddQty9BV3wB3cGihmI
   NltPLkyw4tepkwXjc76UUTPkQxmJVLHYy3+2DlF6/6KRy36nK0qYmsER/
   /DRL9ULaaK6qHJxm1T+vky0r1U/6Sx12d0spxTX2RmpXuRL0cqJ2YILwF
   px0XNoMm3VFFgARcy4EyMc+xg2oC+1L85t/PxH09KJcC/yRXscJNoD5xx
   H8xeGcLCcBUdRZKMnxncfpTQ/+TYnZz2RKmcMFHy+wdxc8EPrht6b5LyW
   w==;
X-CSE-ConnectionGUID: +/P4Q5s/T4GAUD9SvszfhQ==
X-CSE-MsgGUID: JfAyk+wuSXG3mgoLTFMgIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="104183170"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="104183170"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 11:16:43 -0700
X-CSE-ConnectionGUID: +UtgzMglSRypY9K2M6LwNw==
X-CSE-MsgGUID: F5ESppPXSWG8lsSCPSFTag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="241928990"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.178])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 11:16:39 -0700
Date: Fri, 5 Jun 2026 21:16:37 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Subject: [PATCH 0/3] iio: adc: Add Axiado SARADC
 driver
Message-ID: <aiMShZhp7iUL9n4_@ashevche-desk.local>
References: <20260528-axiado-ax3000-ax3005-saradc-v1-0-345dd5f6608a@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-axiado-ax3000-ax3005-saradc-v1-0-345dd5f6608a@axiado.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_111644_200336_C901D778 
X-CRM114-Status: GOOD (  12.94  )
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

On Thu, May 28, 2026 at 01:10:22AM -0700, Petar Stepanovic wrote:
> This series adds support for the SAR ADC controller found on Axiado
> AX3000 and AX3005 SoCs.
> 
> The controller is a 10-bit ADC. AX3000 has sixteen input channels and
> AX3005 has eight input channels. The driver uses SoC match data to
> select the number of available channels for each compatible.
> 
> The driver supports single-shot voltage reads through the IIO subsystem
> and uses the reference voltage regulator for scale calculation.

When submit a new driver always answer these two questions:
- why do we even need a new brand driver? (No existing that can be extended?)
- where can we get a datasheet? (URL? Other means?)

-- 
With Best Regards,
Andy Shevchenko



