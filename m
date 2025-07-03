Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40B5C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdF7XMGbHzRsocpIdy6UxynHxVSxK5gXrlC2pbTvCyg=; b=Ll2rnOzF2F0VxXtJsvxyA9U3GK
	OZlL1TQSujl8CUCo1CNq3RmtSSQJ3pHo4Vu7hlmefGzyEidxAQ0V0ZaoQK91q5q/SjBaPOQvP9yRO
	OawSm55veFO8Gkcf3yzH54GBGCPcysFXgwM47hHDuXU0mq9kvR38xvEXvqeiirL7IHaIfQdyCvfI7
	xu8V6y5IQ0idCI7DzzjuntbcimJe4IhqdF1gNbG0uEGG1MUBtRydNlSLlLGSmVG81K3sg0wlT4NGI
	kEcY0nW3Qqnl7MBPRUmwRu6HQE4seADfgQobwAhvPPKvnhjhTj0etk5cRDDih6zlbEoyrAaRJNQq2
	eiKQ+u2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRN1-0000000Cbi0-1QUF;
	Thu, 03 Jul 2025 21:21:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXOGz-0000000CCJw-21fr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 18:03:02 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E251B6BE;
	Thu,  3 Jul 2025 20:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751565752;
	bh=v/I1dsSqNAw4VzACte/moRciziTu8q9oyU6gnYg2cn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f2fywMU4DxaOoTEgWphDg4lYFBbac0Ssp82ncoEWY/W3JdJcmm8LxZJHXBDS2g9bH
	 lOCv8LSb0nbLoRSLfDdCc5PHKbZSm7j1I6WnP/d1aLC++oZAhNxKNO7nXwIZJJzu0t
	 uUiYvF2kUgXEF5iwg48rMzd0jRtE91bPhscobw7o=
Date: Thu, 3 Jul 2025 21:02:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
Message-ID: <20250703180228.GA20240@pendragon.ideasonboard.com>
References: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
 <20250626002053.GA12213@pendragon.ideasonboard.com>
 <473ad0ce-5180-40e9-b159-a6cfe77f792f@suswa.mountain>
 <20250626083018.GB8738@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626083018.GB8738@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_110301_655397_C50730E6 
X-CRM114-Status: GOOD (  14.77  )
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

On Thu, Jun 26, 2025 at 11:30:18AM +0300, Laurent Pinchart wrote:
> On Thu, Jun 26, 2025 at 03:32:50AM +0300, Dan Carpenter wrote:
> > On Thu, Jun 26, 2025 at 03:20:53AM +0300, Laurent Pinchart wrote:
> > > On Wed, Jun 25, 2025 at 10:22:32AM -0500, Dan Carpenter wrote:
> > > > This was returning IS_ERR() where PTR_ERR() was intended.
> > > > 
> > > > Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")
> > > 
> > > I'll add a
> > > 
> > > Cc: stable@vger.kernel.org
> > > 
> > > to obey the media subsystem CI rules.
> > 
> > Wait, what?  The original commit hasn't hit Linus's tree and it's
> > not marked for stable either.
> 
> I'm personally not in favour of adding Cc: stable on all patches that
> have a Fixes: line. I'll let Mauro defend the rule, and I'm happy to
> drop the Cc line and fix the CI.

Mauro, could you please tell what would be your preference ?

-- 
Regards,

Laurent Pinchart

