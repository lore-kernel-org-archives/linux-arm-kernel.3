Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58778C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SLBrHn1lo0nb3pErG+htfOLCGfPDjEh1wfPdZMI4yH4=; b=DltIvp87xikF9IHMz+44Ik2yFK
	CmxidxPrmttMB+oXgOSmOiaRbjXsEXCY+VyItjOURifVizHIUifruCC4E0vXHWb43BBfqyszMzvqn
	BY+PYmhRBRy62hv7EpGVOwIe7G5erupVXwzOcrGIjcLt/hy4DouSJMXq5GWdDkEzq0ENNe2K/zXl4
	BSqYONzYkqoyXUUFbRYbNHPNgLD+y8jI5NX8+nfPeeaaLdY/IwKr4BKDitUrpPAv+xYwzLR3esSAk
	0idZFyGcZygcp93IHV/OP0teg1UTcvIDYCxYKOBIKTZ8ZfHpzgpTgknVPOGGmhFd56+IEW+zE3edx
	RPYkKDug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7mj-00000008HP5-2P8C;
	Tue, 10 Jun 2025 22:49:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5Co-00000007zzx-3Uqv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 20:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=SLBrHn1lo0nb3pErG+htfOLCGfPDjEh1wfPdZMI4yH4=; b=n/wf+nx52+lYOHJi2Ym1+jupfU
	z+bStKdjsXBY6afy7g041HCUVaCSSge0mz19XKxcm3BBveLa2PTYM7diRI15pH/9GBoBHKnkwTZ2E
	HBub4vcc3nV/SD7wZwoxbsyhCSQ6H3cq6sgGRcJqCviiUPYAlQTWRipbvqoQ+Z4kSwa2fnRokhNay
	tbwAap3D379SHCiAh+n8p8rb1q6FAWQiScfmrJmpo5htzmz5MP1w75JVLpJMgbxJ507vRBXwGsjvb
	hAaDoXKZg3B6G7rVKDaOQEqxfXsuIaOjZHKPzqTVwXkDfePt1ZikpHaXmNLF4PiE9JCxH1X2LQy2s
	ZWzkEjsg==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5Cm-00000001zAN-1MIE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 20:04:22 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2355360ea88so8481825ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 13:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sima.ai; s=google; t=1749585856; x=1750190656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SLBrHn1lo0nb3pErG+htfOLCGfPDjEh1wfPdZMI4yH4=;
        b=WO5V9KnQdMYk+DJD+jHhmzz95BHQotUrVZfaKLrwvSW5heNoRFG8hW25BvlxoCu7Gk
         e0aYCJ3nN48jQZJupqRjPZj8I3YG1qu+MYoLLVlRfuojQdhrz0wUUFYIkuG4wvudR36U
         WOZXnQuNsPMSsTGFDwAYcnjSH5r5BNKP1CYVEhmOCa+V73bz19f2DlK64vFAvlqYySLL
         ZZMrXaaM97HBW6wOLftUqqAt8JSVtsklwClxXVB/TLnHaazXfa2yfLUpTSc2uczvjNu9
         TUsvLRNiEUsH+eAsPZaTUG+8iYJe/ZqHDzgIw1R4MKPpMe5Yxg3Hdr4sKO+/IAK5f1nQ
         DK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749585856; x=1750190656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLBrHn1lo0nb3pErG+htfOLCGfPDjEh1wfPdZMI4yH4=;
        b=XYRvgNV1trei0Rnp0WX1UL7ww9kjnFmJI8SXnh7a4bttmwM5/bs3Sswg2r7nqbNtDA
         AKB2q7X2ES908KCXrLAzH07wL32QEIUNVMkyWjfk/Rsp+dqr83clS18foaDGaNMzS4Q4
         loXPHTnUDPd8fdY5ZjX2V+6Q9bUr2DybjjVYQ2t9TAzLwFQH/0twwwPOe4DHN0Z/lKi8
         B85nCzTdyVkIWCSHrglNom9Ta+N0XqSXFF0T7aEgQAf/JXIvD6PQvjxnlKrRnf8ATcKI
         oGmvlY6IeP2lwI/Fwmqn6pBcMlkBXInlQ+2phStDhn04H8I6cXuBxWRAfpboZUfjRS/D
         tkCA==
X-Forwarded-Encrypted: i=1; AJvYcCV3F2vQkRjMjpX4pMT5ANKx3JIUBOPQnQdkEIfLTyhicFU7ENpxIs7DLpmwdRWSBGFsmITpkU6lmbo6BxDF6MNl@lists.infradead.org
X-Gm-Message-State: AOJu0Yznw0XnElvA0J6D9I7U6sfSmuv1Gg9VarQmKvzM51X3QHz9lRic
	Y8lMwhFoZfoP+l0fFIA9tsV2liCrNAwsfZDBXZkWpGbN9U/T8vYriwMB1h2/hmUMAHQ=
X-Gm-Gg: ASbGnct0Bg7DJdNLylcPv+jJrfilp44trB8Hct5+YlJpyhmzdLKsYZ4pJTdArpIbKYH
	w8eUREoU3ixAjh7zN2b0+q4U8Si11Oqyr7wdTyNJcFD7xWOQtk6O/3NVsrRfUQgh1WtPFf1ISYT
	OrXA02oYxDW9QIsOzNxOP1gJwDQtQSiODvXaYnwXAN/n0o8SEty/BOgVb+7bQ2fYBuJlYneUqWd
	+bfVmh42DmrmnETd0Wjd0w/XvXcuHlQb5fjvzHLmeZRSfej9vDyzLI/9MsWGNRdLG2DEZPTnkyY
	HfQdnM8mKob+hInKEduRMzqa5neRrQ/XgoKYicBiJwH4bFFaYBB6Y1F1VumyjgSp1kUjZqhzwQI
	5ZtNzhcb7Z50uxM8=
X-Google-Smtp-Source: AGHT+IER+o3LTU2puTUgTzx5nfZBbOjCThFzTKIlbQejci+9CZwNjpKLs8gAK20uD5mbsirIIc3WyA==
X-Received: by 2002:a17:902:e806:b0:234:d7b2:2abe with SMTP id d9443c01a7336-23641ac62fcmr3095555ad.7.1749585856133;
        Tue, 10 Jun 2025 13:04:16 -0700 (PDT)
Received: from nikunj-kela-u22.eng.sima.ai ([205.234.21.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349ffc151sm7629818a91.48.2025.06.10.13.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:04:15 -0700 (PDT)
From: Nikunj Kela <nikunj.kela@sima.ai>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: rmk+kernel@armlinux.org.uk,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	romain.gantois@bootlin.com,
	inochiama@gmail.com,
	l.rubusch@gmail.com,
	quentin.schulz@cherry.de,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nikunj Kela <nikunj.kela@sima.ai>
Subject: [PATCH] net: stmmac: extend use of snps,multicast-filter-bins property to xgmac
Date: Tue, 10 Jun 2025 13:04:11 -0700
Message-Id: <20250610200411.3751943-1-nikunj.kela@sima.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_210420_522761_FD4738C7 
X-CRM114-Status: GOOD (  11.40  )
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

Hash based multicast filtering is an optional feature. Currently,
driver overrides the value of multicast_filter_bins based on the hash
table size. If the feature is not supported, hash table size reads 0
however the value of multicast_filter_bins remains set to default
HASH_TABLE_SIZE which is incorrect. Let's extend the use of the property
snps,multicast-filter-bins to xgmac so it can be set to 0 via devicetree
to indicate multicast filtering is not supported.

Signed-off-by: Nikunj Kela <nikunj.kela@sima.ai>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index b80c1efdb323..4164b3a580d8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -579,6 +579,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->pmt = 1;
 		if (of_property_read_bool(np, "snps,tso"))
 			plat->flags |= STMMAC_FLAG_TSO_EN;
+		of_property_read_u32(np, "snps,multicast-filter-bins",
+				     &plat->multicast_filter_bins);
 	}
 
 	dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*dma_cfg),
-- 
2.34.1


