Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A46EE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 10:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aqjkju8oywA4XQ9GAWJQ38Rocfc/Zbwx/1Z53fTbedU=; b=U0oN+MUO6Xwg2n5ABVA4eojyjE
	nlMgn/mPXgaqEOBYejNYfj7i0VikR5/ijzL5eKlGP9zG8ZIXpUlGhzDfXKYYqfA9TLGFSK6edYkmU
	LG8alZZOva82fqOhH0Al4z0N9vyNZMLeFppQtLhIxdMOSug20bYBzNRTx56+4A4yKB6Myx0ydJkCP
	fp+s2jYLqhhUuDNiOeCCr7CSLHTTxKwWSikUboe6XItX+kpid5Sd/RQpHAzfhHquTHUzDSOykloW+
	0mSmEHeQrlmwjVeC3VqQ5qw0jYfHczR1M9WHBshNk7svFVVRglPn53oRkpMbGproInibdbTtamAhh
	ID5HNEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ95r-0000000FW4C-3ENr;
	Thu, 05 Dec 2024 10:28:23 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ948-0000000FVct-2iMF;
	Thu, 05 Dec 2024 10:26:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED33E1C000C;
	Thu,  5 Dec 2024 10:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733394393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aqjkju8oywA4XQ9GAWJQ38Rocfc/Zbwx/1Z53fTbedU=;
	b=M2I1dusuYQ98J+fp7HT1Dh/OuY0f5pd2K8Ztma2vrV6iDGsO2cetLW41VHrwoxxDhd6lMS
	XOmdPXWB61W1PG5FG+y15sC00q+yWJOxgyWRq2VT+0sgJY2Use9001fuXYQQfPk1wZHDlI
	9cE8FQRUHiTJalsqwzj/q/1qyD0FD7KdVvv/GYTZKeTN+WoZfdvWUV9KQefWrQAI5XGIGJ
	it4Ns0/F4tsDVEQz/nKMPNeyJqhfaonCsk1+nUg0wHD8RhWr4EjtUd2+iMCyj3YrBPx6sf
	ZNvseaTcmf1oydvh+k6VBqpieK6FdxCE3Gm2Yrj9ND1y66M/Jaa17FgJyCJ5AQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  nikita.shubin@maquefel.me,  arnd@arndb.de,
  vkoul@kernel.org,  esben@geanix.com,
  linux-arm-kernel@lists.infradead.org,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/2] Add support for nuvoton ma35 nand controller
In-Reply-To: <20241204025129.150525-1-hpchen0nvt@gmail.com> (Hui-Ping Chen's
	message of "Wed, 4 Dec 2024 02:51:27 +0000")
References: <20241204025129.150525-1-hpchen0nvt@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 05 Dec 2024 11:26:30 +0100
Message-ID: <878qsuwhm1.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_022636_947740_66395683 
X-CRM114-Status: UNSURE (   7.21  )
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

On 04/12/2024 at 02:51:27 GMT, Hui-Ping Chen <hpchen0nvt@gmail.com> wrote:

> This patch series adds the mtd nand driver for the nuvoton ma35 ARMv8 SoC.
> It includes DT binding documentation and the ma35 mtd nand driver.
>
> v10:
>   - Update ma35d1 mtd nand driver
>     - Add unsupported write page handling.

I was about to apply it but...

    [31m=E2=97=8F[0m checkpatch.pl: 117: WARNING: please write a help parag=
raph that fully describes the config symbol
    [31m=E2=97=8F[0m checkpatch.pl: 141: WARNING: added, moved or deleted f=
ile(s), does MAINTAINERS need updating?
    [31m=E2=97=8F[0m checkpatch.pl: 348: CHECK: spaces preferred around tha=
t '+' (ctx:VxV)
    [31m=E2=97=8F[0m checkpatch.pl: 352: CHECK: spaces preferred around tha=
t '+' (ctx:VxV)
    [31m=E2=97=8F[0m checkpatch.pl: 352: CHECK: spaces preferred around tha=
t '+' (ctx:VxV)
    [31m=E2=97=8F[0m checkpatch.pl: 429: CHECK: Alignment should match open=
 parenthesis
    [31m=E2=97=8F[0m checkpatch.pl: 465: CHECK: spaces preferred around tha=
t '*' (ctx:VxV)
    [31m=E2=97=8F[0m checkpatch.pl: 465: CHECK: spaces preferred around tha=
t '+' (ctx:VxV)
    [31m=E2=97=8F[0m checkpatch.pl: 466: CHECK: spaces preferred around tha=
t '*' (ctx:VxV)
    [31m=E2=97=8F[0m checkpatch.pl: 466: CHECK: spaces preferred around tha=
t '+' (ctx:VxV)
    [31m=E2=97=8F[0m checkpatch.pl: 467: CHECK: spaces preferred around tha=
t '*' (ctx:VxV)
    [31m=E2=97=8F[0m checkpatch.pl: 467: CHECK: spaces preferred around tha=
t '+' (ctx:VxV)
    [31m=E2=97=8F[0m checkpatch.pl: 468: CHECK: spaces preferred around tha=
t '*' (ctx:VxV)
    [31m=E2=97=8F[0m checkpatch.pl: 468: CHECK: spaces preferred around tha=
t '+' (ctx:VxV)
    [31m=E2=97=8F[0m checkpatch.pl: 479: CHECK: spaces preferred around tha=
t '*' (ctx:VxV)
    [31m=E2=97=8F[0m checkpatch.pl: 479: CHECK: spaces preferred around tha=
t '+' (ctx:VxV)
    [31m=E2=97=8F[0m checkpatch.pl: 481: CHECK: spaces preferred around tha=
t '*' (ctx:VxV)
    [31m=E2=97=8F[0m checkpatch.pl: 481: CHECK: spaces preferred around tha=
t '+' (ctx:VxV)
    [31m=E2=97=8F[0m checkpatch.pl: 514: CHECK: Unbalanced braces around el=
se statement
    [31m=E2=97=8F[0m checkpatch.pl: 611: CHECK: Alignment should match open=
 parenthesis
    [31m=E2=97=8F[0m checkpatch.pl: 650: CHECK: Alignment should match open=
 parenthesis
    [31m=E2=97=8F[0m checkpatch.pl: 665: CHECK: Alignment should match open=
 parenthesis
    [31m=E2=97=8F[0m checkpatch.pl: 675: CHECK: Alignment should match open=
 parenthesis
    [31m=E2=97=8F[0m checkpatch.pl: 689: CHECK: Alignment should match open=
 parenthesis
    [31m=E2=97=8F[0m checkpatch.pl: 699: CHECK: Alignment should match open=
 parenthesis
    [31m=E2=97=8F[0m checkpatch.pl: 715: CHECK: Alignment should match open=
 parenthesis
    [31m=E2=97=8F[0m checkpatch.pl: 756: CHECK: Alignment should match open=
 parenthesis
    [31m=E2=97=8F[0m checkpatch.pl: 805: CHECK: Alignment should match open=
 parenthesis
    [31m=E2=97=8F[0m checkpatch.pl: 935: CHECK: Alignment should match open=
 parenthesis
    [31m=E2=97=8F[0m checkpatch.pl: 950: CHECK: Alignment should match open=
 parenthesis
    [31m=E2=97=8F[0m checkpatch.pl: 953: CHECK: Alignment should match open=
 parenthesis
    [31m=E2=97=8F[0m checkpatch.pl: 975: CHECK: Alignment should match open=
 parenthesis
    [31m=E2=97=8F[0m checkpatch.pl: 1001: CHECK: Alignment should match ope=
n parenthesis
    [31m=E2=97=8F[0m checkpatch.pl: 1018: CHECK: Alignment should match ope=
n parenthesis
    [31m=E2=97=8F[0m checkpatch.pl: 1131: CHECK: Alignment should match ope=
n parenthesis
    [31m=E2=97=8F[0m checkpatch.pl: 1159: WARNING: DT compatible string "nu=
voton,ma35d1-nand" appears un-documented -- check ./Documentation/devicetre=
e/bindings/

Please fix these warnings and checks.

You might want to use --strict by default.

Thanks,
Miqu=C3=A8l

