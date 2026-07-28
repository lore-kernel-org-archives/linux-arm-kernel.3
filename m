Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2358C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHPfV3RD6vW2cC87Nx8I0nem5pmDVBJJlTYT0fbqMW0=; b=2EJZIMhsUsHe9Y6G0UVHafHKph
	jxfPjvv7r9yp8HSL1IzxNlLBSh5MogHUGbVIxA1xwe4QgwA13jZSG2/f3Vq+ElSsuGm/a3oPwMX4Z
	BelxHPDJJN/U8/1oKK9QIbnIIKWxQTu6PH/o0oYcWueoUW6d1XMqJlgxHf+hLboPeMnhhyBG7l1Hu
	cqKm05ZOeksJqp6BJPnjtl3s+zcQ2U7D0PrqyQ4WCl7Ui9DAQ9pFEZWaTpeQq6EnU1bgZttwXqrGM
	eBf0empGgJlcczCAhn9XmYc5mIgL3zdZbgF8zr/Cf5iBRXgMavSGdYa75xDzDcUaUYamw20SD/YM2
	En5LADjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop0E-00000006Fz7-0GMY;
	Tue, 28 Jul 2026 21:06:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop0C-00000006Fyx-2If8;
	Tue, 28 Jul 2026 21:06:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 005F4418D1;
	Tue, 28 Jul 2026 21:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77ABE1F000E9;
	Tue, 28 Jul 2026 21:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785272775;
	bh=JHPfV3RD6vW2cC87Nx8I0nem5pmDVBJJlTYT0fbqMW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RTD4V4dmICcZrQHmHCByRSVOM4g7FmD4Rlx8Tc/7WrZ7Ocg6K08loPzrZupR7Vqum
	 8xh8QIKhzs8r+1tC6mY+duoCntPjASXlplGkK0QO/7o+PZ+HEaMM95FA5qNAXKi4zw
	 PFrZaYptH2Tbo2Bu0XBHC9pET8ZNbD8hLy+SuHovpGrNRYxequR4boeD3026UAzpd/
	 uyJFpMiEneuuIFbkN+Mpc1Xems9fkDF1AzXSkn0fk8jivs9HVwWP6lm0Stxa5C5P3u
	 ZTPmIXThwWAfhsxrB2av+b+RqJXPZ7koCPsyyFlaghz4E91aqYrgVkCF5jXcdAgTMX
	 uH5b4rI8hs+ZQ==
Date: Tue, 28 Jul 2026 15:06:14 -0600
From: Keith Busch <kbusch@kernel.org>
To: Pan Chuang <panchuang@vivo.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	"open list:ARM/APPLE MACHINE SUPPORT" <asahi@lists.linux.dev>,
	"moderated list:ARM/APPLE MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	"open list:NVM EXPRESS DRIVER" <linux-nvme@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] nvme-apple: Remove redundant dev_err_probe()
Message-ID: <amkZxmW3hGbRvUa4@kbusch-mbp>
References: <20260716033301.212797-1-panchuang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716033301.212797-1-panchuang@vivo.com>
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

On Thu, Jul 16, 2026 at 11:33:01AM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err_probe() calls.

Thanks, applied to nvme-7.3.

