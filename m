Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A950FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNV+ze5QrOcKzOf1CN6v9Lw2uq6Jdk8T/+q+bjFyGC8=; b=zekFeVpEo1voVclxVmTDfcahB6
	mUsSrmbR6vCP91KJtFogqKFBqqeQXFD6uszArYjvZNfT813sDAI41xu2/NQ0hns+lBtdvDjaZmEHs
	z+1r71ZQO5oWFjZJQV8QvoNaJyEDzSlcwIYmoabFHTALwKyJ69HoIDg7kOg6ojPA6rztvOruw9S6H
	FUE8clhXvejyZxgMUZFor5nhtR0ICiQpDVvkEM34hGfVFoPqAnU64EQi5MIYFJ/bvmihuK3BlHBur
	sKD44uCJYp8wQ8IRBFWmysgTovjz6CY6ONAtsks0F92HvcRZZEaxeVbXIK0LH3fQwNUfoSR50Cx7G
	kohC8b5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubM48-00000002q0c-2liy;
	Mon, 14 Jul 2025 16:30:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKoy-00000002bD5-1apx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:10:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD4F2456D5;
	Mon, 14 Jul 2025 15:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B17CC4CEED;
	Mon, 14 Jul 2025 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752505823;
	bh=uMFTP7eyQLPoIYG0BRVJ3E4Yhfci1xgM3+nFkDbhxQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P1UMDOTPuEQAkZ+fVJ/TyCjeU/OL8dqSnsyY7onRVnphCY3dO3olPAhsVt28C+t4M
	 Ju0b8MxOQJWsQ0xZEOTLaMeoFGOmcXVFrApOpee/FY1HAPoBEG69Xc1u/6waJEbVsF
	 xb1pRJsFocsoJ+MeHFjFfe4AlSk69Gy2Lck15ZpBVRLCBA7ucHw4br85IYo7SVEcKQ
	 lWLR1DIo83jK51SzVgBkAHsGxoUd/Js0j8CCpMOiKpbo+pJWbnY//OwzozswU3MGZY
	 PlkgaEZeZYUPziRUwMXHL05l890baPB8mFGNzQGPy5Z39h5dxlF0BLRsDIwrdtfbLU
	 7vD80vbUcttnA==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	hejunhao3@huawei.com,
	jonathan.cameron@huawei.com,
	prime.zeng@hisilicon.com,
	linuxarm@huawei.com,
	yangyicong@hisilicon.com,
	wangyushan12@huawei.com
Subject: Re: [RESEND PATCH v3 0/8] General updates and two new drivers for HiSilicon Uncore PMU
Date: Mon, 14 Jul 2025 16:10:11 +0100
Message-Id: <175250413862.1548947.3288364780792858607.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619125557.57372-1-yangyicong@huawei.com>
References: <20250619125557.57372-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_081024_437847_218932F1 
X-CRM114-Status: GOOD (  11.20  )
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

On Thu, 19 Jun 2025 20:55:49 +0800, Yicong Yang wrote:
> Support new version of DDRC/SLLC PMU identified with updated ACPI HID and
> register definition. In order to support this, we do a preliminary refactor
> to initialize device of each version by using driver data of each HID
> rather than checking the version. This will also make the driver easier to
> maintain and extend, since only the HID specific information along
> with the new HID will be added to support the new version without touching
> the common logic.
> 
> [...]

Applied first six patches to will (for-next/perf), thanks!

[1/8] drivers/perf: hisi: Simplify the probe process for each DDRC version
      https://git.kernel.org/will/c/dc86791ff68c
[2/8] drivers/perf: hisi: Add support for HiSilicon DDRC v3 PMU driver
      https://git.kernel.org/will/c/17aa34e86936
[3/8] drivers/perf: hisi: Use ACPI driver_data to retrieve SLLC PMU information
      https://git.kernel.org/will/c/29614c55fe6f
[4/8] drivers/perf: hisi: Add support for HiSilicon SLLC v3 PMU driver
      https://git.kernel.org/will/c/1fd20ba0a1dc
[5/8] drivers/perf: hisi: Relax the event number check of v2 PMUs
      https://git.kernel.org/will/c/35f5b36e8cc2
[6/8] drivers/perf: hisi: Support PMUs with no interrupt
      https://git.kernel.org/will/c/e480898e767c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

