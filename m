Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AF9CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 15:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaETOHLjzaqs8RU4eSCYVRFqd6YSrZAC3Jqm+PqW9VA=; b=PLp1Kanpqwx+hLL3JKEwzmDiQ/
	aqQG8NGtKMBuN4jKhXsw9ssysmCDjpAjQjEBG83Upp6TddzRbFdt2tWxMsDqqM1mIsbhdfnTjRxo8
	Ngj6Sy3MxL3+76L75O2eh/0bAKy5KxTDi/8P3ArQ5PYghTDbDRVaO9FYtxf206aUO0vFurt6BqACD
	E0NXy2WeT0y53H5h1xMEtzAEWNNaibuxBCI8cljnTRTqArrvXcyN9kJXEvGq6YYaEKB0nYt2l+/qF
	hqLAxXSNRWEeQvlRiRxaqmAs3vEp58UNKh7HVYUu+/qvelq5VUGnEjdvNa5wntp1TfIPl8FoCE1pQ
	C9Bn3DqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOmu-0000000013U-2fHu;
	Fri, 07 Nov 2025 15:54:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOmr-0000000010g-2dSx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 15:54:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EA0F54468C;
	Fri,  7 Nov 2025 15:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00838C4CEF5;
	Fri,  7 Nov 2025 15:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762530844;
	bh=f5W0zlQImtuVz4ijpkSE3OW0/YOZZ9zWfzlQ9HOAXB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UAzPiJEyG3FCC8SZ9HzahNJFivkXiFHaON3c+3tp9cUB1+D/Be4mkAjUHJmn8quAp
	 UAVjjMXuLqZHVFPr6fg5rkG1N+zQ32zpcYGIOgQ00OxMBWxiY+uSALvx+K6o48SSF9
	 yfwyB+LEOJ/3QCRnBO9G0djbVbi8FmWDPn1fhaekpUFkXV/AsOTw0prVKBJDZx4AZB
	 jUP5ABlt6+5i7bWU+KZoHsphmKvsPqhLycjx7yxfED7Vu+b5WUTa2CYhsjXrOjug9S
	 LvStAC3E9DssfiHxc67kZIRx0KxSRD70YBHTVLVQfDq0yGCTI2nZCaKltHsa9YJt64
	 y5gfilGwMQ8kA==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] perf/arm-ni: Fix and optimise register offset calculation
Date: Fri,  7 Nov 2025 15:53:45 +0000
Message-Id: <176252278054.581088.13167524929157815362.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <5db610facd51b81af04b1afee53191836315b17a.1762264719.git.robin.murphy@arm.com>
References: <5db610facd51b81af04b1afee53191836315b17a.1762264719.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_075406_360967_1B1934F8 
X-CRM114-Status: UNSURE (   7.40  )
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

On Tue, 04 Nov 2025 18:29:40 +0000, Robin Murphy wrote:
> LKP points out an operator precedence oversight in the new NoC S3
> support that, annoyingly, my local W=1 build didn't flag. In fixing
> that, we can also take the similarly-missed opportunity to cache the
> version check itself at event_init time.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf/arm-ni: Fix and optimise register offset calculation
      https://git.kernel.org/will/c/2d7a82480701

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

