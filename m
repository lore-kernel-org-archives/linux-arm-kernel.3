Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50898CA9EC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JExfj/tGlMkKcgsuSdq+eQx1ckrlan0UXArxeYkCT0=; b=OrowO8wLN9lmnyXu9iagEH8isD
	qgd3zOhSjQGtn8pnYGAd5tU0IevqWLj/JwPdR6MhRUvNF4qOFp82sfMtFwsrAK55J7LL96DDM/OuH
	1XY2SLik2SYbOdee6jtTXNBpXo9SQ6eoGCcWziiMAjCZE4wgn6fGCTFEvEFzq5WAYhmRiFqHDFHp+
	MJtrKv+SHnQpBlGh89Kelivlv4GXethtUIFERCsLVgy6MEl0yxCr/Wnkl97oeEAs9Ial7QONovo22
	U04/9E+ukfr4srrAvpqxq/xual4HqDJHbGaTHvcerBDBhjktO+9Th2XW21rjrxT7r2ktjVMqQc6SV
	h/0VIhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWh3-000000083Ru-0doh;
	Sat, 10 Oct 2026 13:00:53 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgs-000000083HI-2i8s
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:43 +0000
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso1741751f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637240; x=1792242040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2JExfj/tGlMkKcgsuSdq+eQx1ckrlan0UXArxeYkCT0=;
        b=ekxqn9R2scl8P5mYjIhlh1E6pyjIKqGWjM405PGPBGX2EpCuyB/4RlklpyDtvSGmaN
         skfkmwNm09cOGmGvCXzXCyi9gZgSDT4AUpCULnqFD8+jSZ1kUih2y0/y8gUO8/WhgdPI
         knjyTYJLo4/b773yAr97fCMx+ltCXaQkVfkqzBtHS8kBHFfetTvESG8VKfor1ahecvP6
         fIAOaAs+BNJSJOPw6nuZb8KGHnfxgWS9BVWkNgk8ekRfuXYng6tHAT+PuU/m/Fq0lcb5
         EgyfZ14gGR+GRQCXaLrMc3pas/BN35c0RVb+n6D5GTNm8ys8lFU8Zgxs0qBDRjQ4F9P3
         WDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637240; x=1792242040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2JExfj/tGlMkKcgsuSdq+eQx1ckrlan0UXArxeYkCT0=;
        b=stPmSTkloEEQsvBHNeGeIxy2l0DiHP39VR+pwxckRcypMcgzqemKNDiYlKxwmqQygS
         DPrDN9HAius0FYQDSptOxltmT60CAEJRvzH3ZPmOn2BU9u7JPVWHSjEPyRoW110byl6g
         zOuyph9yCL5/kLDVq6XHsDqplF0Q4SORwpAXmqttAK0ZTRcQNt+xZ+4nLAdT4wtYxTUY
         aceEKGhzGDVMO1IR2iwy7NszDDPTig8ZMPD+l4Cy9ZpAFUhSijqIsY9Se0S1RUk4cX0q
         Yll8HlYK54no2tKifOG1XTy7Jc9+X+mslGOerOWmOThBeCoyzOhkZsEEIsp56nyenTmD
         q1AQ==
X-Gm-Message-State: AFq9FYJHbEgg6wIIvZUuJU5SkBTOk3d36FUsu5DyQBW0jiiVnKwCfCIJ
	XxtlvWERdl+3WxzQH3aXtIzlQWlMiz2Qt5zVJ55fSLeU668mQ1M2n7K6XWSlVFB1GswKvg==
X-Gm-Gg: AYBFou2vPfL8uUTnhx4XtCW3R3aNUShGWEK25nuG+KE4X6UxyuMcXOTAUEsTughOTAO
	MAJqc5vJ3qq+iuUtgELv8Eh7R7oH25LSttbl7ofwHJIOIfHC/lY4gl5xEsDFAThBknUajzL+hwM
	80nBPcpGEQpQljaHBvxrLMyR461ccleGCvK5J8xM1b270+8/zk618+JHaFKF0rlJy2Kb4pMAtsp
	3R79jCQ5mARwRxTMTy3XEHe6um9zWSUb41QChkgYBbQEGVdNkq3ErHPvtK7pwdtNZpj2luRNtfl
	Y+8gwK9ic/6S5P2clRdrYybdIX2/fHlxvNc4yN41L1AWXrKmOcNNGqojRqBMF+yO2crlOVwsIHA
	iQyGtHPezw9d0vv960A87m3bWb2eP9rNNwHjpo9t8Iw+VsBwFEx1YhpkPV0hsVLbsEMfr/VMmxl
	wdpSnxIrWmILlucprt0EdXWgTszVyae6FhBFv0deYgbUJgVd5memHcbSyxiiLxioa8E0ewxRl+Q
	GhsUbZ2G3A7LNTnIQpjizjudyJoch7eo3GJDEHZD19U5q5atAhhv+Wspi3RQlzHSKB0oqEmUVFR
	Lz4w3GH3/RLIVWlrAGDkmmK26Gj7Ljy96YTqBtktiXyUTlU5peRJIWv0crLziSglu84fY/1z
X-Received: by 2002:a05:600c:620d:b0:4a1:8d46:6235 with SMTP id 5b1f17b1804b1-4a18e483d48mr88612985e9.3.1791637240254;
        Sat, 10 Oct 2026 06:00:40 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:39 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 11/24] dt-bindings: mfd: syscon: Add ZX279128S system controller
Date: Sat, 10 Oct 2026 13:59:49 +0100
Message-ID: <20261010130024.177503-12-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060042_702704_FE98EB7E 
X-CRM114-Status: UNSURE (   9.40  )
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

Describe the remaining system-control syscon. PCIe clock/reset/PHY
modeling is explicitly a review question.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 945a168b61..cc0eb377ec 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -132,6 +132,7 @@ properties:
               - ti,j784s4-acspcie-proxy-ctrl
               - ti,j784s4-pcie-ctrl
               - ti,keystone-pllctrl
+              - zte,zx279128s-crm2
           - const: syscon
       - items:
           - enum:
-- 
2.55.0


