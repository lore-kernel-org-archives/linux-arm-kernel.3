Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614A7CED27F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mj956uUwRdou8vOWljZAEBe5NlAWrhR02NPjOj/d+6Q=; b=gVpPiGne3ov46A29BDnMvykk9v
	EmlFIMrBJO2M1/v0IMf1grbS7GUK2MH9vVGypc8QxP7ziEvseBdiB/ACer/dDZuaxKQmfNxsMKlFT
	asN17z7JL9eY92zzjUMBo5Yw6TXNPu1mYihLWTphRGtBp9Mq+A2gzICReYbI7pFa8N7Cr91ow6cKI
	0cg3cIIbZ6bBZG6WX9uKji/Ktf6oJgC4fqTO7tOVBXGWC4CK2eP9GfuQIMI5IW044DBymMBc04rXO
	EDA8iDfzHii6lVYXpDOBLD3WluR8aCfUeGkvMJDQDxlwlQDjv6maAS/1WGH5ZWudz3d4TG33PnIis
	NJkCKujQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6L-00000000FmR-1fFg;
	Tue, 18 Nov 2025 10:38:21 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6F-00000000Fi6-3dUM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:38:17 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47754e6bddbso37327605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763462294; x=1764067094; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mj956uUwRdou8vOWljZAEBe5NlAWrhR02NPjOj/d+6Q=;
        b=hxWn6IJj+LXO2n5M52rhafpwd9RBfnx5g4hqvOI6CvmOlHpRaks/kQyCgcaJguVdAt
         LvLtg/xVztpo1GBYTEbWzaeK1FVQT79JxHBXrYhkEyMQTY3C44uYntKwMrRVCfAJ0wLs
         1XvlnfCvQ6+QrBz1P1vwmOT8xptzKpdqU9Wo10zUKbdvA++QJAObDBTacSgTgp3NU3zK
         FJE8E3k+L19tLkkYHUDLleryecAw1NAJSbjt3474VM1p5AUj8dXqXmsiQnnxspxjijKV
         RydTTQxOthd0EaVhIJPqSVoUe2QiIHr4EO16FwMQj0VCpQodvUIHF2hvnbDvA9sxJ85I
         WdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462294; x=1764067094;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mj956uUwRdou8vOWljZAEBe5NlAWrhR02NPjOj/d+6Q=;
        b=FfeW3lNWkcG1N5bS/7HUJHRVvoG3yeBvOpzGfKV9OaNotJxg5b9c7Rna9BaC8ncnDd
         /aJSBSyLJYKzWFJJFcOFZKfuG1TPt1tE4kFXLm096D/EcFZnlwBw9e4MDMqaMX+OjjzD
         BTdJXMI80wWSHurOloN4BIcw5YfqlxZo7LjnXZ5CJhFrxfX5fv7o4iP93muwOGjpgfgR
         pGiFnVeYk5YuySx6+TPoe4F5Zf9zlmi4Bn0RM492bpnFbsHg+TKg32ILuyU+uqBYb2iv
         7hcmm6VEZpJ0SDhB0Ue3GtdiWj2xRO6NuPPBSkPa7JWkqsExRizRaWoJC/C0IMLJnbko
         hSvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoDOkr0Vd8lv9a1WyNcWtJU0g81dQhuJ8chBu+ayVTcgSI2Fld3dJh6NXOilsZJWaGU6B1S1q4SqNS9rwA6FMn@lists.infradead.org
X-Gm-Message-State: AOJu0YyvNQkaxbq2GJ5w/7FFBIwf7dZP4nmEc9l6u+u2a6wkk3vnTVCO
	RLBTNpzdvNycgPBNex524EzB2AQPTj3GSMySwwNUVPUKe/cAaecjxgBCK53sgtgK4BNK2fvghUX
	/uw==
X-Google-Smtp-Source: AGHT+IFG1XaKywSAsO/PSI1vfE4j6/GJZ3MI2DEP6+YN51mOznt/CdrZZYQeVn3xIm60XagshhrHQklSQw==
X-Received: from wrqm12.prod.google.com ([2002:a5d:4a0c:0:b0:429:de3f:828a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2901:b0:42b:2ac7:7942
 with SMTP id ffacd0b85a97d-42b593459ccmr14897179f8f.5.1763462293703; Tue, 18
 Nov 2025 02:38:13 -0800 (PST)
Date: Tue, 18 Nov 2025 10:38:03 +0000
In-Reply-To: <20251118103807.707500-1-tabba@google.com>
Mime-Version: 1.0
References: <20251118103807.707500-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251118103807.707500-7-tabba@google.com>
Subject: [PATCH v5 6/9] KVM: arm64: Do not allow KVM_CAP_ARM_MTE for any guest
 in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_023815_906897_0EE7D9BE 
X-CRM114-Status: UNSURE (   9.53  )
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

Supporting MTE in pKVM introduces significant complexity to the
hypervisor at EL2, even for non-protected VMs, since it would require
EL2 to handle tag management.

For now, do not allow KVM_CAP_ARM_MTE for all VM types in protected
mode.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_pkvm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 7195be508d99..5b564576160d 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -44,6 +44,8 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
 	case KVM_CAP_ARM_PTRAUTH_GENERIC:
 		return true;
+	case KVM_CAP_ARM_MTE:
+		return false;
 	default:
 		return !kvm || !kvm_vm_is_protected(kvm);
 	}
-- 
2.52.0.rc1.455.g30608eb744-goog


