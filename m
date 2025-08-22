Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE86CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KONnmUwM9SvGBu11jgjxTCrWYcVMEKLZtMiY4/idju4=; b=dCdOSOyUV03xqm+9M/rbuA28Mv
	Y1SbZ+1lijiWsTvs+41AGCEVu0pyHPjXKA4MFVnJiuBD+H1fgHa6c1v9q3Cop/lRgierIa2FCb+GV
	trsEnuCVd9KOxw8TlEAy/5QmYXcD5mXSGHbBQop7BbCiTBgLE1F+OhQXGFSJld2HA80DZlSKpEIKn
	O2ULp7k4bZVV9u90vfZQNr3pNRov2oIOIADOhLqgUumQM4ZiYsY8Xc87Chky8G8zGfMbGc+HbxhPK
	nenfR0BVAMH4NfaqY5PddcYEv2VVFs3ocPyj5KpRl23mG1zqpJ5bJbjkqdVePjFydEQkixdm6xKye
	YfH3rLEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkdz-00000004SNI-2tPw;
	Sat, 23 Aug 2025 09:34:39 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRtq-00000002dhW-3HtE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:33:47 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6188b72d690so304999a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869625; x=1756474425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KONnmUwM9SvGBu11jgjxTCrWYcVMEKLZtMiY4/idju4=;
        b=vSqJOgCnDnVBa9gjxQMiJY8cnToMt2s3nHCHBMhFbo3DNZVrgMa6u/Jvpvry3NPU/m
         BhShsoPLLw7fA6OHysivdtR1MbgTj+CBdr4YBk6NxcGfh5LW24OpRWCjjObFFsdcYL15
         iqJjQUPB9rTKii1ibW2FONOhdg36t3wBrsKOSU56n2KLw9mxzMvH8Rc1HQ+P4WG/mOeb
         EBd2jB0ahgynpoHxDSp5BnXnvakLHvImAp4sxYvWA/Gu19/m/qMZglZSSVbFaITl8Vw+
         4oVwUArg5tg+6T39Vz3H370ygVjpmYEasWafkQtFThdyBdpAuLXfp/N5CNwa2L+0E40X
         oBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869625; x=1756474425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KONnmUwM9SvGBu11jgjxTCrWYcVMEKLZtMiY4/idju4=;
        b=LlLqRCPzLtLc9h/+aVCDS8+SXjfE1rbyjepfLjBhfcDaw4cCi+ZO85G5oXVwFMpWUv
         bg/yjdvVtRcfXc42vKfGv+tyoYxJxZK1MZwxG0zbYTblMDIGMMC7P7xkk1oFfVYjgq0s
         wvyNKA5Ur+tO9aXKM9mvfm+zfMUTFY/hJ7VTnO0rLeWyC4zMNK8KhZ3fKeCy7w2o1CCt
         yxY/h9dSSDiH8IaQk/PTKqz316T81q3ivmJ8CeQX8AGDV5mPQiNnHYcDfTEYP7Q7tTxf
         MS0Yw0S8XsNkps4mDY0TdWHELk0VhxlGahnuSeUg4yRZp4P91N97Q3d8YseUwc3ay0ZY
         hQlg==
X-Forwarded-Encrypted: i=1; AJvYcCV4TWDcansmyQErA/8jdj+Jhtn/bNs4FrmCPUI9LCKgKQLwq9gCyQNuxk+TgPVss0/c6EEhMQOQONiGAetfSGX5@lists.infradead.org
X-Gm-Message-State: AOJu0YxH5CCyTofPZRX9V+w/Exe70neRYK+DaZfS2nCos6gdFrj4KrRY
	J1E5z0+fg8G/69iYCfA4udmtdbMf3PF7r6OOg7VTegJ9Aewe6BdNVRLvmL/ZzTK32u4=
X-Gm-Gg: ASbGncuDt3bBeqH2AWdi9idCwxYzgzntTB/QtW0SXcjhgJbwxh/7YOlGduVQJvl3gNk
	kgJBphZaFXFPRwQI7DAMD5CIMZFbqf5mJrvgZk+pC31wQ1bFJrwGAaXow1YOMfCVmL5bnh0SHpF
	3TXPgJC1X4HRnTxzgTXDjujz24CO0F1segXbDjabDKdvgl2zr9WfWu1eJq0VnzTVgmBIlhzKndh
	I0CgoES6USodZPK+rFWbez98rZbpVawyFICfOSY0uLFoM2/BAzKVEWMESE3LTY0lf1NHyf/gpNw
	RmHQjW2yVjFao8P5EWwU5EgHPno+9Y4ZwF+xe+7CLt10odkt1PjF7CUk1NmAjAe3Cs60RY4DTOf
	hnAwjpGwck+PCI9mZmBXU35NSRR2HN1QPGg==
X-Google-Smtp-Source: AGHT+IFpYwdc24M4q3Jp60pzxtQAgr0ziC8W1Ke7bARfbzg/UMd2+blxA8BthoNYN3A2mZIz4HJZuw==
X-Received: by 2002:a05:6402:42c7:b0:617:d608:86e0 with SMTP id 4fb4d7f45d1cf-61c1b217ddemr1344251a12.0.1755869625190;
        Fri, 22 Aug 2025 06:33:45 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c21c1ec40sm1045635a12.34.2025.08.22.06.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:33:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: toshiba: tmpv7708: Add default GIC address cells
Date: Fri, 22 Aug 2025 15:33:41 +0200
Message-ID: <20250822133340.312380-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=EwmjMlE2QoCSD0hZhfDTNhzQLPoaw5YuZzcqGRT0sdo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHG0+KJ8AlZBjN90rASeESPQk+Xbrw7EXTxxM
 C26Gtbq0ACJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxtAAKCRDBN2bmhouD
 164zD/9acTS/9E1FVVWEILncwx8XHawpXiTMW7e5otqY2qwf6xiPxH1yEsXJmYV+u8oRndpzpFD
 pdYUziWbns9btuGRFLcftayyCeBBWLrfhBE543S2SHMEAcPQh/rrlkka8W4L7Gl2Yju3bFrT06N
 mEn+6ZIvaUHwKDRTXTJgIm8/jf5adW5fbaAr2XXxkLybzJFcTnf2TEegwvWhUqTo/yM38Qt+WaL
 uCY3AK0A9LzMw+WEsPeYhW7IPPFNmxZpMFOYimV8PmU46WuW5ElrSkHpfilNCqAvGC5XdlQlelN
 oZetB+JCeKWAvUjKzLIxOh9J6KR7wmB5j2s9K2m554LMqmf+Cmtlcxt9aHfCCzX15tq3JfLkfWq
 2rz6Ab0vTtXOxmgi3OswS5O68FBRU5wBP0J/3V0Yl1ERS4Q0IccZ4DhufNgKjZH1bf2A7tY6ncm
 pPYNwQLeSL184DHDSY5seWMwzIXKLAK3qwvxiExx2y4ySgiK8pq5II+zrwu5EmI2BM66O/UChpr
 gT9sfwt5DUyVVe+J4OvbwECGvIG/N4Yh7d3ZKYfm42gkGOBNKzahMUET1ojFYOGxSKlosfDrOqN
 XedZ/EZzKTxFPDTkGvRR/ccLEB4Z4uJWKVBFoaB0qgPdr81y8jsCZS2a9K6QLEMOShKkwL/4/4z nXMs61bjJIwMVMw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063346_819528_12F73FA1 
X-CRM114-Status: GOOD (  10.76  )
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

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  tmpv7708.dtsi:503.4-507.28: Warning (interrupt_map): /soc/pcie@28400000:interrupt-map:
    Missing property '#address-cells' in node /soc/interrupt-controller@24001000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
index 39806f0ae513..9aa7b1872bd6 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
@@ -152,6 +152,7 @@ soc {
 		gic: interrupt-controller@24001000 {
 			compatible = "arm,gic-400";
 			interrupt-controller;
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 			reg = <0 0x24001000 0 0x1000>,
-- 
2.48.1


