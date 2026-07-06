Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BA1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Mime-Version:Content-Transfer-Encoding:To:From:Cc:Subject:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUkyk/4FJ+l7g40rHdo7hpp51HEwukBFxiiyIWeaPf0=; b=MC+SjAlG2NpwD61cccuoneVL8L
	+HuGcRs0ms4eecHwp6Kr6OW0YalQlAbLkWK8xTZntw1mYZLFCehjWKxTD6KCG6dFPLoLSLe3bicVs
	Uh3a4XtGmG1VEYuMxNysF0xHP0XBSN/ftcXa4u7458qM5qDAbRcOcRUajVXwU3sT6SFoga/PBDQ4+
	PBztE2MCYZhvhxWnWSCJgQ6ZOk+pu1j7ZxkenjK3GyPmDQqht7S698XMenxPjMmls24eLkPfX+Jmf
	g2RO3v1+2fUD56mHYz9bx+puRkgmQNkgGbQ2qp3t3zrAB6FfujLdqzhLls7kXn9V+RBLOgFz3Q8Ag
	1l56IDaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkhp-0000000Co9C-26lt;
	Mon, 06 Jul 2026 14:53:57 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkhm-0000000Co8T-4BdX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 14:53:56 +0000
DKIM-Signature: a=rsa-sha256; b=OPHaaWS/h1hJ0iUeP8n30+fHAUp9db2Ut/nSah4+HsvX2bSjsyAmHK1ZjlchIKnq3+29MIgLIk08YMluoB2E59KNLzrJ1Y2adLp7XbJOvMOuvJC921AhN8CAVarGzUkHYdjv7LrmSsl8f4apCGJbYzY5WEmfuq++zmWl4YkMskQ3z+itWE9tdZG3vuV0V4iWRwvwR8Be6yoUb3ebqK7iMEKkl0SlSrvnA3CRgK3k0KzI8D0J1xO3GMwsb2GzVWHPCdIIIMNhLZfYOfDtKmNhfrA8ejoysKVxmx4iddCx6JE9IDqyIiduEZPgDtLJ0u/iQi8PpZGL2XnopXhGtD1V2g==; s=purelymail3; d=rcpassos.me; v=1; bh=GUkyk/4FJ+l7g40rHdo7hpp51HEwukBFxiiyIWeaPf0=; h=Received:Date:Subject:From:To;
DKIM-Signature: a=rsa-sha256; b=FQTyH4+plKzkKO3IEcpfytstiws8fLmw1tmp9kkBmVX+9R0BtnlIaH26Uf1z8FqnmdPYIxa5O0UK/6R1TGTz4t2s9DhBZ8UyHdHEiqkbVZcdmZTg8OxYEH4xVfOyVOp90ycOcb3mEmxgv+4Jy5vYYRw2wAPIxnFb4/8Xj/SbbPFLk22GcTtkiLkRqs7Z16P2RSL8yJAv1cU4cZFh2ajJwA85PBlp8kcU35gjt5Kpeyv9QqOR8W3+3jdCwhnCojX1hhI7C5b59LSe/Ngglo5Y4K2U50DSKgUtD3UkYxQBxQph/M7l6oAbyRwd9pTfb8zlJs11Rj21jCGxtCu9EHErhQ==; s=purelymail3; d=purelymail.com; v=1; bh=GUkyk/4FJ+l7g40rHdo7hpp51HEwukBFxiiyIWeaPf0=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2012387389;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 06 Jul 2026 14:53:19 +0000 (UTC)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 11:53:17 -0300
Message-Id: <DJRKO72HWZOI.QJYJUAC45QOJ@rcpassos.me>
Subject: Re: [PATCH v2] Bluetooth: Properly disable remote wakeup for
 MT7922/MT7925 on Ryzen platform
Cc: "Luiz Augusto von Dentz" <luiz.von.dentz@intel.com>,
 =?utf-8?b?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>,
 =?utf-8?b?V2lsbC1DWSBMZWUgKOadjuaUv+epjik=?= <Will-CY.Lee@mediatek.com>,
 =?utf-8?b?U1MgV3UgKOW3q+aGsuasoyk=?= <ss.wu@mediatek.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
From: "Rafael Passos" <rafael@rcpassos.me>
To: "Rong Zhang" <i@rong.moe>, "Marcel Holtmann" <marcel@holtmann.org>,
 "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Mailer: aerc 0.21.0
References: <20260701-btmtk-ryzen-remote-wakeup-v2-1-767ac7907472@rong.moe>
In-Reply-To: <20260701-btmtk-ryzen-remote-wakeup-v2-1-767ac7907472@rong.moe>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_075355_145256_39C52C52 
X-CRM114-Status: UNSURE (   6.27  )
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

I was having issues with Bluetooth on the ASRock B850M with MT7925.
I tested this and other patches in my investigation process.
My issue was a platform bug causing a failure in USB enumeration
before the driver path (unrelated to the patch).

I can confirm this patch does not introduce regressions on this platform.
I tested system power cycling and suspension,
and also BT/Wifi adapter enable/disable.
Patch applied on top of mailine (7.2 rc1).

Tested-by: Rafael Passos <rafael@rcpassos.me>

Thanks,
Rafael Passos

