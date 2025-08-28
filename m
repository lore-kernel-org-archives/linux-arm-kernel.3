Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0334CCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 08:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OY4GJHvVYK+N5LUJGUaOnp3q0oNX2or2mbmIQLdKleU=; b=TRbHnuegdjGnCL1akTRhiRvdIv
	1vEztt5znWwDdk0RT3pVnq9gFnWZsy88evoldxoVjh/KBc1ai9ynFSah+biq+YCXAAl6PDyU1wdnr
	T7JFXDeYsHuDWv6b6N5noM420Z99Jo/FBSf1zX14mQaR5CLSx3eq3dtW+iGuQSKDmJZVZajkAaJnt
	7047JdJJQg4JLAVu0cthHTfV2V/LEuQ4ZkyhMnie/frHUtkKadwWyq6YA/8eugPgA2yCdw64j94M5
	nEntchP1o3dUpS/BgtmXkXhRy1N3ueu3vctZdNJmW1jQ0iFFfKbcQHMGIwuZyYlz6n9lqnoA3LQ58
	apCqAEYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXbA-00000000iX2-0uV7;
	Thu, 28 Aug 2025 08:03:08 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXOa-00000000fx7-47BI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 07:50:10 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b47174c3b3fso442516a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 00:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756367407; x=1756972207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OY4GJHvVYK+N5LUJGUaOnp3q0oNX2or2mbmIQLdKleU=;
        b=S+g1snxj6HLnq2mIqfJ6scTme3C+drr2Vk0RpaCSYFoJt+lOoFJ1VZuQZMtMoDrVa4
         QJET4dUThxkuB5l0IDaNG1C3MpgjFwFu5DJNghCOZniE2Q4VZ21Z0Crj7IMEdCKI5+eW
         G+f/QXiWJ+1RamXuK+f+BcCj8A4kv02CiEGheBQcHafs9Moz4PZL6GhzaF+LPI/PemwM
         6GcJHz0+YYFGppV32LeAUPRpl0hOeT6sVtFmTs8mVKe0uQWgLUpPx2vgOX6fHzq4SPEu
         vqRF6Fg1K58JoGI5OlTyAgVC2u2fEEA3Pp+3W32bRSkgegHUZCwSEJNPgfvJKaS6O/ZT
         Fycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756367407; x=1756972207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OY4GJHvVYK+N5LUJGUaOnp3q0oNX2or2mbmIQLdKleU=;
        b=EUzd65F34uJiz0BjZjCTIVM/sJQUatu6s9HXRyEFBwAnPyQJSI64gscW1uwrdr2WQb
         AjqixBtMZHj7fpboYohr812dbBepNJJTze/U/zWMHV0omS2XtfKXv4cOphyroKqQexqC
         jj51lMt8WRTH5oOo3JB69xUYPA7VxOCNwRH5lXzSX4uQUAeVkRzpN37JCEqnYOp8pri6
         cqJobo5Rfb88N0dpqTjSzcmXyWN7xKuy5Wjv4aN00fQ291n4gWRt7Oo2AIPP/up0XiGK
         qcO7rImEL8kLFpHsrGW4yZrm4c+HVGuIFc+HlxN0FkXseLBa+w/JOmkyXyy7wUYny5/j
         9Fug==
X-Forwarded-Encrypted: i=1; AJvYcCVdr8lHWGpdm0n70auwHsul820XXnwP1qk8EiuAXyCLVhWzwO/7BzBzX9Gz/ZVPRl9lhNjtst/vZOcS/4KOCRny@lists.infradead.org
X-Gm-Message-State: AOJu0YxwAdcjLm1lDeff6f852+HSPHP0jxU7WR/P+fYpdiIXNAi2obax
	0i0lq1CLokYX+icSHLU3PuUkjb7/9Mg0x0HL7iXIwJrGz5UGkrP878ojX130/w==
X-Gm-Gg: ASbGncsnS+UhNWGzwL9cDSPNw6GwlRHNfanEEI1C9Ld5oWrpymjZYUJM6p/pDy5fqb8
	qYpa3wHwj3+DOOc8twMBE/VrvjgmBFdYbV1TwRMdzyo+k05wFZ6kpn8xr/1fEcJuVn6Y94vjPHI
	wrwR3icBA/ZMvFMQZu73TvGGz1fumwxnL8XBRmbZiWqXhg/BX/uHugSpeP0N9GgWLdsCLtMdcMb
	woJ0kKoRge8YT6lmT7IVkx1M4W9/xLrIfJ5x8EDQzWunRoaaPkzPxs8xSQOSexzQAvBwy/e5QmF
	VXdC9FGYy5X1Z/FwVSmb3xvGIYb+5Fj7PmEw8AjZLo9ntna/Qnof3zeBmMRtJ9IM7K7xpesfE5r
	KD+FnXPHebLAfm/y3PB9OIb3cCxoCf4Q4sdk5MQx6H7HcnnO2+0+lvOp43Bv3LX9E75yAZN9gNx
	xRCd3JADQaoeXQ1DLxQB1vj13IXD/zhDWObv8rI+M=
X-Google-Smtp-Source: AGHT+IFoFeIhs1JjbGLogAOPAL7+VePjRCrOyPg7wVzL3i/MGX6/KrwNh57ZD1SdoMCZnSYAqEG18w==
X-Received: by 2002:a17:90b:1d92:b0:31f:a4:8bfe with SMTP id 98e67ed59e1d1-32515e2b3d9mr28696892a91.7.1756367406727;
        Thu, 28 Aug 2025 00:50:06 -0700 (PDT)
Received: from peter-bmc.. (2001-b400-e35e-4238-7ad6-5c9d-99c8-92d0.emome-ip6.hinet.net. [2001:b400:e35e:4238:7ad6:5c9d:99c8:92d0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cbb9d226sm13272038a12.41.2025.08.28.00.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 00:50:06 -0700 (PDT)
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
Subject: [PATCH v3 2/3] ARM: dts: aspeed: harma: revise gpio name
Date: Thu, 28 Aug 2025 15:49:52 +0800
Message-ID: <20250828074955.542711-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250828074955.542711-1-peteryin.openbmc@gmail.com>
References: <20250828074955.542711-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_005009_022535_2742B258 
X-CRM114-Status: GOOD (  11.36  )
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

Update GPIO label definitions in the device tree to reflect the correct
power and control signal names. This includes:

- Rename "fcb0-activate" to "fcb1-activate" and "fcb2-activate"
- Add labels for:
  - power-p3v3-standby
  - power-p1v8-good
  - power-pvdd33-s5
  - power-pvdd18-s5
  - power-asic-good
  - power-12v-memory-good

- Replace unnamed GPIOs with appropriate labels such as:
  - irq-pvddcore0-ocp-alert
  - irq-pvddcore1-ocp-alert

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 741d2d9b6d03..81278a7702de 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -234,7 +234,7 @@ gpio@12 {
 		"","",
 		"","",
 		"","",
-		"","fcb1-activate",
+		"","fcb2-activate",
 		"","";
 	};
 };
@@ -308,7 +308,7 @@ gpio@12 {
 		"","",
 		"","",
 		"","",
-		"","fcb0-activate",
+		"","fcb1-activate",
 		"","";
 	};
 };
@@ -698,14 +698,14 @@ &sgpiom0 {
 	"","",
 	/*A4-A7 line 8-15*/
 	"","power-config-asic-module-enable",
-	"","power-config-asic-power-good",
-	"","power-config-pdb-power-good",
+	"power-p3v3-standby","power-config-asic-power-good",
+	"power-p1v8-good","power-config-pdb-power-good",
 	"presence-cpu","smi-control-n",
 	/*B0-B3 line 16-23*/
 	"","nmi-control-n",
-	"","nmi-control-sync-flood-n",
-	"","",
+	"power-pvdd33-s5","nmi-control-sync-flood-n",
 	"","",
+	"power-pvdd18-s5","",
 	/*B4-B7 line 24-31*/
 	"","FM_CPU_SP5R1",
 	"reset-cause-rsmrst","FM_CPU_SP5R2",
@@ -749,7 +749,7 @@ &sgpiom0 {
 	/*F4-F7 line 88-95*/
 	"presence-asic-modules-0","rt-cpu0-p1-force-enable",
 	"presence-asic-modules-1","bios-debug-msg-disable",
-	"","uart-control-buffer-select",
+	"power-asic-good","uart-control-buffer-select",
 	"presence-cmm","ac-control-n",
 	/*G0-G3 line 96-103*/
 	"FM_CPU_CORETYPE2","",
@@ -801,7 +801,7 @@ &sgpiom0 {
 	"asic0-card-type-detection2-n","",
 	"uart-switch-lsb","",
 	"uart-switch-msb","",
-	"","",
+	"power-12v-memory-good","",
 	/*M4-M7 line 200-207*/
 	"","","","","","","","",
 	/*N0-N3 line 208-215*/
@@ -809,7 +809,10 @@ &sgpiom0 {
 	/*N4-N7 line 216-223*/
 	"","","","","","","","",
 	/*O0-O3 line 224-231*/
-	"","","","","","","","",
+	"","",
+	"irq-pvddcore0-ocp-alert","",
+	"irq-pvddcore1-ocp-alert","",
+	"","",
 	/*O4-O7 line 232-239*/
 	"","","","","","","","",
 	/*P0-P3 line 240-247*/
-- 
2.43.0


