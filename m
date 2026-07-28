Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5239FC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 13:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oobXFTHfdzXdPL+8ib1BEuopmYTDo8gYa71Yim7An58=; b=GndATxLPLxBKHR6XbpRmaRGuGN
	2LRx4uI4MCQLitvfIwaX3Mc0WXsiE0bibLnp6nZLrK5mG7VQRG3VKlfPNJuFZR1thIrK+a4MEe8+A
	KTt6PX7LgXkFP+OkUY0p13yNbQA3GF8z5XahjfHPlcMUgtQMfVgIKKekG0hgsPwAOTMRFtDuHX08E
	g6SUNiFM8pE+YUj8xLFZRW5UPNRwJmWHy4MnIIkWlMEvIUuA9n6xTjoNwG2Twm+g8+UyaNrFW4Ict
	BeV/zvWhmJbk6+iKWOxM8VMxHf3tDK3yPmtbioXG9dtYO2+ZywnAY+HM+saGoaTz4AW15WQEPE/wI
	zeNoLnNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohlY-00000005L6A-37BS;
	Tue, 28 Jul 2026 13:22:40 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohlW-00000005L5k-02a7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 13:22:39 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ccf2360620so35929555ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 06:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785244956; x=1785849756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oobXFTHfdzXdPL+8ib1BEuopmYTDo8gYa71Yim7An58=;
        b=NZkMU8MMPslBZBjIQTeVyVg5pYRpY0cZUUfrwpzxWj4wk0Th6mVX3xCLhPQU0O7H5r
         rn1KvI1O/rJIh2JXdkP0nehUC3EfiwJ4lBitP7mSMbcOR97zoBIN90MzbHdr2hFekktO
         xF2LpUaACBlbi3Rw+vEKzHQbGqQ8rU+Sr/ViCJ1KRfGL9WhxNAStgXSoU1FnxMUP3Itj
         8NjRMQ/S1Ob2YvPMxAZ1GvLuisa+v5QAq4v7bs6bbrqXlo/GzwtbUpHZ1Qm5jdjmvNev
         VC2572rFhEa3KCoeqfYtZuw42AWDy4UhPNDUmp3po/tyxDiUl186QMGaetIXZXTkmSSQ
         iPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244956; x=1785849756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oobXFTHfdzXdPL+8ib1BEuopmYTDo8gYa71Yim7An58=;
        b=rnYLkIz0y48yUyzB578P4xN8AfLTDeOeuV/bLsynPslGxgjbPmxCPOUjWfMP7Ou6qt
         ZCVjJdILKvwi4dTtOyTBITy8EKK8vmcezswqLJbIHvJb0CPia4AfEfcy1Zhn8M/KQYtu
         Prcs/0VK/vsSRD/BBsP7cWO2OY++ZRPSOicaueQstoxwNzAj8eCRK6PN732aNgq3SHtZ
         qwWSeMCIJ5cDcMZUOEiMoPUaU3j8zeY0AJFxI1Bvibkb2UiFOms+PBWQWWZeOLREefOs
         KpJTTc/tMF241JBE28cftv76Tu4Ajfc4zAnsF1Wo4Odg+HMYhqEJ5BZDBa99Nya0KN+j
         WxAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXg4taDdDdBUqo2ZiOz2XM/QjSpI9BAEbLyK+npyN8phhD4HOX+5brP64SKVJ7QeLO9zNPnR1CtdayPyyMYrxQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzH8itYTcEtpr+KiMTAPBzQqBje5KGQop7fgwb/eekQM+bh9nS1
	0umPAnNmzgo4yDUHZ9XE8Q4ljmw3CBqdDkwlFM7hGDSsflsdlAOq773D
X-Gm-Gg: AR+sD13Mbgdhoc/97QLSMg7TwCgAw1nTwma2/8qqovGJ9Mmrl1Caa+P24Csk2W+68Nr
	v2Gp/wV8izkNvV1oLMxTo0/szFIWbca16ukAQgl0ef1Ax3a1cbiwMubskafKWJTKz4FCtjUQ1qe
	bIGHVerjEX41IooVQPyGiAI2bNS35tep3coMjMvsvUKyffdFRJIIatAIApFFjdHpxWsftg0IWhA
	UheOBKx140SesQGtdTFuLML7TsKMM+wBJq8WZIC280cT0OiiUJgFPlRyNEY4hSfj3d7k8KSJzo9
	7A13pC6I0pdI4fi6xyPbFXcY3dC4rqTCq2dhxnf/XCHD8Q7td+BEoHm9kZXb5wOO3u3/egN3QIU
	5RbLzbRBD+daFErElzAYGxlckTu+a7dVshHx58cCyK9JidmHVBCdu6KLu4d7SnMxSUOsU5kqVlL
	+U
X-Received: by 2002:a17:90b:3a4d:b0:38e:7239:b93b with SMTP id 98e67ed59e1d1-38f6a580748mr2307986a91.30.1785244956532;
        Tue, 28 Jul 2026 06:22:36 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6413fe85sm1376399a91.12.2026.07.28.06.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:22:35 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: maxime.chevallier@bootlin.com
Cc: andrew+netdev@lunn.ch,
	rmk+kernel@armlinux.org.uk,
	alexandre.torgue@foss.st.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	hkallweit1@gmail.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: phylink: add phylink_pcs_loopback() method for PCS loopback support
Date: Tue, 28 Jul 2026 21:22:27 +0800
Message-Id: <20260728132227.4051026-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2c0c6864-99ea-48d6-a889-c886bb91c351@bootlin.com>
References: <2c0c6864-99ea-48d6-a889-c886bb91c351@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_062238_052979_ECE7FAD8 
X-CRM114-Status: GOOD (  10.28  )
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

On Tue, Jul 28, 2026 at 10:41:12AM +0200, Maxime Chevallier wrote:
> I'm actually seriously wondering if we shouldn't just stick to MAC
> loopback only for stmmac selftests. [...]
> Using an external loopback (in PCS, in PHY, somewhere else...) doesn't
> bring anything to the table given what we are testing today, which is
> internal stmmac behaviour. The MAC loopback happens at the GMII level,
> so everything we are currently testing happens before that.

You're right. MAC loopback at the GMII level already covers everything
stmmac selftests actually test (DMA, filtering, VLAN, checksum offload,
etc.). PCS acts only as external transceivers beyond the MAC boundary
and do not bring additional test coverage.

Given that, I will drop this PCS loopback patch series.

Thanks for the explanation!

Zxyan

