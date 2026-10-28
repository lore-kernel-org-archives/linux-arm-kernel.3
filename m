Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A2F606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 17:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=11Bc+XgR;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YlQYXeA+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=O9rfZ0Jd16n3nkrrXaqreL+BHcitQpk1LeDPhsNkX+I=; b=11Bc+XgRFz+wTvonTkWxdSPJa9
	8tKuYeRfcQWdbBadSC78JZbNqi5FQV56F7uwjucNiINwcN7IXGTjNrOmCLznTmusAwa3OUb8fsEcZ
	PhPcdNhhDUs9XX5Ix3xXIWLkq+Z1Ah7sezXjcedxzAmDO9MYYEN7PSFwyx5ZizObVi8l5QQMy3ubw
	uzOe3a5pXbxJbhk8Vp/Lyfk0mV2G8Cu1tNMZteM2ChUKN42C8iBp+OqiO+Fydj6xOGItHE/+eavUe
	hYIfhZbH/+25eEcPPVhBvDsVceK+ZqWA0ERKa8cXSDROjnHTQxJocKPCbvj8CKzRdBg61YDVip4ts
	Zt1Wh5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7Wl-00000007fiJ-1hxt;
	Wed, 28 Oct 2026 17:33:31 +0000
Received: from out-99.mta1.migadu.com ([95.215.58.99] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7Wi-00000007fhx-1H8v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 17:33:30 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=yzH4AdgVGm2MfoIvt0cfXKSp7A6q9PsvkvtvOKVlIks=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793208805; v=1; x=1793813605;
 b=YlQYXeA+FXvQn5/0qo5wxwK/k+KnPMXUywJ4MFyb6BAqWttR1hy6yZgF5zoj/j89osbfrcs4
 zRbbaGPdVZFCoXMknnt/NmtLzy6b153fddpB9QRprhrcDKsOfgB2dzz5DVWOdVshuibQOFpCm+X
 auN1YCpLlsSNM+u4yf8UZDtI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6625fb773fa39b9a;
	Wed, 28 Oct 2026 17:33:25 +0000
X-Mizu-Trace-ID: 6625fb773fa39b9a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] KVM: arm64: vgic-its: LPI pending-state fixes for DISCARD and CLEAR
Date: Wed, 28 Oct 2026 17:33:17 +0000
Message-ID: <20261028173319.1807811-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_103328_634648_EDEC40F0 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

Two follow-ups to my DISCARD fix [1], for LPI pending state that KVM
keeps after the guest has removed it. Hopefully in time for the next
fixes pull.

The first closes a window in that fix in which the guest can still take
the LPI it discarded.

The second does for CLEAR what that fix did for DISCARD. Without it,
the guest can take an LPI that it has cleared, and a racing CLEAR can
trip the WARN_ON() in vgic_v3_compute_lr().

In my reproducer, the guest takes the LPI after the CLEAR in every run
without the second, and doesn't in any run with it.

Based on kvm-arm64/cross-vcpu-sync as merged in kvmarm/fixes, which both
patches build on (e99ff76f4a02b; also applies to kvmarm/fixes
79f3724ca8913).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261013081646.933312-3-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: vgic-its: Clear an unqueued LPI before dropping its lock
  KVM: arm64: vgic-its: Remove the pending state of a cleared LPI

 arch/arm64/kvm/vgic/vgic-its.c | 65 ++++++++++++++++++----------------
 1 file changed, 35 insertions(+), 30 deletions(-)


base-commit: e99ff76f4a02be8542e2c3ecc8843d7339a0200d
-- 
2.47.3


