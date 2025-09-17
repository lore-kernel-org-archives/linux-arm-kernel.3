Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892F7CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 11:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VMQsS7dEiEcn1XR+6VViCf5cMvlHhDrANmtU1f3oLC4=; b=noiL69kv2cmcCVM48oti84hIWd
	NA363la6R8TAgTQob5iYtDJu09vuLJ314yWW02/n9KOP6NOSoyiuOD72ZDyWaNmeAkqkXIWTDjnQU
	kCS/6yyWQfVdW98pdbDbhhvolxYiILN89U1K0FtjmZhseXCSneVZDoQzJfoqbaLLnRX8dWZqoMJZo
	YtYoEdhLRQZXrxHe6gkn2eMR++bgMy8eoYIOd7VYqkzSA3TM18RCtzZvdqr4F3T0JcKgWF1Mx0eGY
	A4khf2QHt5fxqTfiU1fBIseggWuyrNDc773tOBttmWijPdKPiQSfUfcV5YZgkt1TLfV+1WoHmcTs6
	84EYFCKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypue-0000000B3v0-1z8w;
	Wed, 17 Sep 2025 11:01:24 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypub-0000000B3u9-3sO7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 11:01:23 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b54b3cafdcaso3398850a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 04:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1758106881; x=1758711681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VMQsS7dEiEcn1XR+6VViCf5cMvlHhDrANmtU1f3oLC4=;
        b=Q8bEMjmaZImwCgck2TbIrZiVDkbMiWr604wmPJgbM8NOpESjLBgHwUNdQAIbzE3oj3
         LYkdofUJ7Um6S4UaFWghZnuF7kL6dhs/9GuC2RsHGS77qHIk6DGFSoHIUyse1Hz5Cf1H
         fIPnKY2rjU6vJQw84+la/XprvACSRieAxlzN2EOdsJ1n4rDc+qdzsJcNmIDh50go9/tg
         dpjP+wLDd+Woog89V35HxNQ6eWnc+qZZ9+VCLaPyPcQUV/FZvbev+stY8JFKVVbPZ2fS
         hvCQOPqXV6mwyzqgvNuabFxJ9xbvHaOAMcXhoJXSOcCNtBKjqLGvwsw4GFuhsKZJb3WY
         R6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758106881; x=1758711681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMQsS7dEiEcn1XR+6VViCf5cMvlHhDrANmtU1f3oLC4=;
        b=DkrJ06BkuyD3BnGfyUJfEC8mb5rrxE3X2cD8Gg519FU3eUrRSDxK2BmUSkC3PIY75I
         kPXNVwtM3KRceXXZ/fm09r3skL0FzVOe10KA0WUuqYdgGpqt/3Yst0+n9NXkE6q0/LUs
         8dewRAJj7LVJV7MEKKEZ19gIUXrTlEu3gR7mMpMrQkO33yWCD1Ts3kAst0WSmrPa0YgR
         oZ1wCXJz4PMHIFuQPUQfHgwXZvqlUAmcw7AXVplpX3gzdaPtFTLtMsLr1dX+qR41Vw3r
         k9uoCmWi+ElpQdanLoGxIwZg640nM57volinI/0R3Y3UcvKh+YpgA+PnYtFDND/Vxzms
         cN+w==
X-Forwarded-Encrypted: i=1; AJvYcCXrt41Fl4zAneNLE4+R1SfkTLZdOV35LquD8ew0H/bPsVFfgLAB1iZW6y0iWqbqABarll1BiDvTySeXb2AI7sCn@lists.infradead.org
X-Gm-Message-State: AOJu0YzmOkH1HfYAqWO5QFdjDE4npc72BNDBEIomNIGy83VieoAeZR8y
	aFlJFZ/X9QM4WJxVPXmb7XiCs7uWojm60+MJ01EDbMc3lM15ydUrw5BM7oU0F0gcE1RfbZwXCmg
	Igt1YFJE=
X-Gm-Gg: ASbGnctCYJ7V/vMD0gHwnCm0jOz6T7/ALgZi8ssGCQ+n7q2xkQtbTS85GWX+WIT3hYa
	rkMqUydG8TMgOLeVdLhShx1Sg6uTd7VZevjed5VBms+1OAJ3+91uArLGYNLq/Gu3JhMyiVPjf5F
	Zs9Il59EaMeOcBudFzP4gbtVdKl5oFFIOE6nfnaG6IPzC1VGiIezMD53cAwhREJ6z/dlzzXSGKQ
	JdrQ7eSeO+pzTmph+sR+dVsjgJBSHj8xmqe2Xfy9j6lk9K0gbR8DgNgL/zBMrpZ0lpTqOhfJ72Y
	cJ09fO6FdtcbhRtRzVq6s5k1kNlKnWMr4Ouv7vKYGbd43C2C8kqFAHAm0kHCjnsQE1ZshJxPB92
	OzaX3I9UyzrukVCxJ0/qzrm6IgsX28kuFQuazV/abzi6PoP97p4/Gf4S9
X-Google-Smtp-Source: AGHT+IFzHlVzYa/q3MnbGUKmGNaxoTqhiBZhkinwoVOAqXMfYX6776FYQwngWLp/NNcoxyCfaQZaUA==
X-Received: by 2002:a17:902:d4c9:b0:246:eb4d:80c8 with SMTP id d9443c01a7336-268137fd08fmr17646195ad.34.1758106880901;
        Wed, 17 Sep 2025 04:01:20 -0700 (PDT)
Received: from fedora (cpezg-94-253-146-122-cbl.xnet.hr. [94.253.146.122])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-265819a6212sm94231445ad.57.2025.09.17.04.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 04:01:20 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	UNGLinuxDriver@microchip.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	benjamin.ryzman@canonical.com,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next] net: ethernet: microchip: sparx5: make it selectable for ARCH_LAN969X
Date: Wed, 17 Sep 2025 13:00:24 +0200
Message-ID: <20250917110106.55219-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_040121_963859_53F404A6 
X-CRM114-Status: GOOD (  10.71  )
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

LAN969x switchdev support depends on the SparX-5 core,so make it selectable
for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/net/ethernet/microchip/sparx5/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/Kconfig b/drivers/net/ethernet/microchip/sparx5/Kconfig
index 35e1c0cf345e..a4d6706590d2 100644
--- a/drivers/net/ethernet/microchip/sparx5/Kconfig
+++ b/drivers/net/ethernet/microchip/sparx5/Kconfig
@@ -3,7 +3,7 @@ config SPARX5_SWITCH
 	depends on NET_SWITCHDEV
 	depends on HAS_IOMEM
 	depends on OF
-	depends on ARCH_SPARX5 || COMPILE_TEST
+	depends on ARCH_SPARX5 || ARCH_LAN969X || COMPILE_TEST
 	depends on PTP_1588_CLOCK_OPTIONAL
 	depends on BRIDGE || BRIDGE=n
 	select PHYLINK
-- 
2.51.0


