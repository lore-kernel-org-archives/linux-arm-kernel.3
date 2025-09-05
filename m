Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD6CCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 16:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MM6C6fKz+ychmHiBWGGK2ZwGhv7+gc0IMlNp8J1Tx7w=; b=HJSMzGjBQvf3NLCduvlrXq349m
	sbMCPfKw8cxHvuCJVqG3V0Jv5tLaT6mkT9lmpPeh2P941kwNYHJBTFOBfRa2ERq/FdmNE+kdUybTv
	Wl701zIWexR2w1sfA3ueLVYsHj86bYJ4Xg1pXakoqvXWk1jRLAXedYywxUZOTFKiCCZZmFYX/0xbG
	s/Q2HAF8kWH5QivWkaZVjpI77hLG+IkkVeH+GuKedPhnHuhr9CsRonkOFHjBis3NExSvrT5a4rnuX
	Etr97LqAgQM0sb6kGr608oF9t2hhjN/Bbe/G//HaKuJZV3Z+SeIda/fdSuRaG79BuKPokAcpNq1uf
	IHgBs6vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYxr-00000002zWw-1oYS;
	Fri, 05 Sep 2025 16:07:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuVWb-00000001gYm-2xz3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 12:26:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3369153B;
	Fri,  5 Sep 2025 05:26:32 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 976693F63F;
	Fri,  5 Sep 2025 05:26:39 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tamas Zsoldos <tamas.zsoldos@arm.com>
Subject: Re: [PATCH v2] coresight: trbe: Return NULL pointer for allocation failures
Date: Fri,  5 Sep 2025 13:26:30 +0100
Message-ID: <175707517468.1603863.4031069288262415474.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904-cs_etm_auxsetup_fix_error_handling-v2-1-a502d0bafb95@arm.com>
References: <20250904-cs_etm_auxsetup_fix_error_handling-v2-1-a502d0bafb95@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_052641_787661_BE620BD8 
X-CRM114-Status: UNSURE (   9.78  )
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


On Thu, 04 Sep 2025 15:13:52 +0100, Leo Yan wrote:
> When the TRBE driver fails to allocate a buffer, it currently returns
> the error code "-ENOMEM". However, the caller etm_setup_aux() only
> checks for a NULL pointer, so it misses the error. As a result, the
> driver continues and eventually causes a kernel panic.
> 
> Fix this by returning a NULL pointer from arm_trbe_alloc_buffer() on
> allocation failures. This allows that the callers can properly handle
> the failure.
> 
> [...]

Applied, thanks!

[1/1] coresight: trbe: Return NULL pointer for allocation failures
      https://git.kernel.org/coresight/c/811e07b1812a

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

