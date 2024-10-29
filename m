Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3A9D3A696
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7BTF2QgV5p9nNttdJyKFEUTkRzHJB1L1AnxAUE0mKw=; b=Ol2WRYOTzcQPFb/RJuk4B8gwTo
	pr2+EbcLD8Ngb0FI7O+H2G2atTFhGJXLygLGkwmnG6MqABYj0XTeFjO5bQ+lzmSiPWNaeThOSdZtt
	1hHNlZ6eepBtCU+fyupFIvMt/FuGb4Y869EpsrCgTZfvefEMlL/KvGxjrDl5RpUhud6GPzhuCgD7m
	tCCHYh0mMChP8LUByup3UUnvKQl1bw6Ruxp89XKVqaswLwc5KuN3JTbUZdNzCWq8OW0SnfZh8WAuY
	IAh8siBnfDRgJvdm3t3If8EcYkAf09xILQjmvXd3isZJYuSG05ysEuXoeyZgKJuxFFQ1lGXZmPZib
	lx57oaYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5spt-0000000Fmeq-3iW4;
	Tue, 29 Oct 2024 20:29:05 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5skv-0000000Fl4f-3AUS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:23:59 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d432f9f5aso548953f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233436; x=1730838236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7BTF2QgV5p9nNttdJyKFEUTkRzHJB1L1AnxAUE0mKw=;
        b=Ia46wouxkqQMkmDWOtIe1o9n0pq70QLTr4j9Zj7RWlEizZQxwLnwquZMF+4YRx48Wk
         JbqahNPnX6gXV02XkSdfDf/j6x/rom/6yoEMrkB+Y67icxsmGCzg7eQEDdcXnYta7Mqw
         1t97UZONVpOFt4BYhZA/FVVh6QO+Ma2NSqvw1uK1J5I1ENzxCCS+cUlqME44/uyz33GX
         IrwC6xOBZ8gq22N3hJa/DpGBD9oZWnY/XtsS7q3e0TFW0hRMFxOKOhH67MDb9m9Epndi
         qzS/2bDPkRJ/wD8Io6iW6gKpvl/1nj4DAohtU+SG74B4y+hl8t15AkmdwGg3rTZuIR4A
         Vv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233436; x=1730838236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7BTF2QgV5p9nNttdJyKFEUTkRzHJB1L1AnxAUE0mKw=;
        b=Iq8OWH+FCwXYX9bnKyY//8fKvwZWyzPkRjL0PmrKu8l9uRvHLKY4dDmjIkb4sGcLRX
         v6FmSDCogJomwBlHEnFaU48NqEOkYr22EZloRSNyPw5LgR/Xw/jHZb9hZUD+/MnLu1fR
         mFiRxOhGuN7tbDDL3R/Si4LJ5HN9dcJK+D1f8alkbMaM3NGyhAFmuRnoB2P0FNRZUXTa
         bRfDMNPfGBYJIhQmcQEyvYaFHgWcch99a5bjKQelNO22rSFWi+pXU2mKF0f3jXbLDrYx
         WmZ8/sH4jnCw46uqIsgqgBRwXkzIZT2OE43uKYQmEMnnwXY4SHDQvg94/2u+GwWQBeMv
         tpgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGgGs4rWk6nKubF63/dHDF4VzoOSdnavMGKRUewJuy5ouLkoQi0Clbw4s7F4/vCpNgNKdzcwgHQM3NHQa11W+G@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/eYVs+x5CVwOs1HMpn5fqjusL6pP6hTzuHXTTLJA4XrOdPP0D
	tDcvk6HwkAhvGXRoCPz8N4M/gOl/8a4igtvtfrVZvkIcXnpq9V0A
X-Google-Smtp-Source: AGHT+IGD+/RLlUFQ9JfrHmh8ZbfUuGjxW0QoMqGnWizIoxkZXn06IHyKtDzC4H57odNMJ3rODgdWcg==
X-Received: by 2002:a05:6000:186b:b0:378:955f:d244 with SMTP id ffacd0b85a97d-380612bdf5dmr4232846f8f.14.1730233435443;
        Tue, 29 Oct 2024 13:23:55 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:23:54 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Cc: conor+dt@kernel.org,
	dinguyen@kernel.org,
	marex@denx.de,
	s.trumtrar@pengutronix.de,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	l.rubusch@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/23] ARM: dts: socfpga: align bus name with bindings
Date: Tue, 29 Oct 2024 20:23:28 +0000
Message-Id: <20241029202349.69442-3-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132357_890283_FC412E5A 
X-CRM114-Status: GOOD (  12.23  )
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

Binding expects the bus node name to match bus and not amba.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi         | 2 +-
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
index 35be14150..c7ba1e4c7 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
@@ -62,7 +62,7 @@ soc {
 		interrupt-parent = <&intc>;
 		ranges;
 
-		amba {
+		bus {
 			compatible = "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 7113fe5b5..7abb8a0c5 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -54,7 +54,7 @@ soc {
 		interrupt-parent = <&intc>;
 		ranges;
 
-		amba {
+		bus {
 			compatible = "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.25.1


