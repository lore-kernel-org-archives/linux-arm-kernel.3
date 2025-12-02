Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79958D12685
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 22:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WO4beATxt97tuU0VYWEB3HVRKidfyZCooXniUFdi510=; b=MqzrjfDdAzCACvPH2BTW0iuvzL
	vxpm5dLf8koNe60qgxUGnkEQ9IqdPvJwbfeT/zwENwrSbt08jNfcqRZcDouDlBjhe8n3V1AmWkikb
	cKw5E4Dhx93waCCcqHQJsU/R0GjzLoTw3wWuolWP1q/nDe87scS64eVJ5hSUamxtfnAVepSITjqFf
	69KTYVfXi2DfV1XyqTwIQvm4OaSSM+sAHqb5xfaEhrZnOOiG8Qx9U3qbw3/tmzXAHAUhKaCCxM7Hc
	PO4Ip2VqEzAt5n/ouQUN1gitFI2ezuWYIsFLinIRbA0N/1uywHnQBrp+AwUeMcPX8sxSyh5Sp7NPl
	LY6eYaSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQZ60-00000005uUu-2XSV;
	Tue, 02 Dec 2025 22:43:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQZ5v-00000005uUX-2dSC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 22:43:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC4374033C;
	Tue,  2 Dec 2025 22:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C840C4CEF1;
	Tue,  2 Dec 2025 22:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764715417;
	bh=GV4nmZlTqNhyK5x8C0GUeistp+nziFPdQUXBsboHFBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N+OG7h2StqSuMuBZhLDw0GRqK4uP5QDkjo1fRktjsnAKRVLG5XMuNPtDlpxgaWHsU
	 mu5KqH8TL451/7uUURfqh/J0H8C3UGOdmxyfeCGLZKhogteBy+2dJxmibmWcVICnqd
	 R45zpc7u6f2cIHrtMzCBXo+C20DcKk6kobttLeEbLYEF6I+EI6cWSGntc28wXu4PEl
	 3MPsrnpC/mNtjA13FngjE5LWM/Grqg1NGqcMbJP4GTH9U1BRHzo2nLs0g4V19Fp8Hz
	 RpM5yi2ZV6vCG/TEOJ4d5LZJoNG3mMu3WeG0vOPS64ql3UXqHi3gc3YC5K88azd3Ep
	 WTggPVCMY+Ksw==
Date: Tue, 2 Dec 2025 14:43:36 -0800
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH v1 0/5] KVM: arm64: Enforce MTE disablement at EL2
Message-ID: <aS9rmMgNna7I5g4F@kernel.org>
References: <20251127122210.4111702-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127122210.4111702-1-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_144341_823011_85FA259C 
X-CRM114-Status: GOOD (  18.59  )
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

Hi Fuad,

On Thu, Nov 27, 2025 at 12:22:05PM +0000, Fuad Tabba wrote:
> pKVM never exposes MTE to protected guests (pVM), but we must also
> ensure a malicious host cannot use MTE to attack the hypervisor or a
> pVM.
> 
> If MTE is supported by the hardware (and is enabled at EL3), it remains
> available to lower exception levels by default. Disabling it in the host
> kernel (e.g., via 'arm64.nomte') only stops the kernel from advertising
> the feature; it does not physically disable MTE in the hardware.
> 
> In this scenario, a malicious host could still access tags in pages
> donated to a guest using MTE instructions (e.g., STG and LDG), bypassing
> the kernel's configuration.
> 
> To prevent this, explicitly disable MTE at EL2 (by clearing HCR_EL2.ATA)
> when the host has MTE disabled. This causes any MTE instruction usage to
> generate a Data Abort (trap) to the hypervisor.
> 
> Additionally, to faithfully mimic hardware that does not support MTE,
> trap accesses to MTE system registers (e.g., GCR_EL1) and inject an
> Undefined Instruction exception back to the host.
> 
> This logic is applied in all non-VHE modes. For non-protected modes,
> this remains beneficial as it prevents unpredictable behavior caused by
> accessing allocation tags when the system considers them disabled.
> 
> Note that this ties into my other outgoing patch series [1], which also
> has some MTE-related fixes, but is not dependent on it.

To be honest, I've actually been having a bit of a hard time
rationalizing some of these targeted fixes for pKVM. It has been in a
half working state upstream for O(years) and we haven't made forward
progress on enabling pVMs.

Fully aware that guest_memfd has been one of the long poles here, but
I'm becoming less interested in fixes addressing "pKVM policy is XYZ"
without having the full picture of the feature.

What are the upstream plans on enabling some basic implementation of
protected VMs?

Thanks,
Oliver

