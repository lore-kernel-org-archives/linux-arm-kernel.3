Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4C8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 09:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfyfU+/y0VxhZvR8biEYcxwDSiNQWNWT41U3UuYJlHo=; b=FCqHBRrCU0iNmHh6dXGrYAJuqc
	mnWvU6N7XyF06SBNBIwyBwHjZXCN1Smd+dAY1lMH6SFoMArPUZsdR5HL6GKLSBS+Tq6o356dRe7G+
	WXg587VBP3xdA4tmE2RpPml8BLv2gKlqy6thPjMGMbFmXXl7czrZI92AewflFtVMl8eHPrgbPO/tM
	UeSQlqharMpF1K6Vn1MNDdXNjEyF4OpI/NwGj4wc0q8psa8JWpa7MouHcdVVAnttr/L4tP+CRbzV2
	qhlS6vp+Bfouq70v2CaNnnzjkX5zi+IN0BQvotmRRyiG0EQsK2lfYzLGuwl7huKuFAZ6PZZdR4P22
	tjblL4AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqjS-00000007J9y-0zM1;
	Sun, 12 Jul 2026 09:44:18 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqjP-00000007J94-2kvn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 09:44:16 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so1472728a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 02:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849455; x=1784454255; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gfyfU+/y0VxhZvR8biEYcxwDSiNQWNWT41U3UuYJlHo=;
        b=OGh1VeQNpQ3/aZi9q1gfEiu20peNDk+iYOEwHlrGwZ8/oW16jD00/qpfX6Hu04o9VM
         /XlOJ8S7gZRyrPUpYu2VQ5Zzlbt5IX+3yKmtYho4RrJ8k4OwgkUZRBPfPTRTIy73uvzd
         PzNd1R3RMB5Z+A5b29TCcEMsex2OqgiMHOFNbTJOXUgL28UlCf1nr/UGqBsKvFQYTj73
         IMEAr9yIeHRP6y6Ek0wo5f1cDtHtUvirtnhe3ic9KC6fed2sUBU/vG3kJHjmbmfPsfPv
         4OUp8kgxYoCsPs7UXmrpMJuAvGuBro0k0nwrFanjLcs6azM5ZHQhAHiOjBNeh2wU5scJ
         3vQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849455; x=1784454255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfyfU+/y0VxhZvR8biEYcxwDSiNQWNWT41U3UuYJlHo=;
        b=Q87qczAE2v9M0qcJnXdubr8USY+6hbU3VhSxcrCrzuZwHKlkMfTtsgp/J/il2ny8zk
         dQxOVbMEk0vzGGUZfu84526GQaXiVrpinGTg0r8EpSCkQPYIp8cZgbN6PfXcijA3EzaP
         5bTytujTPtIOuQKYSOnYADztSfKlM/7Wg+mn9hJf01G196unR4Zdn6BgHX5OvH0ST0rm
         3q5xj5i1NMVJAc6N86jty+ZJ4Mom//qOWT486Xg33/kjvOaWxznB1sLyA5Ciar+8o/Px
         vEMwfqyNSmFmk3fcs34KpdhzLDikHNxPLHhhVMu62hOabt4hSMTfE0S1iYXVH5dMAwJ6
         oa5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrbN2GkLWmD7G2fkwcqqtyMhdFLb+xLPQXgYnMA1svNwuy8akj0oppUYrXMnaWZ9TU/QkcIMRYzJZYm7xaSZqm6@lists.infradead.org
X-Gm-Message-State: AOJu0YwoNXhXJE7SznIotoWoJRNi8DwTIYftIo6U9cCpWMDAtK5mvcZj
	y1f50k1VjWW8dUmPTAwUEk7oYZupfj4yGw2tpN55KagWgDGbuwhv8Kws
X-Gm-Gg: AfdE7claa29AxBr3TfpY7mM6FiTztErVOYSJOOE+BLu6zaMON+hGHYZcd9mkWm8KIF9
	2pziUz3pxlWmga4Y0dPy2cHq+FtTSPDxPCLfmja5Dmx5bIaO3kusz5JEV3DfPq+cnt54kKLTuZl
	9VGLktfKiXtT1hTiJbAdcYDoqJyb2iz0OXgL3J7EyRQu1OjppEu/dA/+6SPGOM0doWtyM/swGT/
	vR4hdzVKCtOy0q9xWOoN7dgZCkJn6UwKu8WKSxIH8fTUe9R+52GJCuWLGGfMmt2rNH0qkvFJh9j
	8GbbO83XGNvudHWBmlgYbbbqksfugYxK9yxEDYyqEGHnoUFZS1nPHLwXktPVjnQaxn+lHY3oo9W
	N8v1qobe7GF7/E/V/PDEhWq5OiVXajmJ6Vd0oLGVrWvE+2FKN3w0j+IiDB0BASRUQuO44ae00lH
	SUtJiedPR7NF09P5Ei7Sji43ksc/BfkezAzhrJzU793RzuKPQW5X9SKVkevXyPBorEiHN8yHMdf
	uVo6Dw7dbLBfe84oVcISm10e6/8qJ5/n8l8UMfdqfzzXzYb2Xrz9N0rm94vIPTP
X-Received: by 2002:a05:6a21:6190:b0:3c0:9c18:d5aa with SMTP id adf61e73a8af0-3c1111a84f5mr5649202637.71.1783849454701;
        Sun, 12 Jul 2026 02:44:14 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:14 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:20 +1000
Subject: [PATCH 01/12] arm64: dts: apple: t8112: Add SMC hwmon node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-1-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=664;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=sq0oGjxu8DUaLVwSPszvX/dOqwJtPWCsVF3V/zGzKyQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU/cxdwM6t0N38k4zv9fM23D47ntU3dMCHfqMeaKn
 7Ft2vVNHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKk+HM3wV7SNK7otQuGPhYOPrKNpqhFL0r7pddmGMYvVnDI3ytwUYmTY97Jiwv0
 n6xgfppQrTkjdVxHzfWHBxCkSrxuvN274tCOQBQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_024415_706080_D040C4A0 
X-CRM114-Status: GOOD (  10.17  )
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

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 85c47422d4e8..a3241c816c26 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -921,6 +921,10 @@ smc_reboot: reboot {
 					"boot_error_count", "panic_count";
 			};
 
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
 			rtc {
 				compatible = "apple,smc-rtc";
 				nvmem-cells = <&rtc_offset>;

-- 
2.55.0


