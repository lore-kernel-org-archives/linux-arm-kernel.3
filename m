Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF845D3A69D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxrWAGvbebnl7bShJIljz1Nm6dGXiAY6T1E3WWpWzg0=; b=LdvxtU/cHQ0+Z0h37tICr63hTp
	p06XuQxlDLwC4JLxcxKviaGfZM7EkbGSBPyzPKUNDFmi9AdW3trfA01f5D/g6CobEYYHAm9vnIvG6
	BwXzPwSY7A30dUOCjZu6NAj+utHTgrxQx21vBLIcfx8AvcPkT1Ig2IbuQIIUlmLfs6Dv7Kv7qN5Rt
	yED2xK8IU52QYF5uxOWUrRrR1tlNFN3iEsRuqZsttaXklEUUGl5Sk9eJIoD2nDupSrHhrGmw/IO2X
	qIvGBf50aQ6Ofh4qmi7f0HQ6QI0DM0wWpBX2cDXC/ong84WZr/zf3j6AaQlxkfnxgfZxcCRVIT994
	LZiGTp/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5t1V-0000000Fq2H-41HX;
	Tue, 29 Oct 2024 20:41:05 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sl8-0000000Fl9W-0Rx6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:11 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37d432f9f5aso549017f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233448; x=1730838248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxrWAGvbebnl7bShJIljz1Nm6dGXiAY6T1E3WWpWzg0=;
        b=j6B/mOLzVmm1m2m3gpzyfMh3ZB/PObp33nkHtDq0lLneNy90MkoKnNiDxFVoBeggMf
         IYskvyCHVpu+R15dc52ZN/XmtHINMz53qEyMioEqB+JvYN7wCD72Hum0xN4L1ENFL6O+
         UTPGRHuhWz+F7xsD4XnT2rMO9R6bfkDn0rcbPQhaxZrpjGdBiOOtKxrf2i9CjsKQueT0
         SdT+Cx7d4v/h6WNDNmrHpE0QRZGCF0rGAGipIS9r4KuhVVYiwshqPTZwep6jfXTS0LKZ
         9kQVINWMJgz8YiXwAM3zIAXE8JZ09uyF30ZWOFCz3IphH21e0SNz4DPGWRSGHm/kAA5z
         wwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233448; x=1730838248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JxrWAGvbebnl7bShJIljz1Nm6dGXiAY6T1E3WWpWzg0=;
        b=aDhwC+Yn26/wJsozSllu3eXijHBLcB5Vi1l0sEAPvJuWiwW2TQhOAEmvOVeU/k90wR
         opB4nDfIpzQ36n5g4j9NMnMlzjiFcwvtPDDNGO7dIkH6ZSPs7vrieiVbPx3aIwBz3LcC
         bxfa+p+3h9qlXZXIymyrR3SMm12PvI3I4QnvbTLV77F9Z9kYAN6UqwTVVhBSef5U3ORp
         fDf+3CWJ9bLBbBNDJj21VeuCg53yP3u3mZc+zPRE4L6BVO7viTPW5l6Z96KYSfdHiqVu
         auvDXmPJ/mA2n1e1CTAZbeDfpcfzlcX/f+KsT2yyBJyV4Q5aeRq+GP9ePa33tzDbwp69
         eXiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs2UrH91C4Jt2MwvI4aatrRaQEhYE169zH7sMtqAaPQWrxLr+teHhXI2WEys0c7l4DqelX9plCa8f9Ms2bCNDy@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6ZN2MXM4NKdZqbNJy5xLgoInIg+fPiuSGx/hx66Cn85MZvZih
	ukLM2D7GL7OI1XAljEFajzGEQ/U574IumNcCS9CStQvznxM/5UsR
X-Google-Smtp-Source: AGHT+IFe4HEmiUudtU71Iu+vsYyyet/UvGGn2kWZSX/+5WG2rLBnApro20Grx6Z5bXjcP0EijIUzig==
X-Received: by 2002:a05:600c:5494:b0:431:4a7e:a121 with SMTP id 5b1f17b1804b1-4319ad4ee8emr46759745e9.9.1730233447776;
        Tue, 29 Oct 2024 13:24:07 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:24:07 -0700 (PDT)
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
Subject: [PATCH v4 09/23] ARM: dts: socfpga: add ranges property to sram
Date: Tue, 29 Oct 2024 20:23:35 +0000
Message-Id: <20241029202349.69442-10-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132410_229378_06684878 
X-CRM114-Status: UNSURE (   9.59  )
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

Add 'ranges' to the SRAM node as it is a required property by the
dtschema.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 5f4bed187..6a2ecc7ed 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -691,6 +691,7 @@ ocram: sram@ffe00000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0xffe00000 0x40000>;
+			ranges;
 		};
 
 		eccmgr: eccmgr {
-- 
2.25.1


