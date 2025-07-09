Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4624FC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 11:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMWIaFm/5yff1nzoictguLu40XmUqEc93eVa7OG2mmw=; b=PF51WbajGNfwpM3ZE8Ib1g15qS
	NYWoUy3lSX3aAbPLtG2zXBdJhntzxKfiZGfFdTasSqE3W4Y26GLryZLESBK1RTKbic0Z4whH7RM8N
	g57lcrmC7zM6Rs1YChvrhT0HqD50GQ6e6ULcIobq8/UB05htGVrwV+nHDyz21mKwWOFhURrkBQHS+
	ucgRlGvVAIrXapf5cao1MvHWiikIU0siTlUMwUIeXNMY2waWAgZ45zhvbNThW7SGVLZPi4XQ7YKCV
	MTxFOCBgAyGi6OwMY75xCszsV9UiEILCKvdIFSo//f1csw9Qb9FQdscV6Fg6Ve8Ht1aJx227XX+FK
	CaP07mIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZT92-00000008WYv-3efo;
	Wed, 09 Jul 2025 11:39:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRd0-00000008E5I-3PDr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:02:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99E881655;
	Wed,  9 Jul 2025 03:02:00 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 28E383F694;
	Wed,  9 Jul 2025 03:02:11 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Marc Zyngier <maz@kernel.org>,
	James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: trbe: Add ISB after TRBLIMITR write
Date: Wed,  9 Jul 2025 11:02:03 +0100
Message-ID: <175205529062.223753.14752038288806898687.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609-james-cs-trblimitr-isb-v1-1-3a2aa4ee6770@linaro.org>
References: <20250609-james-cs-trblimitr-isb-v1-1-3a2aa4ee6770@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_030214_887480_CAA6E5F2 
X-CRM114-Status: UNSURE (   7.96  )
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


On Mon, 09 Jun 2025 11:19:05 +0100, James Clark wrote:
> DEN0154 states that hardware will be allowed to ignore writes to TRB*
> registers while the trace buffer is enabled. Add an ISB to ensure that
> it's disabled before clearing the other registers.
> 
> This is purely defensive because it's expected that arm_trbe_disable()
> would be called before teardown which has the required ISB.
> 
> [...]

Applied, thanks!

[1/1] coresight: trbe: Add ISB after TRBLIMITR write
      https://git.kernel.org/coresight/c/ba3264a1

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

