Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83487E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 20:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+Hjf7gL0CKGudF4dN19V3/6KMwWFZmCJ+Cv2U2rfsQ=; b=t5TkoxFdJ9fTwuMliWFLUuK3Jb
	Rkqf1jfez64OSDIQoupoH6SbwM314e/B+QBJaQTMzwHH7hHUd3MPiuswc5FKzK22A/Bq1NQnmrSV6
	zKNJE3G59lbKpMrx2Rq2A3udg6a5Yc6v70WoZTBDd0av1R18dBNRWGQT5Dbkd2Al04t0RblCoAFmX
	ycxxaoI99hS7jmT+Oxcpxm/o11O7uY20fG0mE7UnL1GejoJoHcvtY6a6ZpO+pl/YeAkXwl7Kav3iN
	VVddJ1DSLDGtGYkRWzQ/PpAkFZg/j4wRsoopx2EwPWQ8CyLc/BZ0CWszZYwiHfSchDXPrAsKl5/mw
	vtYAnNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVcWO-00000009kNZ-1Z4P;
	Wed, 08 Jan 2025 20:19:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVcUb-00000009k1t-19eh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 20:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=b+Hjf7gL0CKGudF4dN19V3/6KMwWFZmCJ+Cv2U2rfsQ=; b=yHWYY4bSalT2gL8z3UpH+ZLEi/
	wai17khUMCEbltTA0kvnb6fXjBq5v+YSRMg3YfdC7cEKYCdzJmBUPQykCFJpd8z5RWjq2Aaafejzj
	yjoezsV6OMjJpgvGAYR7f7eLqXjF1Sw9KJQS0mizDmRURjHYiKh0ClvjbCq2KSaa/i3k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVcUR-002g0l-Eh; Wed, 08 Jan 2025 21:17:19 +0100
Date: Wed, 8 Jan 2025 21:17:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: Jacky Chou <jacky_chou@aspeedtech.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"eajames@linux.ibm.com" <eajames@linux.ibm.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"minyard@acm.org" <minyard@acm.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"ratbert@faraday-tech.com" <ratbert@faraday-tech.com>,
	"robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v2 05/10] ARM: dts: aspeed: system1: Add RGMII support
Message-ID: <769c47ce-3183-4730-8702-ec85245e66df@lunn.ch>
References: <SEYPR06MB5134CC0EBA73420A4B394A009D122@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <0c42bbd8-c09d-407b-8400-d69a82f7b248@lunn.ch>
 <bebbba7b-f86e-4dc4-8253-65d34cb84804@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bebbba7b-f86e-4dc4-8253-65d34cb84804@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_121729_309944_69F402C3 
X-CRM114-Status: UNSURE (   8.44  )
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

> I checked with out hardware team and they did not add any extra delay on the
> board.
> 
> We have normal point to point clock without any delay added by line.

Thanks for checking. Thus phy-mode must be "rgmii-id". We now need to
fix the MAC driver so it does the correct thing when passed that.

    Andrew

