Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CEEC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtli7qrKdDqJDEKpaUtEPgLih8RTCPqJd1HrwnUKnAs=; b=hJ9Kd30/Pth8MI00xN+DR2c8l/
	XEFYeu3bEB+U22ONe667e/fQ6r8gU74wUUHEf+3lfXruT7v+jfwbwcsXjqN5W6ap0OVUcLOOW7FtW
	MiBPm3T2l2/zvqsltm0cNOC8cButeMA2pcKlvNkx0f3J4YeEzjDc0QSywWAG/cBWgw4J6VbW+/D2M
	+lgAbml2z3S3XF/NafHfEIh4+ctXAkcasBTx/l4ZkDEpmsO3mwjt8SXTDQZvTms+PWFOw7sJTSOXW
	Ap1XBNcu20rQs6gJ0BB/9qumaJa9C82GCBLPDAjo3m8BLLWjtKeEB8craKwk8Ix7QIVP0U+1lBEcV
	/YXkTMQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPPD-0000000DR7V-08xq;
	Tue, 20 May 2025 16:01:27 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOzk-0000000DMsY-37uM;
	Tue, 20 May 2025 15:35:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB11A432FA;
	Tue, 20 May 2025 15:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747755303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xtli7qrKdDqJDEKpaUtEPgLih8RTCPqJd1HrwnUKnAs=;
	b=XhrodVPKe2Da9aIjEgLFROZaIR+dwQscLhUZdqThMEllrC+kwxvD/y1Ytxkw22DIKBtpTz
	tcwo6aIfjMlt3QLRhhq6b3/9Ywaw5w4uP2D1XY2coO245jfBFW8oAWFNhgZppstOgIDOEj
	CXqtM1lv5TzvzC9XHKLtzGR0/mo3YgITipMR8XBuFzEg5yS4R+zMoTLS/Rx6N23vGFUklY
	UzUnfAbv49s8IJwrPyRh2QusLZaoJC+y0JpahMcQyvrh1RZ/xYEgcVTvZmZTpYbTCIxU/p
	fvEGxxolSE4tbmX1icEJcTcnjhjv7SHw0CsGnePan6FDrAglZREa0z3B6Rt1Uw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, wens@csie.org, 
 jernej.skrabec@gmail.com, samuel@sholland.org, ruanjinjie@huawei.com, 
 u.kleine-koenig@baylibre.com, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250519154225.2928-1-vulab@iscas.ac.cn>
References: <20250519154225.2928-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: nand: sunxi: Add randomizer configuration before
 randomizer enable
Message-Id: <174775530075.689292.3024700439135563644.b4-ty@bootlin.com>
Date: Tue, 20 May 2025 17:35:00 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnf
 hhrrgguvggrugdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhunhigiheslhhishhtshdrlhhinhhugidruggvvh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_083508_913986_D7031CCA 
X-CRM114-Status: UNSURE (   6.46  )
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

On Mon, 19 May 2025 23:42:24 +0800, Wentao Liang wrote:
> In sunxi_nfc_hw_ecc_read_chunk(), the sunxi_nfc_randomizer_enable() is
> called without the config of randomizer. A proper implementation can be
> found in sunxi_nfc_hw_ecc_read_chunks_dma().
> 
> Add sunxi_nfc_randomizer_config() before the start of randomization.
> 
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: nand: sunxi: Add randomizer configuration before randomizer enable
      commit: 4a5a99bc79cdc4be63933653682b0261a67a0c9f

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


