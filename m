Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99383CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 03:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BiWkDM88UkeI5kHrEACZ77BOW2Ed9Qe85NMLR9Ta3Bg=; b=MarQL+JVnro5XoU3HKFkHyOb+f
	RQL65CoEBIhizxlzHAGjYS9AicjJ0sCvgoN5BiHxRS5sjd1R6pWn8t3GgYXXeshe8UigGmERr67Ua
	n9W/FRI2feBPM5U3crhJ1qj3KT5sQj3Do5WFVE4x6ZF0kHcHeL8UtRi370erze1OYvHKsa5S7w8gs
	xdnkoomx0slAiCk3tUvbwyUlRFpzuGazUADCbBzw7vp7WIEWLZFljpHeyyt7Anof+kPVdY+HiH6g4
	MAzL7CkdC/rzMuUVkXWSUJ5Z+qj7uKQwTmG8l1x4cmH6zWNC5Hp0OgaetCXS1wdE1PeRn0DlAtlZN
	Fm3dMMUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9Ij-00000006j2R-1BPf;
	Wed, 10 Jun 2026 03:08:21 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9Ih-00000006j24-0bVD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 03:08:20 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c8584e80bd9so2412225a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 20:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781060898; x=1781665698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BiWkDM88UkeI5kHrEACZ77BOW2Ed9Qe85NMLR9Ta3Bg=;
        b=EihUtHuiiVbG48hWR4nb+Z8SgDPN9fJk3RXIsfFSchjnVb1p3SXR8XGjmW0AzCVlM7
         R4iwBHlw8QkaHZmrqoMdUSRoRfUYaSgEWaxhFbEyDboMtAhS+LHoFWMb1xGHQXR0RvA5
         axuGdm25zbcF/PEo7JC685iDLzrFWB9ObvLYLRbwr5tXql2e0kf6mpFr9gFN1NecucRp
         n6Kys15fwO/TgC3NQst36qJayU6N0M2FbJAg9woScrLZviETOV48zMKqZi7JW8lj03EI
         aGbNkFjuYlk7tme5TBlJ+4OGA4Sml2QrB0ngrCeX/ocdm9Y5IBHEwbMd+2jgBFGraj4e
         rACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781060898; x=1781665698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiWkDM88UkeI5kHrEACZ77BOW2Ed9Qe85NMLR9Ta3Bg=;
        b=jgVYibtA/HhxGSpK5O8jZTlx/i6D8dDdp9cvAzi+szmHUk7o6qGZg9JEbx6C+f2VxY
         5d0J7zkrUVW4pEeuHia79JGvJ8bkbPw1mPrnbDwtp5Jxu94BfFkM4UxgmlUgtdUuN0WM
         zNaeJnIdd8fWfopVt97x3qD8oVPw8lZC6GfpSyDZHr+ZtcfR0FkBsNJ7Z7Oj1ZK7oLmh
         CMJVeoPrkYPka0PRyJ/CLXTWRraUMTVh0hxHrBs1di/E+PG/LXyvikOMtY6NmmvdcZtF
         tEydcyyKypbE2DHSqGJDSDDjXSpAsB64KENkjEhEji8OedvlNqx0x20RqW7J+uj/m3/8
         rI2g==
X-Forwarded-Encrypted: i=1; AFNElJ/jTSkIrvULUCIdCRYoCj3E1CHolQUt453dG5WQM5/sm8IeWAComiqEm5CQfxw9zAW9oCunB4153CR+uc9MObrc@lists.infradead.org
X-Gm-Message-State: AOJu0YxmrsX+qC9/sex8WzEP859ytsiHQNO/NFS3KcvdfF5WdI9wuUdZ
	uCLwOUpZeFFyu/u+7ligDiBOzYB22eeznyfCEOIR7X0RDfh5El9PC/hR
X-Gm-Gg: Acq92OF2l4WC3Bh5FQ4rb6FXeYZsAAuplgjdGnE4NFZRVfh/ehPloB155OAJZo6SngW
	zlenWqcTeNv7j+pxSVvhmebs+gAl1MuctRp2Tx6Pxcw0zIIIea5cTKaxqTVUVxPr4ipKImQ2Gq+
	Gd2A1Lh6y0EJdUEzAUTuFi0eheZII+EpBl7zJ+lU8BiahqgWNgLjp4wMwBd3DcZMrEL5VKqq7Xs
	tqxuUSaoinw7tauShJDEGkXPYretDTg1mqvo9KMHVXT4+5wBg75M1Jk52+XcedG7aZlehEXPFFB
	pltx0za/MI756U2FSObb77zaO/k+UtazE2RLMwcVNDGpaqQTP8LoUyrOQhzRZ/hcu8hRy4+vtfv
	GvhZaOmCq+5CYz91WCO3yIdzfO0I9Tp6Y7U/oXZjm+L4y7svQ7LJ7egWQggIZkyscgYFL1d7IG+
	8ydFt6mmNKqxzoZ8IBN4KMfxe8gQ7nkUVnpRaTBe1hJirlyfzps+JsicwbjYAlp1Mu57vnQMfPY
	ycofK05gJbzIaGnW7Bg2mqK4hnj0VujS/FBSSgeDe4sk1uumrY6mw==
X-Received: by 2002:a05:6a20:d0a1:b0:3b4:8818:fd34 with SMTP id adf61e73a8af0-3b4ccf8e5e1mr28706510637.25.1781060897591;
        Tue, 09 Jun 2026 20:08:17 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85deeb2bdesm19679386a12.0.2026.06.09.20.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 20:08:17 -0700 (PDT)
From: geoffrey <geoffreyhe2@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Stephen Warren <swarren@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH] firmware: trusted_foundations: fix device_node refcount leak in of_register_trusted_foundations()
Date: Wed, 10 Jun 2026 13:08:00 +1000
Message-ID: <20260610030800.2100685-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_200819_210470_24E3B6DD 
X-CRM114-Status: GOOD (  14.96  )
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

From: Weigang He <geoffreyhe2@gmail.com>

of_register_trusted_foundations() obtains a reference to the
"tlm,trusted-foundations" device node via of_find_compatible_node(),
which returns the node with its refcount incremented, but the
reference is never dropped. The function has four exits:

  - early return when the node is absent          (no reference taken)
  - panic on a missing "tlm,version-major"        (leaks one reference)
  - panic on a missing "tlm,version-minor"        (leaks one reference)
  - normal return after register_trusted_foundations()  (leaks one ref)

On a normal Tegra boot using Trusted Foundations the node is found and
the function returns normally, leaking one device_node reference for
the lifetime of the system.

Annotate the node with the __free(device_node) cleanup attribute so the
reference is released automatically on every exit path.

Found by static analysis tool CodeQL.

Fixes: d9a1beaa10e8 ("ARM: add basic support for Trusted Foundations")
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 drivers/firmware/trusted_foundations.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/trusted_foundations.c b/drivers/firmware/trusted_foundations.c
index 1389fa9418a7b..43a2a417528f4 100644
--- a/drivers/firmware/trusted_foundations.c
+++ b/drivers/firmware/trusted_foundations.c
@@ -159,11 +159,11 @@ void register_trusted_foundations(struct trusted_foundations_platform_data *pd)
 
 void of_register_trusted_foundations(void)
 {
-	struct device_node *node;
+	struct device_node *node __free(device_node) =
+		of_find_compatible_node(NULL, NULL, "tlm,trusted-foundations");
 	struct trusted_foundations_platform_data pdata;
 	int err;
 
-	node = of_find_compatible_node(NULL, NULL, "tlm,trusted-foundations");
 	if (!node)
 		return;
 

base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.43.0


