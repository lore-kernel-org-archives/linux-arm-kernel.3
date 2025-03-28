Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66506C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 20:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ba6lvn8ltamF09a6lRx96RVxouF7iHdEIq/90uICs/8=; b=Hhfa9B/aH8n4GdjqN0Ba9zUbSI
	MjQKHyiOZ9iTVvGYTym+8eKnWr14Vz6ZlfxjQMO/p/vOuYLV3NyDmOqkgwZSLWqxqD5GFDEoems8d
	lYE/Xd+U807EZlbXmSC6ihgmSddFwaYGbsoa9kKO6Rfu/cKgTbNsR2xaigq1Z0IlqPWDv9wFsOwVu
	JfMA94pNgCoC3SlpC50YPqmpx7ZoH1wpogiq8rFpIj68td3I5yXfMH9WI3l/w5W0FGPHBU5EuzVeL
	qnFJ0Uy2jXPJJBpI+xc6TvE7wtfmy3rfXG9b3AMno96sH4U5CZfHjplys7VR4ubu55HLRmw9ASmKu
	ADcOIKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyG3E-0000000EF5X-04Ky;
	Fri, 28 Mar 2025 20:11:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyG0B-0000000EEoK-40YB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 20:08:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 75949A40CDC;
	Fri, 28 Mar 2025 20:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA77C4CEE4;
	Fri, 28 Mar 2025 20:08:23 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: anshuman.khandual@arm.com,
	david@redhat.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	mark.rutland@arm.com,
	ardb@kernel.org,
	yangyicong@hisilicon.com,
	joey.gouly@arm.com,
	quic_cgoldswo@quicinc.com,
	quic_sudaraja@quicinc.com,
	akpm@linux-foundation.org,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quic_tingweiz@quicinc.com
Subject: Re: [PATCH] arm64: mm: Correct the update of max_pfn
Date: Fri, 28 Mar 2025 20:08:21 +0000
Message-Id: <174319246799.4193737.10993641019327469518.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250321070019.1271859-1-quic_zhenhuah@quicinc.com>
References: <20250321070019.1271859-1-quic_zhenhuah@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_130828_054219_AAD544BC 
X-CRM114-Status: UNSURE (   7.61  )
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

On Fri, 21 Mar 2025 15:00:19 +0800, Zhenhua Huang wrote:
> Hotplugged memory can be smaller than the original memory. For example,
> on my target:
> 
> root@genericarmv8:~# cat /sys/kernel/debug/memblock/memory
>    0: 0x0000000064005000..0x0000000064023fff    0 NOMAP
>    1: 0x0000000064400000..0x00000000647fffff    0 NOMAP
>    2: 0x0000000068000000..0x000000006fffffff    0 DRV_MNG
>    3: 0x0000000088800000..0x0000000094ffefff    0 NONE
>    4: 0x0000000094fff000..0x0000000094ffffff    0 NOMAP
> max_pfn will affect read_page_owner. Therefore, it should first compare and
> then select the larger value for max_pfn.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: mm: Correct the update of max_pfn
      https://git.kernel.org/arm64/c/89f43e1ce6f6

-- 
Catalin


