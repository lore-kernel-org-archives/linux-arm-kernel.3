Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB75CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 22:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXwEtPiTtY8NnrFt8WmwY1onC4xP3QHCk+kOM0E5nEQ=; b=g5A39pC1aRgKTvMtnypYut51TA
	eqqm8G77p4xRk/Oj0PQDmqayEDnhHt/whQ+l4EamTaGDOvn39bQM660qv50lIWI93Z3uFm2KL7zF5
	Q2/Qz8mOF/aPZ1yWuKlJQqlkeAJFRpBAxjYkNg46NJze6JEvyIAkYgBtP+fF6VV0DiDRkMG3zZWfm
	n2z/G9g4zIFuJuwM01qZ71rgfJzi3l86OqhpARrIYYKrhjQKiAdEz2fjX7UjFHAwugkT59m6c3FN8
	D+WcUz+fP4M/NQ0NtU/oKQhbq+HHw9wf0jzIIZI5hqGHUzySuD9CzfhXrDl4ACZrKTWOYqITDjJqO
	5uU4xtLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPpTP-00000005zOG-19Hg;
	Wed, 20 May 2026 22:33:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPpTN-00000005zNx-4BnX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 22:33:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3953860098;
	Wed, 20 May 2026 22:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5E41F000E9;
	Wed, 20 May 2026 22:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779316384;
	bh=FXwEtPiTtY8NnrFt8WmwY1onC4xP3QHCk+kOM0E5nEQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=b+RnrgCFsTXY6uym5xJad7XUGGEIMm+gTEU8fuATtNAN7vXektT7sHTbgaNkvrHus
	 LhVIWiO2yLloZFkRrh/GQVtProC8rdH00ky522apmnNMrWL5typwVNPQ/Cnr89CJf2
	 ROy29UJLg7ANFSWQhLPrFcmxCIN1nUB/SjG57PZUJ08I4ZoxZP420xXJWqeczG2G1v
	 o8G4dO5Fk62TN1elbpRPS8ccZC/rWTLLpQktPcLKJ5rJD/Bacf43CH4xgmwwVlXjX7
	 DfQHBY0LFlvU9w6wTFV5kYKj2XhMxDXX/z1wVMQvx/+0zSwwuG5IBz7Spm6dB1tyc0
	 ehpwgfa+Zn03Q==
Date: Wed, 20 May 2026 15:33:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: Luka Gejak <luka.gejak@linux.dev>, Felix Maurer <fmaurer@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Roger Quadros <rogerq@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Meghana Malladi <m-malladi@ti.com>, Jacob Keller
 <jacob.e.keller@intel.com>, David Carlier <devnexen@gmail.com>, Vadim
 Fedorenko <vadim.fedorenko@linux.dev>, Kevin Hao <haokexin@gmail.com>,
 <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH net-next v2 2/2] net: ti: icssg: Add HSR and LRE PA
 statistics
Message-ID: <20260520153303.33692fe3@kernel.org>
In-Reply-To: <1d8ab51a-6943-4978-88cf-adda8cc57f7e@ti.com>
References: <20260514075605.850674-1-danishanwar@ti.com>
	<20260514075605.850674-3-danishanwar@ti.com>
	<20260518184506.694c584e@kernel.org>
	<E30AAC96-01D2-4A23-B562-126087DEB7FA@linux.dev>
	<20260519165646.09b0783f@kernel.org>
	<1d8ab51a-6943-4978-88cf-adda8cc57f7e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 20 May 2026 15:30:24 +0530 MD Danish Anwar wrote:
> What should be the next steps here? Is there any existing defined set of
> stats where I could populate stats from ICSSG firmware for HSR (similar
> to ndo_get_stats64 callback). Or de we need to implement a new callback
> that will do this for HSR.

I'd try to plumb this thru ndo_get_offload_stats
Close enough for my taste, let's see if anyone objects.

> I agree with Luka on the categorization,

Felix responded with the MIB counters which are even better.
We should probably define a struct with all of those and then
just fill in the ones you have.

Please do the same thing ethtool Netlink does, break the counters up,
each member to its own Netlink attr, in the kernel init them to ~0
and only report values the driver actually set to something.
We don't want to print 0 for stats driver doesn't support.

