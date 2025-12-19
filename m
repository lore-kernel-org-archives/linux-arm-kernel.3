Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5C7D74964
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPIX0W/QwqFfqblc/FqF0IeuPkn1Wyp+rRntpvN5lJ4=; b=oQzlvtKk0ubzfn/QkuTA1zkfwz
	OmCKIGXzLSI0jOkNitOVNe5ua2cZvsY3IHE0L1uCWE9YmA/A4IDbvoFfmhr8Hm0BU2QhamfObs/g/
	Lqq27J0XxD+J2vGuDAVNuDh9J0qnfw32+SbU+AkfJ2A7pXYjXT6/Iim5KcKN7mw5R0nrzAwp7awnE
	vAtWWo6J63O+NNYZQ8MCgU5qfvRJoiMFylEIao562FsZP8OXejtZPkdinTqDS2Upy4b5IV18OA7Pp
	qgag/fd2yvym7x7s5kEMyfVT6z9ywM5QW4OVL9gYahomgO0cuKLXnl0foPs32ZU/qyMWR00+U+snf
	AVI7R2zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVZ1-00000009oC3-0Pjn;
	Fri, 19 Dec 2025 08:10:15 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVYy-00000009o9X-01fg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 08:10:13 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso1319088b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 00:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766131811; x=1766736611; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPIX0W/QwqFfqblc/FqF0IeuPkn1Wyp+rRntpvN5lJ4=;
        b=l3efyZzkMMwt+hPm/T8u53vx8V9ZSeuz47MSw0UhYxvIpV/1bxJjU7vk0hQBlYfKRZ
         Rvj2aji1CU+YDmHlS4Fc3lf9jLe4Mu3oYGE/htSIDq4s/haXc7Gw3wEng3+4CxnEKsqz
         46tqac3c2Ij3Uh62MoXIiJEIkOyBY7UfZwMIFx03+jvdKDQ40fWaZk8qhDjWT9We8sH1
         PxCrDwy6fOMMzyGNFP5fOmA8/NFlIxhF+rqhIoD+uER7t9KC2J5ZxoEhmVYsDMfD4XSn
         eXJYHepdMXSKEiPFQejIgTSNAZzCjpfWIbClaG4de0EwCmq7+R3SYwGmg2zhkzGa4Pr1
         SGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766131811; x=1766736611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uPIX0W/QwqFfqblc/FqF0IeuPkn1Wyp+rRntpvN5lJ4=;
        b=ENLV0I5ohcvn2mQ01JYv4PO4HqRLiDuavZbYPEVv/vg5FZVd+JXNvdMd63Oeot46cq
         qMqeDATMszLBDBsM9uZvMLoTP1/eXs88tvXnCCDQLDct50F1nQu5HqwhtuNcaODsYNkx
         M1B3CU46/BOgxs/QVdAMISDTNRO9nzMucJyResDbQOa7CXdm4n3prOgyD6sgZ5qASJmi
         SP4o+C0sSqH/+LwfL6MImuZMZK0RHHqGNdwzmQ1n2iI/TpZszNfenNJKoBCoN/fH6Pmq
         /6PsAJXiYmEZEMxDS35PBw7NL0SB2HFJKfdaleIc7Jxdj8Tq93MQcDft93Zw4Pv3AHLT
         Wxig==
X-Forwarded-Encrypted: i=1; AJvYcCXlUTr8MgERa6SZ9tEk1YpIMqigwDEKjBS6lD1XDKkpfNRv6iu78V7U3XywTM8TPndTq6KetD+/OeTGWu/GnDOx@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9soO+XAwsZyVG3hI2KKzrv5PGnJRnKqyki0LiGQAuJEOMczMH
	RBMqnjkCrIV4ewDUa+jMxEoJF8iOJnefximLQMWrJ+BlaVpCNbMBrmmAEHz+JzBw
X-Gm-Gg: AY/fxX5GcbyCK7R9TVDjMrgmG8f59e9Au/oHsKwY6zp9uPISuNu8d/PHnmFvczWhDVW
	bQYNQYjCVq+gQF+ZhFYg3CzBXhg3W4ym5CvWjnK+G+yjOT646N8NozwsoO/4xy6rCaNAg35un4U
	8o0tjWA4juLON1sepukJdx2NA48X1jRQusIsWw/DnRG0fLUNLWia42I4U3E6dMSbpQc8um+8EQ/
	XQPMFRAZapJ50JKnZpPyK51RmcjLVMhP3EwlJnPJrsGzGsmS6Z45aMcEofrkCYfFf1lB2jujvJT
	ISeYDlAiFhJgrgktGh/B740Z44vMgKOfin1k7e2i4ic7yzHxhAYspipGIGwTE26cXsjpjWnka9y
	+Hm3ei15jGvZjlAEZqlKwdaLiUz3vA/pes8ViTAqyxQCZeDOWjoplt7N+Q0gRc4ZR81QheOQqGy
	Z2shhBdKaqCTbr7Y4NzwzJDJ0jDc+u2SCt46MmOvw9Ms14743ze2jwai2OHII4xwhw/tO3pZerh
	WR15V4Kewg0fXWTeAeyTxWceyhksiHtx1/gc5ScACuUcmhgMwesYV987Geyos17k6ptuF/Dp967
	Mmt1F5jp/5w=
X-Google-Smtp-Source: AGHT+IF87dMR0WTlxFT+/7+Q4zUVJL2d6oeF6cDExs7FgCtve1jDteHOK3glUIJGSLFIIdCOD5Huyw==
X-Received: by 2002:a05:6a00:b904:b0:7ab:6fdb:1d40 with SMTP id d2e1a72fcca58-7ff64211d5dmr2128649b3a.3.1766131811124;
        Fri, 19 Dec 2025 00:10:11 -0800 (PST)
Received: from 2001-b400-e3ff-afb4-41b8-b31c-89b3-0a14.emome-ip6.hinet.net (2001-b400-e3ff-afb4-41b8-b31c-89b3-0a14.emome-ip6.hinet.net. [2001:b400:e3ff:afb4:41b8:b31c:89b3:a14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b423d86sm1597274b3a.26.2025.12.19.00.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 00:10:10 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 19 Dec 2025 16:09:57 +0800
Subject: [PATCH v3 4/5] ARM: dts: aspeed: yosemite5: Add ipmb node for OCP
 debug card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-yv5_revise_dts-v3-4-ca1d5a382013@gmail.com>
References: <20251219-yv5_revise_dts-v3-0-ca1d5a382013@gmail.com>
In-Reply-To: <20251219-yv5_revise_dts-v3-0-ca1d5a382013@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766131796; l=881;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=MUMRve3kRE7pUB71SRAZkcB7pmeSsMqBTIHoXuxoOoA=;
 b=bBod9LQ2/l1kdPXL0FiT4KKMhkm7xMnJ7m3S7Ae0Xy/Iis5bj+nUNmVS1UUStudh2mGaqBoeQ
 aqDClYKp1g3Bj+g1OiRNd9fryaRH8FVrcvjYcUTwcgW3B8YpAP5hyub
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001012_075296_DB22E8AC 
X-CRM114-Status: GOOD (  11.49  )
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

Add the device tree node to enable the IPMB interface used by
the OCP debug card.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 983aebc394d9159c7e3db2e7c39e963f7b64c855..84d3731b17f7c7c87338672bbcc859de2b89b722 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -365,7 +365,14 @@ i2c6mux0ch3: i2c@3 {
 
 /* SCM CPLD I2C */
 &i2c7 {
+	multi-master;
 	status = "okay";
+
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
 };
 
 &i2c8 {

-- 
2.52.0


