Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0DFD10C11
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b4+yraJweQxiypTwgt/zZDRzjUUkz2XRIrNoNkRuEaw=; b=o+zf5eJggQ5gO54J7iax4jkthe
	W2ppb2LN/lEcuo0WJbANV+nZ/Q9jkx9izrYZxvHfxT2a5yjeeAUOlPIfLhoovtObOPD6vqzK+/vLn
	j/Yz2CLlMvu+r+HVLKlEt1fplOtqIR+pCbJKcfUFv/zXJQSvdgEp000OjXjrs4px3VtTOfI8SImGP
	Bu4sN5hptAiwXObrvZkIvdggg++ZRXZBe3qzaxdfjSGzs8M1pTUKz5PMZxIPp5Tq2iwdcKFUS/Cez
	K4D+thdpjZZAbGJg8LBfaR9DSEjebIySMKphrX4fO8f0MufBglpnPo8eV+sinv75ahjLwuu+o5Egz
	DkHzvXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PEC-0000000AqBe-061S;
	Mon, 28 Oct 2024 12:52:12 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5P7f-0000000AoWK-3xKP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 12:45:29 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7205b6f51f3so2001012b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 05:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730119527; x=1730724327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b4+yraJweQxiypTwgt/zZDRzjUUkz2XRIrNoNkRuEaw=;
        b=NGL86oPaOT8oHWsxDLi19bgmBFDM5SO1Pmf4s46jlK1HVM75JoYWDQZDaIWCuixbOI
         zciT9Ef7c+a4zXSRD1sk334nujq7eQEDdcxXpupUhHjV0eMKRZoSTbhl4jqU5GVS72jN
         FDm6BMVGI/uPEzLic7ip4eVFjL3ePKZd5bYV+ZMuv8tkVXhRpv4zMfojQKTohEE1kki0
         yPPQ7xW9AtliOnUPIjMTgQaxG61kmHs8iuQJiV7ZIL845hP4INSyME2wI/25UDKI+68c
         6JVLUTIeiGPfURc9L7OoCYxDJoy6UH1oSGJvU/wweks0696HpGdLGbgyXk+rjNBwLikw
         da6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730119527; x=1730724327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4+yraJweQxiypTwgt/zZDRzjUUkz2XRIrNoNkRuEaw=;
        b=Wik+d5TKERjbf10ZR8sGEQxsnOvKGiEHwqm+5pwcbkKZyGzrFvJSvuFfvX5sEihb4O
         2WV1Z9xOICvcR+8hrXCZPgodbCdMGJoquiPGi+dwQHqVl9vM/oKBEQAZ+TCYeuDbco1s
         rK0Dyq4PVNGWWvLybRQvI5ZDYsmsI+6T9DNSW6mjLIf3Iy/0csoMHunmBY7uwIPAOugk
         ccHraSjO1NfzBl8b4xqmerKivgugGhER1gANnp0RUEKjtVgFRB98EDY+oeEq4VxGmIqa
         x9Aw3UtHuC5NGEKOGnXm+ROLXYXu0xDDhaK7WzGalFbl2s7oz4bYjoEPe7Tljc6e0L9L
         M2+w==
X-Forwarded-Encrypted: i=1; AJvYcCVpYlZMEKPMf+HHimdxrxiJxq1Z9O2UneKk6i7SiTLQgLRCy9BSVaUtqtK1ppu08qW3r1afrBDCV/x3DozHkVaY@lists.infradead.org
X-Gm-Message-State: AOJu0YxIf1IPh6wfspEu03V744ZMppG63CAKAoX4XuYh347DXvV8AZoz
	2UVWkSDVrEg7chUF/0rFVLPVRHg8MJ40NrWTI2/CcuPs5Ezx0VzD
X-Google-Smtp-Source: AGHT+IG4sdSjIEoJgKuJMhieAf+RDBF2IIEmvJ3Njvg+7TW5xtuV5KFh2xBO8zd/zHrDDA/Wwztq+A==
X-Received: by 2002:a05:6a00:9a4:b0:71e:19a:c48b with SMTP id d2e1a72fcca58-7206303657dmr12667155b3a.22.1730119526671;
        Mon, 28 Oct 2024 05:45:26 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:325c:8d87:ee5c:f04e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a1fe5fsm5638823b3a.160.2024.10.28.05.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 05:45:26 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: power: fsl,imx-gpc: Document fsl,imx6sll-gpc
Date: Mon, 28 Oct 2024 09:45:18 -0300
Message-Id: <20241028124518.72576-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_054528_013475_95EDBA9D 
X-CRM114-Status: UNSURE (   8.90  )
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

From: Fabio Estevam <festevam@denx.de>

Document the existing fsl,imx6sll-gpc compatible used with fsl,imx6q-gpc
fallback.

This fixes the following dt-schema warning:

['fsl,imx6sll-gpc', 'fsl,imx6q-gpc'] is too long

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml b/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
index c21a66422d4f..9de3fe73c1eb 100644
--- a/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
+++ b/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
@@ -30,6 +30,7 @@ properties:
           - enum:
               - fsl,imx6qp-gpc
               - fsl,imx6sl-gpc
+              - fsl,imx6sll-gpc
               - fsl,imx6sx-gpc
               - fsl,imx6ul-gpc
           - const: fsl,imx6q-gpc
-- 
2.34.1


