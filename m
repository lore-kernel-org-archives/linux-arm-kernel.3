Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357DEC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 10:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZhAYztASFyJGMSgZE5i6lkqu3vzWqDwef4eaMAfdZ0=; b=3b/MOxmpk64O4BdphOMTLaW0DV
	Q7h7d0DmAbOsu2Oby4dCdK6/l6fyEMiAPr+9nElVUHWJSyoKv2qwfJ4STp6Z4EFtpncKEjhvV2fHc
	JYgbUhRJA3g9Mu3924ivYbZBfkzEHeOp3+p68igqMndD1xTCL6Xx1p8CzxeMhyXi3PLcMH3QSfqwi
	Nn5I8njjiPrbGgeH0xjTEZdAW1vCyTX8qDx0l1rULMXQ85h9hbAAeLcZ/vNZHFUiyl2/WMjCMY96S
	cmE1HO6idJhC4Dv6X4uPk63OuaTs0ZMxLBmoDpwJcgi77UKX60LJ76FEb2LFaM0y8MtTHpqopfvmh
	3+q3+fPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxkH-0000000AcvM-305M;
	Fri, 28 Feb 2025 10:37:29 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxYy-0000000AaRw-1E6k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:25:49 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43935e09897so14222655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 02:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740738346; x=1741343146; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rZhAYztASFyJGMSgZE5i6lkqu3vzWqDwef4eaMAfdZ0=;
        b=duWcSlv+DEdHkiffa2TQJ18wTQJLVYCoRKxrgE++RWXm26/MoNEQcWai/X/oxTYlye
         T9CeUZ8T0wWdMObz8KBn9ALKsDao/CpvYUadY22VL1voWtPt7wd19XMaLgPi0vgoI8wb
         UiqA/iD02B/BIKpE3tKI8hkxO2Lt7kOMJPC1U4me0mdaPXeYbRUEZXdlC5dXyU8e/Xuo
         a60wnf+tI9gdAgxtTOeVviJgfkslogB7NRAIGadGTgmz1hcNFyurWkmivdvBvrd86iGo
         JoauIDUYT0DR6LkYEOfpgjwb8dxZYgd/OsxlxWSRt9SxwACkcepWPfj8BGVEyLT0igtF
         cTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740738346; x=1741343146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZhAYztASFyJGMSgZE5i6lkqu3vzWqDwef4eaMAfdZ0=;
        b=SOxMbH1uxTOoURV3Bwa+QurlEIjWgruaoQlMLDK5Nh2ZnQlkL6KawLxJlFmCUCRBJx
         wtS5VJ65JKhIVAnhEvXd/UDwiAg7K4vtvtAMrSQ2rsFBGSvfoXZ+kkzc01mC87oOomEx
         MvoyNJADV1dkZvXWtSs839o+/ilIiA7QY2JVkRhbfTAxRaveZHJ0Y8LMER+J9ZG/ACI6
         kihY/IdN4zpBCpjb6+2N6uq8vIVXNaVBAn1dfxJc6vHdNMuFSrKBXUvrq9MuauqpnQZs
         1ln2dCbizHb1SfuP/ipESyrt97j0vcboLWxC9FWTMIcBY/Gs27y35fAI+HbOSaDsSzST
         vKFg==
X-Forwarded-Encrypted: i=1; AJvYcCVbZVj9FUkHEetFHjbWb315xH9OOA7pon/ww9OoyCAdkjnV1vCuhPOXlYfyGshl4ZNhmY9qso2SKjXx+aik6BIP@lists.infradead.org
X-Gm-Message-State: AOJu0YwPsUM93TGzUsmq2aAcx34GOvZQmIvRyjSbMUxAntawPmHzv3xb
	84xtnR2ztZYhieWqjInMV5mUEYMts1n9c3CxUFoRnY3WYI3R66KjOJ4EmlCbiWDSOdHn5RhinP4
	GhvFOEk/Klsz0GRP7Xg==
X-Google-Smtp-Source: AGHT+IErysWGWTMM3bCvvoDqVF2QmB3ahdAOa99vtob8aheucDELjb3c2wdk5I/bEmp96LHcj4ZpHr7SpAP9x51t
X-Received: from wmbfm6.prod.google.com ([2002:a05:600c:c06:b0:439:9601:298d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1986:b0:439:98b0:f8db with SMTP id 5b1f17b1804b1-43ba66f9800mr25488185e9.16.1740738346325;
 Fri, 28 Feb 2025 02:25:46 -0800 (PST)
Date: Fri, 28 Feb 2025 10:25:17 +0000
In-Reply-To: <20250228102530.1229089-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250228102530.1229089-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250228102530.1229089-2-vdonnefort@google.com>
Subject: [PATCH 1/9] KVM: arm64: Handle huge mappings for np-guest CMOs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_022548_328770_4DFC5313 
X-CRM114-Status: UNSURE (   8.42  )
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

clean_dcache_guest_page() and invalidate_icache_guest_page() accept a
size as an argument. But they also rely on fixmap, which can only map a
single PAGE_SIZE page.

With the upcoming stage-2 huge mappings for pKVM np-guests, those
callbacks will get size > PAGE_SIZE. Loop the CMOs on PAGE_SIZE basis
until the whole range is done.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 19c3c631708c..a796e257c41f 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -219,14 +219,24 @@ static void guest_s2_put_page(void *addr)
 
 static void clean_dcache_guest_page(void *va, size_t size)
 {
-	__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
-	hyp_fixmap_unmap();
+	while (size) {
+		__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
+					  PAGE_SIZE);
+		hyp_fixmap_unmap();
+		va += PAGE_SIZE;
+		size -= PAGE_SIZE;
+	}
 }
 
 static void invalidate_icache_guest_page(void *va, size_t size)
 {
-	__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
-	hyp_fixmap_unmap();
+	while (size) {
+		__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
+					       PAGE_SIZE);
+		hyp_fixmap_unmap();
+		va += PAGE_SIZE;
+		size -= PAGE_SIZE;
+	}
 }
 
 int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
-- 
2.48.1.711.g2feabab25a-goog


