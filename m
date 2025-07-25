Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DE4C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 11:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2MpW30hc5dG04YKL/XZa/n6dZT/XHU5xFUi2UsWnMk=; b=ZcHRSms1KNyrj9DEfFcPkEXDVn
	+gan5ITBDg4sdXUGDmwZc5jBF17nb9EuUffBZlmOTQdPQdjeKCnMswbvqwRQhlzd3B7RF29jmzaCp
	9gb0ePLCbQ+VH7NnTu32KMpTMkvJAwuABH0NjNewLtX6Y3LvZI9M0vU602uvG9S/gMHmXYCzrE4dm
	9ZgG/rAXFyJBRYzuH58eDIY7ii9/IYkDHaaeIfAlrGH93yXO4z1P1Y/aamj00QgadauG7gV91TuWM
	dwXZu6snG9r5PyEp1G9X30wssGwL8BY61X/Pe+0wRlQzNbACQmj/sg6W6JlNwTconcLx9ApbvOkHI
	Us0OGcDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGJa-00000009gCE-2m2v;
	Fri, 25 Jul 2025 11:10:14 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFQo-00000009YKJ-2Jel
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:13:40 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bpNrq2wNvz6D8Ww;
	Fri, 25 Jul 2025 18:09:31 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id C1C5C1400DC;
	Fri, 25 Jul 2025 18:13:29 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 25 Jul
 2025 12:13:29 +0200
Date: Fri, 25 Jul 2025 11:13:27 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Salah Triki <salah.triki@gmail.com>
CC: Bjorn Helgaas <helgaas@kernel.org>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, Pali =?UTF-8?Q?Roh=C3=A1r?=
	<pali@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?UTF-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam
	<mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: mvebu: Use devm_add_action_or_reset()
Message-ID: <20250725111327.0000346f@huawei.com>
In-Reply-To: <aIMAkbdOyHsiPeph@pc>
References: <aHsgYALHfQbrgq0t@pc>
	<20250724164217.GA2942464@bhelgaas>
	<aIMAkbdOyHsiPeph@pc>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_031338_732741_4DA15B1E 
X-CRM114-Status: UNSURE (   9.47  )
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

On Fri, 25 Jul 2025 04:57:05 +0100
Salah Triki <salah.triki@gmail.com> wrote:

> On Thu, Jul 24, 2025 at 11:42:17AM -0500, Bjorn Helgaas wrote:
> > On Sat, Jul 19, 2025 at 05:34:40AM +0100, Salah Triki wrote:
> > 
> >   ret = devm_add_action_or_reset(dev, clk_put, port->clk)
> >   
> The second argument of devm_add_action_or_reset() is of type void (*)(void *)
> and the argument of clk_put() is of type struct clk *, so I think a cast is
> needed:
> 
> ret = devm_add_action_or_reset(dev, (void (*)(void *)) clk_put, port->clk)

Can you use devm_get_clk_from_child() here?  If not add a similar variant.


> 
> Best regards,
> Salah Triki
> 


