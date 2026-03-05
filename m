Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E94F47CB5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 18:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ccr3eFLctFLRm4T0J5zP7W0RnljL80za7RGedxkL3/I=; b=bKa7Ik2Wo5bcNh04SMZcH1gFWG
	5RUIwkVzmD0A7ePB670TG8RKy1sdPsM0t9ASNZiiVnm9UqV3lvPVVECC6dWl1bxUlaxPFVZaf0Rze
	nL7SnGC8OaJQosAsXPIsi80QMAlQAFszp6ofHycVolAuxT5K4Iyaf0k9O6z7IykF/C7qmdVYszP7H
	4u7XTkjfc9FbrRSvRdQpI7SflEwXRTcuy6ujy9xB2rg+hGHWRON7mMEjyA83+yFfQKxfyAJSqnqSt
	6kXgMox4sgVDzYKiwbRMpEKpyQCIUDPRoUTBs765i5hvU0SPX32NfloXz1xI6QXaJlpVKgBFWMclU
	RZf/j4kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDnZ-00000002Pig-1pbL;
	Thu, 05 Mar 2026 18:51:49 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDnX-00000002Phb-2biT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 18:51:48 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3598df39444so2905489a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 10:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772736707; x=1773341507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ccr3eFLctFLRm4T0J5zP7W0RnljL80za7RGedxkL3/I=;
        b=KmL1xfOB57veY4Tzytp0dP+uDVTrDapaYkLtiV5jptNkPQrtQ37vHSB3mUoqKW815f
         BLVXURLBLyEKtamRbCuc3ym8h00HBjmE9T9sYTNeATdeuunis9WupW0/SWj+cfoagKIN
         J5GvD0TGIy7+WOn4Poom2Wg5vJMY2DAnSWKduz9oLk5Vr67uaXZyuczdpm3m4mlvoy12
         Ac4O8wUWJerowpYBfNnMExHO4GzH5fGlZpyaTIbHHc/fahiKIly90sQyeB1DFyU0ltbM
         YDr3AU6/Seo/ITK+2svAQTqlU9rsFaG0wAEBVwr+P7+T/YAl35sU04mQ7LUknID2Xy7U
         vnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772736707; x=1773341507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ccr3eFLctFLRm4T0J5zP7W0RnljL80za7RGedxkL3/I=;
        b=B+ipqLkOubdIR2ujGX9WzCdtTr6gfDzF4ku/SeyrdCKp7uQp53QOQKaYQ1Ts1m4B1P
         RKkhsRgRZJVH1VDaOjEhugUZbg8uSR1mBqcKPmQTAT4g3/P3VG/+QEdmo2KLKah8+/w2
         Yi9eEH7QGvrPs2jK3lef0rVnRvfBgitB3KsTRWW1HS403ec6o9GK3sSm0+7pPC05WkBN
         VQbGsdRYLGmTvO9q9TubgkiXiWkQ0SoNS9XCxLqcCafX6kE9uwxirPF9HSxDVQFsOEhG
         KmuJ2OEF3oJNlgmICdz8jOFuWNxHxhhP0fA3Lty4vbivZqoFZv05RTbmPRQyhBIq+AMl
         6lgw==
X-Forwarded-Encrypted: i=1; AJvYcCViPD1wUyA5tGJGFH0x+y8mJygbu4FJ4ICvc317WnfEQXqH+j4X6gruSrBmdPSYTwNY8F2kn6Ppq0PBk3qph3bS@lists.infradead.org
X-Gm-Message-State: AOJu0YxN50MHa4WDWeagVkssaqfKUL/FAeXRsQkaI8BGDD8rp1L6hV13
	KRiT0Aw3y6RybQPsqrf39P98VR8HUsqCoTHX/3QAXr2UPrWbDnM+E5le
X-Gm-Gg: ATEYQzwiHNwaigE+ZSRNuoWExNfcvej0xFt2pnGu0GaGetAO0K0Iglczo8G6AEgaybV
	b2QhbJ+j/Ow3u7GWKGBFzrwoL1nzjwGalQ1Y3/4M7BpW8BZinx97Htq++M/aeHKaaFVqZDo+6zv
	ASnFYo1TPd+cnswwMZ8+nCrSSVDeaD1C1HDdjRdjx6IjzaEWwo/Xw2ar/Oszz6GAMMALNLFmfTf
	HotNlsvq6S3gcgsoc0GVEnN88OzzXz0jNj3Ojt6dgRO0EH+TxqEFRzLSihUFDzVL9oUUCmesjH1
	OPnERXMV+KRIofoKGpGDDHyeh6C0msDv1geu/2J8JL/+gO2C6q393ndOVwGZnaEQjMpxnj0Hjz6
	sR59CwpXY+H8uKpJqs8pK9lnUKOKZ44NJdr2MuGYEYcEcXXN6Act9kBKvA/142S59ueUCvDCPi1
	JWUv32Os+qTs1cis14vRS74zLVG+nDP28k/cFbby00vD3CF6gE/OrkL9bG3AgVVXd2XwJ8ZNEm0
	RZ5crY=
X-Received: by 2002:a17:90b:3945:b0:359:94d8:34e7 with SMTP id 98e67ed59e1d1-359a6a7ea1amr5228450a91.32.1772736706964;
        Thu, 05 Mar 2026 10:51:46 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2e14821sm2769158a91.17.2026.03.05.10.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 10:51:46 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet 10 (Wi-Fi)
Date: Fri,  6 Mar 2026 03:51:15 +0900
Message-ID: <20260305185116.781184-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305185116.781184-1-akkun11.open@gmail.com>
References: <20260305185116.781184-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_105147_660952_4311617F 
X-CRM114-Status: UNSURE (   9.97  )
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

Add an entry for Lenovo YOGA Tablet 10 (Wi-Fi) tablet board,
named b8000-f.

It belongs to Lenovo's "blade" product family, a codename found in the
stock Android "ro.product.board" property (e.g., "blade10_row_wifi" for
B8000-F and "blade8_row_3gdata" for B6000-H).

The "blade" family includes several variants with different screen sizes
and connectivity:

YOGA Tablet 8 (8-inch display)
B6000-F  : Wi-Fi
B6000-H  : Wi-Fi + 3G (Data only)
B6000-HV : Wi-Fi + 3G (Voice)

YOGA Tablet 10 (10-inch display)
B8000-F  : Wi-Fi
B8000-H  : Wi-Fi + 3G (Data only)

These devices feature 1GB of RAM and powered by MediaTek MT8125 or MT8389
SoC. Since these SoCs are tablet-oriented variants of MT6589,
they are grouped under the "mediatek,mt6589" compatible string.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 382d0eb4d0af..ab3c5b1152f0 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - fairphone,fp1
+              - lenovo,b8000-f
               - mundoreader,bq-aquaris5
           - const: mediatek,mt6589
       - items:
-- 
2.52.0


