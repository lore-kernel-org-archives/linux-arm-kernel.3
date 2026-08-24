Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD733C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 12:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5+FTcJeQfZJ79QNwnVuBLuUcoOGbLQYmpNKCs0b0/A=; b=UWWkRlhWX+FxgYOrUhRmFVCa09
	NO3LylPYvgDJBYNt6FIpBaePmclWkrGXoJbQ3l9fi8bsODm18K0ILHplv/BW66stBGdsjV1Xl+g9t
	o1f9EXjoqCxt5+6a+0qYizPWtAdCWZV03zNXKbiyv4Sv7vfbPiGgqSV/5i4+oeGIAlrQDqEH0vCBc
	mm0+wivN/e3wJMZvHNB5zIPtwj7vms88CAJ/dMSzAm7iv/ykXO5GTqYZmHi2pEvmwLotsodvvi7oR
	h3ybN3P0n6ZflWeD04wVm/02uMTgA7+HPoHV0K/Fz5mEZu9ok0jKjOOfbDcP95AY9of0UjqXTrrVV
	ivP/02Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyTYG-0000000Ga8e-2Ftl;
	Mon, 24 Aug 2026 12:13:20 +0000
Received: from mail2.dspace.de ([80.228.58.149] helo=mail.dspace.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyTYD-0000000Ga7N-1u7R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 12:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=dspace.de; i=@dspace.de; q=dns/txt; s=dkim1;
  t=1787573597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C5+FTcJeQfZJ79QNwnVuBLuUcoOGbLQYmpNKCs0b0/A=;
  b=GXj+UQaBwYOtYuXk0Uf2rfVpI7X+LFwl/q8Ovb3/yZz5cx5PZxIxSev8
   X3RxjcMJoreBVi18Va0q6Wn7nKaFFiGB8E49RlIfa3/1K67+7BzEETh6D
   j5lF3kyp7NMOPmmA/h+ZzQ3GfY9zfhH0r9lPfgJ9n74Q+7WA+R0mt8Fds
   A=;
X-CSE-ConnectionGUID: ibBBQgkQSHu4RUeEFYL0Tw==
X-CSE-MsgGUID: emOEdhnyR4uvF9vS93N+DQ==
X-IronPort-AV: E=Sophos;i="6.25,240,1779141600"; 
   d="scan'208";a="5057880"
Received: from unknown (HELO Z1-1000) ([10.1.1.222])
  by mail.dspace.de with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Aug 2026 14:13:11 +0200
Received: from VM-Z1-1000-LIVE.dspace.de (localhost [127.0.0.1])
	by Z1-1000 (Postfix) with ESMTP id 5D89760038;
	Mon, 24 Aug 2026 14:13:11 +0200 (CEST)
Received: from exchange.dspace.de (EX-DE-PAD-SE.dspace.de [10.100.196.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by Z1-1000 (Postfix) with ESMTPS id 5030660037;
	Mon, 24 Aug 2026 14:13:11 +0200 (CEST)
Received: from PascalKW11-NB.dspace.de (10.71.4.31) by EX-DE-PAD-SE.dspace.de
 (10.100.196.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 24 Aug
 2026 14:13:10 +0200
From: Pascal Kneuper <PKneuper@dspace.de>
To: kuba@kernel.org
CC: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com, 0x1207@gmail.com,
	si.yanteng@linux.dev, larysa.zaremba@intel.com,
	aleksander.lobakin@intel.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	DBaldin@dspace.de
Subject: Re: [PATCH net] net: stmmac: restore NET_IP_ALIGN in the non-XDP RX
 path
Date: Mon, 24 Aug 2026 14:13:09 +0200 (CEST)
Message-ID: <20260824121309.45411-1-PKneuper@dspace.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260818012216.3825070-2-kuba@kernel.org>
References: <20260818012216.3825070-2-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.71.4.31]
X-ClientProxiedBy: EX-DE-PAD-SE.dspace.de (10.100.196.14) To
 EX-DE-PAD-SE.dspace.de (10.100.196.14)
X-C2ProcessedOrg: 563f5800-21cf-4d8d-8aed-fddd1469e4ee
Content-Transfer-Encoding: quoted-printable
X-TBoneOriginalFrom: Pascal Kneuper <PKneuper@dspace.de>
X-TBoneOriginalTo: kuba@kernel.org
X-TBoneOriginalCC: andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com, 0x1207@gmail.com,
	si.yanteng@linux.dev, larysa.zaremba@intel.com,
	aleksander.lobakin@intel.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	DBaldin@dspace.de
X-TBoneDomainSigned: false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_051318_104631_2D3D69A7 
X-CRM114-Status: UNSURE (   9.73  )
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

On Mon, 17 Aug 2026 18:22:17 -0700, Jakub Kicinski wrote:
> [Severity: High]
> Should the XDP branch of stmmac_rx_offset() get the same treatment?

Thanks for pointing that out, you are right. I reproduced the panic with =
a
dummy XDP program: without NET_IP_ALIGN in the XDP path my box again dies
on the first incoming ping.

I will adjust the patch and retitle it accordingly in v2.

Thanks for the review!
Pascal

