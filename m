Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3EDC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 10:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GowspXRPgAsjmzB49otzktUNwAc3b+pfyVwK2OVnG0g=; b=fbtTs1S9dLkWEI/6BjeJ452CId
	LjVIDjO5wQLqYcdmpqVR+fMMX10tfnIRk5rA4lFimFzRLpAbTWZPIC8CsnO7+aU5Bde7eAYxrrz7i
	xUyHVDmHyuWZxD9z8jfT/zOjR1d9aqO92L5pNRbeFmp2bkvt44e0qNqv8YliszON7dbzIZh85BM/V
	029b2XHP7u8nBTSYhtzTdx0WEqWUx6oIzGAn7zTd5PirpSyRXih7SmFyF8jMm4Yjbbtf8GWu7xFkQ
	M58j1nLWoP95WbaRa1Oxg7IA5zdAxKc99Y6WAx9Oo7vkcLZflLsugQXe1mc+qo5pKcR2DHKOPnSgF
	bL/ANuIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2T6M-00000006uq9-33UY;
	Wed, 09 Apr 2025 10:56:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2T2p-00000006u9Q-2MhP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 10:52:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEAB71595;
	Wed,  9 Apr 2025 03:52:32 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 340D73F694;
	Wed,  9 Apr 2025 03:52:31 -0700 (PDT)
Date: Wed, 9 Apr 2025 11:52:12 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Matthew Bystrin <dev.mbstr@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Message-ID: <Z_ZRXBed2WVZ_O8Q@pluto>
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
 <Z-1gY8mQLznSg5Na@pluto>
 <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
 <D91JD15NY3Y0.23E428W332D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D91JD15NY3Y0.23E428W332D@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_035235_650831_938BBA4E 
X-CRM114-Status: UNSURE (   5.80  )
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

On Tue, Apr 08, 2025 at 11:22:38PM +0300, Matthew Bystrin wrote:
> Sudeep, Cristian,
> 

Hi,

> Gentle ping.
>

we replied already...both of us :P

https://lore.kernel.org/arm-scmi/20250402104254.149998-1-dev.mbstr@gmail.com/

Maybe in your spam folder ?

Thanks,
Cristian

