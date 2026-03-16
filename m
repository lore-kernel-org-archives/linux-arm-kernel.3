Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA648F53D65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIfQSp2vyfi8CDTYPXYdAA1ZbtTpeHm/bbxBHJ+0vyw=; b=WEnlWk7qfYFVl10TbYOdEqBP3a
	4yqSLKUE+a/vBY7TJH5gvwNsAGFhdcGQhLgQWHtF3Ovs17nyYeYO9iwOB9j5RmuRifNQXQMK7/C0u
	1rxk3XEua2AJGRsFxC3lGtx+gxUp0nhK+ntrDsB8CTxSwf+Mu78HNeaj+k/mT5G3vNeWJthkyYq+A
	eYWqugLuKA8jIr6kgNFlrHnA0DIE+vxAZfnstjlykhTFrblp7o1DAJ1eqq0iJ3ZMqnP/wyTTje+Sj
	ry8noqFBiNY+Wa+jnDYaiXZgN/cgjJJNPW+G8Fg4e1rfK4W2bCmlhl0aiaxsfngL242dbcfiOstry
	2cJ1wcgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29WO-00000004I7n-0MQG;
	Mon, 16 Mar 2026 15:06:20 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29WL-00000004I5n-2YX1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:06:18 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fZJMB2Whdz9twS;
	Mon, 16 Mar 2026 16:06:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773673574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oIfQSp2vyfi8CDTYPXYdAA1ZbtTpeHm/bbxBHJ+0vyw=;
	b=WctOtWCoTE54i6E8J+FSA8AWkOY8MtUBvvu8OHsnxN4QkreTobzIxvPooFHHq1Pi7cye5N
	S1HqNYInFfG/dmD3nDirTJf1wr/ByvBC4E2bKkv/Pi0XhlZILCY016oLEXbmOiHMKEbZ3C
	RS6c0u4XCLAN0/hEJ8RaT8KLahWRlnvSeBxBGJYoDooLiqggqIlr6BzI+IihcrydDPWSj2
	XjOZbt4FX+gtv6DVpIfoTH62ufA74tK8jcYX1+k5m+EphZHR77SADDZMIlO8cY+8yHfKf0
	ICOb5htQmjMm8DA+1JAJfzkgHMCVO8RF8FS6lNlBsIQO6VfcdIn7k3Smi+qkTQ==
Message-ID: <96978561-3733-43db-8698-8988dd0975b7@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773673573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oIfQSp2vyfi8CDTYPXYdAA1ZbtTpeHm/bbxBHJ+0vyw=;
	b=E00EszFAGtOQD6lgFo4ZLrxTeZq7diFwJA5VnnKirHS6Sxul/ttCmnXQawyiHlBi/av9Na
	/eyG+yguxwvLNq1pxToUJGD8a4qKxmtqI1FgZ8Xp80WuiSn51nvIEfDCJsrQ9nYfkkj/4W
	SSU2drF61/4f9snEHwVbgvF3c/blDT5ei1ihLBXlXQ4Rk3l5tVxdwGNr1ke30EO/7tm4iH
	Zckq0Lf+cGLnV4yARnbYIXSgY3AarHimsc0QoBPfkpdr6MyC8kFv9ExlKL99jDmy4s2oW4
	UVy9j1F6NjUHcYq+YOjrZAmKBvVJ9peef1dpczqsJkCqbdQAfvYQsYPH1kaXvQ==
Date: Mon, 16 Mar 2026 16:06:08 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
To: Biju Das <biju.das.jz@bp.renesas.com>, geert <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "magnus.damm" <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
 <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdX5+smUnspgxnEy6ewL2-3htqeP-d0kX7muMVp9AAqO7A@mail.gmail.com>
 <TY3PR01MB11346A1E1E15BB94F5C692B408640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <15b47af5-1249-4911-b9de-7ee177740314@mailbox.org>
 <TY3PR01MB11346B2FDD4E9CD1DC1A1BED18640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <TY3PR01MB11346B2FDD4E9CD1DC1A1BED18640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 1a803db8a2cf16cc424
X-MBO-RS-META: o7p4hmcsxhbs85i43afzamc3ttxhcqss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_080617_854004_600AD11D 
X-CRM114-Status: UNSURE (   9.23  )
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

On 3/16/26 1:58 PM, Biju Das wrote:

Hello Biju,

>>> It does not cover all the SoCs/boards. If Marek want to take over, He
>>> can send next version covering all Renesas boards + binding change.
>> Isn't this series effectively exactly that ?
> 
> You have covered only 9 SoCs [1] Whereas the patch series I posted covers
> 43 SoCs[2].
I also did not modify any of the YAML schemas, I only fixed the errors 
that were detected in next by the existing schemas. Maybe fixing of 
errors should happen first, and adjustment of schemas and further follow 
up clean ups can happen second ?

