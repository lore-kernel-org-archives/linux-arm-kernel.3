Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EE4CCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 16:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaRSA/9H5/P6gwgX371CjFBbwmnK77gJo5iwSc1cq58=; b=LhLZYXKf2ak9lMWKCEUBsc8TEb
	XKxtQKq8F/wU6b5tR4lo2f4RMB9R8Y0MZO7f/oKQTOIsAQSx+JK6bGg/hiE672q3XVy8VuvuTdC8U
	G5Z2Kdb8DEjDaO9vwxKlDARht2WGeE3rATwId3pWp5S6KJphIpEQ3Aeu/Y1yJiTcT3bIiOYHm4RtS
	RZv7JKuxZMicSDq2BUVY7RdZFzlxFgOuloLS3PNHdB1e2tqMTAj0yZdiacQ53SEDsDw539g0GaH/8
	Xu3p86KFozWePpU90FJNqKXkGTln2wMO1qrURtJNaSc8I0CqN8aJ5DHI9EDJrCEGUyldFDhzbjDN8
	/eNHeOvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJY4-0000000C9yp-1Ymf;
	Tue, 04 Nov 2025 16:06:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJY3-0000000C9yf-07hD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 16:06:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20187601EF;
	Tue,  4 Nov 2025 16:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A37C116B1;
	Tue,  4 Nov 2025 16:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762272377;
	bh=cqnsj9XBWpA/oXMHKuywF+Rto0eI5dkzdtMZHlTkuqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J0VT8l1YwCz0aL5Sk09v0FM4wvGDp5jij9JpYzehChgsUIj2u6uqPYDJB7zV782j1
	 RecSNVoTaDhPf0H+nE3KEStkTYStPtppR/swvppzJ2uzFfQZi7ousHGgrxo4SElonq
	 JWxZynB1J1tkgJsFw+a8Ftck4Izuo/a2BsXqNCUtSQlqJj1QRN5uGqx79WZqW9NqKE
	 /bCXMvn+ElEJj31ot6BotlPjou3zy3dZbozlCHYfvgWy0shS3OU99oNNwN8h4i0W+s
	 x1m7I6nXGhwZJ1idJbHp9Wr9ya/JyaYuB1j2D7dhb+EdscmNmDFsDOniANWq3v7zKa
	 ZYnMPZ+lnnvDw==
Date: Tue, 4 Nov 2025 16:06:12 +0000
From: Will Deacon <will@kernel.org>
To: Hanjun Guo <guohanjun@huawei.com>
Cc: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4] ACPI: AGDI: Add interrupt signaling mode support
Message-ID: <aQokdBkjFqw9ZGRt@willie-the-truck>
References: <20251017073935.1746365-1-fj1078ii@aa.jp.fujitsu.com>
 <a93e845a-b084-a680-7158-68363c492b75@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a93e845a-b084-a680-7158-68363c492b75@huawei.com>
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

On Mon, Oct 20, 2025 at 09:23:05PM +0800, Hanjun Guo wrote:
> On 2025/10/17 15:39, Kazuhiro Abe wrote:
> > AGDI has two types of signaling modes: SDEI and interrupt.
> > Currently, the AGDI driver only supports SDEI.
> > Therefore, add support for interrupt signaling mode
> > The interrupt vector is retrieved from the AGDI table, and call panic
> > function when an interrupt occurs.
> > 
> > Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> > Signed-off-by: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
> > ---
> > Hanjun, I have addressed all your comments.
> > Please review them.
> > 
> > v3->v4
> >   - Add a comment to the flags member.
> >   - Fix agdi_interrupt_probe.
> >   - Fix agdi_interrupt_remove.
> >   - Add space in struct initializsation.
> >   - Delete curly braces.
> 
> Looks good to me,
> 
> Acked-by: Hanjun Guo <guohanjun@huawei.com>

I wasn't cc'd on the original patch but I couldn't figure out why it
uses IRQF_NO_AUTOEN when requesting the irq given that the first thing
it does is enable it.

Will

