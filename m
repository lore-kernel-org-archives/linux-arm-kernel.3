Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE32CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 09:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UiihDcnKW0VJqAaYu8pQvusxgYgxZn4k0ZJXyIYZzM=; b=wzQwHrGD/nJH7urBSqhq6GaTJx
	VDxOFEe2nlkjxy6q7vvS2ucUJ73td5eJHCaBr0nwuYTM3s9MPH/7v6Z/Gu5ulIcxU+hIumdT39brN
	ZcMNQRC9BCK9/ZmOSk8Qz9a0DPioQRzdGjk/l4y0VB0OFewQ69i/v9/d1jclsCEHD2oFQ5RTYCydy
	YkJnNzN5xMuusT9MlocqyfYprDSNVbC/t0y2zBRtVCtvgt8xrvacI7zWiUSzsTzsNYg8ijEi3YrA9
	mFnDuB++uhQzvgWn6u3GYe1HM6PJ68r/oDmjAkqkEdB8zt9UpZ4rtceYdBfZMuqo8j0QIc2pmy2xC
	OvYC87ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ72M-00000008Rwt-2Kvc;
	Wed, 12 Nov 2025 09:21:10 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ72B-00000008RpF-2OZ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 09:21:00 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-42b2ffbba05so313260f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 01:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762939257; x=1763544057; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3UiihDcnKW0VJqAaYu8pQvusxgYgxZn4k0ZJXyIYZzM=;
        b=QSv/XoIpMgXnVyKiffCCNMz6J3hvIPBZPU70jXV+Pj04Q+Tbc0TaugDzaoQIytAq93
         c5Ci8zilw2JaepWVjz7xjAd9cGG+aRsno2i4zl54gjNcqPN5F2Cw42N8pqgzq6Qb88OL
         eyZ/3tlBxnfm67kIYB1fnBRPT8KxHetclmxGoNzPeXe3KgXTZCbH3d5DTkuWTtqcTWHq
         jiIX7gM3X1M3NsklC4/DnQuUp5pGwGf4RKiPm1NBsAqdiU8bstuUon7el5QS2ayppiw+
         6BtLgTvNISP0WezQ1RU2W7tf2Bhk3944rKL9SwozWrtSEZ+LW6HuQ46oAGha+txqyXPk
         6ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939257; x=1763544057;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UiihDcnKW0VJqAaYu8pQvusxgYgxZn4k0ZJXyIYZzM=;
        b=hAPEkxlY1dU6m+qmUjhSr2aobRwNvK8lFkrFxX18kaEygtSxUprSbmZBpwkhk3m/dt
         qhppk22jJTjmrCH/GS3rCHtwi74LVeDPvh6auGawTYDa+SdauFP41jwDJMqmXpQsHy6s
         WCeiFzlO7E3BDHllQAYtlNdWlSLeITrH8ftZPKhgMj8kH+In2QcjGGAX5afdBIC6yLEZ
         yAnp/dG7KlHHgTvKbGb20KP0kmw+NmMyaFjRDe6jRP+TYSxFot6HY1mo0VpRbpxAjgkG
         0ZPB5O1lcwBrq5fVdSjT7cSx4dzooPSvtfURUutPH9iSC7Drr6dPM39RiXjIroOqH46D
         zv2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUvgJBnZ8LmLIGihGYOM11m1GITwapzlcmdDtdmwTlubzLkHAsG3UtO2jguCjTUCHDLFknKpZy6tyvETfE1Na0@lists.infradead.org
X-Gm-Message-State: AOJu0YyyT1XoUoqXFPVgMbBJGvdXqXtp908CnMUMQgYUO0w8r08vs2k3
	3n4gwXuhzuzgGc+/jYafyq5216dmjlm4Qu3aOUHE8SlhG/BhgwnAxP2EZjZz3L2rDx2Gk5ny9IW
	eKg==
X-Google-Smtp-Source: AGHT+IG9Z9ldAGnK/5TxJtrTX2haYhAOVMVAPtuPkpmokyvUQiqI1TdWGyQz5OrOITlNTdMFtTr2FYZKcw==
X-Received: from wrvd4.prod.google.com ([2002:a5d:5384:0:b0:429:ec82:22dd])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5d0b:0:b0:429:d350:8012
 with SMTP id ffacd0b85a97d-42b4bb909femr1517120f8f.8.1762939257515; Wed, 12
 Nov 2025 01:20:57 -0800 (PST)
Date: Wed, 12 Nov 2025 09:20:49 +0000
In-Reply-To: <20251112092051.1376245-1-tabba@google.com>
Mime-Version: 1.0
References: <20251112092051.1376245-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112092051.1376245-7-tabba@google.com>
Subject: [PATCH v4 6/8] KVM: arm64: Do not allow KVM_CAP_ARM_MTE for any guest
 in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_012059_633329_4B0FFC1C 
X-CRM114-Status: UNSURE (   9.89  )
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
2.51.2.1041.gc1ab5b90ca-goog


