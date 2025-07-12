Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85231C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 08:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUT2px68vnOLXvRCRpQuLtBxiXFItCnfcuz7QoncXBQ=; b=GhFpoyvdv7NpuKf2BItdXmenvc
	Kf37wf1Df+4Ui4tMhBFyU2USvc6RH+FsJSLsFnOsp1+j35J1NNLGQ4zYf0SNJIPK1H7uXuVr3B5Bg
	RaCxCnDuccged7y5RIY64jH3ceG/pvGHXlgVymCPE3fFzMKbHt+9DOIrH9tbe86cOjkcuKH6/oANx
	/Hn8zeCI5WV0vjZ0hvyKBJ63KT83waW2I8eYpn+aIPmyuMZwWBS4IP8PIkxkbER2WOJeznqraNA/Z
	oM7I3QW14cSr9PRdamhO1Tz9vOQwbjte7o5S+LN4dgS62SMpfwcCUBFg8hYB+ukVq4mE6e4e4XIIN
	igyYR4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaVaG-0000000GQOX-2XRF;
	Sat, 12 Jul 2025 08:27:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaVXs-0000000GQAh-0srd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 08:25:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0A438A54D04;
	Sat, 12 Jul 2025 08:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BE2C4CEEF;
	Sat, 12 Jul 2025 08:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752308718;
	bh=Q1ofZlBrikKFTLPf3zhZD6ZmkOhZH8tx6juLuCyik4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FakQ2o7ur/BdRJYPS4kSdSvWmdXVqrrjYQRZrmziMl4apYkSR9r1DHztXPxAkRF45
	 /XpjRzGet5Y/XpOdnm2u9keQ0EXUp1HV5LdIO9XbFHZ/BHEm0e8Y8fHo+gHeKWUrz1
	 /QsZR1OEeFR2tjyAWvmKKQR+fB0fcy1YPGYUkrOX64e/sPmqGK9rvaopsaFLuEXCbL
	 KuKaZoSYKwyb8Z7uGOTgRLtApOeotzsqdSxWh0RdGctxf6i3Be4MdzKWbC03za3pkV
	 nbg/pwWwjhrvDnD6nyCIJ+h7dMtT1+wd7ra2qpCSpnNw4SpNCo4R80SNk6YhB1QPOv
	 e2gasIATfftfw==
Date: Sat, 12 Jul 2025 10:25:13 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Qianfeng Rong <rongqianfeng@vivo.com>, 
	wsa+renesas@sang-engineering.com, Jonathan.Cameron@huawei.com, 
	Patrice Chotard <patrice.chotard@foss.st.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: busses: Use min() to improve code
Message-ID: <c43lavd442fz2ah25gvxxptcx3wughgkxnpx4bvlltktqiyqo7@pfufqjlujcwk>
References: <20250709042347.550993-1-rongqianfeng@vivo.com>
 <aHFelLqnfsuaeh2Q@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHFelLqnfsuaeh2Q@black.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_012520_315548_986E92BE 
X-CRM114-Status: GOOD (  15.62  )
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

Hi,

On Fri, Jul 11, 2025 at 09:57:24PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 09, 2025 at 12:23:46PM +0800, Qianfeng Rong wrote:
> > Use min() to reduce the code and improve its readability.
> > 
> > The type of the max parameter in the st_i2c_rd_fill_tx_fifo()
> > was changed from int to u32, because the max parameter passed
> > in is always greater than 0.
> 
> ...
> 
> >  #include <linux/of.h>
> >  #include <linux/pinctrl/consumer.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/minmax.h>
> 
> Do not blindly add a new inclusion to the end of the list. The list as you may
> notice even on this small context suggests that it's ordered. Please, keep
> things in order.
> 
> Andi, if you don't mind, please fix this.

Yes, I actually had this fixed but I had forgotten to push. It's
updated now.

Andi

