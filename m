Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF38CAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7Y/5XAicoD8NcBwUSNR9CyZE1ekWpSORoJ1AIrCozc=; b=TKsZ8XFe/9EGsrUOwaGWqaWqFG
	M2tBnVgQeBnjl+PAccqGcgO816VBgo1MLijFYY2XKMeuyI92WpbhWFgOVTp+89PuTn/Gq+eRSRdJX
	2pBrDisckEn6SIki93ceIRUg8yJx8osk7KB5bXdVH/WvidXkgWemtGKYdkycG+/nDgXgchhj1bLE5
	O4BKvdDCIkgSwArdUoZkBRB2IZLrjLgd0d5ZmNil6RSu9+XSjNaijKXiYGTe+m3Xh/ki1NCSpnLvC
	Ca+Nuv26kLMN+kgEnZr7rh5ouV8ROtYGUr2mgqCbLyPVi/t4/ZyIobqAFll1vjSEFvmP03Cht9E3t
	8DESiv+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1v6-00000008mZg-00gU;
	Tue, 09 Sep 2025 17:14:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvveY-00000006QW3-2NRs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:32:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72FCC113E;
	Tue,  9 Sep 2025 03:32:37 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E6C9B3F66E;
	Tue,  9 Sep 2025 03:32:43 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	arm-scmi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/6] firmware: arm_scmi: imx: Dump syslog and system_info
Date: Tue,  9 Sep 2025 11:32:41 +0100
Message-Id: <175741387444.137822.14283463881745824228.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904-sm-misc-api-v1-v4-0-0bf10eaabdf1@nxp.com>
References: <20250904-sm-misc-api-v1-v4-0-0bf10eaabdf1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_033246_648483_D2249F2F 
X-CRM114-Status: UNSURE (   8.47  )
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

On Thu, 04 Sep 2025 18:40:41 +0800, Peng Fan wrote:
> System Manager firmware provides API to dump board, silicon, firmware
> information. It also provides API to dump system sleep, wakeup
> information. So add the interface for Linux to retrieve the information:
>
> patch 1 is to add doc for board information which was missed before.
>
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/6] firmware: arm_scmi: imx: Add documentation for MISC_BOARD_INFO
      https://git.kernel.org/sudeep.holla/c/646c0c9e06a6
[2/6] firmware: arm_scmi: imx: Support discovering buildinfo of MISC protocol
      https://git.kernel.org/sudeep.holla/c/cc798b105070
[3/6] firmware: arm_scmi: imx: Support getting cfg info of MISC protocol
      https://git.kernel.org/sudeep.holla/c/d3e25c244d53
[4/6] firmware: arm_scmi: imx: Support getting board info of MISC protocol
      https://git.kernel.org/sudeep.holla/c/88d3671baf41
--
Regards,
Sudeep


