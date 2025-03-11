Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF77C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 01:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tS41tY7DDIqjTu6j3CI1ICxMhGNZUdG3tCRDi/SzyVE=; b=YvCSmsQcBQrdZk0Jt42kn5T2ti
	tzR9zC6L03zDfAkhvwqapCDT56XBjAHzxjy3OqeN9Mp9gcgaKxm4KbilN60uMtbOAajJY2grMiGnA
	P5SDxi5EufvypHn9oXCeDADM1711qZg8PGO0pwBWQTo8v64xDkMi2vZEvij1OsIHDm4wI1JsutdrV
	h7v6FI7cyg3fpjQ1OHvAvDBd0M756twU80H/I7v2lOOpmZloplNOQluZJtmV3B5nxa8OUZS0wl/UM
	PED3pfHWY4hlzYnBVK7FetqeFOdkLqQ5toNCO2/XecaGEYLFB7FdWvKRHx0dbjoNoUUUiTUuTujuf
	jpVm+mwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1troCb-00000004K3s-1UvZ;
	Tue, 11 Mar 2025 01:14:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1troAD-00000004Jqi-11xi;
	Tue, 11 Mar 2025 01:12:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A0E35C5CD6;
	Tue, 11 Mar 2025 01:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC75C4CEEB;
	Tue, 11 Mar 2025 01:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741655527;
	bh=sA3uuPl/teMtJ6q0xGdImhvwtK/2w9QzGAf/f3PMDiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f5MrgNZV2LPXCnE6+ZN5NRLph4KTVqWX85H0TzapP/p03/z4O/Pw3XwFa7E10pLOb
	 M42fJfco2LUzTMsaGvgiNUi3LLdXkoKFRVN+62iVlMJalY5Cw4M9ACDSbIKU317QnL
	 YBDi2v3EW4+/rSbWS9an41aonnqKC9mlog2wU+VWBwX5T+72KLCYJA+Vpnu8SgR15w
	 AGm4BrTPiCXS2L4NFsriCVIiEC7+Qtb6FnOzBKDCbI6oH4Qtl4UWdjgJq62jMnLrxx
	 yafYTngLtgH6SEudFho423mNzWuw/IQbA103CKnBA+tMZJH4p49FCmXlF3Ptu/v1FN
	 hzelfFRSgDRzw==
Date: Tue, 11 Mar 2025 02:12:03 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Krzysztof Adamski <krzysztof.adamski@nokia.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Kamal Dasu <kamal.dasu@broadcom.com>, Stefan Roese <sr@denx.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v2 00/10] i2c: busses: Introduce and use
 i2c_10bit_addr_*_from_msg()
Message-ID: <c6xszdhx5ztexlqlmhvdn4dyz5ilzxsm7c62cvkmnwy2y3gaqc@owk2ani2emys>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_181209_342973_90E1456C 
X-CRM114-Status: UNSURE (   5.84  )
X-CRM114-Notice: Please train this message.
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

Hi Andy,

> Andy Shevchenko (10):
>   i2c: Introduce i2c_10bit_addr_*_from_msg() helpers
>   i2c: axxia: Use i2c_10bit_addr_*_from_msg() helpers
>   i2c: bcm-kona: Use i2c_10bit_addr_*_from_msg() helpers
>   i2c: brcmstb: Use i2c_10bit_addr_*_from_msg() helpers
>   i2c: eg20t: Use i2c_10bit_addr_*_from_msg() helpers
>   i2c: kempld: Use i2c_10bit_addr_*_from_msg() helpers
>   i2c: mt7621: Use i2c_10bit_addr_*_from_msg() helpers
>   i2c: rzv2m: Use i2c_10bit_addr_*_from_msg() helpers
>   i2c: ibm_iic: Use i2c_*bit_addr*_from_msg() helpers
>   i2c: mv64xxx: Use i2c_*bit_addr*_from_msg() helpers

merged to i2c/i2c-host.

Thanks,
Andi

