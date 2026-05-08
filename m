Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A171CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AZLkoMPXwZ4+vxuE7rGxM/UFbOO9EmAVj39oI/ALNs=; b=3Fx+FLxJUqe8FoM6oSejEi+5Ef
	L61Ciod9v7YRyUO4OyiDFke2WTiUaOOmywvhWjhlsPhBHXOCqchAtmMbnJUgKrS+d1JikDVigFEfw
	+44MdSjG6p/ykjbbkktTRudcqoX4yPGEvWIoWRFhluilF66/UcQpK9khtHqf5HPClAHitx+1PF5ar
	RsSnlczMLvTl3j/dl76VGzcMbqQvsjimnTxsyeo+2u0T7tZoLmXnlOHdHEhkOsVKzKV2z2pDcLZ7u
	5rykXb3+q08wZ01ggryYO5HKGs9m8C1rkBM9BHQ/XZ0BDNOHLLdZIcyPfhSwPKCIvpc8VUN9kmBla
	YpZGrpdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN6f-00000006pJV-1a4F;
	Fri, 08 May 2026 15:27:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN6e-00000006pJ0-2QOH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 15:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6AZLkoMPXwZ4+vxuE7rGxM/UFbOO9EmAVj39oI/ALNs=; b=FL1VwJZ6zwmrn9gJdgRu7VNe/P
	ZTNJGBBWpAwvnJ8vcHq3QSNoXE+4T3h9RXGaO2ZWUiT1mxwYyzV2DSUmTqK0KektAYidH0c5GmhXm
	RlkFMyl65e9G5YnF40wbLCCycApmeGkkM+BIIte3ko6x84lW7kkuhcaVeeODJOX8xFpTTeWxgGIDW
	1iCu7oqEGzDJ+3YaM0xY8PFOiByUdJS6ePF9ee6N1BNpgnz46oaciGkCkx21P2D2q2KZkCBdHXE3W
	9q8+8dmaKUqWlh7kxQooCWVQQlOojcYD3EBjzcTgXx45TQN+wDRsarXeKwHc1ZozGMFqGPdDJq+fc
	qq8XUT7A==;
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN6a-00000006hHh-3B1S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:27:11 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2c156c4a9efso2871289eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 08:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778254027; x=1778858827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AZLkoMPXwZ4+vxuE7rGxM/UFbOO9EmAVj39oI/ALNs=;
        b=cVs66YUswwE4NpW2EhtSHzuxacotEhTXj4CEJm0sC8i//c+s3j/FI0oWpH4eVQEhCU
         vJn2vJfZLgSWvAeq189QLQdhl51r2me5nVlop6P4LQen1niDIGTVdniFNg3HBW54pbNb
         l/wRQ3yYLcUUDi7YqPvlBmJVE0A1N6owLySLs8Z/6sE3B8286nVrGhCLzSQhaPzoUgWD
         pw/VbOAU8K1uHvrSa9LVhppBLkVpUE74wOEMpBOZtDxmaioAf7OhBeB16URQAQ9Cfv36
         o6tynM+SWbObddKx3Lukmkx7dIN7cCpdDYkU6TkZTttyB5KHbxiMYheu+jCWvOYjLIuv
         edMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778254027; x=1778858827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6AZLkoMPXwZ4+vxuE7rGxM/UFbOO9EmAVj39oI/ALNs=;
        b=KkhSAw2QFLrZotPBt1zcOCV8bUE9kjV/Zoumflas71IDHXmCDnb8lTlhaLS+QcFn3k
         mKGQ2Cv34mO3SC1kmd7cPqQjXnIHkxCdSx0boaC7VdFx+LgM1WlK7oClE1P8r9OqFuNh
         cZe68r1NLIm/qUOZy62EGsftg1kgQI2Hszha6G8Qhn7dJFeDyXQSZ2hlzVnkUCd+l0QY
         E/C+owhbbElI2J35AQim8i5d9/GWFqqAmR8patp2CXahOAvAPam4DygJL1epWFo2oD5G
         0DvWQomqES6cgjtuG3GhD/subeuWKJORFZTCRFYLqbtFfN9K8hThK8EdKbzF8sOIRx3k
         Fw7w==
X-Forwarded-Encrypted: i=1; AFNElJ+fpLFNiNOYC7z+p+bA0CjxvatKYiSsjDrbVxCs+9wh9tHjBCtHB/cq34KTzRdSD8afY5cipw6kaCqH0QkfQdXj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+sXECz2+cJhA0XnisgtU5XV08Tam2350JIE2ru+i7RjWK72Ze
	AcdoYvGir9YRQacALQB1aJSshvn9007mNE6QzFG28JOqq4paTgbyk4+q
X-Gm-Gg: Acq92OHwVc+zaGRPka6CJUeEX+rDujZDu44znZwmJqoHVZSkP5EsyBSga/R9ISZoKWy
	KXMB9Ur2HQw+Mb7jTMEHFaIteDA8cdZAhQtCwzY9Ajna2o8iEYCq4OVh937Mtln84gez23robPe
	P9U6wfDeQVjZhLe9DYqwK0tzAE9V1lROXFQcSlaSBO1AV3LPCDOhgDr1nuTwMIdvJk5aLlBlSPz
	SkteFVZOmez1QPmdJGO18LI8UBX7jMYWURcU79fTjDAzlUThEx8gf1/yvkvlqO/96IZhok38aS5
	qlkusr2ch4mTQmwuSPxc+C6/uBIArgjjN3wSdqk2H0AUZykRviq4HXStnoafYQONnEJkP3B/mBj
	Tf8H3Qom4fmaSP6JH03L5IWhxATtmQGqmfemcqp0pzMHWr+EiRgudRXyR0W8i7/PQ99CwULRybQ
	Ko/d3qkAxBtlQvvvjCOrmJ6et+2j8VrvcmueQ+ZtLqDOlhGZA=
X-Received: by 2002:a05:7301:1014:b0:2f2:8857:180a with SMTP id 5a478bee46e88-2f54d69aff2mr5899190eec.7.1778254026776;
        Fri, 08 May 2026 08:27:06 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm2535486eec.11.2026.05.08.08.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:27:06 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Wei Xu <xuwei5@hisilicon.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre TORGUE <alexandre.torgue@st.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Romain Perier <romain.perier@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/5] ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193 shutdown GPIO polarity
Date: Fri,  8 May 2026 23:24:21 +0800
Message-ID: <20260508152435.21389-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508152435.21389-1-jerrysteve1101@gmail.com>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_162709_330318_3B8A2509 
X-CRM114-Status: GOOD (  12.98  )
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

The sn3193 shutdown pin is active-low[1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf

Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
index 258bbbecd927..c528d42bade5 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
@@ -147,7 +147,7 @@ led-controller@68 {
 		compatible = "si-en,sn3193";
 		reg = <0x68>;
 
-		shutdown-gpios = <&tlmm 45 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&tlmm 45 GPIO_ACTIVE_LOW>;
 
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.54.0


