Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB48FD3779
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tSRem5oxOU2IDDdQ2E3UwWWmJ3yb9FJ/cqyqXPmzMQg=; b=rAxLXGr5tt+L2i5aRZAwkLlMW1
	TJF9y7cbrcYpqY3wi8dtrynRsUyBvVJlP6lJBlBCeo5PBt5H3ZrTeV8xlNT2c8j/VY6aiEoyQtH+O
	8LC3ZTAu1C4LExpm6UeU+ZmvFOlI8xgAsXv/vDOTXneaCiV07744e8+PxvEB+YHLn0GbDUWexllzl
	VHunfwLvdT4utL8PVlcEkgJ7IxhdTRL0GNdVxnPBVYxi+cYBjRYl9FNgVEr+8sIzFhFl53G3gUeLw
	/hPLCRMLYc/+AG6WklaZsq6HPkEKmcCZPlbHUnNl5bJZu1TWxNt8dNHFV8jDPSDYT9WqffpyLT/qa
	e+lS4vLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvInc-00000004fOc-17ky;
	Wed, 25 Feb 2026 17:35:48 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvInY-00000004fNu-1iGO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:35:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772040929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tSRem5oxOU2IDDdQ2E3UwWWmJ3yb9FJ/cqyqXPmzMQg=;
	b=BGgY5BM6/Tl9tHFSxShQOW8PQyKMuay72Zhs4arW3APrlmWkIaF0RRnE4aoXc2QTsVMvKc
	RSwl/AFGzWeesCVowLa+4awRjjjUWHzuME7vr4BrrTPH9TqgVjnV2mETG+McbbB3of7U/c
	PITUfd1sKNDvW9od7CS04tzhIdk5j8I=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH 0/3] KVM: arm64: minor fixes about S2 page table walker
Date: Thu, 26 Feb 2026 01:35:12 +0800
Message-ID: <20260225173515.20490-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_093544_678221_3C5B63CD 
X-CRM114-Status: UNSURE (   4.28  )
X-CRM114-Notice: Please train this message.
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

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

A small step towards fixing the issues discussed in
https://lore.kernel.org/all/3f88cd49-68f1-4276-a067-b7c6beadb27c@linux.dev .

Zenghui Yu (Huawei) (3):
  KVM: arm64: nv: Check S2 limits based on implemented PA size
  KVM: arm64: nv: Report addrsz fault at level 0 with a bad VTTBR.BADDR
  KVM: arm64: nv: Inject a SEA if failed to read the descriptor

 arch/arm64/kvm/nested.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

-- 
2.53.0


