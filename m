Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E95CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 16:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11PTYK92XaqtXMDL1CnKa9shaJapea9ldZ9H+9FuvHs=; b=EjnDWWRasuvvnuguFOLF9q1Ncw
	1C8i4a70NJzELe19yrAQqjFlF2oR5FPl5GpuYtGFwhLf6xIpylK4uN2utY0piX6YEvjQP3JhBuyTV
	89xDHS0+JV7RfgrIx90LcoSgijaow9Q+htrCpOmPydsMZCeWirYG0DjX7Jb37nvP6VEBp2e3aX9bO
	+Kirr3OPnZJDOZwtsnFucypB8sAedW36LIe4V0XDDuaGdjw9Dl/ljTdM3bXkDjBOVLT7gegBqZyFJ
	YOlQEyj7wYHxWoU9qeUHMzqEyenYROorpVn5NbduWt8B39y3X4xtJGeGApgdpj9rA89oW2V8RspnK
	DIMwbhaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1S4F-00000001a7T-2g3R;
	Wed, 24 Sep 2025 16:10:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1S4E-00000001a6y-2888
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 16:10:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E198260202;
	Wed, 24 Sep 2025 16:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62172C4CEE7;
	Wed, 24 Sep 2025 16:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758730205;
	bh=oZMitb7M22Ej6GRU2hUfNuXfDkljVEWaa1LZL7XbmAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ig6xByBEBw/6LKeaCNF8IllhULFNjthYcNuED5Mu9YT+mpc6F/iF8noUoy+TfAEXa
	 k/oJX9OqDwIDjzx6l7gVvtq9g4iK7vuWLtgOsgh5eM6Uv8gl5sgC1cXH93D6OR23F3
	 iQLp+z/JOLRiZOt51PUz+pM9Tb0jHajco2oY3hOOp+p3/ISoGPeJKcGgAkn80ZLPG4
	 EXSjh64SQlRwwmpNYTQU880gymK4JSHEtgeGz63bMzbFJH4Vb3iDca7WjniBYL5dpX
	 if9a609uJvcOR+q976D34VLr9M9zdiLE+bC2qBcaXDBhJIGRAvn/Tcw6jTwpI7qMxh
	 epNhwte9caNOA==
From: Will Deacon <will@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	dan.carpenter@linaro.org,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf/dwc_pcie: Fix use of uninitialized variable
Date: Wed, 24 Sep 2025 17:09:56 +0100
Message-Id: <175871240090.2379729.10967323290224502441.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250923213136.8107-1-ilkka@os.amperecomputing.com>
References: <20250923213136.8107-1-ilkka@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 23 Sep 2025 14:31:36 -0700, Ilkka Koskinen wrote:
> Fix use of uninitialized variable in group validation code.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf/dwc_pcie: Fix use of uninitialized variable
      https://git.kernel.org/will/c/2084660ad288

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

