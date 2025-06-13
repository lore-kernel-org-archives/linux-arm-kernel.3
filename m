Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8989C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 20:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=BxIOv+q5sxxjZyf80LYLCzxauGtrUO/Zi6PqDpr67h0=; b=2U551orrHag/7H
	LcC7sIlvbOsumLEv2tQbJu8/H5nS55lzo6uB7+AhCtV5unywSS53hrxzobuma+GZeYr8t7HqcHuO+
	HXDnOwNoFgu8wovWU2KtOtHD9qBdhhPJNSfpeKEo1K5BgmytYZZFKJlUR7xBnDkG4K7mOMIFgeVWZ
	lUtrXsy4xK/ldm9RvQyh7CZUK9qzz3UinnbsdNVhOeR0IQ916sRfuQ7gme5H2NYHPtvyfbHkaiDxY
	6wrjd7BASq62FN97s6EUxpr9cNcRT6g6YanpB1IPdSmWi7nM03mmhcQvX3HrBo89x8ExGrdrA6Tvu
	dpJKay03+TCiI4hZb4og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQArF-0000000HYHx-3NPI;
	Fri, 13 Jun 2025 20:18:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQAoU-0000000HXoj-1rfD;
	Fri, 13 Jun 2025 20:15:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 94604A519BF;
	Fri, 13 Jun 2025 20:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA52C4CEE3;
	Fri, 13 Jun 2025 20:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749845745;
	bh=BxIOv+q5sxxjZyf80LYLCzxauGtrUO/Zi6PqDpr67h0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=o+jzNVqz6u6TfgD6nrqxLsvy4t8NSCF4OBdOTo+K7x7eSUAyfsEE4xcA54VHFfJW3
	 Z9okaMokUjeXkcLo6mXFci1sMNLH7sG+KM/ismwkQcTS44Kd4uciEuUXqE6jZYq9sP
	 jz5RH3kv1nNAxajxABKGdcmMzpV151s9KfyHQGvEVqw6BwQNWZDkgjOyAASOMGUspY
	 fH4eSKB7Ik0qxhkXZj+7ck3Z6LYx8auCe+jE6MRhfqAIe4Eub1izXKxFd1tgrUXZks
	 Jz6iAAS67THUxGLfGZk4qBvisehhM+bd8o4kTQFRqJlJwtCX5dUrvO8bFSNern5DcN
	 JqKbwp65lN7xw==
Date: Fri, 13 Jun 2025 15:15:43 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND RFC PATCH v4 3/5] PCI: rockchip: Set Target Link Speed
 before retraining
Message-ID: <20250613201543.GA974034@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <affaa12fedbb6e34696242d1f2f2dc5634b72005.1749827015.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_131546_555408_429B4380 
X-CRM114-Status: UNSURE (   7.21  )
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

On Fri, Jun 13, 2025 at 12:06:00PM -0300, Geraldo Nascimento wrote:
> Current code may fail Gen2 retraining if Target Link Speed
> is set to 2.5 GT/s in Link Control and Status Register 2.
> Set it to 5.0 GT/s accordingly.

Nit: I don't know what "Gen2" means (and the spec warns against
assuming spec rev maps one-to-one to a speed), so try to use the
actual speed instead of "GenX".

Bjorn

