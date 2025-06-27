Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BA7C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 15:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkxeU/GduoWntQlLaILsmti/MYYJWF+ax5S/V6THsN0=; b=NlW1qnFooxviTwQ3SEYJZ4CBD0
	mOpHPI1ZLPbJNI2bTGUQGVnZCAeQhWdt6gp9BnBNhfhSyNU5m2QT7b0iYc05wkWyVfGt1GAxV3lJI
	s2Gl4sG4XjS7iUPRQhZl6IdFlX4+05EGN7qiYqhXh5Zu1Zhsx4id9KB4bNiEFmuVFhVaNy5eerySC
	47OSCS+tUcgEgprVUl7/H29IqmWfGhGJkFcSkdukvx+S90qgjBDPpxr6y37FsGHTsukPy2gAaaSL+
	7Ce1t6ZEbcTR5GE2pajQj2Jj5TYI9taq7i9mLKBntBuD2kAqZAuhy8KUaTu9egvCvmOthEs/kI8iJ
	Bz3SBXqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAar-0000000F06Q-2AnG;
	Fri, 27 Jun 2025 15:02:21 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVA33-0000000Euhz-3Ozz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 14:27:26 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ae0a420431bso430686366b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 07:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751034444; x=1751639244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkxeU/GduoWntQlLaILsmti/MYYJWF+ax5S/V6THsN0=;
        b=eQogoge3EF/JKfwPekP1GKkkVtG7XyeAQ46n/ygMRWLzjglu94eLdEIGygXEz5bhQx
         9wXIobzCXNsf8vPm2zi198rfkUqlkpDlqju1yVasQ4VFE6b9K9gruYznLjJzZZy3H1d3
         s7TU8r8Hub7UEnLhfn78VgEBpuHjk5uR6Wpt9BBV9WKoV1I42cYYk8TGBfR27p1/ojtq
         NouRhpiIOnCj2wv6cc8VG/2qEWkyxjqR1C4aNc8z5xP15qlDTQbfV2M0Nyj++BsUt+NP
         zxKMYquZrrmm/D53XwswlA5am3TZGP/oYNZ1t+whGGQQqJvepFC5miwv2jXMqNt8N7SV
         A6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034444; x=1751639244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkxeU/GduoWntQlLaILsmti/MYYJWF+ax5S/V6THsN0=;
        b=D+k5T2EALeh6JjuLglR/+JyRito7EDQcDM446jQ9iIhw14XK1GPh2bD89fzr4N1p8F
         gTVN/6lHTEXgEX8B121MlwTYxvM2/6BHwaB7B8sO1yhr9F3TDBBSYYQMt6wSfH26ENNi
         SVWp4bzaHYmzwNwhNM7v05hjC4R6DuTzAt9b4THVwf+tLHSdo+1l8ZjYJeJlbVGGNqWm
         tyWipcvg5x5Xud6TwZ1kVl5UEB6bmLWUT7aWnvP47TxYjHR4e/NYGedlnN48veRYGQXv
         sXrQY3/6BxEHqtQMjzPD64/WT8IykqmgrOQ2Lexj1U2HK5lYGh6iDJv0JYb9E4Uivrp+
         33dA==
X-Forwarded-Encrypted: i=1; AJvYcCVnPmwkR0hyzaxjoWhKsLItEQjtQgs1ITKUjTQO2c37crWs/Vf+O1Xi6RLn8XrRfmP1XFNEqOX0YxHiovStj1Xm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx06C2U1BNZBxkkVhOCB+6g9YDOjiyTG6d6UdXlMxQ9+Fdr/QLj
	FYN7fxMZaJSNgPj27F408JuD+YXNGbNslVWIjhHFqlZ+PLM7SS5kF4oO
X-Gm-Gg: ASbGncuz4Z024TVZ8aCFwRcPEmzGm6M9KM4iFz6L5UV3WLu2HCgB/8VCcEhGdpuXE01
	lTdqshtgK6rEYCG9kmsBs+BygnWphYRGtd7nCLolvfyxnrlMOfhWRyh5YMggX8tPTLH52dmmLA0
	AFsNRjp9JbyQe6S/uGDXvu1aS+mJ5AN5GOJ65XYDXk1bm4OMvH5SAbtE9/siohYh0ZzPhfCn0CF
	cPgMseJ+YPW0MHrizYZl+5oOFOXw8yhNRSG2k+Dzsn9vqeNpOQt2hns5l5Do7MUIvaJvvb/DyP1
	NRSsLN8wLDPZCfGiOXg+/j4QsUevv7bz98IsNUXHp0ld1uBuDhWtAys6NeBvOX5cWmjqvaNuA/R
	RHE6ogFZK+BffUhudsEsJCcsYmJ/z727Esg==
X-Google-Smtp-Source: AGHT+IG6eRnkKzksPdjHbL7u+Nuu+IwfYQX57kJVKCXC8aufRZRKJsVtQ1pW1LFQxYsz6ofBp88Lng==
X-Received: by 2002:a17:907:97c7:b0:ae0:c8f9:4529 with SMTP id a640c23a62f3a-ae350103238mr299793166b.49.1751034443969;
        Fri, 27 Jun 2025 07:27:23 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35e2dafcbsm98925366b.116.2025.06.27.07.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:27:23 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
Date: Fri, 27 Jun 2025 10:26:44 -0400
Message-Id: <20250627142645.134256-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627142645.134256-1-laurentiumihalcea111@gmail.com>
References: <20250627142645.134256-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_072725_849899_A42AA3B9 
X-CRM114-Status: UNSURE (   9.23  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the i.MX8ULP EVK9 board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index b23bc1e48866..0563e9522fb7 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1373,6 +1373,7 @@ properties:
         items:
           - enum:
               - fsl,imx8ulp-evk           # i.MX8ULP EVK Board
+              - fsl,imx8ulp-9x9-evk       # i.MX8ULP EVK9 Board
           - const: fsl,imx8ulp
 
       - description: i.MX93 based Boards
-- 
2.34.1


