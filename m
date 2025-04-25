Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C9DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 13:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToK48pwFtidTHbMmR/zJC+YDd2ytyqYaumLmROHPNvw=; b=YJ+B9v8roCk7Gj95YmKOhFNTnK
	KDvLQZJLd7BBEXqalL1YSMzL0biRx/docezKMaYBv0C2/R8gD7TNhcQQ8bD/2G3EJiFNUFq9P7Sm0
	y5zmxGWMVX0MNkId6OIUtWb3e1cpVrkHbgH9MUdJ/YD0BVwMOCAyX96bbtqksbFR8gFuH2XguZhot
	MNMXmOpDYPuqG6UXK73H8B5L9+PqjtHnS0zW/tzTUKiCh2Vs+XkOPuCi4JtXhaLWgtIx2ZU+C6kpR
	DQ7GR5OzNQWeUk2w0EdjjlJ8V3pu88j/LdJ5j+pf65ct/TjbKDNWUxOh2O8yMOO9rZ2jFkxNdtd23
	fo3TCI/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Iiu-0000000HDJa-0bXW;
	Fri, 25 Apr 2025 13:04:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HOt-0000000GzgC-3jQT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 11:39:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC68444AEC;
	Fri, 25 Apr 2025 11:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AFDC4CEE4;
	Fri, 25 Apr 2025 11:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745581163;
	bh=EdIVNlrBhMPbcOu7pJo016eI1srQnax7e5HkwLJSElE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8E3NSus2voUjY9ZXKYq+ar8kmV6wlfkMxQELxDZTpdAbjTqgJsZ3bbiMuWYnJM+y
	 iAy5PcZl5N8zSx1NsqM7F8psWxV2ZNEu+kytpf7knXbXrMlbRoS/VqLeFGsq9C9O3f
	 mmIo9h6dyAqbgjAqFJfo3M9akE9mV4zEcqUG84kI=
Date: Fri, 25 Apr 2025 13:39:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Faraz Ata <faraz.ata@samsung.com>
Cc: 'Krzysztof Kozlowski' <krzk@kernel.org>, alim.akhtar@samsung.com,
	jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, dev.tailor@samsung.com,
	rosa.pila@samsung.com
Subject: Re: [PATCH v3] tty: serial: samsung_tty: support 18 uart ports
Message-ID: <2025042508-statute-pleading-df6f@gregkh>
References: <CGME20250417042427epcas5p2df3d35803adcb24da7d83e5df586380d@epcas5p2.samsung.com>
 <20250417043427.1205626-1-faraz.ata@samsung.com>
 <d350841c-3560-4511-a866-9490737e48f7@kernel.org>
 <06cb01dbaf5a$1ea1a8b0$5be4fa10$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06cb01dbaf5a$1ea1a8b0$5be4fa10$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_043923_944844_11A0CF1F 
X-CRM114-Status: GOOD (  13.58  )
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

On Thu, Apr 17, 2025 at 11:02:24AM +0530, Faraz Ata wrote:
> Hello Krzysztof
> 
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > Sent: Thursday, April 17, 2025 10:50 AM
> > To: Faraz Ata <faraz.ata@samsung.com>; alim.akhtar@samsung.com;
> > gregkh@linuxfoundation.org; jirislaby@kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> > soc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > serial@vger.kernel.org; dev.tailor@samsung.com; rosa.pila@samsung.com
> > Subject: Re: [PATCH v3] tty: serial: samsung_tty: support 18 uart ports
> > 
> > On 17/04/2025 06:34, Faraz Ata wrote:
> > > ExynosAutov920 SoC supports 18 UART ports, update the value of
> > UART_NR
> > > to accommodate the same.
> > >
> > > Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
> > > ---
> > > Changes in v3:
> > > - Fixed review comments from Krzysztof
> > 
> > Which ones? What changed?
> > 
> While sending v2  change log was missed unintentionally.
> Added missed change log in v3.

Can you add this properly and send a v4?

thanks,

greg k-h

