Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87099E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 03:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPcqXqaTIBo3x10L2Zu0olCr3NMK/mAmrBeyqDgRKcc=; b=RdWsE3cpdSsXdAC8zpJOiFPfg4
	X1SsfIUpaFLO74uLIlfgJUXhaLYTr+uJQyQlH1rW+uAa6o6Y1SDpFXWEZ8Eb+9XzuoautgcgVSR0v
	0+t4/nTK7mFCigzfQy/2AbPqMx7EC07IzQlumhI7XR5adWKEeZnx2a7VWA9EDSwTpqL9j3wXltgif
	QCjCXn2dAv8OBwMQ3/H/2YeTZPecmb08kSHzEpSu9SJ+OZxHS2InYXnVlwSrYdWSPfKk3hqr7AOnX
	dI0HnWZXRdnjbQXgy7xY3FGmu/cr5KgIzW5Fsvs7CEmVTFrVugYBYq8oi+MAMb4uSwkrOPOryMj6E
	py1b+9YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXBKx-00000003vfA-2kK1;
	Mon, 13 Jan 2025 03:41:59 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXBIU-00000003v7V-1O84;
	Mon, 13 Jan 2025 03:39:27 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21649a7bcdcso62730165ad.1;
        Sun, 12 Jan 2025 19:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736739565; x=1737344365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPcqXqaTIBo3x10L2Zu0olCr3NMK/mAmrBeyqDgRKcc=;
        b=Gl+ww428QF0m6zZvTcsv3uyU/7iadXtfUUxPRhI1W/Y6WRPCJZQgRsosM+PYgFvYFa
         IOwKRMRC0OGZcLTfY8b7tUeOYjSGlBD/5EgabaJdFx9w5rDkzVXa5ShqPPPvQT6/qrej
         BbgGul4ANhtiHAQLq75sDX4avyzAtXgjAs5h0Bav2L9r7m2Q4exO9QLQq3lgt2sQ85YJ
         KSJ2s5W9nXCUuUom+S+u3o+zMOyTO209K/rkdGCHncBW/tOI7yd7BNwkp9yWCAAZ2LZb
         Ml1zrl4U3y129q4By1os/VI7+1UrzQbWxusc6RCwmoV30EITMBeXStdWmSEOnApTyZfW
         LPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736739565; x=1737344365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPcqXqaTIBo3x10L2Zu0olCr3NMK/mAmrBeyqDgRKcc=;
        b=FyCftRiiVmSihVKrHlchAkcgMnDke0i4AsDYJ8BZZ5Y5n1RxVizx7z2smlVVyUN02m
         nb7JIwzJL1jPnbBKAiWBV0mffjPwcacDuWw9XD/9mZoWasT8pTN8wC7576ejrXdgD2c2
         XufLwB8W+5QvhXdr0g9U6qTuF1NG93JU6g9Gd2x9rNnhrydKNjqYGAc2zqUWIjfsN1+R
         tsZzDmGYcou0L/MK5oleaTfYH12n1oyvTBCc8K6UcbCIQlYZ30nihyrkzNcmMlAEen7L
         +3rLOTYI6/a3VdKfvSH0+VEeEWIZk1IDEsjX5JOEb3/M6IsdDTipKLYiAXw7fH8asSc4
         chyw==
X-Forwarded-Encrypted: i=1; AJvYcCUDmJLiNho/k/mjbzjJCOHnTCi2Hu3DC2ZwI8Ovk5/VQjaG+TWNIpC2lsiDlV4bzFkFmjr3s6z89YQtZxJmbSUb@lists.infradead.org, AJvYcCVRu4bFjm3bB1WoCD0MCv9y8nGVlVE03gqiAMI0fSTM0jjza4pvCepUuFCr/T0qMrn6QXli9BJN8TNpxsY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyztEw31duBt/U/O98ctZ3sKC0h06ps1M0azHp4LIJ03O13ctlY
	l0Fa30mYRFNV6zvmYaBiv0KJHNwGrJHAtUfQoN6t10N56W/S+1ZD
X-Gm-Gg: ASbGncvSZk1QrIGmS0m4NuBD/GivKlGemCVXxYzfkhJoLQo+H98pxkjPTMGK1/2fT4x
	CxCym1IhJO86jZrrvDLZt7ct0KKiHvuyWLXYqxEe4YnbXv8Wch3O6PYVAwImh25B2VU8J5Tez9m
	u+ZeFy9eBfkpvnWwqTJ+GegYYXqPRgpOK72hKkhXeh3yz/GtqZkDjf9j1M5Ykjkx9c7VYzKFnbw
	6y/qLq5E8ATouAdMgbnDScK0/nqDeFWgYddOv2U5ZysGc4H2Br0Zp+yufQMBuHM7DAiYUlVY4Xm
	TkGHxmRC
X-Google-Smtp-Source: AGHT+IHhm0qTbSZrWVTQXUqJ8k0+E+zfqHExh6ZNZDkVUuwdyBd3fwtM3FFGJhBiv45zTGk0mUeVsQ==
X-Received: by 2002:a17:902:d2ca:b0:211:8404:a957 with SMTP id d9443c01a7336-21a83fc0619mr292344105ad.41.1736739565411;
        Sun, 12 Jan 2025 19:39:25 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:39b5:3f0b:acf3:9158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f25aabfsm44368405ad.246.2025.01.12.19.39.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 12 Jan 2025 19:39:25 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	david@redhat.com,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com,
	lorenzo.stoakes@oracle.com
Subject: [PATCH v2 1/4] mm: Set folio swapbacked iff folios are dirty in try_to_unmap_one
Date: Mon, 13 Jan 2025 16:38:58 +1300
Message-Id: <20250113033901.68951-2-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250113033901.68951-1-21cnbao@gmail.com>
References: <20250113033901.68951-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_193926_375137_10544CCF 
X-CRM114-Status: GOOD (  15.07  )
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

From: Barry Song <v-songbaohua@oppo.com>

The refcount may be temporarily or long-term increased, but this does
not change the fundamental nature of the folio already being lazy-
freed. Therefore, we only reset 'swapbacked' when we are certain the
folio is dirty and not droppable.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 mm/rmap.c | 49 ++++++++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index c6c4d4ea29a7..de6b8c34e98c 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1868,34 +1868,29 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				smp_rmb();
 
-				/*
-				 * The only page refs must be one from isolation
-				 * plus the rmap(s) (dropped by discard:).
-				 */
-				if (ref_count == 1 + map_count &&
-				    (!folio_test_dirty(folio) ||
-				     /*
-				      * Unlike MADV_FREE mappings, VM_DROPPABLE
-				      * ones can be dropped even if they've
-				      * been dirtied.
-				      */
-				     (vma->vm_flags & VM_DROPPABLE))) {
-					dec_mm_counter(mm, MM_ANONPAGES);
-					goto discard;
-				}
-
-				/*
-				 * If the folio was redirtied, it cannot be
-				 * discarded. Remap the page to page table.
-				 */
-				set_pte_at(mm, address, pvmw.pte, pteval);
-				/*
-				 * Unlike MADV_FREE mappings, VM_DROPPABLE ones
-				 * never get swap backed on failure to drop.
-				 */
-				if (!(vma->vm_flags & VM_DROPPABLE))
+				if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
+					/*
+					 * redirtied either using the page table or a previously
+					 * obtained GUP reference.
+					 */
+					set_pte_at(mm, address, pvmw.pte, pteval);
 					folio_set_swapbacked(folio);
-				goto walk_abort;
+					goto walk_abort;
+				} else if (ref_count != 1 + map_count) {
+					/*
+					 * Additional reference. Could be a GUP reference or any
+					 * speculative reference. GUP users must mark the folio
+					 * dirty if there was a modification. This folio cannot be
+					 * reclaimed right now either way, so act just like nothing
+					 * happened.
+					 * We'll come back here later and detect if the folio was
+					 * dirtied when the additional reference is gone.
+					 */
+					set_pte_at(mm, address, pvmw.pte, pteval);
+					goto walk_abort;
+				}
+				dec_mm_counter(mm, MM_ANONPAGES);
+				goto discard;
 			}
 
 			if (swap_duplicate(entry) < 0) {
-- 
2.39.3 (Apple Git-146)


