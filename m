Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A4ACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 19:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmcaLxrhP9F/m5lk3JZ+Kuw/+MrT8rtpiy4jWPgs3No=; b=ZwUPgRa+Rur/68W9wPkir0oLYC
	9nPDfcFx8yDUVXrTlBHgMMZvlSpDZFoITFNGITQwnHbmBVgJI+HzvFR0WrIe8o5InIUc2yYl9cojf
	/WxHjDBKIAKq/nX3pqqlRBIOhT85I5JWTUWh+IbObsbjIIBmDHwYFth90vVH1CGbtdguGkcL7rMWv
	O5sjzfHr+Fmxho2rR2ilh2+DGwLxRHSkGo5OOOst/QlLhJjjdz42Yz9az6BamnG2LTtjPG/ZA17jR
	prpwWbty8KUohLaAhtYPAduGo3uL4z6HRIbDI6LK5BlFaaOLL1MZgL3pf/t9b1ddkBEqZuabZJeJc
	KmC0TUWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHS3P-00000000i7L-1Imr;
	Fri, 07 Nov 2025 19:23:23 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHS3K-00000000i4H-1QlQ;
	Fri, 07 Nov 2025 19:23:21 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EDA862CFC9B;
	Fri,  7 Nov 2025 20:23:14 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 2R6fOeHHtymO; Fri,  7 Nov 2025 20:23:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 813442CFC87;
	Fri,  7 Nov 2025 20:23:14 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zqOd4E8HCNTp; Fri,  7 Nov 2025 20:23:14 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4A11611C056;
	Fri,  7 Nov 2025 20:23:14 +0100 (CET)
Date: Fri, 7 Nov 2025 20:23:14 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	alexandre torgue <alexandre.torgue@foss.st.com>, 
	mcoquelin stm32 <mcoquelin.stm32@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, wanqian10@huawei.com, 
	Yang Liu <young.liuyang@huawei.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	Liyuan Pang <pangliyuan1@huawei.com>
Message-ID: <79797154.158914.1762543394141.JavaMail.zimbra@nod.at>
In-Reply-To: <14f5091f-b647-40c9-9c32-6a705c2d6c37@web.de>
References: <20251107100057.1091153-1-pangliyuan1@huawei.com> <7857ab09-7808-4abe-9df1-66235291436b@web.de> <DF8B15D4-4819-47E6-9BB0-268AD0204C86@nod.at> <14f5091f-b647-40c9-9c32-6a705c2d6c37@web.de>
Subject: Re: [v2] ubi: fastmap: fix ubi->fm memory leak
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF143 (Linux)/8.8.12_GA_3809)
Thread-Topic: fastmap: fix ubi->fm memory leak
Thread-Index: fBqM9AqfBycgbGob73i+cfkQqy6K6g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_112319_719956_6D3B10D1 
X-CRM114-Status: UNSURE (   9.26  )
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

----- Urspr=C3=BCngliche Mail -----
> Von: "Markus Elfring" <Markus.Elfring@web.de>
>> > You may occasionally put more than 60 characters into text lines
>> > of such a change description.
>> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.18-rc4#n658
>=20
>> Feel free to ignore everything Markus says.
>=20
> Does your feedback indicate then also that Linux development process
> documentation may be overlooked any more?

The only reason why you are not on my kill file is that I can protect newbi=
es from you.

To quote GregKH[0]:
> Markus, you seem to have sent a nonsensical or otherwise pointless
> review comment to a patch submission on a Linux kernel developer mailing
> list.  I strongly suggest that you not do this anymore.  Please do not
> bother developers who are actively working to produce patches and
> features with comments that, in the end, are a waste of time.

> Patch submitter, please ignore Markus's suggestion; you do not need to
> follow it at all.  The person/bot/AI that sent it is being ignored by
> almost all Linux kernel maintainers for having a persistent pattern of
> behavior of producing distracting and pointless commentary, and
> inability to adapt to feedback.  Please feel free to also ignore emails
> from them.

Thanks,
//richard

[0] https://lore.kernel.org/lkml/2025110516-cubical-drowsily-7acd@gregkh/

