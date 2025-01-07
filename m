Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E32E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 23:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQmI3f/ZXJJGnK2Kx1HsEo5OSm4V+NL9AQ6xbkUoEns=; b=aJgi+OGmSqQzRmXLpW6vSnub8Y
	LIrKooDizTO8xNIK3hZ5jK/pmY7fUV+r3V7IE51AnbwX2wcPb0b83QdGsE525UpcHP7kJChSuzwam
	la0f1Px6p4NfEP1hjOwiW/ScgjaUEGI7a9HCeTAbRnDz4XJJG8iChPPnCLtscpjUVhUHhYcm5UU/G
	ddQO3jm1j/0gsJQDneJaVBnxmmDcE8Yt1ALV2Er/nRBbueL9GA+aNFdHRW8Bz50lszCtLWt6bgwzF
	63fUVNPEeIJhia9v2KI3SfpIpv0SCHO7TWnjJRFdGcD++PP/oX/U8wCgjVkolL3ungR8Bns8KIHaw
	YmKIOqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIvL-00000006Xi4-1w5k;
	Tue, 07 Jan 2025 23:23:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVItB-00000006XKF-0zHI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 23:21:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C62ECA41EEE;
	Tue,  7 Jan 2025 23:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD8FC4CED6;
	Tue,  7 Jan 2025 23:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736292092;
	bh=/1LOyZMlv1B2fL4VwwpbUjJPWCQXqG5BhAuu7Wl2DrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hMljQaOkIWwSw02QbPPi5VMVP5spEVkc4EO9Jx0R9Q69sXrJmWyoQg+4EDQv4vQjE
	 2B4uRDdSetXtdzr+neGZnd6SfpOkBaVflyJGoex9Gvj3oJ3hfdozEyg7xwxm35rxgB
	 D65gYtCLZx0WDPXlICEV5ijlKAriG0Qp3/N1P0Wo4NIuSX45ZUEFlh3AhlSj2VjPO6
	 FH7ar+suJWuS1d6rxkBPSc6n43WGzTMYBEopYfsdukSNu42A5q+b3UL7rKmAMwIzNs
	 w6g+NI19JCraKIe+LPvUK4sOOIEm3TYQ2WvTPiVq0KAPDQFUrlyVU3/EyzaqCnRqeG
	 pVJksJSz5S7vw==
Date: Wed, 8 Jan 2025 00:21:28 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, aisheng.dong@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: make controller available until the
 system enters suspend_noirq() and from resume_noirq().
Message-ID: <2pikoj7o5qppdysbyhrla2ur3vfsrhl5nfmp2ot3iqii5msuac@qky2ij7jtgov>
References: <20241227084736.1323943-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227084736.1323943-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_152133_343287_68E720D0 
X-CRM114-Status: GOOD (  14.10  )
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

Hi Carlos,

On Fri, Dec 27, 2024 at 04:47:36PM +0800, Carlos Song wrote:
> This is a general i2c controller feature. Some I2C devices may need the
> I2C controller to remain active during resume_noirq() or suspend_noirq().
> If the controller is autosuspended, there is no way to wake it up once
> runtime PM disabled (in suspend_late()). During system resume, the I2C
> controller will be available only after runtime PM is re-enabled
> (in resume_early()). However, this may be too late for some devices.
> 
> Wake up the controller in the suspend() callback while runtime PM is
> still enabled. The I2C controller will remain available until the
> suspend_noirq() callback (pm_runtime_force_suspend()) is called. During
> resume, the I2C controller can be restored by the resume_noirq() callback
> (pm_runtime_force_resume()). Finally, the resume() callback re-enables
> autosuspend. As a result, the I2C controller can remain available until
> the system enters suspend_noirq() and from resume_noirq().
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

Merged to i2c/i2c-host.

Thanks,
Andi

