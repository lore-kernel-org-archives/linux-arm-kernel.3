Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE35CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kzk/r6qDbrjCsGLz+9BLRYG0Pw9EztKEkl/jY+qfPQI=; b=HCDvi7WUXrLF5Ms4QyCDHqw+ie
	WyhyUCv/nHARt1jm/JcSay1jRdy19eGnr5b19JoQsNC3vA0nSee0liIM/XCgtZ2giUsDLfKokQHxn
	roy1nQR5fX/doneH7M/ogUwiCt3FdmN1fbSBONv/BTc6YKUWWURCgnaVUn0Oj5ii7Dlu9kxRTLg6H
	IxpdzrNzWSC6sk6fwS1rRrukLih0rPdGpxqzIKeqao/S4n0RKjfDptIVdl6XYaUGqitO4bmnXU/58
	OUAgp7rEwskfo1HfVP6gTq7bok/haxuVEts0ImRmV1ydnZM2mW/rDIesfAkHqXJf3dJwjcFbDO30l
	XCDIaRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92fK-00000001vlS-29I5;
	Wed, 15 Oct 2025 14:39:46 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92fG-00000001vgv-0WfR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:39:44 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b57d93ae3b0so4031231a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760539181; x=1761143981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kzk/r6qDbrjCsGLz+9BLRYG0Pw9EztKEkl/jY+qfPQI=;
        b=nPNA5JtTWws3bSYEThSbhAue+XKWvvG38Ir/rYvNEXtuCv7TKozEdMxVsV30XOuXKZ
         vl9W8qo4r8RGc5a3ezX8m3d/Q5p9y8u62fQH4HaeKyjDV+4GRT+GgRxu3aTSyqcZ5Tg/
         weFXDdArqGG/c1A51gp7EfYrvgW0UT379sAc305UKps7HxIXBHmarrY9nBSv6lwMrsXW
         9MY021hY8W7MC4mFNYMM0+JVreVkqo5sh8ugry79Wr1UrQs7PCz3kwgg4nchgJL8n3np
         zJ3iDw3J47yxaiU8W1mmlzENlOrNt9OS+rTexDOzbObSxKj5/++uwSiswoVaqBr6gYH5
         /cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539181; x=1761143981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kzk/r6qDbrjCsGLz+9BLRYG0Pw9EztKEkl/jY+qfPQI=;
        b=gHazFZTCw5iM2MY2bNj1jqN3NR8WZ8ZpfnFta8Msi8eIfaT+Q173IjYMO6GeaXH4E1
         8odqr9w+BZA1uEHjDqCQidTVdL7mHuJZkCwiWmIYsQ4zuurBjmKx4qlUf4ZHT0mSBXa8
         izOOI1NRvin1Di+ZfeDpVIYZvbJRX+BV/GuksVqUJ91NF/zD2fjA5XY8Gg39AR/ZYdDm
         k78F5YHSC8zsSFOzFas90Eu3lJiuR1ktpu99sE83lRhoIrxfFSol5Qjbr3x3ZjTZRxhV
         2AMdAV81wamSgCBxIDjPEg9QFUZBtlGllqCXfj+4zvvR6EtyBGR8wEsaD1UMn+BdVcIM
         WgLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOi83mleyQJc1PY9SOyLEhhS3xhzyv9GBFaPNcNJxS5YzAWleO5WiGI864mdofzf3QszDAcvo+IqqoywP+LKnQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyhhEtIkVsd5NYFnAwDUUVZ+p6AEBAiM5riL2TsvXt4lHH2j3Pg
	zJ6KnnI25F+qJg7E1iKTgbmPilc52EXg+4KDqQLK0gDbqyWCoUSWJgdV
X-Gm-Gg: ASbGncuuofGUOVai1rsSq4iBjtECgVq82ClyDX6DHiZZVVvOClP/0I8GK0Q+gBKOdTF
	BXGHLg5P0OqHlbR9/yadOK+oqdb/Ia4lW9Om0YIEBd+nDFaRv06jDGEvJh8zgRbtpcOFD7g9c0r
	P/tEvmdt+o+zYzmLz/H1urPYod2HXaBigQM2LItwLvYxTeAABG32bq7L8Bqmk9aO9uul/nutBF+
	g9MEyEBuVQunBu6Mfnagq0cPYvnZaz6vSpyCKTiHU2odKFLT9Ekegv+oJlHxhoIfnIUyPGnEsYa
	xdwc6ljHcpUMX4OnRfawR/7+keMN8p7spgtmut6OzZTNzie/QAnTeHoZTKewx6wVg+9syvQRpxI
	4T08QrIo1N4BYs7l3vLJiZuTYBumN0RzxYR8AW4CktATMcb4ZUyPDVsoBEjDfD9yVNl1CgxsPyo
	dBTukA90lFqh3RYW0xxx26g0KvL/FTUp2Pw6isd5QY
X-Google-Smtp-Source: AGHT+IEgWdXuvMnKWxO634nbjJzRkHVq3PW7xVSf2LL3eQamnskf+/AR2cdTFIKYZHqt7ErlAtLOOA==
X-Received: by 2002:a17:902:ef11:b0:251:5900:9803 with SMTP id d9443c01a7336-2902723b876mr366239335ad.21.1760539181325;
        Wed, 15 Oct 2025 07:39:41 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36738sm199853455ad.87.2025.10.15.07.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 07:39:41 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/7] ARM: dts: aspeed: santabarbara: Add AMD APML interface support
Date: Wed, 15 Oct 2025 22:39:02 +0800
Message-ID: <20251015143916.1850450-7-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251015143916.1850450-1-fredchen.openbmc@gmail.com>
References: <20251015143916.1850450-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_073942_194138_EEFEBC04 
X-CRM114-Status: GOOD (  11.28  )
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

Enable AMD APML related features
 - add amd sbrmi node for SoC power reading
 - add amd sbtsi node for SoC temperature reading
 - rename the P0_I3C_APML_ALERT_L GPIO to align with the naming
   convention expected by the AMD APML tool

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-santabarbara.dts  | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 3f36c8e03f48..3ca5109af19b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -329,6 +329,20 @@ gpio@26 {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	sbrmi@3c {
+		compatible = "amd,sbrmi";
+		reg = <0x3c>;
+	};
+
+	sbtsi@4c {
+		compatible = "amd,sbtsi";
+		reg = <0x4c>;
+	};
+};
+
 &i2c4 {
 	status = "okay";
 
@@ -1755,7 +1769,7 @@ &sgpiom0 {
 	"P12V_SCM_ADC_ALERT","",
 	"CPU0_REGS_I2C_ALERT_N","",
 	"FM_RTC_ALERT_N","",
-	"APML_CPU0_ALERT_R_N","",
+	"P0_I3C_APML_ALERT_L","",
 	/*J0-J3 line 144-151*/
 	"SMB_RJ45_FIO_TMP_ALERT","",
 	"FM_SMB_ALERT_MCIO_0A_N","",
-- 
2.49.0


