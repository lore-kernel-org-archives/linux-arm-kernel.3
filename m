Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014FCCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 12:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGL/QMkXhGp4RMJCeorSCQM1mqxZY8KjXd5vjpbYZ8g=; b=Tz+TRt6FjDpgEWwU5rJLxN7elw
	3g7sO66x+DJuxzjNU9or9tXkazNgWpPsxPmSiIXudAZ+GA45gF4WwZL+BPbXB6rw6ZQxk/SdNM9LP
	PR43RZTys9C7Q92r1NFNXClxATJfeg1/GPYzXvE+rRkSje2ZF9dP5N8uyuoMHAXHpaaMr2xWJmSdg
	1bN1cVgn1pARZbesAVHbbBwP0VhJylX3UZ1BtwWalYZ674jXzOVoTbAkfDKdy253LVqGrIVFfpBwC
	5chQeCmDyS3/C8DSV/k/XrXAE6iI10Qv/t+T+AiEHXguHEF8sTGJFrzfxxD8xIBpvWFqQsyy5T17+
	g2//3PhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCyYw-0000000DSpH-3R12;
	Sat, 03 Oct 2026 12:09:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCyYv-0000000DSnr-2HVd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 12:09:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EF6E60D8B;
	Sat,  3 Oct 2026 12:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4497B1F0089B;
	Sat,  3 Oct 2026 12:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791029396;
	bh=JGL/QMkXhGp4RMJCeorSCQM1mqxZY8KjXd5vjpbYZ8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZUIHszFBWdJL7uEiD1n2erTbHkaqEp6cI1LuyHBgc2W0BgH2BkEoEpNdeEBqKaanV
	 kVGU8UGOH4N1NhNOTGfTSeCioS/qjrgiFWd0+UoL2RdBZtREfaHpCpOhmJXHdwRwqg
	 h7KiYD5lkRVB+sXhgyb6CgvkZrRUOxtP1qWU+VkYsrwpE7WJBzuAvRb093gRVceCg1
	 VjhMEH3QifZ5E0sdPbWGPAhg3x3Z/l0QG40rozyy0ZkhkG/naKDYTB6rm4m/djEblT
	 m4vnXa+mnEdolmX8hrooGIVRXgA3sK+f8Fsb9n5x/oeDHus+yh/LyESjxBVIzzyGr8
	 5J3wYSYyC8aNg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xCyYs-0000000GWg2-1VO1;
	Sat, 03 Oct 2026 12:09:54 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Eric Auger <eric.auger@redhat.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 0/4] KVM: arm64: fix VGICv3 redistributor rollback
Date: Sat,  3 Oct 2026 13:09:47 +0100
Message-ID: <179102937974.606863.14966815402527336266.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831081005.41346-1-kmehltretter@gmail.com>
References: <20260831081005.41346-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, kmehltretter@gmail.com, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, shuah@kernel.org, eric.auger@redhat.com, christoffer.dall@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Mon, 31 Aug 2026 10:10:00 +0200, Karl Mehltretter wrote:
> A failed REDIST_REGION write can unregister redistributor iodevs while
> leaving their assignments cached. A retry then skips those vCPUs and leaves
> their iodevs missing.
> 
> Patch 1 fixes the accounting when an individual MMIO-bus registration
> fails. It reserves the selected region slot before registration and undoes
> that assignment on failure.
> 
> [...]

Applied to next, thanks!

[1/4] KVM: arm64: vgic-v3: Undo assignment on iodev registration failure
      commit: 8a88a46b86ca3dbbd24522760d29edfb3f24ac2a
[2/4] KVM: arm64: vgic-v3: Roll back assignments from the new region
      commit: 4dbeadeb6ac44819d0f301c1403552695ecd3ca5
[3/4] KVM: arm64: selftests: Pass guest code to vm_gic_create_with_vcpus()
      commit: cb5e17e05bfd80a15c36a51a0386f566cb27e73d
[4/4] KVM: arm64: selftests: Test VGICv3 redistributor region retry
      commit: 74c8641bf0b5412b064cfcfaa3603e387aae4b21

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



