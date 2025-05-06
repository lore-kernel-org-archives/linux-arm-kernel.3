Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9D9C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyBeZU6U2nNbFpIUZ3hiZgcwuDzagfJB+ITP2wBlFxI=; b=FzXy0kk/7EGQVgvfZMN7pEqBs5
	oaw2VvBZz+h5gWpVQM51pN+u1bQfXB6CKVyDvVhjZqU+oHEExfpT0MBwWcrwnDMYa+vvm+IDhSltu
	1EYhMIDgjQoLLgnXff/Uq4yQSOUHjQExWCkb7GlWHrPrxh8m8x+U1NmHA4Wlki0sjulJ2k0gG6Nw/
	E0KB3PtBUYJN1exEA2fzZpA2jOHxor+jPoN9dEZg2GlEc9Xf4dHSjrbTHJZRFqZ/vw6r0EDyyIFpL
	2ALiriagWx7N1G55sijpeRUtG5eHrTiCkc/zJNUjePWc7NPo7oEwp70SYyZ/bTd9/zvemca9APeba
	CTdSaZiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEaj-0000000BNE0-0NvB;
	Tue, 06 May 2025 09:27:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDsQ-0000000BCZT-2ba5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 08:42:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7EDD5C55C7;
	Tue,  6 May 2025 08:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88965C4CEE4;
	Tue,  6 May 2025 08:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746520929;
	bh=A7JVTQBmPAjbRx9TJY0iNXrjPsM+vyowa0qQxX8aIdE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jDgY1wOZEvtEAdiSKgGul5Yy3klRVr/w1XasyAcx0GBu2abasCZ/H1/sGCacniZja
	 vYcrgAU7gTO0IuyTTzV7WXtWBevUAPbKV5Xu/hBklRDSR2C9Vn2g67zZMo/VIXnfw9
	 8aF2kqx/h40Iwwi0OMS+u/i8Mvbw5LhVYdNu89hkv3B+XdZZZ+BN7l2H1S+vqrS9ia
	 NEK5Ti7eV6/S1zHH97pZSkl5EgmEArUlo9Lko9IOV9R21RI5BILFyEo/69TjnmHQxF
	 wpQb2/9csIjMIPou/iuRW1af05bMZwa9xT1zMXSH5mtOFFIP+DuRhns90SUJvfvL0g
	 4ePuhF3opagIw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCDsN-00C9Jj-B3;
	Tue, 06 May 2025 09:42:07 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	D Scott Phillips <scott@os.amperecomputing.com>
Subject: Re: [PATCH v2] KVM: arm64: Force HCR_EL2.xMO to 1 at all times in VHE mode
Date: Tue,  6 May 2025 09:42:03 +0100
Message-Id: <174652091367.339365.17018853732670126384.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250429114326.3618875-1-maz@kernel.org>
References: <20250429114326.3618875-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, scott@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_014210_701048_D3703FEA 
X-CRM114-Status: GOOD (  11.87  )
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

On Tue, 29 Apr 2025 12:43:26 +0100, Marc Zyngier wrote:
> We keep setting and clearing these bits depending on the role of
> the host kernel, mimicking what we do for nVHE. But that's actually
> pretty pointless, as we always want physical interrupts to make it
> to the host, at EL2.
> 
> This has also two problems:
> 
> [...]

Applied to kvm-arm64/misc-6.16, thanks!

[1/1] KVM: arm64: Force HCR_EL2.xMO to 1 at all times in VHE mode
      commit: bae247ccade0a5016031e73c9f6d61b758b612d8

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



