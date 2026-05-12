Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02638CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 15:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hhFUHPWt/+8SYU1XLa9T1wSHk5mi3neNcCdCo3bfPI=; b=ujNn5LCf+5tYkthvEgTHi9/36f
	YjAGXHBoQle1p3lPEQFUrcyUCF7PLpQG7+aoC4CT099CCRpnGKah/abCHD3RTUrDYYRk4i2vMHkB4
	1YyzKQVbEi1h6HCcyFexcCaVGCiNFkXdu9ZP1hnSIZNWhD3GW8aSaeAoCHlVL/h6RJSDWMfXOuLKa
	FnGLHCul7LRoIygKsYcIp77hQDB3mYegN/+MxCmnPNEthST2kS11mnfyBKzWx1ZwlK9lXc3+/2E/w
	3XbuEA76sG/6dQ6p5YghyCcpCA12GAlpNgzXwYnbDOKrthnF876OS06vdxxPo4lP7PyC1BEfJjOc+
	iHhKBDYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpE9-0000000HFBV-1a2X;
	Tue, 12 May 2026 15:40:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpE7-0000000HFAa-2Mql
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 15:40:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AE4F16A3;
	Tue, 12 May 2026 08:40:46 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4AEED3F85F;
	Tue, 12 May 2026 08:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778600451; bh=zggyQGwUqgwK0P9M52We8BEHe3ceW2JGTwburz0dNnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HXJ5yq5AdISHKlfXTWFU4sqPNFR96hXuEN3VqMzf0aCv/M//hCtFguQxLJ00Wqcx1
	 scVXvezgsqonRX9TLro6CPSJEmbSot3X3VRzTd7q9c2BDiaw+/IfRmtdChOcd/6vjq
	 s7ecDteLBNpN0NlTzE7aJIBkriWxONrmijoYxozg=
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
	linux-kernel@vger.kernel.org,
	Richard Cheng <icheng@nvidia.com>
Subject: Re: [PATCH v4] coresight: fix missing error code when trace ID is invalid
Date: Tue, 12 May 2026 16:40:35 +0100
Message-ID: <177860040565.1074335.5228610808924665001.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512-fix-trace-id-error-v4-1-eb3de789767a@oss.qualcomm.com>
References: <20260512-fix-trace-id-error-v4-1-eb3de789767a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_084055_638330_93C4B600 
X-CRM114-Status: UNSURE (   7.82  )
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


On Tue, 12 May 2026 09:56:07 +0800, Jie Gan wrote:
> When coresight_path_assign_trace_id() cannot assign a valid trace ID,
> coresight_enable_sysfs() takes the err_path goto with ret still 0,
> returning success to the caller despite no trace session being started.
> 
> Change coresight_path_assign_trace_id() to return int, moving the
> IS_VALID_CS_TRACE_ID() check inside it so it returns -EINVAL on failure
> and 0 on success. Update both callers to propagate this return value
> directly instead of inspecting path->trace_id after the call.
> 
> [...]

Applied, thanks!

[1/1] coresight: fix missing error code when trace ID is invalid
      https://git.kernel.org/coresight/c/f4526ffee6ff

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

