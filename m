Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB28BCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 13:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/vAQUfV1EADDz4LiFjiP3OcoJ/N2nDTx8as6hP3BxQ=; b=cw2AiRIVP64b9JOho+HMuMWZmN
	A17o07XlaYMuDLqoZaIqmH+PtKBVKxccjcmxNAgnCp26pUhy5v9UHXUPHixTavYTJ1IVKyVKACW0l
	+9V7SLyOoAPAkfU4WcDSJaoywSWFYq+6wbHghBR4F7WcyQUCnZx99X9AoHnUOb2yRH0fhFZB12NyF
	SILeorjJMDlsVOzc6EcLZIN2dmeOhyIFceqk9TVfrwzKMozJ+IoOrKCw0wEEf24ZzLaz0yTjBkGGb
	IEaZ4PNuZS3Lwu39UAZBgYgIPSiNQ4/zV8HTEMxgn9iZMYmeluSXrBZKGESrk3QA+ln9KSUv8luKG
	EDN4oZFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMWo-0000000Ermr-2S19;
	Sun, 04 Oct 2026 13:45:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMWn-0000000Ermg-1CHh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 13:45:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 77F6F601F7;
	Sun,  4 Oct 2026 13:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21251F000FF;
	Sun,  4 Oct 2026 13:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791121520;
	bh=k/vAQUfV1EADDz4LiFjiP3OcoJ/N2nDTx8as6hP3BxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GHhgjsSk4yc2AUUSJIvjoqqsOB0F5ajlbn65/iukMchAREmGgoF9y8aIwLFkXw3YA
	 19BfCp4djDUGT6YrOHMfDdJXfKb1igcOqEpeOViu1Z4zOEmteBxUy5n5atoxr9VARQ
	 obhbGXSnwfW4byCTI4FWSrOd7R6ZkDmao6jGrD2BzyoAjgJKoIS9lsPYJOLdaYbQI5
	 YV4y2YndXVs4weCqzAVsXxrKP2sHPe2AEgPED/ZGjS+5IfR2OB8wd8hHr/JAwj+XsA
	 oGh9TAPZyOXXH3y4g3oVZhV0BRi8sZ77R+Wy12WlGsRSDiJ0fqa13GFOihCi2zppkB
	 Y5Bu6elxCv5eQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
Date: Sun,  4 Oct 2026 14:45:13 +0100
Message-ID: <179110526060.2155747.11837902937011925576.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930121212.3101361-1-fuad.tabba@linux.dev>
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
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

On Wed, 30 Sep 2026 13:12:12 +0100, Fuad Tabba wrote:
> On a CPU with FGT2 and an IMPLEMENTATION DEFINED PMU (PMUVer 0b1111),
> __init_el2_fgt2 sets the PMUv3p9 bits in HDFGRTR2_EL2 and HDFGWTR2_EL2,
> which are RES0 there. The macro only checks that PMUVer is at least
> PMUv3p9, and 0b1111 passes.
> 
> Exclude 0b1111 before the compare, as __init_el2_debug does.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
      https://git.kernel.org/arm64/c/b52ef450139f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

