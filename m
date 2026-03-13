Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533F7106FD6B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 02:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFzriUvxyUouUh/14v5VpqktDu3zVKkfn5cbsv15Ta0=; b=o9qBU6e/WPN+Fa9QZ0fGJ/1F3R
	LzBDD2oqsvDBsyl6dHvBKjb+8yctbONwNt9LLm7V9+qvKxXrk++jdKdmv3jOOIxaiGBIMIVqjksth
	+Jml6ddviazBHqkOrRDmktUxq8+AdBL5E7GADTmLHDRU2p7KUgLwYCPZWhcKRTKgcbU7JrAsB0cao
	WASJhheG3q4LDNQV3yw4xClHIMAQ0a5FHPezK2ViR5bALsFTdnQaDJc+c7GGfvp9xl7kc+U9UAMBL
	1bCAGs0GhhCgAN/HNG66K+Frmgf7K/2o/siMBw6pZExb8r5Ds214OWqskEnTHEKwYkBSe1Y9Jf+ku
	nasvISxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sWa-0000000GHg3-2omf;
	Fri, 13 Mar 2026 02:45:16 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sWV-0000000GHau-1ffn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 02:45:15 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2be27fa54feso2407562eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773369910; x=1773974710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFzriUvxyUouUh/14v5VpqktDu3zVKkfn5cbsv15Ta0=;
        b=nHjPr8j1WaKdTSuUNEK0a5CrzCl5dqk8ygfwucsfeHXIWiZ8+imvvh5iAKsaYBYE/W
         KiRrNP8g9HtUHXZowfyVkqj1RbK69Nk0Ora/i8GcErWeDuagRJ+DCUKFd/EjmyntT03U
         /zA9vNJE/wSaaRiq14ejb0BWswtY0K/Aw1cdEPjNRyIhsJzs1MCnM6RQZXCb6NQyIjwH
         WWyXRT25Un7I/lvnKWw6inH0HsH0k5MzKkIy7SJL/8Wh9MVoI75cGGdHrlmlTqTet7JI
         jRzKN8ttVWKq0Aq7a1bLGUbTwdTnN7Yepon0vWxE5l5dUf3QLO3xwpUp97OkEilac9nf
         FDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773369910; x=1773974710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SFzriUvxyUouUh/14v5VpqktDu3zVKkfn5cbsv15Ta0=;
        b=puK7ZmE6Ogd2XaXnhjm66nKXaE5fFJviRs1/2tzGGv6P1DrmMZ+ivqhU5j1pLSn8RU
         Q11Zrp4Ewjz9NbtOh3RnZAv97DbgCr6Zcnc/8j0MZIzcsm+Ama2BBpNAZwVBKEz94h5R
         AybHV89Ibu9W3MgyEwQOduhHs3xYse7hQYtehOAt1TWdQoi55NLLk8ffLLSzwsC722Rb
         dxMG80izWLFp88dbyGnWHLtMu0HzlW3KOsgvuTd7LvKI1K1iViXMSH6HM/eVFoKpMCdV
         w5GcJNk5s8mA0R8TnerMQTpgJBAjPSpk5iBnAK+Bisum/Mx40CZp7uvSqNrJZMQ8Lmib
         F7sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxdpgUduDDXgFr11HWDiEhnLGJrP3TNMnr+k3abiOk7oAu55xksUf4iw0JTTe5KEN0ja0stsd+WGbS6AxrwTbl@lists.infradead.org
X-Gm-Message-State: AOJu0Yywk1C0UNGQR7pE7zM0Tq0nwvkTN/06cOKhOyH0dcXAD6hfRhik
	urqEI66Bbz6H4I3fEDRHyB1u1FjsUgDsguWNV4nJLdoAEdcBj61VfUPJ
X-Gm-Gg: ATEYQzxLl3y/xjDiYLRK0x3Gg3MoxWnelAEyVlkEn2VRmAU+JtV0Hu8iSIrwDkalD2y
	JpVLZZR8wYUfCNT+6YFWfyRRfRDG50xACvh6C3mFfOMkrOS7K25YeUAwJTiUnx4pyHHJlemDFQ6
	Eh7LYcMJZe079yI0Bl5cQAb/QwNdZvSHvAy+kPp87VolW+B/kmsiYDocxwB9HrkmOAWWnKgUoiH
	yKXakWP0pT6uL3TWIFz1IBx4WhhwNMB/zD5LYts3HoGe9DZxUhIPCZHMmmZQGt80hwdZWMSNb/w
	bgbnk4/0M80J6vIZuq3/YTApTuQ9lumuqsM7mVWMThB0xRCJDZpy8I3CSSnd8Ie9q2hxDd7Md0G
	z3CG+nNZC24TobduOe4prHGvuCcTqicyqGBBZwUT8nr2PKRzMJOx8JdB5PF3yMp1iRQQBGiyPDv
	QZH38dPviU9voJxN5Qn9O45rPdF6gl+t5CnpH1wMobLmxCeDUHmYZ+M0REokPC7CS1z01V
X-Received: by 2002:a05:7300:7c15:b0:2be:85d4:4a2a with SMTP id 5a478bee46e88-2bea5398545mr806874eec.1.1773369910271;
        Thu, 12 Mar 2026 19:45:10 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a803:148f:62cd:a5bc:7e0f:18c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526db0sm947919eec.20.2026.03.12.19.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 19:45:09 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 3/4] dt-bindings: arm: rockchip: Add Omega4 Evaluation board
Date: Thu, 12 Mar 2026 23:44:50 -0300
Message-ID: <20260313024452.625064-3-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313024452.625064-1-festevam@gmail.com>
References: <20260313024452.625064-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_194512_055243_418082F1 
X-CRM114-Status: UNSURE (   9.13  )
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

Document its compatible.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v5:
- Only collected Conor's Acked-by tag.

 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 91a387621bcb..1e5be6c809fb 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -808,6 +808,12 @@ properties:
           - const: netxeon,r89
           - const: rockchip,rk3288
 
+      - description: Onion Omega4 Evaluation board
+        items:
+          - const: onion,omega4-evb
+          - const: onion,omega4
+          - const: rockchip,rv1103b
+
       - description: OPEN AI LAB EAIDK-610
         items:
           - const: openailab,eaidk-610
-- 
2.43.0


