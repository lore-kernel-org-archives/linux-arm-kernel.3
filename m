Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4317AC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 23:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91F3vOqLkxgb4YBcryRiSTb82yMih5D8zxGHmtfCFns=; b=Wn3yQsYNlyB2U55Eozdssg8s5E
	+jpWia2AEzgdXNpLoxUC4sckU8l1A71cyMQt5N6oSoCZdoPUGZJHsPP4GavQnel3BNjwGeO10t0mb
	SIgOcKSuDbUDCammbH67A72c0YQeVzB++S3x6Fy0js0aANH+nUJMYC4Orgguf/TPihh5CV946MsI+
	Ddj7nDZ+9jzVsL6YU6i+AyHYV3/gxzwvzA/lNOvm2+IAba4yuZ4AGpJf+dVfsExM+tW4U0wx9JzOw
	gAmOuCZeAPppnj21ic+xjpVAa41vmUJ6QwUOdLb0Dbss0cYYjjpYGQGR9hdlayby7zUT00JSCoxXl
	iZ369/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrOTi-00000002v7c-1AhQ;
	Tue, 04 Aug 2026 23:23:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrOTh-00000002v7W-01nL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 23:23:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0543A600B1;
	Tue,  4 Aug 2026 23:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C771F000E9;
	Tue,  4 Aug 2026 23:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785885799;
	bh=91F3vOqLkxgb4YBcryRiSTb82yMih5D8zxGHmtfCFns=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LkZgbuXurgxi3s/7lsrqnlNcf7uHzB3/DAtMhqmR/tDo2MnsTzHwA0I2gsvqmGzDz
	 Xfq/zRD6E3mKnSCvsPrpZLGOxi/7Vzl8g0BEQwUGl/mC1IpD6OXfmbQCTyVcus5e19
	 XQXSFSFq6mKHhj+ETefgkmu3vD/wZSPY+4OWpQIiUpIDSASEZ038HyKHuE2ZdRFbz3
	 bNo6g7fa/0UBOoMdr9IUtzL/CiOB5fs+mZGRYH2jYEHmNbBgTZ4E559Hq9zqh6SFCt
	 PL5TAdoNwGIYKC/OA9X13kIYGLtmq7Bt5d5ED15Nb++YUvUZzfWDR8Nwy/9/rsKmm4
	 JI3O3UpdFESNg==
Date: Tue, 4 Aug 2026 16:23:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "maxime.chevallier@bootlin.com"
 <maxime.chevallier@bootlin.com>, "andrew+netdev@lunn.ch"
 <andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, "alexandre.torgue@foss.st.com"
 <alexandre.torgue@foss.st.com>, "joabreu@synopsys.com"
 <joabreu@synopsys.com>, "jun.ann.lai@intel.com" <jun.ann.lai@intel.com>,
 "yi.fang.gan@intel.com" <yi.fang.gan@intel.com>, "boon.khai.ng@altera.com"
 <boon.khai.ng@altera.com>, "matthew.gerlach@altera.com"
 <matthew.gerlach@altera.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net 0/5] net: stmmac: Fix double VLAN 802.1ad tag
 handling
Message-ID: <20260804162318.0bf48050@kernel.org>
In-Reply-To: <OSCPR01MB12769B66B3A1316E8B05AE8CAD3C92@OSCPR01MB12769.jpnprd01.prod.outlook.com>
References: <20260729095110.164157-1-ovidiu.panait.rb@renesas.com>
	<d39c7b4c-04b4-4bfd-8a4b-821a8a32a885@lunn.ch>
	<OSCPR01MB12769B66B3A1316E8B05AE8CAD3C92@OSCPR01MB12769.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 30 Jul 2026 08:57:23 +0000 Ovidiu Panait wrote:
> > I stretch goal, if you are interested and have time. Can you turn this
> > into a test somewhere in tools/testing/selftests/net ? If one MAC
> > driver has it wrong, there are probably other MAC drivers which are
> > also wrong.
> 
> Sure, I can add a test for this in tools/testing/selftests/net. I'll include it v2.

small correction - .../selftests/drivers/net to be exact
and if you can -- please use Python

