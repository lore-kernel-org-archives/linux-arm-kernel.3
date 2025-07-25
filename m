Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0A8C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 05:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLFW2Etg7f00kiQg1GB1r0zuU1sWnFWDprHgwFRfFp4=; b=TPczeVZjCDkpqbgwHWPKpz9wdk
	UoqNChbl2oCV0JA2ioQcg/ohXORaucMEauJs4TDRv6EVuhwG2Sp+2Cvcev/WJDh3TN8XK1YmRJNA6
	/DxU14khFgzUPvNAYwM/cqkNx+GkeHBtacOUl/rX7slycRSD52sbmKhAI4WnIzGD1KBEIfs31sDMU
	fJlGBMVELP/N+UB2fwYYr5sbTuqvWUQB3xcLkh5cPwKPaNalqX6o9xs9YTvL0jG/e/zvbN37uz3BI
	sxQVYPdGqNnUiTvCHiVh+827WhKQ3eMxNQqCktD6Ms0ajwulf+ooabT1NIiFMZsbpCCDnf1EbhDUk
	Ff+LTUtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufAup-000000095Mt-0Vbw;
	Fri, 25 Jul 2025 05:24:19 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufAr0-00000009505-1MNb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 05:20:23 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3134c67a173so1738931a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 22:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753420821; x=1754025621; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nLFW2Etg7f00kiQg1GB1r0zuU1sWnFWDprHgwFRfFp4=;
        b=NXEvQNCUTDHdMEwppAxRLaiRpJ6f7wxU7068snn/hc9ay3FQhXuoZMQJxym8/eBBwD
         FHLXCYSb45tVwhl8kq2hq07Nje8l1wfPNkwfB2iQz6Cbeb+V6+GppicVsoarT9LS559z
         sgv4jd+sAojckNZiqgNv2yNn5ZosGknOzeBCGZUp1IBwHRqEPbOJTQRwQQelVPQzTBGX
         byP/TvOOiVIRTgOa60GXMddCFygaMIGb7riSBQz/g6SnIuDrP4hH7OQ2YTyFHmwjg2I8
         zE7wGLxWx5nSchdBTBx6fXGWVTge+xFx9DKG8HfYehhcwgG/T49aAeAxzFDoCxipM8py
         R4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753420821; x=1754025621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLFW2Etg7f00kiQg1GB1r0zuU1sWnFWDprHgwFRfFp4=;
        b=vddkObqUUaWC53FXgxKbQxVKlBazZznoaomp22hSRWWkUfa8mdrrxTL7NngIhKMrZC
         YV0BJB97HVNPOj4fy7+ss+X4ad7B8zkXlwcE3YJ755kX1EQmVL8TkMQ+BxNnFH/bgna9
         sn2DTewvDBZcDrSqocSaTFONDPXRfwLoeTgH1XyKiKfRgZxU99K7VCRFW1sjglY5tcK1
         ODIQptMhXHGFntj+sySHxN09EN+0HCS1tm0TZQHkWuQkgENBs54q9XOtl8xjB3v0N2qv
         y3njsi3yUaOpBdzGfkcHVHRUHtat6yHkMneXVi6vzXGW2TxMoit9IoP4X4h2ye2bifuQ
         VasQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi3xf9UTDrGtEICzxTgffXJK8BU+bl93Je34nSvfnFw9EOkTKoUrzXFNsoGhxJM27P5yXOteIonXJuYhjj0fCw@lists.infradead.org
X-Gm-Message-State: AOJu0YzQnVyAxaWNoci+n/2gx+JZhLPO55/QN5B39uBELIdmIJCuYkRV
	v3z6vauPbHaP5OjzYZavZsZydy73TO8tVhuD1bX7onNtMtMrr2QjsjyqjgjCRV8G
X-Gm-Gg: ASbGncvt23D03nZXcRG0wxQ0C768CkNmrBhLXlymAOqZkbsIrn48Ec27EVPYe9JEtRX
	yqYnPPzGvpxtkAHTWGon6d0y2kHY9RhJX2EvrvghOqK7b5BsWjvDY5G57sumfgzQM4rVZC4+/Sr
	ghIpkd1zwUnADE53V7wP4C+Q65oXZ1szYHUov6+mXE+KCzTT7AFxDIk7ANXlNMlVL6CowvNI645
	nDFixm+Xy146OJJi0CGbUd0aYRus/pIwwubnaYDDqibOhzlty7zuaxsO2lzJ1dLxjPAc0nNTP7m
	e9SqciRRellFQ0rom2zbJ+DEVtEIFwEdvz3vj5l+Z107RxhGlbDtwls+8WzgQTzHxixAghIpQJr
	3FmhsZEOdm2Jy61m0WgE2fcGEHC9253b8ib9e5EYJqgHaXFgPUv5eWqrgg6zvMJCVpemGkREWEo
	Y=
X-Google-Smtp-Source: AGHT+IGYNEkx+OPyKPH2NYgCMOjXtnrPHP45w1/H3ht6Anh5i8C5DhT9XfjH7TYWya6okH861qSVtA==
X-Received: by 2002:a17:90b:2cc4:b0:312:25dd:1c99 with SMTP id 98e67ed59e1d1-31e779fd277mr795087a91.19.1753420821482;
        Thu, 24 Jul 2025 22:20:21 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e609617aasm2308647a91.0.2025.07.24.22.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 22:20:21 -0700 (PDT)
Date: Thu, 24 Jul 2025 22:20:18 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v3 07/13] ARM: dts: aspeed: Add Facebook Wedge400-data64
 (AST2500) BMC
Message-ID: <aIMUEhoCXU1C8em4@localhost.localdomain>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
 <20250723233013.142337-8-rentao.bupt@gmail.com>
 <20250724-overjoyed-panther-from-camelot-f2ff4f@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-overjoyed-panther-from-camelot-f2ff4f@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_222022_380593_CA213CE6 
X-CRM114-Status: GOOD (  13.21  )
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

On Thu, Jul 24, 2025 at 10:05:40AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Jul 23, 2025 at 04:30:03PM -0700, rentao.bupt@gmail.com wrote:
> > +		/*
> > +		 * PCA9548 (11-0076) provides 8 channels connecting to
> > +		 * FCM (Fan Controller Module).
> > +		 */
> > +		i2c32 = &imux32;
> > +		i2c33 = &imux33;
> > +		i2c34 = &imux34;
> > +		i2c35 = &imux35;
> > +		i2c36 = &imux36;
> > +		i2c37 = &imux37;
> > +		i2c38 = &imux38;
> > +		i2c39 = &imux39;
> > +
> > +		spi2 = &spi_gpio;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = &uart1;
> > +		bootargs = "console=ttyS0,9600n8 root=/dev/ram rw";
> 
> Drop bootargs. You are duplicating stdout path and choice of root is
> definitely not a mainline user friendly.
> 
> Best regards,
> Krzysztof

Got it. I will drop bootargs in v4.

Thanks,

Tao

