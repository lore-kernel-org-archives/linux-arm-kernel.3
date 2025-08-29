Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29977CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KX4Ho7NlLYmT5q70+3crlL1ZgAXMiGTduMFVx1rAlo=; b=bIQnTqGSsQx8azQG+tKrTYVqCo
	dkNAwWqWUKzGnMOwgErLFk+t1857IHRq5nlsmzUQ+3ZdPfgIvBhSTtVdr/3LdwyYc/yMiJEggBiIK
	9GP3DUqgEyRln1p1j1so0P28nufcv3COfhEVyER1S3L8fDmWlhhbzoP+tAicE8/2ciJW1LHrLdIOn
	6VSKFqjmWOScqBK3lipHyX5dRyRaPUf1yviz7x9Du7xmYOJQUn1SBvuajDIoZzysE8pCu/Csxv1kK
	+XV7sQUbhN+le9dghBGepYp9fburg2Bps/pQnIP12lTEJ5jAr9dClaRJ0MO24NH+U0iT5Q4k5j/7x
	a8zRkntA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urve1-00000005Bm9-0yUt;
	Fri, 29 Aug 2025 09:43:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urufh-000000050WN-3YlU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 08:41:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F32D61BCB;
	Fri, 29 Aug 2025 01:41:12 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE35B3F694;
	Fri, 29 Aug 2025 01:41:20 -0700 (PDT)
Date: Fri, 29 Aug 2025 09:41:18 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	kernel@oss.qualcomm.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
Message-ID: <20250829084118.GG745921@e132581.arm.com>
References: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
 <20250828-itnoc-v3-3-f1b55dea7a27@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-itnoc-v3-3-f1b55dea7a27@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_014121_930934_F3CC740D 
X-CRM114-Status: UNSURE (   9.00  )
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

On Thu, Aug 28, 2025 at 02:27:24AM -0700, Yuanfang Zhang wrote:
> This patch adds runtime power management support for platform-based
> CoreSight Interconnect TNOC (ITNOC) devices. It introduces suspend and
> resume callbacks to manage the APB clock (`pclk`) during device runtime
> transitions.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

