Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119BFC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 01:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ola36QVTNrbThBTKVTSKPubN1/zqev6+ed2BRlcpJ0o=; b=FC6Hj//8zs9u+/ic0vsjcgYpHh
	AhBzxhTUAf3ajdUtfQ4pcskOKMYg7+jDIMHf/Uhs7B//NVREgJoK5+Bbgqo0K4u1/KTZfB9UXZVt5
	9sXpgMFOHIj6h2KtnsR0Iz6tOIEcyKuFHR7cx+STQU5+Uo16VfQjHe8h1DvmKxsh/0jdeClaXSn1t
	B1L2P9ESOpPe7MOef2DaCFqGi/zcWcr6Ck4zH9Q3Al06LM0PJnWgVw7etBK3rLYvGIIA7GHi9HNBt
	CxDOqXvfH0zLAjBpivDHLnBhT9AvjZv41WqBaH8fJUV3bDqZHA9O8K/CFOGt3y8tnIbFli0YSN1cZ
	+imhVcsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uekPh-00000006HC8-32wm;
	Thu, 24 Jul 2025 01:06:25 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uekNF-00000006H2Z-39nC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 01:03:54 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-234fcadde3eso5405715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 18:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753319033; x=1753923833; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ola36QVTNrbThBTKVTSKPubN1/zqev6+ed2BRlcpJ0o=;
        b=Br+r6Zi0EjtcA3/Ych2gj+1QuUAr0OTYzCppFLmgjijM+2ZbatAr+gp8Sl1ncgnEj7
         0LRsYlN8LjIyZkMnaSL+G7Wv+ajTOL/N08jZV3XmshN6X+r3OcC9DiS4hF44DaVGveye
         f08x6bzgDaqrguIqEIWUCPH9aHu6olw/w28/UIYSSIxxI0q4HTVCsZ989f0dg0BW432P
         yumNug9/bQPksYb8xbDryHdLvvay/RPl9quwrKX2MvSMpXG5AXDQp+4QzYGABQfaR7/M
         5XJPvWJLpm5RVQppIyHOv8vTQ6dfhueGuiJA8CPAYfIQPWBUqqnTfO81gcjED8Xihuic
         lmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753319033; x=1753923833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ola36QVTNrbThBTKVTSKPubN1/zqev6+ed2BRlcpJ0o=;
        b=omutxoludZV94XVDUCCcXTv3jqUx+0iAhh/d5R2vgfa68njrsirxuRzBL1pIK4LKnj
         zBBrMzUmkim0x70VdQ9auqNobsQOe6+hIig13J7SjDBaunBAyxaSMDdCuZCDX52kSBdL
         0OwWIBnYwwZaENfLZW5+ytYizbxEQho0t12SNCcrbDi0di9CTaihrww8b9J/6bHEMbTe
         ndmJBy+jsPv5/F1I51BZD5ZkyVqFIUI+iQADImSu8sjhVIZxbtFyHAPtdZTWgHAO/hLm
         KEmgPARj9dHictJ3tkfbg3DYaC1pjNMUEdZigHz+q23ubULFgd8b118Eb+lI2RzQru9B
         zY6A==
X-Forwarded-Encrypted: i=1; AJvYcCURDVJ3PC55iGbY2tpr+RmO6NgGyxMCuMrpHcZAgwecTE/SlR7Zn/ePlps3ihgItHvigIQR8WOH7bSWjeX/YR9i@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/lbzMR7FHjfKagN4Z1XoiRWy4PTnvMnEfavJQggYmcruOXPFH
	1e1NSmEEoKLcOwCa3RLqlHJTckJ7koCMd17OdWefKjvy6rGxqmSDEx7O
X-Gm-Gg: ASbGnctdCA1sEc2gS3lXgP/McLEU5vxDEF+XUvNjTYyGRW5FyV0BhVhMwKSG58ViwRb
	8w2+9+8preqFswqGtGskIdFI156dNHFrD9cAZeoLo8rYsZlQbR+6Ec+9tt/OqBe8zz6cW2roqHx
	E+X8c83/ZG4NSpeso/luYg2++xkPJR78w9eDX149oNwPcLTksZaT8JUPjjrsD691hewiB3jjVFM
	TD3YXDzngr+iSYhkP1ryYLWbnrI5VQhzaCGa2K1ogZ3JcZ/kzyGaAez0Rrc9fhwQdxJ1Fw7ICbK
	Ii/zpDB8lbU7pJ6w97fm/3CruYcfZS8Kjb5kIhvTA5+njGxbB+JTfJVrtysMNN+E4mn2cOdW6fl
	izM7Rr7X5zQK/KhQfB1NF2qpHRY7jqKjrkSXsic43udCdJvmJ6bMPFwadI7o+HJNLXG8hzWlgax
	0=
X-Google-Smtp-Source: AGHT+IFgaOGMceKN4aw59L0CUk1l7GDQtyX01Zhw6G9VYFu6+CkQUCsVgi4C70MsUhb+musZe+qrOg==
X-Received: by 2002:a17:903:1a2c:b0:234:e7aa:5d9b with SMTP id d9443c01a7336-23f9814c6damr56396695ad.23.1753319032958;
        Wed, 23 Jul 2025 18:03:52 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48f04afsm2229035ad.163.2025.07.23.18.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 18:03:52 -0700 (PDT)
Date: Wed, 23 Jul 2025 18:03:49 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v3 10/13] ARM: dts: aspeed: Add Facebook Fuji-data64
 (AST2600) Board
Message-ID: <aIGGdbIX9HaV4dB/@localhost.localdomain>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
 <20250723233013.142337-11-rentao.bupt@gmail.com>
 <d09667e5-992e-4ced-ae30-7a4116a72c62@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d09667e5-992e-4ced-ae30-7a4116a72c62@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_180353_793473_BE8F6E41 
X-CRM114-Status: GOOD (  13.12  )
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

On Thu, Jul 24, 2025 at 02:03:20AM +0200, Andrew Lunn wrote:
> > +&mac3 {
> > +	status = "okay";
> > +	phy-mode = "rgmii";
> 
> Does the PCB have extra long clock lines to implement the 2ns delay?
> 
> 	Andrew

Hi Andrew,

Thank you for catching it. I didn't notice the settings because the file
is copied from the exiting fuji.dts with minor changes.

The delay is currently introduced on MAC side (by manually setting SCU
registers), but I guess I can update phy-mode to "rgmii-id" so the delay
can be handled by the PHY?


Thanks,

Tao

