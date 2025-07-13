Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADCCC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 08:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJyl6Itr2J8CcBOnf8YZMhnDEgMz2YqGF17cfLG0u0w=; b=nFqE6Vnb72D8DrvvpPiU9KARqH
	av5UGEeMRHV+aSNDoIvWsFeUp2V6rI13rIUJpceNZTO5pKFP/2sJH5ovuaujc95mDiAbY8FJTnJEK
	FkVQaLxeaLmrl9lFciIRgLNRpomWONFoSFoIRtFMjj1Qhb9Vk7kxYS6289975WQysQWQslnjf3bLY
	sQAmAFJJqaLtLmHIo0NMQMrh1igbiFooPaQigZg+pSFVEapjN0d2UfLTz425VuC66ADY0MBFeJ7Uh
	Jr3kidHUlRTFvt1TZCdzmCIBp9ZmaV5Dcv/2w8oB2/7AWisnrZt7IMwz5e3ORnhF/2EZavbV4VYhl
	OO4NO1sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uas43-0000000HWJC-1q4t;
	Sun, 13 Jul 2025 08:28:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uarjw-0000000HUNO-44aU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 08:07:18 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so2692739f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 01:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752394035; x=1752998835; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJyl6Itr2J8CcBOnf8YZMhnDEgMz2YqGF17cfLG0u0w=;
        b=oO2xtdtfOiZJnkfjos7JE2NRqoCiRJcTEcNKqbMNZEL1JR+Vk6OAHnG1KdQRDMUkVF
         rj6AQGsu5jJkjbWoyrpeQQN7UWoMbZNVJZ2HIwQ48pH+RmaiBfRnpGvDqlQdjTvPFbfT
         o8UTVfPVd0GfDu3ldRKRdXHQGsHqaNssuNgOexADbRgALqw2arGecYXg+HsI8ikWI/Pw
         gzPFtnkH3CpwIZeNMkspk1aVtJuAwxEGXOjMzrP2sP2IIjOOaOIVrkUboGLd/WhLsde5
         95JRLKsL9B1RLHL03paxI18uX8Q5qU+Q5cZQOK9gBnBLQFzDo1ROY8J3Ks4nccpgLp7A
         J7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394035; x=1752998835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJyl6Itr2J8CcBOnf8YZMhnDEgMz2YqGF17cfLG0u0w=;
        b=W8A5L74sIm1ulXfQ8w4r2b0Be+pSz6/2XTb5pl2Ots4VinjPQcni5iVPmh/vs/Ui/v
         vp6GSgN4yOaePu0IRwjXVHnhlVPA2Ekom/yO0i1jeu+rxSWU0i/7fOUczGIZKIMRFeYA
         fngLt9y/kiZ1sYnBYfWshxLNqwspunqwLW9SRY8Vg7dVqULgMAR9ChvrVFGWD9LNbl4A
         8otVNWfafHjFktnO/xHBanFaaVbCOOSjCLgXMhc+a1MJqW3g/8gm7Ay4hHlo3714KeZf
         G5wD+r0F4Gv385bCX+PN0wfJ4RD5TajM8dLhMSt0QsfzsGshidBu42bEkVsmMKlslFio
         lqug==
X-Forwarded-Encrypted: i=1; AJvYcCWyABvMMocNW9IMTrJpgNE7UX8CUD03dFDIt+gi0/yySZtdNtH6ru6dAic+szYcEQLHFgm9DoEwT+CUgq0N/p0Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzsDB67FdaYfgSbGTwZ/0joHTmKpkuoRxFjDHUcZI57n6VRe/rp
	yS173BqGOc+4iZTo4ZTL9CH3RH6ombMMAMAKzcziJcaoerUqN5g/gSbi75cH0+/VStQ=
X-Gm-Gg: ASbGncujS6YrgR18fddr5gsSPs7Gah0nf25rLKM1Cq5Jic6fgT7eQYTepiqq4v2EuZf
	QEQ5y6GF7zMhIOS3X/cpaQOupsPt14HptMXpHEYmNY18TDjSHG2hdn+tvu7Pr5cVazJlDhyYcFG
	J1H8Os5614u34weSJQ0rnUkqblD97elCtWAKaIgSQieHY7xgc/ZeJP+whQfcoTONK2p8ep0/xZt
	KlecBAfCG5MdFhqIRFmj3HwY9S2FO9gxBdmLDqRI7Zd0OVlpn4P3/aQYJQV2veNiTifrgMKoZhh
	xvs9Y/Xg6bOxuJiGMyAXY3WWLjwEFWgG2nskwzh/HWP8s2CGdBQwZdCbLug5bKglW9Te6LJ813j
	6KwMcdMNyKmuH2GjgAH+1c6L7kbdUgTrDKWpl
X-Google-Smtp-Source: AGHT+IFDkaJX0TEdwthvnMnibkv7x2m1KVCrimnEeDmcfRvTFWioaF6EXSVrFnCJ2KS+deMt9VV08Q==
X-Received: by 2002:adf:ae4a:0:b0:3a4:f787:9b58 with SMTP id ffacd0b85a97d-3b5f18abc86mr5290060f8f.58.1752394035324;
        Sun, 13 Jul 2025 01:07:15 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:07:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:30 +0200
Subject: [PATCH v2 08/15] dt-bindings: thermal: qcom-tsens: document the
 Milos Temperature Sensor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-8-e8f9a789505b@fairphone.com>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=844;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZPOAK3xFvDZxKtMubUGBzI+X0LzZj/ehseUCLqV9308=;
 b=g6khw9Eoj3k7qdE6HzUK3LwUa3ARHqiUtNifgmAtPNMijChPBfhsPG+M6zDWw7Jp/LdMvpqx0
 G/ABS6yAzifCr1yjRWLDxYJ5Q3VDCx3clJN4ZacevbE60KKq1Tn9u0D
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_010717_012897_84D27F54 
X-CRM114-Status: UNSURE (   9.66  )
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

Document the Temperature Sensor (TSENS) on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 0e653bbe9884953b58c4d8569b8d096db47fd54f..94311ebd7652d42eb6f3ae0dba792872c90b623f 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -49,6 +49,7 @@ properties:
       - description: v2 of TSENS
         items:
           - enum:
+              - qcom,milos-tsens
               - qcom,msm8953-tsens
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens

-- 
2.50.1


