Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF44C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 07:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBUFPfqcb5RmlLprxF2vX8GSwab9JKWQEi3JfpeiZSg=; b=wNEytsscTdmLzpOrn/FyAY69W/
	/iOVb6D0+KXD+VNaKxnivO1rqKuCSJn31ShCLNFdytQROlj73P9JBdbny9KcsM/sizRYxI+xikiwT
	yq1LlAheDGL1nx8xrLvaYtMbS7GcLHwYTOmIcq4LNfEjEbcav5AdoTuMQXX+B+bX2ydfIP7q3Azaf
	kCQZTpeL8/MWDJ2+Q/51SkjBnj66B6ksUY+68i7+rdwQGboL5sNEITCE6P879wi1SvLLmBdF4dC7/
	gJ6Imtpqr3F5Gt9FMvltqgrTTouML3+8fu1apK3T3CvZD/1sevvfsvSrHy11BzwLFsUt/DdMzuaah
	PgLrpqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXb1f-0000000Dbeb-0aNS;
	Fri, 04 Jul 2025 07:40:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXazK-0000000DbQ2-3tEp
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Jul 2025 07:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BBUFPfqcb5RmlLprxF2vX8GSwab9JKWQEi3JfpeiZSg=; b=qJ4uRoT4mRPgKTHIO9R4h8fZYg
	hugKVnuw6Lj1ckVKMzTvcOaRZY5vZzyGT4tNv+d/zyDgLZF+GBg8e8mtQMrg1uTQr+UIlOkankULZ
	LPOOI9Au4GGkG+hvzpAgMwyXooW67PphNbZSx9m7EzyF0eXsn9STDrqwFsXtW8wgMsodDN4TwAuCg
	p2uXY22cIaPCYoAMYFMXSzyitFoj2f0pA9untIDx23j7qI2Hw1bRwDuJpJ3CQYSpYr67KeYTNQp7V
	XOwa/we25Jj2bRlnbWxPFT8leFXrw3aUTzjp0ZqXThgHpeTwGdjGHp87mV3bacX7vGpMZnATeNxO5
	Lj5zykiQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXazI-00000007oxE-0sVw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 07:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BBUFPfqcb5RmlLprxF2vX8GSwab9JKWQEi3JfpeiZSg=; b=u6rduk2cLDiZJ613kl3yXRcvou
	PluTPpMFX5LPyyLMgyVmlIndU0nfNy2cm9KDz2Wd2FO5PUiCTPKRsZuws0DuvHXgUEHawd15w6KIU
	tc7vp6WuCc8gqz7fU0EnlPHx8g2VKDt7KEhR9C/7DTrG58Rv9q3gXw9gWvolr+g+AdwM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uXaz2-000B1n-IZ; Fri, 04 Jul 2025 09:37:20 +0200
Date: Fri, 4 Jul 2025 09:37:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tao Ren <rentao.bupt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Message-ID: <95ff4056-d1cc-4564-8c44-0535196e7428@lunn.ch>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
 <20250702050421.13729-6-rentao.bupt@gmail.com>
 <a6f6966b-50ee-4b4f-9422-96c6ac9391a2@lunn.ch>
 <aGW8Nm8ZWMwRYVOo@localhost.localdomain>
 <220ac6c2-8373-4742-86fa-f322d6ada624@lunn.ch>
 <aGcBEHMEyQJuzmjj@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGcBEHMEyQJuzmjj@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_083736_379501_E7AF540A 
X-CRM114-Status: UNSURE (   9.79  )
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

> Hi Andrew,
> 
> Got it, and thanks for sharing the context.
> 
> I will reach out to ASPEED offline to see if they are actively working
> on the MAC fix, or if I have enough knowledge to work out the patch.

There was some discussion about what needs to be done a couple of
months ago. Look for emails from aspeed and IBM.

	Andrew

