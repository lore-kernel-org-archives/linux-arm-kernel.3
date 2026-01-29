Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EF3D6B084
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYWmXu0eHpzKLjd3XJMtUkun7UoOydO1WwcG2VZMoFA=; b=wjf8eytQX+g+A4QDFDK3Yw65eu
	WqZ2oTfjYoGEJXRECmocxpNmEoFhFUFYMNX1XqsjeLxXPvgtswAOGHst2wXyrJ1ZTMBQ+9TZjnTEG
	OdcvxqdzKla2mEgNqARoNQQ0lMzzEejiSZZbeLILVBbeYrB9XUIO0LSTk1EsS4rQTffSWeGI4vSpr
	spXNWRamdrd/uEh5txkNvjw5yjSC3d5wK2Ma3idKmuotGhngNUsQNzijdoXD4Q9PqFr6h0+SuK2pF
	GttwyKLGElN6kN2cPsTBXY7qmFKZ1fgyrHahRsa8iu8VOUSL/Omtdv4jo8OT2WPHev1rLn1tlyqso
	y8T0Ki3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUel-00000000KGI-3uea;
	Thu, 29 Jan 2026 16:14:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUej-00000000KFa-3Fuf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:14:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E041442B5;
	Thu, 29 Jan 2026 16:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A02C4CEF7;
	Thu, 29 Jan 2026 16:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769703245;
	bh=qPHPxNpWWMDsGxyMBTnvxI4E48w2EhAOUYqVNBC3rCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cz86Urx1igiIQvTFTGutmwPdZkymvZ6zyMF4hl10hrKUhIi08rZfeK0wzyh9huT5j
	 O02Ux4L1rjmNPwqTQcisZ0vIsEwN26pxyNS3f31UzLxlFYXIlIBewtJTNcMm5iBQ6f
	 Zi1IHkHBphI91FBI0Ckujkeq1FueMncKbQ5aESt9iOEn/XQNnmcQK7Zcf4lTvK7y8k
	 IOG23yFPUwhCHvx59ke9GuNCRXfgm19WA6RrRO5fiRbym9M9bAAL4lZKSvB8g6YhCV
	 51bW9CoQgHMhDLQ1UrtCNf5462F6QTiLRzK0N/eM2F01Y9h5wTpVtIRYXit5VPxdxp
	 3/9N3OYPx+LpQ==
Date: Thu, 29 Jan 2026 10:14:04 -0600
From: Rob Herring <robh@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Michal Simek <michal.simek@amd.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/7] dt-bindings: i2c: xiic: make clocks optional
Message-ID: <20260129161404.GA1118793-robh@kernel.org>
References: <20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai>
 <20260127-i2c-xiic-v6-1-e82e2f6f657c@nexthop.ai>
 <20260128-remarkable-airborne-chihuahua-a1a16c@quoll>
 <66c7435c-a936-413e-a016-c860d448c971@amd.com>
 <fc00f8cf-b566-4694-82fe-76010d2f7c78@lunn.ch>
 <aXog-KBw7Bp-VEC4@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXog-KBw7Bp-VEC4@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_081405_838779_40B29668 
X-CRM114-Status: GOOD (  27.33  )
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

On Wed, Jan 28, 2026 at 04:45:12PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 28, 2026 at 03:34:02PM +0100, Andrew Lunn wrote:
> > On Wed, Jan 28, 2026 at 12:21:41PM +0100, Michal Simek wrote:
> > > On 1/28/26 11:37, Krzysztof Kozlowski wrote:
> > > > On Tue, Jan 27, 2026 at 09:03:55PM +0000, Abdurrahman Hussain wrote:
> > > > > The xiic driver is designed to operate without explicit clock configuration
> > > > 
> > > > And if you change this in the driver, then you change bindings?
> > > > 
> > > > You miss here explanation based on hardware - how does the hardware work
> > > > if nothing ticks it clocks?
> > > 
> > > Hardware obviously have clock input which needs to be connected. Without it
> > > it won't work.
> > 
> > Should ACPI potential limitations be making the DT description less
> > accurate?
> > 
> > Would it not be better that the driver has an DT binding and an ACPI
> > binding? Where there are common properties, common functions can be
> > used to retrieve them. However, if ACPI lacks usable clocks, use the
> > of_ method to get the clock from DT, and skip it for ACPI.
> 
> Why should we use of_ methods? If this is required we can check the type of
> fwnode and act accordingly, but I think this should go deeper into some
> treewide available helpers, because now some drivers repeat the mantra.
> 
> But how do the driver get the clock frequency (if needed for some register
> settings and/or calculations)? DT seems to have well established property
> 'clock-frequency' for that. Can we consider it as "ACPI binding" as well?

Well established and somewhat deprecated. Generally, 'clocks' should be 
used instead. There are some exceptions like I2C buses here to set the 
bus frequency (or max freq). We probably should have used 
'bus-frequency' in this case, but that predates me.

ACPI can use whatever the ACPI binding maintainers want. If you know who 
they are, please let me know. :)

Rob

