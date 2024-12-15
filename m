Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF71E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 20:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YwBupfT+fyxXmEmly7oBmZ1BClZCHwQUt9Ls+vVmCiA=; b=Q6Ve1Ehhl9JSLOXaTmlpoOFWBz
	Y9Kj9GFdNpxa6MDHQWVw32lxESAuFsWKUIXPTYvFlLF2tI7S4NU90ZO4E/o4W8a+Ki7vHaMZirHRK
	4EluRQzJHp20FHE9WlJW5Yc2bCfWJqvx+DwinjgPx9Ipl0tAT1lSiCMNZ13hD6p+m3BV6Pgp2L2Ma
	JoCWiQHcB6zqhQOZlEcBXxITWQQ/ce29TfQHntTj5P3wOm4IfM+BxiTECtPP6r6Rrdyryrk5o9GAW
	Adl/sZT0yFmNXEQeJ2jIz3UQdSCiCxIC97j44HQw1YHSr4x+jnYRTpQF/UDlhQa6a507/C9GyLQXG
	oKo89xWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMurn-00000008P31-2aTM;
	Sun, 15 Dec 2024 20:05:27 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMuqh-00000008Oxe-08EW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 20:04:20 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43610eba55bso29873015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Dec 2024 12:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734293056; x=1734897856; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YwBupfT+fyxXmEmly7oBmZ1BClZCHwQUt9Ls+vVmCiA=;
        b=jdRAdxmv23YtzHnl2RE9+0MioL7SeucstCzznDeipbJQjBYtp0TctKqR0gH1+A3tmL
         qLW1MUGCmo/skzLmw/VG0lG6AMIu35EVAyfuphJDknPQTBVEikjfC7JVYP5YHCgRJIp1
         cER55vANHCouYNDQwIOeExY26SSzkiDceqygw7VSUoKSJPQ52c9Q2eiWKSf4RVNSYzrF
         cbBP8hcYLwl1RTdMvT/tQ/UsXJDXjJSdXTatNww9C4bnIfhxnEobq1FVC/DrmYKx3M3D
         rmAp2khhDw67HzWx/zd/YJ5jKT0qkWCSI7OopogtMdSl+r4PwzPSA21D2d5Gf2FN181n
         GZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734293056; x=1734897856;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwBupfT+fyxXmEmly7oBmZ1BClZCHwQUt9Ls+vVmCiA=;
        b=EkCgMjlond3druSadC29JuinQtY+0K46j1UWnAJi+Dd0Uy2h1c79x5mtelR/gZMqW9
         JbdX0hvCec9CneHc9D34275pKvUaSoToLN3c9u0mZ6LEP2wU1vpv4qTaMWgMJQwO3JM6
         Imjf6gTeRiQVL1IKMq37o1a7y0gXENStNck8c0FOyLqS9jQ+SiE8JjdhEGcxRNda5e4q
         ulBWdu4PaoRQqpdQJMCQ0mP4OJS/jtp/6MmEYLHA88RwuLYzjofrWNLyeUCu9Q0dcN23
         aUS3Gy5fepgC5r18D/aKQx0Yg1R2Zc3uJH65bQC3jEf/vq/MB3t3jLyACzDBVBOnrKFn
         /znw==
X-Forwarded-Encrypted: i=1; AJvYcCW5EnUnHlyQ7R5JP9ewkVA7stCCZg+7pmMK2MoNrJB0Eikja77619cO7jrVhS6+F7OO1jUsqg5f+yXEnysIh8T/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7tmayVXhhOMMTgigrjF/+JHqX1hSBsNOPUD9yyoo+BtVEZMeW
	w+ljyGA2o7+xP1KHOqN+7KjTVlArfKtsH7tw0ViTlrwDlqJ68XR3Pki1xvSRiPfG3d8TnHnddsA
	4la3MLDhaGQ==
X-Google-Smtp-Source: AGHT+IFZBtol4MC3NA/MQiwAphEXkZPoxFlwPmucl0GZUYpBLZ8Bn8rpWMLd0hZKVOn4cpUk5W+HN7MQj3EJUQ==
X-Received: from wmaz22.prod.google.com ([2002:a05:600c:6d96:b0:434:f173:a51])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e87:b0:432:cbe5:4f09 with SMTP id 5b1f17b1804b1-4362aa113f1mr83361525e9.4.1734293056465;
 Sun, 15 Dec 2024 12:04:16 -0800 (PST)
Date: Sun, 15 Dec 2024 20:04:11 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241215200412.561400-1-smostafa@google.com>
Subject: [PATCH] iommu/io-pgtable-arm: Fix cfg reading in arm_lpae_concat_mandatory()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_120419_089899_33907292 
X-CRM114-Status: GOOD (  12.98  )
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

I messed up the newly introduced function arm_lpae_concat_mandatory()
where ias/oas are read from the io_pgtable_cfg copy in arm_lpae_io_pgtable.

However, this copy is set later in alloc_io_pgtable_ops() after alloc()
function was called.

I didn=E2=80=99t catch that with my selftesting as arm_lpae_io_pgtable is
allocated from kmalloc, which was caching old configs.

While at it, fix a couple of spaces.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.=
c
index c1b62c7d81ba..7e53ee51270b 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -232,12 +232,13 @@ static inline int arm_lpae_max_entries(int i, struct =
arm_lpae_io_pgtable *data)
  *   c) 42 bits PA size with 4K: use level 1 instead of level 0 (8 tables =
for ias =3D oas)
  *   d) 48 bits PA size with 16K: use level 1 instead of level 0 (2 tables=
 for ias =3D oas)
  */
-static inline bool arm_lpae_concat_mandatory(struct arm_lpae_io_pgtable *d=
ata)
+static inline bool arm_lpae_concat_mandatory(struct io_pgtable_cfg *cfg,
+					     struct arm_lpae_io_pgtable *data)
 {
-	unsigned int ias =3D data->iop.cfg.ias;
-	unsigned int oas =3D data->iop.cfg.oas;
+	unsigned int ias =3D cfg->ias;
+	unsigned int oas =3D cfg->oas;
=20
-	/* Covers 1  and 2.d */
+	/* Covers 1 and 2.d */
 	if ((ARM_LPAE_GRANULE(data) =3D=3D SZ_16K) && (data->start_level =3D=3D 0=
))
 		return (oas =3D=3D 48) || (ias =3D=3D 48);
=20
@@ -1033,7 +1034,7 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *c=
fg, void *cookie)
 	if (!data)
 		return NULL;
=20
-	if (arm_lpae_concat_mandatory(data))  {
+	if (arm_lpae_concat_mandatory(cfg, data)) {
 		if (WARN_ON((ARM_LPAE_PGD_SIZE(data) / sizeof(arm_lpae_iopte)) >
 			    ARM_LPAE_S2_MAX_CONCAT_PAGES))
 			return NULL;
--=20
2.47.1.613.gc27f4b7a9f-goog


