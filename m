Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24323C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 19:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oS1moOcp9ct9rXCWQSjf/GhpQtGR0rWY3wjXVfG0zao=; b=r+lYKVd84LDIlIQz/GFf9IrZq0
	f68bXZm3gA3zaK/xhQLms8gl4bq5ePzai1Uk/ZdQMTuoDJfVD6v3zupqb5LE993O2svJBMhHKTITd
	ZOK5bjGrGJipMfupQ8as8fVJDOL9O8yzv5oftWPE1l9e11qoNIDtm2FWdr01KG5uYaj1p/TVSrkDl
	1o4qqk0WLG+YPZB5qdkArxbL1XU1FBTslTt951oC/EShb+hN6vAvRDr3/wNLSjOzW8b5a8U5nB6kp
	xfMBQUiwv2dJIGEqWXhnR2alADtewzWLbKny0k5kg+dbdenw1/v1k1sSaBGCZwtOH80/M+xrQED3u
	GrdTzpig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY9MW-0000000Cvws-2eR6;
	Wed, 15 Jan 2025 19:47:36 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AU-0000000ClJQ-1WaR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 18:31:07 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2165cb60719so129037995ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 10:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965866; x=1737570666; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oS1moOcp9ct9rXCWQSjf/GhpQtGR0rWY3wjXVfG0zao=;
        b=eU2yNMxKD/j807Dtxo+AL6aNF+LSTXcCNsvZY9rlKoTReyGyQxJo7jvogOmA3cKsTy
         UtMSOUn4oRGqDMAHZGSdB8vLiQWdohAZ1iTsLlnEBAwf/0kBcTsM2ST79Sm8ZYLouaUO
         HgBobRkUGgKbT3KbrsuPnwGFradvZFc+tQh/B5iCkzKzq5wy4ZJQtI29G8BR9Staf7Si
         ZN5nzlL9kaztnzODPdq/4dEKUzGd0Cm8jhcTbppSSCKR1UyidIVSrsgJM69li45q/lcv
         5KDdbynu5pVaQgev1+MC0Z/t6UG8hhyuqkQLY4pGzjeShjZNNjVFlL17RKObFPEgxn0a
         4ZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965866; x=1737570666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oS1moOcp9ct9rXCWQSjf/GhpQtGR0rWY3wjXVfG0zao=;
        b=ZhiqnE1rzEAMrq5jw2fKHrCnXFxjo7Ffe78ikKwzzK2vwfswRl4mWFAHJxUbvzo7w/
         Rez+GF2cDgGsHUInB+7I5UbFmglyFz6BxV+yQ+V+W3ti+/vG+UAaBw2wiAKnHbeCCcaz
         fkgQrl9zy6jPA4J5h7uxSxWK2CrBPEknY9Hxr0YpjmpCebz5jlRdh9Z6QYnk6XyVsQ0Z
         RwqmczwtVTLq0P8PwbLLIiCIXJtlUChoyc7SFrVxT/IkzM8UH8iJiinM3m/+fn6ERiC9
         DCrFEo+Ivh2aqa6btFHnEK97usogJXmxgOW+iRKnewXR4G5QUWqau5LlHa+ow2NSOuZi
         FKlA==
X-Forwarded-Encrypted: i=1; AJvYcCW7x0Rznwf+RJ69mr6a7tIz5UkVJ2F6WivyL4kIaR0blDE63JqBcnYk8BM7UZtbv4FFy+hBoSfvEZ1ZDZ/VCntp@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4SmnUXSSPxbkB3kZY0E8+a41dSvIPZbU7g4dp1mk2XLspX8Lz
	8d+6QAN6OA1DvtjPG11dWdt1Sg75ZuhYMxJu+a4qTEkisc5ohZehB6/CS7tM86U=
X-Gm-Gg: ASbGnctVQMKYAnp2e9jvhGHLdB0ZtmPU690r+N7R/VDwSOSGca95PTbQiEPizjd3sjx
	SKhe6gBAN6HE/vrof37rQrksm5DBbw4keXRr2ZAUE9H44cuVxEX7P0iULmUKFaMR64AQ8REzevN
	lXmh5S3m/SIakDZuEC3Fa3aFM86SR01YPI/djCipi2jaL0QJvL0kdjUW8zBljxh0pvLSzS6Evzj
	NlycDWq9L7k6Qx9xcezhsYBL1PcbnXe1IDQVlItBcaWPLovdXBEzBqRkBP5To7s01WeiQ==
X-Google-Smtp-Source: AGHT+IGUgwpGj/plYJTZ8pJ5gD95k5t13F6GWcCCeHibqJhYXgtv9S5eRA0RKAcOGIqFSWIv1IyJjA==
X-Received: by 2002:a17:902:fc8f:b0:215:787a:f91a with SMTP id d9443c01a7336-21a83fd1e96mr525986085ad.44.1736965865659;
        Wed, 15 Jan 2025 10:31:05 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:31:05 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:49 -0800
Subject: [PATCH v2 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-pmu_event_info-v2-9-84815b70383b@rivosinc.com>
References: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
In-Reply-To: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103106_414663_FCA5F81F 
X-CRM114-Status: GOOD (  11.51  )
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

Upgrade the SBI version to v3.0 so that corresponding features
can be enabled in the guest.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index b96705258cf9..239457b864d7 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -11,7 +11,7 @@
 
 #define KVM_SBI_IMPID 3
 
-#define KVM_SBI_VERSION_MAJOR 2
+#define KVM_SBI_VERSION_MAJOR 3
 #define KVM_SBI_VERSION_MINOR 0
 
 enum kvm_riscv_sbi_ext_status {

-- 
2.34.1


