Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2796E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 23:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dbkBKKqSfYqaTKNgM8NXZk1gZVbWH2vtfapS3G3+pA=; b=TQ/DwPkBV8tckPuaXd2/W+65jL
	ZzfeIfLWFBFMOonKQhrRRqZi70wHepi9htfZY2tztzpW8NUtEOx/ngT6J82qhdHUMOB2jTb9LHLHN
	UFDE8lVNmzHO59twqf9aRd3OYYax6jSU482mmnAWpQK06sab4cFDkYQm2OSrJE5XY/6QQhrGowlhE
	O0NoQ/VHE73cgU3yA42hxBo0q0OZ+hD32XSgMA9NwBoU5NPk93JW5RQTbb7sCrfj5EJoJtE/P7+rH
	I3ZGVSU4yGJbsFSctFLXSwCeGciWOf52S1ifkjFHi/CZj6Ecq6+x47SIwvynnQ52tY7L4HmpnInlm
	cS/Y6qrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWUT-0000000GYdm-23v9;
	Wed, 11 Dec 2024 23:51:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWNb-0000000GWG5-2hPD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 23:44:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A10ADA42537;
	Wed, 11 Dec 2024 23:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFF2C4CED2;
	Wed, 11 Dec 2024 23:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733960670;
	bh=XF9P61tbrgXPRYSJgZFa8PSz3VL+CEz7IiHjAArXliE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YD7WIMd6OQrM6fvp17ZgAeAaHl0uDSrkJ3ab0jLmlAcWm82fmsLpeKe05y7AYg+MT
	 MPiO/RZfAIUl09DmcJ918y2324irb9BtFvNSJvVQoCI6E3do4s35W7tAU8N7D7N9dA
	 gWDyW2lsqOnOJbwIAPpvLa48tISKv1UHIJ0zulkI92uFrjVGjSsd7+wCuD0IcG+4Hl
	 ly4Q1mOTe952zHhXYkNpM3O2+4kP/yejJn3N008XOYqgzXC909RUNrLz/uNKi6HIR3
	 RSVLipLAoRKsrQ7KrmUY6HiNNwxroIDvFVJFNZaCJXy0j7QRa0VqiKl1WvkZB3obvC
	 gLO3Wpwu4G1YA==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] perf/dwc_pcie: Qualify RAS DES VSEC Capability by Vendor, Revision
Date: Wed, 11 Dec 2024 23:44:16 +0000
Message-Id: <173395359744.1069392.3564048634010264629.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241209222938.3219364-1-helgaas@kernel.org>
References: <20241209222938.3219364-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_154431_744485_9C09E8CF 
X-CRM114-Status: UNSURE (   6.98  )
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

On Mon, 09 Dec 2024 16:29:38 -0600, Bjorn Helgaas wrote:
> PCI Vendor-Specific (VSEC) Capabilities are defined by each vendor.
> Devices from different vendors may advertise a VSEC Capability with the DWC
> RAS DES functionality, but the vendors may assign different VSEC IDs.
> 
> Search for the DWC RAS DES Capability using the VSEC ID and VSEC Rev
> chosen by the vendor.
> 
> [...]

Thanks, Bjorn, for sorting this out and also to Shuai and Ilkka for
giving it a whirl on their platforms.

Applied to will (for-next/perf), thanks!

[1/1] perf/dwc_pcie: Qualify RAS DES VSEC Capability by Vendor, Revision
      https://git.kernel.org/will/c/b34d605d120f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

