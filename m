Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3D6C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 14:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKo0PbduxVqaCMeHxby+gQYFixdrgfyKcUIaMfXcM0Q=; b=uLKK58gMne2ZvM81kQ9pUdcIMx
	P0JX+UjfeHgn/bihSOQvC4hJdYLs4iQXyOydiz4Fb873oiOD4UmJqhJpvheb1NVts8Rr72aJK9IIu
	C8ZNXw00S2lufuBRKvAe5ftNHzGhj9slKFzsNOqE9MiOfcnWfJAtkFZGSilrVocsKhwuXHuEeXZKh
	8IbuBbMoyYt8JmzOAp1rz1MzZ2vm3XA2G5iTAWgfsJATBWs4WBdFo98YIJ+O1fUIjmnOp9FJe8i/a
	vvBsnrT+J2sLFKtu7UUrygyfufMDShKKpOXwvQIrsnMv59nPgwnEb73EFrQTedGN/A5zTz9ECptrj
	uUWN+7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp51e-00000008Dmb-2MDt;
	Wed, 29 Jul 2026 14:12:50 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp51V-00000008DhY-1nqG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 14:12:43 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47f707e5d75so721878f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785334359; x=1785939159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xKo0PbduxVqaCMeHxby+gQYFixdrgfyKcUIaMfXcM0Q=;
        b=pRKn9Ca6LQhPPuxU3aZWk+JCo1NuL/xjwRdy2H45aFQdC+aRjn0JDBiVRcZ8mDfbjp
         n3EM1A0AUT1w2NcdEFr41rSeIcgdxZgah4owc6WqamnC1drz3KwwQJ9JYGfvV9ZP8UxT
         pOythnWnjSOC5QcqCNNVs05k90bEqG8DCpYYOIFJ/t7srgK9GvsPwC2GB0xIcY39Towh
         umORa8IsAvPodqE1PV6m3sdQYY9boQnEMnKh8g7FIva0smWQWBdTTN1LFhDozvZ3sDHQ
         JisLH/VoLWl7G3k4HMQgjWQ24gq+IDJgi5ar6uJaYSEBTD60GIgUXB0xMLPuFT/K9J7+
         8LLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334359; x=1785939159;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKo0PbduxVqaCMeHxby+gQYFixdrgfyKcUIaMfXcM0Q=;
        b=XOTCLQ1Z3ADXkrSJU9NJu+DMJDFA+AzId5hT3zesZdlg0cHcnVTNDpFN5u5/MUcGIa
         kNjNr3Xn+IhB4bLfmBTN4hc0o/pvoSXLYy/k+Pcpjs8UIs84U4zCFJHmBJGXe0JJGyOe
         dhLYLKa408kePzsN2aRBgK9AbFQXKVX6ZFZGbyMhwP1Csv8bc0kA7nn2ewzqLWpqmiG+
         24dEZ1YstCpI5hz/+WG/mChKTQqdyf36Tv+MI7SMAFD4C6OOgiZAaOn0WWvwJkHeJg26
         zP27zThG5YMXRZBGPxIA9qRou3VavIRXT8M0gXsRhh7FkYVex4EaWmUHFN5uuJbECcla
         19Gw==
X-Forwarded-Encrypted: i=1; AHgh+RraqsRQlCfGXoeeL1eqMoynkZfjVGsvUTiTsxM0YmcB9ibxxBMgDuqzYHfylVKrmQpf3crNCpDtVM9ilx+HbBXB@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz8O8bCvtPiv2uUE6yrTsndj+e0gupBGLfz9XePK3oJ+FwqSuo
	SlVCxVm8gDaj8+Q/7auyT3BUOtt9jAIwuM8IUc/AL9JVUYiVpugzzcYw
X-Gm-Gg: AR+sD10wGDwouh9Z48mWKQp3PNgdPYa4LYjJy9GaF/MeH1auVLTyzsX0lePQpje+6IP
	zYgj31XRTQVLARAyO4VJzg4OrcHYGdRufvtO1ZvzOOqz98FoeB+KQKHo9837iV4lVUIXxCH/OkT
	LGLJuNSVy9wQnX2fuBoc7IoqJCquMRXbPLCFFSboT7mbRJU84FPf2E5jIOTlFkIO70hntXL7kM+
	ED/wDr513KQZIyKsOXBX8MQii1gN8he57E3HVY6tfa3xvl69MNZcKU7uzy2UkFRbZwbQWZ8yFwj
	i6IeHiK6ZmBX+sKuQuZ1FaRrB9C1k5QjUGpCA+mxQwCBhUATHxwSQ7g1/RWDchMdkgPbu6tLdVi
	5enH6E/UKgJWD6ELTsPNoXdQ7q30DCqW0MhwfIvfxk9/cHZ3e6R7dTvcxMe1pAXO71sliCHgMWQ
	hxwcZMvMQ0D/qrVAbDsGei4Pqxi/9ayAyYNsdgWphL4fxAYdaIdZVc+oRS1sMP370Pq31i9TJy9
	g4H+H81FtJEoYfRx/karGe0lVDKEOGh
X-Received: by 2002:a05:6000:4918:b0:47f:5a97:2a5d with SMTP id ffacd0b85a97d-47fb1e5cd25mr8567174f8f.11.1785334359421;
        Wed, 29 Jul 2026 07:12:39 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ad01b6sm8955482f8f.16.2026.07.29.07.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:12:39 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
Date: Wed, 29 Jul 2026 16:12:33 +0200
Message-ID: <20260729141234.65037-3-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729141234.65037-1-robazzalberto@gmail.com>
References: <20260729141234.65037-1-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_071241_478654_45E397E6 
X-CRM114-Status: UNSURE (   8.84  )
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
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
which is based on the Amlogic A311D (Meson G12B) SoC.

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054..2d6ecdada 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -167,6 +167,7 @@ properties:
               - bananapi,bpi-m2s
               - khadas,vim3
               - libretech,aml-a311d-cc
+              - orbbec,zora-p1
               - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
-- 
2.55.0


