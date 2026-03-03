Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EB9EB362F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 17:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pW8i3ecTzLigNWsgCAmHAzxmF9ikQnfEReyuhWUY+K8=; b=4Fhoex9C0tYEjsXKpwopGoS1d2
	ko16eAy8nJ7c78oJpMEcGEdYHUYmThHgxbq7cX9FkdK2+WQLdpAEnf6/IMtqbhOC89YMBhGPq8u0v
	f0uwmPb8brjY0L5E1BPTTccoagyz1winyHKERBKrTE/HF/kN5nemYBedMv7pMkRn3nKkNHRQ47q0i
	979YW5EDDlQU06LQpEBTmMC1ta7ygbaCSwfdXyNjjAFbzIltnt0AIkIcCMga63a6jhNTbJzaPbs8T
	+XTIPiOCAFBdOEcf/S29do6aIOozyks9/VGEDgEzDosjA2eQ29XrWwuMJeDfg9jjVfWo6zl0FX6W8
	TJkaZspQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTxW-0000000Fg2a-0W9O;
	Tue, 03 Mar 2026 17:55:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTxU-0000000Fg2A-35M8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Mar 2026 17:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pW8i3ecTzLigNWsgCAmHAzxmF9ikQnfEReyuhWUY+K8=; b=WC/fI0TaQfPkylGpnXrkEzYaTq
	fUalBqJFrV0tHYiRtG4LpsqUV2Cvzbwaze5L2sdio1LiSbvUK2xR0x6ZM2kjffO5TAzhSNnfHxSs6
	Miz9Uy/emfEyvNW6Zjn4IPx31hO2/nVTvzv5ZiKe0pvCHwv9KkgCvp+KxlaT9lHKZhOqtjCPTTggu
	F5vKPbS/1EtpDZyC539/DaCYao37TZxFJLDnCs3myWSApuiwNnKBrGQ8OBBkgYsAfKSNSmtjKQvIV
	5ELjAChkbdPmiy4v4adj4jj71+G+cbrKxkM1w7b04Y/W5rFTbk9JNns1JhZsDe7uS0KSCGVyfl1SN
	mQhemBGQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTxR-0000000333e-1sYE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 17:54:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8D93339;
	Tue,  3 Mar 2026 09:54:47 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E3313F73B;
	Tue,  3 Mar 2026 09:54:52 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Tingwei Zhang <quic_tingwei@quicinc.com>,
	Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Yabin Cui <yabinc@google.com>,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] coresight: cti: Miscellaneous fixes and CPU PM cleanup
Date: Tue,  3 Mar 2026 17:54:39 +0000
Message-ID: <177256045461.1800471.17379041463406556003.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226-arm_coresight_cti_refactor_v1-v2-0-b30fada3cfec@arm.com>
References: <20260226-arm_coresight_cti_refactor_v1-v2-0-b30fada3cfec@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_175457_701413_1B465E8B 
X-CRM114-Status: GOOD (  10.43  )
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


On Thu, 26 Feb 2026 09:23:48 +0000, Leo Yan wrote:
> The CPU power management issue in the CTI driver was first observed in
> series [1]; this series resolves that issue.  It fixes bugs and removes
> CPU PM operations from the CoreSight CTI driver, the goal is to use the
> CoreSight core layer as the central place for CPU power management.
> Removing CPU PM from CTI driver can avoid conflicts with the core layer.
> 
> This series can be divided into:
> 
> [...]

Applied, thanks!

[1/8] coresight: cti: Make spinlock usage consistent
      https://git.kernel.org/coresight/c/ef7d4aaf6867
[2/8] coresight: cti: Fix register reads
      https://git.kernel.org/coresight/c/6582fe69ac4b
[3/8] coresight: cti: Access ASICCTL only when implemented
      https://git.kernel.org/coresight/c/b4d9ef475ec7
[4/8] coresight: cti: Remove CPU power management code
      https://git.kernel.org/coresight/c/59213b4be5c1
[5/8] coresight: cti: Rename cti_active() to cti_is_active()
      https://git.kernel.org/coresight/c/b727e7bba3ff
[6/8] coresight: cti: Remove hw_powered flag
      https://git.kernel.org/coresight/c/daedb30fd6ac
[7/8] coresight: cti: Remove hw_enabled flag
      https://git.kernel.org/coresight/c/d5e57babdffb
[8/8] coresight: cti: Properly handle negative offsets in cti_reg32_{show|store}()
      https://git.kernel.org/coresight/c/9c5ef7a30d90

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

