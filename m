Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A49ACA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 22:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z46qfVDnY/k4IBdnZzTsEQcqKTsjpwfrh5da4yxHGGQ=; b=yBONYZ6v7ZZ+gae80FaM6h6qTz
	Crun9eWd2vBsLeN+g53H/YCLtlF+GrrHRXATnI3qoJuPUcLYjAFYirRd+pOdLgL86YknE7DoSMA8L
	bsbR7kb4ar2P7Dk193sbDn/Jwzw0zjPDNp6ZjUZrza7MVWPkGXxiXd/x5nnFnMPLiFNxlh6Oz2HfR
	MmQVYUmT10AtQl9q4fKog5SLAGfuUN+KXbM96DBeY92h0gmoPU3oHdaEheebdZ4WURZajXvMe1NKS
	ceLtr0eCx+lHSBtr7uDQ4cSMAfmjQWO3DL0ObgDY93YuTOl3k0NW0IUWx4rJcKDtVzkFohDaf19VV
	3S4nnY3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEE5K-00000001TMa-3ZDe;
	Tue, 06 Oct 2026 22:56:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEE5I-00000001TLu-1CYC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 22:56:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC2081477;
	Tue,  6 Oct 2026 15:56:26 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FF803F86F;
	Tue,  6 Oct 2026 15:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791327390; bh=um+qIoApyaVnaKhorlAM0Qp4AS2ODk/T4799912pnYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QOLSlafT7TwqL6NBkHzEg5x7Hp5ODbn3MF/9GoONUcO2PVGu5V7majSi3CDnZKrX6
	 0++2L3X2D3eqXJuKp2tiRzC6g1yZU/kyBbBfm4R6pnI8LxK+m+A5w9f889QH1PI5//
	 ON1Wec0fv4S2jNfosRGjnpbyeV2EiusyT9JopYuc=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ben Horgan <ben.horgan@arm.com>
Cc: Will Deacon <will@kernel.org>,
	james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: [PATCH] arm_mpam: On saving mbwu state read the monitors before clearing CFG_MBWU_CTL
Date: Tue,  6 Oct 2026 23:56:17 +0100
Message-ID: <179132737741.1340208.13691312291433081062.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003131208.2023223-1-ben.horgan@arm.com>
References: <20261003131208.2023223-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_155632_373782_506F6E6A 
X-CRM114-Status: UNSURE (   8.46  )
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

On Sat, 03 Oct 2026 14:12:07 +0100, Ben Horgan wrote:
> In mpam_save_mbwu_state() the monitor values are read using __ris_msmon_read_locked()
> which checks if the configuration provided matches that in the hardware and if
> not then resets the monitor. To avoid resetting the monitor before reading the
> value that needs saving only clear the configuration after the monitor is read.

Applied to arm64 (for-next/mpam), thanks!

[1/1] arm_mpam: On saving mbwu state read the monitors before clearing CFG_MBWU_CTL
      https://git.kernel.org/arm64/c/197a7a41e6e0

