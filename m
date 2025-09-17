Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA5CCAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 10:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kmbJPIKT2sQhA/vxVf0N7X2Z80CDuvnn3C+ZX1OUAE=; b=iC8fF+QtiHgPoK84Z8oDw6FCsn
	vISBiM4OOcyUJTmUtgi1orsIP/+tqbx/Bg2CMmVG+aynXJ5Fy798r3A77088Xj74yl5DiJYXz2jx/
	rCZ1afPwhXoW9PwTIV0I5vxXX58yGbYbV1BsShq3Aj8pQLUcVAxdC4EWRaAome/mqZvWOvwox0zR/
	7pQFj5qQy9vxRFSki5btvYOQjsIu/nnpefNWl8YD3Xb0mot+uldbwyDYSJYWegIa8C26pKFcau/Sl
	dHXsgWEW0FtdCbqlv0NgjFWxaLH7G22EmnaE7L3bf0RTAGLOa35WUvFEe7fC33VBfXFSoDhPsAw+P
	vgBI3y2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypFG-0000000AwwC-45BK;
	Wed, 17 Sep 2025 10:18:38 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypFD-0000000AwuU-3NcP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 10:18:36 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b4ee87cc81eso5748912a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 03:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758104315; x=1758709115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kmbJPIKT2sQhA/vxVf0N7X2Z80CDuvnn3C+ZX1OUAE=;
        b=Q063drpBVvOiHMSPI6X1nSRvI+NRZGFBXg79pu727x8tAwj6jCpnbEm5UYqloiLfx9
         NLJDUzs2xKJkY7WK/OHXq/jM/9nXjHkEDKPVgzJFlb8lZ+dbl/+ccp8ypKq15WX+0OMQ
         /hGJekdgvQlWZsjztbk5SUTmiUVioft6pXLb/NL81DbeB8cG1n1VPmU33heqtePVrNG7
         xsGdnnUF7om+Js/0XkhNIg6S/uZ9By03++TNCmh3tBmD7lOQGDtwN3mGvwI4oOdA6hox
         zniD77ppDi1cNvjyOSB0xaH/HwEck857sBoOr5hWVCh4RvKH742xy1XwRmOwbivniuj3
         cL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758104315; x=1758709115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kmbJPIKT2sQhA/vxVf0N7X2Z80CDuvnn3C+ZX1OUAE=;
        b=RBcVDXKRe19ZlqLzLxm6aUddGFexSdynMkRsZ7mefnimbWXGNhANRPrLC/0153vr0c
         YWvn3cieM6KE8T4etDzgLCkxZN3OFQNiTec+ja0RQd9c6fBzgwpnTez7sXisgq8jcYDS
         vbYUScWOosvRSei1utvbQn6/XU3lUaBNbOx6gSBHyF8UeQ1OFw+SNcmmGPUSPki6wLOm
         lfpSBDSiG0tBq5dvnilaVAewstS1G7IRJhNh9uRBiOKfvS+GKSNArDETN3TD1VtQxvjH
         ljwvN0kpsNkpFZk1avpKTuF4ojpKgkA+Z0sR2C2HD1dHQlwTQXSGzarS5i7a/943vCAB
         37Nw==
X-Forwarded-Encrypted: i=1; AJvYcCW/vrMGCqA1pxbBsCUfpLBQCJaYFuSoGB8phiXz1SzZHvTeuxZ/23cvwD63O8rPWS+swLkVYn8O2kaNb+wOw2FU@lists.infradead.org
X-Gm-Message-State: AOJu0YyJvoLO7jk2VtrKb/Xkqt1xiQqjy/44IRheb3FDBbWC6+XDsXg8
	aXWRHpc0Vd+38LwjqaZ6E2BGy+teVwbEIyreaHUNcbfEVm9/qgXaps2G
X-Gm-Gg: ASbGncvX/uVTzAqb0XfMgJ8kB/0d2v7gfi60XayDysVKNf10yK0bRZ5BILjmI2fG1DU
	loFTw+0fbznlKvWHs8jdHGIYVWl59MjqQeenNp/QytwwuJ7G8QrU2vx/3WbvoDYmmvyD7T4rv66
	hQz2QhbsDEyCDlPKlu7L5KoKiVdi2VCIZrm06fqYfnL/iKWXz8s9n7kSZhu1OxqpCD3V5oJ+ymN
	XWnsk2AH2iw8BD3eD6keWA/JSgNYjhB7A0Bk1O/Ye3yu1kPonqdMJAijMCpRUpVtgPxOoFaVGCu
	NLWk0QFEkyj0/7ypygGTEpk2ZTnazwf5TN5ovN9a+fdjzhaUZ6SLUHiSUk8sbkYcFdK316MrHox
	ctuDoDfNw8z8X3hHSJSKAigbUSZ0flPpevirBhnhsagC2ER8vVfiGFaI2Uq7Kbw7jwUwPx5S7B7
	m+csilPa7N1V4DAhFlo6WPCjsY+w==
X-Google-Smtp-Source: AGHT+IFiUe1D2qnklzbedzK9Brp0DgIaGignG75uAoJrTAq+Wmo3K/I8sMVvXmtJYvF52h0HPiTMlw==
X-Received: by 2002:a17:902:fc86:b0:25c:2ed4:fd7f with SMTP id d9443c01a7336-2681390307emr21798845ad.42.1758104314805;
        Wed, 17 Sep 2025 03:18:34 -0700 (PDT)
Received: from eric-eric0420.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267f4d286aesm28588755ad.63.2025.09.17.03.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 03:18:34 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v1 1/4] ARM: dts: aspeed: harma: add new line between the child nodes
Date: Wed, 17 Sep 2025 18:18:22 +0800
Message-ID: <20250917101828.2589069-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917101828.2589069-1-peteryin.openbmc@gmail.com>
References: <20250917101828.2589069-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_031835_848627_7C16290B 
X-CRM114-Status: GOOD (  10.16  )
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

Add new line between the child nodes of imux28 to match DTS
style.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 23eaf47a38e8..41ae86180534 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -524,26 +524,32 @@ power-sensor@20 {
 				compatible = "mps,mp5990";
 				reg = <0x20>;
 			};
+
 			power-monitor@61 {
 				compatible = "isil,isl69260";
 				reg = <0x61>;
 			};
+
 			power-monitor@62 {
 				compatible = "isil,isl69260";
 				reg = <0x62>;
 			};
+
 			power-monitor@63 {
 				compatible = "isil,isl69260";
 				reg = <0x63>;
 			};
+
 			power-monitor@64 {
 				compatible = "infineon,xdpe152c4";
 				reg = <0x64>;
 			};
+
 			power-monitor@66 {
 				compatible = "infineon,xdpe152c4";
 				reg = <0x66>;
 			};
+
 			power-monitor@68 {
 				compatible = "infineon,xdpe152c4";
 				reg = <0x68>;
-- 
2.43.0


