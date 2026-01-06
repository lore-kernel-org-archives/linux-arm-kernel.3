Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D199CE9D6C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZW/vCU8E+/Ef8N+bJ0DOv2bF8sNzmO8PadbmPp9c3WM=; b=YWU+5WUgRkneydXgl/QIkvfuS6
	a3+qYWItR+QFTo3RKdywYTllql1mtCtvY2Gg6/LRbhUX9znQleq8KED76MGSHdLVzdeUSTtkGnle/
	h2U4mFNlh8krHIHcz0pItdDQfoFjMMfCN8uLLo0hjD4qIV+v78i0VIrLH3QQYGhkGs3SzXuh83ENe
	ynREdIDJ2BRmWlb/RCIXnw/7E+cdPi97xJ79WA4FBqhJstLHIveZCsSDoujGw/xsnQe5pbyS52fSl
	ZUmBM7kMMgpDBSt0ckWoGUs+UfpZItor3TMC68EkEEPw/wnUZ+QDDbSD06M+PhF0WVqdpC3pyHCwk
	W2ZwAbLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9J9-0000000DR6B-3C0I;
	Tue, 06 Jan 2026 15:49:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9J5-0000000DR5p-40Pk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:49:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9883D497;
	Tue,  6 Jan 2026 07:49:08 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC41E3F5A1;
	Tue,  6 Jan 2026 07:49:13 -0800 (PST)
Date: Tue, 6 Jan 2026 15:49:11 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] firmware: arm_scmi: imx: Support getting syslog
 of MISC protocol
Message-ID: <aV0u9_l3Ke0hU0Vr@bogus>
References: <20251029-sm-syslog-v3-v3-0-64e14a6e3f87@nxp.com>
 <20251029-sm-syslog-v3-v3-1-64e14a6e3f87@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-sm-syslog-v3-v3-1-64e14a6e3f87@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_074916_036987_697C66B2 
X-CRM114-Status: GOOD (  10.10  )
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

On Wed, Oct 29, 2025 at 08:07:01PM +0800, Peng Fan wrote:
> MISC protocol supports getting system log regarding system sleep latency,
> wakeup interrupt and etc. Add the API for user to retrieve the information
> from SM.
> 

This LGTM, so

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

Let me know if i.MX maintainers prefer to pick up both the patches or
they want me to do that.

Also it would be good to get Cristian's review especially the iterator is
being used and he may spot something that I may be missing.

-- 
Regards,
Sudeep

