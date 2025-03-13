Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE169C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 07:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkHO/0se169XNtMWH0w7f9TQn0BTGs8vu96SI051qqc=; b=LP3k/0whYRb3PppjpSVo0S/Jgn
	Ga7VFgmWZ1M3ZlaUy4IAF5JXRVN94TN8fU53Pr8Hx9Rh0oawXumBI0gSm7pSreTa4sewFP6XSgbz3
	7r0NK/iwI/NpIuhcqigmiDB8f2Moc7f1nFJh/KHYvUrXE8vOEnsS0x0SJ5ul1SOierrjpPbxRAA6A
	Ataz7mMZQB8QIX2i7Sx7KB6nHAzhFNeZI/enuIlHSDesoicbfIld2fzG2+Th47Uo8I856sSXqYvbB
	LFPWUGEPuaHC2rQMlWzkYmTnKbjL9rcFyfbWhCNUh5Bgt6ZLT94ZNxzg/D3vOTvaWc5DX0WErwC6X
	X4vIrc0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tschP-0000000AJn9-3K78;
	Thu, 13 Mar 2025 07:09:47 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tscWO-0000000AH3S-1ewQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 06:58:25 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-224191d92e4so11419345ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 23:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741849103; x=1742453903; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkHO/0se169XNtMWH0w7f9TQn0BTGs8vu96SI051qqc=;
        b=buJh3OSmSbz8JQxP+nO90s2bNCMi37QYEvShltfSXHQTrIYpRhKiHfsF1rRH0KkSuP
         QmWrDVuTavToxgjdFPuWv4C1INccBF8JQxpzsUj6ExxchAsS14m/HfnEQZXjZt3piJt7
         fT5hG6Z5Hslho9eyTfAzvyZsCa/ZuoRYvJM3s4tSOlCZa/1p91QhEJP0OuK0KpRGBwWA
         o7qC90xjZ4YBeeLPT0eAgDzomiBE633cnHo3r1KxhWe/OiVZlSFCP2Lid6WOdQVEMs61
         NDALWlhGpYQmXSV4068GC5q/d3rMi0/ukAA02NveYcDi1ohSgY91z3tTQTrM/L/piscP
         RgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741849103; x=1742453903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkHO/0se169XNtMWH0w7f9TQn0BTGs8vu96SI051qqc=;
        b=KOhjaEjVcayFhGQX/Oo9+90pUbydIcaa2voPPUvdAV+m2yUDezO/AT9pIk9ZcHAcEY
         DnfMuh3Wsuup7MjXWVEdEBFfKY+Y8RIrGM+Qo/RbAHt7q4PmOtLpYxab6Prk6O2RAACx
         h8UFlslh+HgToJi8OYgBj2jJrzKpo5atJ9vIbNrpwcNtUwqS2l5Y6Qtqv/Qb0sXFcb7Z
         /nn8m/1yVdueg88svVzHbtFVIQkjQctyrStn5clGvigVKDFl/lLfKAoY9e6JAoGCKKdy
         EtfT3HqrExS55V8505fc66aqPriZ1Pv+LXmDIOcTiXWKACy2IJK0WPWm18X7DeLX7QEy
         hHdg==
X-Gm-Message-State: AOJu0Ywhn6db5wAfYdXeLwTXzSwHqki6n2cugPUvD0x6ChQJDPBLnPut
	jdk6YbgsS2QQJbPWqQo+pllY98gMdkJErsF3J7Q8ZhWoKbyXvbhG/CbF4yAvvEM=
X-Gm-Gg: ASbGncu45D954zP++2dLvgy4+oZVaFN9JFM4RR9Bz46glLMl9BEGPd3U4mbkReH+XU5
	3WcVvyRdVrWWjWz0w+7QFc2HDMxuEAFqAubTpKe5ppsJicbSJahNEfzGqPDATbIjKWGQYXjASo8
	Q11mqZjQnG/LNDIO122fkHutdicPSSXdy9ms1zjKOwQ/f5R9MsiBuNg76amCgcsVNalrdY1efRs
	Sbv0ywxDScHhM3DUuuGe3K4qBaSoHErpVnaxyoqQ8ahbTxVYl0LQCL7v4LL5ZdkMiuDZ4XMq9MW
	K9fatZlX26J8nBr0OhFtqmvkPpN7m5jeIId04nPvnl97Cx/j
X-Google-Smtp-Source: AGHT+IF2RBsD42GnNZIX18nfjzpK1BpoSRv9b88G/rsSQnVVNmEUyx7yfAT1x7AejmJJpK2yhnpJRw==
X-Received: by 2002:a17:902:ec92:b0:223:569d:9a8b with SMTP id d9443c01a7336-22428898155mr323431125ad.18.1741849103632;
        Wed, 12 Mar 2025 23:58:23 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-225c68aa5ffsm6537725ad.82.2025.03.12.23.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 23:58:23 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 13 Mar 2025 15:57:47 +0900
Subject: [PATCH v4 6/7] KVM: arm64: PMU: Reload PMCNTENSET_EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-pmc-v4-6-2c976827118c@daynix.com>
References: <20250313-pmc-v4-0-2c976827118c@daynix.com>
In-Reply-To: <20250313-pmc-v4-0-2c976827118c@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <andrew.jones@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_235824_436143_9FDE29D8 
X-CRM114-Status: UNSURE (   9.00  )
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

Disable counters that are no longer included in PMCNTENSET_EL0. It is
not necessary to enable counters included in PMCNTENSET_EL0 because
kvm_pmu_handle_pmcr() does so if appropriate.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/pmu-emul.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 461c76a9cb6b..dfa7048a3e2a 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -835,6 +835,7 @@ void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu)
 	__vcpu_sys_reg(vcpu, PMINTENSET_EL1) &= mask;
 	__vcpu_sys_reg(vcpu, PMCNTENSET_EL0) &= mask;
 
+	kvm_pmu_disable_counter_mask(vcpu, ~__vcpu_sys_reg(vcpu, PMCNTENSET_EL0));
 	kvm_pmu_handle_pmcr(vcpu, kvm_vcpu_read_pmcr(vcpu));
 }
 

-- 
2.48.1


