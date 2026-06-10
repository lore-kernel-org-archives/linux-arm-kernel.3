Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9C6CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 05:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXMoJERtGY7hktVR7ChkwsDsIRvHs1FRpH9Atl/UdCs=; b=UAVH12Msg+SXbLjKDiyDbrtzJO
	S+sm0sW6tMmWWetIQAfDywnxD1zJO9WME30wtaP65XE6Vhc8EiNLe+2eU6qvs/gMMcTZ6ekYfsLeT
	OAjzHDwAZNGknDMtunC7eNs4lZF/tWSvwju8PuxjfMjVDDBZ79xj991d4b4hODS8+xW/lkbMucJrf
	SDvYv63e3ec7zXwZxfTI2FEPk1XwnHXPeFOdqTp/viSY6NI/HZ+O4JNdDuEAE4ayaXDJ2oFXyt0ZC
	JlEsdWNZjIbhrAreH/CMKu698Hdq6yla0VQ9uf++xlU6hLqpDl3xXnmzerJo8GtfEZ2kpFxN5Aqa9
	OPRPgfsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBZ9-00000006pTv-3THB;
	Wed, 10 Jun 2026 05:33:27 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBZ7-00000006pSO-1FYg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 05:33:26 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c0b944f6edso65050905ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 22:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781069604; x=1781674404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXMoJERtGY7hktVR7ChkwsDsIRvHs1FRpH9Atl/UdCs=;
        b=YT1AThrgHI4bS5/Cke+Gi+Mez42dsLHZf5o2iCFf4VhMyLzfdI4i00KdfW+zs/fbJR
         QN80S+JXsZFOT2Onz8bh0PLi6R2ko4E45RcXz+X9yT2s4IegSLFA/bXKpzS5QKCp/Sbr
         Jxa1i1/dg4RtLVo3jbKNRqxkl2XbrSsJePikdfq8cid2UJhtfH1a+ysKpPb9EvFIqCqS
         HM40/JfFrGcxJ4oGjGSoF6Goytb1wGHxb0RZ05LUMHgEkTQulmRWh8hk1yvEjNu8wgE/
         Skh8JuYI9hJFAeBRYMQqcAMLWP4ipS24eFeiDKKiDrbJMcIV3+RCrvYiRZSPOpw2Pvit
         gHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781069604; x=1781674404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sXMoJERtGY7hktVR7ChkwsDsIRvHs1FRpH9Atl/UdCs=;
        b=ad51mbbPjjsKHCyt0rTJa2OVM4LtTBRDS2dgkqZiaI1VpgkJrcUNLaIVQmamJ/Twzg
         6b10YTYGRRjmKixMdOWGLXMy0e9ieUB02aSV5YN0EKEDiqN3oxiClHUKFYQGI5Imigou
         T9VGoIbI9mX2pJitY49LFgZHrpz1+bl8WNTIQ7dnz8FmJnoLMlLD9ubxYFbcs6kNXFpw
         W/GxJCmoMv9s5fA03/kAx5tZ6Bc6ZogLubO9PpO2rwFdQ+ggIWu09fZoQK7YavyK6+Sz
         jSAt165rzRH5fJHQx0YR8hAi0kWpawzwXkoK0PBvnq9yRp5hTv82w0RMyfMPT+A5R1QJ
         E4uA==
X-Forwarded-Encrypted: i=1; AFNElJ+6c0+fyp9Jja0vMQL1KCwiuOi26kujVNVwCB1v1n/Tvc1Od7ox5ScJhmiSjjeRgfpo1wUxJddJV2wbjAw3FX4f@lists.infradead.org
X-Gm-Message-State: AOJu0YxX5IWzRXCtMgtPjR3mq6hFLv0VSGU3m9jo66E0XKt8YII88LWT
	Fgjrf2PVQjER8OP7rOucrqwEbY//LXfs8oIbl+GA+z9SDpwUawLBVd2Z
X-Gm-Gg: Acq92OG/HD6Njuc/vQHZnT4q2LqQm7+MzsVuyZOS3b64UMqOZgZlyrrQtWUmkndz523
	FTn+r/psS9iAjZuHrjIAkd9wFht9dIBJrMEVu7jjOLo+Yq4njfTA2j3f7Zu6oSHSmcnCqGLH0Jr
	66aNZdCMGnfljJ7OlCe4bfDltj6ueiSGnCfl8xex4O7S1VPRTkzEIw+dAbKzzY7qdNckcBVWDJ2
	7wkvZgNE37ympKxQhhu/n7JeSnF/x6Pv1hU7nw2aPUe1jxMmSXrr/Rn1SuGCDQxQ3o3D4slcWbI
	6dygtTJ+CsSWJFgXYGwhRaLv2kFBWNgUYEXPRQryl2zhta6H4jXjcv+e6XKlp5GWA2EbuADoqH3
	jEggFR5ZsiWCWEDZoa3cCHIFlnHco0+dnP9Qmwu4aacuj7a03Rzm/arD3+Vx10ADPUSi5uvR5Aq
	5fKvm8kVH6HLflOzHRS1jePsIxeQ1lA3ydEdaCNX1uKAtK/96vY5ggSSEQxxm3lhfY8iqhEZtil
	BvKmkmdfUJkSWSoobudqIM37FTMCRDaPNLLT6sVbczDU8vTUSo4wA2BogQLdP80
X-Received: by 2002:a17:903:28e:b0:2c0:bff4:96a7 with SMTP id d9443c01a7336-2c1e7e55653mr247195935ad.12.1781069604384;
        Tue, 09 Jun 2026 22:33:24 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm242862735ad.27.2026.06.09.22.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:33:23 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Daniel Palmer <daniel@thingy.jp>
Cc: Romain Perier <romain.perier@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 1/2] ARM: mstar: fix device_node refcount leak in mstarv7_boot_secondary()
Date: Wed, 10 Jun 2026 15:33:11 +1000
Message-ID: <20260610053312.2267307-2-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610053312.2267307-1-geoffreyhe2@gmail.com>
References: <20260610053312.2267307-1-geoffreyhe2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_223325_337608_2B133309 
X-CRM114-Status: GOOD (  12.85  )
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

of_find_compatible_node() returns a device_node with its refcount
incremented; the caller must drop it with of_node_put() when done.
mstarv7_boot_secondary() obtains the "mstar,smpctrl" node, maps it with
of_iomap() and never releases the reference, leaking it on both the
-ENODEV error path and the success path.

mstar SoCs do not support CPU hot-unplug (mstarv7_smp_ops provides no
.cpu_die), so this leaks one refcount on the smpctrl node once per boot
when the secondary CPU is brought up.

Drop the reference right after of_iomap(), since np is not used
afterwards.

Found by static analysis tool CodeQL.

Fixes: 5919eec0f092 ("ARM: mstar: SMP support")
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 arch/arm/mach-mstar/mstarv7.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-mstar/mstarv7.c b/arch/arm/mach-mstar/mstarv7.c
index 274c4f0df270f..871c0fd258e66 100644
--- a/arch/arm/mach-mstar/mstarv7.c
+++ b/arch/arm/mach-mstar/mstarv7.c
@@ -86,6 +86,7 @@ static int mstarv7_boot_secondary(unsigned int cpu, struct task_struct *idle)
 
 	np = of_find_compatible_node(NULL, NULL, "mstar,smpctrl");
 	smpctrl = of_iomap(np, 0);
+	of_node_put(np);
 
 	if (!smpctrl)
 		return -ENODEV;
-- 
2.43.0


