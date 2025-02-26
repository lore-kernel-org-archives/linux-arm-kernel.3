Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137EAC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 10:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhhllZDu/cXWKatsIA+MbWCXpKHiEFCJB9aePygrmrc=; b=D5haNN/2C3t66xKJVKQKG2Xvby
	Bxu52UMAJNcl34qwlWK+c+q5PakI354SRdG1hw5M4wjUrYe0V4K7NiDKLirb0xohfBfTQLO8GMc5R
	U1R3f5vE9gGksDCsptoXDKSDJzdJ4cVFfvrRgpk9sXbiiBvds3Ha+0hRTWdm99qo3HokA56zoI/Lz
	ZWHwRaEKrQkzqGYlFvg14/myzfUH4xZKwBecPdBSXo1CATb1Dvvt5uMfwbOjKzS+cxIO58u9kBYUh
	Df81vwAecB3PLb1sh853ZMW7poAaTomOhKSn2523HtjpnIX4j0wwWHeXW6E+ZYDYZQMllKQ384PTG
	Xp2OlK7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEsf-00000003LCE-3rLL;
	Wed, 26 Feb 2025 10:43:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEcQ-00000003Ht2-0rQy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 10:26:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F1121BA8;
	Wed, 26 Feb 2025 02:26:35 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 40F503F6A8;
	Wed, 26 Feb 2025 02:26:18 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	kernel@quicinc.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] coresight-etm4x: add isb() before reading the TRCSTATR
Date: Wed, 26 Feb 2025 10:26:09 +0000
Message-ID: <174056556176.1596152.13438853429197428752.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116-etm_sync-v4-1-39f2b05e9514@quicinc.com>
References: <20250116-etm_sync-v4-1-39f2b05e9514@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_022622_284594_25E1C611 
X-CRM114-Status: UNSURE (   9.01  )
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


On Thu, 16 Jan 2025 17:04:20 +0800, Yuanfang Zhang wrote:
> As recommended by section 4.3.7 ("Synchronization when using system
> instructions to progrom the trace unit") of ARM IHI 0064H.b, the
> self-hosted trace analyzer must perform a Context synchronization
> event between writing to the TRCPRGCTLR and reading the TRCSTATR.
> Additionally, add an ISB between the each read of TRCSTATR on
> coresight_timeout() when using system instructions to program the
> trace unit.
> 
> [...]

Applied, thanks!

[1/1] coresight-etm4x: add isb() before reading the TRCSTATR
      commit: 5bb4fbbcaa3a66c0fd9347a19e6dae86a48e63ab

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

