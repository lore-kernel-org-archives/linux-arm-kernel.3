Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADABC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzYiWjns9SZKk3/JOb3tjlXdoAX0QRH3U0Hu6JjLAiQ=; b=y7AO9fVTHh3D3IeJsbMpGa7jQj
	dBQoiCvHaMDQUbAt59sEw0ag8HFH4k85xjopZuTDHNfK981uGXyDZAOQe5Hu2ncNN7OufX260xTiK
	260BpI+UoFdx8x82pxJVdMMl8BIYbGgx1j39f/VALTl3MkuTBhpH2SxsZoB/6ibwj4NOXHmKDPkuk
	UMjXQjUXjN1ZMjvtDZ9ynvEdrTRLcApr/sy+/RJts/SZXpvUnvscFgH15ssA2ZuPooEd9CanaNCrN
	DUNp09KTd8Ulxd8vx0PByCa4yM++cGw2qbCp+MwU3mNAOyB1aHTKqWWARdOSL0qCVwLzWY25v9A69
	IaxNzqHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKca-00000000mZJ-3v6p;
	Tue, 04 Feb 2025 15:13:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKbF-00000000mRc-1au8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 15:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 71B2BA4286F;
	Tue,  4 Feb 2025 15:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41502C4CEE2;
	Tue,  4 Feb 2025 15:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681948;
	bh=orB1CWrzjCAT+8Sk6a1qTdMMrSItL1nmWGKlxMd1Ssk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ViygaYFI38gnIA/jkFpMlSaIv7PdpY3d90jaOQIFt4OZP0GVnMPKYDfwIBtBJj7GQ
	 1srWI2H+lJSrNXwD7nhFGdlHbsMlEMQq6xFX7nYCCvOPkIuBDTt+MzkBUyeaestahJ
	 459EJbOOMylMnf3Wx2UJl3VzpiRPvga14IRDW78vgMhKjT9f34UmJuheO9bx6raXub
	 gabzSJ54b13esREX5uyUurv0K58bvgHmd9DXbxOsx7Vx0SK5LDcOAvWANZdS3mY2Y6
	 I9AcWM+yYjZEX8BKd/ZpWRDDd+1pM2G1kujRAMtb6NJGTmpttBxmJIxnU3knG+XCcW
	 JD2K2ys2LLu4g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tfKbB-000SzI-SF;
	Tue, 04 Feb 2025 15:12:26 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Dmytro Terletskyi <Dmytro_Terletskyi@epam.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 0/3] KVM/arm64: timer fixes for 6.14
Date: Tue,  4 Feb 2025 15:12:21 +0000
Message-Id: <173868192612.774962.17867679674962882346.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250204110050.150560-1-maz@kernel.org>
References: <20250204110050.150560-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, r09922117@csie.ntu.edu.tw, Volodymyr_Babchuk@epam.com, Dmytro_Terletskyi@epam.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_071229_478480_A8437495 
X-CRM114-Status: GOOD (  10.97  )
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

On Tue, 04 Feb 2025 11:00:47 +0000, Marc Zyngier wrote:
> It's been recently pointed out that the NV timer code that is
> (hopefully) on its way upstream is marginally sub-optimal (read:
> terminally broken). This short series attempts to fix things:
> 
> - Correctly arm a background timer in all situations
> 
> - Avoid corrupting the EL2 state by shoving the EL1 state into it, and
>   simplify the handling of emulated timers
> 
> [...]

Applied to fixes, thanks!

[1/3] KVM: arm64: timer: Always evaluate the need for a soft timer
      commit: b450dcce93bc2cf6d2bfaf5a0de88a94ebad8f89
[2/3] KVM: arm64: timer: Correctly handle EL1 timer emulation when !FEAT_ECV
      commit: 1b8705ad5365b5333240b46d5cd24e88ef2ddb14
[3/3] KVM: arm64: timer: Don't adjust the EL2 virtual timer offset
      commit: 0e459810285503fb354537e84049e212c5917c33

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



