Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C164CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 17:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JOagae3dW1lR5FIp/nsWts7K+C85jj/Xatk2ej+x4U=; b=Gpvn14JIfCD6XZk2GgNB4VMSU5
	Q/T5TxpZCfpuuVapOR99Qrm0TInLxpUI618qiEuLJrsACiwGX5VRG5r7sGXh/njY9K2RPD6mKy5T8
	ChaxddHX/BEtLlXpEoGr6Cz+0QT42oYnJdlN4ju0dwhCCUdix4aA4MPG7BRXDdZ3PGTVPxrd2ODdw
	FCanloHMgMK95xUeYw3OywUCulqqu/b1j4oX//gxwKDjopr/rX2nbL9r4xp344cLIeEEwCbElqzxh
	dunI1qyKx7znuvhSyrO8CcHFcWyvp8Rn6XQl6D15lhOMe+7YKgrXjXNMra/JW/c9MW0MWx6KgPlzn
	C5CZRdNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJEP-0000000GVB1-1bX0;
	Fri, 10 Jan 2025 17:55:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJCN-0000000GUxY-3kEC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jan 2025 17:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6JOagae3dW1lR5FIp/nsWts7K+C85jj/Xatk2ej+x4U=; b=igOn+++n00cqIMoo2LCqsan6mx
	4XYv4T0vVWkOpXPItoeprn/XlepWxC9PR7hywq4J4TyL6iKekQjqVZom80tj46GwHVqkHqHxgNS3Z
	CdgEJH/xYir5sk6C0+AQ9YtTRdREVku7P8VDlqLoebC/1ACNmYrmibGUHgHRmBhgdw2ZTGh9cpixP
	LfqJpo1Pp24V+FNqgCkvr1feo4VxHbe6OVcr9NFLMrakJqTnU6OzghFbCJPNVVKRCdS4c/+WMwAEA
	sKceZrkUsIkHewtNuzKFZhCkWF51BLih4g1ogD2L4kF7tp9/fbPRX3AXskvDiNDdAGc1MeEG2ulwg
	jIaEawaA==;
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJCK-00000009rVa-2T2p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 17:53:30 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5f6ab7e0bd6so1028164eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 09:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1736531605; x=1737136405; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JOagae3dW1lR5FIp/nsWts7K+C85jj/Xatk2ej+x4U=;
        b=N1fwkwCDrMxNJkzG1ioczFrxfNBL/Imv+CbawcX/huJS+G+wYe2P2czjQnIK8gm5G2
         SwKHoHwe7pnYWc87MkP2Pk7Hfl/YffdTOd08iYjwQemljkRM/teq2PzmSzRILVxXXeZo
         ArRvTH4tXLPuPLCXmwcEf2X/17ga6v6HlqWWFV4bLpwp5aaq3NyAXLcNN9IF1BcKyvQ1
         ascYpFyBMwog3i5UdS+zBsDwvfaYoVjHkThr8mcz/wBRudPlECtzDurkskgnoKJbQI0I
         31QZj+3/gE60VGkJgNdfOOkMWFLiGgeWk2CfmUAUywlCi2gjr1BM5N/Xcgv+hP4HBPon
         l2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736531605; x=1737136405;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JOagae3dW1lR5FIp/nsWts7K+C85jj/Xatk2ej+x4U=;
        b=GHP8TJ1rNEGHiFNwWif78+s9dvUN7QJD0m6Iq5Tz1ANgVKu4/JGMxfX1ZkT/+eiCQL
         ZGSHFEu7EwBgv1zPmIdlUUe7MMo6o7tnwHBDGv0uOFPp2gCsokYC5o2zVPBnRh+g5sNU
         O+j8ZTKR+6CC9QrONIu5nz89/DoNYlrHPHX+5I+oSaQzizocBW4KAeFIG9iCyUYXquQn
         3LQ7zsSN6qdwb1+Azm3NG18Fb09emD64zdELYAfmbssvkbwF2AqIUZBpXB1HVg5DhhH0
         ycyPzd9+99ETep6UxtW5z48eOSs1+Hju8liitFYKEmrviOQTirGoEUWL1WKhM/2hSBaL
         VBtA==
X-Forwarded-Encrypted: i=1; AJvYcCUKuo7o41gL+8m/1nQyFd7JH5hAGz9JEUsqEbCak9aqX33t8KEAeS1/9Mo6aGSTYAhn468r2Mi9HgPXJCDQBd3y@lists.infradead.org
X-Gm-Message-State: AOJu0YzQiIYmrzIM+QrWRxN7vVaCDO1z532Behpw1gfIdT10QaKhO5Dp
	ZQP/X3/0H+18W5aLwhmvu1Bw2nKbgC2IM2J84SSJ8154ei0qcnCNLb8NSTSkZUE=
X-Gm-Gg: ASbGncvA5qsvn6L4KUZkbIxo6x5cMbQ8jUe+6pFXTENu8vlaaoJkt6nuMuBxNkQeJUN
	hcjIOJa0w8gjksPdgafUb/FkXcrAqtjWkAIF0xhFQArFikck+pQTaumJvF4aJSkh9NWhVd8tofz
	dLwK+7ynBI14Re6LTiUHSxNNMeHfZSsvj+BnMKSuLlE2JLgyK9W2aDj/XDCoOFdum1kjMupo1DE
	DpWVpilhYzY6nWBX2hbMPIsc0ErpVcgygZbplwPrjJQ/iYYkHlIPJjdndPs
X-Google-Smtp-Source: AGHT+IGB0PKOvj7h3ojvbM7pAuyzSK65qG5xXrDh822hP3luACM/ibUleffXIwmcp6JhMd8+ciJOnw==
X-Received: by 2002:a05:6870:a691:b0:29d:c999:b90c with SMTP id 586e51a60fabf-2aa065118c4mr2126228fac.1.1736531604651;
        Fri, 10 Jan 2025 09:53:24 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:1850:cb65:a40d:8a99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ad804af3b6sm1080167fac.4.2025.01.10.09.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 09:53:24 -0800 (PST)
Date: Fri, 10 Jan 2025 11:53:18 -0600
From: Corey Minyard <corey@minyard.net>
To: Rob Herring <robh@kernel.org>
Cc: Ninad Palsule <ninad@linux.ibm.com>, minyard@acm.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, ratbert@faraday-tech.com,
	openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, eajames@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/10] bindings: ipmi: Add binding for IPMB device intf
Message-ID: <Z4Fejhd_qPfuVLiw@mail.minyard.net>
References: <20250108163640.1374680-1-ninad@linux.ibm.com>
 <20250108163640.1374680-3-ninad@linux.ibm.com>
 <20250110160713.GA2952341-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110160713.GA2952341-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_175328_915991_B8892BF6 
X-CRM114-Status: GOOD (  26.22  )
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

On Fri, Jan 10, 2025 at 10:07:13AM -0600, Rob Herring wrote:
> On Wed, Jan 08, 2025 at 10:36:30AM -0600, Ninad Palsule wrote:
> > Add device tree binding document for the IPMB device interface.
> > This device is already in use in both driver and .dts files.
> > 
> > Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> > ---
> >  .../devicetree/bindings/ipmi/ipmb-dev.yaml    | 44 +++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml b/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
> > new file mode 100644
> > index 000000000000..a8f46f1b883e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
> > @@ -0,0 +1,44 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/ipmi/ipmb-dev.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: IPMB Device
> > +
> > +description: IPMB Device interface to receive request and send response

First, thank you, this does need to be documented.

> 
> IPMB is not defined anywhere.

Indeed.  At least reference the spec, but better do that and provide a
basic description.

> 
> Which side of the interface does this apply to? How do I know if I have 
> an ipmb-dev?
> 
> This document needs to stand on its own. Bindings exist in a standalone 
> tree without kernel drivers or docs.

At least to someone who knows what IPMB is, it's pretty clear that you
are saying "The i2c device this node is in is on an IPMB bus." However,
to someone who is not, this is all a foreign language.  This definitely
needs better documentation.

Why do you have a "reg" property?  I don't see it referenced in the
driver.  I assume that's the I2C address, but that's going to be the
same as what's in the containing I2C node.  I don't think it's
necessary.

-corey

> 
> > +
> > +maintainers:
> > +  - Ninad Palsule <ninad@linux.ibm.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ipmb-dev
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  i2c-protocol:
> > +    description:
> > +      Use I2C block transfer instead of SMBUS block transfer.
> > +    type: boolean
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        ipmb-dev@10 {
> > +            compatible = "ipmb-dev";
> > +            reg = <0x10>;
> > +            i2c-protocol;
> > +        };
> > +    };
> > -- 
> > 2.43.0
> > 

