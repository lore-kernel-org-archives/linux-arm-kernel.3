Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C3AFD0049
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 00:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FlYsMIetosgrE4CMeTN5UisWfC96UW45POAUar7mJA=; b=NAbGl92tM9PJsEKuUFns87VwuT
	6J19lfuPZMGdAc6kJqGluYaT5F72SmZWYdQwp1eK5MXSE7vGzPoWAWu+gb+rZDXYWrnKeRFRpw7Mc
	1MNgoJYOeKnAdiKTymi8pg+Jg0gl7ipzteCUETMcCZEglW3qzRGLFb0SteCc5thoAVZ/kj0/1vIbM
	6viiqvM+sDehEDVow97NWiJR+hvXzc0EHH2B43Pzpyq85WFl/sER1idXIQDbnB07EQCucunkz6cCA
	oGKSBQxObXSq7fPgMTqkikojlqaSEH0nySaHREyfbf1fetL58JzjRv8hxcXp8ZGgXgS8cvtzbUY94
	2/GV//uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUlJ-0000000APiN-2cBe;
	Sun, 01 Mar 2026 00:34:21 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUlA-0000000APep-2OAk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 00:34:13 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-506cb1b63d0so41793541cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 16:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772325251; x=1772930051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FlYsMIetosgrE4CMeTN5UisWfC96UW45POAUar7mJA=;
        b=k+KhSYfubXSs6Fa2nBmGt4FATtObh4cH/L5T2USWTAx2gDJgtSbJRjlxr+kcKMYFSS
         xw/5Upb7WYB6VcCaBEzuw101wcfTPPVmwRgINI+sjcCe5s38+SRK0jO51bYak4zuGF/w
         MFFiH25Tnmjsp5z9xchyYf7WP9Lc78wUw/nj6TYDQ6oTvMLMjWloJAruFne4Lwic11sf
         33Y/n2A7ecxbvoOs6/nsxkYk0pxpOYCgp1OEJeYbAXKLJs4+4RHF13tFnnuDCpuEoE0y
         C6g1JauFv06Yj2rq0Wh9aJzJRXPhBlDuxyMAYgT+zqfQpuOIivczrmd/ZrzDQ+lrOWj8
         kdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772325251; x=1772930051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+FlYsMIetosgrE4CMeTN5UisWfC96UW45POAUar7mJA=;
        b=RXMXOmXaiLqyUGH9dJAUqd7un6R95mjYeegMQM0QoQ9Ylc3v9mumqGsaJqm0DMEb6X
         jh2eBqJBcCd4QSb2djBkhrtn61tIcx1vBXZBzt16cG6fTYYsVpO6HbyBBs2xuqVKD1Fe
         AM3NCGyGeU0U1ekio02WWnH+wM93yA2novtzcV4r5RU5AVucV02TJ5p1kvnqD6xD7R0J
         aF8CNyYeTQN8KlSBJJuH1xhm1mgoi/ARsImO7f3lm9WRgr642NrzpVKkp3bKVPvxIshb
         YyR35xsuScmAj07S4YC9SgJGON8R9DmADv5od+lxGHa12OIDDj2VCJttuLsI9GaCupQh
         i2eQ==
X-Gm-Message-State: AOJu0Yz3zYDeESmvii5VLzp2MAaHwNJUfbHFLke3U2I8KRo6n7RpIddv
	1C0qD7EB5wMPhFv5mBXqnqQJlkMRk4vVfHYkaiQTBXlVzA+aR3m4Jxxw
X-Gm-Gg: ATEYQzxWXt+tGweYbAUKNuAIVSODN0KpKvJcpR/3CXredZCytzb7jcEUIJ8XbX/QzF8
	WFKf3UwyC98Xb7PKsQVx0YPfCuoGHdAeOppf+teZDpHHUs8w+jw6CLzpVizxykM0Ah+KvoOtnCg
	dCX9fCQvb6dP1N+ybr6MnUgSH52rzJXRaN/CjywIT3jxGZ+PI0F7lWLDFg3cs4g4mhVgR8yFazD
	BC2HnubmNxf/19YX6CNbw8EPP4K9zpBpUbQmjgB8+ZfAcq2Hd+3Tu97lLSSvbyotebatexwbW7O
	Tpfs2EVVY/PPyFsD/pc942zBWbWRxyFO3juPq4pK+sH7i7kadCTh3HpGJ2XhEcTHfhFYiyheAN8
	0LMIY3Pzq40Lw+huw+zS07KQ5CClr4awyur9JCnsl1hM3kZZt/ln96wkmPeJuExbb1UrdgrrnPz
	I/CNQJrsxgHwWLDQzWwRhtfw0TnbwOKkL7hzaDCnZltqo8AFkSXmGcQIqSl979HC/h0752xq0NZ
	z2q
X-Received: by 2002:ac8:7f8b:0:b0:502:f291:615e with SMTP id d75a77b69052e-5075289dcffmr106838041cf.52.1772325251160;
        Sat, 28 Feb 2026 16:34:11 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449630a0sm73258381cf.6.2026.02.28.16.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 16:34:10 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 4/4] arm64: kernel: Fix style in io.c macro
Date: Sun,  1 Mar 2026 00:34:07 +0000
Message-ID: <20260301003407.2493781-4-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301003407.2493781-1-objecting@objecting.org>
References: <20260301003407.2493781-1-objecting@objecting.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_163412_607434_5DE434B2 
X-CRM114-Status: GOOD (  10.77  )
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

Signed-off-by: Josh Law <objecting@objecting.org>
---
 arch/arm64/kernel/io.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/io.c b/arch/arm64/kernel/io.c
index fe86ada23c7d..ce27fa5d2e37 100644
--- a/arch/arm64/kernel/io.c
+++ b/arch/arm64/kernel/io.c
@@ -17,10 +17,10 @@
 #define memcpy_toio_aligned(to, from, count, bits)                        \
 	({                                                                \
 		volatile u##bits __iomem *_to = to;                       \
-		const u##bits *_from = from;                              \
+		const u##bits * _from = from;                             \
 		size_t _count = count;                                    \
-		const u##bits *_end_from = _from + ALIGN_DOWN(_count, 8); \
-                                                                          \
+		const u##bits * _end_from = _from + ALIGN_DOWN(_count, 8);\
+\
 		for (; _from < _end_from; _from += 8, _to += 8)           \
 			__const_memcpy_toio_aligned##bits(_to, _from, 8); \
 		if ((_count % 8) >= 4) {                                  \
-- 
2.43.0


