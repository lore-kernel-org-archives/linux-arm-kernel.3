Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7C0CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 19:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71GzoIHZy521KNkvtTynb+MH1YLd0uEMHjCK295wY30=; b=BOU6AFax6+Qhnj5CB0jDEJJ9Oq
	LAV+y259V2qaS8wdHohL8HjGrsnby2XkD3ILgrPu8s7EDIC0UhJoldywvOSMt+tNCzhju5mWprYJI
	qdQNVmS4W6wBjJZuV0Xh0vNC/AgAcuSewMJfXbjKRJ5cea7/3RRMQ80/26TQ3xpnwbbHhynoarAYT
	TBIqPuNBDIRS2Il/b//fBtmNLl1lU7HSuC30yTVwbpUNpjUDSyleaTt3bTerK1QNu9dZVuqT0HxqP
	88O+yDfiqT7RqWixnqxfIqqKPWM4rY79vMqF9NMRI+FYP656gJy6FLaO7UXAdV8hmm9cTR0LBvwof
	/rgTlUWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL49I-00000004gGc-21uf;
	Thu, 07 May 2026 19:12:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL49D-00000004gCV-40LH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 19:12:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09277356B;
	Thu,  7 May 2026 12:12:28 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F11153F836;
	Thu,  7 May 2026 12:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778181153; bh=01dHXXoHP8xLvnVbkZIUcHebTo9u7wdlTmdGSOoUtww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EI0yDTmYefma4tdKdFl4ovGXlHEdV2yaoASb9gjk7esc7KFacxAg51U89sxxL/v2c
	 XgdVXczS3Sa6ffMsmxqTyW8FxaXBFhkAOSwSKnzo+XT90f6ipMrB+KvTEL/gJvqKKW
	 313RfNsTu3TC5PvsKnpyoniItmz/hmXk9BDCBk88=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] coresight: ete: Always save state on power down
Date: Thu,  7 May 2026 20:12:18 +0100
Message-ID: <177818106097.834828.16125405846052413323.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505-james-cs-ete-pm_save_enable-v3-1-485d21dd79b8@linaro.org>
References: <20260505-james-cs-ete-pm_save_enable-v3-1-485d21dd79b8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_121236_042646_4B3DF0BF 
X-CRM114-Status: GOOD (  10.79  )
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


On Tue, 05 May 2026 17:51:25 +0100, James Clark wrote:
> System register ETMs and ETE are unlikely to be preserved on CPU power
> down. The ETE DT binding also never documented
> "arm,coresight-loses-context-with-cpu" so nobody would have legitimately
> been able to use that binding to fix it and ACPI has no such binding at
> all.
> 
> Fix it by hard coding the setting for sysreg ETMs (ETE is always sysreg)
> or ACPI boots. Use a local variable when setting up save_state so that
> it's immune to concurrent probing when devices have different
> configurations which is an issue with modifying the global.
> 
> [...]

Applied, thanks!

[1/1] coresight: ete: Always save state on power down
      https://git.kernel.org/coresight/c/2ab4645fe420

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

