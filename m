Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB4BCA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 07:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bx0HUPagVnZ+U8BFdJ9INMhdQD62bMvRUffwK7m8W24=; b=ggzRuw4arY8VKRFYZ5gbTUudVG
	uiVet229BMovqMOdd2PZ7FoDWJH86psw9OkB6KFozDackEJxuAiMzcTdVAYQim9uu2WFpLR8GR+3H
	tCEDejICCghh8yYvX4bGmn6UqKwFLM0956aTAiLqZPBsCGx79b65P4R5UQOkKiMVpn8fcS/BGwI0g
	yz3ukBrnU9y+IjwmCoM54aU08VA1iasibRVvyeoKet6i8dAI1I43kmlGfwP1P7+R/d0hv3bHiTSO9
	cjerNvwYdbrbfa6uYg/VLx1dpEAyFc9WD0HIbW7uPIl1y2wg5bz/hiW/0EL6WkTwYpeHJB+ZOxOWY
	7W2lDPRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulN8g-00000006jTG-14sR;
	Mon, 11 Aug 2025 07:40:14 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulN10-00000006iNZ-1nGR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 07:32:19 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-24041a39005so25354865ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 00:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754897538; x=1755502338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bx0HUPagVnZ+U8BFdJ9INMhdQD62bMvRUffwK7m8W24=;
        b=QOyp7Py8dgcJK5PtK/0dMndYjQT9aeIux7bJjNnns7LnPF0JeLkAbQoUOLqIFzUrQI
         y62MXBv9N96k1lJ/Nfm83RKHHoS3JymScGs+rgd56GRAvKM7dsd4Z9PoxlJqYjjDRRkB
         ZeOCRXdwr+hUNm33+1rajSyj+5nJB3+8kgePIpQOuLxBa2q0GvoEpYaBk3TY+JfQzHQ5
         ccuTamdHM7ajfsfwmn2c97mDEot6QuLqsiGu0+cwAh3H9tEny9KNQ1JtQ8ZX8rjRbjbF
         B5lhBJwQXtN+V137DC8kwaBbUQTiNJVR95efiocMeKRFvZ6qwRQPvOR8vV4AjPxpg5sH
         PBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754897538; x=1755502338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bx0HUPagVnZ+U8BFdJ9INMhdQD62bMvRUffwK7m8W24=;
        b=mRovT1LJt2Ok6/TRQ3JMNQWdAOcABQZv7n7X4VTp8vDQVAGYIZxQa9xWGy9RD10R0C
         eZ5HSJoesbo7QzjqAyBwTcN/jpVlhZj1SwQXxi+24YUuf3vkBgsgeM4UxcgMtS5UgAE/
         ahjvhFqdPdUl+RyFVpGoxGpcb2g6/3KgzVnHyUqTNeoWiN9Fg7vM6gG8RLVCbUNeIIry
         wDMx2fr1BAR2yC0q77a+ud1xYZ/EPfa9KfLO2g45xMIiftQN1aXi89G/CplMZwETu8a3
         XtYRqUhlcEa3RUx6iVVdnHRy+kWDpOB+0M9a3fWPN+zXoE2S5HhwivVxY1wnz0nHxM9C
         x6pg==
X-Forwarded-Encrypted: i=1; AJvYcCXzdztBwc7KX5+W9muUL/884HR0h5IYWvM0Z1RDHNm5H9M3VPehyujTBIgIoHFM1VIcgv1HA6zVHyh1GBVyj0od@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnw7WejJnrfdmcTLOLhF/vK5D9fh5RZni65F8q23P24c7YT+mI
	fWC3tSB8CKESuTfipoc3ILv9k8lBAS9kj6jHiQhouUSxzr/xWbgDDS2R
X-Gm-Gg: ASbGncsM3WjBEzROkt6VXzDEWrrWE0Mt5VORCFpC8GdfVh7LtcilpZYkKHRBxw6viUN
	YpG9Vb8NRofqOGU7UsqjCTfUsQYVRXgAW+SaTOzcX25gRMqrDHf6UTT3FdWRDpWPjZvC5jkXF0f
	aBmSLiHicSzV+ci9qm91Q8SbnPsN3UU271YUnoDLBZevdWNCwqZsqlUpAEo+eCtjAWg8EN8sG+Q
	L+WFVAhB2BLpCFClzfflVbovAYXxw0LeFziorFv+Bkx+GtXTFtIWDc6YVN+LJNp39aRN7jWyNlJ
	upxA6FhDZg6eeYbZ8+HE/LjozgvmJuzY+nlPRcnft/55DeUUrHwx3EiWS6jBccpkcPYStynuix5
	qKzgBENKqTiXn8Vjb6T4o7P11W/bBSRKkdk4XgTZ6cMOoJJGAcAjtkF/z1oaxLJvtMEs/eYhVOQ
	tunTsJhXRWFKJggC7HWHbLnA+NMstx
X-Google-Smtp-Source: AGHT+IHw5o+Jkau6vl+zzP8wniWy1wnCha+yKhslleKKvxim75ReWEWO0PXV/5b8z7D2bbPKCN7MKw==
X-Received: by 2002:a17:902:ebc6:b0:242:9bbc:3644 with SMTP id d9443c01a7336-242c225a177mr160057395ad.54.1754897537580;
        Mon, 11 Aug 2025 00:32:17 -0700 (PDT)
Received: from peter-bmc.. (2001-b400-e388-d3b1-e90a-ba63-d547-4584.emome-ip6.hinet.net. [2001:b400:e388:d3b1:e90a:ba63:d547:4584])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef59b2sm267624575ad.7.2025.08.11.00.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:32:17 -0700 (PDT)
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
Subject: [PATCH v1 2/2] ARM: dts: aspeed: harma: revise gpio name
Date: Mon, 11 Aug 2025 15:32:07 +0800
Message-ID: <20250811073208.787063-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811073208.787063-1-peteryin.openbmc@gmail.com>
References: <20250811073208.787063-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_003218_465723_579E544C 
X-CRM114-Status: GOOD (  11.74  )
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
- Replace unnamed GPIOs with appropriate labels such as:
  - irq-pvddcore0-ocp-alert
  - irq-pvddcore1-ocp-alert
  - smi-control-n, nmi-control-n, etc.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 741d2d9b6d03..2622954d0ce3 100644
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
2.25.1


