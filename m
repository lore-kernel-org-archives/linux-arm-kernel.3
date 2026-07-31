Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB549C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdiDIa8NUQSLfVGJe/NaVaWb+skzu3+raBFzb05hxto=; b=mtew+N3Qpb0ylgB54llK727aUQ
	NzztIFRu2Ok1ciwbha6XoTxCO06xsLk7nrrFKL5Kax6ErzYEvcI8CjZUjWRd8jZRZ4jSZVemP2Csj
	nTzcJ7oFIHzctpPld5FWUcwSn/E5Lrsjk32nxNdPs3Z41LVuxZjUFwG/jkqTZKqjEzduwKkEKjOv8
	XSgq0qxbKjBmYtompJ/BRZUZb2QX4mwKAfSmPpCyUwSWu2PFkgW066WXqlvyaRW8868jtqMkmtjAS
	RfG18YeV8FZmJuSY3k9KC+QIBTh5sFYhQVG00htsWTXDC/74IXbo2tljDoRw0sHEcCpfsWlUritGj
	mjnpJ4Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpsLY-0000000DQ3O-29e4;
	Fri, 31 Jul 2026 18:52:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpsKp-0000000DPmz-3V8G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:51:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F7D460A77;
	Fri, 31 Jul 2026 18:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805081F00AC4;
	Fri, 31 Jul 2026 18:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785523914;
	bh=XdiDIa8NUQSLfVGJe/NaVaWb+skzu3+raBFzb05hxto=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SJWUOkonsQEKYzJ17537pNVwZXUV/oYXelsRh6p0kHOmhjqlvBhu/GfQod+9O6ghz
	 mGJOjdoiu9YmpEae02Z2T8XxpnazLFW6ptzCdXC/0yQDhYhQmo1H0hJRF3zP/Da5YV
	 Nifh0g4sE23HaPGqkM8zSZxNC4iAkBYPjrMGyKr6UQOuhrWbX6RwDsc9fMSrJpoaAs
	 fKxHkkyT5+6a0F0hu7KuhaZ4aqp1Zw8/JOEfcDtyZhc86UCKVIKSQ944tiXzVtFTKM
	 mWZFTQ3BYi0rrXtHfY7m7C536KVDGrIUd7Qqgud/Q0mFZMawTIIh5SjYboFZm30TMR
	 qNkahoHalUQKg==
From: Oliver Upton <oupton@kernel.org>
To: linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Mostafa Saleh <smostafa@google.com>
Cc: Oliver Upton <oupton@kernel.org>,
	maz@kernel.org,
	seiden@linux.ibm.com,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	vdonnefort@google.com,
	tabba@google.com,
	sebastianene@google.com,
	keirf@google.com
Subject: Re: [PATCH v3] KVM: arm64: Optimize protected mode with FWB and DIC
Date: Fri, 31 Jul 2026 11:51:49 -0700
Message-ID: <178552142327.30097.5768444825254040023.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723162002.3848054-1-smostafa@google.com>
References: <20260723162002.3848054-1-smostafa@google.com>
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

On Thu, 23 Jul 2026 16:20:02 +0000, Mostafa Saleh wrote:
> KVM opportunistically enables FWB if supported by the system for guest
> VMs, which allows it to elude cache maintenance for data as they are
> forced to be cacheable from stage-2.
> In that case, __clean_dcache_guest_page() will immediately return.
> However in protected mode, before calling __clean_dcache_guest_page()
> it loops over the range and fix_map/unmap it, issuing TLB
> invalidations, dsb() and isb() unnecessarily.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Optimize protected mode with FWB and DIC
      https://git.kernel.org/kvmarm/kvmarm/c/81b2d03f8c86

--
Best,
Oliver

