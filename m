Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72928D73EA0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 22:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKLZ0w1FYI1K7rdVU/IfNX2bi5AgxvocffDhnuwufoI=; b=j+gFT1To0KAS1jH0PTJtTkX8F/
	J0o3HQ56AiZvwVKUKNbMdISoxfQpUtaQO2c+TORL516PZNkEwsmmwOVCx1Ys7VnR91zeu6+gYcgIj
	zKp4iDNz+gkrQKEWVno2IcoP2yoKp75wyXlRD2ZUxx3ksYCaQCQpgIY2mVJNUn+gL8EWODLzw0HdR
	LivWMwnnu9/ggSxSb9OtEwgGJVygSfupmNKJDd+vnf7Tgq4xQ7gg5PBNEDpZ9t7csPVqtYk+Td6GH
	v1YNg8OK8GoaFNWz5JknDBDVJTcOcUhyoU2yv3mGvsI5FOq5QQrnrssPeFf4NdRr/WdExFdWmC972
	mueINgpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlajz-00000000kvb-0e5I;
	Thu, 29 Jan 2026 22:43:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlajw-00000000kvH-2Qbq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 22:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bKLZ0w1FYI1K7rdVU/IfNX2bi5AgxvocffDhnuwufoI=; b=pDvDIRUhZ5TcZe8c5n49cAeQLG
	n2RwXdk7oHFTFP/nuAX1xKQHRO0B+X4XgirvMmfVSHvpQXxBZHTy6BXpNENXs4tYfEVRXEAYtQ9GH
	Y/+8VQGM503gqGdi/INyMYRdJGGsgzhkC9+SZ3kXdtA/eO8dCKTqH2GQbqo0nAbFF3+A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vlajp-005PxL-Oa; Thu, 29 Jan 2026 23:43:45 +0100
Date: Thu, 29 Jan 2026 23:43:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/6] i2c: xiic: skip input clock setup on non-OF
 systems
Message-ID: <ab9dc191-59c1-40a9-bbf1-e6c082af128a@lunn.ch>
References: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
 <20260129-i2c-xiic-v7-1-727e434897ef@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129-i2c-xiic-v7-1-727e434897ef@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_144352_620890_18888A08 
X-CRM114-Status: UNSURE (   7.83  )
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

On Thu, Jan 29, 2026 at 09:43:13PM +0000, Abdurrahman Hussain via B4 Relay wrote:
> From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> 
> The xiic driver supports operation without explicit clock configuration
> when clocks cannot be specified via firmware, such as on ACPI-based
> systems.

Are you saying it is technically impossible to specify a clock in
ACPI?

Maybe a more accurate would be:

The xiic driver supports operation without explicit clock
configuration when the clocks are not specified via firmware, such as
when the ACPI tables are missing the description of the clocks.

	Andrew

