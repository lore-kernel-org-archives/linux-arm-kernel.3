Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FFEEE6B4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 18:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NTx5jVt3nnO6451xdzF23y8UlccdoPc3a8t65hXHOs=; b=x6I73vL8+4BfQRGAkivieU/MTG
	OE2LabJvga73BHfc9UgzfSmCFTPiHYqBWZ8w89Eso610/adMreMJVnMGZbFTGG8WZUe0eLMsuKSh7
	q8l01fkxXUkEztGx3Z5eG3s7juCvNA5dptV94vyiaLo9REDo81xQLhYKRPVZfYnyrNQkv4CKweaoO
	2xf7Rq8O3StaLH5sZeBsXdoHt/QWOHU/sjHl0/zh3qtfyZGp3OZZH4rLqQsclNnU4sAqCmqQko6oT
	e8p91gzq4Nbf+Ylyynk1TzhQCCOBjR9deuE/4SQWWzTeij13vtpU5lrN2vJ6gaLeps2wTDGOO3m6z
	fSS1Jg9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQKm-0000000Bero-2sQo;
	Fri, 06 Feb 2026 18:13:36 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQKk-0000000Benp-0ApV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 18:13:35 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2b71515d8adso2218436eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 10:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770401613; x=1771006413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NTx5jVt3nnO6451xdzF23y8UlccdoPc3a8t65hXHOs=;
        b=cWVFEpBVKTeZNHCtiSmx+SqsDl636XyEs9gR6TmuHVMzZru35zbE4mjB3GMijDBFcW
         Iw4L+mcFeUvPTuP1LZlM+AJIZC/7UeKAhDu9SGrT+77f2oCJB6tIyXFT8eAvcPemQCDc
         tBo5jKhx2Q0yyIPtqaDrnQwhQ8tvAy/FIUUUxT1Owv2s/5axTVA0+qXq0md/LFJEU3TL
         nzfK47Wojf++9eXQZzkzG3UJtc7V+VwN7IztlhXQpa9373mHqx+xsBO52cVE0Qj0f8eF
         HgED7J1tdVrK7T6rlxjCfyS20Fk9rzdC/x/BWUN+oFjBZKcVeNS0krsrYumfDAKUAVqS
         THiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770401613; x=1771006413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NTx5jVt3nnO6451xdzF23y8UlccdoPc3a8t65hXHOs=;
        b=pDqaDW2QrzDMDggOBOVEExfDIrtoDxfDsNYzQwbTC9WimL1OZqy4qoSYBl6SwwaTsN
         Ozr5NzhLGJH0DakzzhWQcnf2ERInh5K1BCFUcyOVZbFYkUFEclSIRFIijlhILbsjO/RR
         teqxDJBDqfrgFuMyBxSqXrHDYVelv8yTbSCVrjp1Fg7L1x4DPhbiuLndJJ/pDy4AIrwK
         33oyHNNBMQr79pmt/JqXCUFdDMS7vJuHj+SjxivgIa9nmILaSgqF4caixQEF5KecCLB2
         HnGkM3FF8tKBY8PoCN7IXoTAL4c6T/sK528lUwvtpWsPjAF8xuKSm5aaHVMHAkh/Jonw
         eWSw==
X-Forwarded-Encrypted: i=1; AJvYcCXdyMUWmaEa+4qov8G/pIINYNv3FoEWL28CTnsYAwlB+At/5e2Nwns2bqZHnV1n5+eXjWNEuSl0Z4pAMylNt2r6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw765KCShx3J532my/XOnyRPjOwx0OR7u89SPV0CCXaPQbMaM7j
	dr7Gl321+nuzvJYCuch1dBqHKklB2jsZWvi2LhSqXAiSlqCGMAY+W5ZT
X-Gm-Gg: AZuq6aJBz6Qk7Xy1GB3mOHS266WuazX3Kli3k1rb92P46swoPDk6Po+1YOmziEP2N0M
	fb9nOho5uved03Ff5e8VfadOeX9H4WxdbszbZdvyaOsmGFRSMQDwK8nHlEv8DRttvMorohpJIMh
	5TB9zqudh9MIKC/F23l+ThyofSQUIpU1llPfmgl1AvzhLLQ494u8Mxe/XAW313v5QXltWQb+8ax
	4WK78qaK2ewNdEAPSD9JA9/EmmoKRtBVRWqSEi5vP4owMH4Y/PETuxYZsTd6uXwYLOc9CVFQX66
	1ZjSJslFJz0FIV+OIed1jWqLj06AIdxKLkpaduU5Z13DsYmP70FzX9dSEuOet7Zt3BT/Ys8X3mS
	/jUnrcsy2rvXUT8XlTb1TWiDOBNjIcMUzyTznxin3mm0Tde/OFyh4GKW4bZOMZy2gpRLzpiD2y9
	aPyAMil2RuLI/RmO2TaEYqEkMj
X-Received: by 2002:a05:7300:f602:b0:2b8:209d:596c with SMTP id 5a478bee46e88-2b85683104amr1413189eec.29.1770401613072;
        Fri, 06 Feb 2026 10:13:33 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:44a3:2bb7:a035:fd7e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270433ab31sm2782500c88.11.2026.02.06.10.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 10:13:32 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH 04/11] dt-bindings: pinctrl: Add RV1103B pinctrl support
Date: Fri,  6 Feb 2026 15:13:02 -0300
Message-Id: <20260206181309.2696095-5-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206181309.2696095-1-festevam@gmail.com>
References: <20260206181309.2696095-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_101334_098969_950D590D 
X-CRM114-Status: UNSURE (   9.17  )
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

From: Fabio Estevam <festevam@nabladev.com>

Document the compatible string for the RV1103B SoC.

Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 76e607281716..9b3cbeb54fed 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -50,6 +50,7 @@ properties:
       - rockchip,rk3568-pinctrl
       - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
+      - rockchip,rv1103b-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
 
-- 
2.34.1


