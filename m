Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA36CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 15:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+ee3KqA2yzD2P8W3Se92HTLPVHTZnMBaNq34xZJiVY=; b=VVVJUCsiS02ojBp+EktxjtKbx9
	Q26sPE5e3PhVJKh+IyxL57W7qNv8ZrNXEcNmiB86svncL8cYsyF53Rm6T4KH0lHpFqTDFbCyn/VMu
	HN5zXGFz8wb3qBTFGXIPlufUtRMvxypMsIUOyxAj8FCGyA5aAhVKWtFCnNAjhvLSXInQ8GwiclADs
	pyNlSMl5sr7AHiV50Gpkw2Uo9FcIOYqEGjQFLqPb0SAVpZtlsnanLxDD60ZgxTvnEiVHZTI8kWL/l
	eVg0zG8N/TGUi5ujXuide8ydE149lh+YHrIi3ueLmPKDeBj8rW2vBva4RG/qounQRNIV0i5hGnGcS
	izfn028A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD2IT-0000000CTpb-1fam;
	Sun, 26 Oct 2025 15:04:41 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD2IQ-0000000CTnj-1DiB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 15:04:40 +0000
Received: by mail-pg1-x542.google.com with SMTP id 41be03b00d2f7-b6cee846998so2511726a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 08:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761491077; x=1762095877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+ee3KqA2yzD2P8W3Se92HTLPVHTZnMBaNq34xZJiVY=;
        b=X6Ne4SHSZjKOvY2zyBcGDHpcEdtHMi3dRWGZNycvvW+5CfN3vF/HbGKKLFShTTVaOE
         DEp5sd8OBGy9ZWGi5xmVGeEPgunZsTirU/KMYlpp+EjTvJRK9zAMV352nUp7nrgAfNCs
         4H9gFOJS85MgPstQlcs4+GI7xXeQOGskSsj3EOw04o9QOUFMsX0gZPIuVWUIIJThv7Gm
         8Czb4zMNhDFm2KcYyUk4gyj4S730iYOfO5ilBmeYGZXfffah3TBj16tc54TrB7kJrQxM
         /2+1aEi29nulHvDiGg23TgmLa9js3P8C7dcyb0PPwGbLi1SKEGxW1uGJPGTToptneh8B
         qVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761491077; x=1762095877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+ee3KqA2yzD2P8W3Se92HTLPVHTZnMBaNq34xZJiVY=;
        b=eRuWlbdf+IH9m7GMOpvVzyGYgaHb+3zDX5a3+5jgNm+25AZtRv5wSb+IXrHDaK8ycI
         ndYTI5Y7qJI+7L5bs/sBQLdm7V9NuYbz9Yrv1FkUR6HLWNAFmBAoq1UuCgh6JHEDs8wi
         DULH3/xPMI6r1Ll7N4gXztzo2ywayRBVp3IDJQJkTjMk+saMSUkqUjbiJR+I3WiGrSz+
         SennFga8oWCqyXZ2Fy/dzB8pEFK+iQTvp5OfutRRU5wqx8DxPTSbRlDMuuI/SoMZw6Et
         R95MdmsPqRAiCWSpGK2aJhPyPK1DBsqAOvaqKN9OIZiIlSJBkFD+U0I553Nb2m4jK3PM
         /WuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZNwsiX4Q+KpmKJytgVQlPVXOFDB7WB0FIjlywE8KaaZFc0fwhdxkePPiBmyqzYt5Zd2VWtFxRCOcZupwJnvAK@lists.infradead.org
X-Gm-Message-State: AOJu0YyuCpHTHLIe2O0MjixAWg2Uo4VdsJv4i4s+z5IWLZXd7LdvbynW
	R51sutA9aL2gP774uLnPD+GZry2x0C/veRkuZWEiEZOr+XtD0GQRb/MU
X-Gm-Gg: ASbGncuyxiAF1zxUy8cQbyycMrbanneVkihlSWFqKRoBaZl2vq6Pwe3ynvTMcEtWE9d
	Te7xJBCcbLOs8syXDRsaeTrJIBMXIW5N2xMO6rgoUou0rkBAl3BJAZRNLSHvr96NzYukZ3Y6jQH
	EL5DegTJD7JBvhKm8kIppevCB8uN08vAcWZPHvzfT/DZC2+WCU6NlaojTOkFbRPMQjB7XDXe8hQ
	lcgvc9KQLHC0lxXQ4Bh4cMe8pgmO0WaUrlCQAc0+X3LMUUXB2ssNMRJP2jFQpO6Hu7cBDcJemjM
	AS2VjicLCi5PI4Jche73s6LGSx5fH+jdpo8cmj3xVzwNNv6+kd0HzicQYuqGnw4TajQMeH/WHaB
	nuuEEojJgslEs/bdShnei89ysij03j9K1kuspiy6Zm7esDS2V3z5PkwdMfvLglU9ppYpneYGp7E
	pqN4oi2LA78g==
X-Google-Smtp-Source: AGHT+IFxsSx87V6j4xGCO/gIK9SEmLM0XVc2BXFyfyHWu6d+W66LEceiivJPxXPgqc3+OLhbzD/l6g==
X-Received: by 2002:a17:902:f542:b0:24c:b2a4:7089 with SMTP id d9443c01a7336-290ca121a5amr484987455ad.31.1761491077286;
        Sun, 26 Oct 2025 08:04:37 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d09958sm52320375ad.24.2025.10.26.08.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 08:04:36 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: rockchip: Add NineTripod X3568 series
Date: Sun, 26 Oct 2025 23:03:57 +0800
Message-ID: <20251026150358.1078453-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251026150358.1078453-1-coiaprant@gmail.com>
References: <20251026150358.1078453-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_080438_350897_4B2CD3A4 
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

This documents NineTripod X3568 v4 which is a SBC based on RK3568 SoC.

Link: http://www.9tripod.com/showpro.php?id=117
Link: https://appletsapi.52solution.com/media/X3568V4%E5%BC%80%E5%8F%91%E6%9D%BF%E7%A1%AC%E4%BB%B6%E6%89%8B%E5%86%8C.pdf

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6aceaa8ac..417100209 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -777,6 +777,12 @@ properties:
           - const: netxeon,r89
           - const: rockchip,rk3288
 
+      - description: NineTripod X3568 series board
+        items:
+          - enum:
+              - ninetripod,x3568-v4
+          - const: rockchip,rk3568
+
       - description: OPEN AI LAB EAIDK-610
         items:
           - const: openailab,eaidk-610
-- 
2.47.3


