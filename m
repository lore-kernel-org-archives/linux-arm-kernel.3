Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADA9C79FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fJEJEo2SkVkarhQKatGGiziOTWvAzqRRhI9UMuc16k=; b=vefR11tLK7uRfrcu4tIPoKXlxL
	iTEezT1bHFZ+MXnuHAD4XzTtfl8Gq+XmCDjqeY4kYyO8sw3m/kL8MY4ZeVuoq37OeeGyOO3vck0E0
	WEdDHBUbIGN1nPiGrryq8W4hwofstjqk3zWTsmW6GW0N9BWttyPpOyliZTpyNup6ARvR+dSEaaAQU
	8CrokiqVq6kA1qzcHdFGwFgzNzPVbbfLArBB75RRmz+/z1D34VHSpY2ZCc0mePY4jcr+UpYmno8vS
	0uaFgmWkJ2dljdB+oufuE6gDGhRVx+muWSgqnJYa3A6AzVfFAIPlcft1KcDcLHzPMsH24KQW4Wr9i
	OiZlGOjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcncW-0000000Bk3l-3ajx;
	Mon, 05 Jan 2026 16:39:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcncT-0000000Bk3O-3twn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 16:39:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 355D7339;
	Mon,  5 Jan 2026 08:39:40 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 51E113F6A8;
	Mon,  5 Jan 2026 08:39:45 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Leo Yan <leo.yan@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v8 00/13] coresight: Update timestamp attribute to be an interval instead of bool
Date: Mon,  5 Jan 2026 16:39:33 +0000
Message-ID: <176763112483.1193329.14214589661973805304.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
References: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_083950_038330_6205C5AA 
X-CRM114-Status: GOOD (  12.67  )
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


On Fri, 28 Nov 2025 11:55:12 +0000, James Clark wrote:
> Do some cleanups then expand the timestamp format attribute from 1 bit
> to 4 bits for ETMv4 in Perf mode. The current interval is too high for
> most use cases, and particularly on the FVP the number of timestamps
> generated is excessive. This change not only still allows disabling or
> enabling timestamps, but also allows the interval to be configured.
> 
> The old bit is kept deprecated and undocumented for now. There are known
> broken versions of Perf that don't read the format attribute positions
> from sysfs and instead hard code the timestamp bit. We can leave the old
> bit in the driver until we need the bit for another feature or enough
> time has passed that these old Perfs are unlikely to be used.
> 
> [...]

Applied, thanks!

[01/13] coresight: Change syncfreq to be a u8
        (no commit info)
[02/13] coresight: Repack struct etmv4_drvdata
        (no commit info)
[03/13] coresight: Refactor etm4_config_timestamp_event()
        (no commit info)
[04/13] coresight: Hide unused ETMv3 format attributes
        (no commit info)
[05/13] coresight: Define format attributes with GEN_PMU_FORMAT_ATTR()
        (no commit info)
[06/13] coresight: Interpret ETMv3 config with ATTR_CFG_GET_FLD()
        (no commit info)
[07/13] coresight: Don't reject unrecognized ETMv3 format attributes
        (no commit info)
[08/13] coresight: Interpret perf config with ATTR_CFG_GET_FLD()
        (no commit info)
[09/13] coresight: Interpret ETMv4 config with ATTR_CFG_GET_FLD()
        (no commit info)
[10/13] coresight: Remove misleading definitions
        (no commit info)
[11/13] coresight: Prepare to allow setting the timestamp interval
        (no commit info)
[12/13] coresight: Extend width of timestamp format attribute
        (no commit info)
[13/13] coresight: docs: Document etm4x timestamp interval option
        (no commit info)

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

