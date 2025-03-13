Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5B3C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 13:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lM0g+et7+koHvwD3M6Xbjrzfe2Oj1PGsMfiK3GoCkb0=; b=2iCDt0RoYXwvmWKRymoshzLd4R
	KCIIJZPNXMvuM3jqTVwubFfyLDJ89ee/R0QJKmnYQK6T5aC7kpQEnyTGYkP20rSn05VlWUoieqOXA
	xhPBHZX/iIY/yWQSu/HNsliSotBDJXrvjT26w0OvNUeihF4OkMX1vxvuPkbYwlSbZQP08hUjCEpvw
	AX6wwnjvPHBG4Wu2/pdxgPXRfuAVXGm26zsZ5A0o8tnU5H8T4P5Ak9Q91hvUqTQFCuopRHHT8kxyM
	qFw6d9MBNpxRsLi34FIsBUDxqQ5zIkTZnBQ0cbpVlnqEj/lHWBC0FJBHifRN+8TrmeUNRM42Jn4oj
	Se0q8DqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsj4N-0000000BTIE-0hIw;
	Thu, 13 Mar 2025 13:57:55 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsj2h-0000000BT66-3Rrc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 13:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=lM0g+et7+koHvwD3M6Xbjrzfe2Oj1PGsMfiK3GoCkb0=; b=fShdanW6PbvuMFwP
	d1KJgdHaBd9oqatJIw5wA440G9mE87T9T7pcZPbqnEr/U25jvEF/fb9jkBiIllm6yjUBaGXMMQJgQ
	3riEx4T9FqTUlLmZiGaj/BphArEk5qjlRF7Rd32O8Nk5ugQp+6Rs6nNZ3MgczTvCMMeJf/PhJqqk1
	M1DTti6LAUeCZ3X732q2w44mc4TrghGxiJFwWclX5/WpD3EcVD9ZBRndSnT32MSTRfq9BaZ/R0ZiT
	LPvwKn/OT/+x1DBiy/Bku+Tk0CNowUwiHyCcmqWlK7X42Gp5xocQUlZ9yqWJJfN55QiR9kbcqmAIZ
	R8pIkXl1jwJioPNI7g==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tsj2d-004e9J-1n;
	Thu, 13 Mar 2025 13:56:07 +0000
Date: Thu, 13 Mar 2025 13:56:07 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: gregkh@linuxfoundation.org, Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, stuyoder@gmail.com,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: Remove deadcode
Message-ID: <Z9Lj9_yM1EK5pKee@gallifrey>
References: <20241115152055.279732-1-linux@treblig.org>
 <3f9dbb7b-6527-48e1-9028-b46e5a0c58ce@csgroup.eu>
 <Z9LbwRUsHwFLpBZA@gallifrey>
 <362f9392-f891-4a15-9ffd-5f5a6cac41b8@csgroup.eu>
 <oz65tdekf2ywyzadbntuxntwxulcdzyo33se54qqdsddkogquh@bqnmsmqijfvb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <oz65tdekf2ywyzadbntuxntwxulcdzyo33se54qqdsddkogquh@bqnmsmqijfvb>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 13:54:58 up 309 days,  1:09,  1 user,  load average: 0.13, 0.07,
 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_065611_903885_0B950C60 
X-CRM114-Status: GOOD (  16.95  )
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

Hi Greg,

* Ioana Ciornei (ioana.ciornei@nxp.com) wrote:
> On Thu, Mar 13, 2025 at 02:37:56PM +0100, Christophe Leroy wrote:
> > 
> > 
> > Le 13/03/2025 à 14:21, Dr. David Alan Gilbert a écrit :
> > > [Vous ne recevez pas souvent de courriers de linux@treblig.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > > 
> > > * Christophe Leroy (christophe.leroy@csgroup.eu) wrote:
> > > > 
> > > > 
> > > > Le 15/11/2024 à 16:20, linux@treblig.org a écrit :
> > > > > [Vous ne recevez pas souvent de courriers de linux@treblig.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > > > > 
> > > > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > > > 
> > > > > fsl_mc_allocator_driver_exit() was added explicitly by
> > > > > commit 1e8ac83b6caf ("bus: fsl-mc: add fsl_mc_allocator cleanup function")
> > > > > but was never used.
> > > > > 
> > > > > Remove it.
> > > > > 
> > > > > fsl_mc_portal_reset() was added in 2015 by
> > > > > commit 197f4d6a4a00 ("staging: fsl-mc: fsl-mc object allocator driver")
> > > > > but was never used.
> > > > > 
> > > > > Remove it.
> > > > > 
> > > > > fsl_mc_portal_reset() was the only caller of dpmcp_reset().
> > > > > 
> > > > > Remove it.
> > > > > 
> > > > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > > 
> > > > Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > 
> > > Hi,
> > >    Can someone pick this old change up please?  I see the PPC patchwork says
> > >    'handled elsewhere' but doesn't say where.
> > 
> > MAINTAINERS file says where:
> > 
> > QORIQ DPAA2 FSL-MC BUS DRIVER
> > M:	Stuart Yoder <stuyoder@gmail.com>
> > M:	Laurentiu Tudor <laurentiu.tudor@nxp.com>
> > L:	linux-kernel@vger.kernel.org
> > S:	Maintained
> > F:	Documentation/ABI/stable/sysfs-bus-fsl-mc
> > F:	Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> > F:
> > Documentation/networking/device_drivers/ethernet/freescale/dpaa2/overview.rst
> > F:	drivers/bus/fsl-mc/
> > F:	include/uapi/linux/fsl_mc.h
> > 
> > FREESCALE SOC DRIVERS
> > M:	Christophe Leroy <christophe.leroy@csgroup.eu>
> > L:	linuxppc-dev@lists.ozlabs.org
> > L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > S:	Maintained
> > F:	Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
> > F:	Documentation/devicetree/bindings/soc/fsl/
> > F:	drivers/soc/fsl/
> > F:	include/linux/fsl/
> > F:	include/soc/fsl/
> > 
> > I acked the 2 line changes in include/linux/fsl/mc.h, the main changes being
> > in the C files which are not under my scope.
> > 
> > Stuart, Laurentiu, can you pick up the patch ?
> 
> Stuart and Laurentiu are no longer at NXP. Even when they handled the
> fsl-mc bus driver, they didn't have a tree themselves to pick patches up
> but rather, historically, patches on the fsl-mc bus were picked by Greg
> KH.

OK, copied Greg in.

Dave

> Ioana
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

