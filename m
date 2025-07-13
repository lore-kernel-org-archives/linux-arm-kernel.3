Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6ADBC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 08:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3MxjLEtpRVyTZFb++atMk5EZAHm1SNpE6rDNgKP3WM=; b=xVnwdXm90uu6/doEGU1ZvwhraY
	MfwfcbJ3HO2W9j/ICfKQu91umJQ+feL5mUhHkxvSjBOTMabdiSzLnkJT0622cNtixFqxk360ga0fU
	x9PviQ0Gb0ZdV2ko9vJLp5UyPIpG/mq0W+63C/UcByLUD6h/AuSo4K0H91R81X1n4Wgiwhrj8KFI6
	aLepzdYmekl+lWeHDGA9CXhVBifLSFcaR04XqbBww7nsxtWuCVK3BP5ADRaOVmaRnQHDg29fU7iRv
	39oo8+Mj3XiYULks/EW66F0mupSW934NfJMsPpSdqco0yOLgrhHcj3DjdHQVA8vzs/1IjS+UJPtGK
	esmeuQDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uarsE-0000000HVdW-35va;
	Sun, 13 Jul 2025 08:15:50 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uarj7-0000000HUB7-0IVo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 08:06:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-455b00283a5so10748905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752393983; x=1752998783; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3MxjLEtpRVyTZFb++atMk5EZAHm1SNpE6rDNgKP3WM=;
        b=EFX82Ucf1Ju+G8A7lfA0ixgumMWAKYkBIIzEcd+0G6HrsWLmOX/y+T3nsaJFXrYU0f
         PPNsWVH+9fKpVsucB6FPpRCNDyvQ6pjYolV2fNX24A2w2QpBKGRP3JyDLFicvEHfG9NW
         Gd0qKNPQpvy4WX37qHwLYmSaNFDHQHQebaINFYsv/PL8TCFsb4EjTB+DT4RobaJadJ4J
         WPLPbiPTW6XRHBCDazfmd5Oi9Ro4fvMvWlf4Ng5YhvmwhcQULU8NC/6C9CIE8S6+iCSr
         mu051sLYCYm2ZktSAd/8QNg3JjJuaR9z755tcVmpFu5zXiShFoavS2+8G0s0BHigylQ/
         UGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752393983; x=1752998783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3MxjLEtpRVyTZFb++atMk5EZAHm1SNpE6rDNgKP3WM=;
        b=mm6xTZ8wcCM+5iltIuNCJ6FrdRNXZeWv1muezmap0h8psX2njIVVf9f4l17s12Qn0+
         CXcgYphRLM4YJkfcPhmncdKH5l4yiNALx79n8y+wVMFC1lYaDuHmnvEnk8dNkZttyrUk
         7bui9xj3dhRgX6re4n6dd5h7Md3k/U2cLVhX2NLCuqz20je4pxZ3TjwwvRcglwx7+66H
         ZShEkJqtlI0BsdfS++IJZ7+xmbfjEBsQF7JaG3Vz1duz4BwHWIx53zGfw3sJxtNKAFeT
         5xRI80uOCpzw8lZpoZmAKHMODobbF/Q3SKZ/1oVYI5B/r4uNHWk0Jck9NqwimBWiA/mi
         s3Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWzbI7HxCnCKe+HoFNdKPuISS+AJkkBrc8Vdt3TuPJ7KnBersxgekMyxeLjouuZx51dMLlIxq3nG2BlCu7Hsl43@lists.infradead.org
X-Gm-Message-State: AOJu0YxAUgJTnr5AzwIPFrb1BYOpHVPGurKGSAmI7bX7Cm0T5SlwjeQ0
	p++ujtMYnKKh3cLyuUTSMfCYKMN5YXvyJ9+aU/AC2cRhXZCjGY7gdTBsw1aNJbhyGqc=
X-Gm-Gg: ASbGncs7jwMk02MyrmgAiqezUdj6DPsc6QUL7tr9+P4ZpwwYr7S6golapCUbPHwqfsg
	ZHOss8wvNB+P0/MkITDPwH6go4++9UzEu1EoCs3YdlLddtU7uCJodiibG8XkUtDxgrJJWj7xEuA
	e+OhK+B3h86TPslUxFycXX5O88inzJ5BIDNdeoYOPEkUOrILiv3E3tHyhGIF30w3IDP92Zz/GX+
	Mw0hR2/IqSEVC+tdP4yuEAATCHUmJmpUMaDkh31wXx1u6ldRIM4U36oWxRoXJbA86Tw8AiN4dqn
	zGO/sj43Nd8q4d51xc2w1g2KzD57TUqcph6HQlqfDjREgUd9c0dqAckfnvozoAs2filoNuvJp4q
	rgBwqROWExNQYJPqekub+vCCrts3tY07BxSoKpAqq0/rc2OQ=
X-Google-Smtp-Source: AGHT+IF2dijl2kk5jegjtYU+p2rAjAUxOPkElW1UrGDWDO80C/PI+gSKcgMJoxorFBd7cfrm8u/VBQ==
X-Received: by 2002:a5d:6a49:0:b0:3a5:2848:2e78 with SMTP id ffacd0b85a97d-3b5f18ceba8mr7079826f8f.28.1752393983475;
        Sun, 13 Jul 2025 01:06:23 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:06:23 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:25 +0200
Subject: [PATCH v2 03/15] dt-bindings: crypto: qcom,prng: document Milos
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-3-e8f9a789505b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=875;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=lXJt/yDsoHDSuPe8QmNNkzF3KEBLxNVR5QCRJEM7U6s=;
 b=YWlNKu1yk/YAFD8w90VWlOFTNCiHXfhuYzMgW1x9mK56voio6ksNRmFDk/XDI+kjQDc4mizBK
 mmfj6LeJyvMD7UovUB4bVNyGfJtrvgMzTuaEsoMvHBWmXosueoYs69L
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_010625_112480_DEE06B10 
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

Document Milos SoC compatible for the True Random Number Generator.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index ed7e16bd11d33c16d0adf02c38419dbaee87ac48..0fdef054a1a30c363e0d99518351fb18124904f0 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -20,6 +20,7 @@ properties:
               - qcom,ipq5332-trng
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng
+              - qcom,milos-trng
               - qcom,qcs615-trng
               - qcom,qcs8300-trng
               - qcom,sa8255p-trng

-- 
2.50.1


