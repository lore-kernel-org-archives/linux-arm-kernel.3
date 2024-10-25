Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C57D1171E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 08:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDPyjQLJxhu/7enVOjQXyxhVyvrmjes2kCFmydRLWN0=; b=oiOtRX9E7soLJCsP/0rsA6Uwwy
	ng1bbyLZsAT+iz9XyljOe54Ef6DzSpjq+9NkfvpXMZ339lPg+fOnt61WeBwjMP3oXoNky+giNAWM0
	O+2NbLMz1J7H4yPFN/3jiHIUU+0vY8bnQSTJhTTQUpgzxSyWgT1nD8JahUeEOR0KBU6zWfqs2jh3B
	zj9RHV4JuzFoOCPePmTg70rCHWbMtB4UqPRthuF+9QgFGxuqWckBIgRRoWSZzmjfEQxZerrezmi+G
	DMV3VJCNOgyLu6tukc5R8A8I6TGnQwFgrGt5sLmSATT7s1LvIsTWOFUABCpCJ/5C2EIrLuyXBYqAN
	EScghWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FSQ-00000002wf5-2vxd;
	Fri, 25 Oct 2024 08:14:06 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FIl-00000002uC9-15gO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 08:04:09 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71e681bc315so1208179b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 01:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729843447; x=1730448247; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDPyjQLJxhu/7enVOjQXyxhVyvrmjes2kCFmydRLWN0=;
        b=mjzev004VgHmy+sx5K9bQMIRy3UO+AiaRT5Ocl8U2Yj6qAp0TfOfZEyoByMdpYQdIv
         P6caf19RLo+/fVl96SNxA/y2KEI2gnneg18NJIEk5Q+aZPeCfvRh/cf8zfoAM9ztWgST
         rnz0GjM4FxPgDAk6Oj4T0WXjfiyAhxP5FfnJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843447; x=1730448247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDPyjQLJxhu/7enVOjQXyxhVyvrmjes2kCFmydRLWN0=;
        b=PAXFEfD8laUsZaJx537ZCRnz+n4x38pAmRIv9FEVd3qynNBLmGqfLEKFTkBi15fSBx
         J/POQxJRnq51nak0MND84/yKrP5BerJ1Tf9nJJbOh+0OaQpj0D1+cpo+oddx9OOyN6pQ
         AXknJAMb0SDjoGBbldiLMOx0mB8DSUbyE4Qc13DdGOsfzwGM0ZTjZv65+gFno0afZJe2
         PFrOhL46+kcdY68VKt5DlM5UoyCPT29EL+gPVdYj24TxyWlUz5vCeOiK69+lpd4I3Yxl
         4Rsal34QE+NYAov1Me5Ai7QOVfI357ykxb4LZA6VrcUkC1AdjQfMRQqlwCNYh2rJrKHo
         fpgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpsJuMtLbTSwFKcOM3pPTiJJR1cWxnonoWas1FLS6MUhlyRUpyoTbRRxtNheSyqzBi7e2oRRwviVFOB0X6SNLU@lists.infradead.org
X-Gm-Message-State: AOJu0YyEwubjJ0D0syWfvxMY08jXUJx3EdnYhq1EoPsIn0kp5vkz4rX7
	ph2DnByA2Kbr//Xz/wr7TYQWwHmR5QkHvc6Jll6Yu7GlaiSl9QLXD+aUrvt2Pw==
X-Google-Smtp-Source: AGHT+IGMn5krXr2bDxQcM1KTz/KFZxm5bU1vktXqYGrTsZ3ivU3U8tGvEyAJw5wPsjNKYodNBtiSog==
X-Received: by 2002:a05:6a00:22cb:b0:71e:4a46:fdb6 with SMTP id d2e1a72fcca58-7204522aff7mr6540383b3a.3.1729843446565;
        Fri, 25 Oct 2024 01:04:06 -0700 (PDT)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:5a9f:16cc:8d5a:55e5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0d025sm558120b3a.101.2024.10.25.01.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 01:04:05 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 25 Oct 2024 16:03:51 +0800
Subject: [PATCH v2 4/4] arm64: dts: mt8183: Damu: add i2c2's
 i2c-scl-internal-delay-ns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-i2c-delay-v2-4-9be1bcaf35e0@chromium.org>
References: <20241025-i2c-delay-v2-0-9be1bcaf35e0@chromium.org>
In-Reply-To: <20241025-i2c-delay-v2-0-9be1bcaf35e0@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
X-Mailer: b4 0.15-dev-2a633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_010407_443920_0568F4EA 
X-CRM114-Status: GOOD (  10.33  )
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

From: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>

Add i2c2's i2c-scl-internal-delay-ns.

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
index 0b45aee2e29953b6117b462034a00dff2596b9ff..65860b33c01fe832f3a4b2e21d24ea6b4f0cba2b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -30,3 +30,6 @@ &qca_wifi {
 	qcom,ath10k-calibration-variant = "GO_DAMU";
 };
 
+&i2c2 {
+	i2c-scl-internal-delay-ns = <20000>;
+};

-- 
2.47.0.163.g1226f6d8fa-goog


