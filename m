Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7C4C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/nSpHth++g/gUUsEL3F+NUVCLcirmCqvO6RY3lCswg=; b=dERz1cqf9Do+K7V7G33M/JATuL
	MBuqicyV/c8c5OoeQpEoeGP7D/IfDK1z4+ngW0Z4XoRiQDyJ5EY3GQWRhYqVE9HW78UvigohsBXHo
	YIjGyJZQ1KZh/KwrvSv4VnSU7Ey++l8rRjpVhQr+Z0SPLI5Me6CnYfQqKNCZrYSt1qQPgNmteokhd
	RgR7dcBIapgG7vkIWdtDQvFwW6WvQN+eNf/iU4IyB7FFDL/f7UrxoV89WWTQA6eYjPwo/7CeXgoec
	HWbWfekt91rPUKFb2hP1RVUfGEtGUpiIb4WYmRfuYqtXunhl5OGjSItFzghu1WIRUdJGcwyLvy7rp
	TgVLGE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46Jd-0000000AVTx-1DnH;
	Wed, 09 Sep 2026 00:37:29 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46Ja-0000000AVR9-3YnK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 00:37:27 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1ceb47d55so345080a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 17:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914246; x=1789519046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/nSpHth++g/gUUsEL3F+NUVCLcirmCqvO6RY3lCswg=;
        b=olDw4AIZqHEaFPbmvaaAriW/ZS5bcHa7QxKEW5pyVIr6ulQas36pxoCHVovmLpflTt
         1YXr1uSyYT9fYzJkE+DVyfjwkyN/YeiCnlYKgOemDj/RFOeWNl47a9nzDEBka0sqd2hC
         lvlfbL8V/+FkafpssCODBWYzvNZIlySzYM0ehJSwdmlwyIA0dw2ofQVG6CMzR9CKxtw1
         XFiKChDYGr70mP123hqQfMr1hheYJJXCq3kGbkY8D9WCdCdc4jKaRWaU/iEdiu1WN5nl
         kvla/AVddfWVypRyG2olkArbxO6aC8Xvo99NSyW4Exo7BbQ5Yu2uCehGsPJ7jcb4kLGb
         fxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914246; x=1789519046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E/nSpHth++g/gUUsEL3F+NUVCLcirmCqvO6RY3lCswg=;
        b=UjUp7akRrNRoR9v9nDymcOS83xW1RqaBiYQvKcnoVYBndsrqQw+eo4/uOwIkoLbAr9
         vFYolgRbhZswXMJgMpuN9Ao9l6mimHfbZPfprGjzthT7EHEQO66240AngUENHBWzt04Q
         E0tOoRiyYzblK90x4P6FJBNbwl+dttbWaNgh+BIMFEE8GM0OJ8t/vHyaPa4h/FMb4UiR
         Os2C1BluYKzDi1C5gzUaApy5sDyK1LxmaUsUISt3rgvbtvBsh7XFIch2q8n/+72ckSel
         c24FQATpTjD2GWWfUXb4J8bZs05MbJYwd3P9iZ9VZPwZOdMABvAGrOPUk1HtlsBCF4EI
         oaNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaB8p0106TVKjnI7sJ6n9jGfUikUBTn9x9GcHG1FiDKsymrikhB23K6v1CtXL5UOENs0pmSc+FBj8bI4fo/9kv@lists.infradead.org
X-Gm-Message-State: AFuF++la4ZOQIhrshyummwHdIO1Mm3/fZGI3V1Dn+t9QVMR0voYtOPQe
	15/KyH9fNs4NXczvyI5LOoUTjMbO6lGyCkfiXpFjS68h79Q0k5s5HmlU
X-Gm-Gg: AYBFou2csBDK203x6sJbbL1Wui1QS6qw5Iv5pmdqsClaZs1Sdgc0eN0Q2isNc+y5K8D
	Za4C4Ntg8+DfmYPmjkNNckUzmw1t/nqvTs6fSP73ZfFBH1RS+WKcebRGvJsRsxTVdt8k3K60Wt2
	QTicHYA41ixe7PoTtj4WT+N3fOA9fXA0YbFFYWhLBhY4UZpXsCVM3OphcLLcMxiDDVjAsnbhwAb
	7Z274OHTMh+v5qvC4vHs6/Yl8uonYfSm1QKGam/A687OYFpD2JZkkhGSBasXInyVVJcNIKivJ9S
	Bci1DHsXGJt5Ku4lluozBmzwZG0QSD6qSxE+vQAL+uSUtHxJy/mrStJz2r9nXeDH5SolHChEvs7
	AFfTaWjOwicwagnEfjMAueufXfmA8e+6imyfAcSbgB/4z94uAb42qsfZ9LDLeostx3P8Xrkv1B9
	Sf0+u7S+4w0eanTkQipvdJ/B3VPhzXiXlsMPyezx2kUZEKa//nfrIeC2ShgMUZ
X-Received: by 2002:a17:90b:184b:b0:398:c6e8:3fc2 with SMTP id 98e67ed59e1d1-39b8bd03b29mr8739873a91.4.1788914246185;
        Tue, 08 Sep 2026 17:37:26 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm40660284a91.14.2026.09.08.17.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:25 -0700 (PDT)
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
Subject: [PATCH v5 6/9] crash_dump: Improve readability of config_keys_restore_store
Date: Wed,  9 Sep 2026 08:36:48 +0800
Message-ID: <20260909003657.1570544-7-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003657.1570544-1-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_173726_930767_34174AB0 
X-CRM114-Status: GOOD (  14.52  )
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

config_keys_restore_store currently doesn't validate the user input
before restoring dm-crypt keys. Although it's not necessary for the case
of vmcore dumping, it's better to do it for the sake of consistency and
code readability. Also check the return code of
restore_dm_crypt_keys_to_thread_keyring.

Fixes: 62f17d9df692 ("crash_dump: retrieve dm crypt keys in kdump kernel")
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 kernel/crash_dump_dm_crypt.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index 9ad50ac54866..b8fe630462cf 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -371,13 +371,25 @@ static ssize_t config_keys_restore_show(struct config_item *item, char *page)
 static ssize_t config_keys_restore_store(struct config_item *item,
 					  const char *page, size_t count)
 {
-	if (!restore)
-		restore_dm_crypt_keys_to_thread_keyring();
+	bool val;
+	int r;
 
-	if (kstrtobool(page, &restore))
+	if (kstrtobool(page, &val))
 		return -EINVAL;
 
-	return count;
+	if (val) {
+		if (restore) {
+			pr_warn("dm-crypt keys already restored!\n");
+			return count;
+		}
+		r = restore_dm_crypt_keys_to_thread_keyring();
+		if (!r) {
+			restore = true;
+			r = count;
+		}
+	}
+
+	return r;
 }
 
 CONFIGFS_ATTR(config_keys_, restore);
-- 
2.55.0


