Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758E8CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMyWamVKzEWPuYp/iPJjMZuT8t44F1WV8f2A4rH/vko=; b=RDqHy2CZNrJzAmK/4S0rtF0FJr
	L1tuUWAwmXtXyyYZ7Pfhnh9PlQ6i6h/ajFKloGfMwU8oVl/leJ8JS31Q5aCLjj7lwf90s/yfe8AIt
	aRiiMV7oUmj+J3XX58tZjyITqegv8gbeoXD8Tupwc36B5JoaOs1FNcOkJhfN1pHcL24apLjuujv9d
	hCgZVxvi7vwLqyv4q5M+RbdnnPsF60NC3QGRLnflxuzeK+fUavpI3pyye8GQo0FvbiTPak03fLVcR
	aynSD+5RlRYlPnEhosh8z2bqhM/81RNcWxAzCs1M9ZJn6Kp0zgkoy7BA/JU24VcZ+FmlzQJrvNqDk
	Vrsb+oWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYpR-00000002w4d-050R;
	Fri, 05 Sep 2025 15:58:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuVOK-00000001dWS-0V3W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 12:18:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4BA8153B;
	Fri,  5 Sep 2025 05:17:56 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A8C223F63F;
	Fri,  5 Sep 2025 05:18:03 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/10] coresight: Fix and improve clock usage
Date: Fri,  5 Sep 2025 13:17:53 +0100
Message-ID: <175707466024.1601998.6971273893151391969.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731-arm_cs_fix_clock_v4-v6-0-1dfe10bb3f6f@arm.com>
References: <20250731-arm_cs_fix_clock_v4-v6-0-1dfe10bb3f6f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_051808_199234_2B46206A 
X-CRM114-Status: GOOD (  10.62  )
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


On Thu, 31 Jul 2025 13:23:36 +0100, Leo Yan wrote:
> This series fixes and improves clock usage in the Arm CoreSight drivers.
> 
> Based on the DT binding documents, the trace clock (atclk) is defined in
> some CoreSight modules, but support is absent. In most cases, the issue
> is hidden because the atclk clock is shared by multiple CoreSight
> modules and the clock is enabled anyway by other drivers. The first
> three patches address this issue.
> 
> [...]

Applied, thanks!

[01/10] coresight: tmc: Support atclk
        https://git.kernel.org/coresight/c/cbcf4373629d
[02/10] coresight: catu: Support atclk
        https://git.kernel.org/coresight/c/d2d97e8a0700
[03/10] coresight: etm4x: Support atclk
        https://git.kernel.org/coresight/c/7787ef97c205
[04/10] coresight: Appropriately disable programming clocks
        https://git.kernel.org/coresight/c/e0e41ef8c77c
[05/10] coresight: Appropriately disable trace bus clocks
        https://git.kernel.org/coresight/c/f4eb5567107c
[06/10] coresight: Avoid enable programming clock duplicately
        https://git.kernel.org/coresight/c/7529307188a1
[07/10] coresight: Consolidate clock enabling
        https://git.kernel.org/coresight/c/3fd383a81052
[08/10] coresight: Refactor driver data allocation
        https://git.kernel.org/coresight/c/e95ed1a3434e
[09/10] coresight: Make clock sequence consistent
        https://git.kernel.org/coresight/c/8d4432949012
[10/10] coresight: Refactor runtime PM
        https://git.kernel.org/coresight/c/70104caa4f29

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

