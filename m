Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38977CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnsoT4LwxhHpK10iwpPqoGgddfrAn6nLMP11jJmhq0Y=; b=B7riQ3gvBqudBsLO5B7ylJQ/qX
	ppZPkE7KUbb8cRo/iivulN0Tlw7DU/xM15XkXtXiJHrisT7vCMXbaE8Y2TlDSm/JfrJ3WU8SoC3fX
	PLBEnibhG7yYpg5YKMPWPcBplHgFNj1m+v+xR1FOM3T9Vb0FffQ2zXHKkiHp/OIP6cin/xbCPONd2
	9rNWla7QIaPYO4DlMLD3sg8rIsee/4JroTSLNNQy7XgaNSCB4/ojPXtEefFQGZtd53tV97AYJwycE
	p6E7uaLleotPFib+CM0poU/egyd+IYSaEZVryDx3/14xyWfzL5GLSYXc/G5IGOU5kL68J80rDYF+Z
	XhIhWaRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ7e-0000000AzsT-3opf;
	Mon, 12 Oct 2026 16:43:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ7b-0000000Azrf-09Iw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 16:43:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0459169E;
	Mon, 12 Oct 2026 09:43:25 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 079303F673;
	Mon, 12 Oct 2026 09:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791823409; bh=YwbP5Ioi7QwUqGx5taKPNQkBBbrznqq1ofQNaKTuS/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rio1seCHQBt4Te7t4RhbcNCHJ3d+n/oUIqVJElm8wqt2Vu7MiE+o9C4rVwFuckg+D
	 BhxZfbmrGe8wWr/Kb7BqThw/hD3gmUijMMWXIvmLshUbS1gkBYkXb40rlvFMlU7d7C
	 EZswfpLt+Gm7//g8HwbvUncdkQBNVLef5HioVugQ=
From: Catalin Marinas <catalin.marinas@arm.com>
To: ben.horgan@arm.com,
	Sasha Levin <sashal@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	andre.przywara@arm.com,
	bot@kernelci.org,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	reinette.chatre@intel.com
Subject: Re: [PATCH v2] arm_mpam: make the mon_sel guard conditional only
Date: Mon, 12 Oct 2026 17:43:19 +0100
Message-ID: <179182339913.870867.13095111660955040727.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009163235.3-1-sashal@kernel.org>
References: <20261009163235.3-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_094332_466471_6A951799 
X-CRM114-Status: UNSURE (   6.42  )
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

On Fri, 09 Oct 2026 12:32:35 -0400, Sasha Levin wrote:
> Building arm64 allmodconfig with clang fails:
> 
>   drivers/resctrl/mpam_internal.h:207:7: error: ignoring return value
>   of function declared with 'warn_unused_result' attribute
>   [-Werror,-Wunused-result]
>     207 |              mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
> 
> [...]

Applied to arm64 (for-next/mpam), thanks!

[1/1] arm_mpam: make the mon_sel guard conditional only
      https://git.kernel.org/arm64/c/8ea457f746d9

