Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D19C98307
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVQjAaBFFW3dvBW1v+aV1twyKPPe74xtBKnCer/p5k0=; b=DpdJEZe6sA3+pKiBv+156bgLzu
	Gw0VOYPBbvjAbCmuitGhA/HecEC2i3wcLXYgk/adq0T3dhTDRFmRXqpEFBFoqY9/lXuO7VOVipD0H
	+Ki59ECkbHLOsF2TYuCPw23ywQZl397I2LiZOWXkGosnVKGpMEqnCThcS7Z4rEASBUabD7P1vCa4p
	OD1E6Hw4CxNcnyobW2WTmVQ7YBxll+wfjlTUgXAi/mj58LkV2EdheovwEBPyveM2lQBOc9kIylofK
	bGm/dvc3JTLUMYWMvyxrAdlYiIFBpAU6MggR2Xff8U8gd42zgbJcn8tMReAI9IDVBdU4NzbTIze5K
	KtXJr0Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Jm-00000005Sp8-09mb;
	Tue, 22 Sep 2026 13:13:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90JV-00000005SUK-2TDy
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 13:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jVQjAaBFFW3dvBW1v+aV1twyKPPe74xtBKnCer/p5k0=; b=mKng+I+mcOTpOcT0mQnbuBfGmn
	6aWSHqBZYa6oMXJMAPfWPTv32vVNvKHtFgeo5k2VAAHwWanzK9X/03aWSsvzw3t5i4HJaQXFX7WuG
	qxxo4O+WCp1eoXWP5HFAhqlA0fwJA7O4JgtZnY9g9+p1yFONCkaaSh/+GLf38EpCFBE6rWoAkqFeQ
	e4U+GCPD098A9v75rbLacE6tszGoyJXeHsAysdZURzjkCdPNE1pcnCLbTz60zFvYHoDiV1jCYBTPP
	IJgNvR+t1t7sckOmMFmOZUW4mwTjr8dVNAs51aMc9VPW9dGjnNTHkPSG6drlI+MXCi9x2Z3c90hlo
	34LlSlag==;
Received: from mail-ed1-x548.google.com ([2a00:1450:4864:20::548])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x90JS-0000000Dbgs-3Sb3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:13:36 +0000
Received: by mail-ed1-x548.google.com with SMTP id 4fb4d7f45d1cf-6a9b5240fb3so5217068a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082813; x=1790687613; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVQjAaBFFW3dvBW1v+aV1twyKPPe74xtBKnCer/p5k0=;
        b=OoW/Tvn8DluUaq13h9NWGoa/qCKU0987Ub0dXkpblxB4AvRX8eYbLBJSWC3kaM+S4d
         hat774s9jAqfRqa51aYLADTSpOnww2Sb/32amfg39Sxolt92cH+FozIrH0jn/ClU2z6Z
         LR/4Jw593GAteQwBFSV+HIPETRWIzGAX/7Rtd/dyUyUpmCjPPGkJhS0QGa/j+Jw4kgTq
         BCsJ7tJqlAT69mW8FOaWuJ5zP9mpMWy60/otMl1Kv0IPHusmurulvwOm7Eo9224ASSy4
         OGS5GQVskDR3CTuzXXuQtyP1f8U5F/0u1f8V9HZXA1n8w8CNvdf5BzGGr+vzMtrbqr6G
         M1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082813; x=1790687613;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jVQjAaBFFW3dvBW1v+aV1twyKPPe74xtBKnCer/p5k0=;
        b=Mq6ioM2CnIj/FtRehwJ9SozgT742BL0BuOkng1t2BEyJPA73jH6gIZnlOYmXQWBYhm
         xrLUwmrXp6DZI9a748HnpZZ2PEqhfN5VnCpGQrYwkI4xbmME2mKb2aiNz0O+61JAZysa
         lbmCKvLbkk6/tz+7vVsgLN2qStpQCgbJJ5SzREAMClNH5anbpNNcy2irBK+pGmucUDly
         eiPkSEXecv07skUXUworoE9uV5bLa6+Fof7VbwXSh4t0BGLhD3povJiIwpasdvODpxtA
         aeijbrqTnS2PkaLS1hbzJz4/FCI6x3yIrTuJYi2aw8d0A9Ke39tB/9vH66HUai3S1NdS
         HhMw==
X-Gm-Message-State: AFuF++nJmsYw5xL4OXwWp0pmjhb6Vj3rNWTcgyTn3xNN4tJMi9/yPrjR
	XkPOjAUODyvusH/lYYkbUbSu+zAfWVEflgWCixFoPnRKRc45HozxzE6Q16zxubtic1DwF+4zbZw
	vbV9EKfwjZHlC4FKRvEAQ0m3qqFNDZ042NUWSviDjLz44/6iQVqyIThtHVsXseOTL+ctzXrxj/W
	BURbfpbwQqB1DY3aTOMt4QGAzeo7VHK8nA2q8B7kcd4ui4Xlv5Z6KRVhZ1m0FYtlGjHQ==
X-Received: from edqt6.prod.google.com ([2002:aa7:d706:0:b0:6a9:c0e0:494d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:52ca:b0:6aa:734b:1a1d with SMTP id 4fb4d7f45d1cf-6aa734b1b6bmr7367534a12.23.1790082812533;
 Tue, 22 Sep 2026 06:13:32 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:58 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-26-smostafa@google.com>
Subject: [PATCH v8 25/25] KVM: arm64: Add documentation for pKVM DMA isolation
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_141335_002311_FA290712 
X-CRM114-Status: GOOD (  14.41  )
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

Populate the section for DMA isolation in pKVM with the newly
added KVM IOMMU and pKVM SMMUv3 driver details.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 Documentation/virt/kvm/arm/pkvm.rst | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/arm/pkvm.rst b/Documentation/virt/kvm/arm/pkvm.rst
index 514992a79a83..ce67e2ae1f9a 100644
--- a/Documentation/virt/kvm/arm/pkvm.rst
+++ b/Documentation/virt/kvm/arm/pkvm.rst
@@ -77,7 +77,28 @@ Status: **Unimplemented.**
 DMA isolation using an IOMMU
 ----------------------------
 
-Status: **Unimplemented.**
+Status: Supported for devices behind SMMUv3 supporting dual stages
+of translation.
+
+With ``CONFIG_ARM_SMMU_V3_PKVM``, the hypervisor will take over the SMMUs
+on the system and provide an architectural emulation to the kernel SMMUv3
+driver.
+
+If some devices are not behind an IOMMU or behind another IOMMU architecture,
+DMA isolation is not supported, as a driver must be provided for that.
+
+DMA isolation is enforced by dual stages of translation; similar to the CPU
+where a driver can register their ops through ``kvm_iommu_register_driver``
+and implement ``host_stage2_idmap`` to shadow the CPU page table.
+
+The page tables for the stage-2 SMMUv3 will be allocated from a pool created
+at boot with size configured from the command line "kvm-arm.iommu_pgt_mem"
+The size must cover the worst case scenario for leaf mappings of system memory.
+
+This implementation trusts the system firmware not to allow the untrusted
+host kernel to bypass the SMMUv3.
+For example, by resetting the power. In that case, it is the firmware's
+responsibility to save/restore the SMMUv3 state.
 
 Proxying of Trustzone services
 ------------------------------
-- 
2.55.0.1082.g2b9226bbc0-goog


