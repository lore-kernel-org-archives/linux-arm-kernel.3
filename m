Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FBDCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 18:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dPN44HoH56tLqp4jXzO9TkX2LAQSe5luvXf6lkxvxI=; b=nFO8KLbbEDy2vdD2wyS5RLM6/l
	eoHqKs0wtej6EkWasTXpPcIoCwhRNziO+j9IgChHr6tL6GuTjOMG2vcoELitf6Zle7AMqlfwXe89f
	ut9fRw24SqzLzMWd4z8miUQdidrQ8Lozad4+WsZ0AXoZYlN0XVb3jNynK5WkACbboOXotbkifcEml
	LNXBIQk9da/wUssIP5wTIgTdVYIjnYHmTDJKahuSHB+F0ghYSTKdPYnfoYIBKiORaIth13A1MsDG6
	bRGswHB85z6/GJ2+IX5SFGK0CBE0YL57flv0BbE6IBBMzB65dh5j3lVCaLam2KAST3V1C1EdkpZhG
	uGjjNu+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzg0B-00000003myN-2RtV;
	Fri, 19 Sep 2025 18:38:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzg09-00000003mwh-117Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 18:38:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB77240C15;
	Fri, 19 Sep 2025 18:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD77C4CEF0;
	Fri, 19 Sep 2025 18:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758307112;
	bh=g5XD20gFfrYjZGNjDgzk53Skqg5rf5+ZLWDimhdGRRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tI2ZhMvSIF1eJc2Yzz5mRzFmeosSr+i9E2m7UPtkUCBrr/zfTPOWyIPbktNRpVjJr
	 +uMODDpuw/f3KRCY+BVfTi5c2yAfHVCcg8einyftvYrJF98bmvJFNS4NusdFyQy8zn
	 SQZilDuw3Tgrf09sZKtVwDFxIpMXSDOYoiRkCTEokyNksn5waxstRLsr5QX7zBP5MC
	 hXkCd5/MPd/K2gcZuV799je9y3ES/dYq/q+TveH1WSm/Hiw/2+AKjGkue6Ey8QbWmP
	 GytqAHSpd+Iji9+LtsU6VOfj9NTj14sBZg4GVi8LN+MMRq9utMjC0hMICsmdvwcXlA
	 V/K83YFDRq8jQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	gshan@redhat.com,
	aneesh.kumar@kernel.org,
	sami.mujawar@arm.com,
	sudeep.holla@arm.com,
	steven.price@arm.com
Subject: Re: [PATCH v3 0/3] arm64: realm: Add support for encrypted data from firmware
Date: Fri, 19 Sep 2025 19:38:18 +0100
Message-Id: <175827312255.1088160.4082411097275002683.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250918125618.2125733-1-suzuki.poulose@arm.com>
References: <20250918125618.2125733-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_113833_316143_60BD1BA0 
X-CRM114-Status: UNSURE (   9.37  )
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

On Thu, 18 Sep 2025 13:56:15 +0100, Suzuki K Poulose wrote:
> Confidential compute firmware may provide secret data via reserved memory regions
> (e.g., ACPI CCEL, EFI Coco secret area). These must be ioremap'ed() as encrypted.
> As of now, realm only maps "trusted devices" (RIPAS = RSI_RIPAS_DEV) as encrypted.
> This series adds support for mapping areas that are protected
> (i.e., RIPAS = RSI_RIPAS_RAM) as encrypted. Also, extrapolating that, we can map
> anything that is not RIPAS_EMPTY as protected, as it is guaranteed to be "protected".
> 
> [...]

Applied to arm64 (for-next/cca), thanks!

[1/3] arm64: realm: ioremap: Allow mapping memory as encrypted
      https://git.kernel.org/arm64/c/fa84e534c3ec
[2/3] arm64: Enable EFI secret area Securityfs support
      https://git.kernel.org/arm64/c/9e8a3df3e7f7
[3/3] arm64: acpi: Enable ACPI CCEL support
      https://git.kernel.org/arm64/c/d02c2e45b1e7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

