Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5D41091917
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 20:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EvqUQZCqF37oJV9dJzcVxfSOLY81NlMRRK2XtKQH9vE=; b=u/Ni4C0ilUS/QHqB7ar2liq8FG
	CZx4WFrkpXvFX/ze96U8c092XVPPoW68CpwHbCdNmSWh8fWuJDUkM/5T0xoHd8wtFySQnoeV+jW5M
	vj3v0OVL/VOFBbIg42iE2CGrpaaupm54IrUfl7WbbwSA5a8aKT2mLBahxQkcWBuZ4Goz/dKeo+Aqp
	KlbkJ0arwtqRDipkRe6XwnG9TUHuDrAtwbh+Tw+m4iRbUoN4xXLUQnOfj9HW+9WgFYIpwEq8VHqNn
	H40cAlwjFQpA9oXlVUfu/n67Boj2JBrxYLNvFROXEvOKQCaKKxnD7/2vqXhRhuylBlOCnCn3mMMfx
	3sKDlcrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3K75-0000000BXxB-1QTt;
	Thu, 19 Mar 2026 20:37:03 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3K72-0000000BXwO-1piV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 20:37:02 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-67bac077116so628079eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773952619; x=1774557419; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EvqUQZCqF37oJV9dJzcVxfSOLY81NlMRRK2XtKQH9vE=;
        b=z9vdw0i5uw+aPzFPYqzaZBgD8X7K4DvfYtyg0HvrJzWfcQCQU3a0p2qE+lZ1Uo1HIE
         IIXuiBEkgtUoWYgMDlFfm68KZYFEXX21204hw4/1CWmfS8oH1mHNZELsjNulwUgNkQOP
         VGOwoNqJ4zH65Ebfg2k93xvDBMS5lHm5kDUCRIsnLUIMFcqgkBc3AbBS5LNJTVHgGegx
         9qL8yTF4XMGHLXi2QajCzK+vUtoMrHiNRmGlM0eu0x3SKCjO2EWH2oRDpEN6SeV8MTKv
         bUBcyjZcGoW4sxUXI5mCss9bWh6V4EwJ+kVE8xda5PWnN6LQr4BrgYTijFTtWVtlZXru
         1XIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773952619; x=1774557419;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvqUQZCqF37oJV9dJzcVxfSOLY81NlMRRK2XtKQH9vE=;
        b=cijHTn4mYwh/Pm+Os0G5NLS0YyUWThddzYwZa36RYCJR/imXt4MUemHCGYWdwsyBOy
         uU+ExKYF/ccj9nAf8AsY9/gz/yLhjHl1sV2uiZapK7WkV8vDaaTKunayuwUfuwcq1cd3
         n4o5t8FWErBxd3f3mOjh7t63D7i+YKppuUTxVn3R/RMBFuV1wQdv3tIzQLMN0arm4sVZ
         GfjdY4FmXRUlSQdDPvBwwfDsOWygVqWJCQZhceadE4VwFxB3uxPrvFkRCuiKVSHCqTii
         dkqohsXOOIw9U0JDsMxXeEDOmwCAHGrZScGkqhsI6xARihhjwGbryYyEzSMK0GOy5RML
         2jSw==
X-Forwarded-Encrypted: i=1; AJvYcCXNgwTo5w92+I0zY7HXH7y3DNWrwO4+VhYcsyMWEyK5tVxAsGljNWA0HycIi+8P/Qdy1Iu5g6ERx2FaFrSJ0miz@lists.infradead.org
X-Gm-Message-State: AOJu0YwdgGcTFaNWcz+wNrOWgGqiWHu2Eree5tHZUFxZ3dCCpKSEPl7G
	MAC8c90GTQH1uzyDZEtpunnreJM+I4NO6Bq3d3DFNVIx+1CVDxQ6nQL7mhAyjf45/n4=
X-Gm-Gg: ATEYQzxyMyvaFnnu1CGjlJUwqh5KO93+fJoz47jJeT+Oy9yCm7D10j1Fzk1LABYpbRJ
	MsPv8USh+UOrCvPDdPDn6bhxAo+Mv9eWQbxwH/9kPnbveXTZg0g2BIJUIAdARZEDC7+TPYshB2g
	0pBVjFWxxPxWKbN1Y1GLFG5vBaewI5Sxo880+N/3XtdCUmpaZsrmGp0eq4A0Y7+SkWn6TtMASOM
	KgGKhap7Q0Gkj0XJu/hVQMYxQ4cL3QVfhKmDVPNSx8TS0DqtMOiRKayNi9T2+VNvKTaxxyk2s2/
	8vdZ3Xw3YieX6ztEE1LICTnWdHDFWiX8NoEzhV10Cu8p6MO9mtZG/rL11zBAbO5jeZZVcir/pU+
	/pQ2BNwUkAkx9xwx0OWX4AV2CxKvMiYk8Q2+0LbMpoCtK02PAdtODSyxQ6XmjaPFH0lqSeLh0We
	gXErV110r3PIvaToZtdx1gZybOatHp
X-Received: by 2002:a05:6820:1349:b0:67c:1deb:4f69 with SMTP id 006d021491bc7-67c22bb5697mr599850eaf.14.1773952619310;
        Thu, 19 Mar 2026 13:36:59 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:244c:fc8c:8216:1344])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c252acd32sm52512eaf.3.2026.03.19.13.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:36:58 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 19 Mar 2026 15:36:49 -0500
Subject: [PATCH] dt-bindings: mmc: mtk-sd: add mediatek,mt8183-mmc fallback
 to mediatek,mt8189-mmc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-mtk-mmc-mt8189-compatible-v1-1-fb7ef2186c92@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VeRWXfARLz1VYqLOBl12kYliaUgv
 rtpXR2+xfl3COyFA9yzHTx/JMgyJ6hbBjSZeWQUmww611VeqBZdfKFzlLZRTYu0uNVE6d+MptL
 W1FRaWzOk/+p5kO+//eguh61/MsVfEI7jBFHNVOd9AAAA
X-Change-ID: 20260319-mtk-mmc-mt8189-compatible-a62da7c5dd7e
To: Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=5skePx64WNITX84S4NyRGOGsgVrQRd/nLA8489wbHmQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpvF5i18RSPpFlTkJhXKuRHU1GKiogcHWVUfImk
 AchlfWq8pSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCabxeYgAKCRDCzCAB/wGP
 wNTrB/wJp0iLTjLMrEAxu7kkALAuENcVqHfsvkgUSrsHT0Wy0MeoXaG9Cp3UIlJ9gNCXOEoAXUR
 3u/C1no4zCoDG0WMepZn6cHej94IB24DQZVNYdeDOl0OFtEDIuz902EinxNow8JfnAmLwX4w4aU
 RDSkC9kLidPbkFS7CsE4fLWlpRW0eY0OzpN55PuNEq+4jfPIYI+z5k3Qr99oTU+HCCCFVTC9j5d
 YdK7+xKXOz1AGfNSztdM7/NFqDtZPmR/8+baKRZQ01ZnuP85PSnqL5zO5rZ6OVqnVNcCv4ourPM
 WopQsPZ8TelzX2HGxM04ez5i53jSAozyu6LUB+V8ya9GVijk
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_133700_730784_7170CB3F 
X-CRM114-Status: GOOD (  13.66  )
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

Change mediatek,mt8189-mmc to include mediatek,mt8183-mmc as a fallback
compatible.

This has been tested using U-Boot and the MMC is still working using the
mediatek,mt8183-mmc fallback compatible, so they seem to be compatible
enough. And there are no upstream users of mediatek,mt8189-mmc yet, so
this should not be a breaking change.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index eb3755bdfdf7..9160e449aeb9 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -25,7 +25,6 @@ properties:
           - mediatek,mt8135-mmc
           - mediatek,mt8173-mmc
           - mediatek,mt8183-mmc
-          - mediatek,mt8189-mmc
           - mediatek,mt8196-mmc
           - mediatek,mt8516-mmc
       - items:
@@ -36,6 +35,7 @@ properties:
               - mediatek,mt6893-mmc
               - mediatek,mt8186-mmc
               - mediatek,mt8188-mmc
+              - mediatek,mt8189-mmc
               - mediatek,mt8192-mmc
               - mediatek,mt8195-mmc
               - mediatek,mt8365-mmc

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260319-mtk-mmc-mt8189-compatible-a62da7c5dd7e

Best regards,
--  
David Lechner <dlechner@baylibre.com>


