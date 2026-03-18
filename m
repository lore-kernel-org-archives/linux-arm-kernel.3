Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E68103E177
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 13:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ngvjbg2owvlLjhgMPsyht6B+xZOWJHIwazKhoab6Ps=; b=Hh7QZAief/bxbbmYrZu8ftoR1F
	M53b8vFFEO08UGmUHvtK1Z4amO/ir6AAodiVYnqnpFEwNQuc8Wme8NB49ZHYMWCK+4GeRr+Mgke90
	w1JUKYJVUa8fcWLa9eitg1+re3gizOo7n28pjLpiKjp72WTE7scGW0JSjKZ9oLfXb18nZE45BNJop
	Bu3WboKrr+eu2GjJK8BPo9hmANjfsQWOFRfO93HGBhM1s624koPPeflcBO7ueKgxyHI/EaNUfelOO
	/4HDxUqQlOjd62iOdPVyIbctL8X/aNg9A6U+csJuPJEEyS7EE+Bz4iMlnO8dvH0IKwJjNCj0W1GF0
	NdQsyK5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qzg-00000008UD6-2buy;
	Wed, 18 Mar 2026 13:31:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qzd-00000008UCe-1MA2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 13:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8ngvjbg2owvlLjhgMPsyht6B+xZOWJHIwazKhoab6Ps=; b=aEPsufEoQWBRy+nsDAHoW6gfFi
	S6BUHyWkgAs6a61dnE/UZr8N02srtqBW0PwHXklA2nhXH+hCnZwsBPM6jrHub8POkORmKyEUO/Zav
	AxHWj8FJSIm3Pvc2+hS2Askd6vsKiTqpqzLBoKS4VjZmHA2E0VxcoJWbBRDUwUI/ettY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w2qzZ-00CCjg-DZ; Wed, 18 Mar 2026 14:31:21 +0100
Date: Wed, 18 Mar 2026 14:31:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Li Jun <lijun01@kylinos.cn>
Cc: gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
	linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm: mvebu: fix null pointer when access
Message-ID: <017b3e32-aa6b-4f59-a200-acdcf29a6978@lunn.ch>
References: <20260318082143.2560586-1-lijun01@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318082143.2560586-1-lijun01@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_063125_359403_D620D35B 
X-CRM114-Status: UNSURE (   7.53  )
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

On Wed, Mar 18, 2026 at 04:21:43PM +0800, Li Jun wrote:
> the kzalloc&kstrdup may return null pointer, will cause kernel panic.
> 
> -Fix null pointer.

Please don't post new versions of a patch within 24 hours. You need to
give reviewers time to actually review.

Please look at my comments to v1.

       Andrew

