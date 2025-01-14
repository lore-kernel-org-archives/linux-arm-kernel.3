Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B0BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 16:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxWYotfxywN3NwGBQO3BiIkoRPcGTpIVsh2/TXME74Q=; b=tQVv0Cl+YClhT7+gfKjDKShL/Z
	dwjQl4qnN6R471oP2CXtf5Zd59EO0edpahg24bziunGUzonD2fRKn9b0i4rvCi7+kWwnj0SBCV3wJ
	gN2Qk2dwKjmJ2H3pWwTKmqEqjvAm3iCzBJYrLBHiiLc0JDFU3yFdC1z5u+ExMHPfnFcg/jrJzuGLd
	AQ79XL0S2592DpIlt6/UJ7xhhd8hY6lrNvvCTepwf9WIwpmhBjc+Unvdt3Rc1HkrCYgpHq1j426PO
	hS3k6Ailc7Nf2SfszPqsOAJlzYwA7PxRCNKdQRIc0r2Z7yKkykOx0RPrsRvGUOQF8P5m1bRtOQ/Py
	inKIuouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXk5b-000000095JQ-28Xd;
	Tue, 14 Jan 2025 16:48:27 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXk3O-000000094rH-47dk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 16:46:14 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2166022c5caso90055725ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 08:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1736873169; x=1737477969; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxWYotfxywN3NwGBQO3BiIkoRPcGTpIVsh2/TXME74Q=;
        b=vyYYz6WtaO3cRBEnJPFxjIqGrVRgoLhvx6ALgZMP8jnN3W17yL12CMqOOrVAwMH0oX
         iAfowoTwbJO4Q1MtHZm2ZPgVzeFys4Wkz6+Nxy5/ki1D4mk+0rIib8C9HAcupWxRVCG7
         j+f/KoQjiFGPHnuTVLAP4jy0ltjj+ldwZNq0iFJx/aVvXMY6bIgCwsLWw9LIZWytVirx
         37Kaw4Uai/dyq6pebkt+sc7hDp0DIWQuvAxTHIido4lGciyiSXii6vRi+d0tspqxEf7D
         dQd2yKiLGZ3kuW8boXs96UdZ2SzkX6i0wdVae1Sc1Uj47vYtUEzFRqiQgxM+p6dzTyMb
         aeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736873169; x=1737477969;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxWYotfxywN3NwGBQO3BiIkoRPcGTpIVsh2/TXME74Q=;
        b=hZ3xaAB0cN3GD/D3BZAmXmKhxPNFKl2GbdSWWJuLiVJts67rn11TJVOTXNzWelAUU/
         U+2obRW7QDODgzgkFIygaKTOOJKrmm2Mttwx4fQRiKbzjXC2KM2GYnNwDx/7LtnyiomD
         KmYyxRX224rKrXwpUdmFl4ktv696l1EmL8fE8TcYpkwr4vHOivv4yvLqVB7JJ04LAA1o
         S9yrOOHewhAidyZfzkmVNnhqKfG74L3lPYSbPalQqoYeZ2andh2pM9H1N2eEUtySFLIU
         v2zm6PbnxqSWpJpO4QRgkktpJYPE8V3KEbIM4KQe3JjZyT2rosbuoCYUT7ZX0FW7HWE+
         BqFg==
X-Forwarded-Encrypted: i=1; AJvYcCWP6ljLdctwwNOFtssvZHsAyBLCd1y2tt8+BKPEgRGMswTyg/WzT7ZKBEbAp0MpIdECwo2QJK8zS+N3iUxu/X4S@lists.infradead.org
X-Gm-Message-State: AOJu0YwzbtA+HlwE6ZY1RCFsYLT3MrVz6VA0kP3OZ2aHdXBXUId+ku8L
	YYjOVhF6rUuolK58EB5yGJokTWg0PcyK1ENrV8hnxjtKR3M7f2UOLaoTutNKrq8=
X-Gm-Gg: ASbGncurQASwnM0rVp3jq3API4MqvDhfBUD3121KTnOqfMKt+UAuv3/ikFJtBS/miiq
	IMOx8axYBFUaKQUGVvbtwKS4NzWgWqOzJJNfwLcwKBztaWbjgkwWtdCN45XZr+cvNR7N66fyXTv
	o7UWpJRwhzVbBPhDZsVUB+ABbDaPnVpw/dVpJSoBvZg5uO7KXdf27otTWfYsfnJCz4AftiMq1Ww
	5RLDxoKZmjH6q8v4+yfl4Aecm58iIubykJJgl4o540+zmZAuj8ruIyz8fS7
X-Google-Smtp-Source: AGHT+IFduq35RcsU3aO5RRhPDalwAW/p83/zhfkLttMULeNifRcViC7DtwI7vuIYT8rQlSliD0flaA==
X-Received: by 2002:aa7:8887:0:b0:72a:bb83:7804 with SMTP id d2e1a72fcca58-72d21fd2e16mr34122515b3a.17.1736873169522;
        Tue, 14 Jan 2025 08:46:09 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:4641:6dae:60a7:e5ab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4065a560sm7614353b3a.87.2025.01.14.08.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 08:46:08 -0800 (PST)
Date: Tue, 14 Jan 2025 10:46:01 -0600
From: Corey Minyard <corey@minyard.net>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: minyard@acm.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, eajames@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/9] bindings: ipmi: Add binding for IPMB device intf
Message-ID: <Z4aUyX8g-JprzLpd@mail.minyard.net>
References: <20250113194822.571884-1-ninad@linux.ibm.com>
 <20250113194822.571884-3-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113194822.571884-3-ninad@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_084611_286489_B3007CB7 
X-CRM114-Status: GOOD (  27.00  )
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
Reply-To: corey@minyard.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jan 13, 2025 at 01:48:12PM -0600, Ninad Palsule wrote:
> Add device tree binding document for the IPMB device interface.
> This device is already in use in both driver and .dts files.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  .../devicetree/bindings/ipmi/ipmb-dev.yaml    | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
> 
> diff --git a/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml b/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
> new file mode 100644
> index 000000000000..136806cba632
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ipmi/ipmb-dev.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: The Intelligent Platform Management Bus(IPMB) Device
> +
> +description: |
> +  The IPMB is an I2C bus which provides interconnection between Baseboard

"Baseboard -> "a Baseboard"

> +  Management Controller(BMC) and chassis electronics. The BMC sends IPMI
> +  requests to intelligent controllers like Satellite Management Controller(MC)
> +  device via IPMB and the device sends a response back to the BMC.

device -> devices
"a response" -> responses

> +  This device binds backend Satelite MC which is a I2C slave device with the BMC

You use IPMB devices on both the BMC and the MCs.  The sentence above is
a little confusing, too.  How about:

This device uses an I2C slave device to send and receive IPMB messages,
either on a BMC or other MC.

> +  for management purpose. A miscalleneous device provices a user space program

Misspelling: miscellaneous

> +  to communicate with kernel and backend device. Some IPMB devices only support

"kernel" -> "the kernel"

> +  I2C protocol instead of SMB protocol.

the I2C protocol and not the SMB protocol.

Yes, the English language uses way too many articles...

That is a lot of detail, but it looks good beyond what I've commented
on.

> +
> +  IPMB communications protocol Specification V1.0
> +  https://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/ipmp-spec-v1.0.pdf
> +
> +maintainers:
> +  - Ninad Palsule <ninad@linux.ibm.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ipmb-dev
> +
> +  reg:
> +    maxItems: 1
> +
> +  i2c-protocol:
> +    description:
> +      Use I2C block transfer instead of SMBUS block transfer.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ipmb-dev@10 {
> +            compatible = "ipmb-dev";
> +            reg = <0x10>;

I'm not sure of the conventions around device tree here, but the reg is
not used in the driver and it will always be the I2C address that
already in that node just one level up.  It does not serve any purpose
that I can see.  My suggestion would be to remove it.

-corey

> +            i2c-protocol;
> +        };
> +    };
> -- 
> 2.43.0
> 

