Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1069CCD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 07:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7WGxRyEbovaCEk6n++MhLN9S+efqVE7Q4ikibcd+yY=; b=Nu0JwkoyVatDUnvk0oS7kkmCZp
	cWV2TLKILEjWtLsIOATQ6+4P7k2WHIbT0mM2vupSiTwHIp1CSqLsHtZ6hXpRQBuzIMEtdu+M9pN6O
	3oK+C1ZbYV80lOO/FO69TvPFOWx/DvJdfBOINoIdMs0o6XKn4AWri/15OfOko8wz5uunipj3Gq2I7
	gApXX6/pErFT93cqV/jEIfHbLuZiNbnm56GNDpOfD2SowNOD+cxGmb7JPuP05XDfzA3dWtZaJJCtF
	rfjuqbx2D1GaS2eNgMlWnNass7vd24QcmikpiUZ7/WPLvglaGwM3+UMvLPBaXFikhV5SBnwqadcgo
	flg4R+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrsn-00000006tm3-0MEf;
	Fri, 29 May 2026 07:43:53 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrsh-00000006tkF-17Kh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 07:43:48 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-449b2a183d3so8556886f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 00:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780040625; x=1780645425; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u7WGxRyEbovaCEk6n++MhLN9S+efqVE7Q4ikibcd+yY=;
        b=sdoUgssS6sT1gddV5ErStLcpHVRDUEaOJkoJ0AkedFOIvGPxB0RDJIRV3QKJv9AzbG
         QRAoNG5hkCHuBG43AmmYeJ4EHo/tdCCjDvb6iUMd/qHud3Po4tWy+bZVVSMZS4WC2A/y
         iageNxcVphsI8Op262idO/ZyF2LnAb4jrNNmOa/JlsjySz3U1lcrTeg0HVbHt1z/70W+
         7Vyh8NCgAU7WUtbK2l7TepWCQF5c+WRSyPVbq0SHmpRDYBQz+OsjyTnmyL9nlz2jHJ+n
         PubTG0wT34VXB0aXsezsDsROx/j9xSyq8Yz2TOYEzjFzIMmew2FL850p0vQGKqcVBlHd
         MKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040625; x=1780645425;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7WGxRyEbovaCEk6n++MhLN9S+efqVE7Q4ikibcd+yY=;
        b=Eqs50TpJVQ+YxKW3psndBXN/4Q3hbfspw8tcjambu/yWZ9s+iQQNDTHiUHL0xo9sqr
         BS7/6EOH8C3dPuUHsWiu4GjdtaZIEGfDtUvFSmvzE0zrTCoB2DnX9H+DuQ3RI3tiCpFi
         iak4EcX3tqjXPgaO853GUU4oPkOwEi74RUIEgZFPW5IImWYCvPPzGrdTVCtpHJfH35//
         pctrpb2ThZakl9li2Fu1wM8+JBoc9XP6uEO83gmuexLiHxAgWHXmcevP50BdIx5VeKq0
         tC6q/BRm20mC78sTr6r/6DoaXm7/AqnC5o+PxfORkBlq3r7ja3u6Vz4BagGKTeWzXu4Z
         I4vA==
X-Gm-Message-State: AOJu0YzGm/w8eWlYWAm4yi8L3CI58S7RU5K4BYnjpu68jPl0TQ8Ydl1N
	Zd73YKqCVXgws1CH11e/oh8IJJfpqNd5O38I3drXFh1jJjpYq0P0Iajg/Qad481VYZ1Akyg7kg/
	Gwg==
X-Received: from wrzf10.prod.google.com ([2002:a05:6000:1b0a:b0:450:e76e:87e1])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4683:b0:453:9897:76aa
 with SMTP id ffacd0b85a97d-45ef1385c29mr1854131f8f.21.1780040624606; Fri, 29
 May 2026 00:43:44 -0700 (PDT)
Date: Fri, 29 May 2026 08:43:41 +0100
In-Reply-To: <20260529074341.2271950-1-tabba@google.com>
Mime-Version: 1.0
References: <20260529074341.2271950-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.929.g9b7fa37559-goog
Message-ID: <20260529074341.2271950-3-tabba@google.com>
Subject: [PATCH 2/2] KVM: arm64: Avoid host/hyp share desync on unshare
 hypercall failure
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_004347_328564_6B27D96B 
X-CRM114-Status: GOOD (  11.55  )
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

unshare_pfn_hyp() erases the tracking node from hyp_shared_pfns
and frees it before invoking __pkvm_host_unshare_hyp. If the
hypercall fails (e.g. EL2 refcount still held, or page-state
mismatch), the host loses its record while EL2 still holds the
share, breaking later share/unshare attempts on the same pfn.

Invoke the hypercall first; erase and free only on success.

Fixes: 52b28657ebd7 ("KVM: arm64: pkvm: Unshare guest structs during teardown")
Reported-by: Sashiko (local):gemini-3.1-pro
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 4a928fb003ff..8026e834528d 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -524,13 +524,17 @@ static int unshare_pfn_hyp(u64 pfn)
 		goto unlock;
 	}
 
-	this->count--;
-	if (this->count)
+	if (this->count > 1) {
+		this->count--;
+		goto unlock;
+	}
+
+	ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn);
+	if (ret)
 		goto unlock;
 
 	rb_erase(&this->node, &hyp_shared_pfns);
 	kfree(this);
-	ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn);
 unlock:
 	mutex_unlock(&hyp_shared_pfns_lock);
 
-- 
2.54.0.929.g9b7fa37559-goog


