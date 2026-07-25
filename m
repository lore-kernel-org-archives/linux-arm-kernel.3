Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C023EC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 12:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ypSp8xOZmUQxL3HlW2YpfM4eRYnNClQFINiGkiWEKg4=; b=DBpgxhRmQXe6mn95G16aTzy/xg
	KPVllKoEFjYKtY8i4Z6E14ImN9M8Y/g4wje9UQUSDUNvMz5KZSZLrLNjxtOaKfY0r63McExLGELXy
	Y6TAsCQf8Z9Qg2EJsrxbGf4f7pjxVLU+90uLxg9Z1WpffQIhY4C7s/x9Aa96WBJYWkI2hI0MqbkOc
	mut0LQAnkE3ovLSgpjs6v1gSgGQIhJOVDhp6YsQeED+cEYNFBgkPbvZfhZRuuiAqmOt69I9NeMs90
	GC1qiNX1ngTgdL8gi5RZH6f3tVq0klM5Ohdew3AKpVSB8ADMbdPMVQ+s1diCw3jRvgQA4rHeFNvJS
	CUODFDAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnbWA-00000000LWu-1fgw;
	Sat, 25 Jul 2026 12:30:14 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnbW7-00000000LWN-3tqt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 12:30:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-493f75f7172so11053355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 05:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784982610; x=1785587410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypSp8xOZmUQxL3HlW2YpfM4eRYnNClQFINiGkiWEKg4=;
        b=jU7K1iaTKPuMcV7MbWl6drbBKghVmSOlUs8NquAyUOsRK3xARwL+jELo0yATJRS4x7
         lSeLC6sLIiv0s+VgQr4MIC0MK2aGxQ/twVkc4m/mD9xffaqooRG3E9WQ0BJV9P96641v
         hpmKB7MQKIpBZ5AhdG2azksQjpXtyOMDxNZhpNMPgcZ+tMHa79MGZYAs//s/Lp1Ovxxt
         lyA3uKAl/9K9o2/h0RKHHa9HhYOe27p1qcpjo8Tc6qpMFQPs7H5XNE4SkYEWoj98W99z
         +tarJdbDlatGlMiJbducuhGIc1nSMalNBGgRresir9fDzI/7CV4PDfto3SFHTJWFO8QC
         cuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784982610; x=1785587410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypSp8xOZmUQxL3HlW2YpfM4eRYnNClQFINiGkiWEKg4=;
        b=lppCykSvtKKbErWeioDWkVT639Yx+QhkqQuObXOxEznZ3Kk81ThceZPylD8C4HSgk+
         U3+5NeulXxx+zKWY0s6TWTfiiYw9uagFQtFzTiYYNRvnSv8DHM7Yk+N8ydTa/OQVI6n8
         S+7tdgpYpHvRvUEOdqqn4UpfISxEAXkOfTy1HClMh6MMQTylHawaBMeYMufzlWYypjIK
         kE9aFJCfWfHG6STAqeeEo+kp4JpX2CJsmk5GkyaUUxNRiMyVSp8vy96/eyF6oxG7tMnC
         MYTvMdXmLE0owUCIwzSetjC4qs2Vqms90QJcp163SVEkf+J9gKa61AP5OndtH1qOqS76
         xrzA==
X-Forwarded-Encrypted: i=1; AHgh+RqT1fa2DsPbxWW1sHl27RjNckXA4c8/TNxhKeTEN92J2EYsr1y4qtDoeE0rp7nrfFMt8Tgo4KzWjFq5pOFl1aRp@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk2D07DP1LznM3fPjVUV75qPhMhwFvlAkNzxtyonW/hSR/KVS+
	UUsiD0h3Ws3By95q42iNq0zWkpt2uGkAkRznmY+rTWqpkTRm37uLitr0
X-Gm-Gg: AR+sD121+hWVcHs5P3ng5lGF6nXE6vxjyJUJHWE1gQkYmWayHhURmHK36NU6EmQFPbS
	6LBslUqgh/cph7cJ2jOEN66IYPFXlQ0MdY0JXjoiW/Dxs2dRGNvYARqlg2F1wEbW9drmfl1xW+Q
	Rczs4gLpm0tSRAntOogS52H3GBYIzZMNTwyZOEEPRAHBlbzPZ/pzmAGCc3emMpPq8cOcBRxcwcB
	DxBqHp4KRCxs1fcKJkYAO3j6GT8k64X9tCej3ib5DgerHUDkoaqzYSluCv0u0zHfEdYIHvMe+hg
	4rFr82j+HpgMyxsPlyCQSoNrBoY9+XKnp0u3koMPrcnSecN9w9D4WxVHim5XsaWJfECGmOIYiKB
	9Oj+dfAK3G1Xv3XqoornRh0qtpOwgVBxOqwpXsCOPfCzWW9boSYQePb7hxeA9H9909lkDS/N52l
	p2MQ1DT81UjSb2dlEx62VOZVY3eZ+fDaUxZj52430T/zrERn8eU3BoBAgaWUEUM2vd7/b2a7o8C
	jqomZL5AuolqaD6NMmsmxcdiD8pI7QSq6rlnzooiC0uqdldOYf4evwB0Eu+Nud3rm+cQ0OQDLa2
	siN1fW5CKw==
X-Received: by 2002:a05:600c:4f81:b0:493:f528:58ac with SMTP id 5b1f17b1804b1-496b56f9d75mr28590155e9.21.1784982609382;
        Sat, 25 Jul 2026 05:30:09 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b344-be01-c902-8e3f-9491-60c2.310.pool.telefonica.de. [2a02:3100:b344:be01:c902:8e3f:9491:60c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b52eec24sm58012795e9.3.2026.07.25.05.30.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 25 Jul 2026 05:30:08 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Liu Song <liusong@linux.alibaba.com>,
	shechenglong <shechenglong@xfusion.com>,
	Jonathan Marek <jonathan@marek.ca>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH] arm64: proton-pack: Restore the nospectre_bhb command-line option
Date: Sat, 25 Jul 2026 14:29:59 +0200
Message-Id: <20260725122959.98361-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_053012_037676_F65C1CBB 
X-CRM114-Status: GOOD (  14.05  )
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

Commit 7f1635737823 ("arm64: proton-pack: Fix hard lockup due to print in
scheduler context") moved the "mitigation disabled" printks into
spectre_print_disabled_mitigations(). For spectre-v2 and spectre-v4 only
the pr_info_once() calls were removed, but for spectre-bhb the whole
branch went with the print:

  -	} else if (cpu_mitigations_off() || __nospectre_bhb) {
  -		pr_info_once("spectre-bhb mitigation disabled ...\n");

spectre_bhb_enable_mitigation() therefore no longer tests __nospectre_bhb
or cpu_mitigations_off() and the mitigation is enabled regardless of the
command line. The flag survives only in its __setup handler and in
spectre_print_disabled_mitigations(), so the kernel prints "spectre-bhb
mitigation disabled by command-line option" while
/sys/devices/system/cpu/vulnerabilities/spectre_v2 reports "Mitigation:
CSV2, BHB" and the vectors are switched to EL1_VECTOR_BHB_LOOP.

The only remaining escape is the SPECTRE_VULNERABLE arm at the top of the
chain, which a CSV2 core never reaches, so from Cortex-A76 and Neoverse N1
onwards both nospectre_bhb and mitigations=off are ignored. Both are
documented in Documentation/admin-guide/kernel-parameters.txt.

The identical mistake was made on the neighbouring branch by the
immediately preceding commit 62e72463ca71 ("arm64: proton-pack: Drop print when !CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY")
and fixed by commit 165eb13e485c ("arm64: proton-pack: Fix hard lockup when !MITIGATE_SPECTRE_BRANCH_HISTORY");
this one was missed. build_bhb_mitigation() in arch/arm64/net/bpf_jit_comp.c
still tests both flags, so nospectre_bhb currently keeps the exception-vector
loop while dropping the cBPF epilogue mitigation.

Restore the branch. The print already lives in
spectre_print_disabled_mitigations(), so only the guard is needed.

Tested under QEMU with -cpu neoverse-n1 (CSV2, no ECBHB, no CLRBHB).
Before, spectre_v2 read "Mitigation: CSV2, BHB" with and without the
option; after, nospectre_bhb and mitigations=off both give "Mitigation:
CSV2, but not BHB" and a boot without either is unchanged.

Fixes: 7f1635737823 ("arm64: proton-pack: Fix hard lockup due to print in scheduler context")
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kernel/proton-pack.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 7bb6553fec08..4eaa523cdeb9 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -1036,6 +1036,8 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 		/* No point mitigating Spectre-BHB alone. */
 	} else if (!IS_ENABLED(CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY)) {
 		/* Do nothing */
+	} else if (cpu_mitigations_off() || __nospectre_bhb) {
+		/* Mitigation disabled on the command line */
 	} else if (supports_ecbhb(SCOPE_LOCAL_CPU)) {
 		state = SPECTRE_MITIGATED;
 		set_bit(BHB_HW, &system_bhb_mitigations);
-- 
2.39.5 (Apple Git-154)


