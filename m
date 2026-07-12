Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AB4C44506
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 09:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWz2OfijInLdOPGknBP5J1OrsIKrh2Wgu00STcMnuow=; b=Q/LsLBTtmOdo5XdBOgvkjnXlSO
	7ZK3B43aXwNLMgiz8e4Bq+EWsGG++dcexo8xpKOW9kjwAzbWGNXx0hx40EpMYCaaJPcSOYEdD6G0k
	ZMcfY2FpWcrVhXJ7oZp+8SaUlXPWYJSwArah+InKQDIUtHLlJhkzIkiheiazRtyVrsvdD6fHlr5hO
	VKtCrbAmf2WkblN1rAlecud84FctG/cCYE0X8tJfCTa3vxCMaRpn+3Eo4jK/kU/vuo55YLr3PLjog
	5cKrlzDlWJaQ9xxvUZXFD1t2BgzqimhdAWlZrMSCEow0G+qHqd7P2oyWHF6aE79/DSz1tN+F4SLCZ
	40RChrQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqjW-00000007JBO-1pgA;
	Sun, 12 Jul 2026 09:44:22 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqjU-00000007JAd-0Wck
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 09:44:21 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cacb8416a1so19056695ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 02:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849459; x=1784454259; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWz2OfijInLdOPGknBP5J1OrsIKrh2Wgu00STcMnuow=;
        b=bBJfxi7+GDtdlaZ7aLSTNXHS9otifgxQ1qk1SHUkIMKFJ9hF683UMngOI3UXwMtqSr
         0rLYmv3cvHd3wuBm/d/D9NabvLIIqQblou3HnjvMBT6Dd5zj3q460VIz7ZRqHhXO1sXL
         g0YtopM5D5u7sYft52WIToIMe8s+grSWWZqd8CCb3QTDCIQhj95w2wBI0XNjhRS8NqgW
         irAOsB77ZQGYI1iOTU+n41f96GP4OvyEf2LDc7O/Xeanr+bof7RlrnJ+KlX9FCjs7q4r
         rMabW52qGad4xUyygaf5AmVrB8Iv/nDvlMrucO6u8aqIRErQH/w+QYfxVG92aiFHQj78
         fotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849459; x=1784454259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWz2OfijInLdOPGknBP5J1OrsIKrh2Wgu00STcMnuow=;
        b=Fy0N6lMH9+JC1Lq1kpEJuK42MwlBZf9D7X8Bn93g4igaOEFzshBJNJaUFjSlZdMJRp
         TJtK5JeuJIDA0bs9eGkunYWjruxJ/kldtffPUI8sEXVL/BIiXdeF8f7NAfdVDvQ6klln
         7YtUc1djecLcKMMU3jMxYZN7blkzL0zKH3ZDw3+iHEh9TZTuwWLw3TxXnCoyXE//frQK
         XWMwa/SIyV+9Rs5GiW8NR+YI1VPerT3hn4xC6qyIfxER2DW6wLDse9Y8+73sL3BmCy5z
         n6Xqb0u7jtAs5VJurJcWY5Q3gIx5pdvSkCsYMTd/9TC8ecCKs83eIF1SKzNaH+GhXZiK
         bDhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQ8E4r4hCZ/MHzuRgxPxA54/bl0Sv4lWBzKa6MOiuUncvrIRUOKrIHLaETU0pwtC66CP9xXJ91qUUueVcFve0I@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0ogacySm1ZQ03/MG2+KXiHjAq73p0n4Q3+7fiQTmk9EZlbHb4
	+rTt2KVKR9Z9M1Y50LilOvYdUsPjPtXQIGH0hGx1HMZkLhqjnTqE7rEb
X-Gm-Gg: AfdE7ckY7pho9aCCmyXcLWkqG0J8hl7U0+qmEsApyzR8JgfqPssJJ+mSueLrVR5PY8Z
	+fMw8kv/hbg+mS5LxtqalOGXnITYtyd3x6CBn9ACuMmVxbgrAhZj8CW5wliVcIIWn8xE35Mgono
	JvbUPqQnE57uWfrMnv52itsTscjgquFf7mrar5znrTYilrXip6CBNKvrVKdXN+txf+hCpquAYVi
	adfVh0+28ECUIaxMa6vNAMTUmyZ0VjzLeklXSh1HVplAXTwLqXJUW1IQlxWfrM5lqDFkhbDloCZ
	O7PVrSXPH3XHrUt7Y3VM19Me0KbkbK32hnOA0aKTIlkw/x0MJI5rCPz4H3YK26ZPYZiTEyEMR+6
	WaphXpMtYeRekkXgS9bH1ydecWb8FKPQMeltsIIgsbw72gF4ZmrKg02coG1KYYjKxTD4Lk4tCCx
	7kzse5/IanZru9MaVDKOHc7kb3/Z7yqg7kuNZtMqXfqf3qKFbTchDKyeLH5ZscXrki4e+OG4wwp
	Q0jX8Lnzno8gPKgSrhcBMPEMe80AESblIwdsjy3Q/MvwT9cX0GqoHp149rBY/EuomKXrMTya8E=
X-Received: by 2002:a05:6300:4046:b0:3c0:eeb7:28b with SMTP id adf61e73a8af0-3c1102d7fc8mr5637252637.8.1783849459284;
        Sun, 12 Jul 2026 02:44:19 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:18 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:21 +1000
Subject: [PATCH 02/12] arm64: dts: apple: t8103: Add SMC hwmon node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-2-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=664;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QNw0DCiBD4kwG/HsRck40hRwum9n25JWMD4YFMUja84=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU+kpm/iPhJ+TmVfwJXVy5fLFx3RnMWRwxWgKxxtc
 0tvkkN2x0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKr/JjIytNxpWqy9rNHopoX1aanA3mATTo7UFVsvzjHr85LZaajxmZHhSGxx4SO
 1Y+5c/x41SRku75+8X223JFPvnbwmw72/TlrzAwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_024420_174283_B43FC5C0 
X-CRM114-Status: GOOD (  10.56  )
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

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index da774096b667..4d6a0411f086 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -918,6 +918,10 @@ smc_reboot: reboot {
 					"boot_error_count", "panic_count";
 			};
 
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
 			rtc {
 				compatible = "apple,smc-rtc";
 				nvmem-cells = <&rtc_offset>;

-- 
2.55.0


