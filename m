Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78299C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 23:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YzkNSVmu73Wg+xMwKSV7/J3QFwDq8+WVAzCbtfpU41A=; b=JsOe2WmQMr5tkn
	byfvXRh1DhLVHknJN8RGWvEMz95vWQCfz920G+3seOJ3puQrzNbJrmLbtIa9CETAJm3q8pNCxmJCw
	JxwATWC0zpMxcTLLsnvisIhtwY1P1Hcpb3dVJxm0r+8tqLx3t/AUzeEgwf9gMyQ7fymcWRexeoXlU
	fcz/uuOmDUgtMIx7Dyzltu/zLx4/uOKZ2sg6bRrwOhSi9RbsdM0olBkGknh/5wOgOT6HWj/Rc2rsL
	IL0hFFTqcLjnPjx03U+TzS9QpsEotNKFQ0xDrqdENFtmir+O8HgRc9lCSOm18NjWXAt45Z0slp0R/
	kvHdeIiyLfZB+BwnmGJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GfS-00000000l3N-1GG4;
	Thu, 03 Sep 2026 23:16:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GfR-00000000l3H-104x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 23:16:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 69D2E40BC3;
	Thu,  3 Sep 2026 23:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53611F000E9;
	Thu,  3 Sep 2026 23:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788477384;
	bh=YzkNSVmu73Wg+xMwKSV7/J3QFwDq8+WVAzCbtfpU41A=;
	h=From:Subject:Date:To:Cc;
	b=ZimDhuxIWEmdWVNEsbR7+NVKKoiKvhETMmtTv//OPz/xTShu3AvNPTAq5t18ukNOq
	 jywIOAY/HgZai7tut5ht08FvumtFWKJWCkZkSQphgkaHe72jlgQTPmwo5wzE36yENH
	 ThMoix0IQ2oJoZUx2tcEpq34eSoId0WtRx9vHTTnDBNOjABzxfhSgv+GMS8OGguG4x
	 n0c5K4Oz+wxoMzqj9SWgvUdYnnI6VZ/av9X3wV30VgHy60ukiacCVxM7ejXERdvgjJ
	 nBpV2miOyBEndKdtYq9rCY3kTfxRkhgIvulcu2fSZSj90MlVOcChII7okwIJVjLDDy
	 pyasgMg8rEDtQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] KVM: arm64: Enable S1PIE for nVHE and hVHE
Date: Fri, 04 Sep 2026 00:14:40 +0100
Message-Id: <20260904-kvm-arm64-nvhe-pie-v1-0-29d59f245e6c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGD/mWoC/yXMQQ6CMBBG4auQWTMJNKRWrmJYtPVHRkIlLTQmh
 Ltbdfkt3jsoIQoS9dVBEVmSvEJBW1fkJxseYLkXk2qUbowyPOeFbVx0xyFP4FXA3hntu/YyXmG
 phGvEKO/f9Db8nXb3hN++JzrPDwerKCJ2AAAA
X-Change-ID: 20260828-kvm-arm64-nvhe-pie-cb86c417f9ea
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Kqp3K7FfT78LyAqnNA+N+3rE5LyP7h9v+UWaBdZW9L8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqmf/BrIDaGAlklwATNnNXtoreOYeo86LT6Bzc6
 9DZsNdIAa+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapn/wQAKCRAk1otyXVSH
 0K0SB/9H9SLSIF1wblTncMr48qmLLBv+ArWZx2kw3fXOEb4aC0/wV0Tuk5CUFiyxEODntvt6Utg
 zRKs0/1B7+C0AWhjMpfIVH8+79e1Djv0/zI/oL282624SXOAVICCqzZxf2qT428ExxqFqDprSmy
 gSRwm5U6BQx/JPu4rH1C3cXgRQ7Ei4rcA56OYrDVrzLjLLj5FEjXu9OBGmcvryWF36z61WeCfHb
 RGilypEQGg8MUDE5+hK/WLnU0WBwUuo/eb9mCIRgogjDQanPAT0llxmBKltbphyj9DCvuShGo5g
 Qi1Cnq0SRkQAnSxZuwieb8rz0aFKrWI7mqQHNfCjS/GeM4th
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

When Stage 1 Permission Indirection (FEAT_S1PIE) support was merged KVM
was updated to enable it in the VHE hypervisor but we do not currently
use it in the nVHE hypervisor.  Update the nVHE hypervisor to use it as
well, as with the initial merge of the S1PIE this should have no
immediate practical impact but it makes the nVHE and VHE hypervisors
more consistent and will be required for use of features like D128 and
GCS which depend on permission indirection.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      KVM: arm64: Initialise TCR2_EL2 for nVHE mode
      KVM: arm64: Enable S1PIE for nVHE and hVHE

 arch/arm64/include/asm/kvm_asm.h     |  2 ++
 arch/arm64/include/asm/kvm_pgtable.h | 26 ++++++++++++++++++++++++++
 arch/arm64/kernel/asm-offsets.c      |  2 ++
 arch/arm64/kvm/arm.c                 | 13 ++++++++++++-
 arch/arm64/kvm/hyp/nvhe/hyp-init.S   | 24 ++++++++++++++++++++++--
 arch/arm64/kvm/hyp/pgtable.c         |  7 +++++++
 6 files changed, 71 insertions(+), 3 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260828-kvm-arm64-nvhe-pie-cb86c417f9ea

Best regards,
--  
Mark Brown <broonie@kernel.org>


