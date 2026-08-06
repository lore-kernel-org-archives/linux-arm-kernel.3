Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EC5C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 13:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWjk6/li1Wl3fs+vwXz8OlLZy0TvDhpR2Xx4pSYOxg4=; b=mPvSXPZvZaJ/Br5csHbyMG/Xlg
	Jcr+fGxzgFrARRYSUAqZSP5pP9isdxFrp5pQg4eVUz/JCn2dQvw6YBEsHBhfIIOWzCN/lVgX17Tn6
	RlBGThbQr9yOHv/QxdKZ8TjWSL3leDRWCm4B1VjhRzavK+fFQfIT6DAGxO/18vf+l6I1p7aM3ZXeO
	vzrGy/4lX1JNozkPPuNWcHXUjTFP9mEWJnQfKfbRTlXGXGlfexXUZ6dtKoFHDHGrwZ849aDIwF6d4
	D+iSDumOwuPQ9uWSGINKU6a+6Zu1cXDvZga3XEa+Jmb4NQf5vqhx/bQr3lpy7K55BZ5zAXbgqbxOw
	QDsnB/MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryAP-00000005uOn-09La;
	Thu, 06 Aug 2026 13:29:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryAM-00000005uO8-3iBV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 13:29:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACE9E153B;
	Thu,  6 Aug 2026 06:29:40 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1BDEB3F632;
	Thu,  6 Aug 2026 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786022984; bh=qUYUxyNO/1qrdP120om8w13u9cf1VJmN6mJ8n573ID4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W3lavI9zrwMV5BbS/fEmNjD13IDeYgwit7JYBlEnviiw1f77dK3xHXQ6aO0eAuu3S
	 Gys46ivyd6NVkwPxNsUNPdkMgR2llZ0M7fhXdbCWvKzso1m4r84QzyFRh3dgvgXyCt
	 GKBlctmmxQZh9ciXXIW70iwSa27QTACdlfdn2tDc=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	mike.leach@arm.com,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com,
	jie.gan@oss.qualcomm.com
Subject: Re: (subset) [PATCH v9 00/13] fix several inconsistencies with sysfs configuration in etmX
Date: Thu,  6 Aug 2026 14:29:31 +0100
Message-ID: <178602286291.39110.11955703681463115404.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725113645.57519-1-yeoreum.yun@arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_062946_963347_E10BAA76 
X-CRM114-Status: GOOD (  10.03  )
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


On Sat, 25 Jul 2026 12:36:32 +0100, Yeoreum Yun wrote:
> The current ETMx configuration via sysfs can lead to the following
> inconsistencies:
> 
>   - If a configuration is modified via sysfs while a perf session is
>     active, the running configuration may differ between before
>     a sched-out and after a subsequent sched-in.
> 
> [...]

Hi Levi,

I have applied the fixes from this series to coresight/next. I won't be able to
pick up the rest without the Acks from Mike/Leo and it is too late for this
pull request. So, will pick the rest in the next cycle. Apologies.

thanks!

[01/13] coresight: etm4x: fix wrong check of etm4x_sspcicrn_present()
        https://git.kernel.org/coresight/c/be090fdfd4a6
[02/13] coresight: etm4x: fix underflow for usage of (nrseqstate - 1)
        https://git.kernel.org/coresight/c/bfe75e265efe
[03/13] coresight: etm4x: fix leaked trace id
        https://git.kernel.org/coresight/c/177a963da47e
[05/13] coresight: etm4x: missing cscfg_csdev_disable_active_config() in perf enable
        https://git.kernel.org/coresight/c/a1b49a640b19
[12/13] coresight: etm4x: remove redundant fields in etmv4_save_state
        https://git.kernel.org/coresight/c/b335d4ae1c73

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

