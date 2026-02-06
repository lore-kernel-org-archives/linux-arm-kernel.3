Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12D6EE6B43
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 18:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoltbQKyGec+ucA9n8ImzXdn4Jsneih4XM+AaFlZmww=; b=wz8r1qpGYcYjYrj6ulL2Egysix
	aRYZkztBD7qHYo3f11dd5ox4h0bPaSpbfI+hJTkWRTSeeQ+WGYNuxZGAw+ja83tnlUh2PhhBcxyxz
	Ropy5SH8/MKvUj08TnEPhY7orTUclfdkztxORA7KASBIySZm6BCM99XLTmT3+H4gX4hPcoz0jfusP
	uJsbpEAAFpw8CVuHhPwc6bn38P0YPO1iaZ+VR6k314CLPS0JZnTKXcgvMqU/R3x2iHVaSWN/nj1HZ
	VyHutiEaKuPfoYIE1zE1DxApatvWV4HwJdmwGMX/DbGzgKhOeUdoncsgOQFZWV5SgjLM/BrtHvNjq
	5OzU0jjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQLB-0000000BfRp-3who;
	Fri, 06 Feb 2026 18:14:01 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQL1-0000000BfDp-458X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 18:13:56 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2b8392fb4dcso2474580eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 10:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770401631; x=1771006431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoltbQKyGec+ucA9n8ImzXdn4Jsneih4XM+AaFlZmww=;
        b=kAUFp2icqsm5/stafbY+7O1JmHace4tIeWiG1e4H48txNNWABVCLfDlMfvGvo5unEC
         PLXYwsDOI42bjCuouTvZjCN1I1LErlG/5TFy5l1qf0WkOmKcPCs/GjBPbwFEpPOmWcPn
         INScFwjPAjhBn4tskOqfOig2MfMlHutM5mhfueZXuGmXZ1SXfZIbaPf0QpOKJLNaMaur
         r8HoMVPv43p0/mGxrL4/VRGUkck/2yAgWma5079uwtJ++cTwmsst0Bmh7thohjJvEvSE
         ZoBIK6yrpQA3u/3W87UFAgX/e0EYZ2Ub0A2YBgJH/WKee39/84kd3uiTUFIU2ss0YtXE
         W4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770401631; x=1771006431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZoltbQKyGec+ucA9n8ImzXdn4Jsneih4XM+AaFlZmww=;
        b=RzEt1cy4eKJvqm976DS/bZFPz5G6o1S075LeCNItqxQBSzz10ZdRHSjzqzXGo3Oqjr
         1eEfgioP7O8E2WgVDOSqKBBbeqM6d38eh+Xco7lTn9VQmuI3nuTDErG35uXo+KHQpIOj
         rHodGkfpiEtSTLj22WuKXFrUji7+aU/82EPsSXQ9iXN8NsWcQ5SDxDPh7QK8T5dMs2Vr
         hxdOsM+l0gdCktoEZkTKAv6kSfSE5Q8j6Xkiud+qVH8df8nPy0TRPAriQ46t0EYv1lcT
         Zbr7Ne5z2Ij4u88YVdm/ujOqGAW8SlOBfyvaiFtZ/5CQKPfAckEeF9kgQEJJ3L351lyI
         MOwg==
X-Forwarded-Encrypted: i=1; AJvYcCVKpV/UykuGDOGSTiVhI1HsvBfnSdKF+i8Zt4T2ciijLfk7FMjyK1ngVeKkwNHW3CI22mXQXAHoEy5Hz3S++omg@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt+YT2RlWBIxve2dnfyfDxnVP5uJK4+3p/1HjHZYHsbGWCmsJG
	hCHzXBXaeS3v02kqLZBIlRxUMW2s8nILnyCYi2R/9OXG8CYLzUEvIGkQ
X-Gm-Gg: AZuq6aK9ggWuDIyyZvY2Kx73kteX2kNfcvgAAtVzfrO39ZpfXs59fgT5euPekTNI48U
	aMHyDGmk9q7eMpQajUk6odjujeYQUWhUW1AsFNJS2+cf+whaiLnmG5SyMRbsLeTpqS+vEV5q7Xw
	PuWE+u24ENwAAeLhR89iJ8OWcrJbZO9ovNf+wXuotYpP4YIDW3ftgmXQSTxGrfk53MGUCxhrGEg
	MSRqCwaAw9cKmKmeCgQGLI8vh6JoJkiRFryDp1bZURJgAj4dUohYuz8HT9vor5DIvB5NZv4qtyA
	NCy77cz7nUqHy8eF/G/X/nh4C40yfYskgOuaQdwFi9zHkZj0bLs/VD2OxfRdWERNpML/U+qz+vb
	Ipfq74o10D6DTB/GG53/Vw+K2/GMDfNi/6pVUK41nCaML0wVAlVTH34BY3w311h9dALePLvqEMD
	1pOGvZ3/AgVL81hMsaCni6mYiw
X-Received: by 2002:a05:7022:92c:b0:126:fddf:3d86 with SMTP id a92af1059eb24-1270401f386mr1395195c88.39.1770401631027;
        Fri, 06 Feb 2026 10:13:51 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:44a3:2bb7:a035:fd7e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270433ab31sm2782500c88.11.2026.02.06.10.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 10:13:50 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 10/11] dt-bindings: arm: rockchip: Add Onion RV1103B Omega4
Date: Fri,  6 Feb 2026 15:13:08 -0300
Message-Id: <20260206181309.2696095-11-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206181309.2696095-1-festevam@gmail.com>
References: <20260206181309.2696095-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_101352_087085_A67CC4D4 
X-CRM114-Status: UNSURE (   9.89  )
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

Onion Omega4 board is a board based on the RV1103B SoC.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index ae77ded9fe47..40c6f7f90755 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -793,6 +793,11 @@ properties:
               - lunzn,fastrhino-r68s
           - const: rockchip,rk3568
 
+      - description: Onion RV1103B Omega4 board
+        items:
+          - const: onion,rv1103b-omega4
+          - const: rockchip,rv1103b
+
       - description: mqmaker MiQi
         items:
           - const: mqmaker,miqi
-- 
2.34.1


