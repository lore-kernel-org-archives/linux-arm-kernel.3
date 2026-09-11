Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DE5C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 09:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+6MYxy5XUjX01KpC8TpqcYswDVyBlb/TK9KQ1ZJYVc=; b=2BFTs6Y4l54bVZtWApdFXrs4Cn
	nuWNb0E5oWOP1ao8pLcoR+RPH17YCzzCJVDz485+5qtWv1Ao5btzPLUGm9o8i28AL2kQ1ZeMxtnSq
	otcnjkNWOy0nxmYYgso9r0qavmEYYiIAww0QFHp5ZeM5JqpIW4YjzUPe7TBg/B5Lrpd6hiauKW7QL
	xOteXhMhX78MqkdlcCBxerQV+JZvmtRBjfBwTWxSCMyOXjy2XXyEkg+GmJwYQqFSov1uKNmte7FJ0
	XymCPS/cRCUvSALeOP4In+WqPfxB2LyjTJInpaLVk7Lj/0quqpHKBw68016goRyNbNU1YxY4dmZ1Z
	ld6KgImA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xGN-0000000GDto-3x2G;
	Fri, 11 Sep 2026 09:09:39 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xGL-0000000GDsf-1B7x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 09:09:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 09AE4C653FC;
	Fri, 11 Sep 2026 09:10:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24DA5601DE;
	Fri, 11 Sep 2026 09:09:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5556811C7AF8E;
	Fri, 11 Sep 2026 11:09:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789117772; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t+6MYxy5XUjX01KpC8TpqcYswDVyBlb/TK9KQ1ZJYVc=;
	b=DSrRpMzo7xommH6ljF3n40eJNp4XkPIlSTnxYdGK9noi1maEjPYXHwbRBMJQlyifjzSK9/
	OIJM1vSUZQWh5eGnUsmf7KridG6Y3f5lk5k3s1++gtzvm/aPAHNhxj6bBHccAghi6hSI0Z
	U5rUj/t0oe1S2TpcRMVagB65Vjjc59OyYzz/FODdv6v2j5MVX+/m7t9MyC+isQw3SpZwq7
	8D+DLBC82Gvc00XvStT/u28NAMGJkU/QusWmjSMxhTQ77O72cS4LJ8UgxxKwA+U31Cdjcp
	d0V4UO4PuyEmfZtPDicT7LOHM3eezIDw+jsib6AWDgIWLilFWBlupjm9kwcXig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Randy Dunlap <rdunlap@infradead.org>,  Steam
 Lin <STLin2@winbond.com>,  Hsin-Yi Wang <hsinyi@chromium.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v5 03/25] mtd: spi-nor: Refactor Read Status/Write
 Status support
In-Reply-To: <87ecf1sa2w.fsf@bootlin.com> (Miquel Raynal's message of "Thu, 10
	Sep 2026 11:57:11 +0200")
References: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
	<20260904-winbond-v7-1-spi-nor-rv-addition-v5-3-2909a45fe4fa@bootlin.com>
	<b78b8e6a-2fab-489f-aa1b-a2ab23051794@nvidia.com>
	<87ecf1sa2w.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 11 Sep 2026 11:09:26 +0200
Message-ID: <87tsnwqhmh.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_020937_476627_E1D13813 
X-CRM114-Status: UNSURE (   5.80  )
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

Hello Jon,

>> spi-nor spi0.0: probe with driver spi-nor failed with error -22
>
> Thanks for catching this early! I'll get back to you with a proposal
> very soon.

Here is a proposal, please let me know if that fixes your issue fully.

Link: https://lore.kernel.org/linux-mtd/DLCD7NN2IW82.33ISZCKO1E7UY@kernel.o=
rg/T/#t

FYI it is only compile tested.

Thanks,
Miqu=C3=A8l

