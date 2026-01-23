Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50FDD778AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHQm9bnj1/GWAjCCnA6ZzBSntz/5N/YkgHq/jkLFlJY=; b=zYjz7+3glae5GGjKmOyYPwhUyZ
	nIm2d48uzpp6htwr2D0eei5J29ZN7a0y+QOsz37taqdSmeog/sMuSFLWjzwadyGTk3qtwuDbHD6Vo
	uyvFD3sf0LJHihd/rZEkITKPPemwslD26OnmeOmldpsQNd89fNt0qe3yo87MtrxwS6WJDZ7GtpEH9
	U8WPbcg2UROMVSA+b3N5oHj63KmCdDXWQF2VMYGHr9jGzsq36N32h0yvqWKDoopiyFPywJ22CEsgS
	pidIlnGR1G7N3uyvGIGgI74msdit1mP4VxdGnOwjEO6AMvq+jIDRQfrx6VOKawIDhMi4I5oYwrYda
	zS8LbVKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMhg-00000009P7W-1bCv;
	Fri, 23 Jan 2026 19:20:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMhe-00000009P6r-1jmi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 19:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xHQm9bnj1/GWAjCCnA6ZzBSntz/5N/YkgHq/jkLFlJY=; b=ezQCvFrBQAwEGfeDquY1GLsHj1
	VnX8WQIMn6wAdU/CCFhND+hibxrqTszjnCygPfseBKvrt+OQHdPKDODF/PA7mT1abxDoO3+lTaaHO
	Tc/8YO+3bjoHQMNfAHwD00yU6fHWrwy0oJDM8iRWv83PpH1gdzunpG7fV+9qsw60n//Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vjMhS-004J3v-Gm; Fri, 23 Jan 2026 20:20:06 +0100
Date: Fri, 23 Jan 2026 20:20:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] i2c: xiic: make the clock optional
Message-ID: <df9e1a39-3928-491a-920f-fd45120d8024@lunn.ch>
References: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
 <20260123-i2c-xiic-v3-1-eb7cd4254dfb@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-i2c-xiic-v3-1-eb7cd4254dfb@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_112018_454468_C0E00C56 
X-CRM114-Status: GOOD (  10.57  )
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

On Fri, Jan 23, 2026 at 08:02:44AM +0000, Abdurrahman Hussain via B4 Relay wrote:
> From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> 
> The xiic driver is designed to operate without explicit clock configuration
> when clocks are not specified in the firmware. This functionality is
> already implemented in xiic_setclk(), which performs an early return when
> either i2c_clk or input_clk are zero:
> 
> This condition is satisfied when clocks are missing, as clk_get_rate(NULL)
> returns zero, allowing the driver to rely on hardware-configured timing.

https://elixir.bootlin.com/linux/v6.18.6/source/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml#L42

The binding indicates the clock is required. You need to update the
binding to match the code.

	Andrew

