Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC2DCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=td7MaM/Apy6Ne2FPuY9QUq/Kd/2tKz0+XVTbyIsFBQE=; b=nq/VINZ2YuMU28a0pGUqM1CWcJ
	E1B36iBL4vBxx96AXi5Mwjs65IB5CAOo0g+zkiuk2Q3A2yZlwcKvvMK+cyTh/si9qEZLGdBnokr67
	KOGdtnQ6F3zwrlakZffg64W77SNUsgx0fHS3CXXjNGtpt6JRODjTTJ2mXd7HvE0M8IaykNlTB1Key
	zCTpbJ7Qu0hDXkmRENcv5zJ7EXPX+MRXRBz+Y/wwOspwvjB4u9q9hC1qdDVjZ1yzhfJnik0NCGkjs
	PFMND8uDF5rgPAXekj/YENVe2Ku0EvR1m0MKVvtPrHNgGLWuOfkp+ngYEphhyEa5qqONlnf+/xezT
	Hv/PAbSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4E2-000000081sb-27nD;
	Thu, 21 May 2026 14:18:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Dx-000000081q5-0eDV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:18:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C73E1402DA;
	Thu, 21 May 2026 14:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606071F000E9;
	Thu, 21 May 2026 14:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779373088;
	bh=td7MaM/Apy6Ne2FPuY9QUq/Kd/2tKz0+XVTbyIsFBQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CRTrQ2kpLXfU3ieR5uTq8sUeDZ1LjskytXoCj+bRO+wyEjlE/ijXIn02zk5EookF8
	 0R9jZs8xtVU6sZpP5SnbXgW4r3l4kZIv/wAuqNFTBmSepd06mRqp9zhyN3g7kLWLYm
	 PuQzzqT2sxk9TFrm/iA32MHMArjHtI9CUs+abGpzoOGNm1VTQeWSJVNG1riFV6awK2
	 zuoqdAkdYZRSebfeNWBv7SJPXhxpwiacu8sq0nFfiUDLvkpXU0AuzCtRBYguPxsEDU
	 IfJztiSA6A7RMs8w0/G0hKSy02ojgzdk3f6CKc1YwLRTyt1NAGseD60U+RcSlXYQPs
	 lejzRxhE5tsJQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: Paul Benoit <paul@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: smccc: Fix Arm SMCCC SOC_ID name call
Date: Thu, 21 May 2026 15:18:00 +0100
Message-ID: <177937296371.2011013.12637502975027953627.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902172053.304911-1-andre.przywara@arm.com>
References: <20250902172053.304911-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_071809_212124_7BE4A759 
X-CRM114-Status: GOOD (  12.14  )
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

On Tue, 02 Sep 2025 18:20:53 +0100, Andre Przywara wrote:
> Commit 5f9c23abc477 ("firmware: smccc: Support optional Arm SMCCC SOC_ID
> name") introduced the SOC_ID name string call, which reports a human
> readable string describing the SoC, as returned by firmware.
> The SMCCC spec v1.6 describes this feature as AArch64 only, since we rely
> on 8 characters to be transmitted per register. Consequently the SMCCC
> call must use the AArch64 calling convention, which requires bit 30 of
> the FID to be set. The spec is a bit confusing here, since it mentions
> that in the parameter description ("2: SoC name (optionally implemented for
> SMC64 calls, ..."), but still prints the FID explicitly as 0x80000002.
> But as this FID is using the SMC32 calling convention (correct for the
> other two calls), it will not match what mainline TF-A is expecting, so
> any call would return NOT_SUPPORTED.
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/updates), thanks!

[1/1] firmware: smccc: Fix Arm SMCCC SOC_ID name call
      https://git.kernel.org/sudeep.holla/c/70492cfce2a4
--
Regards,
Sudeep


