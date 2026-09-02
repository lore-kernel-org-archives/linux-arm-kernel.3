Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66594C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKyP0KBxakTaDA9ZOZgXWO84xJnxt16TUKmmMmMWZ5o=; b=0ArzzP0Mfg2Su/OTbWlJ+dVuNT
	f91h77Uz4EamgIvtFWa5G/Ig10s0tll1Ege10RPr7AOIuuEzuboz8y/k/7mPjBi9JmH7FVuzPN7TB
	CkLqs6SL+obooM5S6koP6FUUlS5kMUpFDAV2xJ9xf5NeWlmxi25YStuYb/7/wMONX2qqoAhcEH2yl
	XVLVuYE0N8oRYbaieAKv3EL9Z4KyCUGkLN3Ge+MksACKnr+JDrL3oF5rFDB3TSQC4N3w4KXgg1uP9
	sGwAu6XgmQZtaLYClYjwaj9Ol/MCKDDut2FB80lz1OpEetrBxL73u26npdQYuEdks6lI0WyeD6x5y
	U38K2l2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mGo-0000000F0uU-0bli;
	Wed, 02 Sep 2026 14:48:58 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mGj-0000000F0t1-2rO3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 14:48:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BF7B14E414E4;
	Wed,  2 Sep 2026 14:48:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 906B96053C;
	Wed,  2 Sep 2026 14:48:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3940111C792AB;
	Wed,  2 Sep 2026 16:48:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788360524; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kKyP0KBxakTaDA9ZOZgXWO84xJnxt16TUKmmMmMWZ5o=;
	b=cFage9wxV+lKQQXdLrZPivLydFioAXSPdrLl0Pf+32Fetbt/c5BEtAhB+vPCCYWgMVmI8A
	PLatga4yHA5lIzIKK7WujwrK+Fj3zEZLkcQDRumqloRMOonQf7JFjEULM1Gcyo6di/x7KC
	wnESG53ex/2gbearIlyjse8Gdygg7vf7+32f+yLOEUIkBOX7mIAach54O8aqrkr1xJPdao
	DmYyisTQ3WnBZDubMVgixx4ijrWmhrBQWd3VslYqgJrIVC1iQMzxocwI2nKc4gmPv0pcyv
	S7DJFHF6+lH8ge3Cmkm5eVfhiXq4KY0Tvjg1f8ntvIp+T4Rxo0Gri5CmyltJ2A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Takahiro.Kuwano@infineon.com>
Cc: <pratyush@kernel.org>,  <mwalle@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <nicolas.ferre@microchip.com>,
  <alexandre.belloni@bootlin.com>,  <claudiu.beznea@tuxon.dev>,
  <corbet@lwn.net>,  <skhan@linuxfoundation.org>,  <STLin2@winbond.com>,
  <hsinyi@chromium.org>,  <thomas.petazzoni@bootlin.com>,
  <linux-mtd@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 13/23] mtd: spi-nor: winbond: Add support for
 W25Q01RV-Q/N
In-Reply-To: <4d7597839fc542ea846fe0ddb3eb6683@infineon.com> (Takahiro
	Kuwano's message of "Thu, 20 Aug 2026 06:15:08 +0000")
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
	<20260813-winbond-v7-1-spi-nor-rv-addition-v3-13-b637cf120d5c@bootlin.com>
	<4d7597839fc542ea846fe0ddb3eb6683@infineon.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 02 Sep 2026 16:48:38 +0200
Message-ID: <87se3r7lq1.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_074853_858867_77CA2063 
X-CRM114-Status: UNSURE (   8.64  )
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

On 20/08/2026 at 06:15:08 GMT, <Takahiro.Kuwano@infineon.com> wrote:

> Hi Miquel,
>
>> There is an ID collision with the chip of same density from the JV
>> family. Both chips are very similar in practice, it is mostly a matter
>> of electrical differences (mostly power consumption being lower).
>>=20
>> As a significant difference, RV chips identify themselves as supporting
>> the new SFDP (rev F) field which forces an alternate write SR2
>> opcode (0x31).
>>=20
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>> + cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
>> ef4020
>
> ef4021?
> I think you copied wrong log (this looks same as patch #12).

Correct! I just made a new acquisition and fixed the logs.

Thanks!
Miqu=C3=A8l

