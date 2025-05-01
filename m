Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B602FC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 11:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTdsx9WYxTvilKzP8Dwrp+Q26dH9L26n/SLG50nFh4k=; b=XpUSfNgzJgFNQAE18ZS9+mWsK1
	XD6/9Kr7FiuPMvxUCqQjWfXZOz+eceF+Fw28X/pl8dr221Tptj7QWUTpsgKEZMlFvKA0nWf4TPoK0
	ixvf89uT8NX7JC6ObJnbJT4rK2mgbuS4uL/Wo4K8am8wQcM2rs5A+OMQp2gAkzn9vgcjYRPGoAzPu
	Gl6TieOs7pqVMFv7VCJdIcT3zdgSkH/g5LxK93iOItQwwP7asxyQXpAr6FXbuR+loU1rvnGA/gDjo
	nknp0qwpHwnYG1/CzM52oT8d3njbtedrStak4D7dd+FwunXIt3GQTjnwBG34TX6+lZlDTdEqc0bFZ
	4lOuAWpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASWa-0000000FKQ5-2xxY;
	Thu, 01 May 2025 11:56:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASKh-0000000FJCA-37YO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:44:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75F4F106F;
	Thu,  1 May 2025 04:43:55 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E710A3F5A1;
	Thu,  1 May 2025 04:44:01 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Leo Yan <leo.yan@arm.com>,
	James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] coresight: Add a KUnit test for coresight_find_default_sink()
Date: Thu,  1 May 2025 12:43:48 +0100
Message-ID: <174609979621.109219.15114241709800994823.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312-james-cs-kunit-test-v4-1-ae3dd718a26a@linaro.org>
References: <20250312-james-cs-kunit-test-v4-1-ae3dd718a26a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_044403_830830_EDBCB243 
X-CRM114-Status: UNSURE (   8.58  )
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


On Wed, 12 Mar 2025 10:31:57 +0000, James Clark wrote:
> Add a test to confirm that default sink selection skips over an ETF
> and returns an ETR even if it's further away.
> 
> This also makes it easier to add new unit tests in the future.
> 
> 

Applied, thanks!

[1/1] coresight: Add a KUnit test for coresight_find_default_sink()
      https://git.kernel.org/coresight/c/b104a941

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

