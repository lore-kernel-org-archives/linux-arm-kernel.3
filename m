Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B3AC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=519dNdxGkZChACNROtarKLrXjiSKkCZfa7q39zzxKTI=; b=DbYGlHWA9laGFfPvEFAeisZ8S6
	6jwd98cmrDE430tXTvfisYIruxVpzpsKHq6QI98MFskzJKHpnJdSykEejlFUECWTnwEyBYlI/WBKU
	D+0zA3wQHpBa8Ya6Ic8tWfIu6MyeFhJ9aDK8INat6Fgm4qbDrBPmLQYdPj7bqjK+yoUBKii/5uLU7
	J3JSPm8K/yRTTutXpvqSBdSlrNufKo881HNi0fW2Rf6w3oNXQAVexzs54sEnfElunmtWNZNTx4lPq
	nLB0QMKwdQshyYU6FPE7iYkga57LiNmMsgxYeUI8UYFpNA9dkBgjql9QOYH9KHYjGWUXczu6Sybqx
	0Yz82YkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPaK-00000000Ec2-01VF;
	Thu, 16 Jul 2026 17:09:20 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPaH-00000000EbP-3A3O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 17:09:18 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-80a123ef90aso16517947b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 10:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784221756; x=1784826556; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=519dNdxGkZChACNROtarKLrXjiSKkCZfa7q39zzxKTI=;
        b=NM05SXShp5gmx/74c04Q93nFld+UWl4D3pIwx3FOJomuHwXcea1K+nWF+ej/b4UKZP
         T0TC/yxrUGNumWn/jlLjYH7ab2A7uSl5fDIRfxoy8UE9VxmOsRhJfTfUxEJAm2U5FX2E
         1leGM5xY6R3Mzld/DuaSLpRp14y3prm83cI/PVn7SAJLpCg3TOgM+3k9wdY5aYStVQ9p
         RMTitT0Ev5bBHTxgAy3IHkOTl20j5RnH8tB4UNXSNghO177E7d3/HBqgCVelI7A4vz2T
         nBBBGpoZECaK2MNE1udN81Aby4GaaExKbi3SUVXQBdSkiLPYLcsk9D7ghuTTNuDDtpJo
         mVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784221756; x=1784826556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=519dNdxGkZChACNROtarKLrXjiSKkCZfa7q39zzxKTI=;
        b=SHsXSJsEEetNjejWKiIxoQKbXjPzpVOWKnBPakEFk3JGbkyi59qXeH86w9HcGUZIev
         FF2NjnvfF/nzJNwDWgZIHwSB1O8BQhjLoGHAUTnQoL9rc4kc5fUvy34/tehMbv70zqL8
         ki2qj84bMmkPJjJ6y+GzD1zvj6P8i4teJlfLFsmMJ6P1gB33cZzB43haCG3vJn8JWMga
         vMOye4huRe5VbdVd+8Ft1cw9btgLvlvFpMubO24BcfwAl84bIBbvVQwCPY6aA0yLvTDH
         SPNqmR/hx5I1+OzR+/nt62pQtu0hLa39asHf/vq0gtGQv2+hbC+FCyQXXkiqSYJNIL6r
         Z2ag==
X-Forwarded-Encrypted: i=1; AHgh+RoILAHuRb9NOoXbpQVM2v0oC3O/I1vY0aDSGg/sm0/9O2uWAjqlK57obnkJzFrGq8QTx8dGC/qAL9dzkh/MeMYf@lists.infradead.org
X-Gm-Message-State: AOJu0Yydj2vQFzTC4eoMDR0GB/idJJRTD9fdazn6vrGnrbvI9OLE/9xY
	kHAuriuGQrL2hqWSG5d2Uen+6aD9i3eywpZ2P/20KLe3ycH8n/F0SjEJ
X-Gm-Gg: AfdE7ck9Sb36JmQgVDCU+fbbco0py2POMYIGVPPfd8nDO66kQhh3wW0y/WJdseQ7c/3
	cVRp0+KCS+Mig1oVhvKNGOk0B6ig+PjuWRZgwqeBIzuGoUBb6ll6OaBSYDJXmND6uAMN+vA8KJb
	b9aAV1Og6DleUmUgPOfrkx95ZUhcmhTu2qTN3ptNkWWZZNPjPAnAWrqd8FvnSphWcgw9iv9Aomq
	GxnlLx+16V3CDN0uFI/3YRM2j75/KHt/T/F7Wc9Vhnab3hhCBlS8LAEXOKrFR2lFqnw+X+L8D5a
	qQuy3SBuZUM13eQ252L4Ne8uI1GIeGUhS0fXchJS12Dirxa6enpgX1d9g5pxelXhwI4CWouajYa
	O/9DhwImdM4oWAujRvp36vv5rQFYW0lrjt5QxJLN6Tu7uWyrFUbB3n1TsCDC88rOHXHCoDt4cBr
	q7T9cS7GPoMkgXmjY+jY1dIOv5nJs5t3PLKkuwq4ePNKzk4HBdaxiTtHK4iVf2zHmhO4hvvQ==
X-Received: by 2002:a05:690c:6983:b0:81e:429f:24ba with SMTP id 00721157ae682-81ee298087bmr22881717b3.36.1784221756342;
        Thu, 16 Jul 2026 10:09:16 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c249b87sm199484877b3.49.2026.07.16.10.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:09:15 -0700 (PDT)
Date: Thu, 16 Jul 2026 14:09:08 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "leonardo.costa@toradex.com" <leonardo.costa@toradex.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Sherry Sun <sherry.sun@nxp.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Hongxing Zhu <hongxing.zhu@nxp.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [REGRESSION] mainline/master: Apalis iMX6 no longer boots
Message-ID: <i6x6wpua7wlwmdq3hitoo53wkptgp62tvegmkabcru3d54eqg3@yk4eehwaarn2>
References: <20260629143439.361560-1-leoreis.costa@gmail.com>
 <20260715234736.GA288957@bhelgaas>
 <VI0PR04MB1200862BE9B7C137EC7C18AF18CC72@VI0PR04MB12008.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI0PR04MB1200862BE9B7C137EC7C18AF18CC72@VI0PR04MB12008.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_100917_818343_A50D029F 
X-CRM114-Status: GOOD (  11.51  )
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

On Thu, Jul 16, 2026 at 02:15:42AM +0000, Hongxing Zhu (OSS) wrote:
> Hi Leonardo,
> 
> Would you be able to test this patch on your affected boards? Your testing
> would help expedite the merge process and ensure the fix resolves the boot
> issue you're experiencing.
> 
> Best Regards
> Richard Zhu

Hi Richard,

Sorry for taking long to respond, I was caught up with something. I
tested the patch and it solved the issue. I sent a Tested-by tag there.
Thanks for looking into this!

Best Regards
Leonardo

