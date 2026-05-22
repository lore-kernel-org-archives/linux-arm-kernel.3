Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC0DCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4PQwaR5Pu3llNRhqAB+zh6CPiNVALJe9/CtlXd6Tm0=; b=TaNJLS06LYmLHM1VNh125s+RkR
	xv9JoribKQOV7IG/OeOCBPGH2Cxe3XW6qK96Fk6lbLjYt/j1ViqbvUJfGEVkVpuZaLDjd7EzJu9u1
	QHRKOhdlWTC1Y5ICwm7o9AZvGSTltgHL8R7Gk3JLw1eH1IfBDkeIa4RQet3EDRX8ZZhuM2qIyI2bw
	ZwXSmy7poMQcIrGkPZnIGQP/QCp2yIqn9ZLvq8SdJu3CmW90198AL8ZtNAECgapIZIZWdGJGKH0FC
	JxWa80sqcdPmNCXY3MPqvXcJyYdyhfHGPHqN8mDpGh2ZTChuHsRU78au2T5AbBZXWkZfRgIpMheS4
	9zCulbqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMjJ-0000000AQWp-3ESp;
	Fri, 22 May 2026 10:03:45 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMjG-0000000AQSr-0Qne
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:03:44 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-367cbac9cb1so6723975a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 03:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444221; x=1780049021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4PQwaR5Pu3llNRhqAB+zh6CPiNVALJe9/CtlXd6Tm0=;
        b=MxrBLuQRaMVqe6pOtQ5qxCRUr+30lwcUG8SACq7n/RP4Lhot2NpHrNtCb9dzkAnUMl
         ZTB0M65/P/9NMBh8QkGrWb2rI25dcecBnEdN5Lyvw8gD1RGIygYUwSzZHhb6AuCO0iB2
         Sc84PxnXY1sR7y+exFgciVdOLGNExthjD5nu2aZ0GfBmZ3NZapTUs/6pqh96r8YHg/vj
         HahkxPoD4841RpC+c165OUgiF+p6ihgBCnEJ3caI843d5TY9p1Jq6qUN0QYjVpmNx+20
         +i9al9I+8KRC86SvjwgXwmqOQ1/dMRADNZjZPLpG81zwxlDlXUFOTtA/yT9cbAKej57o
         vrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444221; x=1780049021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n4PQwaR5Pu3llNRhqAB+zh6CPiNVALJe9/CtlXd6Tm0=;
        b=VojHPh+tIrUTzZzSzmk8fNmbX+upxB2J7s0pf0p0WfypMf9SzqsNmHkFK2tpVPOI8D
         kSlzTs/ZLaM/RNPLpwhE7Sc5tAN4BfEnICNHGo699obNX3enA6fZjUhMm+zlefAbujdr
         5Knpq2bwL373r+FA6U1ScG+zjYlmbb9LjnungegPVm+9hQ4GxGfp9VhfYfUcA00YEumq
         fzXeSWfrlZtzNlxindFt8XhyW+hoyEVcx1bXHgOywrD37xQ8ogDbLg8Zbybx0M4oVdMj
         65pAWYpJoPX0fhtFRuB5PVRIZ36R3f8ZnO+7ny2KJkA8zVl4a0vQ+bfDZ0gb9Qkg/9/0
         rqKQ==
X-Forwarded-Encrypted: i=1; AFNElJ81F2MCeanTzDWXlqJEX2WyU+b2oBxOCu+TuRrsYxhtKUp9Ma/ZbDhpduXO/NrfXBcUaXDAgCMVm6aOUVixAZj9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1l2Q7mZcTxQyjvZkFQ8tufqN2Zb1TjoIoCDdH/WgjQeX6UrbJ
	0hNAVtyXJg1W6wh/qe+ZObBMnusQ+B4rMMoCCmntM9J/6jhdro3046eS
X-Gm-Gg: Acq92OFWLThMphQJyh52pBou7Dh4RnDMyLzuWbzoYAFjaXsVht+97qxKgY61BTimuvh
	z0g7EeRVhKVMRu2js+Lrsg7J+1Ve3sbFkBdh3UIJvEX62BIelRxZdh/a7+kp05785KEQQLOJZB5
	cQULMc+mMQMfr/HSKEPsPGjV5zsDnyc0iHScRwlsprScWfzdjEcKFl4a0z3LFdiFk5XjWAUG2X1
	5OSLsAPbqnXblGVsVrOgWPXooUt4KczeyfWV4ApKHdn32sddfsh5LsyNQljeowDysTFe/IdJ5Ga
	dq6TiulwZhMhmCOOSBdw+inCzsLZ4Rz41u/vTLVb3qNCR1Zbe2WvziOFp+Cj6ao0dSrfou58Ul2
	I/vgjlQRc+YWCT8sKLuR/GxbRkbIj/H+g2GsyacQBNUQgaUHNN2oW4Njk5aWsSeDZn5rS8IzYao
	OuxNP5gC7Nb/DrZS02q/u+NwFBr96GdgkJRPZVwH/pVkUZZqzV8139X4s8CA==
X-Received: by 2002:a17:902:ce92:b0:2b9:7ad1:bf2b with SMTP id d9443c01a7336-2beb06924e5mr33628175ad.29.1779444221237;
        Fri, 22 May 2026 03:03:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm18683455ad.36.2026.05.22.03.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:03:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: dt-bindings: rockchip-spdif: Correct SPDIF clock descriptions
Date: Fri, 22 May 2026 17:03:16 +0700
Message-ID: <20260522100318.73474-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522100318.73474-1-phucduc.bui@gmail.com>
References: <20260522100318.73474-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_030342_141541_617737E2 
X-CRM114-Status: GOOD (  11.55  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

The clock descriptions are currently swapped relative to the
clock names used by the driver.

Update the binding descriptions to match the actual clock
usage, where 'mclk' is the controller clock and 'hclk' is
the bus clock.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
index 502907dd28b3..b174d7498029 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -45,8 +45,8 @@ properties:
 
   clocks:
     items:
-      - description: clock for SPDIF bus
       - description: clock for SPDIF controller
+      - description: clock for SPDIF bus
 
   clock-names:
     items:
-- 
2.43.0


