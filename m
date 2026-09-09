Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53035C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PHLyrOgPUSLsTNtUF28QqgZ2J17TC9aeZzxCirbE9U=; b=KWDtYlKbSrH0hZFb+exYL+4W/Z
	eFM2jP/4F+xSOZPKXHN277ZQf8xUVInzBpjkYOrTEyY3VhPUAYE8j1CHIX2M6UbR1foAZD93/mfkE
	lKsTh9vUn9AZpc6IeVo/SNnlpQcl/MI44uqIMx8ErBbe+bpEsqjysstrcpw8EE8cWkkPuUDBWhYCd
	oVwbMhSwyjlYQtY+B9dqPUt7EwNzZXQXT0FoPahOJ9/qMxhxleWgEHxMsJAIqGRHmhao12xR5KFbs
	crRd3Zs38CPZX6IX3eaxNtRvrtuwqt2ZpcxkpKEkY4MjelR5xco5v5P0iKBF4KV6vDm3/puTIbC5h
	lWNVxhjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46JM-0000000AVFl-2rrl;
	Wed, 09 Sep 2026 00:37:12 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46JJ-0000000AVCd-3Gq7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 00:37:10 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38511175ad3so4452227a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 17:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914229; x=1789519029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PHLyrOgPUSLsTNtUF28QqgZ2J17TC9aeZzxCirbE9U=;
        b=P0BUE44bIBZEgPtRXyfPkQ4TY7oSM90ZuJ14IMhKcDW+WrZHeHnhlZPYkHPWLeF5VJ
         2E0EarCO4XoxNp3dr5SUqu80lb0/lEA9Fl8vb4gN19wyholQFcLdlpzTTmtiMnYD3Zkm
         mdQCLllEJ49Kkag05CAc3ZVypQICbJ0LHZ5/u4QClZFVrE4Bkl1ZT0kE5mSm/JQT3+9R
         bTdXLNmTnjlsAdlg3KbnXIdTCmvgBkIfct6MpqdnB6iBChlWjCtATKwOu746GWjZy4GH
         KfvDFXaIuWFZkybt5xfEmwczNk4O+P1/YqinRG08skAroQIcDB63jzRWC74Hweel3PkG
         2cqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914229; x=1789519029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PHLyrOgPUSLsTNtUF28QqgZ2J17TC9aeZzxCirbE9U=;
        b=mlJafAwullypsB9Q/w9m9CG9JZmvYOMsksJ/LVQ9yLzm0GKr01TX+wE6qOClkqWU8A
         AgDzU9/aq0EiILwcN7/bSnLxilts1SwsaNAMObDkfdeHcjlsTqt7r1UPr2Xa0DFCMesY
         IZvOByaXFD6+/PvoRY5Ibem7O1vKFNuqeApm+pzqt8siotKYfGwt/fQ1LVxFT2kZuhmI
         gBZVjUodTUeVoceF4teHfaN4/HickV2fdXzLIZ+UK55VhdrfH3n28eLPAQB1EwYSblUM
         mkB+/NCSkX8OofB//wx8DerE7ZrhtJ9mAI0YrdnTnT/sQ1KkMrab6qY/RCNBCp+cKEfq
         USPQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7CUVxCUaHLzTy3bqi5nN7afHz5V4Qg+fRwB9P1c3YZNkN5FQY+g7w4eOCsHgMyoKzxkR5SiEaRXZ3HcHQtP+4@lists.infradead.org
X-Gm-Message-State: AFuF++kw4AXlwyj/+j6h6LfAnhjJAjHvCG+O+t1D6yHI5/tuIu5nS3nY
	mTkBFaZ5ggGekXYw9nlqbS9oioKShHbuALptn5ogSbbJ5+rsTh4yBC5V
X-Gm-Gg: AYBFou1QPNvh5DtDe5pVgDhic/QQ626QAv9zw29Vhpc8j28wdOCyX4lvuqXGvSX5bYb
	PaCd7ewvGDqvOuxapcTteDrCEbkV48BcxW5BEsFN9vTjU472JC6SxsZ3Tx5c+eeUSYBX+bqfjdA
	HA4wOH5bXGLjTc+PU+mIVKEtiAjZFAtces/j7yuVFFc6iopzZPgLJU8BalhCRRH0ilCQuKRLAuN
	sR53WXCr+uP4QDasXSZMS2xBg/hw600kLTX0VT5EpAQFxhATm5IpH+HcPt/dH/sgZ+EYO8tAXFY
	E7ioXFSLkepie3KjtrZ6oo2cPcmqc7qkFUAvHdP3bRDP3AsIbg2uOmIqCGtCmPejckqEqAwsCIg
	besE+5FxY+UAId1nw/ukXaUxE5g3dyv6d/TbS4WAlLB1HtviKyCiHB1ptiSBRJi+ywT2ZGt5Q1q
	53fQ8wOHxi4unPBKthXR2ymhCQqBoQPuRbtQyiDv+xQHMBE8I5zxz1uZbCta7H
X-Received: by 2002:a17:90b:2542:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39b26101402mr44510446a91.5.1788914228871;
        Tue, 08 Sep 2026 17:37:08 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd15asm28871165a91.4.2026.09.08.17.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:08 -0700 (PDT)
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
Subject: [PATCH v5 2/9] crash_dump: Read the number of dm-crypt keys from reserved memory
Date: Wed,  9 Sep 2026 08:36:44 +0800
Message-ID: <20260909003657.1570544-3-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003657.1570544-1-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_173709_837389_33E27EBC 
X-CRM114-Status: GOOD (  15.00  )
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

In case user adds/deletes the keys by mistake, it's safer to read the
number of keys from reserved memory.

Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
Reported-and-Suggested-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 kernel/crash_dump_dm_crypt.c | 37 +++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index f638fb4b8554..3a416933979f 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -88,21 +88,31 @@ static int get_keys_from_kdump_reserved_memory(void)
 {
 	struct keys_header *keys_header_loaded;
 	size_t keys_header_size;
-
-	keys_header_size = get_keys_header_size(key_count);
-	keys_header = kzalloc(keys_header_size, GFP_KERNEL);
-	if (!keys_header)
-		return -ENOMEM;
+	int r = 0;
 
 	arch_kexec_unprotect_crashkres();
 	keys_header_loaded = kmap_local_page(pfn_to_page(
 		kexec_crash_image->dm_crypt_keys_addr >> PAGE_SHIFT));
 
+	if (keys_header_loaded->total_keys <= 0 ||
+	    keys_header_loaded->total_keys > KEY_NUM_MAX) {
+		pr_warn("keys_header saved to reserved memory may be corrupt\n");
+		r = -EINVAL;
+		goto kunmap;
+	}
+
+	keys_header_size = get_keys_header_size(keys_header_loaded->total_keys);
+	keys_header = kzalloc(keys_header_size, GFP_KERNEL);
+	if (!keys_header) {
+		r = -ENOMEM;
+		goto kunmap;
+	}
+
 	memcpy(keys_header, keys_header_loaded, keys_header_size);
+kunmap:
 	kunmap_local(keys_header_loaded);
 	arch_kexec_protect_crashkres();
-
-	return 0;
+	return r;
 }
 
 static int restore_dm_crypt_keys_to_thread_keyring(void)
@@ -432,12 +442,13 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 	};
 	int r = 0;
 
-	if (key_count <= 0) {
-		kexec_dprintk("No dm-crypt keys\n");
-		return 0;
-	}
-
 	if (!is_dm_key_reused) {
+		if (key_count <= 0) {
+			kexec_dprintk("No dm-crypt keys\n");
+			r = 0;
+			goto out;
+		}
+
 		r = build_keys_header();
 		if (r)
 			goto out;
@@ -450,7 +461,7 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 	 * ARM64
 	 */
 	kbuf.buffer = keys_header;
-	kbuf.bufsz = get_keys_header_size(key_count);
+	kbuf.bufsz = get_keys_header_size(keys_header->total_keys);
 
 	kbuf.memsz = kbuf.bufsz;
 	kbuf.buf_align = ELF_CORE_HEADER_ALIGN;
-- 
2.55.0


