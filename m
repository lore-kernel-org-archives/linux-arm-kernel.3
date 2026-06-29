Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E9FC43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7qMl6JaTusMjQ71t10D/Z6xyVtqjy476HmM+ncXIDo=; b=ktM1oNTkyyQ2SzjiNd8UPAVWM3
	MydiqRpK7W+0qguhEWBmWF6FOzRMxvWCdAvJ/fl4Xd4zwqtQttIILSWnTW/qEIKhaodDTKf67EbtE
	87iY+M11KXbFgLte3vZGO0vS6XBUgnmTN4vrzHGSYMLz7vB70Nd5poCSAop/hIyzMGzNoY3tl0u2m
	Gj1XTxRczIDt/oCMCrNHIkhga6ueE3R1AbQbtwnO0zwSHea2sAiqNZyatsjPY0vHHugoeVQeiy5TA
	p/C1w9Cu3lbv+kYpv0dCbFoGbcMPQAG0tOUwpqvP+YRQowiEwF6uVUd7HaivnMPRzsMRI12LFavAM
	P0iFZa2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEzi-0000000FE7a-2tKv;
	Mon, 29 Jun 2026 16:38:02 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEzf-0000000FE6V-3PN1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:38:00 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-847968ca62fso546280b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 09:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751079; x=1783355879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7qMl6JaTusMjQ71t10D/Z6xyVtqjy476HmM+ncXIDo=;
        b=dZLhcGj+zqAl2fYi9N67oGx1zhBqTWiuLPloYYPfD2LZImrHkngN1rWVr9RXFDRSTl
         wuCQk+obLQj9qn//qqrOLCxXGOJXa2DUj7oAmFE2yAPNOaBU6EICLiyb1DMvOX2ea/Ke
         CK1HMeedhbufXwVVJkB3keqSRdcYCZkoXb9ddntczth2icFsB+5hY6MXXLXfZKr+UYLq
         cO0FEfW3al6tR82LKytEOkXUC6OEHVOTV09NQLhn+JTEN5FsZ7T4RVI0UHwaECVZ7vHM
         RHWk2igigKRRwzmQNrahP3l5RggFgapVYBBrOwZtzAt5Cv9kNK4RMi/zUiEkcVzUzyTc
         MvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751079; x=1783355879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y7qMl6JaTusMjQ71t10D/Z6xyVtqjy476HmM+ncXIDo=;
        b=IIVINMQpTjAfaq3jO/ijJ5PcnSGq3bBtK0f9zFYvqEfm21rH2Apu/rAndOnAMhayr3
         JknwC546GcIkOvn0OnwKj+XguOEZmJvvW3e343keQC5UIjmt5C8GT1rGrIXR6mDVV6AV
         jW2Ft3z4Rhon5u6TcRUHK9GQUzwUE/kiiUUy+a0C9OZ/8+sJaW1Qo+rnVvkPRmiKYdej
         q4jNXjvXnM9Trcmi7/jtvv84kyTCYLc/vSntljlsmrJZ5fLWZb/89xioXN5UhOxj2HHP
         qb4oBXRRxYHSIh14xCzPwjmmNvvsOpTCwsNMa+U0hq7isadxupWtTAIfUpzxSBbrFz5w
         POYw==
X-Forwarded-Encrypted: i=1; AHgh+RqlA5iFTLI13lEq1kucGTYYCyK3i4aKaD79ZRHjC945JplDqm7F+lRP+fJlOlm/mpL1cc5dx5JWFQJJtkd6e9qb@lists.infradead.org
X-Gm-Message-State: AOJu0YwsRgU72HJGZkEKX48qV5x6R5aQeno280sYNrC6CydhrzT40Kwy
	lyA/skCj79GrW0LOal3kewhW7uHHSW7SqHJ4/I/xomRH3K7NfDxY4QQ+blQVJ1PJ
X-Gm-Gg: AfdE7clsPz1N3gMwWajE0Qk1yurVOrM2KfPC5BaCW3sV17RtQYHd8ujUWPn48kdq92+
	tt8Q+455yvZRZc08hx+6fJtJywCNiJ5g4+nWvlb9HF1PQP85xCuzEed77QxBszB/SlEW7KqY7SC
	51mxzUJs1Gn11gpjwzWmsestiAgQOxWVgsU1VS+69rzyM6+Bc6V6yVkDHI++44cUIYmE9SnUPoe
	NnJK6+XUCU3kM0ZAhfKslQrysA3w7TdCM0FRQ09At9fDtMO5BcRbz6SJrFV7mJ7fKKgK/8nl1Cl
	7/k3mw0slYp742sSk0fjnhG2HelRpcLSOXd6hGCjAcU3Nhndc2/mbhsbvV1ITCMFJM2r7O3sH3v
	nAWBVLclG/TIZkDWv7BRmSjKi3ELJNXStIHrZeoHg4s6ekSpC//bcvf0zb/l5jb4f7E2A0v5Xf2
	TJAOmen2A=
X-Received: by 2002:a05:6a00:3d55:b0:847:926c:5837 with SMTP id d2e1a72fcca58-8479efe8fcemr225164b3a.11.1782751078897;
        Mon, 29 Jun 2026 09:37:58 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02d41c0sm18474b3a.33.2026.06.29.09.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:37:58 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: rppt@kernel.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [PATCH v2 1/8] arm64: mm: remove unreachable invalid range check in kasan_init_shadow()
Date: Tue, 30 Jun 2026 01:37:29 +0900
Message-ID: <20260629163736.1606688-2-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629163736.1606688-1-ekffu200098@gmail.com>
References: <20260629163736.1606688-1-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_093759_854609_7C942BCD 
X-CRM114-Status: UNSURE (   9.32  )
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

kasan_init_shadow() maps each memblock region with for_each_mem_range()
and breaks the loop when start >= end. for_each_mem_range() never returns
an invalid range, so start < end always.

Therefore the start >= end check is unreachable, so remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
---
 arch/arm64/mm/kasan_init.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index 3fcad956fdf7..45fbdce684c8 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -353,9 +353,6 @@ static void __init kasan_init_shadow(void)
 		void *start = (void *)__phys_to_virt(pa_start);
 		void *end = (void *)__phys_to_virt(pa_end);
 
-		if (start >= end)
-			break;
-
 		kasan_map_populate((unsigned long)kasan_mem_to_shadow(start),
 				   (unsigned long)kasan_mem_to_shadow(end),
 				   early_pfn_to_nid(virt_to_pfn(start)));
-- 
2.43.0


