Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D15C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 15:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=; b=X82I9kfTt0eNQZINamilVcsEoQ
	/X7sE/+4ubVArvIFpGGadkAahbxcqFqRVJTfirpmdL+EDW+ESEJX/Y8XcGGj69pU8l1nFF6C8K3eS
	QRRvvqWVvNUaAoCl5RNgv3UABItEXg+l363+sa/KRiQJ4OZgjxV/GTCNrsUzt2e/1wQSoKlbT58zh
	utzQYFJnpzA9DZFX3rsGsDK1nSEzfMqh2zr+i00RAufQexi6LFpwlYhDQDrEp6m+WoZJAK0qtWv/1
	DqLDjJvJMqGEsyoTNRujCp+QbaL7LJp5xR90FDHNSIvcKXPOBlEfp6eO2rSjFEJkXDC54PP+MXKRz
	DgN1G7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlvX-000000064sN-3jfQ;
	Sat, 10 May 2025 15:15:47 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlrR-00000006440-0FBM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 15:11:34 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-309d2e8c20cso4000173a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 08:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889892; x=1747494692; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=;
        b=Aw7EdsTXLvr1SG0nSn90oGkIqNk2GIGf8cMEHFWxDSBUdYg1dWTMSt61xfbOSUTea7
         k9gvPRWshCuvo5ZLGBvQN61G7/8KbOS3OIdaHuclGIcYkFRXa5QPfxeWta4hOA1ON8N0
         5A8JRCk0ESGXS2ZTvdmVG5925DBzu7fslyJwRxY/9qpW/IIkKW+Gr/ZDL/0e0TLOCK2f
         6A/TpwR3v66IyNgpKVKnaXNAJr9mJL+Pb4r/1QwhmyCGApLpvW/HC4C+UTUqI53hmayE
         TxsbBSyoYVTYMQcZbP0JPG5Pt9biIWmwgbLVklxly6/NOgNMTCqap+Diz1nRI2lxayWr
         hKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889892; x=1747494692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=;
        b=oterQbBNLhfdCHboYWjD4XJsxqNAThr2Q5bTO7ExbS9LSR8n/2uWMbcl77PtlO2OFm
         N7b+aF/bjVgPa3mjLpvJLwA2h2oizHHNAvFpk/nbMXA3bvs5nXT5PmRp62LmxiLnOuqU
         SdPLjxEJQUz8pQRusY6oPKEs3Pn7Jfg6AZyiD5mj8u3AW8gBHzKaSI+L7W3DIaLO3l80
         qGX1mMuZlp57Ye7Q4E6RqQMtIZZ0J7+ewjpouNk31Pr2Taj28CUP5qiWewfL7qHniYhB
         qkmQoczyPtj4C2uzHHK9166Y6z9nG8ySD3GHx8Ifv+G7QpvIXW40QKcPv1nASaXJpHKE
         OIHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr/R0rULb3rxCLSU4uIDueFK2dv6SNhJX6wxvVvtG14qZTmWbf9a+k8BikZbVpnmaF83Ii0t8Xmtw/INRGz+OG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4iEhS4TOUev5HQnV8EdwQITwwHOQ0sXrmOWjjesyeHfuj+wIq
	hjJ3Sdw+CiRiU190tD/v5Na4ChI+a7XX8XvnCWqnKypYqDEdSXrJ
X-Gm-Gg: ASbGncsgdK5p5zDWjj7Jfj8O05Q7dvCMKWwGkQQtk0r+LUIC5dbPIbUaNenWjb3nS/x
	QUfkcr5FNiJK91f/z/Opbbk/bbbmfcNwaOkJQ/KCF7IYiVZNeyQOVWc5UdUOXrnvhTSSpqAiQCF
	o16eGnjJbcf6LtgMJmIMQejDTkrYFUOoG7dzkcRHGcIqmF34H+9OcPsC8H38A1oLyvbevGOfIrZ
	bIAzfYYXjECSz1kHgRvWBlEZIlmQ76gZ5A8DFPUv2pclLW+SCF6+uSVkcJ6nMEVoiN9TwlgEUlr
	xV8W8fBZ9BdQDQZIzC9acduv3KUcXi751QfIzJP5T1RAaJYpugQ5cw==
X-Google-Smtp-Source: AGHT+IHrMovLoBYB06/EjKWeBypsMBRxgshoSisDFkycvgWn5VOYB/k1ZbKV4M3dF8qrnRM0Y/GUUA==
X-Received: by 2002:a17:90b:4a4e:b0:2ee:e945:5355 with SMTP id 98e67ed59e1d1-30c3d2e355emr11285339a91.19.1746889892151;
        Sat, 10 May 2025 08:11:32 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:11:31 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:42 +0800
Subject: [PATCH v7 01/21] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU
 PMU compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-1-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=nvc6B3SNJrX+OFSnYkWwiXKVem6neRj112hzdXP5HLQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2yaA4PzDuDwaa2SwrJCn+pSUhc3vXjTbIK3Y
 ZBYp0Kpu5SJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9smgAKCRABygi3psUI
 JJ83EACDDpTag1arv9So+EYN0Rqul10K5q2wzppnkN9JShqvDgPNebEuzwTqkYBwJwUKqiiCFv/
 v6ZsMDt0JXkMPIz3TDaWWApJE0rlXL9sHugoO3WiBMUHPn7U20KF/lwMM7oRYWjfqq88d4SSv/b
 4Z5bhlvE0TpiMvgLPVzbTmkezwgGT2/EB6306pmzdfkpSVXLVyInZgiINknE0nxXnPsEQwxk6TN
 eA2xq2C6W/YFCt6PofdGY28mcf+pUUbFinY49rLOSXQTc2eAPje8PG3tRZ72Sbs9IwM4eQK4yyq
 /aQwSogTYmOPOUiVgsemR1FH1y9951qZibKgs7m54V67S/eXMHJLuaTtTrcd35XFP7MWyrdl34A
 oUXwrHfmreo95V916qgUtBWRe/915JXyytXaQ9cuKXNaY+7F2UQVToTPz5LL1p21FGOeLYIKk/a
 0gcL0+9xkFUGiEn00PtdhXbOzO2ycYS1p2r0cqupvSek89hFdeK4q8IdYITMxiEG8RhMuChews1
 aATU2TY+2GUASVgp0h04fK+WYB6tn89hdEh9B8MMVY0Ah/cg4/GwMbhvPGkOVruMZlQP95OzkUh
 SAFw78LVBhKHYN+udFOYM31qWvFYN8OJj258XdUugMlHNufB2zKN4vXrzjmwksWcDyJ9T12FWG2
 k07olloAlwHGTjQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081133_103002_A87D46D4 
X-CRM114-Status: UNSURE (   9.37  )
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

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index 295963a3cae799a54560557137dd6b3cf4bd00f9..3726e1b78c42f150cf1dc68a6b3aa3541517c311 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -22,8 +22,14 @@ properties:
           - apm,potenza-pmu
           - apple,avalanche-pmu
           - apple,blizzard-pmu
+          - apple,cyclone-pmu
           - apple,firestorm-pmu
+          - apple,fusion-pmu
           - apple,icestorm-pmu
+          - apple,monsoon-pmu
+          - apple,mistral-pmu
+          - apple,twister-pmu
+          - apple,typhoon-pmu
           - arm,armv8-pmuv3 # Only for s/w models
           - arm,arm1136-pmu
           - arm,arm1176-pmu

-- 
2.49.0


