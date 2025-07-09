Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE736C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 13:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hbrhu9So74Q7r7251Ra6QUZSTO1Fybh3e/HkfS52BCQ=; b=iwAb0ujpauoxpcKo7PboqE8VCq
	ksoRvMWvfFyHshpiAm/DYv0t0/HAobB6zv6/6HAahtYb424CkUe5zxnl8wz5r538oOJZWPJiU54mH
	1904WbAFqrsDAcZSpTjteZY92YI7ax3TBbI4OYnExpz9w682/7pphpNBN3A3lnpzvTWofc2ZVNzC5
	QaDZqhpzQJdvT25iBXN+sKgGSqBXIIZeylrQgchq3vEqFxD0hVihy24sxFqT0w5afrgW6MozMh/LR
	qVgbmhSOA745n+hZC7fLFl708xU3pDFB9bpQ26tYjMAPbQofHQ0qt4lzmgey5yJkZjWVsNJ+8B+96
	wobO3EUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUvH-00000008nUE-1Mqh;
	Wed, 09 Jul 2025 13:33:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSiV-00000008S9u-1u0T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 11:12:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 655091516;
	Wed,  9 Jul 2025 04:11:47 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 812AE3F738;
	Wed,  9 Jul 2025 04:11:57 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: convert to SYSTEM_SLEEP_PM_OPS
Date: Wed,  9 Jul 2025 12:11:53 +0100
Message-Id: <175205948920.1157216.306966807698770237.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709070107.1388512-1-arnd@kernel.org>
References: <20250709070107.1388512-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_041159_532555_90C883FA 
X-CRM114-Status: UNSURE (   8.34  )
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

On Wed, 09 Jul 2025 09:01:01 +0200, Arnd Bergmann wrote:
> The old SET_SYSTEM_SLEEP_PM_OPS() macro leads to a warning about an
> unused function:
> 
> drivers/firmware/arm_scmi/scmi_power_control.c:363:12: error: 'scmi_system_power_resume' defined but not used [-Werror=unused-function]
>   363 | static int scmi_system_power_resume(struct device *dev)
> 
> The proper way to do this these days is to use SYSTEM_SLEEP_PM_OPS()
> and pm_sleep_ptr().
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: convert to SYSTEM_SLEEP_PM_OPS
      https://git.kernel.org/sudeep.holla/c/62d6b81e8bd2
--
Regards,
Sudeep


