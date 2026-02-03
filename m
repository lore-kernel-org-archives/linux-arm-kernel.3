Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493FEE87855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIMe2Ioc9UGdW9LCRhcDlXsMqIA76N7uk6YtpDu6XO0=; b=tDQC7BC4D0V3Qk5Ia2HlS1/qc8
	51LNsgJr3FtcEO79xMqBwYUVUhSl7g5l2a/OXDmW4dJreF+WQ5sPR4PELP1s26MHHxccF5tMF6JpL
	F2yBylRYUvSwC/4mXvDiEiPmswmaX5KYLzY09REnr7l6Vniv1xAIVc938p5z/qG9dYfhdcNO1a9AL
	LasXmajd/mmKX4r0yuccDY0e6nwv00FvT0OLawGfyCgUb/4DyiyzNEjERJTs3T1BYaR7yqGBI8U5H
	j/1UzKAFs3Xaq/Fzbt67i8uCvIxvzDqtcEE1fdKARIZPHb69EmYMKwBdwEfzA7JzB6b8pHxAi513V
	nz0B0J0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLBU-000000079fl-3ut1;
	Tue, 03 Feb 2026 18:31:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLBT-000000079fE-03d5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 18:31:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=QIMe2Ioc9UGdW9LCRhcDlXsMqIA76N7uk6YtpDu6XO0=; b=Dg
	0zxwihO5hnaB22iXug5cUAwg3shTmwFRLbRfMmwskVoSrDLpX/62Mu0U9pjy5OAhK0igJF/5iO+O5
	rIHb4qtD4pQUQkG+QX5zPdpxsdVgZaFLBuBzZEndCfxunRz9REjuQi+Y9NAT3oi915SzENQLVz0pQ
	JgdgHHUDD/ZU6fw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vnLBI-005z49-Pg; Tue, 03 Feb 2026 19:31:20 +0100
Date: Tue, 3 Feb 2026 19:31:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 6/7] i2c: xiic: use numbered adapter registration
Message-ID: <1ac7be34-22b1-4d93-9957-fc7ade9a2649@lunn.ch>
References: <20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai>
 <20260202-i2c-xiic-v9-6-ce4695f5267d@nexthop.ai>
 <aYIYBheQgIN71os8@smile.fi.intel.com>
 <2F830E87-F00A-4A54-A5CC-E59BD2C5C7B2@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2F830E87-F00A-4A54-A5CC-E59BD2C5C7B2@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_103131_180315_9D1F47B1 
X-CRM114-Status: GOOD (  15.01  )
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

On Tue, Feb 03, 2026 at 10:14:49AM -0800, Abdurrahman Hussain wrote:
> 
> 
> > On Feb 3, 2026, at 7:45 AM, Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > 
> > On Mon, Feb 02, 2026 at 08:37:23PM +0000, Abdurrahman Hussain via B4 Relay wrote:
> > 
> >> Use i2c_add_numbered_adapter() to allow platform devices to specify
> >> fixed bus numbers when needed.
> > 
> > Not sure about this. Doesn't it break the current approach? Please, double
> > check that.
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> > 
> > 
> 
> If pdev->id is PLATFORM_DEVID_NONE(-1) then i2c_add_numbered_adapter()
> falls back to dynamic allocation and calls i2c_add_adapter().
> 
> Many existing i2c drivers use the same approach, see i2c-pxa.c and
> i2c-pnx.c etc.

It is not about if other drivers do this. Its about does this change
the behaviour of this driver, so that I2C busses get different IDs
then before, and so cause regressions?

You need to explain in the commit message why you think this is safe.

    Andrew

