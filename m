Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF5AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 20:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4j37Xb2c0t4LU9ON/o8jdFzIJgXemxeqnwnCsdMIOg=; b=KpkF/S4O/CJgBEWkxsfmDAATtX
	h159Kgd4tcHdCAOvDAvN2pjlPxgldvgbox7A5AdR9NlGOBz9AWqbpE5FsMouOh9P7LeTYWmgT/QQO
	SNkphIsmftiXuS/92yPkLTwFX0HP9livBLRUDcMNwFz5ZmfF4uQ4iYvDoOzZpsRkMOMhE3bQLl7Ng
	GaYY3Ca/pBmmRWHTrYKQTHWVPD51W1Q6aLBoJLmawhdC9x70bSjtnS/VCArV8OJ1u92hvDK6PO68L
	9QLteec1P/5F/oYQqWgTs8lVZTGdlSmgSuRgY68omE4YY0hZp0WEUNBJMf8x599yIBfd8swivrguK
	neAT41pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8PFK-00000000kYt-440k;
	Fri, 25 Apr 2025 20:02:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8P2R-00000000i9d-1kYu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 19:48:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cf89f81c5so2492855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 12:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745610522; x=1746215322; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4j37Xb2c0t4LU9ON/o8jdFzIJgXemxeqnwnCsdMIOg=;
        b=iz7Rk7xi5Bc5JyLR9Gibcub5cvTkFRB7CMbXhutwvJStDsiKcJaGxNCwr/6EddneVm
         9ndjdW5iGq77lcwYZvGlKs+JtEug2la6/A6LeEfe+2PDXK06TVKnZAfN9/ZcSgDpCm2G
         EZdHdDPdX8MPyMuVI5lOaax9lv0tn2prcLiQZyEg4NyFJ8QybW6OKJCta3+TcDLFGNYs
         McQB08tUgpoy5DTbkf4YgzWQphnvNSr3yeRNy4Zz+L3QB04VrNEP/6pMtzNnIFh98cQt
         /9XbppuX9HolrGB37DVa2yTnxR/pEhJCAD3en61TuVVFoKqIrMB63nG14HJ67PhGSv0l
         4IPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610522; x=1746215322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4j37Xb2c0t4LU9ON/o8jdFzIJgXemxeqnwnCsdMIOg=;
        b=gz3FMM/rD1pgXRYMiqr7nWBZWTbg2POPQ7NfKw6j59DEQckSRF4jyDrVODV6T2wEok
         xCS7+Cz9/Q+Zg2gqVrVrHHwOMzO5FnJW8k9VgGYnvKVdmYyWqeQLC6qlBIo2J8GoPIez
         DpYt/DwAeaVu7dibR1EcJfF+HRpUjSTxcdxlziiPU0x/klhEuDcDZCLi9Owc1XUaZ31V
         S3F5c5fXYqxAIc5oLB42ZyItU3yq0iop0n+2Lc8/IcqtsXL1lGgEhyNb/FwKKGsfjb8Q
         a2l9qPUaDoyouqm9uIvoMYJFAtMoGnkzDZdbXRDNaxMYjluEu9j5M249Tui5D5mEZBdK
         gRnw==
X-Forwarded-Encrypted: i=1; AJvYcCXlDcPasGbk272ccgEnxzSi9Fu7L/3pgIxXLtwf/Q7+NHUb/ip4zp2n91Efyc/9/UMmEJ+n+q//8iLjaDxtT1ja@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw9F/Gfc33E+MwFjM7Zyhtj6TOhAa7KTCcbQ5Nt3zZtNYTq49O
	HDjYZz/b+weW+xDtD0WwRy8Kwq6EAUmFzeyCul46zmis/TbmNX/qBbZboUpUlbI=
X-Gm-Gg: ASbGnctPY9R8SS6easu3ChGWoIoYu6zxZXHfLMY0Jl78fgrdGEQvbrVbu0IFXjfmz27
	+2MjpNNa/zZC6wC34JWKVcX/e+aJjAUKOIUOPs7eF78ea+EQeySSlsZJCg0DxkGwhd5Qc2LP75c
	/yuIP/GlsJvvLNW2LPbMGW3R5vHZRvKf5MuDFz6RHvRlMFFqFMM9FGKiNs39NbbujBklCfIMNkb
	iPvF27tbV7Ld9IKkDjatKdSeTofu8BcpTp6g6KeEhT6VZLZjDuOYSm8WYRGFxVNnz7ufLc4iT/t
	0eDHCwF7HNXjUufR6xskYvSUR9JWnuyBMSQWJZFaAtFIVUgl1bzVMmElZE8=
X-Google-Smtp-Source: AGHT+IHbIDie3REI39tKrXXvIvvz5I8Mke1AdtwOzj50LvqfedqxsJLOKuveHgX+Yur6T8qbs8xzOA==
X-Received: by 2002:a05:600c:a346:b0:439:9595:c8f4 with SMTP id 5b1f17b1804b1-440a6347d89mr12879575e9.0.1745610521735;
        Fri, 25 Apr 2025 12:48:41 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2e59sm65922335e9.16.2025.04.25.12.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:48:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 25 Apr 2025 21:48:26 +0200
Subject: [PATCH 3/6] arm64: dts: imx8mm: Move Ethernet aliases out of SoC
 DTSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dts-imx-aliases-ethernet-v1-3-15b9d5cca611@linaro.org>
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
In-Reply-To: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15713;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wNLa8Pfub/rRnCkBKRDKSoylysp36U0ZhBtxbmNTPM0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoC+cQjxH45eFXsuWcV4Ea/V0ec39ZK42OFYayr
 7GOCn0MrxyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAvnEAAKCRDBN2bmhouD
 14UID/9dZXZkCMnuPCAfhSEmzOka6EmSaE/0pve38V7QaKE5sLyRiaBhwDCQYeEOVZ1G2aJKdky
 jf3srALy4P/Z0SsG2ZiikB/6Y3ZUVwDRuVMzqJtCY1qzLiFHLOeEZkltYVoRCc4sjHtuUkXTxF8
 WPmOLjYiS9d0zAQEPMe8vST8150qpgzmJmGx+cFT80B+IqDP2rq9khesjHEgEHnUpqUlk9zUp4u
 SJzvkn3FhJdeHOroBezcP16+Gn4JoXp67uYGPQQN3rx+VUcJ/A2z9hmEHGg642JYDeknfaukHKE
 8mL3VtKu0A/qGSlnmSCOX0Tt3jDms78uYAQtFQbIDQWy4b3DQFyARckc/T0SLqsWg5408IHMP7e
 cslqCjIQlX3/0PRAPmEOGPhkd49x+ad7MEDv1ZAygMTwNkHYFZkSdUIJYeSE1vmihl4NoUDrVXz
 fBB3JTbKIl0MiDJ5nAuq+bblPVITZybD+q163qvc/ewgLlHW0Kp6yqkRbSO8IRuVy9sA9BmRU9G
 I35/6gFySpWyd5FyhGFfUAz3w6s6pmZt/NNDFwvfqQFHykOP8wD3zt8h9zV1YKt9njYl79kqZAB
 hyEgvcq4NLlkNHhSggnhjLavlnQd7OM57paG73cuXMMSvz7dP/9UVfA3T8kWhevzTyFoyElF5lD
 IjafxzopxvbQnOA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_124843_464590_18DA93D1 
X-CRM114-Status: GOOD (  11.75  )
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

Ethernet interface, like other exposed interfaces, aliases depend on
actual board configuration, e.g. its labeling, thus aliases should be
defined per each board or each SoM.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi          | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts   | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi               | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts      | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi                 | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts  | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dts    | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts     | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts           | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts             | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts          | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-phg.dts                  | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi         | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-ucm-som.dtsi             | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi             | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi       | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts        | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts        | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi       | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi          | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi          | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi       | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi        | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi                     | 1 -
 arch/arm64/boot/dts/freescale/mba8mx.dtsi                     | 4 ++++
 26 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index 62ed64663f49521a9c14927886018058e489c914..ffe1d18c5b626253323e45aa1ba2c27e3742ef1e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -7,6 +7,7 @@
 
 / {
 	aliases {
+		ethernet0 = &fec1;
 		rtc0 = &rtc;
 		rtc1 = &snvs_rtc;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
index 472c584fb3bd294dce18341ce1afc277be1c3825..5dd685ffc9825329f739cda32274cb223e88bf15 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "dmo,imx8mm-data-modul-edm-sbc", "fsl,imx8mm";
 
 	aliases {
+		ethernet0 = &fec1;
 		rtc0 = &rtc;
 		rtc1 = &snvs_rtc;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi
index af7dc8d1f5f10d5e2eac677af60c7926e95fdac6..ffee784539ffd0e8cdcdfeb97bac817e4c128fba 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi
@@ -9,6 +9,10 @@
 #include "imx8mm.dtsi"
 
 / {
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	chosen {
 		stdout-path = &uart1;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts b/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts
index 90e638b8e92a95214d8c3c719dd2a6db2630ebac..a98316b7dc443cf9bbf7c45ec8d1d8b3847ddd70 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts
@@ -15,6 +15,10 @@ / {
 	compatible = "ees,imx8mm-emtop-baseboard", "ees,imx8mm-emtop-som",
 		"fsl,imx8mm";
 
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	connector {
 		compatible = "usb-c-connector";
 		label = "USB-C";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 5f8336217bb88b1d0501e6208c936c51ce23b312..48a76f656fd4302218a430bebc08afb0bc3d09b7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -10,6 +10,10 @@
 #include "imx8mm.dtsi"
 
 / {
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	chosen {
 		stdout-path = &uart2;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts b/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts
index 502745402847ea16ea0e53415a9063c6ba9dbffa..5c340bb01a7afc342650f7ea652e281cf0906a2e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts
@@ -14,6 +14,10 @@ / {
 	compatible = "engicam,icore-mx8mm-ctouch2", "engicam,icore-mx8mm",
 		     "fsl,imx8mm";
 
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	chosen {
 		stdout-path = &uart2;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts b/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts
index ddac8bc7ae65159314c2f8a9d41eafb51ae4f863..9f70bafcaa4bedcb71d8c467146c92535b23c149 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts
@@ -14,6 +14,10 @@ / {
 	compatible = "engicam,icore-mx8mm-edimm2.2", "engicam,icore-mx8mm",
 		     "fsl,imx8mm";
 
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	chosen {
 		stdout-path = &uart2;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dts
index 055faae79930cbdc347f849cfae7ef3b24746b12..e7af6ea80ebc886df82281ae3912b17dbbcb5dbc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dts
@@ -12,6 +12,10 @@ / {
 	model = "InnoComm WB15-EVK";
 	compatible = "innocomm,wb15-evk", "fsl,imx8mm";
 
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	chosen {
 		stdout-path = &uart2;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts
index 33f8d7d1970e0b165c159a788fa0a96cbefb0d82..23fc653a3a45474b2fa1df620fe0f568a8a6fca1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts
@@ -12,6 +12,7 @@ / {
 	compatible = "kontron,imx8mm-bl-osm-s", "kontron,imx8mm-osm-s", "fsl,imx8mm";
 
 	aliases {
+		ethernet0 = &fec1;
 		ethernet1 = &usbnet;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
index d16490d876874b7bfc9066efdd724bbb52f518b7..5d6a09322f2750b8b1c6dc93b995dac7cabe35a2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
@@ -12,6 +12,7 @@ / {
 	compatible = "kontron,imx8mm-bl", "kontron,imx8mm-sl", "fsl,imx8mm";
 
 	aliases {
+		ethernet0 = &fec1;
 		ethernet1 = &usbnet;
 		rtc0 = &rx8900;
 		rtc1 = &snvs_rtc;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts b/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
index 0b123a84018b2978291ccff845332d55022c7c75..ba5f85454d1c78c635363f13f508f363a4aa53aa 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
@@ -14,6 +14,10 @@ / {
 		     "toradex,verdin-imx8mm",
 		     "fsl,imx8mm";
 
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	/delete-node/ gpio-keys;
 
 	leds {
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts b/arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts
index 12fb79d20b29e21c1984a7077c61803875523c7e..21649620aac4cd32eeae08758cd80eb8be1db2f8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts
@@ -10,6 +10,10 @@ / {
 	model = "Boundary Devices i.MX8MMini Nitrogen8MM Rev2";
 	compatible = "boundary,imx8mm-nitrogen8mm", "fsl,imx8mm";
 
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	reg_vref_1v8: regulator-vref-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vref-1v8";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phg.dts b/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
index a134b183364961afdaca057655dff6a7e248e51f..c3a7435201d9c0f8c5469c1339e3a39ac81e4ffe 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
@@ -12,6 +12,7 @@ / {
 	compatible = "cloos,imx8mm-phg", "tq,imx8mm-tqma8mqml", "fsl,imx8mm";
 
 	aliases {
+		ethernet0 = &fec1;
 		mmc0 = &usdhc3;
 		mmc1 = &usdhc2;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
index 672baba4c8d0527f2de002d49aa96d30a6ae2373..db8a8022e86d0671296b202b125446e7856581bc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
@@ -12,6 +12,7 @@ / {
 	compatible = "phytec,imx8mm-phycore-som", "fsl,imx8mm";
 
 	aliases {
+		ethernet0 = &fec1;
 		rtc0 = &rv3028;
 		rtc1 = &snvs_rtc;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-ucm-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-ucm-som.dtsi
index d3b21203c5f49e9bb697c602d49e3f8ac9c9f603..18f4b30d7e41e8e7ecabc4c0b9fede0ec6376d7a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-ucm-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-ucm-som.dtsi
@@ -9,6 +9,7 @@
 
 / {
 	aliases {
+		ethernet0 = &fec1;
 		rtc0 = &rtc_i2c;
 		rtc1 = &snvs_rtc;
 		mmc0 = &usdhc3;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index cdfacbc35db57b654f7b965a513cf04cb4a697b9..9d207dc75cf9322c68e5c7032fe5cab58f0f2ad9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -9,6 +9,10 @@
 / {
 	model = "Variscite VAR-SOM-MX8MM module";
 
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	chosen {
 		stdout-path = &uart4;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
index 5a3b1142ddf4b7d31db2e6e2723e86cc089a96db..1d03e9a32da2d5ec40a751d10cfefae4eefd71e7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
@@ -10,6 +10,7 @@
 
 / {
 	aliases {
+		ethernet0 = &fec1;
 		rtc0 = &gsc_rtc;
 		rtc1 = &snvs_rtc;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
index 46d1ee0a4ee86b025d94453460770e08b5dd8d32..1f7cc6310d61c98523f0fda92dc1cd060a26c2a2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
@@ -18,6 +18,7 @@ / {
 	compatible = "gw,imx8mm-gw7902", "fsl,imx8mm";
 
 	aliases {
+		ethernet0 = &fec1;
 		ethernet1 = &eth1;
 		rtc0 = &gsc_rtc;
 		rtc1 = &snvs_rtc;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
index 86a610de84fe2348554354f838e1d824a24a4322..b1f83f84e7e11446fcfefdc1c7f20a5fdf3e3338 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
@@ -17,6 +17,7 @@ / {
 	compatible = "gateworks,imx8mm-gw7904", "fsl,imx8mm";
 
 	aliases {
+		ethernet0 = &fec1;
 		rtc0 = &gsc_rtc;
 		rtc1 = &snvs_rtc;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
index 3d0b14968131049b15fea3f52d10f60c006f341b..440678d8e933bf60325fea1ca340441451e8e93e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
@@ -4,6 +4,10 @@
  */
 
 / {
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	sound_card: sound-card {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&dailink_master>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
index 1d8d146d9eebad32de81c0f7860be52a4b6d7ef2..570091dded8446cf14fcc1869105f513abef6651 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
@@ -4,6 +4,10 @@
  */
 
 / {
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	sound_card: sound-card {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&dailink_master>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi
index 29075ff5eda63b50bc008ad501e96333c6d07325..9c27dab2668defe2bcab46686d2e83433e846665 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi
@@ -12,6 +12,10 @@
 #include <dt-bindings/leds/common.h>
 
 / {
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	/* AIN1 Voltage w/o AIN1_MODE gpio control */
 	ain1_voltage_unmanaged: voltage-divider-ain1 {
 		compatible = "voltage-divider";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
index 4a0799d63446cdaa0a404091386ce8a4164d5aca..285eb0ba87e53f9adf9e102aac9329146b047a27 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
@@ -11,6 +11,10 @@
 #include <dt-bindings/leds/common.h>
 
 / {
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi
index 763f069e8405442f2af7491ff810b8b2375248f2..7df5f44c5f5f438ac28376d1dfb3caa04a077f0d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi
@@ -6,6 +6,10 @@
 #include <dt-bindings/leds/common.h>
 
 / {
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index cfebaa01217eb02b9514c51ae7dabc6cd7b7245a..67c57c071c8ab8d55ef1c93ae155ed08c7c6af30 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -19,7 +19,6 @@ / {
 	#size-cells = <2>;
 
 	aliases {
-		ethernet0 = &fec1;
 		gpio0 = &gpio1;
 		gpio1 = &gpio2;
 		gpio2 = &gpio3;
diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 7ee1228a50f4f9bfa46edc62d956b47b906326f5..1b24dfc36c8340b8f5852c2dc37278c8386294d8 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -8,6 +8,10 @@
 /* TQ-Systems GmbH MBa8Mx baseboard */
 
 / {
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	backlight_lvds: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pwm3 0 5000000 0>;

-- 
2.45.2


