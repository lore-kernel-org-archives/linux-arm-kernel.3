Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905C9C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 17:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdPM0EVwNWtXg3YkdOmG9mIJk07eujs48ZiwP1IPzqo=; b=ZtbCCfSsSo/J6xMl3cxeKiFYVd
	wpwIkKdLrH88gZL/axygCQA4RYrBXp4gYX1ZsEJVqSnKrjlJ5uWQEwSVUJBt/8NMrNP/k9+/73qjm
	fCQVLx9c0VkM9lypxZQ1xFOq3VYIhms9Zne8yQlkIdrbRRDI2uQvVqyvoHFEvXszytx/cSlL67SQC
	Fw0JsJlCo0noXncMncAss3sECp14OzkDqOz5xqz7lshaioND6Narm5m3TBvqJDibB6COXGQSbhsOY
	2sJxlPZxSGxV7dzWIN0byAQnWEHZSBtVIslZ0Vpi8NUiZ+V2dqIsbWr9T4CsuMNUBaY5ydsyZaUzp
	kV4K16nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pDE-0000000ASs8-2VcV;
	Tue, 29 Apr 2025 17:57:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9p9x-0000000ASSL-0VTH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 17:54:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 682B61424;
	Tue, 29 Apr 2025 10:54:13 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E50033F66E;
	Tue, 29 Apr 2025 10:54:18 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: anshuman.khandual@arm.com,
	James Clark <james.clark@linaro.org>,
	Junhao He <hejunhao3@huawei.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxarm@huawei.com,
	jonathan.cameron@huawei.com,
	yangyicong@huawei.com,
	prime.zeng@hisilicon.com
Subject: Re: [PATCH] coresight: Fixes device's owner field for registered using coresight_init_driver()
Date: Tue, 29 Apr 2025 18:54:05 +0100
Message-ID: <174594908200.12068.4532771871795444474.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240918035327.9710-1-hejunhao3@huawei.com>
References: <20240918035327.9710-1-hejunhao3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_105421_203393_01AE818D 
X-CRM114-Status: UNSURE (   7.39  )
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


On Wed, 18 Sep 2024 11:53:27 +0800, Junhao He wrote:
> The coresight_init_driver() of the coresight-core module is called from
> the sub coresgiht device (such as tmc/stm/funnle/...) module. It calls
> amba_driver_register() and Platform_driver_register(), which are macro
> functions that use the coresight-core's module to initialize the caller's
> owner field.  Therefore, when the sub coresight device calls
> coresight_init_driver(), an incorrect THIS_MODULE value is captured.
> 
> [...]

Applied, thanks!

[1/1] coresight: Fixes device's owner field for registered using coresight_init_driver()
      https://git.kernel.org/coresight/c/9f52aecc

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

