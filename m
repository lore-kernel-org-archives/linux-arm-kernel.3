Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4204CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 14:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqRuIKKvAbmniJu6GGfOc7x36kGLyzQ0kjsPEDpVaBw=; b=sVd+SwfZg7owtpjOwNRazGCVuL
	PKZlekQMoHQ6o4aaaK70QljWU4KtY6H/l4Op6lHs452MAASwv0zVtdAoQZ0Znno+uZ7YhMegSPrsA
	DHCAUV5m78OKB7Bs19nbQUbfUUzwEI6gS266y4WEHMSqVxNGGXj0cOPAYzF6hjjadQxt66wYVO3iv
	VBfXROgjEJ7Zm1JW9k+QZsSOKi9Z3UzKA4+7orqB6zm0f+g4l+dEl6DvzjX/uhWZoAJrI+4a3OkCo
	8GJwifNmZtzYAoJE27xvjxuFAI/0VlUB6QqskD6kvAXyWkf/HMesCOwRkY2m9xxEz+xMVOmsB+Mzx
	MM2oP4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOcMg-0000000CqJX-11Zj;
	Sun, 17 May 2026 14:21:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOcMe-0000000CqIz-3yq9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 14:21:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5927E60125;
	Sun, 17 May 2026 14:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B340CC2BCB0;
	Sun, 17 May 2026 14:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779027667;
	bh=oqRuIKKvAbmniJu6GGfOc7x36kGLyzQ0kjsPEDpVaBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMJFwlTQzYuUBsbCWJJts/oXUhdym/cPjgxl6wEbtBsW9yRazf8SxZIiQBvyR/uAy
	 DLkOA0BuY6uSgFhkv6fx2OfYtD1em33KEwsxL7LnDxB4JUJaK3rp0c1HaNbdoMZRWO
	 mddNHDH0wcSfY0oJlaxF2I6QOmR1SprHwor47xyI=
Date: Sun, 17 May 2026 16:21:10 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Xie Maoyi <maoyi.xie@ntu.edu.sg>
Cc: "neal_liu@aspeedtech.com" <neal_liu@aspeedtech.com>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: usb: gadget: aspeed_udc: list iterator used after loop in
 ast_udc_ep_dequeue
Message-ID: <2026051752-passage-thinning-cc4d@gregkh>
References: <TYZPR01MB67588F1EEB07DBEB681AEE1ADC022@TYZPR01MB6758.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR01MB67588F1EEB07DBEB681AEE1ADC022@TYZPR01MB6758.apcprd01.prod.exchangelabs.com>
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

On Sun, May 17, 2026 at 02:03:47PM +0000, Xie Maoyi wrote:
> CONFIDENTIALITY: This email is intended solely for the person(s) named and may be confidential and/or privileged. If you are not the intended recipient, please delete it, notify us and do not copy, use, or disclose its contents.

Now deleted.

