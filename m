Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3668DE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 13:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmXfi4pLydKjD6u763/ay56dg5zTGdHbtmPA5MycJws=; b=UXxraBPqAThl8WoG2EUnTVKdrV
	WMHH6uDQddwM2YFob2pAsoPUxQk5iVKyJb3RvDuoriwXxNtb0pNflhxsvXck4wALSzt+iPBhYg0LG
	3XYRtCGWwWWf5b3HU+FPBmMUdfVFRMrK6JUCN1cp6p3Is20TGM9Yt1A4mTHXkazWagoEtoU+HXz7N
	AJe95rCgdmpf6AldDEiEejXzhIvt4++WL5nkx10PLHKwIfcP1NIqb+dpvJuI4TPTJTxU2Irt4Z5lw
	vF9BFbgcHTA/eitq2GSNbIeJjsq7AlHiVdx8hkdydJ7aWmywoFkrIS6VfeX72ccV3nIgs0ashH6Ag
	401nPs0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGI6-00000001uCx-0TVE;
	Thu, 19 Dec 2024 13:10:10 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGFv-00000001tod-1A0U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 13:07:57 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3862a921123so521615f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 05:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734613673; x=1735218473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmXfi4pLydKjD6u763/ay56dg5zTGdHbtmPA5MycJws=;
        b=dgWwa9BcbwBio0Xez+ob35T8kRw5v0iqeN5IKb4H41eowvBayREe3nN99VXvVd+PJy
         CMDCMDJw6dERANu9GqGbeqxjjSVcGHqVLDKGoxrwCj0K0sjYNS8Xg7ZsrdAENnzVpfAa
         WXlt/gKMo5ZBYH7+P/653fhdNznGRdlV/8LvESX8TYRrq29fAcn824ddrxmSpCrgcBzs
         AjBC7+VpfCvMhdUaWfZIJgblxaNpxeNJmX2Bz/1lTgcobdAJQ/T7baCGDFtex83MTpEt
         U72Yp/Np4DXNTcpQ26RJ5wmhSxamPk+QUp2bNV9s9yceAyDNWJ5r2K6at1/nLiQmKEVd
         zWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734613673; x=1735218473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmXfi4pLydKjD6u763/ay56dg5zTGdHbtmPA5MycJws=;
        b=RuAmRiOwSw+QRPuyoNl5zf7puI9GMWyOvvxK9OzIRESNIAw8GoDGJpfoK6EffiXdqi
         I0sZGBTiFpu3P8rDgYW3BTPEFPHSuctWydbjqVDUjSfP4TtpI+/+2CSs73ygUAG2x8My
         Gb1ZM4jj8SQgw1sMMkwCeVEERpbFY4XM5h8v0+jOq/CcGuGCUikhM7+bcgFth+xdLWMA
         rRmwRJkG4HNzOC74CaKh40fpVuZTA/lFnImPZR6a+W/AqEYSvyivgifs/NPr/DoEH01X
         acMr3WYdyZCKfCoJXQd9ou4ZconNiIn6ZNX99cMZcAFc+fgUss4F8yXDtPALYBR+jJY5
         Ze9g==
X-Forwarded-Encrypted: i=1; AJvYcCXiZQ/8csklJVlnuD7Qb6m9beg0lIWBfFVt9/sQ0mOGKAism30IF6+yEtw+cQdbcFLZAv3CIe/uIGnCU+KiinDP@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw5dWlIO5CFG7+AnU0uDKxAyUfVWdq5xHLmPOMrMqx48FskiFS
	LTrVb7yLBHwGM/4cMtWf3RXfwossSPYO+cOS2JeTFE2UvV6tMNNVp5wXu4ztpeU=
X-Gm-Gg: ASbGnctloG84zsPPqlA6pDdPDVxIWjWohlJlnBM5uYO+SgjzTOyqEPpuHkOohSq3ekH
	BlD7FyEvXhtZYn2HyIyE+56wbMynvxeTjeYyzQ5UvfODFiQ3nyXfDUU4Q2zPH3IefkxBDW6ZW2S
	B1O+JDrG4M4MYM8L2Pcm+ZvGgyENX4196Svz0bR3y+TxIQhKBwfY9avqgzxbmrsh++hZDc/DX3G
	t6/ODP/p4aMdqdGjBCtLoqE1kEQKhQDGN0hbCqbxsl88Hlz7WFFIrI5+CRWah8yDfsSRO+XT0+1
	ELLLxJWmmvh0M72bdJtC2nzzxBAJA4wbvtV7
X-Google-Smtp-Source: AGHT+IF40kzvTmeRV0SLh7JPWC/BmStsOxDXj25ZVmdU7p18eSuHRlcLVaylhOrmOqfz9B6DJ2UrcQ==
X-Received: by 2002:a5d:5f90:0:b0:385:f0c9:4b66 with SMTP id ffacd0b85a97d-388e4d64767mr6779273f8f.33.1734613673423;
        Thu, 19 Dec 2024 05:07:53 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm17436705e9.6.2024.12.19.05.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 05:07:52 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 19 Dec 2024 13:07:46 +0000
Subject: [PATCH 1/2] dt-bindings: mailbox: add support for referencing
 controllers solely by node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-mbox_request_channel_by_args-v1-1-617a6910f842@linaro.org>
References: <20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org>
In-Reply-To: <20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734613671; l=1946;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=1yf/YbX5zzLVOPLgM9Mf3iD1fLxwVX2uCkX7LRhP57Y=;
 b=73v7sR57R4aQx/YJWHUxGp/CxrhVmSD74UnblBJ4DVkdsJAKq1xaT2O5VdZSGL1GGLJRbSanH
 61XYqh9IhL6AXZvYy040Qec9Tor97M/d9bMF8JF4KqLS+B5w682WxlH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_050755_321041_1C1A2860 
X-CRM114-Status: GOOD (  12.47  )
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

There are mailbox clients that can discover the mailbox channel ID at
run-time. For such cases passing the channel identifier via DT is
redundant. Add support for referencing controllers solely by node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/mailbox.txt | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.txt b/Documentation/devicetree/bindings/mailbox/mailbox.txt
index af8ecee2ac68..0c4295a62f61 100644
--- a/Documentation/devicetree/bindings/mailbox/mailbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/mailbox.txt
@@ -5,9 +5,10 @@ assign appropriate mailbox channel to client drivers.
 
 * Mailbox Controller
 
-Required property:
-- #mbox-cells: Must be at least 1. Number of cells in a mailbox
-		specifier.
+Optional property:
+- #mbox-cells: Must be at least 1. Number of cells in a mailbox specifier.
+               The property becomes mandatory for the cases where the clients
+               reference the controller via the mboxes property.
 
 Example:
 	mailbox: mailbox {
@@ -19,7 +20,11 @@ Example:
 * Mailbox Client
 
 Required property:
+Clients must reference the mailbox controller either via the mboxes or mbox
+properties.
 - mboxes: List of phandle and mailbox channel specifiers.
+- mbox: phandle pointing to the controller. Used by clients that can discover
+        the channel identifiers at runtime.
 
 Optional property:
 - mbox-names: List of identifier strings for each mailbox channel.
@@ -29,7 +34,13 @@ Optional property:
 	  communication between the mailbox client and the remote.
 
 
-Example:
+Example using mbox:
+	power-management {
+		...
+		mbox = <&mailbox>;
+	};
+
+Example using mboxes:
 	pwr_cntrl: power {
 		...
 		mbox-names = "pwr-ctrl", "rpc";

-- 
2.47.1.613.gc27f4b7a9f-goog


