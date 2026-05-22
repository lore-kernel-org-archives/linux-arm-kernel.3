Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4816CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 12:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OP5kDDbyBhNllN1CVAUniMuZiS5jxiyCHBQ7Quk3BjE=; b=ES0wvy0zI1vy4kWj/iTGDqyzvq
	R8E+IYnra9AJS2Rj0YXAHXfsm7gi/kpLhoByj0tnEnQM29KXj5eDKMKgQCHnGLfoKBbbIUyjiJZti
	00Do0sm3YHINvZOTWMwQbYJAafeAA36NLFS+Tau50e+cXW0jQuCIa/e2HYQW3RG/5Uk53fnQXKkD/
	hrrDqL2wsfxC/RpzW0yN+vL1hOd+1gIKTqdNZg/QvRdevDL6RZwKsuN+0s7R6bOqZFZNfRY6Twsr4
	36ZRuj5p+tzLFv2QfLST7xS/Gt/t5QU/2ndxAoN0N+Bt7/r/Op1Q2XPLcOMWVtrSPF43N8fa7nUul
	Y+HhJk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQOmJ-0000000Aklp-3UIC;
	Fri, 22 May 2026 12:14:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQOmI-0000000Akl8-1Bhq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 12:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OP5kDDbyBhNllN1CVAUniMuZiS5jxiyCHBQ7Quk3BjE=; b=3sAJHlb1Y53fSEQSPVdAZv/eZp
	Q8qp25xnlsxFpfIamFD5kztSb+v2mEAFDvjR3XMwVVWbyJtolvV9oZu5mPdm9tVtYeMzClk4AKhUn
	ykIWGY3DIiK+ciO6VW26TzXFSoknY2RgYO42+xJe+6vyDFkpwLsyNaZH9nJDx8h+00N4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wQOm8-004AaJ-07; Fri, 22 May 2026 14:14:48 +0200
Date: Fri, 22 May 2026 14:14:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Abid Ali <dev.taqnialabs@gmail.com>
Cc: alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org, pabeni@redhat.com
Subject: Re: [PATCH v2] net: stmmac: mmc: Remove duplicate mmc_rx crc
Message-ID: <12d899f2-3baf-4ad0-8834-a489cba543bd@lunn.ch>
References: <2d702678-5b2b-451e-b692-228efcbbefc4@lunn.ch>
 <20260522065434.6231-1-dev.taqnialabs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522065434.6231-1-dev.taqnialabs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_051458_318314_84A20862 
X-CRM114-Status: GOOD (  10.37  )
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

On Fri, May 22, 2026 at 06:54:34AM +0000, Abid Ali wrote:
> On Thu, May 21, 2026 at 20:44:53 +0200, Andrew Lunn wrote:
> > Thanks for the updated commit message.
> >
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
> Much appreciated.
> 
> Should I send a v3 with the Reviewed-by trailer added ?

No need. patchworks will pick it up when the Maintainer applies the
patch. You only need to append it if you need to send a new version of
the patch.

	Andrew

