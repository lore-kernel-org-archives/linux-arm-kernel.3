Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7697E9DE7B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 09:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIif65eSnKZZaprFXqjN75JZuJJHcWvNQCddZgD/t4k=; b=GQdd5jlX2fkT17UjPFFvPBwcYI
	kGozBZs9BtEYUrjOSf5u/Ise1rPP/thFvKtp6t5TsrjNJWKvhOv+SESz3Yq3v1fw+IfjF0b7wffqr
	x4b5Q0BiQw9krAbTgv/wZs5BWikt2wAwfyzHeAVCwIBb1wsYj+U/mGUwg1ICFH4a/9d7521gOcW8l
	PcHEQjMtJVjkiB83+DLTtS3pqzoMlkZ/KBnbl6VI7p21DLoUeGPPJNuSqNzOl2N5Onwo3OrkZ26lo
	aQOG51Jlj0VKTuorcuc/RzEypBc9pH/Xjj7FfTJu4/OJX8qH+J165CFR7BhqYXNI1/5/ejoLPHBCM
	cgvwhSEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlhG-0000000A3Ft-0hAR;
	Thu, 09 Apr 2026 09:29:10 +0000
Received: from mail.prodrive-technologies.com ([212.61.153.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlhC-0000000A3FL-3w95
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 09:29:08 +0000
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by EXCOP02.bk.prodrive.nl
 (10.1.0.91) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Thu, 9 Apr
 2026 11:29:03 +0200
Received: from lnxdevrm02.bk.prodrive.nl (10.1.1.121) by
 EXCOP01.bk.prodrive.nl (10.1.0.22) with Microsoft SMTP Server id 15.2.1748.39
 via Frontend Transport; Thu, 9 Apr 2026 11:29:03 +0200
Received: from paugeu by lnxdevrm02.bk.prodrive.nl with local (Exim 4.96)
	(envelope-from <paul.geurts@prodrive-technologies.com>)
	id 1wAlh9-00GNSA-2r;
	Thu, 09 Apr 2026 11:29:03 +0200
From: Paul Geurts <paul.geurts@prodrive-technologies.com>
To: <peng.fan@nxp.com>
CC: <abelvesa@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <shawnguo@kernel.org>, <linux-clk@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <martijn.de.gouw@prodrive-technologies.com>,
	<paul.geurts@prodrive-technologies.com>
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Date: Thu, 9 Apr 2026 11:29:03 +0200
Message-ID: <20260409092903.3903393-1-paul.geurts@prodrive-technologies.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <addMdwvnDkCMJxhx@shlinux89>
References: <addMdwvnDkCMJxhx@shlinux89>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_022906_977244_97649E52 
X-CRM114-Status: GOOD (  14.14  )
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

> On Wed, Apr 08, 2026 at 12:13:13PM +0200, Paul Geurts wrote:
> >The i.MX8MM clock driver is implemented as module_platform_driver();,
> >which makes it initialize in device_initcall(). This means that all
> >drivers referencing the clock driver nodes in the device tree are
> >deferred by fw_devlink, which are most of the i.MX8M platform drivers.
> >
> >Explicitly initialize the clock driver in arch_initcall(), to make sure
> >the clock driver is ready when the rest of the drivers are probed.
> 
> Let's keep as it is, changing to arch_initcall() is not allowed.

Why is it not allowed? This is an arch driver, so I think it should be
initialized in arch? I don't think the initcall system was intended to
initialize everything in late_initcall, which is effectively what this
problem is causing.

> 
> Thanks,
> Peng

Thanks!
Paul

