Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4016BD358CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SrDZWzjNouMaqzYfX1jKs98jvPndIlYNWtZWMBYrSI=; b=SD1v+dHas9k8cclC0oximaOZwR
	zNEEpOuH4dO3t0QZnXumuDGOfsvcdcSH1Moqo4TN7LQH/URxiikwMGG0xsy0Bqi4iKs2W9MMvDvOJ
	uM7zoI9kZ1+6wyNGuQAd6zyU2aqmI8MdVwwSwCBGfbME58M0cwjcPtEVUpyMGRpzX1rCoYMHms6Z/
	7AxsTI60dMy0oSUtTpA+t2Vm1Wts9gK1pV3NyNj+mbXmDVCveFtoHWt2dr6oEpFmmWJZs9fFT/upb
	ZSkYjT9QJ4bBCwZh4YmJNTLmFLKeb316ZJ/VXRXuIo6PZpyiHb9ZOBX8/1X07V7T5gPC3eeyuRS9n
	SdH8fRsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlMls-0000000HPLr-3xnl;
	Thu, 29 Jan 2026 07:48:56 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlMlq-0000000HPL8-01YZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 07:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769672934; x=1801208934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N1n5iH1I6H9Z6SqaMYFKHSqa1YgvE2UHyKlj1De/3+8=;
  b=cVSBYgvlVd8kIgPmYYX3mqNT//Hb6iblG9/IZ6wvgZBRWKZ1vsfHg4R6
   DOGQ/OZ55L8d/N7yCFaDLcxARGkR0A405QNLjLaln/JPiCXY5HAO1U8qh
   NkJ7HEPAA3BwnkL0ErNI469e1Y8sqxmckOk3cxZjjFVpIzzNDBez66Gjz
   z/Ph4dOhgrdZQoNbjI6PEF+4PbTfp23NT2U+/X5nqcuEJDH5FaMEantC8
   Obh2bPoN/fd6eSWYcnxa89x7xqUNJWSNAvfJLM/TzATDq1V87oTOYKRDR
   yXeLoFLpeKIkvR1mdAOqKsVtEKbSHmfmo7fnLlJXU8GWVxl8xVP8wmPpQ
   g==;
X-CSE-ConnectionGUID: zll8abfyRQqwx0r4XyXTpA==
X-CSE-MsgGUID: cPfOgNrpTmSx/Y6kNfvGWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74750589"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="74750589"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 23:48:50 -0800
X-CSE-ConnectionGUID: b7B3yOV4Rp2UQUZP3/Rmtg==
X-CSE-MsgGUID: 6hfgPNoAS0Oh9LMT4NoAyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208396371"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.105])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 23:48:45 -0800
Date: Thu, 29 Jan 2026 09:48:43 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, BMC-SW <BMC-SW@aspeedtech.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v24 3/4] i2c: ast2600: Add controller driver for new
 register layout
Message-ID: <aXsQ2xgao5PPqnk6@smile.fi.intel.com>
References: <20251118014034.820988-1-ryan_chen@aspeedtech.com>
 <20251118014034.820988-4-ryan_chen@aspeedtech.com>
 <6b99a6ea267fd0f75d4c366293fe6887cc038b7e.camel@codeconstruct.com.au>
 <TY2PPF5CB9A1BE6E6353CEB66FFD0E498C1F29EA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY2PPF5CB9A1BE6E6353CEB66FFD0E498C1F29EA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_234854_121048_7D8813BB 
X-CRM114-Status: UNSURE (   7.21  )
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

On Thu, Jan 29, 2026 at 02:08:00AM +0000, Ryan Chen wrote:

...

> Will add in i2c-aspeed.c aspeed_i2c_probe_bus
> 
> 	if (of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2600-i2c-bus") &&

Just device_is_compatible(...) instead of OF-centric APIs.

> 	    device_property_present(&pdev->dev, "aspeed,global-regs"))
> 		return -ENODEV;

-- 
With Best Regards,
Andy Shevchenko



