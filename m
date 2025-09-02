Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA9BCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 09:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjBWijmYaJmPNjRCC4Fe2sy17ZU7rqeLTN2NPQSfPhM=; b=qk8oSaybusnBs0a3JwwgVc6Sbw
	BIPAsEERYlOvTAFCc0PBqhGQ3XBExbzXB/oB0ZUEi4eZ/CdgeMfOjpkkJ7FsacCqoEhqipqM+dK2c
	I3CjhfRr+723rzwAYN4pqK4HRTJ3T/oYYB/U0AstQwhWpzxIYNld0vom8giKT/8sBi4FRNkKDBbJ0
	Vh9C2OCSaKILhU9ISCHly/g62j56ba5ME/ag2hXDlmNmXg/pcTNzbG9lfYojXPmp84KfQqmClW8DW
	eHOnSxXCZjs3hlgCb5M3JWuSdLNLjratC4wYx8zk+IdWdxn+B1K/s644ieRk77sz/LYuyxSadY8H7
	oQlMKfLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNUO-0000000GRP2-1SsX;
	Tue, 02 Sep 2025 09:39:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMz3-0000000GGTC-0rY8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:07:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 333F215A1;
	Tue,  2 Sep 2025 02:07:12 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 47A313F694;
	Tue,  2 Sep 2025 02:07:19 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	kernel@oss.qualcomm.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight-etm4x: Conditionally access register TRCEXTINSELR
Date: Tue,  2 Sep 2025 10:07:07 +0100
Message-ID: <175680388753.1463011.11768877299078508774.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250812-trcextinselr_issue-v2-1-e6eb121dfcf4@oss.qualcomm.com>
References: <20250812-trcextinselr_issue-v2-1-e6eb121dfcf4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_020721_302902_4E6CC16E 
X-CRM114-Status: UNSURE (   9.33  )
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


On Tue, 12 Aug 2025 01:24:45 -0700, Yuanfang Zhang wrote:
> The TRCEXTINSELR is only implemented if TRCIDR5.NUMEXTINSEL > 0.
> To avoid invalid accesses, introduce a check on numextinsel
> (derived from TRCIDR5[11:9]) before reading or writing to this register.
> 
>

The patch looks good to me. May be we could expose this via sysfs, like we
do for the other fields. That can be a separate patch without the Fixes tag.

I have applied this patch to -next, thanks!

[1/1] coresight-etm4x: Conditionally access register TRCEXTINSELR
      https://git.kernel.org/coresight/c/fa71e9cb4cfa

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

