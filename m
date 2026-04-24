Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B9DFE5202
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 11:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBvRUhGont3QNqfCyXYiWQD9y3DBlZr+jlfnvLDE+kY=; b=HbONZrtrDMx/+rQoNrr94UIz1c
	qwaq13KOmoBaKCzLJxy6LxrJnNjkWfhIjwsPT1FnsCt7J+nWW09W5yzrVxoHJ9q0Se0swZVl+GiBR
	WGKuKpHdFpm4XZ10OA2xCk4wL/02QsYazgj7sQDz1nVkf3TA632UPV1sInWNPH+bzGLeT7PL6eFmQ
	SoAvua0QzcwnorQMLKstd1RdctMBdTiiWQG8nFh8h+JrTz6Osz83OhpFH/iGQVn5IZRtKDFdeNN6k
	mZan4MGiX9KCDWvChKQ3Acza6kqazeTBgCF99A3NgT8D9FXLGLwQqRT7Sm+MrHl2LjSGzgKON9Doj
	aRvwbkrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEOG-0000000D4GX-0pKl;
	Fri, 24 Apr 2026 11:08:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEOD-0000000D4Fm-3glT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 11:08:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2732244312;
	Fri, 24 Apr 2026 11:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD78C19425;
	Fri, 24 Apr 2026 11:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777028885;
	bh=EhTixBg2942FDflTxtXBYV+26rSI2mTgBToDUlR3aI0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gyLsioWS5UkEU/oiFMqlSXoZ/KEgJoWh5e1lbm7vRt1m8h6wiureytQh1/CpEvSjq
	 UxYGnWQlFTW3mpCio70n3eisrCnXOjs9UcarC1eTY0DtkXTwmgPpz8IrTn4hV06pOq
	 Nhe8Im1geRV7iqZx1OZbwwMuZbjRHEXWPC3gcvgvFTcHd+WCZ2661lb1CvJdbc5cSh
	 l4u9acMIVyDT8UTSUlkAenrMYOPEMvlYSJ4k+ItlgAV8gj9DIIsQKExGrfLly9ut9t
	 2CUBWlTveBbgoXYbuPugjG/kozw652T0pt3Xhm5ECHSQeOKhA9IOAR298hZo380dfN
	 VWSNRF7Vk687g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wGEOA-0000000ELuP-12bL;
	Fri, 24 Apr 2026 11:08:02 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: (subset) [PATCH 1/3] KVM: arm64: vgic: Fix IIDR revision field extracted from wrong value
Date: Fri, 24 Apr 2026 12:07:57 +0100
Message-ID: <177702878141.537738.13460155220731277452.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407210949.2076251-2-dwmw2@infradead.org>
References: <20260407210949.2076251-1-dwmw2@infradead.org> <20260407210949.2076251-2-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, shuah@kernel.org, dwmw@amazon.co.uk, rananta@google.com, eric.auger@redhat.com, kees@kernel.org, arnd@arndb.de, nathan@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, dwmw2@infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_040805_960382_0D5313B5 
X-CRM114-Status: GOOD (  12.12  )
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

On Tue, 07 Apr 2026 21:27:02 +0100, David Woodhouse wrote:
> The uaccess write handlers for GICD_IIDR in both GICv2 and GICv3
> extract the revision field from 'reg' (the current IIDR value read back
> from the emulated distributor) instead of 'val' (the value userspace is
> trying to write). This means userspace can never actually change the
> implementation revision — the extracted value is always the current one.
> 
> Fix the FIELD_GET to use 'val' so that userspace can select a different
> revision for migration compatibility.
> 
> [...]

Applied to fixes, thanks!

[1/3] KVM: arm64: vgic: Fix IIDR revision field extracted from wrong value
      commit: a0e6ae45af17e8b27958830595799c702ffbab8d

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



