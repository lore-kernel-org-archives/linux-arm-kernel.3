Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881EBFE51E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XShP+UFGcHA8+NRAMytT9G1kOFOShWj4IGMrrTJlFSk=; b=g2GtUm+uWszzP9XJ6GoHSrw7D0
	AT+nTxlxIJ9QxqU5yuKWPwtFqOYnfsnR5zH9Xa+2IFWg73EeZmUGDiAh2uRRIpxb/TrQrvNkxbiKC
	QzGo1mppo3Rv676xB0AtWhAnMAOf87mAYF36LYDMaHkOejPkrRi3rKKmp2jAiie2/WUxCv8edYQ5Y
	Q/LB2iaKuFB0GblmDJ5DYUTAIw/d0V87Hv5jL+BVIroahGIjDNA8Yb9gfp1JcT0vjyK3dkHhOp7Fz
	VkLVIAaAv2nMZpVxsjkU6dvGyXOT4+TozNrsdDoDRIdLwA1yfGrsKY2JMcVzq/nFyu9obxZDa51Ia
	NcRHS1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCE3-0000000Ct5K-0VzH;
	Fri, 24 Apr 2026 08:49:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCDt-0000000Ct0z-2cNu
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Apr 2026 08:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XShP+UFGcHA8+NRAMytT9G1kOFOShWj4IGMrrTJlFSk=; b=rGi7I/QLr+tzTmQNZANx6+I6J0
	a3H3lvZ70mhz/WWjWhy+Out0W+Z7uvuhBdExWGa7tnzcAK7wybXz/Cxkas3F1XHZYyTZnjDfgegsh
	Eh66u+gUwVAq1MSKSQCQY2hbaYaHUj4Zu5YN0Q6DSGOWlb9URCJlB5UiYqyjDLg4Zj9i8F6LsXOvB
	jlCdsKrilkafuf0yd4t1WowzfRhfO5F9BCbK67T43qvcYnM3PuavgUqINvyEVCWDoZVKbvXSfCMEn
	2UnPQBallJfJaebmvR7KA1PaMb7CoGxtnq4asjwRgLF3W4J/gntU+R6rOq+sxRYZh1C/qwjR+GSEZ
	cnU6bsDA==;
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCDq-0000000EQur-25Bq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 08:49:16 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-43e52dc8a04so6640375f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 01:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777020552; x=1777625352; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XShP+UFGcHA8+NRAMytT9G1kOFOShWj4IGMrrTJlFSk=;
        b=RsF9rOQW8enOCYXgslQgzvza9p7udSr84yQtN7W/7tk1YIJas7XAukzIxC3tTd5M1N
         gKkXS/Xs3tlFHLsiPtOEEjSNDPXogg2gQ326U+l75wE93Cwjf7iD77SO10GaI/4pa8FY
         YVtTM0/WEA7a20hCShpb6pO+9jidq+V36Vn9Yu3D7MFktldSjVWbGxkRg1ViNvchyxOZ
         6GcAczClM5JMY0pyop7oUUPj8I56Ophrhnfzy1j9AQZr0Mj9RuvRBHNzHcRYN4WgHxPD
         gDqDKjs1QCUYJoV4FyqH+TOqcqGt9Yi4s1v/tUusKbb3tSfNuoW5oIVNcH7jidNmsnzf
         htCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777020552; x=1777625352;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XShP+UFGcHA8+NRAMytT9G1kOFOShWj4IGMrrTJlFSk=;
        b=seQ55Z35dlvytfhEVGfk4toAmx9WluV9Ei5FrtVEd57JIlcgcjGasRiCCdscSrH/dJ
         b96jdgNP2N7n4t8AG2X9SXWXInLHQYTQO89BT95L8fAJ4t+NQkb8pNY45Q2BEt7KmW9b
         gFSeSfJGccVovdMdiEJN3C4PvUvTEL6KUZ4hW8Ss8ooF6p20fSw/hCQm6ZoBLawimJ6z
         rmAyvU2/oAx5BoiClbf93BcrRiJzDjD9ODSjAVwvRqgisSTIfH6ZDN+JWHc4lUQUcQrW
         SgYGBJisyQqS7JdDxzW47xmh2nKf0Om7rJtz0MIujT/Tkyu82XQUBOaAyU6RuStc18gw
         ngzw==
X-Forwarded-Encrypted: i=1; AFNElJ9qOIEdrRkrr9ud6hEfHIvcDeVVQYnO3Kb6Ejb2PnIhDYUiKAYiJph9uFDQrnNH7jCez0TyWGou7JoFNnqOTM67@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp72bQUe1w/ymT6EKnoaU8lvjUu3NPnpd5n+jK3faCZ67cPAbQ
	b5EfX8+T9N4d0IuY2BfEsp5oNsVwmOUDOHRNzGGfN/OIhOt5dq9aLNokk80+iPairltoQ1iktsP
	d2Q==
X-Received: from wmjf15.prod.google.com ([2002:a7b:cd0f:0:b0:485:37cb:adc1])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:8447:b0:489:1ff5:edda
 with SMTP id 5b1f17b1804b1-4891ff5efe1mr218011645e9.6.1777020551865; Fri, 24
 Apr 2026 01:49:11 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:49:04 +0100
In-Reply-To: <20260424084908.370776-1-tabba@google.com>
Mime-Version: 1.0
References: <20260424084908.370776-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260424084908.370776-3-tabba@google.com>
Subject: [PATCH 2/6] KVM: arm64: Fix typo in feature check comments
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: tabba@google.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oupton@kernel.org, qperret@google.com, suzuki.poulose@arm.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_094914_796120_4F2F0A12 
X-CRM114-Status: GOOD (  12.75  )
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

Revists -> Revisit. The following patch will add another similar line.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/config.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 093290b366e6..a722ea178f68 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -283,7 +283,7 @@ static bool feat_anerr(struct kvm *kvm)
 static bool feat_sme_smps(struct kvm *kvm)
 {
 	/*
-	 * Revists this if KVM ever supports SME -- this really should
+	 * Revisit this if KVM ever supports SME -- this really should
 	 * look at the guest's view of SMIDR_EL1. Funnily enough, this
 	 * is not captured in the JSON file, but only as a note in the
 	 * ARM ARM.
@@ -295,7 +295,7 @@ static bool feat_sme_smps(struct kvm *kvm)
 static bool feat_spe_fds(struct kvm *kvm)
 {
 	/*
-	 * Revists this if KVM ever supports SPE -- this really should
+	 * Revisit this if KVM ever supports SPE -- this really should
 	 * look at the guest's view of PMSIDR_EL1.
 	 */
 	return (kvm_has_feat(kvm, FEAT_SPEv1p4) &&
@@ -305,7 +305,7 @@ static bool feat_spe_fds(struct kvm *kvm)
 static bool feat_trbe_mpam(struct kvm *kvm)
 {
 	/*
-	 * Revists this if KVM ever supports both MPAM and TRBE --
+	 * Revisit this if KVM ever supports both MPAM and TRBE --
 	 * this really should look at the guest's view of TRBIDR_EL1.
 	 */
 	return (kvm_has_feat(kvm, FEAT_TRBE) &&
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


