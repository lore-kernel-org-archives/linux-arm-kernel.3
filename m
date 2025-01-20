Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7945EC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 10:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkzZNKW8eL7DBqP7Z2NDJ6Qfzrf1J+jLV5t9JUsOcrc=; b=nu6hNF8Pb79hEHsnNh7/zsIq4R
	xKhZ8cji/291MRZnr+HUlGD8HZFKfrSAscI2TcmG+PVpT0Nh3UOPC1DhUtaSsv3pU2C/EGkB2SF0I
	kebq/49NZ6xYanno3JzLs6afanpJVi05Z2aIqNvuw4YtqSx4aFQ6i/PSDd0mkwmvcBlHTYe7FRwF9
	tV+Hl0rO75CxgkQi4S6ddcvPGTLBjkNG6h/juQHBY7oIC8iB58voSVxAC8N+ZXjYMAmLlaFkyzWHG
	v3Zbe6Sw9rhd51Hn0LbsHIFQ+fqIExAbxZjYYzk2IgH2+aP3thNmk579n6MeNqwnxf14IyDXwfQHz
	cpdxnq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZovb-00000005KIG-1Ele;
	Mon, 20 Jan 2025 10:22:43 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZouK-00000005KCb-0yjI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 10:21:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DC916000C;
	Mon, 20 Jan 2025 10:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737368479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zkzZNKW8eL7DBqP7Z2NDJ6Qfzrf1J+jLV5t9JUsOcrc=;
	b=CpvkaGTXv9QdI+B4g/m2HOTohSbLJ2NKlZPezKb46S9Rvvse2jHEFCOlfIVfSWNvPr37yy
	9jZCkNcmVGS+yETVPjub0NDcGqK9HAdOYJGFHRKmN1NllEsZaCis71mTRBQywG32rvefpq
	bGwYaZjHO3lTdeftSB2AXHDzj+bwBvXoDfwG1vF9XaZXxwfxzHl2YzQCMCuvQ5jPnhGbn1
	gh4SGIei5u7rua7NR6ArWuOOmg6voBPWFKtmzXBu+SCf7Bcn87SrEYQUxHGsVxOc7+cLfE
	kDbSZjmL5XiN8NBm/ho57/23I4dhYPTLXM4BW6Nh0ND549sArIse7As4aI49cQ==
Date: Mon, 20 Jan 2025 11:21:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/4] rtc/scmi: Support multiple RTCs
Message-ID: <20250120102117538ef59b@mail.local>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_022124_566209_401B26AC 
X-CRM114-Status: GOOD (  15.22  )
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

Hello,

On 20/01/2025 10:25:32+0800, Peng Fan (OSS) wrote:
> i.MX95 System Manager(SM) BBM protocol exports two RTCs for EVK board.
> one RTC is SoC internal RTC, the other is board RTC.
> 
> The current driver only use the 1st RTC. With this patchset, both RTCs
> could be used in Linux. To achieve this:
> 
> 1. Support more event sources for BBM protocol
> 2. Add bbm_info hook to let users could query the number of RTCs
> 3. Introduce devm_rtc_allocate_device_priv to support setting rtc device
>    private information
> 4. Update rtc-imx-sm-bbm.c to register both RTCs
> 

I'm sorry but no, you have to register two RTCs like any other system
would do.

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (4):
>       firmware: arm_scmi: imx: Support more event sources
>       firmware: arm_scmi: imx: Introduce bbm_info hook
>       rtc: Introduce devm_rtc_allocate_device_priv
>       rtc: imx-sm-bbm: Support multiple RTCs
> 
>  drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c | 33 ++++++++++-
>  drivers/rtc/class.c                                |  9 ++-
>  drivers/rtc/dev.c                                  |  8 ++-
>  drivers/rtc/interface.c                            | 16 ++---
>  drivers/rtc/proc.c                                 |  2 +-
>  drivers/rtc/rtc-imx-sm-bbm.c                       | 69 ++++++++++++++--------
>  include/linux/rtc.h                                |  2 +
>  include/linux/scmi_imx_protocol.h                  |  2 +
>  8 files changed, 100 insertions(+), 41 deletions(-)
> ---
> base-commit: e7bb221a638962d487231ac45a6699fb9bb8f9fa
> change-id: 20250116-rtc-3834e01786a8
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

