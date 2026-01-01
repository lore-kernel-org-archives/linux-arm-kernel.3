Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178D9EEB56D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOOkO0Y8d9P2yswmxe69xUL0YHF0SsjJE29vdXLnWdM=; b=U2wzu+kCOFuryfIhlOZbGuvbL/
	OjJ/PIjhpiry97NOPrWCYcaDqU/nq+sHnb9YJpBOEo2OAklCwKXJrt+ScnCAwIO1yo/fthZRRCdVT
	ngUaz6dSxzLaQ2Gkij7ckOKbtp6VcADWKjAS3w66nnBIBSRuGmGtIuWo2U5YiMge8YAtec1giRNTM
	aKyPMnScvsayiv1Qj4RFJl+DYErsE/z6aJWpo7X48acU2klR6EFGuMVABkq4ERBRJuvczTukJ3Gve
	e+sT1mOq8JB+nQo8hU/NTEdNIrFxYX+YLEDaqSH16eAC70I4jw928aOrKhtnkcKP+OASZ+NJKA1lW
	K7UD5IYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEaj-00000006jLG-4073;
	Thu, 01 Jan 2026 09:03:33 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEag-00000006jFz-1jcz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:03:32 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso18067367b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258209; x=1767863009; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOOkO0Y8d9P2yswmxe69xUL0YHF0SsjJE29vdXLnWdM=;
        b=KB2zZY3Q0mctK/Lc+GIkuk+jXVxdnO5W0wzk/8WrLqbbJLpCZ5KESejYfuBnrjH/94
         xl4BnxBmOpUgtPPvMGGw+MEnJxrbbEuO6uRJP6pvsGoRVGmFdfBcK+pk+NwJXF+mou3M
         z+wdl2pfX5c/GxajftwFEbW08zlOYOGqomYplX7kvcmiLNb0gs+8/U710muoua8YSm4/
         chjJFsNbWUPIb2FetYrvZj5Ywt//GCUduMAkEtg4Sb7B5JmGQ9GoJxbenrs6jMrARz/J
         3g99vDOHnToN9flEHAeXZEgOHgjAaTy4mmkzqvNlcSjs/USZzg4z7GaEGdQDfPkV7EJb
         X0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258209; x=1767863009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VOOkO0Y8d9P2yswmxe69xUL0YHF0SsjJE29vdXLnWdM=;
        b=q/rci0moi/HMqYfC4K/bt7dwF4/CgVd9CUy72PWvI/3jfOcr79PmMvtwpbt5eXqwY4
         B24fEvMymwFeYL4u9k9Eb1euw8zZnFe8grKWdf+KPp74cVfBQO2zrAlTeM8gzsMJaT3G
         vlLA4hBwfE4JHrhuGTa62v9VSU25UVzOUeAEuGGeoqrDib/gx6JYF8F/xeBclQiaVWPp
         ALJGrYkkE6kBgF2sbo3gAiogeryNtyE1E1V0vO2V4q6Pp5zpeVbyO26JZEFZFEkLfpRW
         tYNB1Dgtn+QWPd4gBPxVLj7QPIDWXgYG0wgKT4V/QQfnH39a9Al8gFyd9n8TAAcqB5tP
         aykw==
X-Forwarded-Encrypted: i=1; AJvYcCWybCO55LwwC2XA5bYj5ivezF4edzqDge+qds3iyDKQLxxB5JPok1/c6HXkuaYDr5pJawVctklZ9GJZgknOrWlG@lists.infradead.org
X-Gm-Message-State: AOJu0YyA4KX1pB2ZITW3JoIZe5CejgjDp7UgKHCHP4S+eIF4uhcXCjq7
	GkMD+BSlSoALKLj+ygrSiBF0OAONp8roJgwplXVTr7lPia3n0/HYLRGy
X-Gm-Gg: AY/fxX6O7Z+0kHcrNvLoJT1d4L4843PDvLsFaxf9E/rk0LnoBlGztr6jqE2elee+Y84
	oKdCm/Jr2GWoBlseIurIE1VsezLFmGHcxPDzB2F+Oc0Rz1bt2awX9q+qcCgL96YxWziM569gEZ7
	N/6okaEEJsRcPa8GXFhbhOw24v4KnWU3Qrq/N3HL7g2mWPK1eZxpPRNYWGgTcmjU4kNsqbJX4o4
	x1fZcCWPtH1+HOQnGN3kmstnYA+9dQWYxf4VAGBXNYlUm5xlEH2TMFOBKdYzxZ5/wCKEoFw/iwX
	L4XegubnwqC5ph0R0+R3rCiPtqoGkASc8W0PFFXOow5Y0HQJa8sy4ENe5uLBusoSI4jBTJrzbtG
	YnTTi4/mRuGivVw2KHklpmoWtZ4Ojuc2YBI89di8gHdloH7QhV1/z2JX7ppxBUzOX25O9Bb0gfF
	pHxHrhKaZjAn9Khg8COvxd280=
X-Google-Smtp-Source: AGHT+IFJBtSUfejTWgpNgQSoCDlIJLnAMjrQe0TebRz/JH0wlhP4fBgImgpnBrH6nBpvWNt011OSOg==
X-Received: by 2002:a05:6a00:ab0d:b0:7e8:450c:6195 with SMTP id d2e1a72fcca58-7ff66479a6bmr31930739b3a.44.1767258209581;
        Thu, 01 Jan 2026 01:03:29 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:29 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:52 +0800
Subject: [PATCH v10 16/21] arm64: dts: apple: s800-0-3: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-16-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=3omd0YVrSktNDZ3RXrP0xc/+wVtkaIIz0927w9SxlCU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgo4L8d5gWvdBUOBCVVb6ebQ4I+hDv/E1SUb
 kvSMq5z9Z+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KAAKCRABygi3psUI
 JOOpD/9oAMq0s34OmmAP01oVZU/WNedqAtueSymjOF5mohXEQuodSPtHLp4na/8PBkTnsdMaBk5
 qYq22cNUmGaW0tNNKzXYdJ5CHX3frqpUae8fhwpg2obo9CbMNAlxz0PbtaPxsJP/ZYmdb5EZnEV
 etlvvIBY9R6eWxQGZTZrH3TPf5gG724fi4G2AhurxVHs9c+O7M0NC51r7ElhxVuqEosrOERL8Gc
 s9DW7iZplLGl6hwLnS9hc/rJnoHP74o+IzBGy+1lQYWh99+8ReDPnFqJChy6+HkE7XyIVi6Wupv
 J7qy43MqWnYX0ZIPBrC29fru1OVTw3N00lcG8Zd72IkY5Rbjqtv9HFrF199MFT5UpK69u+8Ztul
 qghCVlwmGf5eH6uoI4A1O+K0u4RGx402evKOyJo8Ufdog+1cHk5ynjqX1GlQ7hxccCpmngmh4nv
 srzdvYX1pJ+LENySSHC506nt65L6cmeXIISvgVCBIzqpuz3boXCFsJrA3dVJb+uar1KQtimpf9F
 5HbO1vGr2G0kZFSjSchXVQkhoSgRG1TDLYRvcpMo44X0qpJ6peXtVlVaHJtNAP5I3Jq0OPuBPGf
 sKm8N0K3G1DhDcQHIX0DtjumbJPoo3NCybrEF25MHdxgw+f/vjL49Bp8/DesqujNDl882sNYrC/
 yo4itq/blz0kR1A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010330_476395_C98F3875 
X-CRM114-Status: GOOD (  10.15  )
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

Add CPU PMU nodes for Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index bb38662b7d2e0b70e18b6870b706789b1cb242af..aa372aefc995334b1489953c16251c8ff9b94d98 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -237,6 +237,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 76 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 79 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s800-0-3-pmgr.dtsi"

-- 
2.52.0


