Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AEDC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 10:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTzoeF9qa2DCRvtCnw6kPFq/OAvU51CQw5UeQvdIlHk=; b=cDGCbzQlY+9DnLCgYPDZ3Hm9bI
	JVxfNd1dT5jMlPAY4gU8WnYOSk2UJC54UOk1o/PTLCpNQOjJZAngw8bwM0nuV1lTc+eNlJk7V3RJX
	2wew3KqP3+mXEAEH0WjwHui2037ZNtjBl0IO0LWYfftJVtYa+0OtA2z+ijoS0XukysSxd+HTjSrGs
	lQH1FalZy2QRjl0qalvYPKJpgQ2ubImdr97YdQNDdKjh1UqUy3pk/SAuNjtbyEUwnPxZKwv2U/aZ0
	uaIfo+I8Sfsb56MFjGjQQTDTN0QJBV3FiURTNan1ptrz640K1qUwhfmlfwkMwPRnIXHYjTYK3lHDA
	0UoXL7LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXe6b-0000000E8fH-1yAp;
	Fri, 04 Jul 2025 10:57:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcxi-0000000Dxfl-0mn6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 09:44:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F894152B;
	Fri,  4 Jul 2025 02:43:51 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 773913F6A8;
	Fri,  4 Jul 2025 02:44:03 -0700 (PDT)
Date: Fri, 4 Jul 2025 10:44:00 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/7] firmware: arm_scmi: imx: Support getting syslog of
 MISC protocol
Message-ID: <aGeiYKhPqrFMvf3t@bogus>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-5-2b99481fe825@nxp.com>
 <20250702-classic-sloth-of-snow-34ed1b@sudeepholla>
 <20250704102353.GE4525@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704102353.GE4525@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_024406_267586_91902AEE 
X-CRM114-Status: GOOD (  13.06  )
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

On Fri, Jul 04, 2025 at 06:23:53PM +0800, Peng Fan wrote:
> On Wed, Jul 02, 2025 at 04:22:30PM +0100, Sudeep Holla wrote:
> >On Fri, Jun 27, 2025 at 02:03:48PM +0800, Peng Fan wrote:
> >> MISC protocol supports getting system log regarding system sleep latency
> >> ,wakeup interrupt and etc.
> >
> >We now have SCMI telemetry protocol to provide such information in a
> >standard protocol. You must consider using that or switching to that
> >in near future. I am OK with this but would like to warn use of custom
> >interface for things like this is not scalable for long term.
> 
> I have shared latest 4.0 alpha release information to our firmware
> owner. In future, we may use telemetry, but not up to me.
> 

Thanks for that. Much appreciated!

-- 
Regards,
Sudeep

