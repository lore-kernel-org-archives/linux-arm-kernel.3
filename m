Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E02C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 22:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cP+WTpE4W8v8NY7Cs3v3hmlxICGWZmJCYyEWKtyHvKA=; b=t1rqlxiKwnKABqKuSPd4AI9gPd
	bUPMM9TbsL0mFFwiBbDHS9cpoRf6FHKHVdyR6Lp3FvYTWOOiq/LnGsinl5XYW7QlMI8+v96+cGVce
	o6SWLcvf4DR0wzvo2MX11iVe3/GC4+S4EvSX47hDXTZjClodS+ISssXHy+qKSS4FAlPxxWZcVBXzN
	BkJQgQjnvevFfcDoLIJolE6vkdAY575jMVI03PNP32kMKU+vkUt7w9om8FdkqcrtjLN179x4pdDjQ
	0qpJzYUR3tmlpJsKeGL/aRkDc9SBww0PTenxytFxzNo6vaTVGRkNpfu/Ldkaqh0p+0Wtq+LIBOviH
	GHXOQxlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb5Fx-0000000DMRe-38vD;
	Thu, 23 Jan 2025 22:00:57 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb5Ed-0000000DMJY-3btX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 21:59:38 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3eb8db8ae9aso586957b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 13:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737669574; x=1738274374; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cP+WTpE4W8v8NY7Cs3v3hmlxICGWZmJCYyEWKtyHvKA=;
        b=rbXG9z5D6wyWtnyuRpynHPdChoz5RuMZ+BhvmGouyPfjshwgq5N0swBR2XsmLzPj0g
         YlbQ1ssgKuA+xt408QpUQcUgXRjjfvaPPLhgVOAHMrE6C/MtoEK/7zYzfsdlWgC/bufP
         xpErA/jeQaJxgQCFIXt3ttqB+3R3bvdtCabztza5rLUqeWfmz+kIZrYG1bRmJdhDK+GF
         rXzUImIGNnYjFHjhXnUsgorZ7kPLx340flVNdoUGG7oLi6hVYg8odfNrNOPPNHQVwjPw
         6Be8I3GBY/0tM65yW99fuNJt8NSwC2zLkO+PMmx0P7dqGWDuUtqsPU5ZLFKVVQeiUw3r
         ODBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737669574; x=1738274374;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cP+WTpE4W8v8NY7Cs3v3hmlxICGWZmJCYyEWKtyHvKA=;
        b=t44d9Pd7LqqFIP4r/FLBMVweSf8mvlnlORQGyDZo2ePinguyQ41th9pQCWvOQ8CYNC
         lL47hgeuwf8AwJaR+CTgZds4b2zfw3c8N74STV7aD+TDu0zWyGDxTYeBHu7olu7suAYh
         ydyxfGdLEhh55x68nlTc/SY8uJ3f0UsvOeDnC4+hPLQWjrbjvXzewQu2YPR2O3E5kB34
         s7KOE+DCKAgVR8UWoWnelpfUtQ7KiLnW1USYjeIEhk9cBu4M1KtvibKcwmzWbn8dFvZn
         fWwsHYd2CXZjPUIM2SObG6UAE90iJu/mUfccIW6IULKRKmiVKmt3EK1v+PgkYdeJCBwb
         PslA==
X-Forwarded-Encrypted: i=1; AJvYcCWhuggth+KDkxvYk3SnrzkS/uJauSmQKLs40chNQUtq749PxGNeFS+Tc9E3+DXu7CPJ8a/26pR4QTLui0x3CG6y@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9wah9/K4tgnmhte8rSjniD0X90b5NGvkIw+WvDvtqSQpvRmTA
	FEfZR29GBrCEZmtG+utFFI86hA9SC03mN7t+yE4AFGu5mbJ7fN/kZkIbaV31w4Q=
X-Gm-Gg: ASbGncsdX7uujMIp9SOIykfWtsOEkk+j85L0fOB4SyqOQS82ow7AEIhQNTpwm0KYdrk
	797qn2aZYxiFcfqExk4lkSKwaAlAlrUWGxl/8as+SI7poAG9i8CsJk2e2tCP+wxug6C66Tr3uXI
	TY4OKbfQnV/FY6Jq5biTJclidTQZuDPFq/AZsTf4B1qfeDlRJ2B30gxLl/U9d4PxXkMbPr51r5z
	X5lKyeqQY6I1BKLw0F5ZBwpqYrDLBWgbfUq9ExVvo9Z4lw178V6J7qsyKOVRDuc9AVOXrFkv72c
	wduqT3zoWIdp50zCiJQcbCgo/+jVUMUFcGSkYQKUrA==
X-Google-Smtp-Source: AGHT+IFJIxtCrItmKDeZa+vNZ5amirARpmYHPcMyyxIvd7GcILN90D1XtckmqOiJ81nA3YEarVZW5w==
X-Received: by 2002:a05:6808:4d04:b0:3ea:5880:fe1d with SMTP id 5614622812f47-3f19fd53122mr14290643b6e.35.1737669574205;
        Thu, 23 Jan 2025 13:59:34 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f1f088b0ddsm93388b6e.20.2025.01.23.13.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 13:59:32 -0800 (PST)
Message-ID: <6afc379a-2f9f-4462-ae30-ef6945a83236@baylibre.com>
Date: Thu, 23 Jan 2025 15:59:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: spi: zynqmp-qspi: Split the bus
To: Sean Anderson <sean.anderson@linux.dev>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-arm-kernel@lists.infradead.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
 <20250116232118.2694169-2-sean.anderson@linux.dev>
 <9f40295b-484a-48e8-b053-ff8550e589d7@baylibre.com>
 <46a7eba6-a705-4543-b967-e83ccc89e7d4@linux.dev>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <46a7eba6-a705-4543-b967-e83ccc89e7d4@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_135936_178250_2752FD37 
X-CRM114-Status: GOOD (  44.42  )
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

On 1/23/25 10:24 AM, Sean Anderson wrote:
> On 1/21/25 19:16, David Lechner wrote:
>> On 1/16/25 5:21 PM, Sean Anderson wrote:

...

>> Could we make a single device connected to both buses like this work using
>> the proposed spi-lower and spi-upper or should we consider a different binding
>> like the one I suggested?
> 
> If you are willing to do the work to rewrite the SPI subsystem to handle
> this, then I don't object to it in principle. Using a property would
> also help with forwards compatibility. On the other hand, separate
> busses are easier to implement since they integrate better with the SPI
> subsystem (e.g. you can just call spi_register_controller to create all
> the slaves).
> 
> There have been some previous patches from Xilinx to handle this
> use case [1], but IMO they were pretty hacky. They got this feature
> merged into U-Boot and it broke many other boards and took a lot of
> cleanup to fix. So I have intentionally only tackled the unsynchronized
> use case since that requires no modification to areas outside of this
> driver. I don't need the "parallel" use case and I am not interested in
> doing the work required to implement it.
> 
> --Sean
> 
> [1] https://lore.kernel.org/linux-spi/20221017121249.19061-1-amit.kumar-mahapatra@amd.com/

Fair enough, and I think it can be done without breaking things like the multi
CS support did.

Here are a couple of patches. Feel free to resubmit them with your series if
they work for you. To make it work with your series, you should just need to
modify the .dts to look like this:

+          flash@0 {
+            compatible = "jedec,spi-nor";
+            reg = <0>;
+            spi-buses = <0>; /* lower */
+          };
+
+          flash@1 {
+            reg = <1>;
+            compatible = "jedec,spi-nor";
+            /* also OK to omit property in case of spi-buses = <0>; */
+          };
+
+          flash@2 {
+            reg = <2>;
+            compatible = "jedec,spi-nor";
+            spi-buses = <1>; /* upper */
+          };


Then drop patch "spi: zynqmp-gqspi: Split the bus" of course.

In zynqmp_qspi_probe(), add a line:

	ctlr->num_buses = 2;

And in the zynqmp_qspi_transfer_one() function, use spi->buses to select the
correct bus:

	xqspi->genfifobus = FIELD_PREP(GQSPI_GENFIFO_BUS_MASK, spi->buses);

I don't have a SPI controller on hand with multiple buses, so I don't have
any patch adding support to a specific controller. But I did build and run this
and hacked in some stuff to the drivers I am working on to make sure it is
working as advertised as best as I could with a single bus.


---
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 23 Jan 2025 15:32:08 -0600
Subject: [PATCH 1/2] spi: dt-bindings: spi-peripheral-props: add spi-buses
 property

Add a spi-buses property to the spi-peripheral-props binding to allow
specifying the SPI bus or buses that a peripheral is connected to in
cases where the SPI controller has more than one physical SPI bus.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 .../devicetree/bindings/spi/spi-peripheral-props.yaml  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
index 0bb443b8decd..a69d368a8ae6 100644
--- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
@@ -88,6 +88,16 @@ properties:
     description:
       Delay, in microseconds, after a write transfer.
 
+  spi-buses:
+    description:
+      Array of bus numbers that describes which SPI buses of the controller are
+      connected to the peripheral. This only applies to peripherals connected
+      to specialized SPI controllers that have multiple SPI buses on a single
+      controller.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    default: [0]
+
   stacked-memories:
     description: Several SPI memories can be wired in stacked mode.
       This basically means that either a device features several chip
-- 
2.43.0

---
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 23 Jan 2025 15:35:19 -0600
Subject: [PATCH 2/2] spi: add support for multi-bus controllers

Add support for SPI controllers with multiple physical SPI buses.

This is common in the type of controller that can be used with parallel
flash memories, but can be used for general purpose SPI as well.

To indicate support, a controller just needs to set ctlr->num_buses to
something greater than 1. Peripherals indicate which bus they are
connected to via device tree (ACPI support can be added if needed).

In the future, this can be extended to support peripherals that also
have multiple SPI buses to use those buses at the same time by adding
a similar bus flags field to struct spi_transfer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/spi/spi.c       | 26 +++++++++++++++++++++++++-
 include/linux/spi/spi.h | 13 +++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 10c365e9100a..f7722e5e906d 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2364,7 +2364,7 @@ static void of_spi_parse_dt_cs_delay(struct device_node *nc,
 static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
 			   struct device_node *nc)
 {
-	u32 value, cs[SPI_CS_CNT_MAX];
+	u32 value, buses[8], cs[SPI_CS_CNT_MAX];
 	int rc, idx;
 
 	/* Mode (clock phase/polarity/etc.) */
@@ -2379,6 +2379,29 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
 	if (of_property_read_bool(nc, "spi-cs-high"))
 		spi->mode |= SPI_CS_HIGH;
 
+	rc = of_property_read_variable_u32_array(nc, "spi-buses", buses, 1,
+						 ARRAY_SIZE(buses));
+	if (rc < 0 && rc != -EINVAL) {
+		dev_err(&ctlr->dev, "%pOF has invalid 'spi-buses' property (%d)\n",
+			nc, rc);
+		return rc;
+	}
+
+	if (rc == -EINVAL) {
+		/* Default when property is omitted. */
+		spi->buses = BIT(0);
+	} else {
+		for (idx = 0; idx < rc; idx++) {
+			if (buses[idx] >= ctlr->num_buses) {
+				dev_err(&ctlr->dev,
+					"%pOF has out of range 'spi-buses' property (%d)\n",
+					nc, buses[idx]);
+				return -EINVAL;
+			}
+			spi->buses |= BIT(buses[idx]);
+		}
+	}
+
 	/* Device DUAL/QUAD mode */
 	if (!of_property_read_u32(nc, "spi-tx-bus-width", &value)) {
 		switch (value) {
@@ -3072,6 +3095,7 @@ struct spi_controller *__spi_alloc_controller(struct device *dev,
 	mutex_init(&ctlr->add_lock);
 	ctlr->bus_num = -1;
 	ctlr->num_chipselect = 1;
+	ctlr->num_buses = 1;
 	ctlr->slave = slave;
 	if (IS_ENABLED(CONFIG_SPI_SLAVE) && slave)
 		ctlr->dev.class = &spi_slave_class;
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 4c087009cf97..bc45d70e8c45 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -187,6 +187,11 @@ struct spi_device {
 	struct device		dev;
 	struct spi_controller	*controller;
 	u32			max_speed_hz;
+	/*
+	 * Bit flags indicating which buses this device is connected to. Only
+	 * applicable to multi-bus controllers.
+	 */
+	u8 			buses;
 	u8			chip_select[SPI_CS_CNT_MAX];
 	u8			bits_per_word;
 	bool			rt;
@@ -570,6 +575,14 @@ struct spi_controller {
 	 */
 	u16			num_chipselect;
 
+	/*
+	 * Some specialized SPI controllers can have more than one physical
+	 * bus interface per controller. This specifies the number of buses
+	 * in that case. Other controllers do not need to set this (defaults
+	 * to 1).
+	 */
+	u16			num_buses;
+
 	/* Some SPI controllers pose alignment requirements on DMAable
 	 * buffers; let protocol drivers know about these requirements.
 	 */
-- 
2.43.0



