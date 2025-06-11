Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D81C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 03:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnQvkwGgcyocQYZ5N13vAZvfg+eJZRbaALNxFcVziF4=; b=LUopgmkS8Rmv6OejJ3hJqRx3MY
	SofgBh7JuiJ3794VJyGbUhf0/6XPWLfO/WdLRHL7DosmxF49BexLHpywY6P3mC/bLzuKV79tYp+sC
	UEnBRGrQ1IEvBG841imrK4MrfkN8n9zYA39fTOHdWLDyrXiXWv9FKqiat5OGwa8467Bu8epph1Mft
	JYleB+O1RodYLl3ZqDfm8ZZWMfx5Txyv2MacLpLS5AXb5Afos5dSHb1V/qMfR20aSxJiOXu11hjKE
	qSFQkNFwW4rLElgzOmsTGVowRCrp0FIRMl/q7+HxDtttEroDCun+iwmwaf02AOs3yZ8gU9fZlrd3P
	hP8WUaFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBjf-00000008hwP-3SFx;
	Wed, 11 Jun 2025 03:02:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBhR-00000008hoZ-2UJJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 03:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wnQvkwGgcyocQYZ5N13vAZvfg+eJZRbaALNxFcVziF4=; b=EYbVcJ05boeKy6XyUe1eV/D3Rv
	cSnHb0UXP+ST6UOTw88FlYWTCJYlYCytr/nvKzcg3bOhmu1mi4Z+EO59QwNp61rjRzj+JVyX8HI3o
	sDxt+j8MjcjbfJlcO08jORh2XVtyNV4KFPnrFk6hN5SS9wNSNebdiBW0eSIuzcRcv0pCvhVSN/0Ky
	Fnh/mlRTLjUH3StQiv9EpOA7sqO9NDgmCww53TFTf9QoxESz2a7kzD89tSkls0sajlym0K34yjjP4
	y10w7YEfwIYI7qBadHv1w+1M1VK8WY9PKicl46Mm/IcpzLnBid3yZPtxPKnWB7lJOKzA1Q9YKqVJV
	lbxyPWUQ==;
Received: from mail-m16.yeah.net ([1.95.21.17])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBhO-000000025Hg-2nEo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 03:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=wnQvkwGgcyocQYZ5N13vAZvfg+eJZRbaALNxFcVziF4=;
	b=kzqwNKMtsQfkoSb4+g7xlmAS/SErRvHoRj7RvKZyBVZkrfdut767/7Wh7MDZ/P
	zpAN8ELhJTKULjghRr8TQTIdRj1lrtEg0AV8vT99PZbDUPZmk2j2ypJrczii65p9
	UuQZwKdlufLiIThN86J8wg4p/B9XwheuUfbD4B1SwXgjo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgA3rw4n8UhoKPphAA--.40571S3;
	Wed, 11 Jun 2025 10:59:52 +0800 (CST)
Date: Wed, 11 Jun 2025 10:59:51 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <aEjxJ3atSw/8JwNo@dragon>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
 <aEf/2+3MU5ED2sxE@dragon>
 <emdju6mml2o65hmtiyf5jwlzhudmbpyx433wz5a73lkpinzbyp@2oexfo2ra7xs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <emdju6mml2o65hmtiyf5jwlzhudmbpyx433wz5a73lkpinzbyp@2oexfo2ra7xs>
X-CM-TRANSID: M88vCgA3rw4n8UhoKPphAA--.40571S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrWfGF17WryxZw4UKF18AFb_yoW3XrcEvr
	4DGw4DKw1kJryfXas3tF1rGr45G397KrWUXw1fXr4YvryfJF92yFWDC3sFv3Z5Zay2gr9I
	9rn0g34Y9w409jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUppB3UUUUU==
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhlpZWhI2xltwgAAsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_040023_321562_D57C620D 
X-CRM114-Status: GOOD (  10.66  )
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

On Tue, Jun 10, 2025 at 07:54:41PM +0800, Xu Yang wrote:
> > However, your change seems working fine on i.MX8MM EVK.  It's probably
> > due to the fact that host disconnects gadget for some reason when EVK
> > suspends.  This is a different behavior from the custom board above.
> > We do not really expect this disconnecting, do we?
> 
> It's an expected behavior on i.MX8MM EVK. The host will see device disconnected
> after imx8mm do system suspend. It's because the usb phy power will be off after
> system suspend. If you enable wakeup capabiklity for usb phy, the usb phy power
> will keep on and you will not see disconnect event anymore.
> 
> # echo enabled > /sys/devices/platform/usbphynop1/power/wakeup

Ah, indeed!  Thanks for the information!

Shawn


