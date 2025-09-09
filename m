Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1524DCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRwvBfaT+yf+uQJrvSGSQs+uuRk8X3P8qH0TRfgm1YI=; b=NyaCXhHGq4yJKi4dx0aIQC/W2g
	v0kHhrz2glZNzu8XBOmzweWbSDZg1F6iS3Fr28+DqKUUnI2VwHsApBKmQSA01EXvZoOZFJw6MfI2v
	yMaBHQkDj+EDUWgE9/aEo3t2zACk4Ia+CcOLMqNqmixA3iKlLH7kJK/E7HYbt9ulxCkFE8D586dR4
	u1fYCG26LhLpXn9UkUu8hEuI/boC4MbxgejGdTC8nrT20K4xqFfUAqp9K9y8lu/x8ZI62x1zOpvQW
	OpdUCxbNHSrJkX+ETdrE05r50KGCsmaskK9kAhOAIWoYkQyHpymXeC+eGoUhSuYNirDlV+jTfc8GC
	GrmfBAqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw3MI-00000009Vng-3yqX;
	Tue, 09 Sep 2025 18:46:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw3MG-00000009Vlo-3uqP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 18:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lRwvBfaT+yf+uQJrvSGSQs+uuRk8X3P8qH0TRfgm1YI=; b=JPLMlUpzERItWrQzhAqHKr3cEa
	lgvLCXK/1mcEVZUS9+ZzzssMX75QpSPWHJIyM6pRvm5YRU/PHtsGzWR8x3aHbbbJOobSGp/4WjkI7
	mXAwAYChDQ4Wk/3elC1Qk5ZvYAD/S7Jls5dLP1jUWvU+MdzYMPYo3+OdDxycQMStlDTw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uw3M1-007qdT-1T; Tue, 09 Sep 2025 20:46:09 +0200
Date: Tue, 9 Sep 2025 20:46:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: Re: [PATCH net-next 00/11] net: stmmac: timestamping/ptp cleanups
Message-ID: <afb70e68-5e59-47a3-837d-d15cde9dc8da@lunn.ch>
References: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_114624_973021_0725CDDF 
X-CRM114-Status: UNSURE (   8.29  )
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

> On that point... I hardly (never?) seem to get testing feedback from
> anyone when touching stmmac. I suspect that's because of the structure
> of the driver, where MAINTAINERS only lists people for their appropriate
> dwmac-* files. Thus they don't get Cc'd for core stmmac changes. Not
> sure what the solution is, but manually picking out all the entries
> in MAINTAINERS every time doesn't scale.

One option might be to add an R: entry to the STMMAC ETHERNET DRIVER
for everybody who Maintains a glue driver?

    Andrew

