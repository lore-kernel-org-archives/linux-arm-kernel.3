Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECDEC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 02:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ly7V+HLOmpt1krXWs5pekyYKQV7pHZ0Cd9u5HrGrj3s=; b=ZFDTTLtFS8jvFKwIu5c1DGBtLm
	vYs9nIESfbraVzDAD7RtOp8wk7SgBeuEdDB5c2idO+2uRCQZq8HZZgqP8MyBnCYcjfKndUEr4ab4G
	ztlMfpahqtNAl29LsETH3hTD8HgO/O+9j//q+NWp1EtdUkNXi25zpIAc1humbdXi6p35QaPsvRibt
	1wXG1Wce8YezST7JKFH6CNIyg3lYDjMWp9REgRuzLUWrMPEBs5M6OIqzWsPn4BepP6uezayM/XpsM
	sP/Z4FLcmUWiwqVyLZlOyx5OmHi31IJAoXn56+y9koNuVPHkdV7jqa7sj0jS5b3nkzJdxpjDKfcDH
	ieiEJj8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyGO-0000000FEEJ-2H5o;
	Wed, 12 Aug 2026 02:00:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyGL-0000000FEDo-1LUY;
	Wed, 12 Aug 2026 02:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Ly7V+HLOmpt1krXWs5pekyYKQV7pHZ0Cd9u5HrGrj3s=; b=GYXks1UT51F4zH/zLJcpn3iwH6
	xLND+Q5ZceX6yvFq4IdWGbgkCBnrrNo8VLAxq7dXv99RWR7LXVd1Z37zCJgn3fh8uMoVlTq0cvn71
	syxQj0c6C1uNLBIiiSC+A6pQA2FvRjdWmCyQaxBTMrz2IkfXyIgeYpMhtclMFgR/15YRzI60FuBqg
	NOPsoO04NCcdDpI42teVVtiXDLfkl7d+8cs73wKwr0ZzK5b/zvExk5Ura3xtXewb4Po2EZOq3i5AX
	8VZRL8RW/mACEr7gBNytYxnQFPE2BANZitrh1kyA6tIgDKO2TdKLXKzDxRxuHz4Pu5vqGiRreyZR7
	MiqgKA0w==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wtyG2-0000000F2WI-2hiE;
	Wed, 12 Aug 2026 02:00:11 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67C1xH1L13194414, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786499957; bh=Ly7V+HLOmpt1krXWs5pekyYKQV7pHZ0Cd9u5HrGrj3s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=U92UbWSKe6Hmwvbzfmrd0ZFeUTaqeLcFvgul84ANEPrLmZSO4kvaxLsVFnPIPHuCJ
	 9t4bVgMtnBgecHYGScjCNlhyqtuclQoIdLa4bGAd3IIZBTlGAvNXZUafyIIeSKp1n6
	 lgl6F988U2RhT9uD0y+58H5RrWsEHfLmmovdauwiI8l+esQSgIiqUss6TotP6sOo6Z
	 sOTSWBQRak4bMDM8hGRVkdn4cRVpj0NgdqjwagTzc4cYJnIhYeechh5KZTNALiRkKG
	 7n87Rn4Oz1wNYTO8a+0MyZ8IqEEy7iTnB64dj03JY5h00IVV5ZlWDw0uUl0cgzWloG
	 C8HydPy6N0/uw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67C1xH1L13194414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Aug 2026 09:59:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 09:59:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 09:59:16 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Wed, 12 Aug 2026 09:59:16 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <tychang@realtek.com>, <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <james.tai@realtek.com>,
	<eleanor.lin@realtek.com>, <linux-realtek-soc@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<afaerber@suse.com>, <stanley_chang@realtek.com>, <cy.huang@realtek.com>
Subject: [PATCH 0/2] pinctrl: realtek: rtd1625: minor fix and cleanup
Date: Wed, 12 Aug 2026 09:59:13 +0800
Message-ID: <20260812015915.3477180-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_025955_588247_BC1000D4 
X-CRM114-Status: UNSURE (   8.52  )
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

This patch series provides two minor updates for the Realtek RTD1625
pinctrl driver.

Yu-Chun Lin (2):
  pinctrl: realtek: rtd1625: fix base_bit for VE4 GPIO 13
  pinctrl: realtek: rtd1625: remove unused group name spdif_sel

 drivers/pinctrl/realtek/pinctrl-rtd1625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0


