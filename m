Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239DECCFA1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afGjVttI914lkamQzbwHFWQI/mW5NqG7gu6A5EIHDVY=; b=A0zp9gQBEgyrMaaBzCgYzNHQ9d
	75tGSiqCeryx29MyxuvM8GLsWDspxBDAp8KZdHHLvSVOG0+t8vCJMu7GdZV8FBF6ool4nWuKlLAXa
	+NLekdzU0P5zDmgKc8Ja+SiNUic7538zOP3/CMdkjag2Z5xYHsHz3ugO3PElRBrpVdsH0LrcFza5b
	cjCxLckbXPcuT1R6WRaw5rJQ4Roc+5pL+pQI7udiaFWnzKefROKftInogii3S8dBNjQI+/WtJnEq6
	EMrtDUprpyz/c/FngA4No7GiZKSV2bUYTT1qztgTOTtWci9Rw81ken8lqSXLLog+otHaQn3hZ0pKR
	K/3vGRgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIza-0000000H13p-2aLm;
	Fri, 07 Nov 2025 09:42:50 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIzY-0000000H13F-1UJw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762508568; x=1794044568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WJXOLztqSo4giTqFOw8G/lBkaE8BpltWb1JC16Iyvfc=;
  b=b1W3K4zjOXJUrVFks0odcScGM8Dape/G3yLyyNc06CzWStiNePvlDi36
   tSkwy0g5p4AC6xz4BOdHQssSYZlUUXSmH64psa2kaFgozADHbfz9lvkSV
   SwfMMBbkFZQiLDBx/8FP+LoUM4Mldf6F/DE4POAZD/B2szS7tineInY2i
   Bbe/jq8c/+RcQ/y8CF4ubTRrzFd131MwOqoY77+7NwCniZtndcl2e739d
   xjU3krZSReC4UmLE5pFQy6VkrRYxYyPk0DBQ26He8ecuj/TS3cLXx/1hN
   aSEXxxp9RofsLGbrzYtlv7fGigj1Nl2tuuG5mlTR8xYhhcNaL4RnCdvNm
   Q==;
X-CSE-ConnectionGUID: dlVkWNtOSw2/CJwO62T65Q==
X-CSE-MsgGUID: BjdRBT1MROSg2V77dVkFwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="63668031"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="63668031"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 01:42:47 -0800
X-CSE-ConnectionGUID: oCQK/vHQQpCJVDh93eyUgw==
X-CSE-MsgGUID: jz6q+Cp+QiGNuEuTne9Otg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="187253469"
Received: from vpanait-mobl.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.27])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 01:42:43 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vHIzQ-00000006QDe-05pD;
	Fri, 07 Nov 2025 11:42:40 +0200
Date: Fri, 7 Nov 2025 11:42:39 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v21 3/4] i2c: ast2600: Add controller driver for new
 register layout
Message-ID: <aQ2_D6vs4m1brNk0@smile.fi.intel.com>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
 <20251027061240.3427875-4-ryan_chen@aspeedtech.com>
 <f08b1078-fc8c-4834-984c-813e01291033@kernel.org>
 <TY2PPF5CB9A1BE64FEBCCCDC7631B355135F2C3A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY2PPF5CB9A1BE64FEBCCCDC7631B355135F2C3A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_014248_406524_137F9A5D 
X-CRM114-Status: GOOD (  10.80  )
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

On Fri, Nov 07, 2025 at 06:26:39AM +0000, Ryan Chen wrote:
> > On 27/10/2025 07:12, Ryan Chen wrote:

...

> Add new file i2c-aspeed-core.c to do legacy probe and i2c-ast2600 probe.
> 
> 	if (of_device_is_compatible(dev_of_node(dev), "aspeed,ast2600-i2c-bus") &&

	if (device_is_compatible(dev, "aspeed,ast2600-i2c-bus") &&

> 	    of_parse_phandle(dev_of_node(dev), "aspeed,global-regs", 0)) {

Not sure why do you need this. Isn't it as simple as

	    device_property_present(dev, "aspeed,global-regs", 0)) {

or something between these lines?

> 		ret = ast2600_i2c_probe(pdev);
> 	} else {
> 		ret = aspeed_i2c_probe(pdev);
> 	}

-- 
With Best Regards,
Andy Shevchenko



