Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5A8D3A696
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wwdH5E3n/FKvtFIFoeUG2vP8wssuIiUjkTOLgVYvdE=; b=wP5ziwe7SJcVqAiJskPhiM7rM6
	aEG1X4SFCeiVWnZUrV9B4+00rcYaL/OmGlFXVUng5P5Cd2MySpcdEe9k5XRF/1sCFCZ7C1Vc5xKJW
	I20Pu8Dc7E/feKvfVTfihk/AGIAanXNVgxLmFsNuWDzC3B1rDqWfFuaWgYCsjVNmeIdyqKAbBISgn
	7qmCBSbOJzFIbMpLBSlthwUG6F5TZjQrytQUKOr/82UbXTtKathDaEV8iKfBDIWsKJBs7Wp2QX6V/
	U37/I6UuCD0V58LliJ0E57bVTL1Oax0veFPTaHqts6XzXwmawQbi9KmrVqvn6bqGC2sg0AjNa7edr
	j7eF8zUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sup-0000000FnuZ-3Hd7;
	Tue, 29 Oct 2024 20:34:11 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sl0-0000000Fl6j-0JfY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:03 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37d6716e200so888348f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233441; x=1730838241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wwdH5E3n/FKvtFIFoeUG2vP8wssuIiUjkTOLgVYvdE=;
        b=BsPgoRhp+Ca9HwXSRicDLn+c3Swf+v8hyd+XPg3yufL2fChdFVSvTMbevzinndekj+
         zEJtcs5rfPWZKjHPLnQkpEGUI+pUG67CgS9z0F9KJMEKHUsOpliGWeQ2hREubyJS5ria
         41bpSAhnMENqbTQY7k24eCnlOgdAWmcSjr+UrGNVX/poR3zozAIN6Q1EL3Cx9yqerM5i
         ElHDDlR8s691OzA2BEh5zC+awKgh3CuYvlLd7Vz6uMP8PfiRRflsJqC7/PmS4Rb6n+vA
         0j3JXc0Dgh50X7QXhhNxut/1uW/fnR8PKYzyYs0EVSdJeU6/EK7F9Cy2w5jLsMcDNxX1
         F9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233441; x=1730838241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wwdH5E3n/FKvtFIFoeUG2vP8wssuIiUjkTOLgVYvdE=;
        b=bySFvohC6B0lXWJrWB5nt74u3inywx0cUHibha3gUPR47BqY2WD4lzHAgIh0gg62jP
         Yd41QqqzjxNjAQsjTvKDeKHQFsuRrBUJmKj1U+yjHu7MEMz5qc9HTKz9gZHrXf6j1zah
         bXLLxoFBzZ1U1NAAV36Q3Tshj4ZSQuEZ/GO2auajmvQSgAFwqwxt3t9n+TnE5wcv+El1
         O/kyGkcN425BujF9z8pvqN4IsH2SVTKkVL+w4m3H4wrkDZtBGpVo6aMiqwNcdlLVz2Fl
         sXEjl2p3T/cJ+IgOu+tJOQQlYRy9vEE0uPZaKNv3G41y8BAvMDEjb153+tJbnPPle1ME
         UwOA==
X-Forwarded-Encrypted: i=1; AJvYcCWcuetuctXxPCzcxtyVmKEqrKJ9do+9Njw/hY+Esm5IPo7S6BWDJhd+CUqyi2GB90Url2Avukgp/WyBecyqXXWf@lists.infradead.org
X-Gm-Message-State: AOJu0YzJx8TkpDEOp9wAADwSB1sO3JQUCTvnz8UkiKhGEhLoQ6u/o+Dg
	dUsCeQgYFs+n60C6TlsmGBt7/Thi0OkOK9XECZMwZ7wpp832cc4f
X-Google-Smtp-Source: AGHT+IH2AADFwOVOQ1R4+gybUTrdQi/LWShRjvH9Hp6FgJFs5PPv8cF+35BhJDVAUQg7FgD0Y6O57w==
X-Received: by 2002:a05:6000:1fab:b0:37d:47a4:ec2b with SMTP id ffacd0b85a97d-3806121a2b6mr4483656f8f.11.1730233440576;
        Tue, 29 Oct 2024 13:24:00 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:24:00 -0700 (PDT)
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
Subject: [PATCH v4 05/23] ARM: dts: socfpga: add label to clock manager
Date: Tue, 29 Oct 2024 20:23:31 +0000
Message-Id: <20241029202349.69442-6-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132402_135854_54A72B3A 
X-CRM114-Status: GOOD (  12.28  )
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

Devicetree setup expects a clock manager label to be around. In
preparation of upcoming changes to allow for compatibility.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 90e4ea61d..7f7ac0dc1 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -88,7 +88,7 @@ fpga-region {
 			fpga-mgr = <&fpga_mgr>;
 		};
 
-		clkmgr@ffd04000 {
+		clkmgr: clkmgr@ffd04000 {
 				compatible = "altr,clk-mgr";
 				reg = <0xffd04000 0x1000>;
 
-- 
2.25.1


