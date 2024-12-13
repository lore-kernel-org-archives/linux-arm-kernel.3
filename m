Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4E8E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jeEYpoT5ymS8tRy1xVLDixRmFAc5fwDD3sDDNeC0nh8=; b=PoyF/ghN6CMkbvwLFbw4wY1oeI
	0bW+irW126qXOyyqLwUiRCZhDgQliVRQiBKXS6cA32xPAt7z0yEf543ly/XUfIw6s8Uc9oxRIQIxP
	7hSQThoJCZpZ39QfiLaK7UB/pXDR/YZeJoC0o6m8VSKcaKxQYdqZcQXy75qw1Azz1HL3xvr/3ZTie
	lOLaI8TZiT7zSbkBA1BpFw2UxN08UIIZAOl9YAMfRL41QJ6k1MzYAl3Rz8g6WNp1EGFJDHYAffpvC
	NTXhKhj1BG9ZYOaAlxP2kgYLI4z2/aF0Z+qtuhsqL+Hzb7Wxo4SH1014VogPVmU9q6YSatF2Mli1M
	tpnOG7mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2Pq-00000003Le1-45uD;
	Fri, 13 Dec 2024 09:56:58 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2OJ-00000003L3o-2hln;
	Fri, 13 Dec 2024 09:55:24 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so314837566b.0;
        Fri, 13 Dec 2024 01:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734083721; x=1734688521; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jeEYpoT5ymS8tRy1xVLDixRmFAc5fwDD3sDDNeC0nh8=;
        b=YPGOMYlQMjgdyMGZjjrVCoT26XsK8kPauTx7KRSlCVSJo5aduBiLeaUPeCE5Bux8Hs
         vGJksrgeIpyQUAp8O59I8qTcgdG4lHA2PWDgBxlKVemF9nYWVytpuE4pyCOmttiwkHHg
         mkPeSGUyGrh/rNK8xaVVfvccTTRPzexBMV08Lb7x4l2DfZgzZ7LMJjeJAPI8Bmr8+Sk+
         6CaWXpGGcmD+98/r3EsrvavZT+jhO1ZZsvf3gXrXSi0ipV7CTqvOoiYociyG1XK5JHSF
         zE5/w2YxwVgzsKOwaem17xDdHDD8HQ821lkSre4nyb3UQMyIB5gmNw5kpKuYZx+YP4xm
         eBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734083721; x=1734688521;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jeEYpoT5ymS8tRy1xVLDixRmFAc5fwDD3sDDNeC0nh8=;
        b=mXHthkPbKrselx+eA+Y8/FulCc8ThIz4twtBKEDz5lKfXMNbdM92NaFsCaxXnXI887
         lqdsm+fhKj78UeQr62s0GeAK2QCF7WiWXV5tk++Kcsc5jwD5mmP6AZpDkLyetAi1xQ8+
         wpS4YxGZY+SxRXaW739mdorGtddpXQagSn69yImevjxEOC7707Fjc8pJaxTnUaM69NEM
         dCjPx8gP+jWe0o57ZXngcXidI5dD3plYABsm2eQqBdk99cgiAy3VKADY2kLOEZ/v6irt
         eMx8wKoV8QHGmDFKu/+UTtg9DFXmdBCj+7PzAreKFbJI5KAe2z+z88HFuTLdkLGJH7y8
         7VuA==
X-Forwarded-Encrypted: i=1; AJvYcCUMZ9Bc0nI45poawpPEpp6hvUJY3zzBb9QZ/8ZVt+wfqY/xZsjloHl3mGSF2W4wyb7HsRF0Fy2xvhmnHzD8JYw=@lists.infradead.org, AJvYcCXnG+KkBPVKcPYHNIlMF6Xi1TI9fxEG+5fSIWTx915eW9xW8sBagIDajNUKQz5DzeNBsJehIEvnMtZsY7PPp242@lists.infradead.org
X-Gm-Message-State: AOJu0YzBvk7CNwIlJ+6HQtVG6+ECYaG+3U661PZegzP81NUynWl5Y6we
	Vtucwr9MUNc69SZ9CcpD+maiYEIEeJ48jUypGgDhF7b9VfubxMpM
X-Gm-Gg: ASbGncth9rHRDYYerKQMtrJDFO9aY4+NiTQNgHzd6yrvCpuLU8qhtk8oh4zKXH7bcUr
	AdWzSTEhjRWxImg7h3Va0P/TSgUZuXFPKd2Ppxfl3CdsqOfyYqeNL8KyJifsOBv2yKbYTXcxKLx
	huh57pl5l5+iOEZskKEP/2LklvPs352/ZylrhFHXvzpXjoObtZbj77Fqcv78BunlNw3KVNYhtpH
	bNyCvnbMphvdOlza1DSs8rBtHm7HqwJzl8Be9A4oXDDitdR42HORveKqapmx3jY/aWm5eW9V33u
	+jMot4rCo1QO3B9NUKCvK6DaaA==
X-Google-Smtp-Source: AGHT+IHZMHT5CWtXaqVR5si+MBRX4Sk47tkz4p5lH/eSEWo0dRkleARMLltPnuR/+triSY+HnVjWaA==
X-Received: by 2002:a17:907:1c8b:b0:aa6:7cae:dba7 with SMTP id a640c23a62f3a-aab778c6ef1mr216718366b.4.1734083721229;
        Fri, 13 Dec 2024 01:55:21 -0800 (PST)
Received: from opti3050-1.lan (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6969a7645sm598970866b.16.2024.12.13.01.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 01:55:20 -0800 (PST)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
X-Google-Original-From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
Date: Fri, 13 Dec 2024 10:54:58 +0100
Subject: [PATCH v4] arm64: dts: rockchip: increase gmac rx_delay on
 rk3399-puma
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-puma_rx_delay-v4-1-8e8e11cc6ed7@cherry.de>
X-B4-Tracking: v=1; b=H4sIAHEEXGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIxNDI0Nj3YLS3MT4oor4lNScxErdtMSUpOSUNANLcwtjJaCegqLUtMwKsHn
 RsbW1AFzzeNhfAAAA
X-Change-ID: 20241213-puma_rx_delay-fadbcdf09783
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Klaus Goger <klaus.goger@theobroma-systems.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_015523_707487_AC3F981E 
X-CRM114-Status: GOOD (  14.26  )
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

During mass manufacturing, we noticed the mmc_rx_crc_error counter,
as reported by "ethtool -S eth0 | grep mmc_rx_crc_error", to increase
above zero during nuttcp speedtests. Most of the time, this did not
affect the achieved speed, but it prompted this investigation.

Cycling through the rx_delay range on six boards (see table below) of
various ages shows that there is a large good region from 0x12 to 0x35
where we see zero crc errors on all tested boards.

The old rx_delay value (0x10) seems to have always been on the edge for
the KSZ9031RNX that is usually placed on Puma.

Choose "rx_delay = 0x23" to put us smack in the middle of the good
region. This works fine as well with the KSZ9131RNX PHY that was used
for a small number of boards during the COVID chip shortages.

	Board S/N        PHY        rx_delay good region
	---------        ---        --------------------
	Puma TT0069903   KSZ9031RNX 0x11 0x35
	Puma TT0157733   KSZ9031RNX 0x11 0x35
	Puma TT0681551   KSZ9031RNX 0x12 0x37
	Puma TT0681156   KSZ9031RNX 0x10 0x38
	Puma 17496030079 KSZ9031RNX 0x10 0x37 (Puma v1.2 from 2017)
	Puma TT0681720   KSZ9131RNX 0x02 0x39 (alternative PHY used in very few boards)

	Intersection of good regions = 0x12 0x35
	Middle of good region = 0x23

Fixes: 2c66fc34e945 ("arm64: dts: rockchip: add RK3399-Q7 (Puma) SoM")
Cc: stable@vger.kernel.org
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # Puma v2.1 and v2.3 with KSZ9031
Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
---
v4: drop internal Relates-to tag, add Tested-by, rebase to Linus master, send with b4
v3: use rx_delay = 0x23 instead of 0x11, which was not enough.
v2: cc stable, add "Fixes:", add omitted "there" to commit msg,
v1: initial submission
---
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index d12e661dfd9917f820284477a215389c16205f46..995b30a7aae01a0326e9f80d6be930f227968539 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -182,7 +182,7 @@ &gmac {
 	snps,reset-active-low;
 	snps,reset-delays-us = <0 10000 50000>;
 	tx_delay = <0x10>;
-	rx_delay = <0x10>;
+	rx_delay = <0x23>;
 	status = "okay";
 };
 

---
base-commit: f932fb9b40749d1c9a539d89bb3e288c077aafe5
change-id: 20241213-puma_rx_delay-fadbcdf09783

Best regards,
-- 
Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>


