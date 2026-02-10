Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A497EB2707
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 19:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xk71nUW+8tIk68OOiZ1p6pMbhgPda0w/fD/dlKzEMWk=; b=WoIkLvm3iLPD/6CqERETK+sjEw
	17fCH3CDMloyKpmeklDKE0nb8aWLNhLCPgjPoa2QImMEYBoE+tmYlUod2Ovnh2S8OkYwVFInymDHc
	ef25W1hvOd5AwYWpAJK/zsSjDTqNiTmX9xnSAFrwojAL1Nbv+jggFacQr6ZoSq8tulN+d1GhfMOS2
	ZmgRypKBICFY7QWUbET+UhfAh06q3rurX19XTfEm2jPwJ1UNmq7FtQDF8siU9xiDUknmWI1ZlpSqc
	5b88X19A9lv+1pEIfyNF2uf+A32pRBK6MTsqVd8I3sv/ABH6mcVlGbeb7bNAaMaIjTz1gsa9Chi3X
	TUm/pe4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vptUQ-0000000HRDO-1jfo;
	Tue, 10 Feb 2026 19:33:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vptUN-0000000HRBb-1YCx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 19:33:36 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-482f2599980so13361195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 11:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770752013; x=1771356813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xk71nUW+8tIk68OOiZ1p6pMbhgPda0w/fD/dlKzEMWk=;
        b=nfVYxtOw0Rweq/J+/Gu+XALA+yskZf2yz+QNE3f5VPG8Y5Lpxi9kwuHrtNP7pgld0+
         gm09/yTDXnvFcs9xVuy+Fhf9ryektvs5toVWyoVJmA/bGE2sIyGw8rQ54kvXtUXoPEFN
         Xu8+vL1ny3o1PTukbScPSJVOvI06X//blQZHfbmT0KOr9MEp0codfHlEjEa+BU6Wnlea
         073bqiBNiGoxvr9OI/mD0PYkPH3hWysGXenwmMiqfeon95QNDll18Lq4jOMFfeBhyMxy
         o7u6eWhD1pOrIUJ8clbFcEA+cf4hbGukZL4/xWLg5Ww7F1uZiXS37BPkLPorDkmXeBlP
         o+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770752013; x=1771356813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xk71nUW+8tIk68OOiZ1p6pMbhgPda0w/fD/dlKzEMWk=;
        b=us99XTDnaZfFjVp1wGJKgO2nNgWONqXeL1IlGLW/I09mh6lhAIK1kqk4tqpKJrR6z1
         6/UJk2JDvQ1fgpBk+Rt2BE/OcOTx7bKvhjtFmWbuUqKYsRtCSLu9RxeQESzF1tygyOcL
         gJS1DVGvvFjMRSN8SKuSvQupwyxrlP9162EqyJB3mgfKha6L5aTu5HhWI49ihDiBJFvD
         VdYHe00BUfB5KChvoDexez9xatYPQ2RqUEurJ8ZL56d7bE6OJeiB7Kg1v2OZ+PHP4rP0
         uFxVRxxz4TQTZNMMX+GhWKs7X50/oMls1/qQQhb0IKnsJ60qBSrvm4zL7hdBD7MeaMXQ
         Q23A==
X-Forwarded-Encrypted: i=1; AJvYcCW0kd5W5c+GTDni2ziF3gHNBL4bQSO+kqCiK6+WflMBj3Dx5SeUA7I6eVy39OyvOnunuqX3ZaA2XclygP5wJHWS@lists.infradead.org
X-Gm-Message-State: AOJu0YzrlVg2g3Vr7h1WFUyAbFa4U2I+9TQkvmkKpR6Nj2EU20d1vZOZ
	d4HAYOYpSyltg6VC/eTAO44uQFaxWoqOrrakni97XzkpR3ar9mrHv/k2
X-Gm-Gg: AZuq6aI2n33FIYll4Mz8W48IWTmS5fhAl3MzLsp+ieZlAr0Ie6le1J54Axh0wf8Jq6o
	Szf+OAg5kVPptNo0ZUxdgpCUDPD2eztRN7OLsMLV0p9m8FDzTBLr2JP7U8Kw71enUIbsa3UNEva
	KvfrRycBZKDCBL7x4fnkTllBD/7uTqEjgqRjTbqvDk+K9YcYK2Xm+cH+6ywn/Cv2ddfGuuL3DQk
	j5Cvt9jeIxUK4mJ0fHYmKx+h8Ivx91fFub+b4rnmciy8rrYw/CKIe1pa+T0BrkW6zfaHMawQ1db
	b5gFO/cBGXalK7ho6mBqEvVbou2X1MZHOZ8sHQiB5c/ElaZUgaHlUG/nU/WliS6bCA8GMpb58oC
	G1BtfWbfHGJb+Boa65ysol933/ujd8M5ybXOspq0aoftBr8cHTKC097RAg4UlOY/4uitBO1lHYk
	QCOs5PxcHxvYuMquRwwOjmKn1fM95gAo5AYpJQIUT2C+58/Eqp
X-Received: by 2002:a05:600c:3b23:b0:480:1e92:dc65 with SMTP id 5b1f17b1804b1-4832022b9fcmr255795265e9.31.1770752013268;
        Tue, 10 Feb 2026 11:33:33 -0800 (PST)
Received: from localhost (39.31.66.37.rev.sfr.net. [37.66.31.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376d3a32basm19835831f8f.14.2026.02.10.11.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 11:33:32 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 10 Feb 2026 20:32:54 +0100
Subject: [PATCH v9 3/3] arm64: dts: st: set RCC as an access-controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260210-b4-rcc-upstream-v9-3-17ca1db7613f@gmail.com>
References: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
In-Reply-To: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_113335_422912_A7B75938 
X-CRM114-Status: GOOD (  10.04  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

RCC now implements firewall access ops to check the access to
resources. Allow client nodes to query the RCC with one firewall ID.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 88e214d395ab..e283c760d94f 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -776,6 +776,7 @@ rcc: clock-controller@44200000 {
 			reg = <0x44200000 0x10000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#access-controller-cells = <1>;
 			clocks = <&scmi_clk CK_SCMI_HSE>,
 				<&scmi_clk CK_SCMI_HSI>,
 				<&scmi_clk CK_SCMI_MSI>,
diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index a8e6e0f77b83..89e0b8f2fbf9 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1761,6 +1761,7 @@ rcc: clock-controller@44200000 {
 			reg = <0x44200000 0x10000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#access-controller-cells = <1>;
 			clocks = <&scmi_clk CK_SCMI_HSE>,
 				<&scmi_clk CK_SCMI_HSI>,
 				<&scmi_clk CK_SCMI_MSI>,

-- 
2.53.0


