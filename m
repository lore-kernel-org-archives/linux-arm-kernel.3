Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3721C79F87
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 21:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vu/pZRzi+PHRIHNfr1m3RJJ4wr9M9/chVTLqWsd29z8=; b=GV1rsJGeMB/t5Hy5f3QnJdkcGk
	zbYxSKcN29VGILplUyIawY4kmcTfFUpaDcXkuSTwboSpS77eUY3N6sZTujCf4U3OtVZ/BNkl7oDQB
	OS9FnCNS8Tvcj+7bhkEJuoCJNdEoq9czW8S+fNGObpJ/qXXnq8LkQ5AwHzR7kXPJbX/pn05iqnhfS
	Kw1T6Aa3GjQ/4NoNohTK6usiMYNSyVqLyha+llzapsKadX/Aa9DvuaefeSjHxGpLqmbswW4OlMjdv
	RF7DQd68n1we6MY/1qGQOR4ppEWZ07BnF8xlpEL2FMVu8GT2TQLS9ubGLnyfnOwZVYKdefgr3731/
	RU1O4sXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bXa-00000003KaZ-1kaR;
	Fri, 04 Sep 2026 21:33:42 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bXW-00000003KYm-0TZv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 21:33:39 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-52cd38ddcdfso18395311cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 14:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557617; x=1789162417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vu/pZRzi+PHRIHNfr1m3RJJ4wr9M9/chVTLqWsd29z8=;
        b=qR6AVSyPtq4Lmr8pe13lQoEg6xxvqrt/TLzt1iBktuf94gEVtdd8PIvENr9f075bAD
         6K1HYEx5CYADztth2ziivnKXSp1vRMcHiW+m/uaDlvco5l3azVS++JqpxYEyHONAIP1F
         /LnPy0XMnAze6/QZ1i3/XtGJDMn/SkDbkwoaXT+gfrzYapPoCQ+ijelU0M9LfmbnC/lj
         sh/MWtKh6osKD3eUo9wtxlGi5pPHr/V33nw89yFRFjjN+6WS010yS31aJz69RxXCkZDd
         typiFBgZOhsv1eal172PU6yKnOiDhaaYnIh8XPvyBvQkFeDfhEaspIVByay40nsRPVCF
         oEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557617; x=1789162417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vu/pZRzi+PHRIHNfr1m3RJJ4wr9M9/chVTLqWsd29z8=;
        b=G5I7Vf+IibNynIbmwjnzosG6TVxKxAYtXYrcuwymBNBbi+oPVZMdPcIGPHiYXsz5E0
         Uuc8+TSb5/Y0boFSXze+6oeO2f3r0XhIJYXdEF5EF9nAFYVMphFo4rQkp8SEQUjydh4U
         guV14cXbSV1bPpZXGmI0L1AAdi2LdLPIqUscDAJ10C54Uk+z03NH8QmcVN5CIn2uqmJs
         dP19/q1DL2ZDhU5egA0UC+I31ieSKKqscUyrPGC2UpBGaJ95hbeTM5le3aHsfnPK8+18
         izetrLbvvvypBmEpUL4/Go1rwvRXz2z9jbpVyY5fD0+eo8dmUROvJB/ufPGMbESFx7bq
         ihzA==
X-Forwarded-Encrypted: i=1; AKwUvBxPPgYmEcfUEhxZWQ3Hr/FW1i+1qCDPTiXP68+OMnsj0Ma4WCtO3Z47ZQzhl4tYB0JAxJlYv0qo7LzVKAFnSxD5@lists.infradead.org
X-Gm-Message-State: AFuF++nQAh/f8xxdG8o+ttHA5q37oirO5hVoobkakBiXdbnHbxqc6uMb
	W5vnflXNiMtiPkWd5AQti1qu6LzFp+E/jLGcnqsWdNnStrSsyTzMXZo=
X-Gm-Gg: AYBFou2izUAonWDMgvvGDuSKW/W0mjciHC1XsYHlZoGv/Qu2M3I74UoGFbNBnSWj+ii
	e1ed6jAoV9yqJzW33JnguGsAK8bq8fv+WoKydcjeH5ajqx6jLR7f7ibVvDicpy9LmoJ33y9HX9H
	WZGPujFbSKoukgi4AF0v6cw70lJLa28awbiSW/zptxzCqlnzHX9iE/oK8+UVwyU/eAWP42TYrww
	KNhUbXYhHcveBrPuIouSk0SEZbqKFpFF7fL1LmZHZOwUikPxnweQVy9q9h9NMWYxQJR5hCb6BUi
	UN2j5kfvYdPRJug64pPBdi9qwRwSrHE6QZVHlSk7AdUsTapHdfYarXHO2ULrw5oYre10icffyZh
	bGPpZH2QT3zE4jFrfEsq8ajqTy2GYoqvNYHJdVEvcD+OzkeIsW22egSfow1N6JhHqw3h/5OQpEr
	d7tnuxgZstqyUhlv4ecNOpMLQoEkyqRfv7HRCIvkxmMz9/0ic5ij2FMicRBn/93jKvVlkKp/CdB
	IKCye/w4mOXWec=
X-Received: by 2002:a05:622a:4a89:b0:52d:8743:bc83 with SMTP id d75a77b69052e-530549f8265mr111105391cf.34.1788557616511;
        Fri, 04 Sep 2026 14:33:36 -0700 (PDT)
Received: from X570.phub.net.cable.rogers.com ([2607:fea8:744f:d200:9441:f2ae:56aa:8a81])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53054227a0esm29646561cf.29.2026.09.04.14.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:33:36 -0700 (PDT)
From: Barzin Lotfabadi <barzin221@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Ryan Walklin <ryan@testtoast.com>,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: allwinner: orangepi-zero3: enable HDMI output
Date: Fri,  4 Sep 2026 17:33:29 -0400
Message-ID: <20260904213329.3910099-3-barzin221@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904213329.3910099-1-barzin221@gmail.com>
References: <20260904213329.3910099-1-barzin221@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_143338_177496_477A3356 
X-CRM114-Status: GOOD (  10.28  )
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

The Orange Pi Zero 3 exposes the H618 HDMI transmitter on a micro-HDMI
connector.  Add the connector node, wire it to the HDMI transmitter's
output port, and enable the display pipeline.

Tested on an Orange Pi Zero 3 (H618, 4GB): the sink's EDID is read
correctly and the board drives a 1920x1080@60Hz desktop.


Signed-off-by: Barzin Lotfabadi <barzin221@gmail.com>
---
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
index c51d4d912..444773e4a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
@@ -11,6 +11,17 @@
 / {
 	model = "OrangePi Zero3";
 	compatible = "xunlong,orangepi-zero3", "allwinner,sun50i-h618";
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
 };
 
 &cpu0 {
@@ -103,3 +114,17 @@ &pio {
 	vcc-ph-supply = <&reg_dldo1>;
 	vcc-pi-supply = <&reg_dldo1>;
 };
+
+&de {
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};

-- 
2.51.0


