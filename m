Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4C4C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 22:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vhLrSGY9svoYEa5H9hIeWUA3Z0wbe2vysdY+foWNbO8=; b=0zcGzawZctlNmiiHwwUYFFtiGG
	oXJlhUdCuSzK2YtO7bsQTOikq+DmZQ6S4W54iNQvo/ptgVsvaKd1qSdMAVZOyJEznzUZbi/T4nn7u
	6hQ90Xdx9wrHGq+f/nXxre91GmLaQrFHNMb6Rezw4Yrdr2EUCk7/RehYj3S1HpXeIjHZbRALoC6KF
	Gz1VilH3cKr/eEoFmiEaucFZLGgShmYSNcgHAgZiJSh65Z5XqM4Vg24NYxsxqkVmLwBtDNh/f+Ys/
	yxNvjf62VOOcb2GsQn1Tr74ArKf5GkjK1Avm3H4X5W0HFc/a9fbUsWFEykJyhusKh+j2PPhR4ThEA
	c52Vsbbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwozt-0000000AcU9-25nW;
	Wed, 19 Aug 2026 22:43:01 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwozq-0000000AcTa-3UgV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 22:43:00 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47f84023916so1453676f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 15:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787179377; x=1787784177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vhLrSGY9svoYEa5H9hIeWUA3Z0wbe2vysdY+foWNbO8=;
        b=pVSBdZ6LNKF2LX+/jlQzcdrUYZhFKpJfbKsBC14hkdaw3haAdYoi7WBOMZsT97ojr8
         Q+8u3hD5+Ep7umwD+QXCx/P1B1e+nE+kuxxyBULfhlijVHWy4/KYmfxxTLOhZcTtser4
         s/hi7/2bgEBsYZFexCmIn+Re5Xh+Y4DEUEABJmgHrBjDVfSmg5WIBmCWkxTti3T8ojrR
         c8UmJsVTZ37Z8rrIhE6/o4TRcLLC9EGtJ0oj2Wx+qof77llNOyZdxPbCVhLd3tisye98
         BZx9/nxDhGTQ2NzA0ILOLYnJttybC1FC1jpw8y8IIdOEgos0tQe7lKLl1WhGuLRgPvLN
         4RaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787179377; x=1787784177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhLrSGY9svoYEa5H9hIeWUA3Z0wbe2vysdY+foWNbO8=;
        b=NBAzPfuiZsNCO5othBDIDIg/XXcvj9ko9CAR7+l6GhaSeAm9raJw9r/7mEzYm1rfI0
         p5Drrk5IN05hZ+eEaccJfHH1ZINHi9e5WNgnDx8MVDH8TyCvJgzL8Ty3Taau5BTxXU9J
         nDRcrse7aGQOIMMQOmnm4flU4YmJKTlXHzp/gwPW8h55yGmkYpkNDu5LmxWHSzb6So6z
         vcDJUFIenRfU8HWUcCJSwdPAPl0ziOlE7dMzfRfp0JkaiSxN72gU6eswI9hVvD3FQeH3
         SrtWL+g7adrF1HXBQMXlp9SSF1TCqigOMKldhgyjY9DyDZ9Edgx8/RuhNaJlUpmQo5di
         rkZg==
X-Forwarded-Encrypted: i=1; AHgh+RrNy6W4NUwmOVyBWHgljX27MPkkd/ranrBS7jAadO4LKkIOGi6uzTvh9m8oKj3Bf3Xj2n63dZzWQ+mWBQDmFGRq@lists.infradead.org
X-Gm-Message-State: AFuF++lc/TvGyAlYJtgckkRd7y/AMicDs5FpWN1kvuAINx9q24XB88J3
	GCncDkWMf/OEjAA4qjH9YcWg/UtLFSLDAR9IdyX99/IkWHwACwolzkll
X-Gm-Gg: AR+sD11M2sdkRLhyMNHCP7fZgS/xMYo+Np9gaR3PctMDkmcIifkSF0uEIMtk8JkkEI2
	xj74QzyC+C97Do07xxu0ayRzbnZHo+BSLmg9Djb5vakgEylL4zfwac1ZnVFfqX86n1/WIMo+/wB
	z++Itrk+4iXdwBV65DR3Jx+oxmR+9UBBQWF4PqFl0SxoUltDtVvAr+G1/7vn8OcozHhAIIJR+yx
	+aOfGW1KcYqukHQN3xr8i1Y4/ASX9smkHMQ0jYfnY2SRrQCegoEqtTChmrqD4rv/SXwThbIhozG
	Kdid27Qjei2le9QRPryDvb7i8ubv/sDn2i21N+0CXaojkxTHUm3rRsCEwzrV+PSuOE70gZPRjqe
	4DRwf7o0oo7w/2NH31QWekqENYEjob8XJK5++grUSQuCc39sTHEjq0TStAJjvB0wVt1xKnrbT6D
	yxFp6uXWT9W77ELU+ZfJq6qgTDRrkKbUzi1OsUHSRfvjwTjYtK2jt8Xg4WorKXrSaczK6TkcCuJ
	bRjldGu4ten+Oi4st9OWvykoUhWNzt+M5Xv47jiVtjj22MoApJCpKA4g/kCjeChV9G8cQ6n7K4M
	/dOeTH/AbVgH8tP6WO4iSw5mx6bpwh1omX01oHCG7eTtTBVfFbsKJVJp2zlanDdqY0AW
X-Received: by 2002:a05:6000:41de:b0:482:a36c:a5e1 with SMTP id ffacd0b85a97d-482b1e875b8mr15751227f8f.1.1787179376510;
        Wed, 19 Aug 2026 15:42:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae9e-1d01-58d3-443d-4fa6-01cd.310.pool.telefonica.de. [2a02:3100:ae9e:1d01:58d3:443d:4fa6:1cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450e61sm8553317f8f.13.2026.08.19.15.42.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Aug 2026 15:42:55 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
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
Subject: [PATCH v2 0/5] KVM: arm64: fix VGICv3 redistributor rollback
Date: Thu, 20 Aug 2026 00:42:24 +0200
Message-Id: <20260819224229.82948-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_154258_938654_023B7D5C 
X-CRM114-Status: GOOD (  13.22  )
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

A failed REDIST_REGION write can unregister redistributor iodevs while
leaving their cached vCPU assignments and free_index values intact. A retry
then skips those assignments and succeeds with redistributors missing from
the MMIO bus.

Patches 1 and 2 fix VGICv3 redistributor failure handling. Patch 3 cleans
up redistributor teardown. Patches 4 and 5 extend the KVM selftest
infrastructure and add regression coverage.

Patch 1 reserves the current vCPU's region slot before registering its
iodev and releases the assignment if registration fails. This keeps
free_index consistent with the cached assignments.

Patch 2 uses the same cleanup during redistributor unregistration, allowing
the existing rollback to reset the vCPUs processed before the failure.

Patch 3 unregisters redistributors before freeing their regions and removes
the region destructor's now-redundant vCPU scan. It is not required by the
first two patches.

Patch 4 lets the common VGIC setup helper select the guest entry point.

Patch 5 adds a regression test that rejects an overlapping region, retries
at a valid address, and then accesses all four redistributors. It exercises
the failed region update fixed by patch 2. The MMIO bus registration
failure handled by patch 1 is not fault-injected.

Testing: built the patched kernel and selftest in an arm64 Linux Docker
container with GCC 13.3.0. The selftest passed under QEMU 11.0.2 TCG with
-machine virt,virtualization=on,gic-version=3 and -cpu max. The same
selftest against the exact unpatched base failed with:

  Unexpected MMIO exit at 0x8030008

---
Changes since RFC:
- Reset all redistributor assignments after a failed region update.
- Split MMIO bus registration failure, region rollback, and teardown
  cleanup into separate patches.
- Split the selftest infrastructure change from the regression test and
  check all four redistributors after retry.
- Rebase onto the current kvmarm/next.

Previous version:
RFC: https://lore.kernel.org/r/cover.1786344511.git.kmehltretter@gmail.com

Karl Mehltretter (5):
  KVM: arm64: vgic-v3: Undo assignment on iodev registration failure
  KVM: arm64: vgic-v3: Reset assignments after failed region setup
  KVM: arm64: vgic-v3: Unregister redistributors before freeing regions
  KVM: arm64: selftests: Pass guest code to vm_gic_create_with_vcpus()
  KVM: arm64: selftests: Test VGICv3 redistributor region retry

 arch/arm64/kvm/vgic/vgic-init.c               |  11 +-
 arch/arm64/kvm/vgic/vgic-mmio-v3.c            |  33 ++---
 tools/testing/selftests/kvm/arm64/vgic_init.c | 117 ++++++++++++++++--
 3 files changed, 134 insertions(+), 27 deletions(-)


base-commit: 57e7cf13ac26bf1a3dba6cfa601f7b2481811575
-- 
2.39.5 (Apple Git-154)

