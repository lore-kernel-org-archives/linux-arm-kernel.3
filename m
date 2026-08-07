Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AB9C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+oLbfnm87lp0uiqGxHSztbOHkrNn69OeQaoJobBjdY=; b=nw7NPnbBG8Oi5yk6nO3+SRCTeH
	+M5Frwm3F+x+cFbsroeRWXSKL2A3W4OasFAB0tntVl1/DP8hFtblQT1icZUgzbXMEa36mSnUAN8H0
	k/Fty32Hj943H9EUMwC1jGkPPPeaM874gFICt8QWiXF5rZAfSPaxm3xY5KXooF+pGeeu5h6927civ
	RPe7TXgoW7XiYWn6XyFA0YgeBR2MMzTa2I2sbcBYxNtdFmuZJo39Lgjq7bcwTvHHtRUVxDjYWV/g4
	cmwdPfurpaX1lWhvTzO1kT3UqL0My0CvfTzPDjQ/Pawk+4YtfZUthaXeeb/91xa1XHDgg6RvU6Awb
	gzv0aUgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFzn-00000007QDG-41dh;
	Fri, 07 Aug 2026 08:32:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFzm-00000007QCk-3ngL
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:32:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=G+oLbfnm87lp0uiqGxHSztbOHkrNn69OeQaoJobBjdY=; b=fvrdnFd1hQTlW4gX/Aqb4SvFmS
	vAiENN5i6iBeWW7dV/4jv2CwB+F5kTV+3IbgHgjgDaDcio/KIr6c4PzRhp77iWdMfz/pFn85BcVjs
	Dl8/qS5j17qNdq1wHm9qKFEPMA4ciRlnvna53TwIkZ2Lc0CXNmk+lekwL8NwiEm3yH4Wz0B3rjfkY
	TMigJUHuJMHenTKYg4fQZ2q4iE+1qDnDQhcKD+LO7jVguN/FjI4nB+F/73Q4TM8ua7Mcu6+yIOc5X
	H+6pGHoY8veRC71w3jbCNEkGiWbkYD0PywCFtKCiWOmKNdmRrByNCh36hSmgEvEREb9lYCGunuDpz
	/8Vz9AuQ==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFzk-0000000CCSJ-1Bbu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:32:01 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-848479c9bd5so2840764b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786091518; x=1786696318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G+oLbfnm87lp0uiqGxHSztbOHkrNn69OeQaoJobBjdY=;
        b=oIVdYcPDfKi4gOXBlmLPu655EbvlMmGJtuBL1yHuDzeBVG25R0I/c7BwtnFXFcKgFV
         RtxSQvIqok/Hy50Npr90jS/XTPe8b3XU+39t7Ww+9uS1IBuOGnRfbmUlLV836RDcg0gl
         HbBGqrExu0Qlkkkjn7apabFX4OiDd8h400GNedtARU0cHj5HEXmMfL+/HYdN1yhxHUcu
         gFsihpRK0mAMaFdhLFbVRYPhQchaVCCPuBq+QDkV7cyNSjuFlveyuwWXZCdkuAm2yMMP
         JbePBvzcL0m9oLZtUVhLYtptLnfgdhBCWVnDDY2wrjXynWcQkQNSlERVEXgxqmvgW0wF
         3loQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091518; x=1786696318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G+oLbfnm87lp0uiqGxHSztbOHkrNn69OeQaoJobBjdY=;
        b=H58O3t9A6wDaD9VPwnroAvMB7gPNc1u5kH8R63sFv0rAxVfarQpI/g/0mBc5r3Eb/w
         l40RHP4a1Lskbl6V3+9HASKzzoKzt9kN1H6oMfkuzJtQbNZrer/MSPvklopx6Hi14Gba
         2DPYUvLjxxiJNIyXIF0JEuHcv0H3/xJR1vG5QElJYSeJLX7YZ7P6n3rFWbW+3K/kMXLm
         O1hGx4YZQTffTcc9ZsxMMIWBcc02+s23g3Kn5xESTwIvMLsK0aE7iHw62y5OgzDEOj95
         B3Z6s0vGHqgE3tJb9mt1GLFfX/IcZGlG+FSlcZCKj2kTIJnxKYGBE4WIGPpL8s5NQbXB
         74rA==
X-Forwarded-Encrypted: i=1; AHgh+RrozIFK10wr+q3mS1Y3ZaGmfDJ9Ha31IxdConSwhNt5grXDMzDkqR8SD5a5meFaXXDxZW4iBFfsJylRF4dPw5X2@lists.infradead.org
X-Gm-Message-State: AOJu0YxdBpuDc9mDPYPgAkiNO83hZcNN+o6XyaIiURjcw5vu8FuiLkf1
	DURBvg2uHMoje3jfKaIVmkhun7VQ8pYIG3rmoQmQmsCdtCUSDKH1d9j9
X-Gm-Gg: AR+sD10pF3esZP412Ns6KTpaM5QmudtbvK+CL2oMl1Fq2Bid3wXCCZENyOKMLu5GPlK
	KQ8mPwWqymmQQF5A6YhDkOICkIAWYIR3wPKoHfXwfILDuzutnubBKPPXpb61fZmDypJ9IIg/6fL
	iqzrD/Kra3wwCxM6b7FTlkQVxOLOrqFZaBhuHGxdTO85PhsU9VOOulCuS84j4UT9rmv50Eop3ZW
	Bvui5ca3B95TomSDP1HnCRxAaWs9ySLk9KQCmWSDCM9SsCuH3TJi8sLObkE5F3xUhwYVKLnGVGv
	C57Zp0GWouyhnGqgYb6Fa8tqNPSdj6DfxclepDntS447WsTStzF7UTt/1cb2Op7SpRkb+71l5Ni
	nttaFY3l8OtcPUJMx7FkSy0TkC5402tHpIIddRbW1ZJxjIn8h1uheUst/mz405w71u0MiGsF5o8
	mNJX4asjfy0bzhEFFZW1UUIQkqWNcyAj7n3npSzLpKq0ftf2nhtga/dnmZm7aIb3jtABEdfe312
	eYJJMKN9t/fK128V85FSNA2S+nSV4T7fupZgvdM5bfV+5Q66A==
X-Received: by 2002:a05:6a00:b806:b0:847:e2c7:59b6 with SMTP id d2e1a72fcca58-84f2e031181mr24296331b3a.11.1786091517957;
        Fri, 07 Aug 2026 01:31:57 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a553071sm627409b3a.43.2026.08.07.01.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:31:57 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] ARM: dts: aspeed: santabarbara: Disable power monitor nodes
Date: Fri,  7 Aug 2026 16:34:05 +0800
Message-ID: <20260807083415.672008-3-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
References: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_093200_438094_621023F6 
X-CRM114-Status: GOOD (  11.40  )
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

Due to a design change, this power monitor IC now has multiple
sources, and different vendors' parts require different drivers.
Disable these nodes so the kernel does not auto-probe a driver, and
let userspace instantiate the correct driver based on the part
actually populated on the board.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 2a822e38f091..04fa9a5e0d04 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -585,24 +585,28 @@ power-monitor@40 {
 				compatible = "ti,ina230";
 				reg = <0x40>;
 				shunt-resistor = <2000>;
+				status = "disabled";
 			};
 
 			power-monitor@41 {
 				compatible = "ti,ina230";
 				reg = <0x41>;
 				shunt-resistor = <2000>;
+				status = "disabled";
 			};
 
 			power-monitor@44 {
 				compatible = "ti,ina230";
 				reg = <0x44>;
 				shunt-resistor = <2000>;
+				status = "disabled";
 			};
 
 			power-monitor@45 {
 				compatible = "ti,ina230";
 				reg = <0x45>;
 				shunt-resistor = <2000>;
+				status = "disabled";
 			};
 		};
 
-- 
2.52.0


