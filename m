Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC093C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrbS3BESBt65p0R6Xy9pWvWwpzxrdANSE+CV32PeomU=; b=SUYP/Cy43gbNcv58xYHoy52vGB
	evE/yFi9fv0ZnihrAyg3oe6uL+lOVc/NhEo4xCN7Sah/FIYnGRi6hyb6oQ8xf7CL0/tCQDIOHbC3I
	XaC4eAi/VL1fZpyIADRnUQK0bSe/BuuCEkCm9Z2GRYi2o6RqNqBI5YQk91N266E9bbDa2SB411Fr1
	vLTXt7vc10Q6ReS0SeMUPZ0y4yKq9fTV8FNN6FRnhXvN460RrXRxlu3VG40o+sKhcxZhizV4kTy9l
	gvMJeW+jfdhgtawE9IUigk6GV0LnvwCAUZLa6A3LyjojKE0WbutipSao+7AL1aQ5OaVJXexxgKhyt
	0+gXf/Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46JQ-0000000AVJ8-0o8Q;
	Wed, 09 Sep 2026 00:37:16 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46JO-0000000AVGQ-0cpX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 00:37:15 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-398e9698a70so4756731a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 17:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914233; x=1789519033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrbS3BESBt65p0R6Xy9pWvWwpzxrdANSE+CV32PeomU=;
        b=nHVq9JMyxtyRXS6jfyMwpOB8KzcZabpueaHbv5RoOEfGgQqoiNmlDEB2F/k8oTDbDW
         6gFP2F6dDQH9DuMAz842+qXREHorHKy4EsgSssnUOye65nC+Y+4a0A35HIpCvWsCKaZg
         g6o8lwnPbk39ARFge4r9n5PrfHz6lCeEAeetNiZD5eXP9g0lJtw0BrhmI3dzGbilqNIv
         EwV7wr/KZ+xpSVr53X0Te7uJDIzVmYuwTfk0cUcT8BSIyrumd26sCmJY1F1UhwoN7ZsR
         Zqx1UJknfRa5jm3uySG1l+PQe3ZnZFoehll8Bzw4n9GknbJAjvhsR8T4RNtYOm0Vlrqe
         MuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914233; x=1789519033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrbS3BESBt65p0R6Xy9pWvWwpzxrdANSE+CV32PeomU=;
        b=dIlfS7N11ioE8UKMZtnzk+nBiQjrQPH3e9KmKRiqNTLFIwbKRrVrrBG9lS2bRgmeNU
         fnh+2J2yHMpypORoYqVUSy1JgsEY9ADTSEsNdJf+87LbYyeVlwWX9xI6W0+LtC2fOD0B
         Wkaqe+j7+GuQB3VA7+dw+d4HquvQLIlwSiImkQWSg4vldEr4vigAkPh1Au5e4Oydhzry
         Y1YB5FECjLsx8fT5o4jtFH2D7/Vhxke+iQdkMNsa7OOQteiKr1xFDYW5MG6WNKh/WnoS
         N3k6U34b5ddgOnrBTqs9Tloh4je+CjPxfKGPd2zErdncw8FVHCK79/0qxX2zWh2q+RrY
         HpcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqiBPjXMStWASjHToff7/1vkGZGjb5gCKtHHpi3jVkrtzWCUh/2inYgFl3/EMZknHrMyCaUFLlVEK+09u3AK4S@lists.infradead.org
X-Gm-Message-State: AFuF++mHq2swTbVjOlWEFkkfove7cB3+5nweziIEcSh9MrC62Vd3iXWN
	abfglyMDhq+sCKmYVypmQyoNZErO27noRlLI4FoxGOXeZkbzja6RromJ
X-Gm-Gg: AYBFou37TCxpIPz8h6T0PzexhQvVNes49u6XlqKG6927Z8IfhJ4GBF857f9v+c3DfoQ
	wABTiXjaIfoKrQlnzrNHl4pHPxj9XRpTjXil33kqNuP+e/vsCjJIdUppEzuxjgPSL4l+9oToGty
	o4pLLRAYe8ANBuj90gdVCUA1XJ7FS0EUNip8Z2XJ3Tk6Jw7zUkxkEYeWrBnesktfGeL3Ld/Yn+D
	zCie3I6Z0wmXDhYQd3YlfXe6mbw/Ko8IPonO9mq0pb7Md9tAyvqCYQfCNws/lJnSmfHq4vTYmNl
	VCSPUf84+9qtimDYKzkpAhXBxYalOb7ACh/7hwtMuw9db62+jEDknHgX6DVAg97iwS2yXg13qXu
	+M8JqJ19ktHXFhtVzxwTProQu5r8R4fe8fSJek9nPKVuN0hdOh6skIw6LYuikF1a6FT+o8x5ZTM
	NR5IahvzRyA6MDJs+YcJ/DFOpmzPwiJwBBzf7R3YXKkaPoLPjy4rcRA0B6qVEE
X-Received: by 2002:a17:90b:2749:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39b26304385mr49122061a91.24.1788914233189;
        Tue, 08 Sep 2026 17:37:13 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e4fafsm34284184a91.1.2026.09.08.17.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:12 -0700 (PDT)
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
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 3/9] crash_dump: Disallow writing to dm-crypt configfs during kexec_file_load syscall
Date: Wed,  9 Sep 2026 08:36:45 +0800
Message-ID: <20260909003657.1570544-4-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003657.1570544-1-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_173714_200401_D1E4D8A6 
X-CRM114-Status: GOOD (  16.97  )
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

If writing to the configfs group happens concurrently during
kexec_file_load syscall, it may lead to the following issues,
  - buffer overflow if dm-crypt keys are added after allocation
  - stale total_keys if dm-crypt keys are removed during iteration
  - keys_header will not be freed if config/crash_dm_crypt_key/reuse is
    set true

So hold config_keys_subsys.su_mutex for the entire sequence during the
kexec_file_load syscall to ensure a consistent snapshot. To have serial
access to config/crash_dm_crypt_key/reuse, use the kexec lock as we also
need to access kexec_crash_image serially.

Fixes: 479e58549b0f ("crash_dump: store dm crypt keys in kdump reserved memory")
Suggested-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 kernel/crash_dump_dm_crypt.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index 3a416933979f..580534d43b66 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -7,6 +7,7 @@
 #include <linux/configfs.h>
 #include <linux/module.h>
 #include <linux/sysfs.h>
+#include "kexec_internal.h"
 
 #define KEY_NUM_MAX 128	/* maximum dm crypt keys */
 #define KEY_SIZE_MAX 256	/* maximum dm crypt key size */
@@ -306,14 +307,20 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
 	bool val;
 	int r;
 
+	if (!kexec_trylock()) {
+		pr_warn("Failed to acquire the kexec lock\n");
+		return -EBUSY;
+	}
+
+	r = -EINVAL;
 	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
 		kexec_dprintk(
 			"dm-crypt keys haven't be saved to crash-reserved memory\n");
-		return -EINVAL;
+		goto unlock;
 	}
 
 	if (kstrtobool(page, &val) || !val)
-		return -EINVAL;
+		goto unlock;
 
 	if (is_dm_key_reused) {
 		pr_info("Already got dm-crypt keys, please continue with kexec_file_load syscall\n");
@@ -321,12 +328,15 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
 		r = get_keys_from_kdump_reserved_memory();
 		if (r) {
 			pr_warn("Failed to get dm-crypt keys from reserved memory\n");
-			return r;
+			goto unlock;
 		}
 		is_dm_key_reused = true;
 	}
 
-	return count;
+	r = count;
+unlock:
+	kexec_unlock();
+	return r;
 }
 
 CONFIGFS_ATTR(config_keys_, reuse);
@@ -443,15 +453,17 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 	int r = 0;
 
 	if (!is_dm_key_reused) {
+		mutex_lock(&config_keys_subsys.su_mutex);
+
 		if (key_count <= 0) {
 			kexec_dprintk("No dm-crypt keys\n");
 			r = 0;
-			goto out;
+			goto unlock;
 		}
 
 		r = build_keys_header();
 		if (r)
-			goto out;
+			goto unlock;
 	}
 
 	/*
@@ -478,6 +490,9 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 		"Loaded dm crypt keys to kexec_buffer bufsz=0x%lx memsz=0x%lx\n",
 		kbuf.bufsz, kbuf.memsz);
 
+unlock:
+	mutex_unlock(&config_keys_subsys.su_mutex);
+
 out:
 	is_dm_key_reused = false;
 	return r;
-- 
2.55.0


