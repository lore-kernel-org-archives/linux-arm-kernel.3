Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA7E10F9963
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 17:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8579LojzXUeG5eGrUwJF6KJy2hcA0t4Q1ceyHM71DBk=; b=PjDidshvzmiYG+KTkcVqz7BBao
	h+PBHUWVC33MHkGef0AVwDt1BHcVqM6MItMY88aisJfYz7da7t7lSoxNm3RgmnBTBmQ+4OJcXTQD4
	xCdNsCG6+skSwfYqbFBfMj92EWJV3ZqTVTsKItMNycprrmWrOdXBCKqOX0Iu1cpXK6gIgCTBRK05w
	k99VrrPV33IBkTbnfkyONR5NwV6brWVL7MQRXuDNELXgnpySjJFVoeDxOYIhVE4Fcgt/cHluMygXt
	YAobBr0mN2EVZ/GPlTpefiAeOHTZQutf88kOLJa1CmF8WoNdTRcnYEc7DCQRfwP5uVGTQednJAuWn
	qVaBGMEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWsT-00000009CR6-1JVy;
	Wed, 08 Apr 2026 17:39:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWsR-00000009CQl-2n4y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 17:39:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A25C168F;
	Wed,  8 Apr 2026 10:39:35 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F37303F641;
	Wed,  8 Apr 2026 10:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775669981; bh=ALfN8sj+HH6bXZAeyqff24KoV6WqUskFI0gXhzKFigc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LTe5SdYmUB1zPKdPhmyrC8g7KTHZy6+6UGwMYrAXXxkv+J/8KKSQbf0Ld7LuF0C8A
	 iuk+bz5jcLIY1baa2KLMjQLTOzsMYwwago16aCkvPSEMjLZofARg3DwrZmzAyVkoxc
	 hZqzUBYGMAOBIbaNYctcEm8BPVwyCbwaInku7Rkk=
Date: Wed, 8 Apr 2026 18:39:37 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, mike.leach@linaro.org,
	james.clark@linaro.org, alexander.shishkin@linux.intel.com,
	leo.yan@arm.com
Subject: Re: [PATCH 1/2] coresight: etm4x: fix inconsistencies with sysfs
 configration
Message-ID: <adaS2YNppLFMzKbv@e129823.arm.com>
References: <20260317181705.2456271-1-yeoreum.yun@arm.com>
 <20260317181705.2456271-2-yeoreum.yun@arm.com>
 <f62c7138-bddc-4bf1-932d-bafa683f5ee0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f62c7138-bddc-4bf1-932d-bafa683f5ee0@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_103943_766462_0F896D30 
X-CRM114-Status: GOOD (  10.66  )
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

Hi Suzuki,

[...]

> >    - config, which stores the settings configured via sysfs.
>
> While we are at it, should we stop using the drvdata->config for the
> "capabilities" for the ETM (e.g., TRCSSCSRn in ss_status ?) Instead
> we could save it in "drvdata->ss_status". This keeps everything
> separated:

Hmm, if we think the drvdata->ss_status as "capabilities",
I think we doesn't need to save/restore ss_status in
etm4_disable_hw()/etm4_enable_hw() since cpu idle doesn't use both
and other bits (STATUS and PENDING) should be cleared when new session
is started regardless of perf or sysfs mode.

Am I missing something?

--
Sincerely,
Yeoreum Yun

