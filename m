Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B10C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 01:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKpKd+91Y2rLJn8AIBDEdxmAM9hr1jGqKMcPcum37fc=; b=c88h6o9dxRo35wEW1pk42rHh72
	b4EJ0TTJBnXqielIZzXK4CruETxFoHEb9WeTA6bl+pDfcrsdT3tLE95Q6aK0R6wTie3r5wAr5/rmU
	rcUnnxHavNYcJrgapTdUQymSw+xzX0a0F+Ta4xH6jnxdV9ZGceJf5xUodnX3HErELIVfU9al7IF0o
	h0zf+U51oIhSDmkuHJxZTgxxrhU3zh3lMk5IyxDkWyXbCz5uc+lAQsg6u4eyhbAGcxSl8xw2QpNkC
	eN3VKAN0uLZiUCwWreRUeBOAC9QIqAeVVJYcd1F3ou/IzIFJEDvnN68Ec6IvAiGFKuZfkGpgTM0Op
	/VPdUlkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYxJ-00000005FnS-12mu;
	Sat, 10 May 2025 01:24:45 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYre-00000005FFv-1O7Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 01:18:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so19883355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 18:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746839933; x=1747444733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKpKd+91Y2rLJn8AIBDEdxmAM9hr1jGqKMcPcum37fc=;
        b=TY1+hBCimukeJ6uTbZs8NznSnvb7uLJ0lNasjmLjMpXAa8xBickSH/C1h+iIEP8mrq
         iUwHAAutt+4ZVRzRWKGA7o1FoLM3tToAhPrrxHJhqsAZjIktbcrtORsdAuC+St0uuvfh
         3WzXCvQ5AVij/8Jv1e0lMN4gEWokcBbt+wNw/YLbkZwiE6/HCdNYqBSmreLeA27WxKBA
         1unZHgonzknk+5yTOFTlBpEU3L3RX6W3BO4MfTiL6IM5eKJKJktlILLn0vz2+Zk0abAV
         hFjEI6fmPSLsQZ+0WLRAzLaBCC5fyvvRtnEJOgF4H39TGm+lOZq5ucQYUsktouiR1kec
         w8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746839933; x=1747444733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKpKd+91Y2rLJn8AIBDEdxmAM9hr1jGqKMcPcum37fc=;
        b=t4K+XIDiLtd43psoLww4ddVPnXT/LlaLumaMT5UQZa1yMvwt6FlzKCFxS9msjQpjaR
         q6pnq8ZBYvMW00oVPklcK1oyKPzM+lYWtSSGRvtEcUCnRs7fc/jATFIHDY8aW4KwWuCH
         ygSrOcR7hD48Ywjy55bEujiQFq0V+OPJToFq4aAEEXQHetZ+Kpq5HmpSZTZCxZErjrGY
         B+KlMogylRhwnJdbCDxTyzvJBpb8m0XURtd5UjHqQ9b95Br0pwCIv3CHC28VKrWv2CFj
         u/sbDlpth4glgw7HUuHB+JJ+IFt1zLSshxaZdOlAAueB8YsIcZCaHhyjKUw9rXwdeny2
         BzHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBhCbNm/Mxv0tRdrN5GVEhloN906GaxQzlZJqmIy/rZsfiogpkEb5QhsNaJ7oC71b0o0y2XyU1+UuFXlGQTzFp@lists.infradead.org
X-Gm-Message-State: AOJu0YzqDZ3v/xm9LFdLNLE/SNyAYINc5SRSVxg0hUCZLa8c/gtVqqCV
	yK4uHeVEo6luG49DBGaxncuKF8+TGDWGIx4A0cwKgnF+wv8a6ahV
X-Gm-Gg: ASbGnctZ7jil7ReFu8OEWVpZoEPhZBLvPLD2/nQRLMD7I+whp3QjyAohUOsOXNI/9Wu
	3gPcBECUcOhP+1H3QP8AS6etlM6QcYkY8HixqmEk/l4nxA4p3aTSRL8RoR9gg44PW8XaoJrQbDW
	RoRMfmQqwdNpCkVNbCctkuRAiP02BFbGTpho7eZOHTUJkok8QOZbjj/HbMnKDgkxZVkyY8Pbmpv
	oC51r8TjuvxVV1jPxejqz/nCBszU3+qc1vaR7XghVyAXJP4YmctWzSpdJULLCDGKU31NDva/td8
	UGdCz5njStriIMqsnC4+8Fyry5kJkI1+Twj4yFT/hpNSTB9pbwMjnzjluIGmnGFaS12fBHA=
X-Google-Smtp-Source: AGHT+IEE1Is4hilhLo2Uxeuzo3FKadxXFaI6HwNkhnIT+gx3/gSURBsGdbp9t8C674tp4Acuwl2tmA==
X-Received: by 2002:a05:600c:83ca:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-442d6d18302mr54963995e9.3.1746839932479;
        Fri, 09 May 2025 18:18:52 -0700 (PDT)
Received: from localhost.localdomain ([176.206.99.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f0easm86967305e9.12.2025.05.09.18.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 18:18:52 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH 2/3] ARM: imx_v6_v7_defconfig: define CONFIG_ARCH_NXP
Date: Sat, 10 May 2025 03:18:05 +0200
Message-ID: <20250510011806.13470-3-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250510011806.13470-1-benato.denis96@gmail.com>
References: <20250510011806.13470-1-benato.denis96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_181854_368763_3E390BF3 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

Define CONFIG_ARCH_NXP so that CONFIG_ARCH_MXC won't be disabled
as it depends on CONFIG_ARCH_NXP.

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 062c1eb8dd60..22edc6d17520 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -13,6 +13,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
 CONFIG_ARCH_MULTI_V6=y
+CONFIG_ARCH_NXP=y
 CONFIG_ARCH_MXC=y
 CONFIG_SOC_IMX31=y
 CONFIG_SOC_IMX35=y
-- 
2.49.0


