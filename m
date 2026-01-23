Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831CAD778AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfdAr6yiQHzT/EvQk5HAzn01nEaiq1Hdxokp7g8SKi4=; b=fayek3q5h5It3jdkSHlRvR8LCr
	H4tjWsX4xj6R1WG2AaRzAdvlXDVCnOQMBFm67mqsrnkVmmdteVDYeT6+GU3z86lwP5g32Kec9VKyA
	oKnMqK9CfvIfFZ/ZKtzUfNxDNBUivgctNt/1twtddUG34BceeK1yJfRo3QYZytJKkTBJfx8rYG948
	n+/NlLxv/k5jfhtHXlp7P0vqJhpzN/LpZ672DAgLDRSXyF63X5NSuRuJRaj3RjWdqtPze0ouc73fE
	EJmjfZ2/2RsEhsaZyuoLK67GzrY31VANiHmwEXz0wBMymnUX0RuvU9Uiu7qJF/ERM2vSmwAvA5Ti5
	Cu1pypYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMkA-00000009PVV-3a2e;
	Fri, 23 Jan 2026 19:22:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMk2-00000009POh-2hF0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 19:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vfdAr6yiQHzT/EvQk5HAzn01nEaiq1Hdxokp7g8SKi4=; b=MXxG5OYTPAyb0MSLh6PnTi/iE0
	s/kfOiHMNI9zKzvXFHWpLQdcYmebVWcq3salrptoxTXZW5td2+th+8qnqJDB33QPboR9antKCW8Uv
	hy+p7i6aZKozpDy3u8ryqyqBTl1pCtgbEA2VClck671Cow9HpsmwW5ahYx6jEHc6OCPE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vjMjv-004J6B-20; Fri, 23 Jan 2026 20:22:39 +0100
Date: Fri, 23 Jan 2026 20:22:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] i2c: xiic: switch to managed version of mutex_init
Message-ID: <efe4e155-e307-481f-8332-783cca8a098a@lunn.ch>
References: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
 <20260123-i2c-xiic-v3-2-eb7cd4254dfb@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-i2c-xiic-v3-2-eb7cd4254dfb@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_112246_679024_F42194E1 
X-CRM114-Status: UNSURE (   7.05  )
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

On Fri, Jan 23, 2026 at 08:02:45AM +0000, Abdurrahman Hussain via B4 Relay wrote:
> From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> 
> Simplify the error path by switching to a managed version of mutex_init.

How does this simplify the error path? You don't remove anything from
the error path.

    Andrew

