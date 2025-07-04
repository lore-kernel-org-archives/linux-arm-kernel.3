Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C7EC83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 04:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xILUeuNzrr/Yo7TFwfYEmVtweggfhUGpHihnp3c3FuI=; b=of626nlk8OsAn83cjAh6cV07Bu
	5JwGKZv7x0XVCKIHAslt4lqksxaY7kU+dhi8okJxY9Dx5NzeU4Q7VnWu7d865t9+99yzNOmhpvuFj
	lfhlu3pPeLATP7n0h8kMBVwx9TOOWGq1p1xCIWtcLKLDd0MkE5M8MUu9iKeJenJeW1Pnl4q9y6xyD
	V9KUd9Q+mlieqQV0RCxuCBLy/gZNxH/HoIzKp9+B2eN5zt5edJWdnXgcSgyQHyFCnK7r8Yz6omSYf
	p0GtBpvig8+6RS4j0PqwrQdzZ8uyoL0taP0T3wACw7mGsgbS7nX6uUsw/eMOeSV5I+hhZpZkf57kJ
	bFcL6s+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXYO4-0000000DGjy-2wer;
	Fri, 04 Jul 2025 04:51:00 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXYJl-0000000DGQs-0dqA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 04:46:34 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2352400344aso6080535ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 21:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751604392; x=1752209192; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xILUeuNzrr/Yo7TFwfYEmVtweggfhUGpHihnp3c3FuI=;
        b=CWJvWLPyjM2QiyVGBFAyLEJDQmpJqG5Sp8uoeQ82IeW83t5asb14dX+mfq09xJijIP
         sGN/CawBvRUJegowqgI8CNr0CE5k/WV3SlZ1o3LsntlKtiqUk81wXHdbmAKsc4/PTfS6
         vvNj1Er2DH8eup9a+OWwMlKjP0YMiWevwuk/RH0m6pf1vcXYBme38NEf5pDcC5zVZgzn
         2MpVLHR/Xv3USXwRfGQOSTaUYnQX25XqwHA5ntykJ9ax3cVbYi/+gx48qQfKFM1iNkEA
         lREJWIgfbFWL1GemrKnfxYtiJWEvP3+Gv+eAV7qcy/GGgiQfdGrE4jTJbBhpk7K4Bw+0
         9Txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751604392; x=1752209192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xILUeuNzrr/Yo7TFwfYEmVtweggfhUGpHihnp3c3FuI=;
        b=FanN6Iq4m0b2XqrFveIXzmN/7mgUYZq65lNJ+s+6jH8ziHytEfpBWyAz4dMR10+MPs
         HtSo/MHMszM/2Jp0EI8IiHJRE6NmQmKq7NQRXtHSmatzrqe/MHks1joEhrqW2tjEcEyj
         yUL6KGhL5KbusuEKbtzq5VUsJ/5iv+c8ymUbBBM/Ggyd4RhsCCaPx67FXBrJpbV6uNtq
         mJAq8mmdYzT/2mZ0AHY0Lp+8eWTTZGyoTzNt7NyBcrS5iWsqa9IfAvWUI6Ni4PLQkAsQ
         7jcv5WcQ38c6kimwEgk1Vj3wQyf1YMOYq380Edw5Hhg1aXokn7PkKyhubuC8m5IkX2jO
         v/XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVln5DqdrQPdzktAFiKrxAiDJbBLzh5iI+GNx+OSj7IxFQcLS9utCKCmUgRTPcsjjWBWUrPVMKipJUsH1xQZba8@lists.infradead.org
X-Gm-Message-State: AOJu0YxdNTmOw0+uIzbdOfnnh5z2z129vbIA9axtHX4ooo+/w92U1/5/
	zRWqcYqZncKTYu4+Et3DyZROlED57m8kfV3Hkr9TJwBe18YpVlaxi0WE
X-Gm-Gg: ASbGncv+CEwhvygnfbp8TmrNrbuKcWUxoy03S8nkxsp3UOpuNX4RiUrc/qo9ebXwBR8
	mSCd2Ryzz5IvLKd9a00u47QTs6PK/0I8tYeFZioHkscYpM/6r3mnBPhvHKMJkAzBDwDTSddlidF
	/IThF5Wzg8r266Eu1YQUVTYIUC0woXajBdXXnfJjJXQU9XE1DlpOH947N7rpK4XVP+evybe5uXe
	UKOX+WuVbWSW/n8LoOHlXLD3JRX8bTWkGT6zFlvCCDgHFCLerHfNNFHi3Uh6u8FRASt07PSYAzT
	neOsW600cGCKn1xwNtL6XMai6H5fmvSg84HC9y24tbgcv9L8hIk/QEsll/8wyiUZCCekEv0aW4b
	+j4FkX+WZpAMvLxEfRCXEzh+x9bj1BmPgBLBQIXU=
X-Google-Smtp-Source: AGHT+IEgR/rCAd1Y5FPgmuwSiO8qntbXNx6FG654nLbacD0JKhCOt3sZTQYV6V2u/abFqRuVhjf1Tw==
X-Received: by 2002:a17:902:c412:b0:234:1163:ff99 with SMTP id d9443c01a7336-23c862a8090mr23121635ad.43.1751604392392;
        Thu, 03 Jul 2025 21:46:32 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455cc1asm9413045ad.123.2025.07.03.21.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 21:46:31 -0700 (PDT)
Date: Thu, 3 Jul 2025 21:46:29 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH 2/5] ARM: dts: aspeed: Remove eMMC from
 ast2600-facebook-netbmc-common.dtsi
Message-ID: <aGdcpfYM94Itr6ME@localhost.localdomain>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
 <20250702050421.13729-3-rentao.bupt@gmail.com>
 <94e0c5bfe1239e7590cef427cbba405077d56d01.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94e0c5bfe1239e7590cef427cbba405077d56d01.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_214633_193071_4876F78E 
X-CRM114-Status: GOOD (  12.21  )
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

On Fri, Jul 04, 2025 at 09:38:39AM +0930, Andrew Jeffery wrote:
> On Tue, 2025-07-01 at 22:04 -0700, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Remove eMMC device entries from ast2600-facebook-netbmc-common.dtsi
> > because eMMC will be removed from future Meta/Facebook AST2600 network
> > OpenBMC platforms.
> 
> Please squash this patch with the subsequent two patches so you don't
> break Fuji and Elbert across a bisect.
> 
> Andrew

Got it. I will take care of it in v2.


Thanks,

Tao

