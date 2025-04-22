Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621CBC369D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 09:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j42C1neK3aBXGc+3YIjfO2v8Xt2aMCt3/0zWgtV9maI=; b=Prxvnwv0GCA66+zi5BA2SB/VfU
	af42akBBMRKIKxnS2ARJF7f1CujGkJ9wFmpd+3mGXAaTnhBb0rUhsB8LD28tMxjhL0Pltd48q1TMy
	Xn96BuekSEFoRZv/4llLLNRL/2UYNzVLzARZ4rM/xLV3uR/2o6YKnLuir1NkJqr5yfMY9QCj7OsJA
	LkTqq/Vx9xFPOsvJbcG2FP0QtQviPr7080Ue4ZA9pPqU/8dNH6VI7kTtff40pRRKjWpBfiCpgn6aK
	je8v/gbI9COXZPKx1ti61dKTcq5ZCEDyY+L1Sn4YB23HoRPgF5llKtWrpvFrUt1JUVU7M5z+DIDJz
	bWPMnNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ACR-00000006biU-3N1N;
	Tue, 22 Apr 2025 09:45:55 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79C1-00000006OK6-2ATz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:41:28 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id E3BA01F929;
	Tue, 22 Apr 2025 10:41:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745311277;
	bh=j42C1neK3aBXGc+3YIjfO2v8Xt2aMCt3/0zWgtV9maI=;
	h=Received:From:To:Subject;
	b=penu3/YZVEI07stg2iQTLUOpNVxP1HOxBAdODDevRCDZPAJCgLpfGVefwkW/zq4yK
	 Rak6XOa9G2kod7SBw6TJPCJ8uFa/q4TQywOm1J8XqIZRCAQC7Cztqt3vlepvWqF3XT
	 N/iwt/q2/75cJAr1Z5Tu3KOekjVlUNaxDglJORQrY+OnSA9KpRbBSkA4AqHJ3ztnhq
	 jjOzB8olRLLfUBsiTQ32s30FTValKeVCLAYqQIprBaFJ9B/QTcV1BcD0vyFNI6aqkK
	 0n3YhqZKABBuSIbdQL2m2/WzkSM55NQYD5xfqDTdh2wrHev+pNuTxS8L5C0xnmF5YA
	 CCcGAsK+D5jmg==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 952EE7F820; Tue, 22 Apr 2025 10:41:16 +0200 (CEST)
Date: Tue, 22 Apr 2025 10:41:16 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Philippe Schenker <philippe.schenker@impulsing.ch>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Wojciech Dubowik <Wojciech.Dubowik@mt.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mm-verdin: Link reg_nvcc_sd to usdhc2
Message-ID: <aAdWLFS2UYciaJc8@gaggiata.pivistrello.it>
References: <20250417112012.785420-1-Wojciech.Dubowik@mt.com>
 <20250417130342.GA18817@francesco-nb>
 <95107ed358b735cbe9e5a1af20a2d6db74c5ed64.camel@impulsing.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95107ed358b735cbe9e5a1af20a2d6db74c5ed64.camel@impulsing.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_014126_615714_34C28D0F 
X-CRM114-Status: GOOD (  14.50  )
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

On Tue, Apr 22, 2025 at 07:57:32AM +0000, Philippe Schenker wrote:
> Hi Francesco,
Hey Philippe!

> Not sure this causes any side-effects maybe you guys want to
> investigate further about this.

Yes, we did, the correct implementation would be the one I linked
in the previous email.

> I needed it due to the strange requirements I had (described in commit
> message).  From my point of view it is correct to link the vqmmc-supply so
> the voltage can be set also to something different than the default fusing
> values.

It does not really work fine, because you have this IO driven by the SDHCI
core that is going to affect the PMIC behavior at the same time as the I2C
communication. And even if you remove it from the pinctrl, it's the default
out-of-reset function, so you would have to override it and set this pin as
GPIO even when not used (this would work, of course).

My request is to fix it in a slighlty different way that matches with the way
the HW was designed.



