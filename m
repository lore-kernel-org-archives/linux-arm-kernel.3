Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D136CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wPNaLL/lRnmYBv02gv+r31xije2DSp+tQp2r9q2gp7w=; b=5AXOQJYcQ6PeeYh2dRL/Rmp89J
	VkEIBMWx+PITrRz5CAbfJ8jvgAqlpdJiym5CCtL4MYjulSp1Wae+u4TfARJS50gVwd57odhwDN2wv
	mc9SoIR4mRZk+XSBkvwS/734gIT2By+/QHXXwo3IG44dtj/FBxzX1UIclNn3LBMB6UBCReM6L3TZL
	yDiE7r73uznV0jThQLPddIMySrCdbis7MwsT/+uuoNqUw6hZro6+QKMxyEyONlIX8Hw5Nn034CTEO
	Cev5g+iVMNnibsOaW6/uete1FPm9ch4V7bPPsU0MbupGsYc3D1XIfh2BF4IrXf+9rV+wCap/1zOwh
	/0UKgAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphkB-00000003wVx-2hfn;
	Sat, 23 Aug 2025 06:28:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQfC-00000002RpI-1fvH;
	Fri, 22 Aug 2025 12:14:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F230A589B2;
	Fri, 22 Aug 2025 12:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE97C116B1;
	Fri, 22 Aug 2025 12:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755864873;
	bh=Ha0X5JrI+INUGhOxL0Mkekxtn+SdZocQ6T0kCcGVwaE=;
	h=From:Date:Subject:To:Cc:From;
	b=lpjOwmDGkhdxh7T2QrHk8h/Ifwv/94PsOCsCJIbaPAs5xuMJv0vIgjy8eAGQEbdjO
	 0CZefA3+jzBWGGPgKtTXcRP71BkKKtrrTTZPmeiFfjJKM4plOEZQxg1duCbvD0xCTw
	 wsUU/nG6oSJjUYWiZiJCtTn1TXPte7Rd5CNKcDh94DvzOLGf76bE4ujuSxwfobKqeb
	 uOEflFmCaJrVfgjaTIHTNaUDZRezaZJjPAU6iL9otddIs1Dweyac+urCETdgo0QiDE
	 EFfmDCgzwcCEsgITu5Q/UwjYYUy6NXzw36AvnZi+hHJUJRC5gZbjqNdI6/S56//CLt
	 xtJgPpGyHEdDg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 22 Aug 2025 14:14:18 +0200
Subject: [PATCH] pinctrl: airoha: Fix return value in pinconf callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-airoha-pinconf-err-val-fix-v1-1-87b4f264ced2@kernel.org>
X-B4-Tracking: v=1; b=H4sIABlfqGgC/x3MQQqAIBBA0avErBsopZSuEi3ExhoIlREiCO+et
 Hx/8V8oJEwFlu4FoZsLp9gw9h3408WDkPdmUIOaBqsUOpZ0OswcfYoBSQRvd2HgB7UNMxk7aes
 NtEEWavmfr1utHyGI9/lsAAAA
X-Change-ID: 20250822-airoha-pinconf-err-val-fix-38f6e78538c7
To: Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_051434_510108_B9DC69F5 
X-CRM114-Status: GOOD (  12.12  )
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

Pinctrl stack requires ENOTSUPP error code if the parameter is not
supported by the pinctrl driver. Fix the returned error code in pinconf
callbacks if the operation is not supported.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 5f1ec9e0de213d587b68f41d3458cf504ee1b21f..1b2f132d76f0aff78768ed846e8d5980e5b46770 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2696,7 +2696,7 @@ static int airoha_pinconf_get(struct pinctrl_dev *pctrl_dev,
 		arg = 1;
 		break;
 	default:
-		return -EOPNOTSUPP;
+		return -ENOTSUPP;
 	}
 
 	*config = pinconf_to_config_packed(param, arg);
@@ -2788,7 +2788,7 @@ static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,
 			break;
 		}
 		default:
-			return -EOPNOTSUPP;
+			return -ENOTSUPP;
 		}
 	}
 
@@ -2805,10 +2805,10 @@ static int airoha_pinconf_group_get(struct pinctrl_dev *pctrl_dev,
 		if (airoha_pinconf_get(pctrl_dev,
 				       airoha_pinctrl_groups[group].pins[i],
 				       config))
-			return -EOPNOTSUPP;
+			return -ENOTSUPP;
 
 		if (i && cur_config != *config)
-			return -EOPNOTSUPP;
+			return -ENOTSUPP;
 
 		cur_config = *config;
 	}

---
base-commit: 0ae621d78880a406f164a719150dfc66a69b7148
change-id: 20250822-airoha-pinconf-err-val-fix-38f6e78538c7

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


