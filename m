Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05098C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCcV8YncwcSM7mbOqAKDospz7Y+MQQ8tADbXGsEtAUU=; b=Jt8BJ6ciJl5vW4wXwPpTC/7Imj
	sYmSXP1gyGuxYBNz4yN0FGJiSAphmz4ppu2KzOa/2NU2FGylttPh8dn+gZ5+9XEWddeAfquFjBSpY
	0XDBvRkbauQziK1SHpniWgkjm6rmjHBXodQ2wfhlG7lHQp1Qa/Sl7PkWcow27jkr2/8yMAx+lAHq0
	FPqCmryUMsdwBebDWDhS28OqLqoyi29lWz+rpu9rlsn9x6DJSLqgitmiccQ/SBAIvY5pInEOlAC4C
	VpF5+rCzpQ0WcF/GXak5jtJYpct67PWvMzdYsRWyQdBUrw13jPBCQZ6S6JIlWAqz31zSCfCIqNQQQ
	liZUKH1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2cY-000000010FV-49MC;
	Thu, 08 May 2025 14:53:10 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1y1-00000000rrP-1LFB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:11:18 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5fbf52aad74so3196340a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 07:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746713475; x=1747318275; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fCcV8YncwcSM7mbOqAKDospz7Y+MQQ8tADbXGsEtAUU=;
        b=AAkj3wmndISBKnDws1UAHaehCs8gYhHr/yt5yAiVEJ/3OdlpjQ5iBaFoq38JdJDg91
         AVcpjDKQuClMv0pDTAnbyAX4zoPaG2xWmKX37DkH6u/lPtqpNefb7ZU5QFzxyio7eTGx
         X5lE+BpcBNemWS99t8sfUul5b1baWyoFqflZQrIQmBba9XX0mKrns4GWKXL1bfEuxd0Y
         sBno4/tq/SAYZ1XwQUa8lpqCWlEbMuLCA6ZszzDiO52P4h3S7UzIBIj34xhLno9NrgJN
         46YOrUA2xyWNCZy5ix3xFx5f2wzqh4Z/+LZ0p3qMbCdfES9cLyIbeIIYovX52N1rgUP3
         IxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713475; x=1747318275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCcV8YncwcSM7mbOqAKDospz7Y+MQQ8tADbXGsEtAUU=;
        b=Ne06MuMrOi1FvW5ajSlHOb9QjYszALo/ShhGr9IU77/ar1F6XVgEKqPEf6Jh0VnxfV
         AFEdiAlFQTPhT8smAa7XFNBiemy0fFrIg4vTLVItnO0XaiF9U3tjBwTbDE/h69fK16mC
         tCDLfeD7FWKwP1AmBaqGNjKrHvfrzAGA/P2dyp6ZilpjTg/2jFQ3vCxySPOweYODEoFE
         2EWTkFdchvdK0E9owUMx2zdt/EusD9nYb9ggZD4s+oT0bLCFmBAVyyy7Mz2xxBjKfENy
         YPJU2kjJi+jTdD4KvhLnvAInqgDYwH24f+GJ5bSsRuDAltJBdnfdD0Wwytbgw/mryesK
         09gA==
X-Forwarded-Encrypted: i=1; AJvYcCW1IOKjpXoSqIjJViNjG+p6EZdfKs2JZOT5ZIZjqpJZaqQHo5jgLzfXw2lv6OHL8JgLk4vGeFYoGwKQD2DMD2ey@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi+bwoJcsfS9iOHpFngrK0jjicqF35HdHSP+vHet6fT2oJbZLx
	ch0b+eE2SRQM45DxGtYpOvghkOdxZO2MB3VmQPos5N88Qps/2Z8n
X-Gm-Gg: ASbGncvJs8uxeCw8cl0zc74AJIT8vt+zt8yleaeYVAibfE8c7mLerDCUue4CVfUOsKI
	UBpppHZpG6xn7fr21YgbVDbFD0JQkHllAw2ehKVyqTtMTc5UIKxh0EWhuMzJNRgJ5Mz50LMIbE8
	qvGndfKUiGh0v/+dNj+2i55YZx2hB7FbqxOW0hjqRj4xCBMbt0IQbmcb4lSmQY//crlBXGs/e0D
	u0aGcHfikzjxEcGOZJvZ2oNcGpl6l+EjJ1IFBO8+Er8K6nmHiSz5VoCQAT2gsYEXdDoS585y0mI
	VF6QDkEbqcWW7I8DIiXeCZOIMysRNJn/OFvfWuey+GFlOxhq6/4xANMrDTUVTSTtK2AZLL2yjxI
	KM9ql
X-Google-Smtp-Source: AGHT+IE8qLgCLFFoy2skfDapB57Kk5ED1A6kuxp/5PVZLa6XNjsk9TF4vvDVMtDBcqJhFkkfeRH1Kw==
X-Received: by 2002:a17:907:1886:b0:ad1:d304:e2b8 with SMTP id a640c23a62f3a-ad1fccaf6camr366183966b.26.1746713475230;
        Thu, 08 May 2025 07:11:15 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189149041sm1089186566b.25.2025.05.08.07.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:11:14 -0700 (PDT)
Date: Thu, 8 May 2025 16:11:13 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ARM: dts: qcom: msm8226-motorola-falcon: add clocks,
 power-domain to simpleFB
Message-ID: <cdb6915bf40c055c77a0beb2f49c20458adf7481.1746711762.git.stano.jakubek@gmail.com>
References: <cover.1746711762.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746711762.git.stano.jakubek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_071117_357953_87237723 
X-CRM114-Status: GOOD (  10.63  )
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

Makes the display work without clk_ignore_unused and pd_ignore_unused.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
 arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
index 5dbca83f22309..c01becca3d56b 100644
--- a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
+++ b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
@@ -31,6 +31,15 @@ framebuffer@3200000 {
 			vsp-supply = <&reg_lcd_pos>;
 			vsn-supply = <&reg_lcd_neg>;
 			vddio-supply = <&vddio_disp_vreg>;
+			clocks = <&mmcc MDSS_AHB_CLK>,
+				 <&mmcc MDSS_AXI_CLK>,
+				 <&mmcc MDSS_BYTE0_CLK>,
+				 <&mmcc MDSS_ESC0_CLK>,
+				 <&mmcc MDSS_MDP_CLK>,
+				 <&mmcc MMSS_MISC_AHB_CLK>,
+				 <&mmcc MDSS_PCLK0_CLK>,
+				 <&mmcc MDSS_VSYNC_CLK>;
+			power-domains = <&mmcc MDSS_GDSC>;
 		};
 	};
 
-- 
2.43.0


