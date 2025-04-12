Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08669C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 19:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DYEHzBb/el9AoD7D2FT1/1Eq0yjWyE2cC1Wk1nSVLpA=; b=10YCdxafje68srLG+1/waq/PJJ
	tDEaxW2iT+GxaQl2DmUTIxJTLaeLHE3KVGE0Il0NwhK+/dUS41yuurIP1/FLAqFQaOWJdv94GQw6i
	fJrJuFiRtTG924jbgal8N5mD0nb53u4RrZvfvJ7Dg7+f6tNEg9F7wLu04CCg4oPur4qh+JMewayja
	uJM/y5Jt8WtnJXBAwqOF7+B78bSPGwk/ehgBTYG6c8XNnoeC8SAUaNyO+P//Kz2WRSwG4DQD+ZRxG
	XEzl6j7rr8xfvazp1lTPJ3nSdVljQNKRywum/zHjkYJeuQNNP/aAAgj2Ny0E0vSj1kUY/53rt9a+A
	/yY+270A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3gh8-0000000GLrz-2Wwv;
	Sat, 12 Apr 2025 19:39:14 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3gfI-0000000GLjW-29iC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 19:37:21 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6eaf348103cso4475856d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Apr 2025 12:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744486639; x=1745091439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DYEHzBb/el9AoD7D2FT1/1Eq0yjWyE2cC1Wk1nSVLpA=;
        b=l4UyQZBcSyKUod93DlbAQVwXDH9J/aiFWB31DnTd5JICmEgaJ1uMyka57kVd3Bvq9t
         g6d3Yz1PLLKfjWJ3/UB7IloibuhyObzwihe3tQT7eXpjSfSMBHjVnPxe8zjITV51sb18
         nSXnfKdJSchORi/omVMCPSgaeSb78DqV1plPnmkpZaJxthirEY76AE2Jvq4/6BQCeanC
         rGJJ6j1Gcy1uH3ghdvcxo1iSBLGX1V1tyAUNRpujj0aqv8W8FTfTup+IUJ68IwvDL7ll
         yBn1TV4lcGhMBZffVf1tBiF3WbOZCLIA4kiPJNMIpRhYzF9BYEQFBSjz7Man+lx5L3sR
         eUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744486639; x=1745091439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYEHzBb/el9AoD7D2FT1/1Eq0yjWyE2cC1Wk1nSVLpA=;
        b=CN4Cl155+9RqIuBEOvdMfllhTmSipXRfOfDNc/1AxlCb0TtWXrU2XroUpPcKN9MgVk
         qHcVotxp1EGs1EbtVH7e4AIUWlYWzjDZ+LdwV2rqHGfmZnjmV0pTYe+noP5LGERQm9Ga
         rAbgK/KJdUhkU4OK9YYO5zBGG9xoK1vLiEKMcmxZbE2CVdFau65L531UzXinBgQTNMOg
         qs4kMkg09Ih7CbJzuyZg/Ei0PyVZUmtGphN8WeRo8sQSSZuuc/h++JKcJfw2mTvzWVq6
         f/57al8owH+pIksrFZcB8qctwjZrT/l6s9LDnnq9eBe9D2ezXQd/XY5yN48Y1YUOsTIT
         bIOQ==
X-Gm-Message-State: AOJu0YwgyyisgAXoQSE3U0HsjGjpdevr11WIiOTZVcb0Qsc8FJwjb+HT
	7zKQRc+pSlM4wTWZmVMpO71CYc6Mf5z+SUFoD+wdzWt7uNEI67U=
X-Gm-Gg: ASbGncvH2HWUQvEZGcXX7Wk3T171QqB5tONekYGo7h+u0PLnbIGhnmxdvazYVjSFGY6
	Le7DGCw4gryb61a+GyIHTOK2sskNsffHA8uzBr3ZoBD51GpjUPMr+JlLpp71+tnJOKq6BoY0+Px
	/djUgqVTVDWSkEH241Qz7gNJD6Wud/CScI4AqUcMg1/7csT97wqMkzaZMI0pd945PyjHMLq+WOE
	mIVdy2bEyKYVU1zoFSAn0f5rfI72sh4NZzXUMF8tWyMitL2mUK3i3wDHpoff3WBNfi/rcQdCTjl
	oIIwhJ45ruhVVFVZucmU0immq/asjOP1Slge/Q==
X-Google-Smtp-Source: AGHT+IG+dK1CyZ/ZjXMnHu8ljlvkEeDsfaduxQ7Cw8m+w5ILm1RgkP22YLpdG7M9YRi1DdAeyJKPsw==
X-Received: by 2002:a05:622a:490:b0:474:e996:197a with SMTP id d75a77b69052e-47978fd6eddmr34349551cf.10.1744486639099;
        Sat, 12 Apr 2025 12:37:19 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47983d782ebsm11797151cf.9.2025.04.12.12.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 12:37:18 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: vz@mleia.com,
	andi.shyti@kernel.org,
	wsa@kernel.org,
	manabian@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] i2c: lpc2k: Add check for clk_enable()
Date: Sat, 12 Apr 2025 14:37:13 -0500
Message-Id: <20250412193713.105838-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_123720_553968_60249C7E 
X-CRM114-Status: GOOD (  11.92  )
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

Add check for the return value of clk_enable() to catch
the potential error.

This is similar to the commit 8332e6670997
("spi: zynq-qspi: Add check for clk_enable()").

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 3f9c37a0c9a5 ("i2c: lpc2k: add driver")
---
 drivers/i2c/busses/i2c-lpc2k.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index 6943a0de860a..ccd13c4fb83e 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -442,8 +442,13 @@ static int i2c_lpc2k_suspend(struct device *dev)
 static int i2c_lpc2k_resume(struct device *dev)
 {
 	struct lpc2k_i2c *i2c = dev_get_drvdata(dev);
+	int ret;
 
-	clk_enable(i2c->clk);
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock.\n");
+		return ret;
+	}
 	i2c_lpc2k_reset(i2c);
 
 	return 0;
-- 
2.34.1


