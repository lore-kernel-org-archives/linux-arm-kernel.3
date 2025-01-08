Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94DDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 17:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdPBNg6Oh/q/xOvRJTyKJ6exeaZ6e5ixJCmV6t2x47Q=; b=EAwub3PaKAHf1kOS5es1hc/9Dq
	gbBUPSiFaIrEKqXGqWD6Pgro4uhgM0I2CEuUYLw7IG5OPJ9rcRYdTOaAd934dRH41nFVmzmvIz0zh
	d4j4IzvIdAodAVRNd3ZXcHGz00zwmwmjeqdNamwhf/vihlN/1N+19+CIZ3sEDS4snA6obhlMNti06
	NgotJxC2ANWK7lKFlzGu3U44jS9eKx1ME72tTKIVI6mw8V/bLNfYGVqxDu7LD8498XR0q4qQdH2/k
	QxpR+X2dI9/RiwdBPTEElLDDuH8ySWxo26KpPW6GlK+F091Bln+1bIkgxJstPbBqkAcfwHbXz5sOj
	guLj6TUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZQU-00000009IPv-0GEp;
	Wed, 08 Jan 2025 17:01:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZ5U-00000009DJt-2GwU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:39:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 157E8A417F1;
	Wed,  8 Jan 2025 16:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C588C4CEDD;
	Wed,  8 Jan 2025 16:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736354359;
	bh=SDds+TK/lVD6ZkEFK1dg2wd8tfmdIW4fsQkO1c02vk4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sRef5+u4XYsOIrOiE/c9IkFwzvjEmC7T5+jLlwB4bED8tZiOFLD+sKqJcrS3RE+M3
	 2xbQTCqDJm86Dtgy2qOnDC+cTcf+bB+8w67xG6RT8A8avMwpeH7K2YBi1Pw4NdKspC
	 S9Ku+7Qsm2u7VG1uAIgYJfqSXgdra+MDDho+oz3vTLgRGVPXd7hgl92yi/+kIjST/w
	 /TKgJa8gjPx6axAN65R31NtNgD+eNpaZ2GPRJgjAzCaDipWmzC+uJdBBCI57VqZgzS
	 QyAnVUskQ35/+JXrZOB7vzmHwqSN3K8T2HvbfKkG5hgpSQ4KcB+mBAlL/agie/wuNM
	 D/m6LgUvtF0Hg==
From: Will Deacon <will@kernel.org>
To: anshuman.khandual@arm.com,
	catalin.marinas@arm.com,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	ardb@kernel.org,
	ryan.roberts@arm.com,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	dave.hansen@linux.intel.com,
	akpm@linux-foundation.org,
	chenfeiyang@loongson.cn,
	chenhuacai@kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quic_tingweiz@quicinc.com
Subject: Re: [PATCH v3] arm64: mm: Test for pmd_sect() in vmemmap_check_pmd()
Date: Wed,  8 Jan 2025 16:38:56 +0000
Message-Id: <173626870329.286960.5328606288066578023.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250102074047.674156-1-quic_zhenhuah@quicinc.com>
References: <20250102074047.674156-1-quic_zhenhuah@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_083920_643183_41D28D9D 
X-CRM114-Status: UNSURE (   8.39  )
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

On Thu, 02 Jan 2025 15:40:47 +0800, Zhenhua Huang wrote:
> Commit 2045a3b8911b ("mm/sparse-vmemmap: generalise vmemmap_populate_hugepages()")
> introduces the vmemmap_check_pmd() while does not verify if the entry is a
> section mapping, as is already done for Loongarch & X86.
> The update includes a check for pmd_sect(). Only if pmd_sect() returns true,
> further vmemmap population for the addr is skipped.
> 
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64: mm: Test for pmd_sect() in vmemmap_check_pmd()
      https://git.kernel.org/arm64/c/9ab2601dc4c1

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

