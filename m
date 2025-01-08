Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF1AE77197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 01:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffCbyZidm4yUSXcZ/TPGQgF5jycQyA1Mr5Btdy4Z8FA=; b=1LXzXpkQBMmXZ8mBGlq54X62PM
	oMsDEMoKPqlhpiTa3TVEvO7lt4fdgbZolkMxc8Tx3lhl64lIAMceMdS3ezdi1iDl5/pazYWGbc0ip
	xXEFsCEBg1GSbdvl3j9QiXOgDz7qmnLgUVjToOkRhZZEwc+tIg3d143trQeas9c+jpB60L26bTDPo
	VbzbtmoT5IVBoelQNCT//JeBBMzt0/AqdtjcjTrBPf66Z4ore6ED7DPGDTUC6VgV4FKG8fgjQ5VjM
	9/gD7ctDfYDNX/wMiynVhMjiJ9TBvkMZKqnGuaBijJ49ZfiAj3lCcNVXTcVxFGhvaT1pXYaBra/g8
	31smMQjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVL0i-00000006m6J-2yXE;
	Wed, 08 Jan 2025 01:37:28 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKsU-00000006k2Q-42eF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 01:29:00 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21634338cfdso25532445ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 17:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736299738; x=1736904538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffCbyZidm4yUSXcZ/TPGQgF5jycQyA1Mr5Btdy4Z8FA=;
        b=DJvLSgAwAJ4RmIwJ2qIQJF6v2bnGIfwOkPXHvqBmg/WGAu1jA9PSm6PjFZPvUBHp2b
         HOxWCgCcLoTfG2r4FDJi1LY0KDLNUgy7g2DLdkPhdcGuATfIeMNGKSmnlk2/iMyod/DN
         fRxmB163RSPk1GBtt8Om0svbfwdLPgMOOnGPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736299738; x=1736904538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffCbyZidm4yUSXcZ/TPGQgF5jycQyA1Mr5Btdy4Z8FA=;
        b=vhxUz6e5P4TM8bYtHiKQpMT51hkHsRa37xRwUXjbuv9wY2BhaVQS7rP+VFo11gG63E
         kHY99IxLvQGS1CQ+iuk+LHiSSWt+G4GtCaROVbRG6s07CqaPkdEw41VcfmmHRtz04HRq
         JytKu9k7dufssR3dyPw1W/JZ4gBJ+wE8AgJDxYoICYBJl0mcW/CDk7mpCpWxxGCBPs3o
         LCw9jw4nvJXzXeCiV4joRVzxd1PkEU4hcu0PBQ431qtb5nV3+ptg7uYQK1f1Rq+S9slG
         W1b/hJOG2e7Hmz4Alg0Nf+pGmtZJujdfzHdL9C9nR1CYmXQMb+FEM/pS1UyC6NFfCGk7
         83Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXlkyjk1DeVPh4fKiGLwt8nSD7TJTwGd5TLkOCtr/ATryLnvQJw17Ew2XbuCUweLoNXphlOmUSixNs2+0bJQUvb@lists.infradead.org
X-Gm-Message-State: AOJu0YxcArgzOQbtjGcXkrTX7ywFSl/IZnunyPU35KP/O6NaMvKxVmjb
	KyQxd0LLk/CRJsCLc5xookqpUcuObxQbW7EV8W77nKWw4KyZ6qil6TcJSjG5oA==
X-Gm-Gg: ASbGncvLviogdgv4J/CbNbl4VFs/vybYhT1TjSBjJ/GqKeX87fo/CifM4XYjXTa/5Gi
	wGW99+zQKPVQ2ukwtUtzj/+D6t7vnziKLCZey9t6XRvKZy3RGfffQ3oMP+H5zhZx9P9MshBf8a6
	/paNgoDSPLKBcMRe0Ygl5Qn7jTI17/iljzSzVLGwrKI5kBXepsBdVOZnyPem+B5OzqjUju2adIv
	y7yW3pFeN1hcB8BLcWVRbpRY8l+X9c/x+52ZfgbQZiwL7jlhBMN5Toy7/XvLv1ai6KW+IRVsdsU
	Jhd6+FZH9T32lnjZooBN
X-Google-Smtp-Source: AGHT+IHCeMvnncVDMOJc7OiMB5lgPXTsD1S7AH7eB+5fQgbjHbeY0walQs9/plkYtVkogihuKxqjag==
X-Received: by 2002:a17:902:b18d:b0:216:1543:195e with SMTP id d9443c01a7336-21a83f3f501mr14970345ad.5.1736299738102;
        Tue, 07 Jan 2025 17:28:58 -0800 (PST)
Received: from localhost (129.135.125.34.bc.googleusercontent.com. [34.125.135.129])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc9d4474sm318577745ad.142.2025.01.07.17.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 17:28:57 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [RFC PATCH 6/6] arm64: dts: qcom: sc7180: Add SoC specific compatible to soc node
Date: Tue,  7 Jan 2025 17:28:43 -0800
Message-ID: <20250108012846.3275443-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250108012846.3275443-1-swboyd@chromium.org>
References: <20250108012846.3275443-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_172859_003331_B47BA1AE 
X-CRM114-Status: GOOD (  13.33  )
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

Allow an SoC driver to probe for these devices. Add the SoC specific
compatible to the soc node. Leave the original simple-bus compatible in
place so that everything keeps working.

Cc: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 76fe314d2ad5..257890a193e6 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -782,7 +782,7 @@ soc: soc@0 {
 		#size-cells = <2>;
 		ranges = <0 0 0 0 0x10 0>;
 		dma-ranges = <0 0 0 0 0x10 0>;
-		compatible = "simple-bus";
+		compatible = "qcom,soc-sc7180", "simple-bus";
 
 		gcc: clock-controller@100000 {
 			compatible = "qcom,gcc-sc7180";
-- 
https://chromeos.dev


