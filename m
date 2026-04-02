Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0616D6AB16
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 21:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHF3f1NuqzOH0gm3RYAjtdcVfLcR5XF40cu77AXJm2Q=; b=4SlA23DEp5Jwm6WEvTm01+ZEh2
	BpKftklRJTmIkZidE7idt/OZU9z81pNOtYZv5xm9Zl9cflpuhu1ov9K8H7OVRpu3gvU8AZJ5P+vGF
	Nns4ALNAkC/WsKBwnymDXf4cFq37hbO0qG/ef4h+YA84aUyhfDh/0syLnsuwDeolZyfAXtqOI7i74
	IVDTyLXnGFJT/GY8T541lDVhcKLwX9OEaBcf4TL8WozG49vy+agki4BW8Qvgf9or4UP0YzVC5dE/0
	CCafCPVJNycpNG0WagjbTSlXQpDekchIpFJTfQuOqzjWrLSKF7ymRYI/AY3Mq1LPIMy3R1EtLJ1nX
	XUfrlVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8PMh-00000000mVt-0AaU;
	Thu, 02 Apr 2026 21:14:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8PMf-00000000mVU-0IaX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 21:14:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8A4D19F6;
	Thu,  2 Apr 2026 14:14:01 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17AE13F7D8;
	Thu,  2 Apr 2026 14:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775164447; bh=I9dw14O86cZwkKMn5PUe2owUIFbxPW/XNrvSe558xsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NUdab221kb6KYuy9thKc6lr0wavgu6G0BdzLcaJyX/ORI0eU/ChjYSG6lxDSuHXA8
	 fHN5vDTYyvgPT+hoq8NrZKJ4GHDaxtuDhSl3FE2itE/3xEMa6nHaegoCLnHUkSowYl
	 xJOQDb+Epa+QlgYWE+3FczNfLY849JDaZPWkjQBQ=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: (subset) [PATCH v10 00/30] KVM: arm64: Implement support for SME
Date: Thu,  2 Apr 2026 22:12:18 +0100
Message-ID: <177516433892.97388.575450953513622752.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_141409_177385_270431B1 
X-CRM114-Status: GOOD (  12.97  )
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

On Fri, 06 Mar 2026 17:00:52 +0000, Mark Brown wrote:
> I've removed the RFC tag from this version of the series, but the items
> that I'm looking for feedback on remains the same:
> 
>  - The userspace ABI, in particular:
>   - The vector length used for the SVE registers, access to the SVE
>     registers and access to ZA and (if available) ZT0 depending on
>     the current state of PSTATE.{SM,ZA}.
>   - The use of a single finalisation for both SVE and SME.
> 
> [...]

Applied to arm64 (for-next/sysreg), thanks!

[01/30] arm64/sysreg: Update SMIDR_EL1 to DDI0601 2025-06
        https://git.kernel.org/arm64/c/85b6f920a869

I looked to add more core arch patches but they all look like
preparation for subsequent KVM support. If the subsequent patches will
have to change following review, I couldn't figure out whether the first
3-4 patches in this series will remain the same.

-- 
Catalin

