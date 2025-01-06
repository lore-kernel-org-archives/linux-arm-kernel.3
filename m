Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271E6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kYuzMHGnD8E6XhCjcca6YSJC8fqqzUa5TU6pyjVh+N8=; b=T/P6mBrLa+CavVFwplECZUp4LH
	Hz3lMjszPp1/ReNhjWoXUwyEVT8Mw3B0lKJGe0/IpzcpYLwun97R1gRFCTZaobKPUTW4RmekSgH6a
	9rquC80D0j1TJK1/AtXnb8WG3M7+DehTHTan4lbePPlAG4lHEwNTiAt1GcpN7nKSbPzRnuHY/eYuQ
	9Xd4mZU2xXXKLtKIf4JoyBB0HzbefurmoVsW8ZVzLYqYV6LRLF7IPZC8Bjz9RheWT88mhNyPbIgvF
	SscAEdUAp2Gqf30cNjRrQYPTfPiq3rckS9+U7TvR/M8TQQfdiF8GcnsAQNdDmAhTS7eDdvMIBjzaX
	xjyIE2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnlW-00000001W1X-1rSI;
	Mon, 06 Jan 2025 14:07:34 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnhm-00000001Urg-1Hdl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:03:43 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2161eb95317so212699425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 06:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736172221; x=1736777021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kYuzMHGnD8E6XhCjcca6YSJC8fqqzUa5TU6pyjVh+N8=;
        b=KVOo9LjdXJv6jq6WRkXF9It8qz/J7jHidMWCUaKicc9+9H1y82sy77ZMvI1EPy3IHY
         qjfHg6/yOpNYzNEhwVV/hyqBR4Gayl+T7rDaMOR7Z54LhGPkUZajTd4sVW3JM1urmQsu
         80yWj/A+DMfs+O1dBqCI2en/2GfD5UWzqH1CWBiF5m++WsYSeJeiEusG/K8NA1pBDqo5
         vMnMiTeE5jZ6LLZdiNaz8yCukmquaEq4nIyMMkeIREMtEn3CKxB3JD4OrHupi8KDLNd4
         RGx2nrP0qjOY3lgP6NZSlMTeva0cglW4eS8JuZyKnV4o7eItdvE1LpDtpqdVhZDj08U0
         o+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172221; x=1736777021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYuzMHGnD8E6XhCjcca6YSJC8fqqzUa5TU6pyjVh+N8=;
        b=k/WjRU8ukwRlj+Orp74Qnsb7+MDLSWyVzWu3vbNwuucie20IEIu3jqKbIU5OuAc9rE
         inQTgP+973y4fXoAurJAjIh18EGK6riya1nChLQW9hH7Hp+s81nfexY5PuYsDL3xO1L2
         t0bVAH1LgJHKnvuQ6VoEwjFGEvkITzfsk3/0Avtdo2CMrXmWEWOSJIZ8EX9mq7JCsF5Q
         cTn7nr5TivwCFVKpYxgn6MLXn5QJsoJ9fegRU5Xgrqn2j04rZJwUR0zOuH3gxEemMlWZ
         DMpr9DJMCNNAkKwsePm1dlkCvWxSy8YMBan2DoLz/VeGe6KCDaibzPmW51lHsdt7XPvv
         uXHg==
X-Forwarded-Encrypted: i=1; AJvYcCWVeaS1jmOCRqGOTE36CFHRNSYZVIwzpSCjgQvwAaquOGUIvxWoYxKgeFZMDceZXIRcwFHgX7gxCZRBnMFSepxg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1v3TShpT3QOOAYyRF1RMuNV8kBPRkKGxwJ6rWeEOmTlmMfKC8
	ySV2Cs05x4AXUf47Kz4O/s3R1mQd0J2qRjKWuiLggsLwgJyMXbGb
X-Gm-Gg: ASbGncur2KjN0AiNjheld3biSC5rs8kNTAu36Pc/s5qYnqzVHr4GiZY9kt0zB7SVI8d
	cA4xgz4QQe26SoPT91JsYoUq+ehf3VvTFELKII3qsi5VovefJJBRGVIb2SWLzQZNpokGjVVA9Bj
	56fXZhelRjiF+ffD2UqLPabNyNgsD8/ZO52v9Yi4/b94Zq20SdyrvWFF5sAySIJhHcYSnQSdRJq
	RcB/hdE6FOCW9Z5zpQ8ObpkyfZWcJJlsJb5AVEoUgQwvV2oNcF995EO5MfFFoQUI92UFAs=
X-Google-Smtp-Source: AGHT+IGv/ZTw3KxrI0XtgNz3OOfnts53BzVuzKLJVbFuKl97oG5Jb1fBASVM2CQGYpUiyDEUaj9W0w==
X-Received: by 2002:a05:6a00:35c3:b0:725:ea30:aafc with SMTP id d2e1a72fcca58-72abdd3bf6fmr89544004b3a.5.1736172220757;
        Mon, 06 Jan 2025 06:03:40 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d4cb:2a53:2696:85ea])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8f90b9sm31341054b3a.131.2025.01.06.06.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:03:40 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH RESEND] arm64: dts: imx8mn-bsh-smm-s2pro: Remove invalid audio codec clock
Date: Mon,  6 Jan 2025 11:03:30 -0300
Message-Id: <20250106140330.2071858-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_060342_341567_F59D0247 
X-CRM114-Status: GOOD (  10.51  )
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

From: Fabio Estevam <festevam@denx.de>

According to ti,tlv320dac3100.yaml, 'clocks' is not a valid
property.

Remove it to fix the following dt-schema warning:

Unevaluated properties are not allowed ('clocks' was unexpected)

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
index c6ad65becc97..475cbf9e0d1e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
@@ -64,7 +64,6 @@ tlv320dac3101: audio-codec@18 {
 		DVDD-supply = <&buck5_reg>;
 		reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
 		ai31xx-micbias-vg = <MICBIAS_AVDDV>;
-		clocks = <&clk IMX8MN_CLK_SAI3_ROOT>;
 	};
 };
 
-- 
2.34.1


