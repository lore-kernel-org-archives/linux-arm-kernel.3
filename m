Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB5FCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 03:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAUA0eC2JVxsai+PYEmvnqvEZbSTqKwgsqHUEWB0nsQ=; b=K5KUdWZnqyFD9A76OP0gmBzQP7
	l6w86zItLZZOWa7wHHA2QmKfwaKoLwgszQB7jChjfz6ElnDMgStbre06mXME9hy/EqDgbaHyv8+cH
	SMj9b1ZjNwnFEi0XbSOvue/3XJ/7kO3ytuf7hTWuAjnZtjRFS1YnyIyE7yBoiRzRV4WYb97NdjHzX
	9tDufTDLAW50UedRblqPzOfwPQwmYRkG8UQFH6aSWLnO6niwcxVkQcyHtJX6y8kzlr/X9U4+/dmLc
	8+mhUK1VADG4iMSxnC7NuSOHoVvV3EY0exrtTKjm58K9/nNrgAHj+i7v7pCvoF3O3KymPUwHik7lI
	M7t7eAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbut-0000000E9QO-0IEZ;
	Wed, 03 Jun 2026 03:05:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbup-0000000E9Pq-3XYf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 03:05:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=SAUA0eC2JVxsai+PYEmvnqvEZbSTqKwgsqHUEWB0nsQ=; b=pO
	gB43rfTUBXuvMABsQAdxFLeYoiUNDovpCs28gFWP5tiobu5uzWePvEAmJQsqAOXxardLiw7jfPgtT
	/xUqjU4WU9X20hxLggPcgpLGVfLfi3IUbahagyDgQVvDy1L0bbvR67CsBB2vNKc9HCOenC6RNNqQZ
	IUvvXkBaXhvzHwU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wUbui-005oWn-FL; Wed, 03 Jun 2026 05:05:04 +0200
Date: Wed, 3 Jun 2026 05:05:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Nishanth Menon <nm@ti.com>,
	Lee Jones <lee@kernel.org>, Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ARM: Feroceon: Fix OF node and mapping leaks in L2
 init
Message-ID: <53b63e52-44c7-4e43-a853-952fec80ad96@lunn.ch>
References: <20260505003252.2886028-1-dbgh9129@gmail.com>
 <CACrCO_VG11oDkLODimguZKN2xHHa7ki40RofZ2Z5UxvPkxgOOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACrCO_VG11oDkLODimguZKN2xHHa7ki40RofZ2Z5UxvPkxgOOw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_200511_887572_3CF8DE5B 
X-CRM114-Status: GOOD (  12.78  )
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

On Tue, Jun 02, 2026 at 10:52:32PM -0400, 최유호 wrote:
> Hi,
> 
> Just a gentle reminder regarding this patch.
> 
> I would appreciate any feedback when you have a chance to review it.

What do you think happens to the machine if it cannot enable L2?  I
think you have much bigger problems than some minor resource leaks.

Please read

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

Does this patch fulfil those rules. Please could you point to bug
reports of the leaked resources, so we know it actually bothers
people.

	Andrew

