Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DFCE63F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 04:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlee/apZf5PJS46oj3LoJC3aGU8uMTOOND+HuontO9M=; b=5F5PcQI2uDhNuWCPt6oR5ITSNb
	6zKMm4T3dojjfPKpgIr6BaUxeuBXdK3WyfAnO5oOtWNPX7zmLZLwQCVKoZ7khXUmZkdkmoQ4tDibY
	/7fF0iy5dL4mNaOMxsA9nfuXJos03baPsaYAECDT9JCyhD00YW39HosmEYpWsaZqefRrrAwTkeo3F
	biSbnslQc0MnhBlSSel9bBlM4ZBQiv31KjQ3Da0R4efbxgTq2Uc1bUu7p4fUQul4L+4VQgbMQCtxo
	lSnpgzm1hWMGO9Mkd/AgRW8dmUM0S6VwwuqUL7qjAtfDeZ0oa+SUbX/WHMmHOD6W8UwwHEHWPKVYp
	6iIqQJ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrqTp-00000005xQg-1FbY;
	Mon, 16 Feb 2026 04:45:05 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrqTm-00000005xQD-2BVz;
	Mon, 16 Feb 2026 04:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1771217081; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B7wCwXOO1D7g0K+7R5ASkP5b3rvxhtu5zZxL8YqVpQFt1/JZ0OGfTEvtEhSvZ1aG9kzbcuyqRKjnrFiKzDTa1D6As2i02L5aF3EGxVt4I9o78gOelgMF8pM6sBw+iyy8hJiZq6gYg1rV20YRQVOBiKThhEWsQIDzQegXKAbQSMY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771217081; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mlee/apZf5PJS46oj3LoJC3aGU8uMTOOND+HuontO9M=; 
	b=dplu+3QZvL7/81pGX2ryCEfkAGq6mlrKFOaZeiFG//OurBZ8Uqc5PGxtrF7/HlodlIydn7QFlPrXT/SvAmP6M5rsqw62Qw2FGcZSvtxzaA5bHjIiEUsle5GGq5B9lXnACv666S9z3iBNE/mp6hEijEQTvFglYPkiAo898Hw24VA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771217081;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=mlee/apZf5PJS46oj3LoJC3aGU8uMTOOND+HuontO9M=;
	b=bjyVvXSlGZiyFG6yYoHm9AktJOZNCeprYLUxXM/NS63tlxpFiaDSAVLC5FMVjqVB
	YeHyDUJPkr+EIwpzIhvu1Gs/0dwaYQMJZ6UJI6UErZdBEkgTxZ7ER9u6McAe5Eyz6ws
	/tGSrhTmCseqKZbrvvx7+WAmQxNMrSBxn2Xy4Gko=
Received: by mx.zohomail.com with SMTPS id 1771217079900392.5437106229082;
	Sun, 15 Feb 2026 20:44:39 -0800 (PST)
Date: Mon, 16 Feb 2026 04:44:27 +0000
From: Yao Zi <me@ziyao.cc>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: Problematic understanding of phy-mode in Rockchip DWMAC driver
Message-ID: <aZKgq0-aptu-PnsB@pie>
References: <aY9s5PXP4zZ7R6fa@pie>
 <aY9xsslT56D9LGLe@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY9xsslT56D9LGLe@shell.armlinux.org.uk>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_204502_607208_58D1D399 
X-CRM114-Status: GOOD (  15.75  )
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

On Fri, Feb 13, 2026 at 06:47:14PM +0000, Russell King (Oracle) wrote:
> On Fri, Feb 13, 2026 at 06:26:44PM +0000, Yao Zi wrote:
> > Hi folks,
> > 
> > I was looking through the RGMII delay setup logic found in
> > rk_gmac_powerup() of dwmac-rk.c, and found its behavior is strange,
> 
> dwmac-rk is very broken and is unfixable thanks to Rockchip not
> understanding the RGMII interface modes used by the kernel.
> 
> It is what it is, we can't change it without causing regressions.
> Please do not try to fix it.

Thanks for confirming. I understand concerns about regressions and
agree keeping the driver/dts as-is is better.

However, should we mention the difference between "phy-mode" defined
ethernet-controller.yaml and "phy-mode" understood by dwmac-rk
driver in rockchip-dwmac.yaml to avoid confusion in the future?

Regards,
Yao Zi

> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

