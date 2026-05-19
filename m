Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8A0CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=detr1zoNhyOMY5amPMEIGBGb7MFv5skRutzC47CO9bw=; b=aPaUyj8Sv9I11p79UNBBS6Dnzl
	c0UQrQD4Jp/nLtroIRjeoSJzhPpQIU46Mp6BgnWAsgXEN+78bCfKhMMbR5lmIlGAW+WGmoKZb72fA
	g1+fkuChxUouPgR7kjOF21bma9nI9FEvcHq1EbY19JhAgyCalxoUZbrPVdCbfLNQwd/+tSUtp51Bv
	4Ixp6kY9W75x54jutbTCNKx3sAX015Xkh2ux5SLAAWP+jwVmlV/zavFIcBV1yjynes2pWp8huflFu
	f/5/6+3lBy6BuqCddu5jkAJEUOAhhkoEi3McSs9Pbeb94RsmE5VUR41IaJnqL/fZ5qHaXzVsqCPUD
	dlHAAfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIa-000000020mc-20qG;
	Tue, 19 May 2026 15:24:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMII-000000020dj-0Zgz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:23:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 721D96020B;
	Tue, 19 May 2026 15:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158B3C2BCB8;
	Tue, 19 May 2026 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204221;
	bh=Yn9anD6S2sdeviR6DobfIVvn2ZavCIs6s3fiL/K+EFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qyb/zaDkk0Kxc8Y+fiFGDHHWFnP4tzKZmSMEDXArE7dhcX8sAtLaT8yW9ehnS9ppJ
	 AC1keOftP127xOq9iN139McgXqqOTEx0e8Ey00jaBiCQ0+FyaCbliWv6WN8ewFEIux
	 WfwWP0M3ARPhI/z1SQt6RC+7WpIO2/WmsI5pTGmCKO3VWrGnh9J7jck6sk2U97MDmu
	 fXuAjdvZXhM0/ekE3DwDi+dyF/tPLLPgdg7AU8mH32oF0mku5GJ+MWos2zpJphD8FM
	 o1nuPu6Tza+gJnLxCDEmB8S2HPlv059UxhZ1hm+bdJ0i4yozSMCmB/0pwwA18Y1DD/
	 0lt2lWbaV0Zmg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: Implement support for 2025 dpISA extensions
Date: Tue, 19 May 2026 16:22:55 +0100
Message-ID: <177919551472.843780.18117053245871054269.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518-arm64-dpisa-2025-v2-0-b3367b73bd00@kernel.org>
References: <20260518-arm64-dpisa-2025-v2-0-b3367b73bd00@kernel.org>
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

On Mon, 18 May 2026 16:07:28 +0100, Mark Brown wrote:
> The 2025 dpISA extensions introduce a number of architecture features
> all of which are fairly straightforward from a kernel point of view
> since they only introduce new instructions, not any architecture state.
> 
> 

Applied selftest update to arm64 (for-next/selftests), thanks!

[2/2] kselftest/arm64: Add 2025 dpISA coverage to hwcaps
      https://git.kernel.org/arm64/c/7da70f41da81

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

