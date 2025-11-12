Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98675CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEazmcdbzLcLcJ60AM9hrB88wM2bFR9sZr69NzsNQqQ=; b=YQf0dkZij4uU5vRctA7itdQ/Sq
	+cbpj6NAH/1Pt3LuVk5w5fA4xgGt5eYv2qsZD8iG3EpYZJqZzsCJOHb2uiNGlzEq+q/NYNa7VSIzG
	8FIW7Pltr9Rz3dvzqQLNUxzVxPu0Sm3BmpGB0Ir10HhcJzcrtKCINjVd7oEvWaOA6VUgI6nTMSEyQ
	/LSqppio5tSxfxtcEY9Tubua8660d1O90kuftm5ljG4ejo5Wq2U/4pok7chE3q7diEoqNciLDvpPs
	K8IXxuKFrROTBmeOTsXXnVrpt1AHs5FFIH4VekOQdN7ZmA4fpzbKr27zPprvaTrwyKWhjl81amY4U
	hE4JAN1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9gX-00000008kw2-3D3u;
	Wed, 12 Nov 2025 12:10:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9gV-00000008kvA-0LFz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:10:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 175801515;
	Wed, 12 Nov 2025 04:10:36 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 43C3B3F5A1;
	Wed, 12 Nov 2025 04:10:42 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>,
	Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 00/11] CoreSight: Refactor power management for ETMv3/4
Date: Wed, 12 Nov 2025 12:10:31 +0000
Message-ID: <176294942171.582484.7200845964334648364.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
References: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_041047_169692_7A4DB1DB 
X-CRM114-Status: UNSURE (   7.35  )
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


On Tue, 11 Nov 2025 18:58:34 +0000, Leo Yan wrote:
> This series is extracted from the CoreSight power management fixes and
> refactoring [1], focusing on ETMv3/4 power management.
> 
> This series has been verified on Juno-r2 platform.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com/
> 
> [...]

Applied, thanks!

[01/11] coresight: Change device mode to atomic type
        https://git.kernel.org/coresight/c/693d1eaca940
[02/11] coresight: etm4x: Always set tracer's device mode on target CPU
        https://git.kernel.org/coresight/c/28eee2158575
[03/11] coresight: etm3x: Always set tracer's device mode on target CPU
        https://git.kernel.org/coresight/c/ab3fde32afe6
[04/11] coresight: etm4x: Correct polling IDLE bit
        https://git.kernel.org/coresight/c/4dc4e22f9536
[05/11] coresight: etm4x: Add context synchronization before enabling trace
        https://git.kernel.org/coresight/c/64eb04ae5452
[06/11] coresight: etm4x: Properly control filter in CPU idle with FEAT_TRF
        https://git.kernel.org/coresight/c/1fdc2cd347a7
[07/11] coresight: etm4x: Remove the redundant DSB
        https://git.kernel.org/coresight/c/a5e6f584dab0
[08/11] coresight: etm4x: Remove the state_needs_restore flag
        https://git.kernel.org/coresight/c/d2c051f7a5ed
[09/11] coresight: etm4x: Add flag to retain single-shot status
        https://git.kernel.org/coresight/c/c3d84848bd70
[10/11] coresight: etm4x: Retain sequencer state
        https://git.kernel.org/coresight/c/1b4e911af51c
[11/11] coresight: etm4x: Reuse normal enable and disable logic in CPU idle
        https://git.kernel.org/coresight/c/efdccf6a5118

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

