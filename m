Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1EFC71150
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 14:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FdwgAOcCxW8xP65CJHYSviC4hBZAI2hMwMKg/94ld5s=; b=1t1PQSjkdI1r6YZIu0904ehuVC
	7m72fF9OFR/mLU8DcY83RNRfyd80XPXEScnZAoi341DEv47StjDFNLSmQbNx8qUtdQ2TUTQ153pDM
	kyAD/Z24fu1csx4bNrVHL0hQ8Y2c/wkJzsjbwfmVrwZIWS1784K3uc+52SGvZoxkDyFjwvMRS/1Jo
	X5fhgocklLG3sye+LnkF6OgmjRShvlZ/HJKpQqjl1mDwiUu2FQ0VtBu0gfuvUZgpnDQqd+zmbli8Z
	B5RAnsZMjWyBF/vibQxoh8mAh/EANxYEJXu8mveb+gujXN5qqkEeIPVClGpmXtP3XGNOMvdGbJtA4
	8NqdMikQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQSL2-00000001RDE-3CPG;
	Sat, 14 Jun 2025 14:58:32 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQSIh-00000001R4i-3rRq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 14:56:12 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-74849e33349so2858003b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 07:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1749912963; x=1750517763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FdwgAOcCxW8xP65CJHYSviC4hBZAI2hMwMKg/94ld5s=;
        b=Yu1o/UIqsnvT2zPVFhYdQCa7yAgw21ipC3Df4vNQk+sJwk8kpcg4IqKd+NywWg7Zp8
         Ywjaw7iiGpihAGR1PzcXhqgGasJseEsH4G6/Kt9VnZxmOhTYKRdRSi3XVbEVvz9UdWKn
         rW/o3E6ldS743+1z/NFux6SsztMsuvzxD8dLnm3+ybvRWfZQEHU7RHAimDKn67zrcx1J
         S6qFP2r2J6cwtzuGQJbP0pHlOBRUPjgB4aegqijYDKck/piaM8i/aFYzhsRCSgzi01U6
         OzLsyIMviqvMI8KwqBw0Y1TU+ClrQZx5GuM0GwzS9lqZphVZOZ+ilEwc6OLmjewDOGlg
         b5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749912963; x=1750517763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdwgAOcCxW8xP65CJHYSviC4hBZAI2hMwMKg/94ld5s=;
        b=gfbUeK29ixl8+jLkeMxxJjUQMAJFdnv17WJNgtouhiz37NLNuSDA3jYucS635nu/mi
         QJlebllmQoWuMGoOvW9SuRaqsdrh/aCW+iQAZatToBl8tRuIRdcKw7KdkMmAYPt1AQxY
         a4XTiJQETEEhe7St4HYqQrc9akx2BDlo7hpCe/aGwZkPwAm4lPInOttbnaKajMxVG6Mb
         QgJLfy3/FLT0RICLWLJqmOKj25xeAQmD0oVv2/Qdt6k0rqZ6Q22t/EmEIIFm1VhhMWtC
         VTck59jY5Zcqve/Zppga+GQGVSN/kKI2sYkKdqFyNUFbyQUxpoOpVd6oPfjVF8OCN9o5
         qYmQ==
X-Gm-Message-State: AOJu0YwaPoX0Ua36kzoBPfo4zd9NVerIHU9qZdFa+JLhuotfSHOS0yiO
	t5Z0KZunXBRqsfF5Pis9QaAxJSGnwhTr4fmM+h48+Xr1BiOM92VNAqA8nIXLkJj1bwxjBJNMCjW
	JY1z4vO3ZPJJiB3Tk8RDFm0FIuOncWXToYD3q7YkqsF3tNuneOz1vB8joSd99HpE253LYU1jCWk
	+QnOcWst72Bw==
X-Gm-Gg: ASbGncuCLsS55BhF+zRFVP+0693Dq2DjIBkU9SE6TFhZ12rwjR4uPT9V5wuV3rbEKrj
	7Uu6ERqmdQN4TyX8lcsWXta6OCP+ZOwLR15QZiqJuJHhR1yjKktuQYqc3BdDisZIUz5tF+e69W7
	6NdC3s0rpdbCkz0SFnrc8Wsfk6cgAm8FvBJMOymY6JxtYHGsXR7WBw4Z4CzYgK1uxaUqRzQFLBK
	iHLjpvGU+vKX8iyex92Ygq1fJjgLrrZAlGHImjOXmldfm5ajP+3VX7wYkckEiGdF2Vm7OXWCQqH
	/dv8rfrQqPicZRYwT3tFFjr8MlsEMdv7h0ur3EBOX5SXVSAtOHdG9w7ChYqjMPOmaicfDivxtZv
	O4hCVStVPSwHA/Sf/iU9/89FAETVFt/LwlkfzrKNqmWA=
X-Google-Smtp-Source: AGHT+IEEnn/ufz6mqS8sNhhi17+pqZj6OB0ZO/xLcIsqqzhVrA8tKi9dLivhuV4/wirpHZNz/ivObw==
X-Received: by 2002:a05:6a00:3e10:b0:72d:9cbc:730d with SMTP id d2e1a72fcca58-7489cffbf39mr4211820b3a.11.1749912963480;
        Sat, 14 Jun 2025 07:56:03 -0700 (PDT)
Received: from localhost.localdomain (36-228-20-239.dynamic-ip.hinet.net. [36.228.20.239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890006059sm3565303b3a.55.2025.06.14.07.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 07:56:02 -0700 (PDT)
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Will Deacon <will@kernel.org>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [PATCH] KVM: arm64: nv: Fix s_cpu_if->vgic_lr[] indexing in vgic_v3_put_nested()
Date: Sat, 14 Jun 2025 22:57:21 +0800
Message-ID: <20250614145721.2504524-1-r09922117@csie.ntu.edu.tw>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_075608_240271_1941F477 
X-CRM114-Status: GOOD (  10.46  )
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

s_cpu_if->vgic_lr[] is filled continuously from index 0 to
s_cpu_if->used_lrs - 1, but vgic_v3_put_nested() is indexing it using
the positions of the set bits in shadow_if->lr_map. So correct it.

Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
---
 arch/arm64/kvm/vgic/vgic-v3-nested.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index 4f6954c30674..29741e3f077b 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -343,7 +343,7 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
 	struct shadow_if *shadow_if = get_shadow_if();
 	struct vgic_v3_cpu_if *s_cpu_if = &shadow_if->cpuif;
 	u64 val;
-	int i;
+	int i, index = 0;
 
 	__vgic_v3_save_vmcr_aprs(s_cpu_if);
 	__vgic_v3_deactivate_traps(s_cpu_if);
@@ -368,10 +368,11 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
 		val = __vcpu_sys_reg(vcpu, ICH_LRN(i));
 
 		val &= ~ICH_LR_STATE;
-		val |= s_cpu_if->vgic_lr[i] & ICH_LR_STATE;
+		val |= s_cpu_if->vgic_lr[index] & ICH_LR_STATE;
 
 		__vcpu_sys_reg(vcpu, ICH_LRN(i)) = val;
-		s_cpu_if->vgic_lr[i] = 0;
+		s_cpu_if->vgic_lr[index] = 0;
+		index++;
 	}
 
 	shadow_if->lr_map = 0;
-- 
2.49.0


