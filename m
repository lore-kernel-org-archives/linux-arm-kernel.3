Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3F2C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 13:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wIfNMsT8O9nvAkQBhkNVejksqz8g55txJ4JLMV7nKWk=; b=drJkT0Vq6x1CeM6YXfjUjBSUI7
	Okjwx/diAkJN+cblSu636smPj6QTm5AW0iE0ZFVIeAF3j1PFd9VxVe7XXecxWtUV1OZpDrMeQL56t
	xUXXbqACe81r2cSnSYgWFuDTHTuQswJF4OUxPtYBCirrWdQsylhCaboLkEf3tsQ20hYetbUb1nuKr
	IU2cvlSW5hCx4MLmhcCPKfB+OJFkD962RNDvproZY17MdCQPvTAHXlrgq32DQWkwGJMu3m23QKTH3
	HejHEjrkBbXvhUZAf/Kgw6XvXo258yeKmFdL4RaNS3Yi6FZXqogJIMzPktayh/TEBannCq2Fcijre
	8ofggXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCI7N-0000000C3R1-1OA1;
	Tue, 06 May 2025 13:13:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFpr-0000000BcWh-3o9C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:47:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso50112035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 03:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746528458; x=1747133258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wIfNMsT8O9nvAkQBhkNVejksqz8g55txJ4JLMV7nKWk=;
        b=ByG9qi5C2T9lVQGtVE9xnPV2Ip3P/RUdYzY9I2jVy40NMBnZyfQDWuEKntfbrLGMa1
         hUanq58AHVEDekncKIX5AEDUiWifo1T61UcZ1Nx3T/xmd+/RvGKHAIFoIK/rCwVj6SAU
         4QE4bxV3IfgQhhbQAzeaYtIIWzkuImwb8bJLbDU+fc16OKZvpezZEITgEW8k1toF+cYU
         yGTai2k33LG9ESBTIeldVJC2akt2tzBSYKeXfNdmxx510QusFbLj2fwjmmIO0p0ZVem7
         j9iMchRcgA81g5yevKHA9J04B2FYew6vi30Iaed/h8j/VzyazojhkXuuXlP1WqcUGL24
         CgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746528458; x=1747133258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIfNMsT8O9nvAkQBhkNVejksqz8g55txJ4JLMV7nKWk=;
        b=w/Ref4a4klEjNab9fFSw+93J1TF3f+bUZ3vQDi43mHnRVU8NC425t5piwDeBPR8D8i
         q6DNakp4qeM8Zvw3k5YQrcFHhI1rlERzNRSmTByi1TzqacLAoMaFQDg6mEbWSWFDn3Gy
         rttyjDsjQ6lpMh3kuJSbemlq12HKSENAG4rwO7mw5gvlmiuR/BnPYnHn2YZBBfB5VNLf
         rjizX0UTvLuNmLOG0/mzd6bfVyd6NRfo2UGMeKx+PCZV52hdu0gGm7VAFDOgfFtgAHhW
         XMPFEm/g4Jtgy7JzcAD26UsSD3IJt+PQzqYI78eKP4S4Xx5HLLsfvIGSmx9XkhHbuS+O
         ii2w==
X-Gm-Message-State: AOJu0YyvoorQxEoww6brrBijjtOBuB8ewaSb01ugkQdX389n4NF/5hGb
	BWPZ7y/uB9CKO2cWDwZSX1ygu9GqsaCMpprrQdXJHaXA5sk6KFw4MsI8gaOlMiE=
X-Gm-Gg: ASbGncthzjSqBaoT1QPSs305BfXuX/IsAcvIGQ2ZCyUGMJDCuoxiW8hZccxMFoHydB/
	O5k+vNUXc0HrYgVD4hlBLOExNa/PHY9nr+2HsRa6gZBp3NzfachXwMPEu7oGd3pwrSAy6rKiSOy
	F+DvQVCrMHlJ4tbYrbzz4r+eGC55ifBxRCkSr8RaHebBsrDSZvH8hIRw0aAeqFIbZBscGYx3KXZ
	QztUxXw2NqCoEbXXRE/IQ09DF1bKPI/yNuIp5C8AE2/+inchWSsgrNxmgSOVq5qA4XiPjB/ShCd
	wD2HVlw+J1WxV0ri7i3uzYsNTW6xvOt3ytU26tOyK0w/FRVRsr5iIlc+7cFeh6n8Wg==
X-Google-Smtp-Source: AGHT+IFbOOi0CwP25W3mb1EecVHcVYg7s1inUJIQOiVSHdAui0pMrHrZ128xfLXxDZ7/qvBJkzaEbg==
X-Received: by 2002:a05:600c:37c3:b0:439:6118:c188 with SMTP id 5b1f17b1804b1-441c48dc55fmr94329725e9.19.1746528458003;
        Tue, 06 May 2025 03:47:38 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:26ec:c7bf:3d4f:d8ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89edfc2sm162391725e9.20.2025.05.06.03.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:47:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the kernel for NFS boot
Date: Tue,  6 May 2025 11:47:31 +0100
Message-ID: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_034739_943737_F0B45ACC 
X-CRM114-Status: GOOD (  13.61  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) to
ensure the Ethernet driver is available early in the boot process. This
is necessary for platforms mounting the root filesystem via NFS, as the
driver must be available before the root filesystem is accessed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
With this change, the Renesas RZ/V2H EVK board can boot from NFS
which has the DWMAC IP.
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2dd75c799848..38d1c2ff3aa9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -379,7 +379,7 @@ CONFIG_SMC91X=y
 CONFIG_SMSC911X=y
 CONFIG_SNI_AVE=y
 CONFIG_SNI_NETSEC=y
-CONFIG_STMMAC_ETH=m
+CONFIG_STMMAC_ETH=y
 CONFIG_DWMAC_MEDIATEK=m
 CONFIG_DWMAC_TEGRA=m
 CONFIG_TI_K3_AM65_CPSW_NUSS=y
-- 
2.49.0


