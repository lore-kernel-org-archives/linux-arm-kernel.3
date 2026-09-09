Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A80C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TFcwUhsFdNQuYy+bl3DAKp/OsoqgqJhUqWoiXjUvvE=; b=nqpeLeUcb/6WOF2vbJtVHbEg5Q
	ztSBr1ysw3cfXMh0MxaAQB1iss4gM4ICeNkYbUfW/cc6u+VJM5lrQ+x/BBUuhw8Vo5niInFgZiDoQ
	tln6hwOtvrUEJLkshC7J7TVrP2mkxnRExGbWTj/AtjNKWSal1NX/P4bSq0+n+3ZKEBVvxtsLEe+dI
	4H92zC5+MzVLJfAy4nVZo/Uoh2hFSA1I+GRM1O7O6kQtnm0vA0kvhoSmvAK9Bo9A3kEmgjwBC/NqO
	WIlWfL4VLdVSi3CC4nRHmdXnCRuwoj5Mses509NMpNJZWZ2rGicP2YUvw+XLgciRLoHlTS+EmstGW
	BHuE97pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46Jm-0000000AVdg-2tG2;
	Wed, 09 Sep 2026 00:37:38 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46Jk-0000000AVbW-26Pv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 00:37:37 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469b2e2c3so573597b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 17:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914256; x=1789519056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TFcwUhsFdNQuYy+bl3DAKp/OsoqgqJhUqWoiXjUvvE=;
        b=RrXOgA/hrFJ09I+1+Cv62T5h4r7JDCUfD9plgnf8U6f97tvjNEQv4ETsRzQiNScU0x
         +r/QFlHImaYmkqujyGTHQVPSXAYZkYPkZbljQ0V3cOP9ZKYTRuWuwV3j8qrBhCt+ycB8
         resGzto/kCgOQJgQCFmS6oOMqGhc1DkobVZEaFTWe9D7KyuAjhj95W98fIlkZclOo4z3
         7J0Uwg5D7vfZ/j4zwYQi/zJBbDmGUL6s8Y1MNTkOvsFnlCiq73YOYWIpWAGZLLFB/swJ
         iptp2GJpMkC3HHjzRGiis0n/EM2dX3k9R74WVndq5CTrjMJPItJ7DHqgKuwOcpw17aJ9
         b3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914256; x=1789519056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3TFcwUhsFdNQuYy+bl3DAKp/OsoqgqJhUqWoiXjUvvE=;
        b=dHjmHzOXP/xdOEm6SBOqwluKTPrJrC5O8a5fVO9i7A+nrAl1rfvZXolqhzVTEUt68s
         vmoPHe7UGuNxWZCbR6UefqUBTbrvWWzsxz5Zob6tyeMpI42A8umFLHJdsEve6prq87Gg
         2+N7DU7BvF6scwKWF1H/3YKX/PGkJ/yWR9roFavYAVNSAPQAlxbyTxvjp0rfmIm8amIg
         cKthItmIgEHDHbaOdgpXgNj5Fm6NEeBVhj25I9kUn6XLyIf8NX3FyioTUKuWKAzMT4NV
         kRXMVQnnQLxb9++y1R9rz8XYh/O3HwKsdU0zR82yDewlxh0kTm2ZEmugjlgBbeJXP3Nw
         dBjw==
X-Forwarded-Encrypted: i=1; AKwUvBwodKqJ9rsecyZWWqb1K0SumFLqrx8RACTKrhae3ZxaPkDTpmN61/S0p8Tp0iVag22Ey4xOUobnXqSIrS6v0qu9@lists.infradead.org
X-Gm-Message-State: AFuF++nUjSt8TMkh+mNinFKj3ETiClo71fCq6qS/2xFn92dlTY1pVF4/
	ZUss73TX72EJX9Ly93VDn5aFmSFcQ70hIpwJ7YYPuarBAsTYioZr4z+ikB4e5sBIWR0=
X-Gm-Gg: AYBFou1mKzUEOVlqlrFKqruv1TXIKeSYU+kwQEDic7UYNdS+iiAmcdBv1Qy2ZLhAOOU
	AhNSx2F7hco/kTz16UX+8inUDn15NvhoeSP672qlOPiA0fM8coaHDe0/AXk5N6kY7NQQHvfHh4l
	1jO3Czwsa5jXSxaR74cZUUFY5y6iab7AYitcwTUmY8OnmgCcavzpOl0bWI7O/FMNJeCxi98HhFB
	s7AhDMWI/XsS5lUSE6DxjZCvwxeOmu2CzAht197uGOBSJiQgqv5ser/rdSASVbIKB+KSM7E6Pyf
	h3qZwMQR1SxvHwGRRsCOQaqbmJ9h1nJs0NnuSwYttSCdcjqjuHOOXp/uwUNmSzTX1rR6KsphHAw
	o71a7HdAflLXlqYJR3ArT9W/ZtU0kFsYk2d7nC9P9sPyVmYNL71qBp9imxjgakvpwmKis+HE+IG
	UHsztXmwbb+pLoske2ophS6GyvLTNhW2fgHT5dhxz7dVXI5XLLtCFgni+om+UFxA==
X-Received: by 2002:a05:6a20:5491:b0:3d1:be60:2816 with SMTP id adf61e73a8af0-3dabb0a70a9mr3781304637.10.1788914255795;
        Tue, 08 Sep 2026 17:37:35 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4554ad478sm6231339a12.31.2026.09.08.17.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:34 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 8/9] crash_dump: Disallow configfs/crash_dm_crypt_key/reuse if crash hotplug supported
Date: Wed,  9 Sep 2026 08:36:50 +0800
Message-ID: <20260909003657.1570544-9-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003657.1570544-1-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_173736_547319_E051A1C4 
X-CRM114-Status: GOOD (  17.41  )
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

If crash hotplug is supported, dm-crypt keys saved to reserved memory
will be taken care of automatically. Thus it doesn't make sense to use
configfs/crash_dm_crypt_key/reuse. Not reserving
image->dm_crypt_keys_addr makes it implicitly to disallow using this
API. Currently x86_64 and ppc64le have implemented crash hotplug
feature.

Also update the doc accordingly. Note two doc issues are fixed as well.

Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 Documentation/admin-guide/kdump/kdump.rst | 16 ++++++++++------
 kernel/crash_dump_dm_crypt.c              | 12 ++++++++----
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 7587caadbae1..0bf2eb100a05 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -577,9 +577,10 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
 
 1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
     # Add key #1
-    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
+    VOL1_UUID=7d26b7b4-e342-4d2d-b660-7426b0996720
+    mkdir /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID
     # Add key #1's description
-    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > /sys/kernel/config/crash_dm_crypt_keys/description
+    echo cryptsetup:$VOL1_UUID > /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID/description
 
     # how many keys do we have now?
     cat /sys/kernel/config/crash_dm_crypt_keys/count
@@ -591,15 +592,18 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
     cat /sys/kernel/config/crash_dm_crypt_keys/count
     2
 
-    # To support CPU/memory hot-plugging, reuse keys already saved to reserved
-    # memory
-    echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
-
 2. Load the dump-capture kernel
 
 3. After the dump-capture kerne get booted, restore the keys to user keyring
    echo yes > /sys/kernel/crash_dm_crypt_keys/restore
 
+For CPU/memory hot-plugging, you can reuse keys already saved to reserved
+memory before reloading the kdump image,
+    echo true > /sys/kernel/config/crash_dm_crypt_keys/reuse
+
+Note if crash hotplug is supported, this API is totally unnecessary thus will
+be disabled automatically.
+
 Contact
 =======
 
diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index bc70fbb79e0f..666c1f0c9e3b 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -324,7 +324,7 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
 
 	r = -EINVAL;
 	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
-		pr_debug("dm-crypt keys haven't be saved to crash-reserved memory\n");
+		pr_debug("dm-crypt keys haven't be saved to crash-reserved memory or crash hotplug supported\n");
 		goto unlock;
 	}
 
@@ -522,14 +522,18 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 void crash_dm_crypt_cleanup(struct kimage *image)
 {
 	/*
-	 * For CPU/memory hot-plugging, the kdump image will be reloaded. Prevent
-	 * keys_header from being cleaned up during unloading when
-	 * is_dm_key_reused=true
+	 * For CPU/memory hot-plugging without CONFIG_CRASH_HOTPLUG, the whole kdump
+	 * image will be reloaded. Prevent keys_header from being cleaned up during
+	 * unloading when is_dm_key_reused=true
 	 */
 	if (!is_dm_key_reused) {
 		kfree_sensitive(keys_header);
 		keys_header = NULL;
 	}
+#ifdef CONFIG_CRASH_HOTPLUG
+	if (image->hotplug_support)
+		image->dm_crypt_keys_addr = 0;
+#endif
 }
 
 static int __init configfs_dmcrypt_keys_init(void)
-- 
2.55.0


