Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0385103E301
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 10:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLlL868sX2T7LiELOAOF8/VB5w2gI8YwwhfKb0vI5/E=; b=ylg8rMLzWLhGh3K5uUuggeWDEs
	DytE6jst9UwvJ+0z8WmPYSFRy0qC6dHUryLiIs6RUtcou+g0TWed2CaZ5PYf8ymfBrzNLjQAQ5b5x
	tZvA0XDxpobsVGhFTGeLUMnVqAM7Zm7Z8bEHx4Ad6nh14HeS4jCsjC9kQBOyNmgjYWrG5bzE5w7It
	JaVjYiDx9nOhAzSZ/b0uh7bGlYRTj4aftN53Kk2JjAnEvuLXbGaB2SLbQvgnzVnYh5Wk1MHMrtq7N
	l9a+i+wWWQIK7VlIEinZoZIWNZnyMLoUAXeZHSDOYFYSAvfmrLKRiP5rTocpRetoO00gmL8Sdeufx
	yeE3V31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dSR-0000000DsjH-096I;
	Thu, 12 Mar 2026 10:39:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dSP-0000000Dsj3-0mJn
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 10:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ZLlL868sX2T7LiELOAOF8/VB5w2gI8YwwhfKb0vI5/E=; b=FhGhvJMNkJjJX1Pc0xFwmYgi2W
	HmwjMl9ZfM4+NMzUK8nmPLJJknUAiKcMb4vnSRAN7tyamxskwBRU9/82tdO60Dd0Hqu8KBaINy927
	bXYRny/BHJwEU/DTEwXWlRhtF5leXcc3j7McL/86CXvBW9thFpL3/UhLqsVXQFohoNn0JPxjfiQum
	BGgwIt2PPwhvX+dxS1SIuagU1+dzGShfwi+zBAgQ49S4CKicgHgFnrolCNvmA/uZAhL1U3dEeW0si
	IsTx8fZ7k/mOe3S8Vm9FaLJcSnDsFlhpjsv2PGvY2vRYJK/PNRX972wmZ7kcR7eZI92kSX2wqKOfo
	+8jO2TCQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dSM-0000000BC1j-0SKp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 10:39:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ABA7D4E4264F;
	Thu, 12 Mar 2026 10:39:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 808525FDEB;
	Thu, 12 Mar 2026 10:39:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A0ED10369D8A;
	Thu, 12 Mar 2026 11:39:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773311987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZLlL868sX2T7LiELOAOF8/VB5w2gI8YwwhfKb0vI5/E=;
	b=UbtyNxEbiaH7gAFdQXLW+F+ORZ/7MJw1ZZXiNNyVGDange3pY2lfAPxgn1XkQqem2J2+9t
	SvU6ZNDWjNxHCywkmfqe3BaugenAcWZzijr7sfDIUBHiZ3WY0zAxw1WjGDkYk4EpO+2YXH
	rzuvCz1opCTPfoq4OYJAlCAzjJnSbz9oK4iXUo7K6Q151y5f6qKGjmbjLnB1rKUaE5Ccyr
	Tci5Iiefaqvvn3cMgN9xyuiZAvLyX80Ykr3y1NfvntXQTHzGXyWJaRcWvud1kRpFRen5OE
	mz180vFyYRUfhop2pYi7leqwbb0JF+6OcnlCuXYXSjn0kOfJKNbKI+zDiJzRLQ==
Message-ID: <21e24f72-aa91-463d-a7a4-d4c2f877e527@bootlin.com>
Date: Thu, 12 Mar 2026 11:39:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] mtd: rawnand: sunxi: do not count BBM bytes twice
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Wentao Liang <vulab@iscas.ac.cn>,
 Maxime Ripard <mripard@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
 <20260305100137.2558423-4-richard.genoud@bootlin.com>
 <87a4whnhu9.fsf@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <87a4whnhu9.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_103954_199929_BC407DBF 
X-CRM114-Status: GOOD (  10.39  )
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

Le 09/03/2026 à 16:27, Miquel Raynal a écrit :
> Hello Richard,
> 
> On 05/03/2026 at 11:01:34 +01, Richard Genoud <richard.genoud@bootlin.com> wrote:
> 
>> BBM is part of USER_DATA section, so we should remove it twice
> 
> Maybe you mean "is already part" and as such the end of the sentence
> should be that "we should *not* remove it twice"?
yes indeed.

Thanks !

> 
>> This was working ok because we are on the safe size, advertising that
>> there was 2 bytes less available than in reality.
>>
>> But we can't change old platforms, since it may lead to a different ECC
>> strength, so, introduce a legacy flag for old platforms, and switch the
>> new platforms to the correct count.
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> 
> Thanks,
> Miquèl



