Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC3EEFCE3E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 19:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ecl+MG1Yo+TiJvae6jV2u12ntROXHec567OXIz7U1Qg=; b=QbimH33hWw7mDHh5UBS/1kByeH
	i32f0QTHV79lZTM/fjZXzxcYGFqOVkQhiLVmd4F6CieQZQLP3xLVkeWoc00o11aZFrWf1k9UpxxND
	CzGPmF4cwY8xLgRAKwNhvlZq0rENyfV6x8Or/SZH8mQO2BW9BnQ1FzX9BHdtOYBBeV7m2LqRx+Nq6
	KX77ZX16BMkhEGoENIOrWs0OVkW1i8yS+NQsdRMFHA4dFUsrRFziP8yUXI+/XpmphQRHtcmAKgsvh
	G7KB4eXJTLtLNUVeoClgLfcD7FsidcenOudkR1Zjs/5EGRMTt0I2L3O/QikXOZgrvvGztXfNZqOaJ
	Gmn2P7UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrpt-00000000OXr-0h3N;
	Wed, 04 Mar 2026 19:24:45 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrpq-00000000OW0-0Oqa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 19:24:43 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82735a41985so4300353b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 11:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772652281; x=1773257081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ecl+MG1Yo+TiJvae6jV2u12ntROXHec567OXIz7U1Qg=;
        b=kLJT2tdwzjgxmGMDBPyeGbYnTBgO2ir6j9irOs0DHZ/S4jHyE30iiRvTD2swHpFGu0
         BSAz+BXnYz8tgqq3xdJVh3+01LYWnff3E5aIunNmitJ7PdLauiodpuuMxrTWj77s9s30
         JBb0rtmxGeRczwrEw03R0TIDw3ugP5FtIB6E4CW9y/1EQrfuDf92PFgXddTW7y2zS4p3
         VtJTESs1ehFjvRQc/0wbWOHtjra/D/Ua9+2jvxR88gLVXZyKBcRRGe5bQDAtcUEYz49T
         RrgjFLMxv3jOdkKj3PjJRHsOjhxqkOwMJKHImpFXaaSXuoiKVVnsWsdxAChwRzkYySCX
         HuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772652281; x=1773257081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ecl+MG1Yo+TiJvae6jV2u12ntROXHec567OXIz7U1Qg=;
        b=dg4XDrvWn1B3MAf/DTF8+5G2Zmaf3Z7gXgyibyxkuEQg1RmXVV+JR7kzHjpFNMLUum
         hXk74ZdP6HmD8TLn5dUpnDF1XLTsd3HKe0XBOT8FndQJFyAQQmWz8aheFr6sefBMiogI
         K1+7bAIWGU7RC+4Vz+RqU9ISyejogVV61mZ23/ReJiMiIxKm5XSV0GXIpqiGB4pFVLj7
         gq5FU8hBWsZvvY8DAiKLiyzO9QTZfiwiex8emYyQw6PRhyrEAHpyq937VsBKwZaigVeq
         OlGVWVkVvjyWm3bN7zBSWymr0x52VhoQpRFCc5f6joFrElADTZvjsM7Rhw7cc2YqbmVJ
         aN/w==
X-Forwarded-Encrypted: i=1; AJvYcCVUytlr6NwMabTFYS/zGW8tml1FfF5G58x+WkmfzI+CkEmwREHqzoCAtKdJceYSIn95rx44F6w/6HtseEVFoyFp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1hPcsX1gPis+qXRfFhC2kvHbEFIlNk7mtaFOSaMyh1qFGotrX
	4qGy1jcwLIF0+p3wuZUAG6FxLigv2HEpZFu5OgeZATgo9bjwG8xY//n9
X-Gm-Gg: ATEYQzwR2z/HI0mYc/BHOEMQt+6hQhP1EeyI5fevbEbyuWMdmVTK9YhfwzSrLTsS2s4
	6qbEeCPBC+zUIiJK2eK6uQ6Yth+rLj2PyUTOGRde2TpZRaQH+mT97DP4NL4w10OYThiqAIg3nrg
	USn8V156wepz2eaUJKXK/m09MMuNd8i7eS0D9/kMKZW0eiKMQDTUsEWm3F+0H0LelvSNIdW0rtm
	6z7jCdBnWInhuoMZaLvNZmlRqEZbLzdr7O8H391cjtKUIt3oHv1m3jvnaZcbuOTIP10LiG6DNr3
	ujYEyJyrGsvZLcSmzH5LBDG5MIVWC5meiXbTt/CW9avXwR7uXcqo5hZbD2ZXqYH1GqQ3fL8NEgd
	+mTKi1NNJkFKwHhjmsUDQxTu/ieuilYBd84FekaQrJaZ2A4Rl9E2ypSM22FWDHiN0U/AumDG0q/
	6nwI/8ac3FHd7n3I6pYIoIJ6TM647Gs+0WeIHjKv8QfO9CKFVxwyvkKlCVeNVL4qmJ9BxpYx/SB
	Hue7tMrakIgi2FzDw==
X-Received: by 2002:a05:6300:6681:b0:393:74ed:7dca with SMTP id adf61e73a8af0-3982e1ec076mr2703298637.37.1772652281462;
        Wed, 04 Mar 2026 11:24:41 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8805esm20233563b3a.16.2026.03.04.11.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:24:41 -0800 (PST)
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
Subject: [PATCH 1/2] dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet 8/10
Date: Thu,  5 Mar 2026 04:24:16 +0900
Message-ID: <20260304192417.818211-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304192417.818211-1-akkun11.open@gmail.com>
References: <20260304192417.818211-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_112442_136225_70740128 
X-CRM114-Status: GOOD (  10.09  )
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

Add the "lenovo,blade" compatible string for the Lenovo YOGA Tablet 8/10
family and add compatible strings for each board
(B6000-F, B6000-H, B8000-F, B8000-H).

These tablets are based on the "blade" platform, featuring 1GB of RAM
and powered by MediaTek MT8125 or MT8389 SoCs. Since these SoCs are
tablet-oriented variants of the MT6589, they are grouped under the
"mediatek,mt6589" compatible string.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 382d0eb4d0af..69dbe389515c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -44,6 +44,11 @@ properties:
       - items:
           - enum:
               - fairphone,fp1
+              - lenovo,b6000-f
+              - lenovo,b6000-h
+              - lenovo,b8000-f
+              - lenovo,b8000-h
+              - lenovo,blade
               - mundoreader,bq-aquaris5
           - const: mediatek,mt6589
       - items:
-- 
2.52.0


