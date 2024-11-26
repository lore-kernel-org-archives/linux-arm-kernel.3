Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185C8D3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Mk54wWOTxtnUjWD4fc+DJyfim3lSux+/TbFhyd5wc4=; b=HKLRwh8si94hJLqWRFcixoRjt0
	cbaFS4zpO+s+PmFzbsEuvWFViBWUza8X0yL1KTvbUXJOcuL27Re9v0R5vw6tAw0IV7hRK6A6eRhwt
	C1fafnab8zY/w1VG1GqBagLrpawdPNUtd6sf+p5hBWSuXUPAl/BZvbBq6827V31FhMF3ljNf7m9L3
	P+GOaKduzSNfvyFeFVNQDR2LqewYOc253w/vVmTnpwjVeKnPtDF8/o7i2SVouRMcwC2RMlthSx90L
	zr2cKvu7P4tkDLodPkKLUZS/oH53tQQJ0EPmUvC8t9RnVmCXf3b/zsKekuPS6aW8Sdhh0JBnHNujX
	kAQD9sRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsLI-0000000AEfk-49Y7;
	Tue, 26 Nov 2024 09:58:48 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsKH-0000000AES7-18sU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 09:57:46 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21207f0d949so51547155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 01:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732615064; x=1733219864; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Mk54wWOTxtnUjWD4fc+DJyfim3lSux+/TbFhyd5wc4=;
        b=VMtaxMF7mNlmyyNZuwUj4yDBS/dLP/j9YO6tnbBoTx6I4INjjaSxLN8M8pWoolWzrR
         W6oukLXINElx08sBa1xWVhxZ5QNAxPv4VWZUvWjqLtHsS4EeI+4QHt4Ca5pJ8uMvMCYU
         9OLEhcN2W9D35uCiB/lA9a+6fk5IoqNcwUIUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732615064; x=1733219864;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Mk54wWOTxtnUjWD4fc+DJyfim3lSux+/TbFhyd5wc4=;
        b=MUvv2BJZ0PTPYSPQDAwDmv5F1iqC/r7fo1SoFudyA/ZrdNtRFtUBxtFLYH6ZERMw5/
         abI+dVib8cQYLIB12BbQOaPsVJzEXfPy4IHNE7J28PJkofNttAuClcApKoQYDqchAQI3
         qjbdrYYV5q5VwgUFVHl5GIRstD75iq5GeL/vOKN7L8Ft33Cvm4E4NsClDkJ/A5/rFJBD
         YjyrYExp/0LfoDZ0tNtDaLJo25ciev7MyA+CVRM15vdf0TtLge21BR6dGtCLS4ysIIAw
         fIDizeRMxolW5XdCUW5iysFshb6T/OuuVjbiJ3O6wCIN+9Lk3fJo4lLuAmuTjDjzeSFG
         +StA==
X-Forwarded-Encrypted: i=1; AJvYcCXhpThYcMlViPTuYbSfBc3gJRqa9i+rtDnMQshNWS3obFMCZU2LTmAjEoMzEiKZJVHCGReF6k9FYAY2PxtpjqHM@lists.infradead.org
X-Gm-Message-State: AOJu0YxESE3rNyyp/x/XllgOD1kfYmFjaMxLWENbb2jVENbE3AcPnAUk
	kYhmYOLxI9UidD1mtYBKDAEYSK0GRBdI+xJvMFaDBq37DTpwlEW4fD4aOQbab+upKtb1+TZJxEV
	WFA==
X-Gm-Gg: ASbGncvl9ULJ0xv4flRvwBTGHn/M5pNkyM/doYNYtzAln/nZPdn/V1o5dsGUub1K7Ee
	88seLzcdZIfU1o+yGUyimAfg40rOCTf0hgoU2VNcLV2txl24GZkSltziEdk8E/aXzx6ihzojTP2
	8DsL8+atyY8H10n33qUFwg8b5aMKkKm1OSkTN47DltO+JUkaVzNGMmi3UsefpzLwY+nJdpLijBz
	VxSqxTJcAOETK4UeQ+HfWdn+kr2siMHKHiPlqnmn6+8ARrXz2661wFYZPXU9w+s0wgKDmVLIIif
	wGZt5Sjgog==
X-Google-Smtp-Source: AGHT+IFSDVH3rH4UFp5xBcT+SP0jqNRzEoGUEI6ov6sZL9QTnujK3nAAwyk2B7XeTcH6vPgj3iPXZg==
X-Received: by 2002:a17:903:228d:b0:211:f335:aba with SMTP id d9443c01a7336-2129f5790edmr273271445ad.31.1732615064355;
        Tue, 26 Nov 2024 01:57:44 -0800 (PST)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:a3c8:df68:1f94:539c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db890b7sm80908485ad.9.2024.11.26.01.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 01:57:43 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 26 Nov 2024 17:57:40 +0800
Subject: [PATCH RESEND v4] arm64: dts: mt8183: set DMIC one-wire mode on
 Damu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-damu-v4-1-e746eec2cb52@chromium.org>
X-B4-Tracking: v=1; b=H4sIAJObRWcC/72PMW/DIBSE/0rEXCoeYAyZMjRrh3asMoB5xAw2E
 U5oosj/vcRD1ahZunS8p7vv3V3JhDniRNarK8lY4hTTWIV8WpGut+MeafRVE864BMYM9XY4USs
 CD0K2WjJDqvWQMcTzgvkgb9v37esL2dV7yGmgxz6j/YYwA4ymEelnzEgLp0C5c5L5xoou6E3X1
 0w8Dc8p72/oPk7HlC9LwSKWB/ddiqgI4EZ2GkFpbu4RtxpFPsrJmmu1cS04rxqufr3+Fz+A+OF
 XBsApo4B5/2BH8/cdu3mevwCVSffi5gEAAA==
X-Change-ID: 20241009-damu-a3f2f3478409
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-2a633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_015745_345373_2C7D86F0 
X-CRM114-Status: GOOD (  11.68  )
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

From: Hsin-Yi Wang <hsinyi@chromium.org>

Sets DMIC one-wire mode on Damu.

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v4:
- Add Reviewed-by tag back, which is dropped in v3
- Link to v3: https://lore.kernel.org/r/20241009-damu-v3-1-1294c8e16829@chromium.org

Changes in v3:
- Add missing Sign-off-by tag
- Link to v2: https://lore.kernel.org/r/20240910-one-wire-v2-1-2bb40d5a3cf8@chromium.org

Changes in v2:
- Add fixes tag 
- Link to v1: https://lore.kernel.org/r/20240910-one-wire-v1-1-d25486a6ba6d@chromium.org
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
index 65860b33c01fe832f3a4b2e21d24ea6b4f0cba2b..3935d83a047e0827b6feddceb3e4dcb4fc3407cc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -26,6 +26,10 @@ &touchscreen {
 	hid-descr-addr = <0x0001>;
 };
 
+&mt6358codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+};
+
 &qca_wifi {
 	qcom,ath10k-calibration-variant = "GO_DAMU";
 };

---
base-commit: 7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
change-id: 20241009-damu-a3f2f3478409

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


