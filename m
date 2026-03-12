Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CB5106705E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnIikZ33fceOx0YIGtLUvBXoWdyjzbgo3+1Q5/tnQ60=; b=yhg6Nv97pF7d+0VwrHd4b4Pni/
	o5YE5P3grMfUN6Ftj3x3e0pASeZUNzBosv/z6d77N3CIGvejTtxR5fka9nTnbRpQvG7lFsVgs6RzD
	xz7tpAKFfyOySWXAfA+o+TD34+JOJZPXazJyE6tHKc/9RCmsDlIU8rZV2QXy1rpemzk5wM/OJZ94Z
	2+butoZymhUwViHnNJT4MhEZe+pAenPO6vZaFN1IzQho4i6kduaMGVwmhwIVhsgWiV4QocmBKN4q7
	pbf40c8j5HPSN3BD8naTd5EhLgbr93HcqDtegl17gj6LYP3JuIvZUd2+G7Baa0VLXLQJgNTBgSJT4
	P4XVx0mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iIk-0000000ERZ6-40Cy;
	Thu, 12 Mar 2026 15:50:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iIg-0000000ERUq-1roz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:50:17 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so9935985e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 08:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773330612; x=1773935412; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnIikZ33fceOx0YIGtLUvBXoWdyjzbgo3+1Q5/tnQ60=;
        b=i6Y8KCRbF7OivS34Nl+0Z2gsP9yVg0TLkR/VfeZUKH8AIpN8ZVdGgt+CSSv2L1+gW2
         L4aC+XndK6k40iLhAXsMUP3Gs6e2y+DACR2q3w/S/ouxPHZ96L76LgpoyNs6m6iRrjeG
         LFMbypHrPbilBQfKlugieZ1zDJsIBjnqyt712Lk2uZj47cowUHMzlpQB4XumChGDXKl4
         3xnW0EPPRNusPCd/64pV91Yqvt6bZyZgaptbGFrYwePqI73HVOpS4gKiBQmu0yZNVuzw
         tr54MPfjJR1hLCTzWQaxjIAQzvp8A3kx4sDzG1Ysze1BImZ2Dy5PYiaVeBNrZ7r/0clW
         ZOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330612; x=1773935412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fnIikZ33fceOx0YIGtLUvBXoWdyjzbgo3+1Q5/tnQ60=;
        b=aLYhcrnJDbY3aehUZk0K2z3MEXGOOY4pIJUuIzl+muGpBoejV4feGkbrnKAKer6DRZ
         91FxLg32/bo2rI1qixuLnN1K0fxxiFnyN4wCY92mOr7iQJAG0IhgQBpTamlyjfbDT4iC
         qjRa78lurK8+7kaOFhIjpRIzZQZfuiEMxVPAAdosecOJmqM2JPMy8C7vKbius0AQrzO+
         CHoNml1jkPcZyWUHT9acUtGPfyBvGkMHfaeTKjaFzpMgNngojCmFyWe/H2co5m9r5uU2
         eYMaj/idvjmotcBMUi1wXSKmuU+8Vh1i+J9gGqeupgmFFbJK2X98BP3xhdVddoWRWV1i
         HjqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsvM0gGURhV/cyJ2TsEqV7YJ1x9aZW9GR9BfKhXTdGKJDhl41HCC0rL7uDtdfCDYTzKmYfjORiqXLkZ4hUp3Gs@lists.infradead.org
X-Gm-Message-State: AOJu0YzsifedBGCx/2rKuDMEdwrG6Zs7pfxVgyKLupNX5MRlEv75+9TW
	+ipFEif0ofZspcFg0dC9UyrsxdVVhEQNWBfC40hBkKe9Dd6Jups+c1L0cp4kZa32mHav/GWL08a
	NR94Y
X-Gm-Gg: ATEYQzybqOgAYcty9ktKqmsQWR6W7+XDYNlxSsmNQzvQNEmLhsOVX7oO9kL7EijbgUQ
	GXCkyUZXIuFTWPxWJbw+bwae3ExFFR+cnHvQWZaVrO+n8jBhRmcv6RYFds65b9viZdCcaoyURS3
	rrSPPStpkRm5PM3FBy1BjG0FHY+8Q3eBeFziKXNULTUE0KhIy4pP/0R9c1Viy3gCuboZUKnrC//
	6Y9B49oZLDF5pLmUFm6BJqxxFH2quI8XtZyXK22yxhjG0/GLdv8PiF4MhlRPxYo2OhSDCg25G3g
	4X9u1y/79Fn/WikE1/R6aKdhWqKXh5CqWd1q465UslEw0Q/6bJS7s2l+77rhPQFz+bw6xCXOlkI
	0lx1lBNrpQ01RnfwxtYGf7TEXawZNBeHopMGLhnttjY+6vqoCp/0mq12xr/+OtsbXz8FWlGKBzv
	Nv9UyVcFnXt2s2ExsyaQtz
X-Received: by 2002:a05:600c:8b05:b0:485:303b:c50a with SMTP id 5b1f17b1804b1-4854b0f064emr120153505e9.13.1773330612434;
        Thu, 12 Mar 2026 08:50:12 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541acea11sm269787315e9.7.2026.03.12.08.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:12 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 12 Mar 2026 16:48:59 +0100
Subject: [PATCH v2 5/8] arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to
 pre-ram bootphase
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-topic-am62a-ioddr-dt-v6-19-v2-5-37cb7ceec658@baylibre.com>
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
In-Reply-To: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=msp@baylibre.com;
 h=from:subject:message-id; bh=edVr0rbhOgkFhSfFFpjtgCVxX4FcaJ3T2Pi370Z0o0o=;
 b=kA0DAAoWhcFWaZAVSlMByyZiAGmy4I6g3ZLR83kcQhbcT+FK7suc2HUjOfNOmusY1ybZ3Szav
 Yh1BAAWCgAdFiEEiWFVZv8fucZjoqazhcFWaZAVSlMFAmmy4I4ACgkQhcFWaZAVSlN5cAEAxmek
 R+iMfvZ7Ha523ikLYNBTzD0cWFBa1VsJt7ZqvpcA/iQKjzj92bSRqPvO9rmBaPloTrU5Mpsq75r
 xUZv5BIsI
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_085014_504481_24FFF393 
X-CRM114-Status: GOOD (  10.93  )
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

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in which
data is stored to resume. This needs to be done before RAM is in use to
avoid overwriting data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index c381cc33064ec427751a9ac5bcdff745a9559a89..46483d4085c20fc297d28a49ca7ef5d4bfc4ae9a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -75,6 +75,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -957,4 +958,5 @@ &wkup_r5fss0_core0 {
 	memory-region-names = "dma", "ipc", "lpm-stub",
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
+	bootph-pre-ram;
 };

-- 
2.53.0


