Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803C6C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 09:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MfUui9CnzkUm11aexUOZ7jdxIuh9w7zKBILc88SrxCE=; b=i1iwd/d90PPRCrZaHuteST6gaB
	0ZzXRwEtWzcovDoyFWa/daMYnm5rjzpt5D37Sb5jXTB67KacF6CYF/RFdjhvENCORT+1/1dyCjn85
	ShQe9U83xTMjI406TU/FkBTa0ZisWVzy5IVeHexOJWvEsvTcC/LMGJ+dTBaF/PCNc3CfIvoJtd444
	RN6uqm6FeyX2mNO+KUS0QZ3k5F1Z0/6IhTD7A2l9OTEAGNoWEvxR8X83qBY+hBm4Dw7+xIYm9KsPX
	yO+Ab96wjc59MJ2vTvGf7t8QoS6PWY27UTYb/+o9RF7gsQt8s5ohlK8agWG9XLJArP2hJIXQxDnK5
	SM4TAliQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7syP-0000000DWAL-0iMe;
	Thu, 24 Apr 2025 09:34:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sF8-0000000DOmN-29pr
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=MfUui9CnzkUm11aexUOZ7jdxIuh9w7zKBILc88SrxCE=; b=FA35G5lbQDEDQfxoCLoxQ979ms
	wja0mb46/Pt7b5D0x+98Qtkh4hzj3/XZxJf7f1AXzD1XNcX/U6RffrULjpxS5Oksk/NU6HtHDWnVA
	Bpq3ArI2H9h2VzfmGLVrZHeJ+U7Ll+/OQhKlT6gDfPRKAbReNjf5HmHCK+YQIvU1hljosPmfpUIUb
	BsqJ0JwP8KE5VyBFjXb6+MScFY4UaW0+zE5XKHdBhQqEmKxM3QZER//tkp6jQMKhfG053B28bfgn0
	5kUXEs9qGcZZ0zOUnd3xloGroQlqSjrMycz5Ufb6r+n1RBal5rLl06l7R3YvYGITn72uGBrsYAAiC
	sHYGYnEw==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7sF5-0000000Bdqu-06tr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:47:37 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5ded500589aso123511a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484453; x=1746089253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MfUui9CnzkUm11aexUOZ7jdxIuh9w7zKBILc88SrxCE=;
        b=GDxFKwIPXv5RsH1zGzmN3ZBgxpddLvPLKwB0bTfvM57hcv8x5A2C121J/xnPj0h/An
         ixxkAiAyrG/IlYCmCGkg+zywktnKrZDmQK1+EZFY6LFgy4uGpkl1Wo6LZfnpcFvQWzpu
         ttz2BkeV4+bFBITXQtgMbdcCpMkFBYozaODh2899hPBt/m9cI9ZXMoWyxg+ZeO+bMgTQ
         UB8kwp/faIDoWOiFvZQ5FcGRVUG9ajdhYYnuSbCI6egb8zSxdI/FY1zaAv41Y7uJ+0de
         KWtdslVhQGajvkBwKW/I8ryPmRJIOAaMYQzWH1BgTWJfNNMDIIlVwJS2oRiwGzz4cJz4
         r1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484453; x=1746089253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfUui9CnzkUm11aexUOZ7jdxIuh9w7zKBILc88SrxCE=;
        b=DbNAWRxbf0d0U0Z2VQyOmcEALFySXN/k+aVDJ+zGA/IO+t8L8RhTljHh8VIMjowGUa
         ZLP28AdTZCcFyKJTDWT1Uzx2RPEfeUhzoS+fkw/WcVXPJC3cY1HV3/HEp9KTaIUTT6Ss
         h4t/T/NwFi7mHXKPQW6SQKbJaC6NvZ2LqC02lXkptO2UzS3eTH2J1dRxMrOmNsH0mPsR
         CRTabv3XjXVq4qMFwMF6RcG9G+a7cXrfmHPSjipeyPIPESXmK9OIE/rRDN1LnU3XU/Tb
         6JOwHAC/EdPmAeCUlDF7vaDWIRsa99+9iHwMhroyHtRiVVH7JwlP5KIlUpLnXeImQigc
         evog==
X-Forwarded-Encrypted: i=1; AJvYcCUyyWo+qlEWs5+EYQlYTKi/CYDgdg8Av7YM3iGjA8RaVfDiNibvnzz/n4jqk6y+L+91KQ1WZQxmjAFPkj0ZTfFi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6gUyqWGolKPGRy+69vZl69Zq24VVrBZViluw5TbbcYDHwGoW6
	00e5T/L9cGdWtr3vqGVNWvvXjXvf336PvC2wk6wN4XZ94VEofISIkTmZtyA49tsViglJF34AYDy
	x
X-Gm-Gg: ASbGncsOYP2sUxiSYTaXbuYqSOP4MzhL9zWubzDv7Ziw9VWqpWL8R2vFxs8mVkpRnv8
	pR+L8t91hjtJzR87Sx9e96i53vAp+zDORunrRQrEzJdJ3c4i4NVCAN47TefdhaCWkxg/EwTrwJa
	4Vfx/iUF63hPOT/civ5N+rVMjHtSPImRiN/e6IajrmF3fmrEk+krles646pF7sIaMieLEauPfVJ
	DCUgu/RaxJkwEji6EbrveOQ7ZWEupBW3iTrAdTwy67RNnPHEKd9agCYa2bEf6L9wPCOXOedlTCW
	z+SwijPAETN8ykp6PBg8O5mJ6kmrpHxzuT+ahC8uaP8V0CNb1g==
X-Google-Smtp-Source: AGHT+IHLFoX7CwatJ2mbMZsle/jLjUcm5nShwK0CF7ojgyWJgAROD1BSTHdg9v5UKfR1EFXoUy7vkg==
X-Received: by 2002:a05:6402:2111:b0:5de:ce71:badf with SMTP id 4fb4d7f45d1cf-5f6df23404cmr585098a12.6.1745484452651;
        Thu, 24 Apr 2025 01:47:32 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6ed416ceesm810348a12.52.2025.04.24.01.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:47:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: rockchip: Align wifi node name with bindings in CB2
Date: Thu, 24 Apr 2025 10:47:29 +0200
Message-ID: <20250424084729.105182-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_094735_210274_A712D6EE 
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

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  rk3566-bigtreetech-cb2-manta.dtb: sdio-wifi@1: $nodename:0: 'sdio-wifi@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
index a48351471764..e7ba477e75f9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
@@ -775,7 +775,7 @@ &sdmmc1 {
 	rockchip,default-sample-phase = <90>;
 	status = "okay";
 
-	sdio-wifi@1 {
+	wifi@1 {
 		compatible = "brcm,bcm4329-fmac";
 		reg = <1>;
 		interrupt-parent = <&gpio2>;
-- 
2.45.2


