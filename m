Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90331CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 02:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=; b=pZVBNBHlyblqUnt7TCtU/aMXLv
	I9ICgz1otTvNByH2qlseAIGx79gF1NHWQ2RXClPaET7jUVXRQM587fHa0CRA0HVZjq/sLQDiRHWac
	q6TtXROMQR+wGVCUlbOF5NpNrdyN6d70WnhrWcUM0uvbS7s+n8dAvlebB5LKG50yEWkRxwMfvjTaZ
	qcx8Usv5UuTiC5ewV8jShOos6uzK/KKDVWS8ln2iQokMqOlkLKLMmgPfdtXgd+0t3aL8dDewC/YtY
	MKLnuRALLyTRPpGZv9jFKnryfYGrG+FLtLE+FnRCnI19HCRmlYwJhIGpl68uNRS2ic1/11rG0JyTp
	GQxp95AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC6TT-00000007bVM-2Wud;
	Thu, 01 Oct 2026 02:24:43 +0000
Received: from mail-pj2-x25.google.com ([2607:f8b0:4864:39::25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC6TN-00000007bUI-08Ij
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 02:24:38 +0000
Received: by mail-pj2-x25.google.com with SMTP id d9443c01a7336-2e2e688de2eso10346605ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 19:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821476; x=1791426276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=;
        b=oP9H+VW6Hq8C1ecR9y0OJlgihOV0nRqYSCVz90X9jt/oZRxaPLy/LxKhGLc8oRvLEy
         Z+TIBzhWzzHwEJu/r20GL2tI4b+pc/EixiHkOrJoFWsUy8DfAM8Coe6t1atANKQMIP+o
         ExTTBuvQ3VozJw7xFhjQLufIpbdujP/NNYxZXTvQpSzwVuWWb6ADHXtLraViPzwmxvWZ
         oCN2SI5DHpmC+61lh9wt/nFsrp+Zt2Dg6RsT+/RwQTJcBWx3QHSk9jBrxkXiLns/0OY4
         vuMjsnCs7eJt8BblPyQ/sAncvWShkcqAe74C0tYDjMRXj7c+LWbTfHT4HrqpkG4hEvRJ
         dJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821476; x=1791426276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=;
        b=GMZObdiqa6o93DOSGjpyxjVl8NBTEXu389OAti2NkV0lmfPMky4C12j2rnR8ZBYNSP
         QK2CPQFrYxEzFxQENM37XMETlugVjn8xaFzo02DNdonIjRI9+hX1lELh6CC4eVtRP2vo
         YFr5ppVvCgn4k8QiVoqWNnR4pcMuEIzdM05ZDkUFXdvi1dsnMgT5SAEo1JSHxRTnF2Jd
         2ctPf0mK83OCN0qnX8Dj0htVsUPuo5h1mPCmgO31dvi0vLPTdkl2ZX4RlwnPUewcV9zh
         f5ISyOE8mYlG6+ctMcmutSQ2F2SyirEmrmcJ8Sqa+bO1Gsz3zaOeKhUGVh9PUlWJKrRc
         SwFQ==
X-Forwarded-Encrypted: i=1; AKwUvByf2IKLABvypwrxp2DM373yV3V4hWfC8kt3iBmgklt2xvs/MaH8OnsKryyh4KfK2mmG//1NzBGG4o7xZwdu3YB1@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6JV+GptINOoHD1I/KshrUjtTEOoQBE2WBHeOwv98XIZdrq0Rr
	NDkpyQc5ivQLHw8xgQqbq8MmY+0yo/2t33tnFWQ1uCivvOn3nqLcOfKz
X-Gm-Gg: AYBFou1Sp3zvRDzjpODVlzGMprPoY0s07oI7fj8KHpnGQ1j7hR7HMICBGjJYgMofQFM
	TqxyHbJk2ShxLqm7zHppquAM8dDgTfIs/55gmLrMlK3g+yy50XQzl4D9StB+hYYr61mSiw84BGc
	i4VoNm1YB4t/KKnzdAQmTBVWb63Q833L+3fSBnwILK00JqE9p4hD2BXvRUZjGDPO5yz2m1cAhXN
	oFBg7hBdKWVFSQ4O212x+OXmPaRNHukoUoFSAOJHZkvE2pAjQoJ6W/rwHPUHxEQJ/+56ykt2PtT
	QiG/fzS6AkmIJDZByEdQd/FuiQlyQJeVDZ6+nrAkVw3pz130ABj/minENGbTY1QwoaFPyPIhIsn
	0p2t+h9IppNIDpOhsLFd/rnvq8HaTl7LUxguAu/7EWgecxoyci361iSboLy4LUocMi1QRSzcTSS
	F7t4i2WPK6CRLphUdexQL0y/LF3+EXh3uVlv0xhZ2W9b7bVEJhxoQ2ELcN6eQgJA==
X-Received: by 2002:a17:90b:53cf:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3a4d1524695mr2745133a91.15.1790821476030;
        Wed, 30 Sep 2026 19:24:36 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm2153230a91.2.2026.09.30.19.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:24:35 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
Date: Thu,  1 Oct 2026 10:24:12 +0800
Message-ID: <20261001022415.913959-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001022415.913959-1-iuncuim@gmail.com>
References: <20261001022415.913959-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_192437_073288_ABFAF166 
X-CRM114-Status: UNSURE (   9.42  )
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

Teclast is a Chinese consumer-electronics brand. Add its vendor prefix
so that board compatible strings can use it.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..c7c2fcd37 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1694,6 +1694,8 @@ patternProperties:
     description: Techvision Intelligent Technology Co., Ltd
   "^techwell,.*":
     description: Techwell, Inc.
+  "^teclast,.*":
+    description: Guangzhou Shangke Information Technology Co., Ltd.
   "^teejet,.*":
     description: TeeJet
   "^teltonika,.*":
-- 
2.55.0


