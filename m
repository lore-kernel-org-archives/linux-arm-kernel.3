Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B405AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gWToLPQVitiBw5bzYj/kjSaIU+PcrpH2/GQkA5MT3qo=; b=GWKveHtJ/9y9Y6aCTNBX6oTYcW
	9zkItJ8Cj/+q2fYkcOTSsNF6lu5v583WziO+NG7EY03F1QcSvibbZbSYzwnrRUZovDQTRMacLrfdB
	VrY1t1itmoVzQ57ScSsENq16oIFF6e+9ApgLGBG2boWqIT4NrHfORL/yJ+SikSO8feJVo/dRY+b6B
	Vg+Vt75l1/C2yEDQTMTc2PO2bUwYdu4hi3TRG5YFhM+JDEt61MkoIAKpLknteajs3TURWwQVOzlkW
	XAWkEQvkIGr10uLETRg2qM8wfzL78s0AO2Q4yHS+Sbq9Kgqx1H+I8CETvj+Y2riPOsUkAJNJ75UwL
	Gibimdtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLH-000000054lH-0LxR;
	Mon, 16 Jun 2025 17:09:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRAz6-00000004jFT-1svx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 14:38:54 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so2610908f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 07:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750084730; x=1750689530; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gWToLPQVitiBw5bzYj/kjSaIU+PcrpH2/GQkA5MT3qo=;
        b=FIV7XQN0mxTYUcVNGof31DMnJ46VjFTvPPkf85rEBTJE7KhEwzchUjs4Niwi3jfVEJ
         G/L+pFF+BowDYV5HRwuyUM9vRcfJl2s7v0Fyh5j99D+7Bo83cAb6NzsmTg4bLu+KQLlB
         VysjV/om4vugz8k2vkFG7Fq0Etplf4ObaE/dyDIE9Tu/J5jZYvRhEDlYgp3RCbZiy1HX
         fB8NRwuRArfBXeVbJdBLRJ1IZM3NLVOM5VKBhVOPl/KXwpCl+pkvEXJ5In+eN/NOjW2h
         1VK/0/lK6w6dyMSxRehrv7R8Tu8RErF95cR2GkUfS9WlstyG7EmQFNRdwDT3lhDCw92b
         v5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084730; x=1750689530;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWToLPQVitiBw5bzYj/kjSaIU+PcrpH2/GQkA5MT3qo=;
        b=bP9dkxIZEioS7TRkJY+h7x7dZu82KgkRfB5sK1C/89a4xuiXSFlLHCbnFGLhCF248B
         XdKv/sNc4T42ZEZVokUXoAxhZbqNxhAgHd0/kARfCPa5OLtyXvKWK5P8b54VJ3ayh3ia
         cie7v+Kz2vKCOFE10CYyYgIdjyANPSGsW02k0Pgi+dAn1Z9ZcoTv8ePMl83wEgTVleYV
         BN7zGYxfUeaugjil6mhdiYdaX5S9/L8J3yHJOcktexlqrINvokky03qu4NO7BOZaizqX
         N9u39aAlFjmwBJPPdtykipRtLTHR5s9jOVovpdAOhzfj2KbGOqAF852nz9DFrYJyYxnH
         41Vg==
X-Gm-Message-State: AOJu0YzNUyMjTUonxFKvzq3YP6P4Z5BIAG0QYR4IsLf7yNe+Z2gt9gxD
	LzqBTHBDEO1h+c/1ZAExe7byjjaWFyZD3bZuIExnmQH4K6ywBx75CNOxOy1Egz/BFHI=
X-Gm-Gg: ASbGncuNzYsUNb46eQkl6a3TOxM+896jSNDbB3srPIoZCdkIk9MBF5aHf5YLNhXKjJD
	y38hsn5QGLeQF+0nVjCHERlZma72EJI7btnW0R2S7AJjTQghEswGhhJwY+E5s0dGnxywfaSzH8H
	GkXOk/KSUDHbarQDm73+KQLKZIercbUplwQMyXly+SuM3THMyq3vpzUTfVu0s1MhhSKdYZ9E95E
	C1W5Jv0UyVZ2FSN1UQ3ZZPdaD+/5Kv7BoYuC8H7u5Y+TKrriaKjerm5qFXMcaCfJzcWwjjTb0fs
	M0e5wbpQR2mS742eBH3p0XhOa9gGlX+eIgxxLCPKCQJ+tBhmKz8++U4bI/i+IKfAwtTAW4W1Lzd
	3+X1qv8M0lQfIZXdPz6TE4bxwQag7RfQdJfk=
X-Google-Smtp-Source: AGHT+IEGRmeB3oMKleC3pKBVMBYu/8jfqnCCDOYSgFOyYxzD5mJZV1fg44FKowdo55Cr1jLuHCyDjw==
X-Received: by 2002:a5d:5f54:0:b0:3a5:1397:51a7 with SMTP id ffacd0b85a97d-3a56d7cd5b7mr9274661f8f.7.1750084730495;
        Mon, 16 Jun 2025 07:38:50 -0700 (PDT)
Received: from [192.168.42.1] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4533fc6578csm77990485e9.19.2025.06.16.07.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:38:50 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 16 Jun 2025 16:38:28 +0200
Subject: [PATCH] arm64: defconfig: enable Startek KD070FHFID015 panel
 support for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-display-defconf-v1-1-c9c269c9c27b@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAGMsUGgC/x3MQQqAIBBA0avErBNSSqirRItRxxoIFYUopLsnL
 d/i/wqFMlOBpauQ6eLCMTTIvgN7YNhJsGsGNahp0FILxyWd+AhH3sbgxTTibJCkMyNCq1Imz/d
 /XLf3/QDaGjrrYQAAAA==
X-Change-ID: 20250616-display-defconf-54a9bae1db4a
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ytjfmtK/XdCP2wuHUwDkdi5kPia1J9R+DeT4RG9dGAA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBoUCx5eXjdcOVffnq7WXqqYRnDsTdZZj1URCBrdgGb
 xUNVAA6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaFAseQAKCRArRkmdfjHURbu8EA
 DHfrZk940Kjkbb7HO3M0y+77ll7StOw6cYtUFU60Y3f0qJy5Uzt49F0AcaoWOICKDrI5rsE0R9CoJ+
 rarUxHOdagpMdKzJe+NbD14e7yujy5McG2KgSe93nPok6kt4Vb1POkq8sb1tbPS3gojF3Gf1mCPN9I
 zEM0mW3pMX29/LOiRnbfRFVU5hXbUh7uIVIzrnYH044y7F9sWochwHdCTKnkCg7z6i4gqbyhpf5f9t
 /UGOE0UxEdJSMWGQZWFkV+OwoPiew+VUWeg6qnJJrNt+S4+bIXftIpGc1UwMmQSeRkamV+ZMMtKD5u
 bOuQlkODD9zAiI+9MMwyBEu42Y1Jiv+4tNARQrtLUKDS4Up2soTHjqyMpzxZ9brKcQZhhdGFpxjV7H
 KhjArSXiUQS9IivhhJJfQufiMlZmpB50pB0jALEzfa9v/pH8QLAqbMQSSpl3znRsq8ixBLP5UIBnPJ
 Xcvk6+6bniS+K+oK87xGvuTJGSnaxXqESOwgp6wssmvRQCzzh75Y495vK5Mmw5HLtDwbUqtrprgzik
 gMN4yU94JQaUBup/uwfZ3hb/S5VgqGYXx3FY9mU3GzjyICzGlCEmHTYfv1lwLR0MPqEKzkax/9IUv7
 fthBOcdg5fZGwwWFLcmUCUWN1oGPhm0ctSoS1WGVlUW7uL7iiqiO4neOMqag==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_073852_579237_D3556F06 
X-CRM114-Status: GOOD (  10.99  )
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

Enable the MIPI-DSI display Startek KD070FHFID015 panel to have it
working on the mt8365-evk board.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
This patch come from another serie [1]. Since doesn't depend to the
remaining patches, the defconfig change has been splitted to this
new serie.

CONFIG_DRM_DISPLAY_CONNECTOR=m has been removed after rebasing because
is it already on the mainline.

[1] https://lore.kernel.org/all/20231023-display-support-v8-1-c2dd7b0fb2bd@baylibre.com/
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a22116781169611482179b10798c14..319d1899348bf6b6c26362c9b4fe7f1da917769a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -914,6 +914,7 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
+CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_DISPLAY_CONNECTOR=m

---
base-commit: 0d8d44db295ccad20052d6301ef49ff01fb8ae2d
change-id: 20250616-display-defconf-54a9bae1db4a

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


