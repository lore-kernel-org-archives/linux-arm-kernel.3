Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A37C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 14:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X4E1w+hIQ4kce+iEv51gMOFHtMhwy1x6OT83N+mRbe4=; b=E3lxNXsCVHfW3f
	Oay92WaVNMJfIKDvm0tnEfpozPkR6/U+wwZLmO0pHWhoExUHfM4mEhBqYeitzq9+OD9d8wkXab7yE
	wjolrnvWaQqET7eUaxayH1PxnwJsDc449qcDaxFKZS7KqVmd5WE/9oupyWgmlVayqX9UITWD7WnLv
	CS/pHFQQYXteop8KxIhKgyE5Dh/jX6PQ5MtWb5B/0dnWUwkdBm7iXnxlxOCSJ62WMK/pkpGyl+l8e
	rdqlrIojYMqxMOpvvDpphd/2b0EikNm3ZgcSq6hv5uUJNevUPMLTSeSQt2z+LRLzyj3wH/K5cIu9H
	KrIbeibjp+jPnmnPt6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTXm-0000000829i-2980;
	Mon, 11 Aug 2025 14:30:34 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSyc-00000007teF-2FOQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:54:16 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-af95a5989a2so56809066b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754920453; x=1755525253; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4E1w+hIQ4kce+iEv51gMOFHtMhwy1x6OT83N+mRbe4=;
        b=MTrx+2NsT6PVeZCDp0z4Sd4x7+LOlKt2717vWgMCeTeBFDY6p9ZKPcQfdKVrjfYL0i
         m+xhJF1Glj9C1OdRYA8dQOFM4hdSVrdSRg6V+AXIVaxf0r9P0CM9vcPYlEhF6vojmKfK
         drd3AXcCCeQvmH5+kn09QCfHXG4vizwQzFxL8MGeL8Zhq6iJs5TgpC+6Pj+aXmfUD1/z
         oMacvWvi7FAGT/2OCJLcHF+Mw4K8RU6bHQnijmnmTfiTW8pJOg4udd2HRUNo2rzg4c5s
         jlAYZw4e2hin4Ef3/NDV5/mMK6RCglnCbfcwYNj2fHpBPQsCDSV8RZ/dG+Z7KvLhY2gF
         L8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920453; x=1755525253;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4E1w+hIQ4kce+iEv51gMOFHtMhwy1x6OT83N+mRbe4=;
        b=pTwzhZo43aCrWadhDL5XIUT1dkCFNN5gFzPsBmS698dYHqTNBdSoUqCCWlKLVzFBPW
         vzUuKgE5j1gbP0fM+B66MhQHk8ydPP2TUb6gCDbwSEI8ViYKssVXLF9Gx4FnDEqG797a
         rOCDTkeWvdTWn9yMzE072R/Zahe0x0Jtn9VU1L6ipgKnUY2AZVXR+utmeBtSGlOMNoAo
         M3QnYnhUqLDTaKc3+MPP3N0hIotnivb9OhajHAEAGJeKtfe/Bm9DAZxwm17LiODfO6H0
         Er7W8pJZy0cBPvE/cvYMfcZSQXenoPKwz05hF7gOLmlP1G/8KyI+FnvBUpahtP4yg7x+
         t8GQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9Ci9o/ZI8i1EpSosZmPPkkcClrzmQD5wViDBVeQey2h0i3Q0TWBGsiq2dkVMT7zNGB6DioYm16kDkPSsvrQnW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw27fgISGzY+yk4yTXKdJ8FjQSwJWJDboNz0dE/cNj1Vsps0RUb
	NssfNRjqSTN+0SQd02hNmm9U5PJWKCZa364CD2295eXbW2JfvjaWlZOFq/0/WVwAIA0=
X-Gm-Gg: ASbGnct+MxRUbY2wnlVI4dNrhST917Czu5t8VpcwnGI3AfkTFQlgOQTbre8DMOlAHfK
	lXpdH1yRX+IGrbfrQwBjTj8SM1fF+dVKedzzzZf5mCzU51sXlfi28ZVZD9oMMPenE/XC5dgxh1L
	pO4SbxpgKiz3vUwNDUgK0ikJVFA7/qSaDhdUCgTExDPcCfymtH/jqOaQ66N5amavl43IB0mEm+O
	Bo6dRV8cln8ojMeVzrgSz0GiNn/zqOpjlGqC1tjhYSPRjJB6BXF8EEytUctQzO6J6kWiIAlvmtd
	wTXsXV2vFejX83e8PXAe/yV+YXPNFeW2vdiUDkUOE7oF54v3eEcgzKm49nnuEVPQjjhZlrBFJ7S
	I0NNfm6ol3MmgAb18bLmlamuTrzN5GRcSmON8u9NIoc8MldU65A==
X-Google-Smtp-Source: AGHT+IHeQhtn+GwAGxZiHen5xqVtV0k6a2xfnhqG8tq/SVPZOQOhdgU7YDXqOB3wSUZppQOTSjZ/QQ==
X-Received: by 2002:a17:906:c114:b0:ae0:bb1a:8c4 with SMTP id a640c23a62f3a-af9deaae559mr346505666b.1.1754920452931;
        Mon, 11 Aug 2025 06:54:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af986a477c4sm1179029866b.56.2025.08.11.06.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:54:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND 0/2] dt-bindings: Drop 'db' suffix duplicating
 dtschema
Date: Mon, 11 Aug 2025 15:54:02 +0200
Message-Id: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPr1mWgC/3WNMQvCMBCF/0q52ZNrJFacHOzqoKN0SJOzPSiJJ
 KUopf/dkN3xe4/3vRUSR+EE52qFyIskCT5DvavAjsYPjOIygyKl6agadDP24p34IaHr8XBiY4i
 0tY4gj96RX/Ipwifc20d7u0KX81HSHOK3/Cx1af8plxoJnbYNNcrYnvkyiTcx7EMcoNu27Qekh
 Yi0tQAAAA==
X-Change-ID: 20250627-dt-bindings-db-38eaa005ccd0
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=812;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=D32owlGLOdlHqubNLaI9nkgZDRqlRnVWNbolwyy8jW4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBomfYAbFp5nM0BuZDzZfSz7NhlghSfON8hIYWfU
 2/PI5axk4SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJn2AAAKCRDBN2bmhouD
 171gD/9jmTBJd9weX4PdgWSBrNoi+OhK7XHL0dkfzxWr3gPih+Y1CUjQ92GvArexs7OSIVhb4um
 uOseVt8Dbup/XMM/MGDC1PpzpV8p8XdF4UAveq0pNbCcwYY+v2XYNGxnwnL4nr2wVEz4bperF8u
 dXljljLZlxUmioRkuVKfQKFeqFOtxTReuj30Aa1L9Jg/AM2lHWl/AmseQLt3bI04m81KnQk+6ZF
 /A+5PtOtF8JDNhBb2n9HXWyKslYnHGcIyYrxP5+zENqV+23fWNdCmQVV/fWzsxtgt89k8g5H6te
 uSi9CXUxJ3l+22rW4UIfWcMXIXV+mlAU/GpP8qc5TVPjGU77+0bOFKAR0MiClggadETQk6wUk9s
 e99hsxBC137+fpYgSjm1gZhF2MIA9Rr/f1DyY6NRlpJVod55+/W7eQis1d6OwEden9HaoGSqqIR
 gKnpWi6HkStV7dKm39wIzBWqty3KqqzAoFy+kQCGtY1A7Egt0bEEsRjlmyN7o2GDRdAAEH+FWTq
 r7/nf+NA90ybfUzoI/QgozgEPiLCljf+/hRtID3Xp+1rHHpIOhUDJRb5MdW2JW2TFpgx7aRDW7e
 5TiVtDmDj+sElyEwNNXEVSzWPxAIgbI6HY1IsRvzCTgAw01ZXRmBAhjO4Rt8MGOEF1hGglmN/VS
 7xnWoAozbu5jkoA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065414_603308_100EE622 
X-CRM114-Status: UNSURE (   7.16  )
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

Resending because all dependencies are merged.

Please take individual patches via respective subsystems (phy, leds).

Previously:
- Link to v1: https://lore.kernel.org/r/20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      dt-bindings: leds: issi,is31fl319x: Drop 'db' suffix duplicating dtschema
      dt-bindings: phy: fsl,imx8mq-usb: Drop 'db' suffix duplicating dtschema

 Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml   | 1 -
 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 1 -
 2 files changed, 2 deletions(-)
---
base-commit: b1549501188cc9eba732c25b033df7a53ccc341f
change-id: 20250627-dt-bindings-db-38eaa005ccd0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


