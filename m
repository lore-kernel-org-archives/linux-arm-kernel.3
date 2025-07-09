Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2FCC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 12:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fGuJOnB6fXJH/jspPCnNSjmv/iknMolQCaYOa2OWPg=; b=hkC4qsGXHqlqrT5arBZ44xSHsT
	alOLG8Lvvj3NX/U/yP1YtCfMxKkq3Y1CpOzagoqgso2Y0FziyHiOzUV791ev7QjUV4XhNyLe+mmRB
	Pp2ivV/WmCjMY4qQgh01qSnUKVhehBH2Dc3DQEsgyQSQOFTgbCIV38ovhmZtAFOAj/RyTz0LD0AE3
	9pdaR1qByz/UjGb0xq9ib9PkAXxBUDfu0pYLLjVGQA3eqAdjfBsbHLkrc32KUosqRxnWwrOd1SX1d
	D+ImpTqBKEK3CqD4LUuh6XnH1TFd9bXvYQrt9ebyTPiiNhdISO1k5OSW7vefpKGuefJFHsc6MoD8E
	d12eBBNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTjo-00000008bSs-1Sen;
	Wed, 09 Jul 2025 12:17:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZS4y-00000008JLL-0JOV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:31:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02059153B;
	Wed,  9 Jul 2025 03:30:56 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 19D1C3F694;
	Wed,  9 Jul 2025 03:31:05 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH] coresight: Fix missing include for FIELD_GET
Date: Wed,  9 Jul 2025 11:30:56 +0100
Message-ID: <175205704483.263858.2108474286820746939.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707-james-coresight-bitfield-include-v1-1-aa0f4220ecfd@linaro.org>
References: <20250707-james-coresight-bitfield-include-v1-1-aa0f4220ecfd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_033108_157879_F1FF7D9F 
X-CRM114-Status: UNSURE (   6.60  )
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


On Mon, 07 Jul 2025 10:55:27 +0100, James Clark wrote:
> Include the header for FIELD_GET which is only sometimes transitively
> included on some configs and kernel releases.
> 
> 

Applied, thanks!

[1/1] coresight: Fix missing include for FIELD_GET
      https://git.kernel.org/coresight/c/82e20f5e

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

