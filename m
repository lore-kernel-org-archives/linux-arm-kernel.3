Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477A2C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++us62bnNsUPvWVqDmA/JgoyZsHakSa60fnEd2AY7KE=; b=Qia9LwZZqnTpN6vniMgQNPMjG9
	QThhUTTmQzwzmEqwl2kgM3u3dPxclyd2EWrmIAl3FIS2H2DzVT8zhCVE/EHPOM6va993pNIVCRoIo
	6cy332PMhXd82tmwOw2jjmmP3hYYeSpWlfAysgUbdmQRk4VZU0see+a2Z75rOakrzgII/0qMW8ESW
	qcGVAUdqzdHLgIQU4kyA87hUeJ36K7ezBSlezR+DUWe2wP83rIrYc2A0+KmYHCb8GFC0W2gqAK6fC
	q04Zxw09yulV9I2U1hDd/qC0GBh3FpRMT7p5W6RNBXRO5qvlTMMv2EtN5pN5vTBjjtA2iSvaLLEte
	R2NZV8RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46Jr-0000000AVia-0IDt;
	Wed, 09 Sep 2026 00:37:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46Jq-0000000AVgz-0Pem
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 00:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=++us62bnNsUPvWVqDmA/JgoyZsHakSa60fnEd2AY7KE=; b=YLgt3/pKFTuk49KQsZSH6AtMJF
	m7o52gDpt2pjGFoujxoIcOc8pWdXiEOb4DreRvWKms/oVcwCtNrr5eocsD0A3c42tgYjuPq2+XRLr
	VO5eWZlIGoimBjIkf2wEw+yWDZxJ0Sbqqrp3gIdESHstJ3yj14u9Ium7IoS31W5LJ9Cce37OvmY8s
	tGa3dKQwBScPQ4YBdid5kdAO+4AllU8CKMyxONexSgfxstD22xmD7pk5w5Uo0t2IvUwZPW9FEmQap
	yvtx22Bia7GfLKdVfyKEqXqhyxzW5CvKU8sVMD3Lk6kGKEfESZDnYXrELz+9FZWR8yomkfoe8uP5e
	i2VmVmDw==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x46JY-00000000YJS-0AOH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 00:37:35 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2dcff8f44f2so863185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 17:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914242; x=1789519042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++us62bnNsUPvWVqDmA/JgoyZsHakSa60fnEd2AY7KE=;
        b=AVBh+oO/pBZcw1KMRSPeRCcNo+VUVyGQCyFMN+n9R25mjjMoKiEi2ZYvBcYRvFSoK3
         Q2de0El/nr6vGOeIesTA7BkDzjP+Jc0LOpZsEz9TGGbmT1CDYV1q4MP2Og7VgxPHMGK5
         ql02qAILIaL7Z0ZLI3kTY+5lss8jaTW4g+Vuc/4NdxFIcwRuoQLulDlexYko52djCm1q
         EQQGJ1f8F299dz3Bi6ubVERERBOERU/04xUzov4FW2cEMvpAHsd5nusqeH6SIXSJY76X
         pHz0f8myDHYvxt0c6qeGd7FdgPFEDwWuze4G+Ptx0qv8TReP1e8JmfLfAK/zD72AfXkt
         iC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914242; x=1789519042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=++us62bnNsUPvWVqDmA/JgoyZsHakSa60fnEd2AY7KE=;
        b=SE14ptiNZibQSZmgl1TWLC770O4TPxhQIqZt9NzbFB/NIOUsCeP2LdC2aosqDvjShy
         oo0fZpCyU0ynN8jqHwPlYNgrfp7tSb6KmVKz2IPwpYIEM1/NWCpLhXhxjMU6pnaXNLSX
         8DhC8O8l3s9DLdk9PLl5K4GcK96PRoMYGaTP0nVPHhayUSUAyb+gDgOSBtNS0w4v9WBO
         cmeJiZBg/hoDzRavZxSwF99GUGxjzFWgAekaB2+df1rKJ6ebgeETMBiQjSg5LFKdF/zF
         OL/Wxmi19QXoNjwqhqMCcoNc4gxnzwm0IodKcjl3l4fzq2o7UoCEusjUOfWvOebWdRyt
         eadQ==
X-Forwarded-Encrypted: i=1; AKwUvBysP4dblvdRFBZzJ8+eEsHr9PwWK7itTHpuJejpwBReQapJSZXKozjuQ1Ghooz6xGoeTsSPhIrxhoSXgthvREt3@lists.infradead.org
X-Gm-Message-State: AFuF++mk1evliUwrcRJ+ju37ciM71JMzhNhfIGAJ/U9Y401qE9QprStT
	sbz/b/dyx1ELVEey61Rn52zxmAQJUBkwunhSZp6l2pcspu2EojCmawrp
X-Gm-Gg: AYBFou0kRLCgfmkywzSXHQdup49iy9BMReIN4z2FWkRIEoXhNRek7uwgWaEh2n3Ntak
	r9yZ2OqbnKcIadPQr7d6l/v09LORiXqJzzwaHYiaQAZF6NleVwAFnOKWUL+LukULci0Ql7BoZyz
	is5vPO/0bnf1haehdskEjFQNKD+52+nAhiJy2WIqr7s5gvAoUB3vKJBZte74snsl0YkBKLhMyuS
	YowT/AMskCLWSXhFzEIkQebaOfwk3gLOnyaBCcoaU3yoaihCY3W2IxY0DXi43EuvRWQQTZ0yOBg
	8BnCQty4CmUdC6HMsRIgr6sZSzv63h5s4JnibMgWa6XatlKbtTrN/lYRniAiTQFW/pEsBQPVqTE
	CPXB0w3Jp2iU8nxAq+c4IppBFLiA6u7SOE3OOz178itacZWIJOVWqlYfiUJ143vfro1jR7Jm+kS
	6mkFNsLZhZFwMSHtrFZ1MV26oOAXTzcQTEwGM2D45GOSxQU33d112eI5g8vEOZu0pchQywYSU=
X-Received: by 2002:a17:903:2b0d:b0:2d9:1dee:43db with SMTP id d9443c01a7336-2db1284b6dfmr457504295ad.15.1788914241741;
        Tue, 08 Sep 2026 17:37:21 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm62627875ad.82.2026.09.08.17.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:21 -0700 (PDT)
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
Subject: [PATCH v5 5/9] crash_dump: Only use kexec_dprintk during the kexec_file_load syscall
Date: Wed,  9 Sep 2026 08:36:47 +0800
Message-ID: <20260909003657.1570544-6-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003657.1570544-1-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_013726_495151_1C4053E2 
X-CRM114-Status: GOOD (  14.09  )
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

kexec_dprintk will only be activated by "kexec -d" during
kexec_file_load syscall. So use pr_* outside of this syscall.

Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
Fixes: 62f17d9df692 ("crash_dump: retrieve dm crypt keys in kdump kernel")
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 kernel/crash_dump_dm_crypt.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index ff6055a97a4b..9ad50ac54866 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -76,10 +76,10 @@ static int add_key_to_keyring(struct dm_crypt_key *dm_key,
 	if (!IS_ERR(key_ref)) {
 		r = key_ref_to_ptr(key_ref)->serial;
 		key_ref_put(key_ref);
-		kexec_dprintk("Success adding key %s", dm_key->key_desc);
+		pr_debug("Success adding key %s\n", dm_key->key_desc);
 	} else {
 		r = PTR_ERR(key_ref);
-		kexec_dprintk("Error when adding key");
+		pr_warn("Error when adding key, ret=%d\n", r);
 	}
 
 	return r;
@@ -129,19 +129,19 @@ static int restore_dm_crypt_keys_to_thread_keyring(void)
 	keyring_ref =
 		lookup_user_key(KEY_SPEC_USER_KEYRING, 0x01, KEY_NEED_WRITE);
 	if (IS_ERR(keyring_ref)) {
-		kexec_dprintk("Failed to get the user keyring\n");
+		pr_warn("Failed to get the user keyring\n");
 		return PTR_ERR(keyring_ref);
 	}
 
 	addr = dm_crypt_keys_addr;
 	dm_crypt_keys_read((char *)&key_count, sizeof(key_count), &addr);
 	if (key_count > KEY_NUM_MAX) {
-		kexec_dprintk("Failed to read the number of dm-crypt keys\n");
+		pr_warn("Failed to read the number of dm-crypt keys\n");
 		ret = -1;
 		goto out;
 	}
 
-	kexec_dprintk("There are %u keys\n", key_count);
+	pr_debug("There are %u keys\n", key_count);
 	addr = dm_crypt_keys_addr;
 
 	keys_header_size = get_keys_header_size(key_count);
@@ -155,7 +155,7 @@ static int restore_dm_crypt_keys_to_thread_keyring(void)
 
 	for (int i = 0; i < keys_header->total_keys; i++) {
 		key = &keys_header->keys[i];
-		kexec_dprintk("Get key (size=%u)\n", key->key_size);
+		pr_debug("Get key (size=%u)\n", key->key_size);
 		add_key_to_keyring(key, keyring_ref);
 	}
 
@@ -315,8 +315,7 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
 
 	r = -EINVAL;
 	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
-		kexec_dprintk(
-			"dm-crypt keys haven't be saved to crash-reserved memory\n");
+		pr_debug("dm-crypt keys haven't be saved to crash-reserved memory\n");
 		goto unlock;
 	}
 
-- 
2.55.0


