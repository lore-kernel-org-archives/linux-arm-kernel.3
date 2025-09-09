Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41CECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 16:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DybTmKrBLOMD6vf+9QLzWDpmjWc+lV91VxrSnOsEhLY=; b=n3G/YGnacX2y66xpdhhTtDBYLu
	PuZKxvY4z4Xsfmcw6FaasffKChJG9oAAyr9IZW5Zqb0rDHo3Whh0LpVJMWwFNZGUYB2VRtfWkxYKL
	N16WTIuPVx3WXETtzCzAAby1gafMKtg95vrZm60TdlCpllZ3sw+7ag5ci1oLgREwJwOTaeZ0zL7u6
	NXgrKJFz5n+aQGKauErPfTU5RHE7UFo7LmmCZfNiboG3Z02eJs+s5ZemzQKtYYgDYh8A6sXJJ2ij1
	3ouAVaKC61Ng98LEbGNznuh61bTTzFAlsSPgPb0IGrPhxplGbXeIizyFUj1B8V8J4cCnZGeXrsi2W
	hUa2rdmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1ec-00000008goE-3KzF;
	Tue, 09 Sep 2025 16:57:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvKw-00000006Hen-291A
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 10:12:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DybTmKrBLOMD6vf+9QLzWDpmjWc+lV91VxrSnOsEhLY=; b=Ozvt1M0Sy3DkTX+zlqwvtM7ZbX
	TUdNpvDksfWzFIypwPAiTwjzEbro0COF0Gc6YzS/yXMsrNb6P/M26jhdLNbHs96h84KHx3cZOB0wR
	F6aLn9vmRc8WUGQrWcGsGuefhVwzKZAzGXR0fpTdX4v42b92AhxX5NoZl7co3vhbgwv5C3JoVzhAK
	pvRx4Jud7EFfcphsqumR7iRmueqPjKIRCWtKfrThc5Sio5fJ/Y/fVSK4hU7ett3yfdU034oUStbPA
	khKGQ162pzpAsenMmWNHTbAqsOb8zzmZWIUJU18Vl0O51VZ2kzU62SxbdjAKbKP6Ui5/IOSd7clVV
	2I9sieFg==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvKt-00000005HVQ-2SV0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:29 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45dec1ae562so9560125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412746; x=1758017546; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DybTmKrBLOMD6vf+9QLzWDpmjWc+lV91VxrSnOsEhLY=;
        b=kvkMIXKxKJFtQrlARc9klykni+O3mCDX47skxUF+wjZBobYfmyrNyYBVokS11tr7HH
         vz/N+K+pO1BCqnZlRcSiUIYXwjdmda5bQCHzsUo+AOUxSCmMz7VH73kuU1aAyz4rFJZA
         ehix+jA3S1BDZ+icROUg/IWbQB2DWSpHiNqY7ICTFtfBP1Uq0oBHIdwAJqW9f2smLQ2f
         fVrGjdhIsY3xmYdUlTrcFecFLlOsxEUOBf9DGUOXcyZGtNcQhbPBSrattpIOC+u7hrm1
         +LL8u+PTU/icuqCPxT/2QEAybl/MAw7QwA//2NoTUhtjlNTlirsG31g32ZrtiEFXGJZx
         bQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412746; x=1758017546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DybTmKrBLOMD6vf+9QLzWDpmjWc+lV91VxrSnOsEhLY=;
        b=LP1dYgXyWSnmCsOpi2va7UttIPhVS4VmFzUFrKr3oM4Htd+b7l/dPwhd5j0ZTqLBB9
         L5fsAarXlIi6OcO6152wwNt2j0KetMcfsf8Sot2bTOWCAQGOpDC9j3IkhRbLQIJqifUb
         SJsCOXGi8x4ewkNbdtkXyur96Rk/YNHd555mXGV2jJsXJSRGy0WaTaDe2QFm4cBAjM/5
         D49eGQEmmWs8dZRB7ZzCQjcpOLlmGdNBtttDAl3G9pqR/OLe74bpC4zGMqXQK1r4UbTL
         5jOp3PBNLTAQt/64f5rwJZUVR0GAMbtHLrnp//S2pJ1M6Ytj0bGomWzh8mC/2u9+pNmz
         D+bg==
X-Forwarded-Encrypted: i=1; AJvYcCVNSZRFQrGCcmtaflCzBNM5Jzchv4E97N/7KJH7wwCZTvEaYnDuxTGBUawvoqM6QZyTkwGzGNlHa6YcWLPsIwoz@lists.infradead.org
X-Gm-Message-State: AOJu0YzXCNimqatq02hqid/sz7kU+xQIX2Zs8wA58RU4f5qJ6waaXGY/
	WofTnrEyuN/2ShV99EbAzSrnOFeGwcT33eCVaWMjOZGsgJy5PX7V8K3/
X-Gm-Gg: ASbGncuyMmE/+5iyBZJVxMxVI/YuimDnk/uEvUwlHHRCgXoun+0XNLG951q57XCz5tG
	ns8l79vXvUcHYZfHP5ye9VfYNGcs1qI7HZTCz02Ac6PLP/6sjOmCzIm04qK+VR811DNRAQ15lQ9
	q93J1b5LiFrx76swUCYq2869noomajUB7pUmYq7ILTPbzNXsly3rKRV9bx3RtRzanjtUe6MdMoY
	0wnyfKKc7WlVBjdCEWLVHRMz799jHlUtVn2AqYO1uWDxLNUZ9c4cOPKIKc88hQnoRC5LD0PR0Sx
	Y+Wu5Jz+O/A+IyyM9K6tkaGblku3KSyxKAR3mAhXOLUGIDYsRJYRzJ16PFqNakB4w97rcApKZ5i
	Ghm4JMqd2m8Oc4w9D1QmlorFH4reBYm60NVrbara3DOeMjKDA8+hoxPc/LO8Zb3SbyyVbnajbjX
	YGbDDnPT7n3vyGLPY=
X-Google-Smtp-Source: AGHT+IF3GDagRAyMPN5BSQODUHSp0iGmT0I36aBlmWYUaQ/w665uvtY5Iu4mjHI3U5ucVSesodrKQA==
X-Received: by 2002:a05:600c:4683:b0:45b:8f5e:529a with SMTP id 5b1f17b1804b1-45ddde9764dmr80596335e9.14.1757412745694;
        Tue, 09 Sep 2025 03:12:25 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9a6ecfafsm334757015e9.21.2025.09.09.03.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:25 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:11 +0200
Subject: [PATCH v6 04/20] arm64: dts: st: set rcc as an access-controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-4-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_111227_872388_22E5B700 
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
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 303abf915b8e..fbedf23def52 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1677,6 +1677,7 @@ rcc: clock-controller@44200000 {
 			reg = <0x44200000 0x10000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#access-controller-cells = <1>;
 			clocks = <&scmi_clk CK_SCMI_HSE>,
 				<&scmi_clk CK_SCMI_HSI>,
 				<&scmi_clk CK_SCMI_MSI>,

-- 
2.43.0


