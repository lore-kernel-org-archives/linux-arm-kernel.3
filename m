Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B507ACCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNi1nCJeDW+39zicC65TF184K4YXPWQUk7FP1hL2x8c=; b=M85RQquwMUPG7UcLnccOnudxj3
	pIkJYWEgd6Juh099bl9lkfdj4bBDUhCdBgoCjWCxTK7LMXFs/th2XZv37Ci2y5wj6HDBhHXpsRLsa
	fxG/m3Zn6/8oIwor+r8XtXgw9l0tll/DLK8aTInftFrySESz6wLpXmHQAxQdHR3XvgZ29Z/+9LIqa
	YBggwJCY7RjuYQR/L3FMMqkX87YWy371VFb/yUoKGGDlLDiFVTsRFTID0Kltv+N3HJmIhbvYJOlx9
	+fn8+8SHk9R5hK55uhrZFge+6Ujphr54ima3Ex3pPg/ej3dWM8DBArM6WICl52UWZSHrqTmlNy/eM
	STpvoMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v407W-00000008akk-2rBH;
	Wed, 01 Oct 2025 16:56:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v407U-00000008aj1-1SUR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 16:56:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38BDB16F8;
	Wed,  1 Oct 2025 09:55:49 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D811A3F59E;
	Wed,  1 Oct 2025 09:55:56 -0700 (PDT)
Date: Wed, 1 Oct 2025 17:55:54 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 10/31] coresight: etm4x: Reuse normal enable and
 disable logic in CPU idle
Message-ID: <20251001165554.GR7985@e132581.arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-10-ea49e91124ec@arm.com>
 <CAJ9a7Vgk0Pj5c9AJBKa+wBNNZR6a7RCTUWqW0Trvksvt6fCBXg@mail.gmail.com>
 <20251001102551.GM7985@e132581.arm.com>
 <CAJ9a7VjYLXk4bx7gWFpQe=1TLQ0Ks8d7m-jrUnuwaLMonW3gwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VjYLXk4bx7gWFpQe=1TLQ0Ks8d7m-jrUnuwaLMonW3gwQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_095600_426315_AC69E61D 
X-CRM114-Status: GOOD (  11.08  )
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

On Wed, Oct 01, 2025 at 01:15:01PM +0100, Mike Leach wrote:

[...]

> If the firmware is PSCI compliant there is no need to save/restore the
> context within the kernel driver if the external claim bit is set?

Yes, this is my conclusion.

A strong reason is that an external debugger should work even without
the ETM driver.

In the current implementation [1], the ETMv4 driver saves and restores
the claim bit only in sysfs or perf modes, which means it does not
serve the case where an external debugger has already claimed the
device.

Thanks,
Leo

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hwtracing/coresight/coresight-etm4x-core.c#n1940

