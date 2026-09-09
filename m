Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0471FC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3DIfLClOscXDd9KVxJaaVjKVKAOJFDQ3rKOe0P9cdo=; b=www6asi/PVQ5q2+NUdszZ0A5f5
	SwuuKLjLIdsq3DOmBpV6AsGI70KJPC2peYFgxzUw4MU+CBx3fLGoLBnIbi+hwU08GGKHRSGcFjcv0
	kYSnSFy84zRMK8ZAyKxmNwI/0hTmaPi4nZQiUXRlbmpD3E/pnUFD80q7rVelXtizql9aOHDmpbY6G
	LQQ1PjOjMLA1MN0phNluK3kTZ25Zd+Gdg4znChG4RUEsJS6VsAWDZI+17UKnkAfGdPqqO1BQGOjRs
	4qYgFaqEjDdJooF4k1V3gwvAIP2mGAo/b8kdTr7u36XeRa950QNe3UMIeoR0rogS0xI+4bI2AIT6v
	0rhU3/HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46JY-0000000AVPJ-1ngY;
	Wed, 09 Sep 2026 00:37:24 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46JS-0000000AVKd-0CbW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 00:37:19 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-8623e5d435cso439966b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 17:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914237; x=1789519037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3DIfLClOscXDd9KVxJaaVjKVKAOJFDQ3rKOe0P9cdo=;
        b=RA4yQQ515IbNgSbVm4c+8GRQadQxcUByYIqLW8AZcTLGlWbS2JkiirC6/1T12sUVIA
         frihAHfAFhEO6MUX4SVR56gI9xJh9eUCA559IS0KgkXGUISzfk4aYAAtPPeA41Q7HQ6K
         coD19zmxjD5vUOziyOkfbbsXiAgEcpX3LcGGP00PCSmPfZ3OBhJtwr2plm/Tgb/hu55K
         Qmn1Vv2sJCOeFHffhKYdIg42NhxqG1eO6YCgEYsqxHL9LeMVy/tNucAwztqZoPDXftd+
         iLUVel4NLlHOdK58/gUgeYTqNsYBJVOwUhcrOsuObbz1x0tnIVIsfgchp4OwxHjU5u/t
         angA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914237; x=1789519037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z3DIfLClOscXDd9KVxJaaVjKVKAOJFDQ3rKOe0P9cdo=;
        b=fgGIkT3cqVyKGH1qM+xWEpvBgBJpZaSY/3hVMNx75eFUN8ZRNJVFVAV2Y2zf5znkaE
         vCRox4kMeILLePlhev7ppBq/5vqNQRYvtLWD58LQi+cILVlJIfyvp93KsX0TtNgOQdwd
         L54BXBpplbhLdzK2OJ1Ak0dalBy5Y3Fiv7ywI1CbkoRzD047tOjL6izRAbOKE1/4LnKR
         kZ6Quu0gLbyjOcKinPACOIUk2pdu1eJhuYTbC7UdzBU63+8sshLbRbzlzB+rfMCUsdCq
         XAPZp5sRn1KA3agfsptSe12lkGfTGDQjGCBgdYTfXrBBnypZCZmpmF9qSJa09Pokxaod
         Z41Q==
X-Forwarded-Encrypted: i=1; AKwUvBy0DqDOve1b/N/QZK3fkjO87QTtOhKgFqBXvatLailBj7MWGHQ2b862Cd2sv+PKfLFHUlydopXUhBEcqodmHJbD@lists.infradead.org
X-Gm-Message-State: AFuF++lNjgr9LrBmAHBkvq6k7jcQ4rulNfscc57mMMAoXMUxeYQbBa3T
	LlKusnYWLnPchEtGL8wdQ6vF0xch+uwK7/AYEDK/875PqZqL4HDZHOTq
X-Gm-Gg: AYBFou1kSu7a0gJ66xLqY0raAdsbDlkAwBhAE/+R30zyTKgmdzqjf+CJCsuGLHx/h8n
	gjNTiDR2HUOkiR+gWYMRSrOGpPQ1i54EDloD4lBvviYFemI5Dy7fFfNwexIc/K7SsmXrAjmtvcy
	LgWNO1LRIh1qPiFoRzBW0hqu+0tb5YW8UlPDEmcuP3OGZ3jA8vXY6gwkUZDyQqPepUi+DAadT+I
	QS5yD4WLDZLViQcHW006qDqtstAXqwMoYVhAy1D/UH/1vl2SBRROzUVWN1cx83sjl2AOKPj4Bkv
	xx4JvPl9cEJy7ckTpiskokmnMqoFzI8cju9gK5DMhzQKQXHfcKZJDFRNa6CDecdxp6PGaF3LD9E
	iv983iiQ3eHPloJ7iK9jpOwsiMptik2bWNJbFj9xpT5PD4509N0Wf2wp1qSNg3Iso/GgXzqGImv
	1cyRfO7dbwpmavMAvfZRhX7WRDFC63FudWdMm1G0C9ERLFJFpUfle5QWec7hqY
X-Received: by 2002:a05:6a21:710b:b0:3bf:b9de:8557 with SMTP id adf61e73a8af0-3da9d98d1bamr9827360637.9.1788914236936;
        Tue, 08 Sep 2026 17:37:16 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc46da5acabsm4326371a12.8.2026.09.08.17.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:16 -0700 (PDT)
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
Subject: [PATCH v5 4/9] crash_dump: Free temporary dm-crypt keys_header buffer in kdump kernel
Date: Wed,  9 Sep 2026 08:36:46 +0800
Message-ID: <20260909003657.1570544-5-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003657.1570544-1-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_173718_136182_250D4079 
X-CRM114-Status: GOOD (  10.81  )
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

Although we expect the system to reboot immediately after vmcore dumping
is finished, it's still good to free the temporary keys_header buffer.

Fixes: 62f17d9df692 ("crash_dump: retrieve dm crypt keys in kdump kernel")
Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 kernel/crash_dump_dm_crypt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index 580534d43b66..ff6055a97a4b 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -118,6 +118,7 @@ static int get_keys_from_kdump_reserved_memory(void)
 
 static int restore_dm_crypt_keys_to_thread_keyring(void)
 {
+	struct keys_header *keys_header __free(kfree_sensitive) = NULL;
 	struct dm_crypt_key *key;
 	size_t keys_header_size;
 	key_ref_t keyring_ref;
-- 
2.55.0


