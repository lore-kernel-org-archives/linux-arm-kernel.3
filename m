Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BD6C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 07:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=caJ7ux2yumSI+rOgZYfrKx6bLw/EgXNi4UXfiijyCIE=; b=15vXF0s51a+Gq5bshURpKUZBTf
	wkh5snysms6LYH/TtJBs5PfZUqy524EVjwgXGbvvWi/+koEVuyVZaI+YAwn045uijoiwxl/a3i1Oe
	MkIoqBmNbSbZU7iO2VWpZM55H4YBlcr5ZZV8iAG2rZVNuzhgTtsRfSQ1wBOX6k1qnwfun2tan9URx
	zaiB+clW7YemdCpdm/mY9UR1u15c7Y07A7rvixmGXvLL6TaiJOl7dP2TCvA5bicCNzRUH+wGwNxFb
	oIjoRzlMUU+g1B+VIm+WBKgGfxqMRZx1D35C39cMXpbEey7PcHMvShHhJiAEiLiPR1lzP99gAz8wj
	oleKPpYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMPC-0000000ACT8-1Wil;
	Tue, 03 Jun 2025 07:49:54 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMMz-0000000AC2h-1wqp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 07:47:38 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso3188591f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 00:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748936856; x=1749541656; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=caJ7ux2yumSI+rOgZYfrKx6bLw/EgXNi4UXfiijyCIE=;
        b=J14WX4sKVdt0QSMGcSkVQJl+VKfAertmwOvjqlJGye5TQVpSYbFxi7Ck5eKgvvAIYY
         KYDxP6+uyBF9U1DSg451N3BwlfxbVHQPQzJDYmLjUzG2actm2WNDqCyBKuaFhWwT9TpO
         2W6pcBVdPDcQLLChbbHmRtwyRkFMnyMLoDp6N7xHGl1EjTJxoqox0xHRk/zOWndX/IAz
         4oSXpmfI9RvFFKVuY9OVQKXo3BxYIufB4hjS9t/acfQJh6v/b1C0PBGVP3enKSfB2RAG
         d2RfEtJPxEOFCw4XJuDKE3ZGbEUunAvu3MZYUTlGC44atL9rGW+ePh8FlrE31f4Kdrh9
         zsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748936856; x=1749541656;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caJ7ux2yumSI+rOgZYfrKx6bLw/EgXNi4UXfiijyCIE=;
        b=WpxBE/FUKKL4M3SFJFcImPm78NLJnvMhU2by/c+TO/ePKZn7+L/yT9g6D524QqQeat
         n4Ywq14JQAAc9JUTNgbS59EscPEASYrLXyOrfVXggJuXS0481Y9JJWK5TBO26idUahz2
         HpA10eCHll+XpgstN5nyMXR1tS96ABsAPmHLecA5sDuGL0Sc7bfP4gKIHkWpsdnj/A85
         MJWc/GCMf3X/q3LIdYLFyiMxbL3d85p8vyBSLudi/cYKN+4J+OE2WE/f+s/ekZRR6c/M
         inC0nM5AJyw0HiMWXPt92jGvfmxRXC+x8rWYYV15lJ8fp/4jzaq0QcYryZmGmt9lK6+B
         W5YA==
X-Forwarded-Encrypted: i=1; AJvYcCXeX+BPqRzbgpyvCbgvIMwHceD7rqGMslhx6RaaMpzZfql2XArTDceEsP+rpP6O+OdcdIdyZk8w/TaLSuRRRGUR@lists.infradead.org
X-Gm-Message-State: AOJu0YwAqQqELQ4AL5Gk+w3HA/FUoUnL7KfBHAa5jPTDt3bXzkWl4NDZ
	QKJmbXUOlBUnR1nS23E8hTsFaQjpHnQ+9Do6BKreqmxCXJZRYvdmCg9Cdef8X1FXhVw=
X-Gm-Gg: ASbGncut17ZUve+wo0Lm5nTIvUpy4/1Us7exvYCut121IMfeVITK0hXbflrPqur4jbi
	xixjDGM3qtc2nNq5aicXDWciIOsVpRQ5yE1SB/U2PCNgKBH4HNcT0UDS8jacLJWo3jQ/+/XWL8Z
	s6fB2wv3+6I1TZRCk+S1vJvNBiuxMZmhYAPsD3/5pztKiv/axhkN96Z45Fn9h5ZPRMr671OgX+s
	E2EZhB/Xobrl/7zeZBgj2Iu8LqwzvZF0Ew0e2gJ5YqI1FTSyqX19QRzsVV2jQfybMR1n1MLwhA3
	Rw12zA1+zEv5Clcuwj1Kwr9zVUAfsHZCIijvyzd6ONL1AeBgP3NNeUuMJoJXKilmecS+0L0F
X-Google-Smtp-Source: AGHT+IEDZguHy26GTUwFsHWSzO/bLYq1dpznuDMKPsYMZaUuQBDHm6dBdCH9NBhwEc0SzxYYLbe17g==
X-Received: by 2002:a05:6000:4023:b0:3a4:f723:3e73 with SMTP id ffacd0b85a97d-3a4f89a893emr12077391f8f.16.1748936855700;
        Tue, 03 Jun 2025 00:47:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f1e7sm152181815e9.1.2025.06.03.00.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 00:47:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 03 Jun 2025 09:47:33 +0200
Subject: [PATCH] arm64: dts: amlogic: meson-gxm-rbox-pro: fix wifi node
 name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-topic-amlogic-upstream-bindings-fixes-dts-round-3-v1-1-2d54a476757d@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJSoPmgC/x2M0QrCMAwAf2Xk2UC2URF/RXzo2lgDri1NN4Sxf
 zf4dBwcd4ByE1a4Dwc03kWlZJPxMkB4+5wYJZrDRJOjK83YS5WAfv2UZNyq9sZ+xUVylJwUX/J
 lxdgVW9lyxBkDBefHxd/IEdi3Nv5Htn08z/MHSS/1noMAAAA=
X-Change-ID: 20250603-topic-amlogic-upstream-bindings-fixes-dts-round-3-c0c5a1ba8050
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=84VAWVFlPhyzrCXyj2+DcTr+WKL+4wxRMFJtq/MQ9Mw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoPqiWafsssuKl4aBXXalW+12j2G5hJWZTyeYc05Yt
 p3pu+16JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaD6olgAKCRB33NvayMhJ0V7WEA
 Ch3KymIceqWdnWOiU5bsyN+KN/+/qIw0hdpFG1GVA3q5Sb0lbC8MnMaAfqQxoT535Ny+BvxM8b6aht
 3nXk5//79gXMwRFBhwFrmQRRAsximQ8ZMXLYS3AP+ZhRBes3fZeGL44cpxiL4ehOqT9JVio8f9CVLo
 wGurl+h2qwznwfg4d3pQhyWOZQYwm2WLMsfxHOPqZGPjqBOr2kf9a991KOpgeJv6gNMbrP7JGdbdOr
 3rY46RNuiBB88MpGa/jzZuw0bcWHyzGifAPmuR+Ye0ngJjbp3SSbn7jDNBxYkH13KLs/8VF9KddADc
 1gN4PhjgVq0KJ9IdIq9AiLIvsJS/IZFTNsmcpvFiI0Tdf1/nXcqTTs6d8OFhVP6IM31mD4+Fs9CEgb
 V6Q/eBy2EX6O8AQQHMY08XFaUiwHY9+Tu8vyOi+cDm+U3BzFqSTpzqTOGHvGBaw/Rtp0+us/2fJCIS
 5/thXgW7/syAlRKZSsZre875a8Fs+c1KVbJ+MajHhqBH0DBGg4ZkXtaJih0twQ8Yv7mMgJOUOqTwMn
 vALq+AU3qvyrZ5E9WMvKCDAsxHr6H5CCJxbthtUyLkQUyPKlFzYpDYV3G89eNovoKqkPTzG8ofW/X/
 8vm5pQ/kkw1oGK9LFOsXSH4PzKV86QxCcQw8G5uvtmUOvtTlcsITTyLYTOjw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_004737_518995_F6200A71 
X-CRM114-Status: GOOD (  11.38  )
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

This fixes the following error:
meson-gxm-rbox-pro.dtb: brcmf@1: $nodename:0: 'brcmf@1' does not match '^wifi(@.*)?$'
	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index ecaf678b23ddd6f0e1f27532059aa706c29fe046..9d5a481b309f7201e5a82b7a91b8ca265c7ef42a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -217,7 +217,7 @@ &sd_emmc_a {
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_boot>;
 
-	brcmf: brcmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};

---
base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
change-id: 20250603-topic-amlogic-upstream-bindings-fixes-dts-round-3-c0c5a1ba8050

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


