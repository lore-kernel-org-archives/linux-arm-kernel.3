Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22C5D41144
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 08:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=edU6xkXjAjWZJykGFUAvi4D1HZcCJChoYmvCxl8CEyU=; b=MEnRfmjG1pngDlcpKEWOQivLGX
	/dE88d7DMzygghSAEakPYUjB83NWtzugQCeD0BY/YbUOXaSWyDPLDsBy/zhMG0jfC4JQxnG5ggPyN
	XmGkkQY0azM8DdPAP3Wykw7q1j7Xa25lCKkTbADdw33Q4l9PuEmv9NMA8xto1zs/Nf6WJrEKyL6Ik
	Zdbu38C0wVbd1H7SeNZ6kx/Gx8Oe6ADiQ0N2TEl0QE+iGRxB3a8sdDBMKznHbFHDisUs5d1WKiSX7
	qRkgGLgHgPcBcUivoTtQyeCwmyahk7LsuURKT3hzb3+OP2m20ZQV/pKED6YV3qzx84leKKPBxImje
	4QCGcfpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJ2a-0000000C1Ec-1LRM;
	Thu, 15 Jan 2026 08:49:16 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJ2X-0000000C1Dr-2hLu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 08:49:14 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a081c163b0so3643735ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 00:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768466952; x=1769071752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=edU6xkXjAjWZJykGFUAvi4D1HZcCJChoYmvCxl8CEyU=;
        b=IJecGVPNhmSiWL1TqfCVtVRRdwiq4WCFhThGiTU5DE9jslWwucJvqblX2PkLiruHp3
         Mvf55+itSbasmTkDx7ec1hG43pP7AAnpnHrZ4u4YzQCyMAKjHikq9w6cs0e/+9e86XfT
         XKDPwd8n/lSxFA/o6GlUi7k/J+TB4p8ScOos72vyMB1By2htN2AXGWBtwX2/c1Yc9dR8
         sYVVoJA1a5XzyB+QkCziqjcf9CE9+9v7aI+2fPSYVTaPQLEb2FMFru5ciDbYJ1ZL2vbg
         SetCBfYlDe1LPz95cZzrPS/p7rIlp/vMhTqzFODXI0SvGals/Oh06VDxSvff6S/lHrVs
         7FAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768466952; x=1769071752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edU6xkXjAjWZJykGFUAvi4D1HZcCJChoYmvCxl8CEyU=;
        b=YfeVYY36GZWuoHu3abWPSHduncH6IqnvzZuB9ZEwXojl7pzv4sfGdbpUNTyAttWtHi
         diN62tULnMUBOL68V1E5sOCuTddxMq6/w5q3tec3gxP/MdLrPL7o5TAO5hV58ilrAeqx
         yfFtiReZblsVe+AXRAX01+TtCUWMCHqh3GFGsyZ6VumAEpE3zX+T/7vi43g16PZyEBOC
         nLbDDALMnHfiuTGDhia6blqHxSoXY5G1p3lPT2wd49xXj9wTVp5pO6FAVkR7KNkmmfmi
         9If6vBz/XjC2de3eTsVh2nVBSSJkS/uiTbMCu4GUzaBMpaWda8V6xJrHswplsXhkss+d
         Ihlg==
X-Gm-Message-State: AOJu0YzEdSlnYqDmf8a4H8hMImUjtYM5NeHW6MhhjB2IPmzJzsHCinng
	4NFJvJ7CKsbpNbVy9gEx5yPNsiUisJL4d2OJKLAaGEnfD4oEI5qX6WrK
X-Gm-Gg: AY/fxX47gB0rgqEHuXA7//LDWu76YrdJ2etNBV0WO3VZwiTPuKwmc0keb5BKpXya4PY
	DwPxLk4RloZNrxnGh5r1XD1tfb2W5btnJgZMRR+LTWxQvHTvf+UymFAyJRn8HpwB7ITGToH4aW1
	EXaY6apv0iyM0xpYiCYDyKU2sorjz8hVcxSED+RiK+Y6fIwK4jCtHwFIrixrLRJcJgcIu69940P
	mY09PzW5wFpy0w4qdfsrhylX2V1qnNRyFYFRVmTLuivAZpUhCZD83fuS6OJ9HgCzVQkZeq72+wt
	CfGalIbTydJLVhFwcDy04psnWh2V7Ag4WlFJHu6O0RVb89wXSdAKYHYcIaBDGFWxfU8elWMLpn4
	IOjrTGASuBr1OImkqzbUgnCLIt1l+WnRSfsm1QzeHLXxLXfl87N31AqHzURxZeKObp1mSDQNuOT
	3L+9N7CNAlmoWEtOSkM/f0D/I=
X-Received: by 2002:a17:902:e551:b0:2a3:1b33:ae30 with SMTP id d9443c01a7336-2a599e3df46mr45989525ad.51.1768466952287;
        Thu, 15 Jan 2026 00:49:12 -0800 (PST)
Received: from nbai25050028.lan ([2409:4090:807d:4601:625b:d547:cf6b:e854])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2b3asm243846775ad.88.2026.01.15.00.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:49:11 -0800 (PST)
From: Sayantan Nandy <sayantann11@gmail.com>
To: lorenzo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	sayantan.nandy@airoha.com,
	bread.hsu@airoha.com,
	kuldeep.malik@airoha.com,
	aniket.negi@airoha.com,
	rajeev.kumar@airoha.com,
	Sayantan Nandy <sayantann11@gmail.com>
Subject: [PATCH] net: airoha_eth: increase max mtu to 9220 for DSA jumbo frames
Date: Thu, 15 Jan 2026 14:18:37 +0530
Message-ID: <20260115084837.52307-1-sayantann11@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_004913_680524_58B406F7 
X-CRM114-Status: GOOD (  11.06  )
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

The Industry standard for jumbo frame MTU is 9216 bytes. When using DSA
sub-system, an extra 4 byte tag is added to each frame. To allow users
to set the standard 9216-byte MTU via ifconfig,increase AIROHA_MAX_MTU
to 9220 bytes (9216+4).

Signed-off-by: Sayantan Nandy <sayantann11@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index fbbc58133364..20e602d61e61 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -21,7 +21,7 @@
 #define AIROHA_MAX_NUM_IRQ_BANKS	4
 #define AIROHA_MAX_DSA_PORTS		7
 #define AIROHA_MAX_NUM_RSTS		3
-#define AIROHA_MAX_MTU			9216
+#define AIROHA_MAX_MTU			9220
 #define AIROHA_MAX_PACKET_SIZE		2048
 #define AIROHA_NUM_QOS_CHANNELS		4
 #define AIROHA_NUM_QOS_QUEUES		8
-- 
2.43.0


