Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626BBFE51F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 09:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=; b=sgGDeUfOPLQGRuNbYEGb4AeWeZ
	EB7eOCmYPsSejQtO1tzr8ghHB+LUwjPJIibfgGp5naplKuK0ydDFEknvCkTUdvHDwiQnRLX2Cio3h
	WV08h1gyiFFFIjjuuVoLVTHB3aI+gVyRA4zOfggJWPWOnK30kBapnYsqqoxPa+qzzKrctphfQQv8R
	rktirD+H5TPnAg0/NqWbcGdSbp6AsoeA7fsxueL71ZOzN08rmkCGusRSu1kx9/UL+KtO8NfuChD41
	Ub4zRa88r83JPQsIQC3N2f3W9LgJA/VyYvYrt0yRoat8xpcu0/QumFlMIW9Posd6UyMy+edoAbXsd
	1dCQO1DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCro-0000000CvzP-0vwz;
	Fri, 24 Apr 2026 09:30:32 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCrh-0000000Cvxx-1Qoq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 09:30:30 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-82faf871346so4516732b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 02:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777023024; x=1777627824; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=orHyXmMLEwCztoh3Jgx990IoV3pECrWVwqjUG0bgf9wUPS18cY4aOM+PfPN5250hnp
         CId7fzkyLExWwkm6TdjF1bQon3ibyEUM3YxwyG5I7WRaoH3rsxexhA8Q3h9ijP66xCe9
         2N6ZWuBgHEeJ8HJXb8+GjxelAAzlNp7vEN6oRsKOABuUR1B3gBqlZhKT4MuIDKdjugdt
         fLzua0gTQFQ7mmdBsyi2szw0vB1sClXaq/TtqbU/G19hwUbc03+QEVT3p6aC6Ad6+pwI
         TyU0HPT7TcLxTHBmvnTM6U3BPsT98VTGWxBWNlRMr8aTKroJ7THaApIP1zIWXhlmKuZw
         Xstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777023024; x=1777627824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=Vkiqp1YDqL4Rnu09Vu/jIdAhjj01VXXRNUXXTh+N42vV4KqNAlaVdzdFcqe9oPAUwd
         2nIoJqAR87tygo/GcJETxLe8vbQZFyHP+MynW4PjsFUltrCwMm3p7gxEf8jFEkj8Bxzv
         guV0y4GIIKeAxiwSenyWzgWt5qcolOV687AsbdnpFdrgwq/2QIN/YXrDQzAyufE3rfiW
         3fqbPLdnBIY0bH7DDScxL8Ga99cyNSi29NLIgKNuLyohLJHNK8SaJ180QLNXRfFfpPjD
         OZpXg5DQu6zkKcJYZ7/BBNkh99osHBVp9voeWiD3cRNHVDDZi6uws86b3mArq/j1e3j9
         BsCg==
X-Forwarded-Encrypted: i=1; AFNElJ/wXKOxRCLrRZTiNH1LdvVeSryCz/Ro6SNTZEl20ryRN2W1WkK0Jh8rHkBMHCPSUBbjERdKLBijZ8aD8UHDKD5q@lists.infradead.org
X-Gm-Message-State: AOJu0YxVyZVUpP7xaw6pKisA/zW5eqcTLZZTLQs2jqC20aN9npEpo5Q2
	YgfiKV1sNOcuWY+GLN8z7QUYcZ/ESmNLrV2FRD/Wap1dX36mH2Pf5VjC
X-Gm-Gg: AeBDiesGC9xHHfgiTdHOPmjYL5hifksvSNt91JKtiJTtAMKShzcbRxWQ/EPLemVowXY
	V9VugfiwuKiEkv4igtpBzikBFviW+ub/1IOKfmaMGHS6ugXTKYA9brs1nnf9/b4wQeAn9cExFCt
	KJ5ctWOtj+n3DzeD0RUAAr1kXZPnvwrd+NrQfap2APaTh1fgM0rU00EGEy+bj412cvmFQqmQo1R
	TgkDI3ZfcbO2+KB8SSyhFHrVFJ1PqnWrtqwKEkMCuJgnQp97wzrxgQ2vK1uhSJel+l63p6FS5kO
	W4e9VV8RImTUSH3HUOJuezQVb5z9ODGPw41MYMEfIcHIaFUR6u4MWxmbB5zCSKAK0MTf5RRX2Hn
	xff5FWAtlFEA4Sk28TMEGKqE7fQho+dtj5KmTQ+debtdDsvX0YU9btIrG9RYobhB3Hx5+bhKw6c
	yb04UZPNRgoCU8khVgdKw2J9zdObBgMG8EScvPjMXlgO8eoPG0y46y046Wg2ts1RyiUiFt8/oyP
	Q==
X-Received: by 2002:a05:6a00:bd0a:b0:82c:9897:70e6 with SMTP id d2e1a72fcca58-82f8c8e8aaemr33764558b3a.34.1777023024496;
        Fri, 24 Apr 2026 02:30:24 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe92desm22658143b3a.44.2026.04.24.02.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:30:23 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 24 Apr 2026 17:30:49 +0800
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-ventura2_initial_dts-v4-1-806b00ea4314@gmail.com>
References: <20260424-ventura2_initial_dts-v4-0-806b00ea4314@gmail.com>
In-Reply-To: <20260424-ventura2_initial_dts-v4-0-806b00ea4314@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=909;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=J3z5h5jN99f1BFk7jnvt5xoq1tLRgjc3X0kRzaksvsA=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBp6zhNERSg2LprjO3NpjL3691xSDiTsEpNmAsRa
 TWu4uACS/mJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaes4TQAKCRClg0K3CVbE
 gWQVCADEDV9vxWqxPFTp5UP8ETlwdmjYzpbjb25VL0GNAo2M6d2NcYQC+lIzeq2H2LQKFZ+vIEs
 8x0Js9eAEZtEJJJMfvMTw3ldf2V+onaTXiPfRa9iWvLzlxBPrkx+iVWxAMTgCWbBO5anuB+dzVX
 MARyd9Z9XKfpPM2rrPS4Pdwx9Kc+H7JjP3cwz2G5HOF/YgbYeHbs3cK5eW4NXOhqkOANzngkFba
 jDbQPESXJdHGs8wr5kmiKBQnzHB0IFH/5Nn0ro5a2uQXhUVRzEzbT2uCPlKoR2ODZOWt9KNgNre
 chIhC2L3as5AhSRsoM0b8Hl4j6vutFSgjouOmrD9MV0/5cmq
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_023025_410626_5F4795B5 
X-CRM114-Status: UNSURE (   8.63  )
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

Document the new compatibles used on Facebook ventura2.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..d48607c86e8e 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -92,6 +92,7 @@ properties:
               - facebook,harma-bmc
               - facebook,minerva-cmc
               - facebook,santabarbara-bmc
+              - facebook,ventura2-rmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
               - ibm,balcones-bmc

-- 
2.34.1


