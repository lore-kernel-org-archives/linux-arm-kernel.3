Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34F8E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 00:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3r0+SVHeDv0V/nwe3iMXDOSW8idVkaNDtQOwSdMocY=; b=KT/ZTOgo2FN2Wx/0fmQ/xEp3BF
	V+XLWkmC7jEwB3E8Uq8UZhcgxTJY9iuf/VJmzdR7wREfM6PfQ2gS3kNonxXBwLIwNFSiXoDdu4jjp
	dW1IAR7WzD3dwxx7D92xBMY/tE1Mj6mUzKji0XdBb/LdFEBfb+5g+9Tx2L6YPN0tCb2Hf5DatVBjo
	q3p/ggo5TIOoMdZg97x9G0UzQx53K9nccDDWSx3vjmgW4SCtqmEFxI8PACp7yX4hgSqDROGFn0q/J
	Oc2r1w55UTPOmaoT6rkoUsYb1/oAC69zKjmjGCXkG/fpvjYVmQwi3QI3TvQTCKB8PVNyxWqZ6gmRj
	GxlQuIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKo1g-00000009h4g-0Ojp;
	Tue, 10 Dec 2024 00:22:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnwl-00000009g4i-3Rbm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 00:17:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9B39AA41A79;
	Tue, 10 Dec 2024 00:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD62C4CEE2;
	Tue, 10 Dec 2024 00:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733789870;
	bh=BW1fpZ2eE11MnLUwuGiY1eXfukovEfxi8eg26Is0Po4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tf91pXqkgLOxZ1uTzpc09SuWes85x1ft5/rr1kHFH6lWkEMz2SgYPgu2oxFfAg3vX
	 F0NTXSySKLgnUv2w/p6Ysxtb2KWA3G5P7KVnx7egsvIuojqJg+3yhNys+rdOEdAeQb
	 FfS3w2b4gWueOY5ZCYb11OetdGRdWUFUnt2cXH8WhGtrolPJyPhqXBvpzHGH4aHxe/
	 KqTUuasmVZTh9p5n0vL+aAgBYI1kHW8v48YaR96UBC9otc05cHIdDLtzRUFSJHw1IJ
	 GeJzlDEEJ9TKpKCtxs0Mb325kjNMTiFnhpcqAuBtUsTHKHRUML6xwQot1DcshOpUDH
	 j/CZ68/Qv7PxQ==
From: Will Deacon <will@kernel.org>
To: joro@8bytes.org,
	Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	quic_pbrahma@quicinc.com
Subject: Re: [PATCH v2 0/4] iommu/arm-smmu: Minor probe_device related improvements
Date: Tue, 10 Dec 2024 00:17:31 +0000
Message-Id: <173378441488.4186336.14522482976618451984.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1733406914.git.robin.murphy@arm.com>
References: <cover.1733406914.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_161751_919508_174E04F9 
X-CRM114-Status: UNSURE (   7.89  )
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

On Thu, 05 Dec 2024 16:33:54 +0000, Robin Murphy wrote:
> v1: https://lore.kernel.org/linux-iommu/cover.1731088789.git.robin.murphy@arm.com
> 
> Hi all,
> 
> Here's what I probably should have sent instead of rushing v1 out
> earlier, now rebased and polished :)
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/4] iommu/arm-smmu: Make instance lookup robust
      https://git.kernel.org/will/c/7d835134d4e1
[2/4] iommu/arm-smmu: Retire probe deferral workaround
      https://git.kernel.org/will/c/97cb1fa02726
[3/4] iommu/arm-smmu-v3: Clean up more on probe failure
      https://git.kernel.org/will/c/fcbd62156742
[4/4] iommu: Manage driver probe deferral better
      https://git.kernel.org/will/c/46b3df8eb9bd

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

