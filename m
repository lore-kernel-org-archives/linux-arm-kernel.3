Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39822C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 02:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGsz/AIlg5zkRhqib8+rxPKlP5FHVXhKZMGyojJ8N8M=; b=mFJhN63IM9F9YhucBj7dnCrBuY
	F8apGiVxyMyn5EY+SwfdfTtkCnoySWLKokMhO92sgX1LPPcAKjQtGEyvujIPLDYHT+3P0JN1S9DEI
	zEZyj8gbD/ZI5CaKrGSCz/JfMjrdJ7CtqxPpavAtEk6G/UzgHkA0dE1Tz7/O4332ok0s3uoYueZfB
	X10eHtgGn82NSFH/g/jX5yYyh6dH9v1PzU/dT2+lx9ZizJSxFAyhLep2qBZHvraf5eR6JbQSu7A4R
	JiQYAZ6+V0wulHuDKQYZCyqyQylDLnCBz8JtBomWTDWXfO+oYllbn6LoJCGCtFBfcT7lLNrNge/KC
	3TSnrPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4UH4-0000000DES7-2cLB;
	Thu, 10 Sep 2026 02:12:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4UH3-0000000DERw-2ml2;
	Thu, 10 Sep 2026 02:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jGsz/AIlg5zkRhqib8+rxPKlP5FHVXhKZMGyojJ8N8M=; b=j55YJcybmcGZIPMfXbgdVN7TJm
	CmtzA7bR4AxBqvDcQPKIf38Ipil/DqW8mvjFA8ta07AGgEPoyc2P4yFIfsalYYZVGTREC2rRdtG2/
	7ZtDy8G6WW5gvnVGqeXD9/nMiO4f/AcbbyoxfbqP11XhVI1ULa/nTpZRWz5uzcdAdYi/LO0wwmPBf
	y4LLCj/wM5Cin8SyDeE1yTDdhQMLb3CNOe3Bc0/P0W/fjj0CYybw3FZIIYxHTR08v+/ZtSD194Nih
	5P8RvwzuunRTcrrGuL7sE/08NYXm35cfiBmfTUgZpJrHvrpfMceuv3LyBxmNQuJ25TpPKULnGDFsU
	/paoe+gg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4UH0-00000001uEl-2hN9;
	Thu, 10 Sep 2026 02:12:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jGsz/AIlg5zkRhqib8+rxPKlP5FHVXhKZMGyojJ8N8M=; b=KscgrVCZFZYlw91Zfay36req7N
	H+xB8J5nRlxqnmO4DJyEFdZk7QSJlpNFWMTLkzfQskL/eaUn53hrCUrEd1l/PLzmmytAPjQ2g/ZZE
	ljxyu8D0D96bMzqDP6vHjAbBbQ/75IJQ1Xf5uCjVHBlwmuAhBfXF5MwP3LxLcibuME24=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x4UGP-004Pzi-CH; Thu, 10 Sep 2026 04:11:45 +0200
Date: Thu, 10 Sep 2026 04:11:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, vadim.fedorenko@linux.dev,
	maxime.chevallier@bootlin.com, dong100@mucse.com,
	wangruikang@iscas.ac.cn, 25181214217@stu.xidian.edu.cn,
	hkallweit1@gmail.com, han.junyang@zte.com.cn,
	xuanzhuo@linux.alibaba.com, enelsonmoore@gmail.com,
	jes@trained-monkey.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, naseefkm@gmail.com,
	b.larsson@gmx.com
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: econet: add EN751221
 ethernet
Message-ID: <a9eac625-f0f3-47db-ac2c-26c7df66f52a@lunn.ch>
References: <20260909212146.3184077-1-cjd@cjdns.fr>
 <20260909212146.3184077-2-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909212146.3184077-2-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_031222_964107_E5A5F458 
X-CRM114-Status: UNSURE (   5.57  )
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

> +        gmac1: mac@1 {
> +          compatible = "econet,eth-mac";
> +          reg = <1>;
> +          status = "disabled";
> +          phy-mode = "rgmii-rxid";

That is a very unusual phy-mode. Is there a reason this is used in the
example?

	Andrew

