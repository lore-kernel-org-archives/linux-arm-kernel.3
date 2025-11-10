Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CDCCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Ia5jXSv500YuYMFtwKqSO8PMeenzvtfjJOnj24NwTQ=; b=Q0mY5AuhMxnX1BLTOZs4NSO02x
	6t5MmLhnQ2BfxVOp9mo1G8bFw3MJb+2zq2nC8HMHq1Ciada07IA5pm6A4AaoORItKLL/EhwDxL8ei
	nXgOiyfWmiHv/XMY83qimw63FYwSext4+Ye63VHNBxhWJJw8zYvn8NGvGOK7Exkk8pZa4E88OPMAv
	xc4YdjJQ92RCJEGIQgUUybOUPtqHiYXUhrhMrOZ124d8uC9d2ptGhifwgyYB+q+cEmN6LEd9PdIIg
	Fs9wnX0hNPMZHRjrDC1oD8YL/pjTCNQuopwmdq1f+805dZ/gBeajYpuC5V6AzPMTbmFb+WxavksLn
	AZyDXTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOxS-00000005AdG-1mAE;
	Mon, 10 Nov 2025 10:17:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOxQ-00000005Acm-0tZf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 10:17:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 870C72B;
	Mon, 10 Nov 2025 02:16:57 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D100E3F66E;
	Mon, 10 Nov 2025 02:17:03 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v2 0/3] coresight: replace the void pointer with coresight_path pointer
Date: Mon, 10 Nov 2025 10:16:55 +0000
Message-ID: <176276979719.511921.7702735480657824829.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925-fix_helper_data-v2-0-edd8a07c1646@oss.qualcomm.com>
References: <20250925-fix_helper_data-v2-0-edd8a07c1646@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_021708_293677_2A06FACE 
X-CRM114-Status: UNSURE (   8.26  )
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


On Thu, 25 Sep 2025 18:42:30 +0800, Jie Gan wrote:
> Patch 1:
> Fix the issue that the catu cannot correctly read the handle of the AUX
> event which is caused by the commit[1].
> 
> [1] 080ee83cc361 ("Coresight: Change functions to accept the coresight_path")
> 
> Exeception call trace:
>      tmc_etr_get_buffer+0x30/0x80 [coresight_tmc] (P)
>      catu_enable_hw+0xbc/0x3d0 [coresight_catu]
>      catu_enable+0x70/0xe0 [coresight_catu]
>      coresight_enable_path+0xb0/0x258 [coresight]
> 
> [...]

Applied, thanks!

[1/3] coresight: tmc: add the handle of the event to the path
      https://git.kernel.org/coresight/c/aaa5abcc9d44
[2/3] coresight: change helper_ops to accept coresight_path
      https://git.kernel.org/coresight/c/94baedb51dea
[3/3] coresight: change the sink_ops to accept coresight_path
      https://git.kernel.org/coresight/c/b139702a8896

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

