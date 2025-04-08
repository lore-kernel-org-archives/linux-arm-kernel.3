Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAAAC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qy+FnMFK22tbEo44QkGDKl1rq5su70dIJ4pldSqSk/U=; b=QnVxtu5ZCtyLymHsaMdgqlRkwv
	mSFJQr6CWwytauV5MHkD/pHFYB8SaLVNBpUjvOw3cgia3sTEb0A6GIUwO88SeLtShQkGS8AfE5rY6
	75aUKWcgWiqWKnkea6S+x68dNFPKdxPnKSpaRBWhV4OXcAMmL08tjgjjf/fJFW/kp/0iDWwptH6N/
	mKJsTU7khZTMDYXm91T7vZNzkx8Lx5T8YGPZGGey1lomk6VL6XicYttSKssLcUBuJXl8yQIwP8y16
	PkAJtpATIy8ucf61P/vR9H3v2w5EpZDzAwpSJZfmZwk4GzpZzsaioIM7izsAF5EuUfr7oyemvHX9g
	9F/0t/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26iA-00000003mUS-3wEy;
	Tue, 08 Apr 2025 11:01:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u267p-00000003dzB-0Tn0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:24:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A4B61688;
	Tue,  8 Apr 2025 03:24:13 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E03173F6A8;
	Tue,  8 Apr 2025 03:24:10 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	dan.carpenter@linaro.org,
	Huangjie <huangjie1663@phytium.com.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix timeout checks on polling path
Date: Tue,  8 Apr 2025 11:24:06 +0100
Message-Id: <174410781232.2545069.2779905512336783485.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310175800.1444293-1-cristian.marussi@arm.com>
References: <20250310175800.1444293-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_032413_198785_9B14331C 
X-CRM114-Status: UNSURE (   8.32  )
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

On Mon, 10 Mar 2025 17:58:00 +0000, Cristian Marussi wrote:
> Polling mode transactions wait for a reply busy-looping without holding a
> spinlock, but currently the timeout checks are based only on elapsed time:
> as a result we could hit a false positive whenever our busy-looping thread
> is pre-empted and scheduled out for a time greater than the polling
> timeout.
> 
> Change the checks at the end of the busy-loop to make sure that the polling
> wasn't indeed successful or an out-of-order reply caused the polling to be
> forcibly terminated.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Fix timeout checks on polling path
      https://git.kernel.org/sudeep.holla/c/c23c03bf1faa
--
Regards,
Sudeep


