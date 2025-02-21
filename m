Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86492C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 16:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0OwVQQlP9h/wFIRWZkPHyw5WKxLN+3Z8z88Z+lki38=; b=H26XJOPgpHKHxbMuSOkjL/oeqf
	jN7cFpagIPsH6MD+gg3gJBevpIUzkMyNceL/NkmGUA0Rj8DuyzCVQ9SvrgLglf6VkIYdeT0CrLLJd
	ykAud0OvQte9Puitl6rq24WfThoEHSoxx//yC7RWkLmyC0M/UsNzogbXQPgeTNnwy1obK619kLZzI
	k8pJ3cWp0UWpJW4dJ1ap6cDJKl6e0PPc2zSVKpTlSp92s+bgnoPpygY6DAhVQoAe78fNwN9uZCw0i
	hXRTfCouFOibZFYgicSJy6k9SpK1ND424AmqtTndCWlESapSWnG/qY10/JPO5+MVGtPPCrbO1laRZ
	WABFPyxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVeO-000000067Ig-3NYO;
	Fri, 21 Feb 2025 16:13:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVct-000000066nq-2OAR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 16:11:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 691C9168F;
	Fri, 21 Feb 2025 08:12:00 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 846A43F5A1;
	Fri, 21 Feb 2025 08:11:41 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	James Clark <james.clark@linaro.org>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH] coresight: catu: Fix number of pages while using 64k pages
Date: Fri, 21 Feb 2025 16:11:34 +0000
Message-ID: <174015423971.1326003.7421875844813609772.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109215348.5483-1-ilkka@os.amperecomputing.com>
References: <20250109215348.5483-1-ilkka@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_081143_650495_042E7554 
X-CRM114-Status: UNSURE (   7.63  )
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


On Thu, 9 Jan 2025 21:53:48 +0000, Ilkka Koskinen wrote:
> Trying to record a trace on kernel with 64k pages resulted in -ENOMEM.
> This happens due to a bug in calculating the number of table pages, which
> returns zero. Fix the issue by rounding up.
> 
> $ perf record --kcore -e cs_etm/@tmc_etr55,cycacc,branch_broadcast/k --per-thread taskset --cpu-list 1 dd if=/dev/zero of=/dev/null
> failed to mmap with 12 (Cannot allocate memory)
> 
> [...]

Applied, thanks!

[1/1] coresight: catu: Fix number of pages while using 64k pages
      https://git.kernel.org/coresight/c/0e14e062f5ff

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

