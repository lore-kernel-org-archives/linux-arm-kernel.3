Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB378E6C606
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 05:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hebD8ipCbzY7nEzua8g0Qgmxl+l/xC/PNKeirRiQP54=; b=1CLCwZ1RWfK9jwbG0tCcUvmqMY
	jE7br7t9A5py7CFXwdZaY9YNB76lMMYoX3/86rdTBUTM52c9Ocdy0SX3vPl2jzzX/4Sjtse4BpnBm
	63BpJo4V/nM2nfi8i/U8/iRUsyPAJ880xsP2Ow075vwuYWBSHmRNrnOllPmZPB0iHTBkmIB/5FxQ3
	3DAGbQiewMLh3Xaz/p+LMB2LiG6jCMicn0UYvI5VfVWjWO13TUMyZ361Z2p751Kr9dQoev6PaS2Dv
	fTCRQrSvb3Hc8u1E+f5i4RvJ0QkzZK4QnHcnlxSGy4ERQrVpWZaP6c9mDztHcRaFOl329iaG5EgYt
	adsGW5SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tILAx-00000008I9Z-2vNw;
	Tue, 03 Dec 2024 05:10:19 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIL85-00000008HLM-2KbT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 05:07:22 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-215810fff52so21491655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 21:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733202440; x=1733807240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hebD8ipCbzY7nEzua8g0Qgmxl+l/xC/PNKeirRiQP54=;
        b=cD3A7yFb7ImT1PUM3/wxXjGITQbEPiH6N+7nJc8palMps+oqM62aeAZAhrIZ3W0nrW
         lhbW4aQLsVXvOqxjgW1E/3XnC8wX9/hCJ9z1ErJIKkl9KrYL4gTdG7v+cpqZHP0dHia9
         YYabgojg2O4w9lGsELWTwnKntw+g0O0RJmhxyGp+47N9H/CNk0R2HEAcRXSTD8L1HJvI
         wnFaWsazBscKKkgT0lkv/OrOHvv5l90U0o1RokLR+xx1Ek/6EII/iDumGcgjQKHRF7PG
         ch9CLrO1M+zCHZMl98ZZw/kLvjjoPRToCl2n6PFLsM/VQ+JobN7mMnR9gtnvzn4OEYvS
         gYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733202440; x=1733807240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hebD8ipCbzY7nEzua8g0Qgmxl+l/xC/PNKeirRiQP54=;
        b=AZQ43E6xaMoABgqmDtAjb7sepwACrMbPyn98n9SeMxAp8NbE2Ec26zTMIY+JQOJPwL
         X96pP/Zc32WislnTDUSjh8H37QyCxMeNVxesVzYBiRd9dOGxazNvGnsQQYbM/tznLIi2
         e6UAWA223qfSsglHzDdB+4V5ZRmJYhdn99m7mtAtZyp3nJLY7sTsz3Q5nPBw+hyS18v6
         bqF1kzcgZUJbrjVP1YZy7Oz2cX5dn8eBq9PaJABpQU1LvBF79is8/HTnlob7d7ZftfEi
         ZYeBkjuOUbDAFcGeH41y4Lu7389l6wzWk4bOQQMvzkjai3xEc7fVI4nCGmOOMv8Gdw2R
         Vjyw==
X-Forwarded-Encrypted: i=1; AJvYcCUHFrBatNoCRR3vXVYtv4EH7Uim0iFQhnyXPtPE0YDTy47CqUVe5WOFFZYD8el12shhUoNwTJ5p0z9DFnRFMN3m@lists.infradead.org
X-Gm-Message-State: AOJu0Yzeir3FuP99zWsACBBQdHH3vhzLNHSk1sLqcRRreKKqaEZwU6i2
	cyF4oZkd+vroEHvKCTRH9ruLTrafj8A8Ubhh7qmGYFCaf9TnsQoE
X-Gm-Gg: ASbGncswHauDMBU9LP9aFs6CE6aBGddZ/2/+w+5Id10R8Pj9Fu4ksOyei85ofxUMkLv
	rwQvXsckCJGeboqa33pHdfOROYKnrYQRllpINS1682NGLL05crv2QwrWtxT1oYwSQDP5546/6uI
	7ule3XKYdxlQZ9S6D5LNOkRt7yZKkBh6NJeYInRRQvEpBRV+FSFpN2s75GXXR7AdndaKoxxHpgu
	WDGInYnJZSkSyE6Htoa5avJATBVuSXFX8JveuBEwogxNaGDu5PHPSlsSUVm3vW1GQ==
X-Google-Smtp-Source: AGHT+IE+mF4zZQlFW9cTU/rjqk1T1d7ncMfeh7ab/M52pAyOy802erj5Ky8I4VG6C2ix3C05Hk+qkQ==
X-Received: by 2002:a17:903:2344:b0:215:a3fd:61f5 with SMTP id d9443c01a7336-215bd1b450amr12903395ad.5.1733202440414;
        Mon, 02 Dec 2024 21:07:20 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21586d40afasm33242385ad.270.2024.12.02.21.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 21:07:20 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v5 02/10] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
Date: Tue,  3 Dec 2024 13:05:32 +0800
Message-ID: <20241203050640.109378-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203050640.109378-1-towinchenmi@gmail.com>
References: <20241203050640.109378-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_210721_588434_C717FA43 
X-CRM114-Status: UNSURE (   9.93  )
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

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Acked-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 59a6af735a21..6e9a670eaf56 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -31,6 +31,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr-pwrstate
+          - apple,t7000-pmgr-pwrstate
+          - apple,s8000-pmgr-pwrstate
+          - apple,t8010-pmgr-pwrstate
+          - apple,t8015-pmgr-pwrstate
           - apple,t8103-pmgr-pwrstate
           - apple,t8112-pmgr-pwrstate
           - apple,t6000-pmgr-pwrstate
-- 
2.47.1


