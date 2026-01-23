Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9EBD778B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 21:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDCZQ5Bx2m/hozseby+L8V6oMcAYkBTg1dTRmAtNL6w=; b=oQOlmfJJ3Gu4A/z8tUOWIZoWwS
	bjsD7XiJE0Weo6fqqAJN+G/XVyvRSLfvGV7HWIpMfAQGr7ozDupHTWs/dRJoAp3fjwwSQ5DpljoWM
	w6R6P26NLojGwSnTpGH5U76Y1w31ufNpLsUzFbyQ0hhAwqu8QGJNaiwIaRbPPZo/+sLIrNnVJ62x0
	5nbJhMVTSOeETzc5JNLV+iKAT+G8A5lf6UdoxCUM7vVatJbaw6Qc16PMBYsueNVqwKaphDUrKqnQf
	UnpI8g7IpAwBhMW9/xyIqkxPzWvnSPA6BSUpCgp7yANWrSQI3S3NgzuUqGpdpvqve9MPbCXhCljPg
	r3GUXDzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjOpd-00000009WTA-1xBB;
	Fri, 23 Jan 2026 21:36:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjOpa-00000009WSn-2eqm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 21:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZDCZQ5Bx2m/hozseby+L8V6oMcAYkBTg1dTRmAtNL6w=; b=BX5mGMPB24nuL1NlQnNCF+KgZE
	kJDJeAQCHb8BUiRU68GCMzkd9PYMnlLDptisUqwewAs0pE7w2v2T1sypz92eiYIkyVXvL5D591jyH
	dY/qsa30rnwS+CpFT9UAZITj7uYjTbVcep+R7xcqoN0Jazo335f7zlyhZlXsGcQyBiPQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vjOpS-004LEM-Hs; Fri, 23 Jan 2026 22:36:30 +0100
Date: Fri, 23 Jan 2026 22:36:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] i2c: xiic: switch to managed version of mutex_init
Message-ID: <df4e0611-ce76-464c-be01-e3802b04877f@lunn.ch>
References: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
 <20260123-i2c-xiic-v3-2-eb7cd4254dfb@nexthop.ai>
 <efe4e155-e307-481f-8332-783cca8a098a@lunn.ch>
 <CAGYn4vz3YuJ251JZFk7M=wsJr=bMY0Wq7x4Er=mjS_spyT5jLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGYn4vz3YuJ251JZFk7M=wsJr=bMY0Wq7x4Er=mjS_spyT5jLA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_133638_864756_33535B38 
X-CRM114-Status: GOOD (  12.87  )
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

On Fri, Jan 23, 2026 at 12:20:54PM -0800, Abdurrahman Hussain wrote:
> On Fri Jan 23, 2026 at 7:22 PM UTC, Andrew Lunn wrote:
> > On Fri, Jan 23, 2026 at 08:02:45AM +0000, Abdurrahman Hussain via B4 Relay wrote:
> >> From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> >>
> >> Simplify the error path by switching to a managed version of mutex_init.
> >
> > How does this simplify the error path? You don't remove anything from
> > the error path.
> >
> >     Andrew
> 
> 
> Thank you for the feedback. In v4, as suggested by Andy, I introduced managed
> versions of the pm_runtime_ functions which do simplify the error handling.

But this patch is not about pm_runtime_, it is about a mutex. How does
this patch make the error path simpler? Please make sure your commit
messages are accurate.

     Andrew

