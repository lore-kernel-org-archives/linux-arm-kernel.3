Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4BCD4335B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 22:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=84DbFclcvWGhH0X3eMQoqbcZjFXuGcswjNd/dBhqEq4=; b=CDvS6UZhPbDvm5W8q8EqwEsL78
	YAwW28DYT9KGnzZoSud0SiFmh1krRB35a+d20IkqxgnbTeL9dx7XyZYw5iJCueW9YDGgUiJplmmUC
	19Qs7cZTSmZ1divAPMRWBxPTEcknCVk0cLWUlxgDXYRaeR0qCMy2qEzzrPvUH45QjR5NgK+cHvh6z
	S63w2Gm7JWoidY5stBkuNrKUaDc9AwP14vDtJWKAYktXvkzXIWXZApGGM6MC7RMznfXZtm96HrR1n
	Ek7CqD50ZHllD00wR2HEg/icQoA6T4Vu5qQmHte3LK8fSQ2jYmXiLuFbZWoecdpP90wNLNX7ItUZa
	/WKlYeQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpMr-0000000HMzA-44q8;
	Thu, 11 Dec 2025 22:42:37 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpMp-0000000HMyn-1g9M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 22:42:36 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6492e7925d2so740441a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 14:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765492953; x=1766097753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=84DbFclcvWGhH0X3eMQoqbcZjFXuGcswjNd/dBhqEq4=;
        b=HneJiQ+sLfZXfnWtPQVzQjIJYlEEphKjZq+2xk01AJ7XiNflhZDdb28UFKVyG9n7V0
         +JmVnkShM6OiPk86MgL5MUZ1LvS+xLzPwX6soJAvs91vzXhx5mqOrVPQu8fgwGIKIGho
         1yfHcQXDyK5yzdOmbfRKm8YX8gHuK7gU7fbpJeUzFIbUEoEpqgdHs/NRkDGMhM7AUOHI
         TyvVI0rTaY6zyy5CApq7Lf0qEgxarIpXJogFme7QzB7NONk/EkR70vOrCnHk73y1LUEM
         6a9XonFV2O86YNFCNHdf+9nqg9AaUS5UfvkkH+Kg6gA/bc+hygXoU++W+vBSepTHTRiD
         No0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765492953; x=1766097753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84DbFclcvWGhH0X3eMQoqbcZjFXuGcswjNd/dBhqEq4=;
        b=h75COFzI+BUCuEqxz50DcdTlM08YiI0stzjmHIBJRQLu7G5CAtukYfa2IB4MfKA0G2
         zlO67qoxWu7IMNVY/ghUjtMp/iKmY2lPCMCu9Cp8g9ocOeZ9c7ehrfVJhudQl2pIw5s4
         M27dZfQY5VtHDizWIAPdVucAfK7+Tq4F2WgO1JDuZhcKTLxwBgahR025M8BSX8Mh45Ry
         XM+JygQTSlQ6Ly4I2hTF3hVIe2DB5CBxocJj3VvvmGDTL5ekMrel0ggWyV+ymdBLPruQ
         3/OEjpJiB2asWA1/dfnSc1geTHSKLcbFcTWMIeSs7sd0TFLP5p2F1dfBC8pebu7efli/
         Vtdg==
X-Forwarded-Encrypted: i=1; AJvYcCUPsOvEnZYfGs/vRMXwNpZ9NeUct6yESfIxohwhmdiaNi79x6kBpjCdLDNSu/Vf9nYu5gLtH4St6fFK60MTEUJF@lists.infradead.org
X-Gm-Message-State: AOJu0YxWWjk0mXfyzVeNAuoGqkA61nBg87yo4DGLC3Cvbkaeqsr9Pcp9
	AyUMCo3OwHsthrx4waKb8q6RYA1SlfmvQCetLpSHNN6zgZGtyFdvL8mw
X-Gm-Gg: AY/fxX6SeggA2j89z5/471ZsDGN3RTSndx8Xn+XfIsyM5FnF0FNNhrMeQUHLX55HgG2
	4zQ58BfsQ3EVaXuq6CLeKaA8jrVy4zIpQiVLi8FMkzAw8kgGtCM8LPplMNBtweL9puNe10H7A40
	sNut84Q5l7GBJ6k7JZbHcfieTdQgTv8t1cUJG5xStlSCpJmGhOnxwZB9jiCxA3k1VwdvFwdPyc2
	zNz8f5sKQX46KvPgtJvDz5oBEmmwbo8JKQ3xtVK6M1RmnbU/5Figt3LuErgozGUis0PoSXA19BS
	WJV99zmzTDCl+ziLbmk54bvFyMiqX+DjbPiyigU13cM3ThNmIwbjdzX0jyssS1JDWkHNA5Ll2FQ
	unUpz7zeuGikJz2GvOgVY0c/8vhB8twhegtF9TZTnKRA7YC+AW9uZENcuR0HW5fjoUnY/0i2w72
	Wctr31GAfMtcTSab2Qs4zOJV+Tmg==
X-Google-Smtp-Source: AGHT+IHSMzaR0+lf2JeWcgZlJKX/fHc65ILX6+tANBTqwa8ZXUapW4ZCMc0KHZxyXl+MMn3EgF0THQ==
X-Received: by 2002:a05:6402:27d4:b0:640:9e7f:675c with SMTP id 4fb4d7f45d1cf-6499b136cefmr51218a12.10.1765492952786;
        Thu, 11 Dec 2025 14:42:32 -0800 (PST)
Received: from osama.. ([2a02:908:1b4:dac0:ddc3:acc0:61f0:9df6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210de52sm3560718a12.23.2025.12.11.14.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 14:42:31 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] KVM: arm64: vgic: add default case to switch statement
Date: Thu, 11 Dec 2025 23:40:28 +0100
Message-ID: <20251211224033.18079-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_144235_445615_C2304FB7 
X-CRM114-Status: GOOD (  11.08  )
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

The switch statement in vgic_validate_injection() handles all enum
values for irq->config, but lacked a default case. Add one to match
the pattern used in other switch statements in the same file and make
the defensive return explicit.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/arm64/kvm/vgic/vgic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 430aa98888fd..a035ce6231e2 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -369,9 +369,9 @@ static bool vgic_validate_injection(struct vgic_irq *irq, bool level, void *owne
 		return irq->line_level != level;
 	case VGIC_CONFIG_EDGE:
 		return level;
+	default:
+		return false;
 	}
-
-	return false;
 }
 
 static bool vgic_model_needs_bcst_kick(struct kvm *kvm)
-- 
2.43.0


