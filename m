Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80618C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=; b=aSBsrgG7UTMMVtrGt7lWlOcq1p
	a55/6IckjzhOQGckyQhzXDdcf67YTmQ1J5d1+W0t/mRzrNQX+OYNKtXuLBxtT6DsWBIIvLzP1ML8H
	8aQK2FiCTSoajZBlxxZ5PsuxqyMsitoa5svSCcNp7p7hVrDuEnit0Kp3JkbEbLBCNEqXVggl2k0RM
	fNUU1Lqb/v82fUFKfCgsL4enev5pwYnsqVPz81pAxrKmKw3M6Oy6guMwwec5Au6ssHiO6Nozu9u9C
	YqhtQB1TY0D6vwbV9WFq1DEMpSqNnEdCeWQfzlWEEt43Y6BkwDPG+iOmUadHXU3ZEiHP5QEjlx9sS
	Rv7RvtwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7brM-0000000F6Fk-3adA;
	Fri, 18 Sep 2026 16:54:49 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7brK-0000000F6E9-1znt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:54:47 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so405092a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750485; x=1790355285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=;
        b=RW9WVFPJVlyKRK7dP0NoqLpUw9weT272MJjil82SyPJ+u0+oJD61DKsvH3vLyq5ngG
         Etix3kqngApFZ7glj5ZDyoheueExm0Kpv38NuLj8woJydNxYPkfFFUaQxm8/YvmgKbmT
         VSaZbMfSNkNRhyB2xzMtuVasPqhTwF+b5OwpAJxIGAFd6Gnjsr1euloxg12bCfcbmrkJ
         18A7i3U/Pcdt5naAYIjX/Y2UOjW3CYAyHna90zpT0f2z2a7xYxm6u9FSHVeE4Etpt1zP
         +O9TB5vh9hrc2+e2CSS2wj2XVhhqdO+RzP5UUf7TByLnUBKHXLLu5qchDR34mvFEyNgP
         K6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750485; x=1790355285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=;
        b=XiPRdqhyPJV1qU7Jrhw7+SGkC/0zBmDiwz2LiSQO/WLDOTsS5s3gFqESzi67+XhHHW
         m6wAoSy9KGw5thbCvfQdwfZQlN0hU9ETUtoI8y30E6rHMtwsZJNq2YogblnGJCyxl/C1
         /DWZTtocTt6LRyiAonknOQ1aUErXfSWeJzCJCsRdvQl77m/69+0vGQ9H81ZsAYZ6dMGR
         r+IWEeeNy+yAk5y59RfQO7ljQ4Q7bb8Ntj1ZUCFGJcxeazkFjN6tNoGlAMzpMcH/pUJi
         CcmB/uA5eGPbrYcCyClzLf4QvvrHMcfS31NjjK1PyiimBOzqo+mUOUJS5e1vG0Sc7ujM
         Dc0g==
X-Forwarded-Encrypted: i=1; AKwUvBxwyFT/8xJPzW9i3AeHZbr4SXHEQpskHWR9x88vOzBTTyLKefkDbzIAqDr+BzIvYhkZb3MjeDekC+/at6tkJHdK@lists.infradead.org
X-Gm-Message-State: AFuF++kJCb4N6xVk1oyltUrfMTJBH1fcCs8ToXBZ46cPt40Ix+7fu/js
	7jPfnNFATfN1QCkKjwtI3P+anet+LibhNu2IRzNSBwmkSAXtyiSkETyN
X-Gm-Gg: AYBFou1/F7t75NQsXlIPg5/nQ2LCOPBZ2jsRbkwb2ZO+fkSnavTPeq5ixbjclI+99Cc
	E5Q+fP4LCpMrQwi//H6bPk7cClOG3jZTya22paVyUZdQse4tDQyGc+q9Onxlqw71CnZspylAIb7
	MkCrN2s92slLOnThOQzl4YAn7haat9IXE1a3BJwK+AJ3y4VK3oiLPCF9Wbes28xV/FgSxUMK1gS
	F6SQ0QrxVHCL15XfHk0XllGGqL+FDen0nY010zJnqsDv1psVW6FmFyoJh4pifU8x9BmUtO5D3ff
	l2MFWsu5VMDWYhtMlSJGjmcMLKkc8KP63yZpe6gj2Bm5UeqlVskgvaXRNdOXV3iH9AQHSpG1sCe
	hJoNpU81MIUy18TKY0Pkx1gRD5DVPsPiYnHfgBaZbBKU6cBinD+AF8z1dPe/0zpPxAYfhCB2tIe
	9BtqNdfbFFwND+GVQkUrNHEF/zPMRNlqfuPen0sRMlQBFzdyrXCgqdvMZ+x6VAtk9Xpkh2Ar+zJ
	g==
X-Received: by 2002:a17:90b:534d:b0:39e:6c68:fd8d with SMTP id 98e67ed59e1d1-39e6c68ff21mr213045a91.34.1789750485331;
        Fri, 18 Sep 2026 09:54:45 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm240270a91.13.2026.09.18.09.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:54:45 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 2/4] dt-bindings: arm: sunxi: Add Teclast P85T tablet
Date: Sat, 19 Sep 2026 00:54:12 +0800
Message-ID: <20260918165414.1129076-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918165414.1129076-1-iuncuim@gmail.com>
References: <20260918165414.1129076-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_095446_514723_FF0DF983 
X-CRM114-Status: GOOD (  10.22  )
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

Document the compatible for the Teclast P85T tablet, which is based on
the Allwinner A523 SoC.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c6..b9c2268fe 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -933,6 +933,11 @@ properties:
           - const: tbs-biometrics,a711
           - const: allwinner,sun8i-a83t
 
+      - description: Teclast P85T
+        items:
+          - const: teclast,p85t
+          - const: allwinner,sun55i-a523
+
       - description: Topwise A721 Tablet
         items:
           - const: topwise,a721
-- 
2.55.0


