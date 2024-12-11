Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1C0E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 05:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsRd6GbIRJnWNHqT+PNa/aW5xM64tEdGNTQseKpNp3U=; b=JzHdg7ARqa83/eYg8ubgBQsIyP
	Ugod2oigUw0fnm0qVFOu1Oic2xFcPZ3uxgfW9Ds5I2PdS+0MLCfb6IVZ08fSlRawPp+B0jRdBKLI+
	pTvDyY9QVJy5KLhHggzQftc+spQWZt3Rqjri6aWyrZ+DxsaQwgJ4ykmwCXXNfyXM5M3VoEordxzVg
	Nklon4d890QVtLnjhUPg1OfKUmMyM4oFAl1ZNS0wOHCW13gbrfFXUbFXU070CmSYVmYC4bmqZa45e
	VuG9EpEjTGJTF9T48ljTwv/w/PMogsB/G4D473XtsS5/QlL6c4ZuS9D/52g2EBnCyqLudWFBGjbzJ
	qKNFLiTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFIJ-0000000Dq1y-3vbs;
	Wed, 11 Dec 2024 05:29:55 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFDJ-0000000Dp5G-3kH8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 05:24:46 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-728d1a2f180so252420b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 21:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733894685; x=1734499485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsRd6GbIRJnWNHqT+PNa/aW5xM64tEdGNTQseKpNp3U=;
        b=RXqpltN/Dyk9HEzFHxsXck/kdbz8zBufKMawZQm3MpbnhlzonFuowaXVNDP4FjN8kW
         qUy72DjGbKCdYhNRQ6UVsUiU0oK7ru0E19n/PD1HWNKU0p+ory9nq2ieotuomZXzm34M
         mvX4ZXQXeAVirye7KmDMVkI5YX9CNGrzqCpms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733894685; x=1734499485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsRd6GbIRJnWNHqT+PNa/aW5xM64tEdGNTQseKpNp3U=;
        b=hxcxJsm3+xx01xK7zz2gocnON/a41sH7RzOIfCFNwjqjhkWSz1TTowodX+Ju0tXR/q
         wIBTkAUx0UjZmVi9dzMO6Y+9OzdiZKk1rbnnDFCQJvl1xHybAMxJv4d+GvMobGEv8n/D
         Enb8m1JS0lmmIPiti1kOG9tfirYqBpTqdHgzqvKrkCof5wmRIj05NfH1DF/WfiMBihEs
         VchcwFhpjN8k5n8pm+SHKUidHPmdbi/oNKyUoh8RzG3uOxZaYVXv5yomXkpoFAvsFAmi
         X61YbQxUpYnwza4N4WmUCf+MCmjwbKhzscJ5SujMlch9Lyr8yhipF40jwJfVqiD+3tNE
         6AEw==
X-Forwarded-Encrypted: i=1; AJvYcCUkMG2GV0Y58sP2nW8Q2tObaSEDc5kGYR+HZ1wQn8CQMXBjJhoNrDXqa9XnQ1wJgojWOTCXb/shVf5fxyujtIkH@lists.infradead.org
X-Gm-Message-State: AOJu0YylK6cGbdi3OS4eS5nXslmtbGmYdhUZmjB5TVN2bG0HgX9xokQX
	gf2j8yZAvrzt8OUZbWg2UXTJiVSSAc2QqO5yt5qUJf66daO8HevFZHn+mbvEBQ==
X-Gm-Gg: ASbGnct9mJGTqCTr5sg1mQieJZMAbVuTxfsG7lmiHZj/uZMaXo2aG8flcPY6n0iPTsk
	/59YBgl/24qdYmuYaY/LpQu87Xkcs2TjUXRNnKkV5ob5F5o9m71A6YzXYPRlyUgvXB7sDx+o2oC
	TgcqsMBEFwrohHs2R+MX8HcNtm+VJQl+rsBylPers5GH51fhSdFrXQ8I9xo4AWoKZH55WVdANeT
	cWJ1gqWnz7/dlEeMwrjdlYcbInEIdjxUQI7qstbZPruJTvWyiCwKGF2GKogWesl4ugK/rRp
X-Google-Smtp-Source: AGHT+IFFxMXga6SeAVOQ7rY1CRuplpzUNVLLhXZiU0yZmrw4h4sktygVKCOPI2atcjtR3UsWVfl7nw==
X-Received: by 2002:a05:6a00:c92:b0:725:e3e5:624f with SMTP id d2e1a72fcca58-728eda6a3fbmr2265644b3a.0.1733894685041;
        Tue, 10 Dec 2024 21:24:45 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4dfb:c0ae:6c93:d01e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e66801e2sm5397702b3a.160.2024.12.10.21.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 21:24:44 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] arm64: dts: mediatek: mt8192-asurada: Drop regulator-compatible property
Date: Wed, 11 Dec 2024 13:24:22 +0800
Message-ID: <20241211052427.4178367-5-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241211052427.4178367-1-wenst@chromium.org>
References: <20241211052427.4178367-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_212445_930835_D9674361 
X-CRM114-Status: GOOD (  11.96  )
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

The "regulator-compatible" property has been deprecated since 2012 in
commit 13511def87b9 ("regulator: deprecate regulator-compatible DT
property"), which is so old it's not even mentioned in the converted
regulator bindings YAML file. It should not have been used for new
submissions such as the MT6315.

Drop the "regulator-compatible" property from the board dts. The
property values are the same as the node name, so everything should
continue to work.

Fixes: 3183cb62b033 ("arm64: dts: mediatek: asurada: Add SPMI regulators")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 741af6a7f197..516fba9b3c6d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1580,7 +1580,6 @@ mt6315_6: pmic@6 {
 
 		regulators {
 			mt6315_6_vbuck1: vbuck1 {
-				regulator-compatible = "vbuck1";
 				regulator-name = "Vbcpu";
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
@@ -1590,7 +1589,6 @@ mt6315_6_vbuck1: vbuck1 {
 			};
 
 			mt6315_6_vbuck3: vbuck3 {
-				regulator-compatible = "vbuck3";
 				regulator-name = "Vlcpu";
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
@@ -1607,7 +1605,6 @@ mt6315_7: pmic@7 {
 
 		regulators {
 			mt6315_7_vbuck1: vbuck1 {
-				regulator-compatible = "vbuck1";
 				regulator-name = "Vgpu";
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <800000>;
-- 
2.47.0.338.g60cca15819-goog


