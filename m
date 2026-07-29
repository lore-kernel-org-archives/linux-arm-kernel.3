Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6858C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGY9pJ9HxACe2V5dSfk8s/efrdxSSwRbR+Ftr/FTg6A=; b=BGfkZcMxLNksNLTAJD1tbeAD/0
	Qm7SBmL6A9T+GMb2IOJRTFtcu4DF31Oj3Qd37khY0zpDZ3Nzw0b8Zu4Uy/caI9IkMf/1V4bXc5IDY
	zCYP5FfPxs0DOMyLcxUxOwbI9JLrlm4nqP0X1RfMAWnZ7ubCuxK004CFj3C4olwzEfeJYXrToJq2F
	qYiD6xIbOO2GmMDkZqScdIbxfvfZnuIcNjhtQg/qxGkQh4r8YcpG6C7hHZNHhnn+iIU14ZRKtt7be
	q2W84CaUCR38boDcyjGniLaxOZ+Jd7LsLO8o7J1IihGWxqmYlQjN2T/q4OfjK2KtfF4IW7+ITvFVs
	1sX51+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4Mg-000000086aI-2WZU;
	Wed, 29 Jul 2026 13:30:30 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4MZ-000000086UG-1nl3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:30:25 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4a43c2a126fso354547b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 06:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785331822; x=1785936622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGY9pJ9HxACe2V5dSfk8s/efrdxSSwRbR+Ftr/FTg6A=;
        b=GDO50E2LceqSFAZ9S+f4PwLECZdasyycVtEOJMdMchq1aRrvjuo2GPCOT4g0H5ydxk
         o1KS/tgrd/if0QrS2j7qrhUuYCBnH/NXmy0/ja9a1/e7WWpHEC5+I++DTeK4A0fSkcUN
         3/FI4nkSD5Th2czmMqVdo5P8VNhSsrbzNMtZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331822; x=1785936622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGY9pJ9HxACe2V5dSfk8s/efrdxSSwRbR+Ftr/FTg6A=;
        b=AVHWkolMNvaEasuohjvQQQap8CYjOMYiBrUPt6kfVF4ftC+lg54CAvBVZov1u4Mi6z
         koE9VOjREr4gaWIYKVkxh0Uyk/xmRikLNWKUEZbm1Fyac+/9H7hR3AM+wELPAc1QDiD6
         6LECiN3erhIgja3zyu2Xi13A+PMPq/msWx51dY+O1Y+RlteQ0mEcnaVP4Tk0dsUnTkoL
         tu9F//YqerZqEMPQqe31HKltpzQVeLGL/4jvZlnVh0Y6qaTU/WRjXhwdUz5MMqfF/RE0
         jzuifE+STXJ0vZF9+DKW/l4Ii45aRbq25gWhMVidy9MReKRXPCghCwmNQ4V79UJ3IAbl
         R3BA==
X-Forwarded-Encrypted: i=1; AHgh+RqaRZNYhxpzrhK36LsDAjghJBPgenBuUYfgRBSl3GVkeTRv3OSMg/qfR6dwvbnQKzUFqcj32psMnfgtEGqG5Rci@lists.infradead.org
X-Gm-Message-State: AOJu0YzT9Ov7lZW889qECnKUrRPEP+7UD8AdHR+Fj5+3xPUnR5/4qQ84
	c2H20OZQwtatS28B7yOjj/A7UhsezlvLqtoJPtrFKaTHO5O+zSspAH3jKJuLJ12/Iw==
X-Gm-Gg: AR+sD11Ox5iLEd83u3ZzxjXtIGsojQwW9d+7wVjxRCi8E1QQEJf9TJxTZ+XVUJxKGnA
	fyxnGXQSsiU4pttwf4Q4pcsOItp1n05pNbF15Lli2cwoDJD+bxr2Wn5L2Il2mXxv5FZYdWkQiS/
	O20hgDTry3r5+OgzikdQItKnZJgaGk0KjdahHmIZozpq521p6OBDM0a+Elw4I9t0BYonNJvMg1F
	IHqwrN/VUttdb2e1OfgBRoDv6Fs3uCv0b26ynG+pvBidgrPCGQoRrMoSBqHeFCSy4q0PiD3gEKk
	ELctQG2SJfauNTtopMcPar65JDti4KMwvhXldiSsX8Tx5XaGhXRe/TZCcHMQNSH0HD959E+2FBF
	BPM+GxcjlkCNW4Yqw3xjcvOztJXCR78zlTxNp5HkQoUalYa80t3IGOeG5gRiEE3C9ivIyEp63KY
	DfsX+ySym0eXP/uOPd5CDfe9SUMfgV6QEMxxfAOQVNeIp7s5b3AMpi99z5uisSAeDdoA==
X-Received: by 2002:a05:6808:1905:b0:496:11f1:f2b5 with SMTP id 5614622812f47-4ad5b987d6emr3451568b6e.10.1785331822286;
        Wed, 29 Jul 2026 06:30:22 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ef5d650sm1712932b6e.9.2026.07.29.06.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:30:20 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: pinctrl: rockchip: Add RV1106 compatible
Date: Wed, 29 Jul 2026 07:27:27 -0600
Message-ID: <20260729072727.v3.3.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729132736.3807082-1-sjg@chromium.org>
References: <20260729132736.3807082-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_063023_480883_E5A11CEA 
X-CRM114-Status: GOOD (  10.14  )
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

Add the compatible for the pin controller of the Rockchip RV1106 and
its RV1103 package variant.

Signed-off-by: Simon Glass <sjg@chromium.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 9b3cbeb54fed..81747bb53056 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -51,6 +51,7 @@ properties:
       - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
       - rockchip,rv1103b-pinctrl
+      - rockchip,rv1106-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
 
-- 
2.43.0


