Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CAAFEEF25
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 11:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CuLeTtvT3GjvVVNwMnwWMByeN7EjEVLRyOUgniz2r0=; b=XDqgHsz63xlVDCitW8cJ/BqUBZ
	AUDInnJdeqky485FK0/Jglgydp0nXudHoTjTb7FgYvGXQW8t/WFWYTrozZbEcuJ/ZII/KJWTUqnc3
	uSRnl2wpYGXNmLBAD7rVZ9Fv37Ct1xrD6GF3rvO+AyvubsRUc9Gb4WSaAuJb+qmtruUt/5Loe+1uf
	16AkE6vSvEAHeQ1t7bki/nRUNcZs27i1ZKfQS4It176HOLWkCcD5fnsdLEpWJLPHRCnWi4bOPWGxu
	+dgOJYN2zL7fgJm/a3PjTnzhtOfz7qSwxLaQwQOdUMj7lRqKnHsfXeKHJZ4FgQv7Ym7kEVfrJVK7r
	HOT0halg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4j9-00000006NaV-2Qzg;
	Tue, 07 Apr 2026 11:36:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4j6-00000006NZO-3J4W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 11:36:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00352169C;
	Tue,  7 Apr 2026 04:36:05 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 350743F7D8;
	Tue,  7 Apr 2026 04:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775561770; bh=nayhVzr5ciyRQpEQKWHAPrD4Jml22u6Yb0pT2hQdYrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y6cQDpvmQ1WW6pVdCSEM72XV0lPuojvaKSo9/IoQsVNIRFPeGlzl7XCzMUl6vAJuW
	 oC8H6no8IMjdcYYXmUd1U8AUTUH5Pn4+dtFM0RL1KzpBCOtqLV01MJV0IHlHW7FjF4
	 0wmjjTQbuWPHWURvp/odYCDeYOqvRAiSJZdB2BHw=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: tpdm: fix invalid MMIO access issue
Date: Tue,  7 Apr 2026 12:35:57 +0100
Message-ID: <177556174642.3767032.16186463912274149775.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407-fix-potential-issue-in-tpdm-v2-1-1d0e0d3cb793@oss.qualcomm.com>
References: <20260407-fix-potential-issue-in-tpdm-v2-1-1d0e0d3cb793@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_043612_949065_C80B7C61 
X-CRM114-Status: UNSURE (   8.40  )
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


On Tue, 07 Apr 2026 19:09:05 +0800, Jie Gan wrote:
> Create the csdev_access struct only when a valid MMIO resource is
> available. In tpdm_probe(), base is uninitialized for static TPDM
> instances that lack an MMIO resource, causing csdev_access to be
> created with a garbage address.
> 
> So far there has no register access for static instance, but this
> change helps mitigate potential risks in the future.
> 
> [...]

Applied, thanks!

[1/1] coresight: tpdm: fix invalid MMIO access issue
      https://git.kernel.org/coresight/c/971f3474f889

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

