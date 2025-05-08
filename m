Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83007C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQDoJxo8xfARLWAEzZFys5QQobOjXyAbFFgnTDtQ9S4=; b=e1jJ/+CiX8NruWN3lc2sfaJgX0
	EqHMnadVYxQSCCx+cTRGcLzws9+NJOSKWvhYPF8gxBgM0RLzjTBTUrNu1Gqq5KSHjKqrCkP9orzlg
	DDFd3psCC+KHjADqMcBUjQqbylzdtR87MhRso1scvmHH28cNOzAGKK4MiDGFOzajJC0oFStgFgBfg
	/eZJaPgh5G3bevkzE3zYp9AOxOsfe/00rN7Kwi/gtifMPAQ9qGkmdydFRxu1zF4ARiD8RSz2MYTNf
	ffdK8fhbw6p87ffmx0YtZcIKC+utYmdAliLUCyS7c7GQjiwx+5wWMosy9lkv/blWrV1x79BWSYrXJ
	2oTByWFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0ve-00000000hlp-1GDN;
	Thu, 08 May 2025 13:04:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0th-00000000hbU-2xvP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:02:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE6434A715;
	Thu,  8 May 2025 13:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62ACC4CEE7;
	Thu,  8 May 2025 13:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746709363;
	bh=3jYIMlTRS21sFwI2KZR6aQTeSVvwhaMYQmdsc+lOmvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fM5RJCob3QZpPVDNWRh3u4IuG2knKHM3A8fO8bPRFDTlh3az/dDQD2aI3vOGaUdia
	 Ip+iLBgIGRCjelyn8/K26PX0UM3lj/iFzroldvYZZMWion6/MXLbGloz7jHruC55an
	 sQTU+U370CFcNKlFw9oKn1w8LnjFUcy2ooZdS7ZLz4sBVVwYE0hHswe6GFPc80Ho4m
	 p5+VxmvnWWkARwOd4HlLNC1Ry9mw/fWtAnzfEblnttFWkrEmTnGeRZaXApCmwVsb39
	 W9MNxPwNkA0PYdPpeBPMuhuMvrrQaCb27z5KYsqdmMNG0ILcXgr4BX9LxGipv6HzTa
	 nf+nIlTNomZTg==
From: Will Deacon <will@kernel.org>
To: rafael@kernel.org,
	lenb@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	bp@alien8.de,
	Huang Yiwei <quic_hyiwei@quicinc.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	xueshuai@linux.alibaba.com,
	quic_aiquny@quicinc.com,
	quic_satyap@quicinc.com,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v2] firmware: SDEI: Allow sdei initialization without ACPI_APEI_GHES
Date: Thu,  8 May 2025 14:02:35 +0100
Message-Id: <174670772284.646111.7927928404698891686.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250507045757.2658795-1-quic_hyiwei@quicinc.com>
References: <20250507045757.2658795-1-quic_hyiwei@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_060245_769767_D82195FB 
X-CRM114-Status: UNSURE (   9.43  )
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

On Wed, 07 May 2025 12:57:57 +0800, Huang Yiwei wrote:
> SDEI usually initialize with the ACPI table, but on platforms where
> ACPI is not used, the SDEI feature can still be used to handle
> specific firmware calls or other customized purposes. Therefore, it
> is not necessary for ARM_SDE_INTERFACE to depend on ACPI_APEI_GHES.
> 
> In commit dc4e8c07e9e2 ("ACPI: APEI: explicit init of HEST and GHES
> in acpi_init()"), to make APEI ready earlier, sdei_init was moved
> into acpi_ghes_init instead of being a standalone initcall, adding
> ACPI_APEI_GHES dependency to ARM_SDE_INTERFACE. This restricts the
> flexibility and usability of SDEI.
> 
> [...]

Applied to arm64 (for-next/acpi), thanks!

[1/1] firmware: SDEI: Allow sdei initialization without ACPI_APEI_GHES
      https://git.kernel.org/arm64/c/59529bbe642d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

