Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4AAC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lWgrf7yZFJ77B58gypS+MDoL/u/LiBf8lDp/68qUMKU=; b=x2M3+4E69WzhsH9UvPge3NfoOi
	qolqxgvMEy5tu2siymlKUuzs4FYBX97qNqv9JFryqMi8jpGbsUV/mo6tVPe0fpxMrLtJXLzicVmNq
	+4qGzhRD5Ex57I3ggKspFWfXRemEkludOT3bmVHYJb4cQFTNakCBroMEEND7gK9WlnABe/4orZNQt
	nQhKN+ulrAwffGG+NLwyRy3uQjPbUZdvkhVoJJB9O6KRQAy7CjV2C2W50Pqy/st01sdUL4bJ5UYVL
	MurfwOOjWppwJ1zW0GKdOeYStJ9ypZC18f1Tkv/6t2vi5NNCaatd0l99e/b6yw/QEcP5d0GU5HC52
	/Ro+LneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RYk-00000001kJZ-1nXG;
	Fri, 04 Sep 2026 10:54:14 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RYh-00000001kIq-309z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:54:12 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso679874a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 03:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519251; x=1789124051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lWgrf7yZFJ77B58gypS+MDoL/u/LiBf8lDp/68qUMKU=;
        b=j/Nu1elnnG8raKn4wZUYeoD9Rz3gP/d7hWQXowhe3e6qmKRh47p92AgZMGLY6kobwI
         PIMCe3aghD6HOCPcg39lpiXMQt48bgwS1uySZATpIyAXYumSc8J4SCD5+JZ+/32upQ+y
         LpuFGWg7LVrv/4BjZTRsCK7d1GoS0eUFl6M99FhzPxcZ91MDjJ97yd2b7kMPUXnM3l1w
         DmFCgi1zE9grqX66beWbOqKCoTcjkMjCcX9hkCKdzt3nMPtXTABrNc4FnEzkR4HQOz33
         m6oQjZJJ+yGa1d9XNmq2Q9Y7IQ4XvahOC+mHQ0PWkZxinHL7sezfkB+VYfSE/OIT6j8Y
         J2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519251; x=1789124051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lWgrf7yZFJ77B58gypS+MDoL/u/LiBf8lDp/68qUMKU=;
        b=i6v6yt9tdCsLF5hAw54xZ7uJKvMooV07/X6BkzkeLqNwEQN0CrNGBQ328ilsY1dz8l
         Hxba3Mf7brTdbog+vGcOw5yMIJrHwgFUAQeZsVNW2RYYYnJ0aH4Z3ahkDRCtMu53++Mt
         qZupCMGiwe0QAeRd/s16NcMpCZeNSOFN9aGSNCY+IzDQhseP1fG/25g+kiQ3ix/+4xg7
         vq/6AKQTvnRqj5h+PRUZOsiUL2rdatWoUrBAN9+nPN/FJQhTO8A7z6zHqwL35w9MySQL
         89FTs5BzvrK1xbW64CmwuzC59p/JhaBg4jtqfv/sw1tAjo3JzG54ML0G7zuFzqwzCI+r
         7XKw==
X-Forwarded-Encrypted: i=1; AKwUvBziwoflx5wCPnVJic8lnIT+4hhHkidqFWkezYlDdcvj5QY1XVEjd1pfsSFzfGB8r4aY7MQ4+Ml0GxSeTe6FYISL@lists.infradead.org
X-Gm-Message-State: AFuF++mXmiDwL4Ltan3kymqwzcLJ87Xqi687GKu22LWYZUxm7T7CTblr
	nvHR5tf7il2MuzdmHdUQ+8BdTHQrZlO56JzQVG7aQtUy8BEYRCAeomNh
X-Gm-Gg: AYBFou0WOCWX4RzowgkNblzlWNAm11GW2lJwLtB5iulfzmKT1JpTC0qGtYqLNuh2e5C
	HOh3sdUp3f0YGaHBCyOEgcRknoyjoXaYXLTOZX8hUcQZ9XkdNqVD1VwDvhDgPJ4JX0vSn6mN9DV
	0AaGLgZR9j/h8THexbdhp6sZ3cAPu/soc1FONOZMJ0cVMKpxpSdD5RCvNDMmdLZpfPSoSrTVBBA
	wB/YFK0YJ01Lwh9jpMZZU5ohfJigJ2SnbLi0SWwLDwgRFqTwpsv9jkqNKkEQjm9XhihZM8hiKu0
	9fzCrZjZ/+aoYlF+PFRaI2wXtj/7RM7KwJQw/H72wPS6pq57hRh+uwz8ZGknxknZqlVFnTUkN8M
	Hkg1niED7oGUdKvV68k0TBZM0kjylpiNA7lVMJpHTj9Qd1LXR+hn2fb01vdn/UVUWJRgsotJ7TX
	mBgiocbTHYe8s7fn1afSM+O1rJfhYPkxfOa4r1PqyYMGW0RnqH4z/urbnkqjfDniLQWZpKYJFUT
	K1qNrHRpa3SwAs=
X-Received: by 2002:a17:90b:4fca:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39b260dd278mr8201848a91.3.1788519250840;
        Fri, 04 Sep 2026 03:54:10 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm5136836eec.9.2026.09.04.03.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:54:10 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] stmmac: fix typo "platfrom" in comment
Date: Fri,  4 Sep 2026 16:24:04 +0530
Message-ID: <20260904105406.34530-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_035411_752391_C49B827F 
X-CRM114-Status: GOOD (  11.25  )
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

Correct "platfrom" to "Platform", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/linux/stmmac.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 4430b967abde..205216473ae3 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -81,7 +81,7 @@
 struct clk;
 struct stmmac_priv;
 
-/* Platfrom data for platform device structure's platform_data field */
+/* Platform data for platform device structure's platform_data field */
 
 struct stmmac_mdio_bus_data {
 	u32 phy_mask;
-- 
2.48.1


