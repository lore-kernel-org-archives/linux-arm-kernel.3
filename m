Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98089C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 12:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6QufareNLNn3UFYbV8ntusgGG8AMzvapPp5xVg2a8Q=; b=DE8X+9DdmKs/hS+mK/BisjbdGm
	h+ssHYo3V1gvVZziBBdic+w+qm+gvz2tI4R84QOED0KVdedJj/2qZWLhaD6JtY6exuY4MX0L+xb4e
	fa2RXFRosRHShM0xaPZUOT6YWTE4p+agQY1zobauhw7vDLIVwk1Nic7Il+n+HZNzJlJ72m6lBXs5D
	zis904NaY+X4dedBdCzsffoynE38Nqa01dtF0Bb/i6n9ZCYKonAAxAE8ewqo+xY6Rio2D2IMEHCZS
	19pwo7UTKwBPHbYEotRB7x/ua5Vi2Ryez/CSU8RdPIRpV4GZ77UbyDQaE8rHjnsT3CeYx+bUFbBaO
	QoBNWkJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlRn-00000002THm-2yfL;
	Mon, 07 Jul 2025 12:59:52 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkWy-00000002Mtp-1c7z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 12:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=v6Qu
	fareNLNn3UFYbV8ntusgGG8AMzvapPp5xVg2a8Q=; b=J/CH2BNNwBz/INtXzqUi
	JzXmw4WYqaSpUAAl5/1nQT8ew9Vcj/uHeuDY4/TlaHIbmUr9vu3C9v4iGTMpG77P
	5GzWM/Aa2pn3kjxwcRSglh8NniQese4kdaoTP/O6J1V8y2kIFx2uo/NN5MgDvycW
	mX1ZNLG7AQUH1NisBz+5EdQVI5YmboE4V6rOALT7OaECyDBRR9Ywe99FCWm5jdbQ
	mSlt21SJ9K+ib9+P2+HsOAe8oyJywIL6IREQsxZ5wXBH2dcRbmbUT73lnc2ltXlg
	5h5l9EVJBJdbSP4R4ga7P5iTqAna5b89jaFCM2o1gF4bzyqI0BxWwNewC1eIQkTv
	8Q==
Received: (qmail 1234705 invoked from network); 7 Jul 2025 14:01:05 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jul 2025 14:01:05 +0200
X-UD-Smtp-Session: l3s3148p1@ksEpmVU5CsIgAwDPXxVOAFK6vZd9m4LR
Date: Mon, 7 Jul 2025 14:01:04 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	catalin.marinas@arm.com, will@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de, lizhi.hou@amd.com,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 0/9] PCI: rzg3s-host: Add PCIe driver for Renesas
 RZ/G3S SoC
Message-ID: <aGu3AJHIEYgHVRQQ@shikoro>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <aGtsM22QYqekuiQA@shikoro>
 <96af5f63-dbaf-4177-95e2-a6cc24019dc0@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96af5f63-dbaf-4177-95e2-a6cc24019dc0@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_050108_698047_4FA0F3A9 
X-CRM114-Status: GOOD (  12.22  )
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

On Mon, Jul 07, 2025 at 11:05:30AM +0300, Claudiu Beznea wrote:
> Hi, Wolfram,
> 
> On 07.07.2025 09:41, Wolfram Sang wrote:
> > 
> >> Please provide your feedback.
> > 
> > What is this based on? I tried v6.16-rc4 and renesas-driver/master. Or
> > is there a branch I could pull?
> > 
> 
> This is based on next-20250703. I pushed it here, as well:
> https://github.com/claudiubeznea/linux/commits/claudiu/rzg3s/pcie-v3/

Thank you, I doubled checked and tested again. Still works, great!


