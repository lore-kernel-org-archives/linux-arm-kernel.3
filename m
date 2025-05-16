Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA2DC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 17:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DC+LF9SGjcfT92Y5JqC02qXqj/9+0Jg/AwCb9dl45Mg=; b=JBpYctQdHk6je2Uk/QerV7XMUQ
	K3+rxnkL+VotCW8ZwYGFwpqdWHyEP+rUzBCfWetX0RCxS9CE6zpqF9xZouZrL7FCB8yzMovSVSvWK
	sSp9w+5RsuhUJHuRkSGD67v+YTYLhKZcgORhNVItqLnyzSZS7bxD8lQ6wHXgijf0+IWgElVmxP4Mx
	lkkK0e22c15tGfcg3j+ZKXpBTdgD8+74niH4pPaVhUGXEQfqR8oUuRq/aZW6AHOQ/jHRypNbj+8Pk
	cH77JlbELwl8kYTatRBHHdZgDWdAYjLGEesDFHMm+cUAikRoXPoXIsfAUilGFM5T2u17oRg65NgoI
	K+OgHQ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFym9-00000004AF9-1fjc;
	Fri, 16 May 2025 17:23:13 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFyk6-00000004A0F-3lf4;
	Fri, 16 May 2025 17:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1747416032; x=1748020832; i=frank-w@public-files.de;
	bh=DC+LF9SGjcfT92Y5JqC02qXqj/9+0Jg/AwCb9dl45Mg=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CKuhJn/fNqAguZJniEVLva7cBEwPadDuOmmePr1eF/lJXa1a017rkoGim3XDhGCR
	 GxyVvWUYIX2RqPzCWkm7F8a3Quf8hhvL6DvQ2N8gxw0DwLPu6KklYA36K8CN4eRLG
	 4ouaBxg1J4wYSStcezbM35PUEQzQTBOMHdnD5xMLT5xDoLhPMR+5Yxauelx9nY/Vi
	 jmkQJtxX14ZadVt3ZYgqvc+dQMB01Seyq5R8/+XDLog6XLgEM9jwAp1hjl1sNzrtW
	 5eVRGzlKAf4Yio/bMa7/QKdxAetoRfdmmI7+MEmvSfNngaWV+YZNHYrPNobDGr1i8
	 u+/gzx9mUS5JWYA80Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [100.69.124.0] ([100.69.124.0]) by
 trinity-msg-rest-gmx-gmx-live-f4858f84-lcsp7 (via HTTP); Fri, 16 May 2025
 17:20:32 +0000
MIME-Version: 1.0
Message-ID: <trinity-925f0b56-c8b6-493e-8d13-e732b3e95f48-1747416032428@trinity-msg-rest-gmx-gmx-live-f4858f84-lcsp7>
From: Frank Wunderlich <frank-w@public-files.de>
To: linux@fw-web.de, daniel@makrotopia.org, dqfext@gmail.com,
 SkyLake.Huang@mediatek.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Aw: [net-next, PATCH v2] net: phy: mediatek: do not require syscon
 compatible for pio property
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 May 2025 17:20:32 +0000
In-Reply-To: <20250510174933.154589-1-linux@fw-web.de>
References: <20250510174933.154589-1-linux@fw-web.de>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:Rxo8HmPRzSmBNKbQ5rFnl9nKUfxp0rvBKS78WCekuxi9nxeKnhHVYbI2rw9QRRXHQlDqV
 IYTMHz6pk4JWqD/GvNFBTvGJHhnJCHF27OOTXh6RyhDi2CJa8jJBUIpyfaTFJh0pN2oc2JxgWGD3
 qfHa5ILEq2E4RV5f4IfMEiuB7A5af/3s8agff1rkuJJn8qO2PNMqMZb+9aCBXaVTjg2TW7LyXKC9
 tRPgxhfxG+9dlGYHt8WFcObR+j+TFEbKZNwsM1iLUXgIo4hRnSQLxuSsRx31cNFYMpHkTOMPZS7u
 48xpJ3YeI/mAhHBDyFjEk5Poc7jzN2GtnSYP9c+PYWvO6F4MjNaER0yfZ29tg6jEDk=
UI-OutboundReport: notjunk:1;M01:P0:6Rz5hPyD8c4=;H8zwI7Q3TM3lJJ2HpNOBhs9w9dy
 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
 43E=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_102107_223301_A90D9E0D 
X-CRM114-Status: UNSURE (   5.18  )
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

Hi,

i noticed my patch is in state "under review" for 2 days now without any c=
omment and i want to make sure,=20
it is not missed somehow.
Imho it is a trivial patch (not much complex), unlike many other net patch=
es :)

maybe it still has a chance to get into net-next.

regards Frank

