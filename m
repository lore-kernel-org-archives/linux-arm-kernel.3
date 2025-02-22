Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14E4C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 19:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4p//QQSnh0sI60/OdJjuWE5Xl6l4M+zjvVhaN3uhEcA=; b=qK86dO776h8mkzjG+nl4nOQ3L3
	MVzCyyqvYuySJX04C0/p+KLL6GIQyO+fuHCooUUFH4kETMVL7x4JZNiQtlgEVV5YQtkKpGg5ixDpY
	JyRBbCCcQUTzHctOz/FT1UEY12TXeA/wRW2O0pW+UwFxIPQR95lYe1vJyudoqjcfMAdgJGDYLYIda
	yunZ+xso4kW+UkGI23oZuybApNzrkQ3vEwh8pZ9Kh3mE6ySKQJviiFdX4nGr7aELVIKuxPct+ZqEY
	q/OJJjwPNAM5Mt05E/XFVwTi2MJxMIvAlCRpoYXD+oEyGkU++60V4AByJcgTGWs2nfO3mG6lL/i9T
	oo1o+tXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlvP4-00000008dMG-1fdS;
	Sat, 22 Feb 2025 19:43:10 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlvGX-00000008cWx-34aG;
	Sat, 22 Feb 2025 19:34:22 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-72722d2717aso870478a34.2;
        Sat, 22 Feb 2025 11:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740252860; x=1740857660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4p//QQSnh0sI60/OdJjuWE5Xl6l4M+zjvVhaN3uhEcA=;
        b=Fw246of9d+O/o1PXOL4Mq9+G6UIWLDRCQXEcwElyI+rFityhTseooCmq55PLESVlr8
         BBEi5PxWMxYWEH8nRLi/Dl2zzg4zDmLZKZNCAEfeRmEY9GvYn2rDWjhXY+AW8uJu+ZvV
         0G1WAAPN9Oek1AJg1HqsR7Lyu7GtZaC5Ek3tCG2frxpkfoQ41vmm7duTnNAC0JEGcRQD
         DRNmwWdtTGIJ7oFc4Ienhx+5IebEQk6O910NM46DA4s4ep4L+BhSeHBUg8ExbsgNmqJX
         VuJls6gZr7slOYPbpbbToFbFEu1SnKUbh/Qj39lYF9YzuyZsWCN2UECQMKnJbuImdm40
         h69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740252860; x=1740857660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4p//QQSnh0sI60/OdJjuWE5Xl6l4M+zjvVhaN3uhEcA=;
        b=aQmVLKdiMP/N2uaeyhZ9HxjtD1w7X2M4BVUxc9qwqzMMsL3Skq76TIU2kaxNVHUKEH
         VkM7W5VEKmX4mw8tYQZh9//LG8tAPwT6Jbs4FzcvYsbVXCea4gcLC6IbPsM6vNni/AJp
         hn5TZ6MB+1PhWlMyRItWqMsGtfdKKpGqJoVTfxF7AD04iT0yGr2+MJb1RE49N37ELT+L
         3d5/4GsvEbqhv7iliwGGx2oCmZMu3D11QauUy7Pp1YfK1cbtdl6TX7trdLxBPsp3T2sA
         XjCr2HSXg31rK+gnXy8cjOPLZK9EVvzlpcb7/smh4tLgsumCQ3hgaQvGlHKI8xqEKAkQ
         xUCA==
X-Forwarded-Encrypted: i=1; AJvYcCVMT+A3mwTOz2hGMgRkw12KaZH5LdDqIDKG2ZYXfkNIf2MGs22ShhxxmmxrmKXceaMi8EPf8VDfuJRLUrO5jmok@lists.infradead.org, AJvYcCWQb0ZDAQFJ1ERAyS0iIHMMt12sgxw0zh3QzRlt8CxWxDuPrT2X9diIr00Vg9IV9mzYPOaUFFxYnF7PUsUBQ3w=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrTLhwebuGoUGzNxfWBKisIfGFtRmcT0PJtvd28TEBnzsMI/Jx
	rUo7yefL8o2R2CiGS4O8D2Wg9Qumj+iER5eykqj9ssDVjBK3uWVY
X-Gm-Gg: ASbGncsKkfPO/dKiJV0ElfkSI7+EeQ+vzh42WsqV0H4YDgTxtfTVVa3jx/uIQsSp9Od
	q032cdSGzLjslf4jT0QrbCCSeKLjy1VH3OvYa4KDLjtdJFNiuZLBnYmwDDBdxTAKY5MtmLtXfoG
	fP5enKYd6O4ewUx89K9qiJWiMxog2CcBF94evgzoYalbOTfV2kNOY/wsFZuymVmcuio2VDFW5Hq
	pp22cEzJfwClhshOOExksrHsEdgn1DZyFzZZrS/D2MuiLIyIpcimotpk/CQtSXeP72+EuF7tFGm
	uHxtK1ZoA8PSYbJ0OnWm6p7qX19fPx3FQg==
X-Google-Smtp-Source: AGHT+IEnzxqyO5lD84qybn3dOo99njJP4IlFDL9igo01O+GEoFDDWs2g6v67O44C0/UpjTlNDooEcA==
X-Received: by 2002:a05:6830:7302:b0:727:40af:165c with SMTP id 46e09a7af769-7274c2452cemr6470966a34.22.1740252860622;
        Sat, 22 Feb 2025 11:34:20 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:b69:ffa3:9d4e:2cd7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fce7afabd8sm2724012eaf.34.2025.02.22.11.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 11:34:19 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Johannes Erdfelt <johannes@erdfelt.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v7 5/5] arm64: dts: rockchip: Enable HDMI1 audio output for Orange Pi 5 Ultra
Date: Sat, 22 Feb 2025 13:33:32 -0600
Message-ID: <20250222193332.1761-6-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222193332.1761-1-honyuenkwun@gmail.com>
References: <20250222193332.1761-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_113421_765503_43A8DC86 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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

HDMI audio is available on the Orange Pi 5 Ultra HDMI1 TX port.

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
index a4db0839bcfd..6de351dff1ba 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
@@ -43,10 +43,18 @@ hdmi1_out_con: endpoint {
 	};
 };
 
+&hdmi1_sound {
+	status = "okay";
+};
+
 &hdptxphy1 {
 	status = "okay";
 };
 
+&i2s6_8ch {
+	status = "okay";
+};
+
 &led_blue_pwm {
 	pwms = <&pwm4 0 25000 PWM_POLARITY_INVERTED>;
 };
-- 
2.48.1


