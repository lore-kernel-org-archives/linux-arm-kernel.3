Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDA5C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 00:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTH5ubBaFvtiOuCzoEHsnbFqUHpQlK62t51BmbJr9DA=; b=OjQBpNkcGxxXx2+15uuuyp6Ajz
	n93kOaKmSr75ovYZubK/LOCN8ZPyYBBYKE0AFdIW65IiEzn3Uly29NNjRfDCWI+3rTb+KYNiK908e
	KTzeX5ScyHT5Vzs6/3kqRKUlOcrqMVplr2/S0DH+Pr3eh5+vzv8RM5HnR2UgZwuK3n44WFrTh/A+B
	DuM09B7wzARz5sxhvF7d98wnk1RH5JviDKP1xJ84vcxnZTgIEjPkTq0QtvZGIY4VAL+K5Kj2Z6xAB
	5h+OrAd4qxXBZsGo9HK3prUn5TkNOu6ku70709kzFNJ0f60X0w+ezhh0eW1bar1cEBU5saDr9BhIG
	A4us9hEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tijKN-0000000D1YG-1PTF;
	Fri, 14 Feb 2025 00:13:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tijIw-0000000D1No-0ID2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 00:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PTH5ubBaFvtiOuCzoEHsnbFqUHpQlK62t51BmbJr9DA=; b=LLfcA2mGWS0v3jbNQghx4fyU9d
	pV/tBQz/TBVmwzS/2Sa/YLtrAPEBLXhB8cDtEqs1ZbsS6eaLdMRn0S/thXSBxwC5a+jy3/nQt3RF4
	YB7e356r9ydi2QZ/DLHLOyAtifoOu5spI33rkGRI9rTy7bVHXLfvJozkDSJ+bL28DJUk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tijIP-00Dthp-81; Fri, 14 Feb 2025 01:11:05 +0100
Date: Fri, 14 Feb 2025 01:11:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Swathi K S <swathi.ks@samsung.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	fancer.lancer@gmail.com, krzk@kernel.org, Joao.Pinto@synopsys.com,
	treding@nvidia.com, ajayg@nvidia.com, Jisheng.Zhang@synaptics.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: stmmac: refactor clock management in
 EQoS driver
Message-ID: <00be469f-1363-4305-a631-0281c42c282c@lunn.ch>
References: <CGME20250213041925epcas5p4d37d50047359b923efd9fdcaf4b2f6d2@epcas5p4.samsung.com>
 <20250213041559.106111-1-swathi.ks@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213041559.106111-1-swathi.ks@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_161138_108799_9F9769A4 
X-CRM114-Status: UNSURE (   7.72  )
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

On Thu, Feb 13, 2025 at 09:45:59AM +0530, Swathi K S wrote:
> Refactor clock management in EQoS driver for code reuse and to avoid
> redundancy. This way, only minimal changes are required when a new platform
> is added.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Swathi K S <swathi.ks@samsung.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

