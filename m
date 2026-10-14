Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86318CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=; b=cO1iQ48XF+E3oX9WZM8VbCCjDw
	MY63rgVnRPla5p+/KHWy3K4MZm3C+REPQPUHB+27xcx0ykIjhQxW0VXViTd7RUJPwK5J1jx1Wc9Ai
	pXnJICUXUjrHcNo14STAJeuy4ZJ1xeNTKuhv6WMCcw/bm9oSioHY5wmNDRHsJEBkteuXogiLwCoI6
	0rc2/hE6SWGbIoY6bstFbmUZFAavwKQkkczOwKI5BFI4TQJid63AGMiA8ILeVjwXrwnqouWEFI3rS
	U2cF8lQOevsx+tfUV/rzryvg4puvmSZVWa5DtEhvEAAyteurpCd8LAgQppykD58z3qFLIWszAhEjf
	fDtaYc9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyg3-0000000FXC1-0LHo;
	Wed, 14 Oct 2026 13:05:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyg1-0000000FXBg-3yl2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:05:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E767600DA;
	Wed, 14 Oct 2026 13:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8621F000FF;
	Wed, 14 Oct 2026 13:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791983148;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cRkzIA7P6kReMHys5hr8tjkJt9YXh81X7TVdLyTPgQakkRldWUIwzGnk0++peqf3m
	 dRtWMvOXhL9HkAhbZ9AqxXzz6sHtVo0jSdqtnrn/0RtjlKRrd4glSLOBAmjmzoEU0z
	 LKkqU7RcGYqalB9jpmbksVif/W0yfwnK7Js6hbVP22PzizygLIPDtVBfIlB8z4+h6C
	 p42UhHWtZnoQRhgGNOZoG1AlXHfiuMh996lysDT33eayNX0XuVFPNbJurA8HNUKW3b
	 E2b0yg1tTvpK1Yz7Oj5zZdhI1Vyv82tGMrz5wfULAS6nITI+vWCkuIR4EwXoDFuYzU
	 SaPXEEX8/jv1g==
From: netdev-bot+sinfo@kernel.org
To: Rishi Kumar <r-kumar12@ti.com>
Cc: netdev@vger.kernel.org, MD Danish Anwar <danishanwar@ti.com>,
 Roger Quadros <rogerq@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Meghana Malladi <m-malladi@ti.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, Kevin Hao <haokexin@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 j-rameshbabu@ti.com, aaron.richard@ti.com, l-chinnannavar@ti.com,
 m-santhoshkadavan@ti.com, k-tiwari1@ti.com, a-dev@ti.com, pratheesh@ti.com
Subject: Re: [PATCH net 0/2] net: ti: icssg-prueth: fix port config and rx_mode drops
Date: Wed, 14 Oct 2026 13:05:47 +0000
Message-ID: <179198314724.320699.12261216986083339257@kernel.org>
In-Reply-To: <20261014125948.230571-1-r-kumar12@ti.com>
References: <20261014125948.230571-1-r-kumar12@ti.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

