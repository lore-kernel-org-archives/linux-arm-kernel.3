Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B26DCA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvu+NvcyVJHEn3ev6yli5NPbBHtkoDtdYJwktOVlhhA=; b=3kqWx3QlmpmIbKb38ricU4u3kD
	BqqyoTfsEmO52asmGwS07DtO390TL+3qd/Tt+Kg8WQk+l863BDvYr08YqBYYT0ehqp7OEXfe9oJtj
	nLRlcp2xr0pKBkPTQbUyek9b9nfyduZy6HMknS/3yGL8XjViv3Z+HnfWgoO+jHNSez115a6N969Gj
	Wvxxb07q+HcUIRZjygoWxuQ4kZ+H06UFcaMwsb1RwTWYm74vSmOF+bcY6wo2HHl9zeoogoG0Y3I8X
	DptiGO3Aa950hGKX9RZrugYzrNvH0y6A4WP1C+MXy0689c2+y28EXHCZXSyqt/GHiOF6mmiYd1JEz
	FXUWUZmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsLG-00000005qV9-3OeV;
	Wed, 30 Sep 2026 11:19:18 +0000
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsL9-00000005qRq-2Tkw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:19:13 +0000
Received: by mail-pz2-x0c.google.com with SMTP id d2e1a72fcca58-8804c1728f9so4038763b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 04:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767151; x=1791371951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvu+NvcyVJHEn3ev6yli5NPbBHtkoDtdYJwktOVlhhA=;
        b=gViTTwV81BlH6o0cOdVnLh0fC6Lf4HTHwBR/WNaWwr52VQm2UV5BqVLteEbDB/0ser
         Re5mqcqxq4jN5jK+r/DT7LiuFZMq1k/OOQrk7VEHvGl8zEJUE60otNGKD2hCgGel7cCc
         XeAuktU18RBfXRavYYaZNdXBRFRmv7+MBSNmdffMTMloJhJ1vwA4vY5tcN0h3ywRy2/5
         2j/UW+c0jbx7a50EYpTPbOGo/B0Q5OWGdI8QEk64Y6cKi5x6d1bsJiFd/JAH+c15X1Tx
         vIL9sa4yTmTgnbMMGmsiDoTOi3MC5SuEv5WxCx7YGfRTbB5BCHcp1/lWAzNssa24Nk4S
         FIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767151; x=1791371951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvu+NvcyVJHEn3ev6yli5NPbBHtkoDtdYJwktOVlhhA=;
        b=R0WhDl7APywVG3kF+ldUj1bhIJYO+AOsIMahL/TEbfABI/7okz5YFA8AQ4j9Y69JOd
         8KB8gcPXASjoaJVV42kv5rMbOHQmuSQjamlhknNDxlNBmRYUB5a5FKXzNxqvxpzd5qIC
         gwxU8yV67TlKnRG7ybKJpU9hZnmQzoDijB96cT1eqwAYuMst8IKsE2KxXCnyt1RFIOv2
         HqTRFiKNFOXDqESNvumMhjf0+JCybyvjeGFIEw21p6J0NjiZpTLjTuq9wgBHsLsgVi53
         fUPKqeavLEkpOyQ0uV9i5AmUNzPY1Hv8PpSP2cvYKUiqegozc4v7o6Q4/fxqSnRNE7oH
         eYpg==
X-Forwarded-Encrypted: i=1; AKwUvByrQp2Eap5oCdIUaHFv2b+VG2LcFRgRZh4I22N7ha4KF4VR8hxMbVc2PwY/HmKca+V6XtbTni4ZggSmQOtUYE8+@lists.infradead.org
X-Gm-Message-State: AFuF++nVmBOdwBjPPr7UyhN20FdB0KvhoS4wMYmcM/+SPx134owlAjwf
	ugO3GvrdQztsXpqYk11R3aOwzfgbGOzxn7B+CqlTzfxKIRyDa/AhCtpf
X-Gm-Gg: AYBFou2CqYjj7JQtzlKQ5H7L0SKkZlY61UkjQhOTPKZXoEyfghnAZDgucOsmnEzQubL
	msLaDwcuzVLrEXFNVBt7TT/2f/Iwwd/uFWGziwBtDZ5TB7uWcvrnMmZndnsb9bFJ0d3Z4u/GQ1B
	R+o38SllFEzJxytoiiS7EI6vdnYYbUhqyWGNSHR9n82mW2EEoWTBjecTjnrQA4NWnK2i+SL7Gjl
	xpTvY2eT/J4xqw+fN4r+gdZLalaxACLrXV3SQrR64koCI9uCx0CsjirwvVSidDJr9WZFWS+ZbXF
	+bp1oq9GM2MhIkdzBf8Uj3luSR9pvNk5jdke3amweivO6Pj+bc9hBH6hpPKPZ0110OX6AI9AlEl
	+pWmiQAaSecc2zh5FSdCkrPputMsRuYLiy8SJhe/4HLTfWtqDc0UgCDYJQRzNCzkpMxm4gETGpL
	z2+BG9+SFk6wwrlvmzZE/9Kdrb3uzhDPXMXLvJydaiMo77aku5kPVtkqeWZq0gRWEaGbLsPQRPN
	FdTNpFuc2hB6Drx1mrvf+76qnxNuZhG9P90yfwyRQw4
X-Received: by 2002:a05:6a00:124c:b0:874:706d:8572 with SMTP id d2e1a72fcca58-8874d979000mr800957b3a.35.1790767150679;
        Wed, 30 Sep 2026 04:19:10 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887253992a9sm650257b3a.17.2026.09.30.04.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:19:10 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v3 4/4] ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
Date: Wed, 30 Sep 2026 19:18:13 +0800
Message-ID: <20260930111813.52396-5-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930111813.52396-1-chou.cosmo@gmail.com>
References: <20260930111813.52396-1-chou.cosmo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_041911_635832_4B1DE21A 
X-CRM114-Status: GOOD (  10.01  )
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

Add alternative ISL1208 RTC at address 0x6f to support boards populated
with the ISL1208 instead of the primary PCF85263 at 0x51.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index 1883bfb850fb..76b7117344de 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -1269,6 +1269,11 @@ eeprom@56 {
 		compatible = "atmel,24c64";
 		reg = <0x56>;
 	};
+
+	rtc@6f {
+		compatible = "isil,isl1208";
+		reg = <0x6f>;
+	};
 };
 
 &i2c7 {
-- 
2.43.0


