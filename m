Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC197CD6E6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 15:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SjCybsytUAOTYLqtwuovzu83bCVlxAZgYvPdM4tCjnY=; b=wS6ltw7cH3yXhMaMw/o6076JJy
	Sa9qBccNMJg2I16tj7M+KDPAPvrXHmDmZYEqCaTdVEl86LXUnSg3iR5rckNlWWQ2yigptYGHn3923
	3ISp2qlh9nCJ9Ckk8b+H8Up/Wzu/rZDCk9yoUJDIWDcI3App9DSmRZN0/680IZv3H4Me0syplg6Va
	mdDHPkJdz/6OpZwdpBkblHcAcjAoDj7d8zfxEjIe1w8LXFvs99Yp5UP0/cku4+qMjsBvhrekji5Qv
	dgP3f6uYs4LrJCuJBFD9Hvrc9Z40/3DtxDwBmK/px90TXtI+TQ9Akmlay8rKUH0alB0ITIat2Ex3l
	nGeWyaSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9ka-0000000GyDo-0Hrc;
	Thu, 04 Jun 2026 15:12:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9kY-0000000GyCy-09H1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 15:12:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c0c3184c71so6624655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 08:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780585969; x=1781190769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SjCybsytUAOTYLqtwuovzu83bCVlxAZgYvPdM4tCjnY=;
        b=erp3hhROttmefYe8RLJUNGGGxhxmKC8VrdOc1jQZpgagA0ZOVt+ZJtVK+GwLadUyZw
         sXdb5vr29Um/bV4QEYcwyF80cb8hnREA2Dfv0ynnZGRonFkXhLsArFy5iDKHBABsPsTY
         R5F1wuD87YBrqs5wGgoeHYWH8IPKKcWnPMWufWKiU4LO2aZaqsjeNvI1aGqCJQnJMQZu
         H+Q6GSBYr/Kejx2EKo43Sq6ShSVds3aNAkbnc+UPxwtsvD3TpnDUIOCbTeb07I1Jf2wq
         c2T9z5rZW9XwyJKtMYisptlC4yKBw7HTYjAIj1uNxMf1SPTzkVTX33pOySoPLB9CPVHm
         4p0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585969; x=1781190769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjCybsytUAOTYLqtwuovzu83bCVlxAZgYvPdM4tCjnY=;
        b=pKOyYwjYGbY9igb8wLFavnDHEud1SJ6//y/Ze75B0IyPPovI8KGYlFEmPXK2t0yLVq
         d9tTsVtsSzd+fZb/VE4mgBf3182Th6Z2EfdLtiuBMpqXBjkjAffqiNvzOTP6XEON7joI
         9XQ7MGFs10FuwHSLSGNSuMnVPcggunmSL+d9IHxPfE5PKhYb1UjjrjhCSFo5IU3leYH+
         OjLlO6c37WU8sd4P8iFt2oEtmUtQ4I3VQEIxMVI277luPp5/a5CKalR74GwOkKjy+3ke
         8NE2x6bfwUVOieFjm2+W9nBaThHo6fjcdhpNT/6JWV9gdwk1vbI3if0cgbqra0j28QLh
         pCYw==
X-Gm-Message-State: AOJu0Ywh6xoMhqy+oiLsQhOzcqsq3l32C6Dp3dU3UzNMvdzV4NpOkiPT
	Jr8ecHXx3qlIJrpET/p7pt5NzdGbJRsWlDD/jKEYHIrha7Ev62hNsTnj
X-Gm-Gg: Acq92OG70lF20tZhNlgIkLRujJnh3LaCEsYqQYHzPFLHY7Gd5D4vRCuyZucd5OQSnqE
	UAIHOOW6orxyT+f57MW6B/qjXNAWeKH5gdF/80nSG7IsSCLRngARr0hneqpuafdGgK2WqJe1Nsj
	ISxnbd1XE8cj1TSqvwpLGNcr5LjO0yVvXnxTiDcRxb/lMiSDfFkYFwI+9xtdLC/+b775nce8+wY
	dEqc9e7mdSsZoYi5TCJIdwNNAs1NwjaBJ2ARuYCSnspCd+wxtEbS7EJ2fPjMlG40eMfGpWtFGOr
	xUnvSPjoaIMyzT+iYtPmTiNJoe08H/vWhHLKuHsGXAEMjSA9ykCQjrbYU7G+83ZapTKt8bIkJMj
	VVFlRvgYg2Ts4azVKN8dBENXTEQHFAMmUefuTk/iTKvPvPbqmXChdYJkPLnYFAdhWcFgZefKs99
	NGgVucHiszpfKReZpi4xZVd7K5W8/LyxJzyVPDEBYErlvwjIrp9Um7F/8g
X-Received: by 2002:a17:903:1b28:b0:2c0:c625:4019 with SMTP id d9443c01a7336-2c163fadcdemr90406655ad.25.1780585968885;
        Thu, 04 Jun 2026 08:12:48 -0700 (PDT)
Received: from v4bel.. ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm62705105ad.80.2026.06.04.08.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 08:12:48 -0700 (PDT)
From: Hyunwoo Kim <imv4bel@gmail.com>
To: tabba@google.com,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: [PATCH v2 0/2] KVM: arm64: Sanitise host vCPU fields copied in flush_hyp_vcpu()
Date: Fri,  5 Jun 2026 00:12:01 +0900
Message-ID: <20260604151210.1304051-1-imv4bel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_081250_070727_E3F49B8A 
X-CRM114-Status: UNSURE (   7.38  )
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

flush_hyp_vcpu() copies the host vCPU context and vGIC state into the
hyp's private vCPU on every run. This series sanitises two fields that
it currently copies verbatim (host -> EL2): __hyp_running_vcpu is
cleared in the guest context, and used_lrs is bounded by the number of
implemented list registers.

v1 -> v2: split into two patches, one per field, per review.

Hyunwoo Kim (2):
  KVM: arm64: Clear __hyp_running_vcpu when flushing the pKVM hyp vCPU
  KVM: arm64: Bound used_lrs when flushing the pKVM hyp vCPU

 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.43.0


