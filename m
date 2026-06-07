Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4DECD8C89
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 17:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RC4UpJZWJ3dXT7LKa11Eh5lvkgD8MR6nBFl7fzqu7wY=; b=Exw7AlIquAKizeGoeJC5eskOJb
	ac8jY1FMbjQ44C8sUyujjG7Q4AjE/OCV2w+/WzrR3HkFW9zJkxqf0SnCwm6t9MRQEp1gC99CsvQl0
	BWNZEik4B252OgC5mcTDmU9ZvXL+MArvDlWP/Uw4BOYeUWYSC2MoccD4AZ6Uk9ftqex3eP62AkqC1
	VH4bC0KHgaaeOWOwm9xIilqPIMkEjuholwG5oha8GzGp+s9RdNLupgOldBBbBNT2eGkH2Oau1dARB
	gdH/eSs1EtZJqV7dchaITHN9NA1WbRteOGfswFoMcrWe8GH79MYJv3DUo5tYnHS9g3q+QftPAux97
	B93OzDbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHgf-00000002Nc2-0lqN;
	Sun, 07 Jun 2026 17:53:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHgc-00000002Nb4-0bA3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 17:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RC4UpJZWJ3dXT7LKa11Eh5lvkgD8MR6nBFl7fzqu7wY=; b=0kEo+1jsZFmFPuILPU9h2Z8lK0
	Tw3q/RsYcediV3XhUhcgz1JZyCPjTJbVqiHFhYhnrYRh5JjHvOVU4aib0LsSn1jxM9cKym+PQh0z+
	bIovlTt9IcCUj1kEWGq/mQ6LuxQ+pbLPW6ZZ/t/TAnOA2bZRwcQwVSX+NwRlbO4jA79g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wWHg4-006UW9-B8; Sun, 07 Jun 2026 19:52:52 +0200
Date: Sun, 7 Jun 2026 19:52:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	arnd@arndb.de, gregkh@linuxfoundation.org,
	Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
	boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
	julianbraha@gmail.com, livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com, me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
	rohan.g.thomas@altera.com, sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
	wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 05/14] net: pcs: pcs-xpcs: select operating
 mode for 10G-baseR capable PCS
Message-ID: <1225f728-8b54-44fb-bf70-94e3966359eb@lunn.ch>
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-6-elder@riscstar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605010022.968612-6-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_105326_185549_5355FABA 
X-CRM114-Status: UNSURE (   6.95  )
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

> Rather than introduce another quirk for TC956x let's attempt so solve
> this generically by setting SR_XS_PCS_CTRL2:PCS_TYPE_SEL to a reserved
> value when we detect the right we detect the right combination of phy
> interface and XPCS feature support.

This sentence is broken.

     Andrew

