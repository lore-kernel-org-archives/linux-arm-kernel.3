Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310F0CD8C89
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ql26d6LUbgj2+4SuVgw7OctlciRpnyFlg2ZCz97GwL8=; b=QfaHPs+eBN+Ac4NXVvlu9ERWnt
	RAB6TwQRe2o55wcwns6rsgDm1Vzmt07sjOdCajCireLT4wBJH+TzD9ha+jKAPKH5THFy+KUxGehsf
	pVQQ0dPo3IjGqSWPcPHpSH32izH6B/PGxCO6ajE1pjpP7hJNrOxZlUONof8iRy9w5MP8gzxWRrkcD
	wBfTjE45nZai5ntp3859e1rr/ki7UYey0EYl6HRmnDBpi6q9sYwU2p5IflGSU6vfnkFpTceJQX7ee
	BCSxxlyWvvsLmMqou6B/qH1P+R6ly//HI19Xwy1HJIv940c3DtN4oCcVm17/Gt/d/bVPpWvqUS3RT
	vb1ooW+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWGvm-00000002MEx-3dil;
	Sun, 07 Jun 2026 17:05:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWGvl-00000002MEW-0SlU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 17:05:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7979960018;
	Sun,  7 Jun 2026 17:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED1D1F00893;
	Sun,  7 Jun 2026 17:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780851899;
	bh=ql26d6LUbgj2+4SuVgw7OctlciRpnyFlg2ZCz97GwL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kh6A5hh2B+61lHznzFUVxznyXcz5QyAqvDMVhu8zlqyRImPiKyOHwtwqCI9Xjdkgv
	 zBgFAIFhKHMdL5qZP0VLRBIhfIcoMaek69XauziYkS6MhRYgR4c5EC5IWVXpCOFHvv
	 vTR22f9EmU2PL4NlWcIlSmxHpjBXEt4mP8sEbo7/BOiN9LKWHFNAAOC5sV3+yXJo4O
	 bFdT3Ey1Kf5dPoKMCqE0Mr3JWybrJKdXSCXHRcQ3Fmz6wV2Zw2Ny6zinW9CDdiKkrS
	 0bb/rzL4ciE/1qdoUp9o+5rS3fXTjKZbLUY/1Og15NJT2KMLaMm0J7q700AaC7kqTH
	 M3zTRBZmFhE0A==
From: Miguel Ojeda <ojeda@kernel.org>
To: gregkh@linuxfoundation.org
Cc: achill@achill.org,
	akpm@linux-foundation.org,
	broonie@kernel.org,
	conor@kernel.org,
	f.fainelli@gmail.com,
	hargar@microsoft.com,
	jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	lkft-triage@lists.linaro.org,
	patches@kernelci.org,
	patches@lists.linux.dev,
	pavel@nabladev.com,
	rwarsow@gmx.de,
	shuah@kernel.org,
	sr@sladewatkins.com,
	stable@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	torvalds@linux-foundation.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH 6.18 000/315] 6.18.35-rc1 review
Date: Sun,  7 Jun 2026 19:04:40 +0200
Message-ID: <20260607170440.90814-1-ojeda@kernel.org>
In-Reply-To: <20260607095727.528828913@linuxfoundation.org>
References: <20260607095727.528828913@linuxfoundation.org>
MIME-Version: 1.0
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

On Sun, 07 Jun 2026 11:56:27 +0200 Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.18.35 release.
> There are 315 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Tue, 09 Jun 2026 09:56:45 +0000.
> Anything received after that time might be too late.

Boot-tested under QEMU for Rust x86_64, arm64 and riscv64; built-tested
for loongarch64:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

arm32 builds fine too.

However, on arm64 I am seeing:

    arch/arm64/kvm/nested.c:1776:2: error: use of undeclared identifier 'resx'
     1776 |         resx.res0 = ZCR_ELx_RES0 | GENMASK_ULL(8, 4);
          |         ^
    arch/arm64/kvm/nested.c:1777:2: error: use of undeclared identifier 'resx'
     1777 |         resx.res1 = ZCR_ELx_RES1;
          |         ^
    arch/arm64/kvm/nested.c:1778:33: error: use of undeclared identifier 'resx'
     1778 |         set_sysreg_masks(kvm, ZCR_EL2, resx);
          |                                        ^

Due to commit 10206eaad1b9 ("KVM: arm64: Correctly cap ZCR_EL2 provided
by a guest hypervisor") here.

`resx` indeed doesn't exist, and it seems like it was added by commits
0879478913dd ("KVM: arm64: Introduce data structure tracking both RES0
and RES1 bits") etc., which are in 7.0, from this series:

  https://lore.kernel.org/all/20260202184329.2724080-1-maz@kernel.org/

So either we make a targeted backport or backport some commits, no?

I hope that help!

Cc: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Zenghui Yu <yuzenghui@huawei.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: kvm@vger.kernel.org

Cheers,
Miguel

