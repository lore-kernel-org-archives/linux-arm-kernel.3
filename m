Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92C6CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 10:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eja/Sr2qjuVkf9pl7iOKbeZKj1qoBUOEtTGkXbe6Dbk=; b=1VOXBB8NhWg+qRyDmIFsy9lcgV
	3wCU6VBrrszxa8hmUaiZGhCjCMT01qcpuctM+7vTk++PCyQ38QHMDc4miNKyYKHw2AXu/qryEDw6Y
	RBl1k7hDNluReBETL8XVpMsQ1DmY4m0mq7LtmP+XRo1nhX1+HA07DQ0LTw/Lr5txdzO+QG4yK9SLc
	qJ/uODlexe64szMmqsf5iPQbl7+CUDn84yrlZv4wyY1dicuJ+kovUHX7c8IE5VLk9rjhW/cBgZSDp
	rm7nZeGiqq/VdaspbmsdOSDgLR7/D03oaRAZz2IEDbDR+hkrJ/nOSEfBPQFLHFRdbTeced1qH9d/J
	qp1bhJWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJ6z-00000007lEO-2BPf;
	Sat, 30 Aug 2025 10:47:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIoR-00000007jxL-0vST
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 10:28:00 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b869d3571so165155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 03:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756549678; x=1757154478; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eja/Sr2qjuVkf9pl7iOKbeZKj1qoBUOEtTGkXbe6Dbk=;
        b=MprG3QyLuEgJnWHtCBIXZD8lfnw7GzveG3bZ6jg3qEb7m81TmE/Hgk30m1hSabrXoW
         A30hObFPbexyhoxARVP5Xv0LgBOtNNIB6JR5e68Lu1pm7fIpc53Gzvam3zE9pxHzlnxN
         1gvVmEKezThGKP/jrG++5bfU1HwO2MbWBFWZ9YpLqdQC+8smlj3OMZqb2hmrZ9WldAQo
         DG76jCda2K69gd2bxWxDA71gpN8CSo+Sz72TIOKcc6tuNNy/6jXK8dyOTWhArJ49J2L8
         QvGJM/Hsl1olANigPfTnc6LGVGZEAY0xTPc8uklS9ZCNVm0jpoX3H0iCXOh2EVrlylbS
         gWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756549678; x=1757154478;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eja/Sr2qjuVkf9pl7iOKbeZKj1qoBUOEtTGkXbe6Dbk=;
        b=qUYSz3YPAS+FTin4WR57nwGERWOqhSGk9OFVo+mO6rEv7u+VcLKBiAeRCHRtW3H4LN
         pp39NrSvGkk673+4y2FT16L9mPEloQg618umOXKT8EUIkG4plGIjb9Z7KyW6BtgX+trq
         ldtRmk2jG/0oUsz9ZudSBW5LPfr8QHy73DV59TdNcuSg7Fk7OHUPLfGPfna4v6BIg6U+
         v9Fh1XI56h+zJ0mF7CQGU6t/LqdxF3qpBrSerqbO/o0RMVyn07GVa7acRTXZIpH7O+1A
         rJ3q+Yky/W0xsrs8vYDhsr1/qm1Vvh4kEMNO9RZhAuNPGJfzhEuwWgvWOc6YNmFHRe+T
         CvPg==
X-Gm-Message-State: AOJu0YwNnJHS/vx9DAzM6/nZ4VDFUecuIst61I6FX1HZ/E3HCokq5ZLq
	HNd6btPG70u5JlgYz3wy72a75uOWDHTVZd/nyo+MgkQCMefawH7EOfS/
X-Gm-Gg: ASbGncv5Qw+1V5gByCXfuJcS+Trq/nUow74+nOWvqLGNXVXUVxDHYAYtqqhZbFibBBV
	2utS7PdryyX7OpVP4SOoCTBdmycWlMLtCvP7PG3tKwiO68VSDjS9D4n6+b9dO2H0PTFVjAIjjtN
	J9ZNbqZ4x8ygXIzot1pfA4VbNfSHdfjjGXredS13OvO4q9Pdm6TvTUflYyYJcjfKN1YJPaeHQ8Q
	G69fv0xYmckbtOvkY6SboTw0IHbzVWBY5fHOt3BMrwPCCzXQeZWrvkhuG+Qf63W76ZSTTxcGVso
	JCfxD1gcSZq9h4x/e5ejx25j07kETz/Y1wdatJfGj5PWLK4NyKi8KonFetmdORWl/R0RZjxIm35
	Mco6CU37VR1NlhpgJh5nxXKjHhG9SD2WiygPaQQHA0X4+Ch8mzHlgZGLS17sCN6OGCzz+icD+tF
	aVGQOnkcHGzh3/vHWMIeKap8v9jBrosDYkmtukNDrIyTMjAZU6RCN3HCQI6v3NDtHDuI4=
X-Google-Smtp-Source: AGHT+IEbinJMv0Q50yWLcSQLB4WIKLpbG3dkEZKOAzvtHVjw3gGu6LpEKbKaKP2RsWcyI8GyeNhlCw==
X-Received: by 2002:a05:600c:1f08:b0:45b:7bba:c7b5 with SMTP id 5b1f17b1804b1-45b8557c880mr10933925e9.28.1756549677730;
        Sat, 30 Aug 2025 03:27:57 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f2f:9b00:80c:a2fc:7bcf:3a2? (p200300ea8f2f9b00080ca2fc7bcf03a2.dip0.t-ipconnect.de. [2003:ea:8f2f:9b00:80c:a2fc:7bcf:3a2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b8525a94bsm23354035e9.15.2025.08.30.03.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 03:27:57 -0700 (PDT)
Message-ID: <7427825b-7d2f-4edb-a357-fa5eabb6d7d7@gmail.com>
Date: Sat, 30 Aug 2025 12:28:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 2/5] ARM: dts: ls1021a: switch to new fixed-link
 binding
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <a3c2f8d3-36e6-4411-9526-78abbc60e1da@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <a3c2f8d3-36e6-4411-9526-78abbc60e1da@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_032759_298591_080AC1C5 
X-CRM114-Status: GOOD (  12.71  )
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

The old array-type fixed-link binding has been deprecated
for more than 10 yrs. Switch to the new binding.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-iot.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-iot.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-iot.dts
index e13ccae62..8d2438498 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-iot.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-iot.dts
@@ -120,7 +120,10 @@ &enet1 {
 };
 
 &enet2 {
-	fixed-link = <0 1 1000 0 0>;
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
 	phy-connection-type = "rgmii-id";
 	status = "okay";
 };
-- 
2.51.0



