Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A185FC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEIAK/m7WrZyrJSsVGS/iVZPONh0zjc3OTiph0Kbp0o=; b=NEzVkiyg/JnLvWu+CMT93p0C6i
	vC9FKKC4Fr8I13VGjE4OuNMWu58ZCFR9Qga8J31Wu9h8D5kMOa1jbhCmTyvMnrH1jIvZoUBQZ2PU1
	YCbvGxaHuHKoY7SZdh8vHDzjQ8Z6gMPYEKyGAX50Fh9spHaOm5uvhhKb7sVoHxCexBvo04zW0sb5r
	n5ZD0H/M/00I6uRcLjb6OaaiRgVTgtr4swmllUY4n13740RmKn0+85DwOoZf9tGZfNpAiZ9XKFt+v
	1Auzm0qlUyvFQNs7B6c8ZEVDZ1Zm8pOqp6vxhgrjTb2WWeefHy7wfOPAy4CLaEBZFA5UsQpQlSQdz
	2kY2bnPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkL7l-00000007pI6-3orV;
	Tue, 18 Feb 2025 10:46:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkL2V-00000007oIM-2Z3H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 10:41:20 +0000
Date: Tue, 18 Feb 2025 11:41:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739875275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oEIAK/m7WrZyrJSsVGS/iVZPONh0zjc3OTiph0Kbp0o=;
	b=o77uuRVLd3jCKh9qnoWx+GZW8rCqIFvnPoihABC+skfI9jhfxYy09zZ3i2TcFHx8sRChuj
	h8Rkdo/h63UwxrAs0M0nM+5AMa2nFKATUXCF5C3vUM97myBGgnZ4loMI0P8YhsucM2PFut
	FbkTe8Kj4QfNFoLoqCowjH8V9z5O+MTUJ+iv+97fzrx8Qvw256gYQBUUxX+RVrbdLTzLlG
	9NC0PH+WRRLjT79lb199DxoEsn4YImsN/Zt3w5ym41bjYoouYgDg3ktVvF9ICeyYEX5B33
	8UHVkGWoSlPM7g6d+YFOegxixkqgxCkZ1NEwpP8kma7wbA+L/+Z7kXl23Kl7Bw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739875275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oEIAK/m7WrZyrJSsVGS/iVZPONh0zjc3OTiph0Kbp0o=;
	b=QgESSf/Vee7lFLhMaetXJnky79AZ5lNHVJbAcxvK03G6+Sh444nQuHkAtbnv6bH7IiLclg
	Fh2Wk5W+vKwj6HAg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: mm: Don't use %pK through printk
Message-ID: <20250218113329-baca2d3d-5b2f-4f0a-8953-75fbba9bce71@linutronix.de>
References: <20250217-restricted-pointers-arm-v1-1-aaa0fb22e18c@linutronix.de>
 <Z7RgpaLeIPMQ7kgp@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7RgpaLeIPMQ7kgp@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_024119_858164_2A52C53F 
X-CRM114-Status: GOOD (  13.93  )
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

On Tue, Feb 18, 2025 at 10:27:49AM +0000, Russell King (Oracle) wrote:
> On Mon, Feb 17, 2025 at 08:38:37AM +0100, Thomas Weißschuh wrote:
> > Restricted pointers ("%pK") are not meant to be used through printk().
> > It can unintentionally expose security sensitive, raw pointer values.
> > 
> > Use regular pointer formatting instead.
> 
> ... which means that the warning is pointless because no one can debug
> it when someone reports that this has fired.

For the most common setups which using the default kptr_restrict=0,
%pK is already the same as %p.

> While I get the security issue, changing this is severely harmful to
> fixing problems should this warning fire.

My next goal is to get rid of the easy to misuse %pK.
If the address is really always important then %px can be used.


Thomas

