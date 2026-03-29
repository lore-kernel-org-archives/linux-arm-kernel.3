Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2ACCFC97EE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 20:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=agUpQ7KTBePLs54BGx3erOStKc7P9lkIakmuRg1PvGo=; b=WCvbIqhMVr8zDuWefgevj3Xydq
	laEpMW/vOewcOzyGanpDG15DNoflOkPNRQEk1/4G4A1nvK8lJJnvu8jYKb+xVIanqQRdbapKZrVyD
	DkKXPoVbmEkXU6g57weD7pUDH8wIvTDt9swqQSFufevvRqMxG2IDa7n+6OKshNKESK2R2hACZxwl2
	wI7Eis0wC3hVvWrfgb0WOju50H7FyEUt8aeaaEdi2r6+nXlUr4t1wP/mWiHR7chBnlnOcHcc7v/qF
	rFoVg0xzsH4aM6UOIFJls8vOCCf96v06oUA8Nc7n7rhYSrbMsUmrrLLhLh4bSywZ3zjoU5VW3Uq5s
	RPlzbp0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6x79-0000000AK3H-2oJo;
	Sun, 29 Mar 2026 20:52:07 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6x77-0000000AK2v-3tgS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 20:52:07 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso2415562a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 13:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774817525; x=1775422325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=agUpQ7KTBePLs54BGx3erOStKc7P9lkIakmuRg1PvGo=;
        b=GK8v5xVqI/rZ43yzAMK/yWnfz3rXIBZxkSnYpplticxeuv6QZxuzh6/iHHQoOzD2dS
         aqplzGuun9WA39z2xzB9EUPhlF/1SH56K0LTW40ra1rM/Eb21QrgInzu7F3MnwiuUEF/
         Ku0B4e/BzeV6tHJLqJuCj6EFU/fEk7UFUX+FupkmkMkrjtew+pQnPYzdRxXTMsrpqEPu
         hSy3upwRrG2R+baVLGwIlG3rVBfh4bncq8cYUmx3JOAne7R8qsyvIG4f4Ai9IphO4OLl
         RisfOXKmbVvB5KH86qt8TT4LmE+Mj8vgtE/GGN0/347aAzmXEll5qqhVxmrvDofgCGyd
         ijyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774817525; x=1775422325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agUpQ7KTBePLs54BGx3erOStKc7P9lkIakmuRg1PvGo=;
        b=XkuPduYZSrrK2CUrOlczfQk5HzRI3X+wYtBRBJx0LeHtnLd5FYCCJRKCCkojO9GJ+1
         o597TIW3ImQ+3j2Hl6mqk0itwovFYXrbTK1Qbg82N09H9Vt4eKYnYmp7Ra6YaNkd4cDa
         UAlgX5wRKXjsGnZ2rlpQlUm8PgecVbkD7o0vG/OL3nZHx5VsuyLIcGPzoFmvzIC30h7Z
         JMQBlVpX2J7OFVUr/Ll6O91O9W7fuKwyu04Gth0D9a+0+6DFBTo753JwSZJb/uGXV71n
         b+obe8GffHThbZnAF8jb3G8tEKB9eTfuLy8xgUS2+OEXzcn54duf4+vmyGYXuoAoB0E/
         bd0w==
X-Forwarded-Encrypted: i=1; AJvYcCVwyEusLm0a+mqhoDzoc5PJwdoMxTfS5lIguwXJoqWdnt0I1ZgD7paQTxBib882IjEhcO2dsfniQecde3ZaCD5c@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp/Ijqs+VMk0HshGncbgiOMDo9/swWG4cluiUL7vxD2otdQ6iz
	tEFtktVvENBPbGNSWB6kYloac2DMKzW9dtA4vQAS+pDBm+H4kTP+640D
X-Gm-Gg: ATEYQzy2Zf+qaEVdPV7nMQwFRiBysmpLFWEE06xRB7Cxj5km9iHZ+WDo+bbVwxFYvIq
	QockSYOW4Gw33FVM7xRgv+6klWEb7mx/riZd3AqClhSiJ45quUGzfd914dHrrY2DWmOozWIwe91
	E/WZo4XdqjKyGJMC5QhtTbWu+3f1ab3Pk8ic3UgXqxvNxyiY+AJT8ocis9Wc8jOPAzq1cEsL3BU
	UBIrA6FLVLyDclfTpPB5mIjEvJpHpNRQO13sxeQJyj8z8nodwOl3twXtOg3ojoE5pUXaPS6KvCl
	NKZb8+R+pjEXcl67JuSrJGX8SahapObxdItrANDPp7w1MIrTcQluWMvaMozht0XW+hJTcpHC1Wo
	YsqHTtEXkNjikDgU6vLpFrL5iYiDL5groYG9lTnXQaE/K2HOT5NmiG2RJbROUQkQAQb4nVTVV1l
	fjAMrzPqcTEGRgM/yQtCZFuK0cYwRp
X-Received: by 2002:a17:90a:649:b0:35d:95eb:8797 with SMTP id 98e67ed59e1d1-35d95eb8a74mr3497270a91.12.1774817524667;
        Sun, 29 Mar 2026 13:52:04 -0700 (PDT)
Received: from snowman ([2401:4900:646d:9af6:7748:701:6c70:4173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d8c500sm10423412a91.10.2026.03.29.13.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 13:52:04 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulli.kroll@googlemail.com,
	linusw@kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v2 0/2] dt-bindings: power: reset: cortina: Convert to DT schema and rename node
Date: Mon, 30 Mar 2026 02:21:49 +0530
Message-ID: <20260329205151.15161-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_135206_005483_807949A4 
X-CRM114-Status: UNSURE (   8.98  )
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

Convert the Cortina Systems Gemini Poweroff Controller bindings to
DT schema and update corresponding dtsi file with new node name

---
Khushal Chitturi (2):
  dt-bindings: power: reset: cortina,gemini-power-controller: convert to
    DT schema
  ARM: dts: gemini: Rename power controller node to gemini-poweroff

 .../cortina,gemini-power-controller.yaml      | 42 +++++++++++++++++++
 .../bindings/power/reset/gemini-poweroff.txt  | 17 --------
 arch/arm/boot/dts/gemini/gemini.dtsi          |  2 +-
 3 files changed, 43 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt

-- 
2.53.0


