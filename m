Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F3AD41C15
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 08:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L/uGdh4k87UdLsVlqrkIfn4gIIwnutqsKO4ayJkibeU=; b=MdtI1Jvc5SXSUhsoypRPTvjKDZ
	wGfhMTnw/ArryUSyz7Xi6YnaN/VUpkg1fWk76/oCAXQbBilWj+wvcho6Z1EQ2UNjK0XGBGx4CRKm3
	JLH8nMTgtp3OLOMFBMhuVOo3yALRXf7MNLX5/Dti/FPjKR+zOSHmEIKmuZG5721j63C48gIHZRwkK
	NL0/eE45Ur0Qck/de/etRiWNy9sstnDpyGZ+G6UghvuriIJ4nmmMOU1SJZ1NmlibpNu+RUYb5nRRN
	trvVpkCkmruVWj78VnsAzcMoHLjxdZF7ZNMWOTj31FJ2Ojj40FnLwd0InXcL8PnC4xa9oLmEcfquH
	uZq/6RlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8aP-0000000659n-3Sng;
	Wed, 13 Nov 2024 08:18:49 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8Yc-000000064ri-0OmV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 08:16:59 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20cdb889222so65623415ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 00:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731485816; x=1732090616; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/uGdh4k87UdLsVlqrkIfn4gIIwnutqsKO4ayJkibeU=;
        b=ADaydBn6PXJNjYZhLfFsLaw3LyIa/GKKTQybI7TpPTOzC7sfuX3Zbbrao/g5TEsDQS
         TsdGZcZLXGCffidrbNNSlMu+KXwbe9A8ZNbPRk39jzZ93weLHpGPDQUKya90t5EfBf8s
         T1eDwhw+22i+N3DsqppX/YDybhtUCrDVPSyAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731485816; x=1732090616;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/uGdh4k87UdLsVlqrkIfn4gIIwnutqsKO4ayJkibeU=;
        b=gt+1kj3WhMvCRlXNSlv8bDDJbpsIKE7HuWGqCJKMlv6qTkhOS7c374b26Rn8ABm3Rt
         ggz8s+qdxoSLeGlhAZbkhDrZmKJty/QQQkCZeeaNSYCFRY44volEux4v+0XIPHbVTFfC
         2K/BJOj0/wwV4mvFDt9dJLmFGYLilmwNDmJtCIHEPcuNXNjurtsEBWpdg6bTEAXrUKOb
         wnzmbEHZudXrJeCV5NPgS38AxcnH+0GRL4886HEYPwBAg4piejE/kQZWaelMWoe4c6Af
         UJ2gLix/FqmVx1+XFnkOlyJBtClSfjCeguHoiw5t4FWnj4RSBVclmlZiFbk6uo9OZabl
         N0uw==
X-Forwarded-Encrypted: i=1; AJvYcCW7IcLQXl2Q++SV7L+YHlwUkIaG9+tcsH9b+WuAk4g1+wgA0ICddWcQHL97mpAa+iP/1lXNNVKAgifdjgR7WyQx@lists.infradead.org
X-Gm-Message-State: AOJu0YwPs/1n5h1tBX5XVTLw+a+iS0QTwTZiHc2usDsD5b9f71D3rtbW
	kYx0vjOMkybBjebtuiYKn/f/ubrmRfv3UMSf9xNvZLhf+1xP9D4HQY62XQSHLw==
X-Google-Smtp-Source: AGHT+IHPhYwkzPsxjo/RCUL5hnCpKp45auPZIIYVaYgX0w4KzvUg5iggyNngj3Fzi9Z6NWyiw/1UDw==
X-Received: by 2002:a17:903:1ca:b0:20c:ce1f:13bd with SMTP id d9443c01a7336-211b5c3f07cmr20960895ad.18.1731485816613;
        Wed, 13 Nov 2024 00:16:56 -0800 (PST)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:a280:b47c:f4f6:1c31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e69029sm105462645ad.230.2024.11.13.00.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:16:56 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 13 Nov 2024 16:16:53 +0800
Subject: [PATCH RESEND v4] arm64: dts: mt8183: set DMIC one-wire mode on
 Damu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-damu-v4-1-6911b69610dd@chromium.org>
X-B4-Tracking: v=1; b=H4sIAHRgNGcC/7WOuw7CMBAEfwW55pBfSWwqCmgpoEQUTnImLhIjB
 wwI5d8xKZAQNBSUe7qdnTvpMTjsyXxyJwGj653vUpDTCaka0x0QXJ0y4ZRLRqmG2rRnMMJyK2S
 hJNUkvR4DWncdMTuyWW1X6yXZp7sNvoVTE9C8IFQzCr5DuLiAEDkw4GUpaZ0ZUVm1qJrUced25
 sPhiW5cf/LhNgpGMQ68u0SREIxrWSlkueL6HfHUiPJbT6ZeoXRZsLLOM55/TP/1f/TKfvfaD8P
 wAFpDMEK2AQAA
X-Change-ID: 20241009-damu-a3f2f3478409
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-2a633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_001658_181941_7CB553F1 
X-CRM114-Status: GOOD (  11.55  )
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

From: Hsin-Yi Wang <hsinyi@chromium.org>

Sets DMIC one-wire mode on Damu.

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v4:
- Add Reviewed-by tag back, which is dropped in v3
- Link to v3: https://lore.kernel.org/r/20241009-damu-v3-1-1294c8e16829@chromium.org

Changes in v3:
- Add missing Sign-off-by tag
- Link to v2: https://lore.kernel.org/r/20240910-one-wire-v2-1-2bb40d5a3cf8@chromium.org

Changes in v2:
- Add fixes tag 
- Link to v1: https://lore.kernel.org/r/20240910-one-wire-v1-1-d25486a6ba6d@chromium.org
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
index 0b45aee2e29953b6117b462034a00dff2596b9ff..06a689feff52945d141d196d439cba034f25fdf6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -26,6 +26,10 @@ &touchscreen {
 	hid-descr-addr = <0x0001>;
 };
 
+&mt6358codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+};
+
 &qca_wifi {
 	qcom,ath10k-calibration-variant = "GO_DAMU";
 };

---
base-commit: 75b607fab38d149f232f01eae5e6392b394dd659
change-id: 20241009-damu-a3f2f3478409

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


