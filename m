Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859A9CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+kdgwxqgLpSk+BXagyhyh0KizQR0PlmXlxRpNRvoio=; b=jj0kmsTMpcgmuOS7oMK/Jh1Zqp
	DC+dE55MWZ+U/gxmk5620jGks1RShebzlVBgOkjb9T/QylLiROhae7Ry+M80HoR+jTfpm+lhyLGlF
	/i1s1AiKJ03xKKu1aqwQ4UQNFFdRse4sKkPghCC/egCnXUCcZPZu7Kh8a3/cg92s7KlJcqA6IFnw8
	M2helNfg8zXcRG98Iv/oxs4qCpXUGtie7nTAgbEVGcgnGeDYLfyjQqrM5LHH2/emW/1otLwjsK1iJ
	qYa3+B+5ZQxf+R0U5xXXLgoqYrw9awpS7bb29cso5Xo4Wcpjlo1j7GAdxhQUo1b6Ens+R/lg5/fj3
	JFaYreHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChDM-0000000BXOx-0BjW;
	Sat, 25 Oct 2025 16:34:00 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCz-0000000BX0l-2008
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:33:41 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-87de60d0e3eso31617006d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410016; x=1762014816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+kdgwxqgLpSk+BXagyhyh0KizQR0PlmXlxRpNRvoio=;
        b=SpSNNEBEmWwA667t8Rl4DE5CwL1fbSLRKrT5mqcKGmm84T5+x1zIsTjZy6EuAeOfNj
         UiEnSW3O5uXvRJ/74IRi7F1HGe8IH5LIgG6AB79vVNFUpM2+LiE78lbUou/p0IjwOove
         S7+X6SyHHPwPLaJs/Q74RU5cP32RSyvKScK6+m8zH377CWZnrmFkssVcUNsqgfHRW7CT
         c4Tw+xYBAxlkUAIXpINTs1jTLtBB+qujAiJ0bY6KXrfjamO5wXqbATMsA54IgtlYpRY6
         9lzSv8MzM+K0YWKnP5DaxPOsgYUdyB/NiOYPS8FWGfujHjupbafPQ7LREoYhsSRgUx7+
         c+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410016; x=1762014816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+kdgwxqgLpSk+BXagyhyh0KizQR0PlmXlxRpNRvoio=;
        b=XON8lIwVfnppPoI1IKJwUX722/eSkW1je61yX51A+0obTXRuxsgoYA2ZenccaO9kQW
         8rfkU083oFhstZM6/gD9Tc0V8EaR1CZ+++gVTp++lp5/NY00ikOiQhJBjo0dkIj8b0S3
         CxQRLHfDlSel47tiim5lm/tvon66dN5x5Uwcz8y2Vfidfv2MAGQm9afIMYn/Wr/9qEH/
         PwTy9boH+dUewSBvF0oVdLpX2Z+qI/HW9Y+qEFX4u6RJlXswufplPWy3o64IAvCAo6fZ
         hPGiB4VTjbcK+cTwbo5awa0ZCR66crKlzFepZB57pupkrq7a+WKd4ZWF4FQTzoKDo+Cb
         qO9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqqdV1Zkfhx74P4XtmMDGFBWoEDwR+ZqwWa+Dfg3zYgEk1Md1qFmRUPQL2uXY+NwiP4Ey+lnY19DK3v4pjTgCC@lists.infradead.org
X-Gm-Message-State: AOJu0YzFrSjJZ0+24lbsX61WILVWv2a90tcfVi7LblQ+cBoaOyQthRXb
	UA4qb6Xx7gHW43GLcRRjjRGHScVLsLxjmvfocfwzu67bZ00QOlrnSwWT
X-Gm-Gg: ASbGnctJtLz+i5zI4C41PLId6WlKXICVNI0hmPe5q/zsFRBt8+Zxp2CXaWgCdiXdzbw
	oYyPngm3xyzdUbhuyNZsBgJZm1Fl107weUHfckIJJ+3mOHmyl7JQ5D/vOjv4ZD2J0pujDF03JG+
	Drj0HoCiHGeovvJltUdL3v6nYS2kAD7WqEc3E3GHQzRUM+ocROFKlmb8D9LKBAgyrG2Rk1ESANh
	DjfpEGGxqeAyBpjltSwZMTftwYokR/Zf016si5HyqFPsfrLTeb4XoBk7A3+Y2T5rjRYxB2dZUym
	OcfEbikKhgUXpmB7YMyCIP48D+WYtUvrT2IEw7Iumr9+wHamO3MleL5rUzp5gF+IZvSWae881mf
	yGLlIiGfDP/np6CCHTVNBzCooWrlHPHTu4fOirJmWwiCM608OmpBXSp83qeG+s+PW1688KfW4
X-Google-Smtp-Source: AGHT+IFUNq9E9F5tkFvF4iIGRPUJo2bGn0CXF3o3/vXLG4KH0hAs0g3n//wSNOK/rhmKbOn3qmKqqg==
X-Received: by 2002:a05:6214:f6d:b0:87c:1032:e849 with SMTP id 6a1803df08f44-87f9edc81b9mr140672916d6.30.1761410016037;
        Sat, 25 Oct 2025 09:33:36 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48a8bc4sm16252346d6.7.2025.10.25.09.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:33:35 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <zbestahu@gmail.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <lihongbo22@huawei.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrei Vagin <avagin@gmail.com>,
	linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH 19/21] fs: don't use GENMASK()
Date: Sat, 25 Oct 2025 12:33:01 -0400
Message-ID: <20251025163305.306787-12-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_093337_560382_01F203EE 
X-CRM114-Status: GOOD (  16.23  )
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

GENMASK(high, low) notation is confusing. FIRST/LAST_BITS() are
more appropriate.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 fs/erofs/internal.h      | 2 +-
 fs/f2fs/data.c           | 2 +-
 fs/f2fs/inode.c          | 2 +-
 fs/f2fs/segment.c        | 2 +-
 fs/f2fs/super.c          | 2 +-
 fs/proc/task_mmu.c       | 2 +-
 fs/resctrl/pseudo_lock.c | 2 +-
 include/linux/f2fs_fs.h  | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index f7f622836198..6e0f03092c52 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -250,7 +250,7 @@ static inline u64 erofs_nid_to_ino64(struct erofs_sb_info *sbi, erofs_nid_t nid)
 	 * Note: on-disk NIDs remain unchanged as they are primarily used for
 	 * compatibility with non-LFS 32-bit applications.
 	 */
-	return ((nid << 1) & GENMASK_ULL(63, 32)) | (nid & GENMASK(30, 0)) |
+	return ((nid << 1) & LAST_BITS_ULL(32)) | (nid & FIRST_BITS(31)) |
 		((nid >> EROFS_DIRENT_NID_METABOX_BIT) << 31);
 }
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 775aa4f63aa3..ef08464e003f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -416,7 +416,7 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
 
 static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
 {
-	unsigned int temp_mask = GENMASK(NR_TEMP_TYPE - 1, 0);
+	unsigned int temp_mask = FIRST_BITS(NR_TEMP_TYPE);
 	unsigned int fua_flag, meta_flag, io_flag;
 	blk_opf_t op_flags = 0;
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 8c4eafe9ffac..42a43f558136 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -524,7 +524,7 @@ static int do_read_inode(struct inode *inode)
 			fi->i_compress_level = compress_flag >>
 						COMPRESS_LEVEL_OFFSET;
 			fi->i_compress_flag = compress_flag &
-					GENMASK(COMPRESS_LEVEL_OFFSET - 1, 0);
+						FIRST_BITS(COMPRESS_LEVEL_OFFSET);
 			fi->i_cluster_size = BIT(fi->i_log_cluster_size);
 			set_inode_flag(inode, FI_COMPRESSED_FILE);
 		}
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b45eace879d7..64433d3b67d4 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -5425,7 +5425,7 @@ static int do_fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 		wp_block = zbd->start_blk + (zone.wp >> log_sectors_per_block);
 		wp_segno = GET_SEGNO(sbi, wp_block);
 		wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
-		wp_sector_off = zone.wp & GENMASK(log_sectors_per_block - 1, 0);
+		wp_sector_off = zone.wp & FIRST_BITS(log_sectors_per_block);
 
 		if (cs->segno == wp_segno && cs->next_blkoff == wp_blkoff &&
 				wp_sector_off == 0)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index db7afb806411..96621fd45cdc 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4501,7 +4501,7 @@ static void save_stop_reason(struct f2fs_sb_info *sbi, unsigned char reason)
 	unsigned long flags;
 
 	spin_lock_irqsave(&sbi->error_lock, flags);
-	if (sbi->stop_reason[reason] < GENMASK(BITS_PER_BYTE - 1, 0))
+	if (sbi->stop_reason[reason] < FIRST_BITS(BITS_PER_BYTE))
 		sbi->stop_reason[reason]++;
 	spin_unlock_irqrestore(&sbi->error_lock, flags);
 }
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index fc35a0543f01..71de487b244c 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1845,7 +1845,7 @@ struct pagemapread {
 
 #define PM_ENTRY_BYTES		sizeof(pagemap_entry_t)
 #define PM_PFRAME_BITS		55
-#define PM_PFRAME_MASK		GENMASK_ULL(PM_PFRAME_BITS - 1, 0)
+#define PM_PFRAME_MASK		FIRST_BITS_ULL(PM_PFRAME_BITS)
 #define PM_SOFT_DIRTY		BIT_ULL(55)
 #define PM_MMAP_EXCLUSIVE	BIT_ULL(56)
 #define PM_UFFD_WP		BIT_ULL(57)
diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
index 87bbc2605de1..45703bbd3bca 100644
--- a/fs/resctrl/pseudo_lock.c
+++ b/fs/resctrl/pseudo_lock.c
@@ -30,7 +30,7 @@
  */
 static unsigned int pseudo_lock_major;
 
-static unsigned long pseudo_lock_minor_avail = GENMASK(MINORBITS, 0);
+static unsigned long pseudo_lock_minor_avail = FIRST_BITS(MINORBITS + 1);
 
 static char *pseudo_lock_devnode(const struct device *dev, umode_t *mode)
 {
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 6afb4a13b81d..9996356b79e0 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -356,7 +356,7 @@ enum {
 	OFFSET_BIT_SHIFT
 };
 
-#define OFFSET_BIT_MASK		GENMASK(OFFSET_BIT_SHIFT - 1, 0)
+#define OFFSET_BIT_MASK		FIRST_BITS(OFFSET_BIT_SHIFT)
 
 struct f2fs_node {
 	/* can be one of three types: inode, direct, and indirect types */
-- 
2.43.0


