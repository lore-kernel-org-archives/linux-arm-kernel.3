Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053F3C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 23:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yfADMu2KMEVkqXjLqt2cOsbz+PXBarm0PZCvaHp/dFA=; b=noRiSzILS7G8tBuqenvl7y8GUx
	xrKfUrt3OW/J4zs+DiTWjQ8O6yGHnQugG5E0u5tdDaSt9q8iuyX9O+3jeu54ROfKbgSN3DYznbHNK
	YRqQ7hC0EmswNa613uE9DxdN7r6Mrngt8QRuJpOejBAvh9ri5240rLazPZJpFLu8MjbrUPSoGScdK
	jpwMb8QlYXXljbnRmEil8bzDlL+iDAyvxyuSb/k8mjbKir01EVUDyLT8eN0xNrJ/0lGH7pFq029XM
	mWgQWRryKXL4IGZg+cdZNuIN/tPh0a9XRFIjvKSOFehg/98Tx0rnKaz/slCiyRykb7u6zTOszJCmq
	7c47arYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxZ8S-0000000EAvf-1glO;
	Fri, 21 Aug 2026 23:58:56 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxZ8P-0000000EAvK-1sMK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 23:58:54 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2d560775ca2so13529275ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787356732; x=1787961532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yfADMu2KMEVkqXjLqt2cOsbz+PXBarm0PZCvaHp/dFA=;
        b=RN8sJqLgRkBfRQIRnKkb21tyMXZxDnwDc3wYXgHcOoysTeYQyjZU17yn1LavyVEcs6
         sT8szO+BCgeQJdnWvmfQQNRre+IWfvDcjEt4N8ydtO/O0qsSxwETlretnyqSDJUQwlCU
         MrhpYYkxZKkebTX8bHRtRMdMKo+zasUqe26JY741NTBnROAToqKq8CamitZMmfjDeP/L
         xYeah7/zXDuGZttzrJ2FpF/XNfKrS0y3MiGGpz1R6buXERkaP40crr8ICnQ+N00sShMC
         sGYNi6ei8YBmi5kxsIXP0rQVpaHgXvnLllOVK997HndZf+gGaRY9Y7s27hE7Q2yJlBno
         +0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787356732; x=1787961532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yfADMu2KMEVkqXjLqt2cOsbz+PXBarm0PZCvaHp/dFA=;
        b=i0bFkspPtN4q4hcCgL7sGLKN+MciNDMhi1WqESPil29Gr4S8KXzi+kbgLDhNeAnR/b
         tbkBTIkhestDwxBDYElZEMSf14Z6pzm3wswJwJlPFA4KKBz17O6xDKyqEGotfVUPRLBN
         LxUgi4PZWLi8879FpF7tb6cCjpNoQQ4CAE7+t+hOKZKG6ZtzSGupC8/T442mglPpu4j9
         mT8Wrf2OPyJIDJWWuuqb7KCwtghyazqgLQh+b1ALDjM1nKBtIHc+B59dnUlj5iS56mgG
         8XM+k71glwpehw9VHOjszyq+zoFDGrJhQxvFnHrFlHTtJs622sau0tjR96T1xl75w3nV
         /u+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqOYAmmw8VvOR3NcNyr2txWua1zzmpcScoJ/3lmgcYyXA0Ox6JCYPTibr/YAp74cKdl4Nv6I1jKfflf548Z4LWH@lists.infradead.org
X-Gm-Message-State: AFuF++lw9zbTJSQXiKjHxKSlxeGs0H72SSakptzv8gZIHWSedR8HWAWK
	FIoGA/mSr8T19Z89tdlz3cIgiBMijbS8yw6d6Y29sSkeKFZi2yKk65Zw
X-Gm-Gg: AR+sD108FbGjtZecvbM/JOLoEEW/g82TOsnxzMUuT9dHoryFvSFrCEWlh0nV0w3PAVe
	OTsrswW7wWZzvBFaoMQELJNmc+dRu+ZHA8DLYVxOR3YjCWQ1EeoCwwtuly8vzfh2wlSPELnBioG
	ut2C1Am5rLjdIwbFyMqgF6rDG/Dk7LiNegbE7QIGID5Uq/FXFoSluVtmjYWHckfw9AvNnqHoxnG
	/aRK+xh4ypEZMJqQLO7OmU76fHV2lfMEzzxyvukZ4n7/2JcAruT+E1DmqPDo6gdo3oCvc25vIl8
	4h4h/UWSjveUt+hIOw+ScOTE4u+a7j1UX3Zo/RkKSw4yXi5Bo5MjHu7E7xXwR7JY4fRp9n2FFqY
	1fOkaYSglfCFPvXgPVqWy9BtkhVd/+4vxmkt1zmQIuJYJilg0ePUZj0NO3sVeQ8HT+hZAPxQOWT
	E3rR4vOA0HoRBxlE+b3Nd8AGyuVqP73WssVTN+tWGl5PBamfDlsVGSiopWn58h92mkIikMWpoxx
	lfCdreFeaYlR+IAdfD28jDQLBpXZP8b9D4Hmk87qliChf5E0Noc
X-Received: by 2002:a17:903:a90:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2d670b60ceemr33715055ad.2.1787356731807;
        Fri, 21 Aug 2026 16:58:51 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6768b9c0fsm196965ad.59.2026.08.21.16.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 16:58:51 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>
Subject: [PATCH] clk: mstar: msc313-mpll: fix off-by-one in clock array allocation
Date: Sat, 22 Aug 2026 07:58:37 +0800
Message-ID: <20260821235837.2341179-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_165853_501850_C27E0A46 
X-CRM114-Status: GOOD (  12.43  )
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

The hws array of mpll->clk_data is allocated with struct_size() using
ARRAY_SIZE(output_dividers) as the element count, giving it 7 elements.
But the probe function stores the MPLL clock at hws[0] and one
fixed-factor clock for each output divider at hws[i + 1] for i in
[0, ARRAY_SIZE(output_dividers)), writing 8 elements in total.  The
final write to hws[7] is past the end of the allocation.

clk_data->num is also set to NUMOUTPUTS (8), so the clock framework
reads hws[0..7], again accessing hws[7] out of bounds.

Use NUMOUTPUTS as the element count so the allocation matches the
number of clocks actually stored and exposed.

Found by smatch:
  drivers/clk/mstar/clk-msc313-mpll.c:134 msc313_mpll_probe()
  error: buffer overflow 'mpll->clk_data->hws' 7 <= 7

Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 drivers/clk/mstar/clk-msc313-mpll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mstar/clk-msc313-mpll.c b/drivers/clk/mstar/clk-msc313-mpll.c
index 61beb4e87..bd45aa0ae 100644
--- a/drivers/clk/mstar/clk-msc313-mpll.c
+++ b/drivers/clk/mstar/clk-msc313-mpll.c
@@ -105,7 +105,7 @@ static int msc313_mpll_probe(struct platform_device *pdev)
 		return PTR_ERR(mpll->loop_div_second);
 
 	mpll->clk_data = devm_kzalloc(dev, struct_size(mpll->clk_data, hws,
-			ARRAY_SIZE(output_dividers)), GFP_KERNEL);
+				NUMOUTPUTS), GFP_KERNEL);
 	if (!mpll->clk_data)
 		return -ENOMEM;
 
-- 
2.43.0


