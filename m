Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED84CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NugkDqfPlG6XLb9mhraRjCVSd7VH0v9iuNruR6SSHo=; b=w4Mo668YBSVdo6lnRR0/qHHDqH
	Dzx4Fft/lUsVB7SGvVtJJGgqzRrnyd4w4d2cjsowMjus/RSp3ONcnKn97PRleHfvGjPFeSGC5hgra
	N8rfLh+8UtyGcxEmXGLKIhpYGJ9UvKpXm7ntqrnwvfj48Kle/XhqN2gACNgpLYZGluQzByLIdVWoi
	Brn1F+OB3z2r21GnSxNH8W/grSiOvDDi+sRMd4ngGeY2qkWU+9YYTdeAsvq+BBCFAzqJiNS721aTs
	9ixtYMS1d9R6jOGTaXOEeffg0HdXd5j4nKguh/vt3l80xSvnxRAUrm6oCPrH3ng3fXDAjq1bLHwwO
	1P1ezybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBScb-00000002eyx-1b4h;
	Tue, 29 Sep 2026 07:51:29 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBScS-00000002ewc-3QgY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 07:51:21 +0000
Received: by mail-pj2-x00.google.com with SMTP id 98e67ed59e1d1-39e59dca659so1120498a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 00:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790668280; x=1791273080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2NugkDqfPlG6XLb9mhraRjCVSd7VH0v9iuNruR6SSHo=;
        b=Hods/h1mXSvho4AtkJe062K6oTdH0mzF+MzBqJkXWpn141KcrKVRzyooGQ/gO4bVlX
         24RTEifJB1Pov5LYli7vmjSWE1UOc0H/9y3cTEFG3gV7xChLYOmriR+toSP3eBdWn4+0
         rtKMJSynclBBEqnG6h3vT8pHmK/9Qe/3xVezQDcF7zdLrG9AQxRqD3UpnKjgztPX5c95
         WM1Pbs3VYc7/bcfn/W1wYSV4pzxwTBJtjcp8Q2Ix2Toe3xm196lC7JEuvv2zdTeOeJgU
         1WAmXNN3a0GKvAyboA6wp53XL5kCg+OHAvLlDgtvXXo31jUPDSAUF2ubW80a/MPX4lTt
         /GJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790668280; x=1791273080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2NugkDqfPlG6XLb9mhraRjCVSd7VH0v9iuNruR6SSHo=;
        b=zFAW4Trrwfx0geROLlIi+sa2W89fx3RpysUbEvMqVjAKWjl1vY6Ni99VLewHZEZDsu
         SKGOA5wP0uyAUajh6iZaCT51bY6vpksHA1hcg1cXXbfwXg1pYJMMRdHoKk3hv7sl1Yfr
         lnyUZ72bCH1+8g85DEJ4NVn0KYWU8ZF2+/GQiQpzr0dCNcPJFZHnIj4LjJ+4Gvzr/UGs
         ICikejUxFOocmUi5XUCxY8DyI1riPxTkS77vlPVUGB/w3XK7elXknQPG+3AFV6GiJnEM
         sRGpPiKFilcFUltwcB8TQNGA0FHFxoMfyNDSiE8PH2NrFMIXQM9eb+TiFdk5EPuh4YWP
         desw==
X-Forwarded-Encrypted: i=1; AKwUvBytDeFR1gZs5xsYPWc306KlgXvmkV/Jm+1VwtDJJLh5SshV8YA0R+/cozsQxveEZZNrJa30P0u0URC+7Gxmwskw@lists.infradead.org
X-Gm-Message-State: AFq9FYIkiar3uIfl1cOSI0fZBKPbm1lU2x6Kw6EVRa8mkIq9JGkAHEId
	Z3eHDNYO8NnXWCPSXb34pl9McW21PB41xbCxZ/1lQOYvOERdpAnRnMGW
X-Gm-Gg: AYBFou0XLJAVGMkx1dS10vMd6ObZrE5+gQMeP6oE1IwclOP9gaUwvmJllIzVAv9jr6d
	KC9/v4dBXPmLfmmK7/XucxlY9+ztTGUNL7j+/RInhNSojaD7Zv4+tRMPWiQBY3sDH7yv5VUFGNY
	VppESEbF2hjj0rLDXRxTi9EZ4Jha9aGxFzwe5kPaDRS0x13BCfmUc9wqgCOQ9rkKS2JG4ROU5xW
	rL/qk7lFTP/wvjsFWJcJ6OBxl5vDGYShDIBUQ/FQxnvIfNnVboJRwy0pTuyRFY1NU2iQsz7vs0R
	Ziw4ggkS2PcjiKx7yZUElXjmfdUYCt8KG8IsBsRg5SsyKFN8Gh+tkR7T35kcUUzlNiYT9MRDg6A
	I22nPJmM4CN7F1NHWyRdzSkp4xvI+ZohLrFM1G5Of50dCjoetZNaNGloKd645CweiAJqCJb0TUb
	ya34Vr/Fi3spC1vUHDEhmz5ShL1TQO8gcUOiNWb6U+9J8xFWwEdLoYBx6s3l3nIgcuZXCtXdV/F
	7H6djRQfS2JxUdibMtJehDBuKS+q3KqcP+6ivFJc+nwTS1VZB18xhzY6SIoLEt7N6TeDIZiku//
	Fw==
X-Received: by 2002:a17:90b:4fd2:b0:3a2:b0a1:456b with SMTP id 98e67ed59e1d1-3a2b0a1459bmr3740009a91.47.1790668279738;
        Tue, 29 Sep 2026 00:51:19 -0700 (PDT)
Received: from suewang-PC.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497ebc998sm4049236a91.2.2026.09.29.00.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:51:19 -0700 (PDT)
From: Sue Wang <suwangquanta@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	patrick@stwcx.xyz
Cc: Steward.Shih@quantatw.com,
	Martin.Peng@quantatw.com,
	Fred.Zhang@quantatw.com,
	p.k.lee@quantatw.com
Subject: [PATCH v14 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
Date: Tue, 29 Sep 2026 15:51:05 +0800
Message-Id: <20260929075106.74731-2-suwangquanta@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929075106.74731-1-suwangquanta@gmail.com>
References: <20260929075106.74731-1-suwangquanta@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_005120_883213_FFD6D057 
X-CRM114-Status: UNSURE (   9.70  )
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

Document the new compatibles used on Meta Ventura.

Signed-off-by: Sue Wang <suwangquanta@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9ba195b8f22d..ce74b89445ce 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -98,6 +98,7 @@ properties:
               - facebook,rainiera6-bmc
               - facebook,sanmiguel-bmc
               - facebook,santabarbara-bmc
+              - facebook,ventura-rmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
               - ibm,balcones-bmc
-- 
2.34.1


