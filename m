Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B87C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 11:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvNWIXI4/tZKeeO+WSN38gx9138yui2rjNRm/dAZIN4=; b=UZP4D+Pwu2gq2om4qE3KhktKlA
	8h+I3Anz78/6rqmN7iG8yHehlF4aJ32GJOniM6EQ4FuLPRROfBQe0YlBpdu9gqNYU0WiI+jzAt9Z0
	YC9yR17h7GNFI7xoOw4Ix/oq541sbG1gibBJmYuWb/mYTPvBscHAF0FoJSZeWKOCPmYhwOmQeE17e
	nNdbt1RZvwWIMdC2a6a3l8ImZ4scV70NS/DytUH7GHKjUvsXbESAk8Fh+SpL/OBWDm0wTU9Jmq9NK
	LapFpRH2+htHwDqMbjTDxdilQsP0JsRL33vFJ+FCZdI6PY95DprNCqe3MhTJHcm6CDn7FKutxbj8I
	ghgoAh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe47-00000009bZr-1ala;
	Wed, 19 Aug 2026 11:02:39 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe44-00000009bYO-027v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 11:02:37 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 01BDEEC0112;
	Wed, 19 Aug 2026 07:02:33 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 19 Aug 2026 07:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787137353;
	 x=1787223753; bh=WvNWIXI4/tZKeeO+WSN38gx9138yui2rjNRm/dAZIN4=; b=
	Li7SSym6v+DNKNs0jMAPD0eaWAEM5ynVvTyU8B1FeJNadY/KCKl4UYfztcYUUYdj
	+eQMnqYMa9xGp66NGa0yoFZDpj4I3WTv7J+ivBTm9jkQbmuEhTum3JBSjg6x+AfE
	xr2SUtjl0YgB8XU7DENxX5RRFW9Lbu/8+ciGbAiyI6E1wsqhxyVKptUn6WfDoPAM
	5zZVHyavMdiBVEd9Pf41W+17wFjlCYrb+Ly/u/ZS8xjHNHSqBJ2Vzg9Q4FCljh4l
	LUayDsyKBMNC+v9AGKD0B3/0GYYkB1MtfA7Ye7ktmzqQ7idDV5GFrgTJYkdI8Bnp
	ENzIJAEm1oCjMQ2KoHa+1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787137353; x=
	1787223753; bh=WvNWIXI4/tZKeeO+WSN38gx9138yui2rjNRm/dAZIN4=; b=S
	ZiTWm9EML0k6bmxBM5zSnYVOvNRz6pBJA4y3AXA63PlKOENLhryl0mLuwC6h8xLi
	9VmYck9YyHSggPbaMpTB4RoMHD1phKOlYsZUQNrtU0ht/EONxDl0EPNNIGL8+WCo
	U2+1m72hkbHRiNtk3runCuklh4is2rXLvj29bKaLDPxwVSaxFOzHwplylcMb6iKE
	4dHL6GDMc1gNJgEHbG6KyHIh+jVKLjfX79KemJS3N8FhZd55KCTZQgUSslRni8Q2
	VPfuQojz00eVlJZO964W1Xl4gM2PICZl849dg5ZVduM7BJ5ykVDFG3dIZ6jxWFwv
	qSRwy5YhvSwxFeVv+b79A==
X-ME-Sender: <xms:RY2FaoCCUzmi1WdJc6iDFhOUBFt0Rueqticrctw58SO5t0LPc3kN-A>
    <xme:RY2FalVkXJkp2iY_JvRymojwe5zrDzPufu2mK9JaIVDLxEYBeRAkiLROmTdX02d0e
    yYkIMgfdUbWi513pdPKbA6-Zf_1ePFkrB1TOr-QcMvKCNn7hj3vEg>
X-ME-Proxy-Cause: dmFkZTFukQSP/3o8pOJVx52DwzCcQzR+TP7po9TqkWJsu58dALxA1dpRQGceTU0jqvH2OU
    ORRprA9CGaJ2deOINKrMurBKPHHBNWvo3/KpkAXbejsXNU9Ddy/dykNASbHPjZhSsjsw2X
    48f5Wn180kiWm7+/nWJIpN0x1WHGlojjNt9doXGKE+jd+DWD5xl9Jb9pSbtR9avOERlURN
    l/LTJI/iFKHSlIQ7bOPclJM+OZw1ZeB6qVDg2MHep+rtE1ZOy4T6NPVnlI+3+UCqVE8EJU
    p963WSoRyifgXwTdVhQTBoroTlFFoB81Ta4yCuLDalqaY+T3GtYWZQne7FE1bv+Pct0vOh
    QfIeW/cvdzIDm0WyPLQdPXMllAgQlO2B9WhLkBU2haH29wCS1Tp0JzLL/7rUOP0IiVNyn6
    27PNeY27z3pR2Ozo626QrYvnhkfNiDZp00rvNJ4MLSNc6YGBklLD+8jWydq1z3UykD8Z6V
    BywZhfp0mJEM5rCb8t+x+zfopeXcMKonUkoe5Y/pf/iaZAR0Nbq4R/evZruTWmy7URN++r
    laLcmGfI40kj30g5saMih/5D/cZQt8U2dnkFtpe4QRwg3b3Gk3KuItC0WKIRxIhOmZi3oH
    TsGglnJwCWcdAh6V9qcf4yJfUn4TAhUt6WkZALtSeGdr1/oVC17T2UkYjUpw
X-ME-Proxy: <xmx:Ro2Fatd7-HsAtEtbhAQOUZyMCOY5hH2Lo5TZhKRH8vbAbzV-kF9XCQ>
    <xmx:Ro2Fai9oDo1IfKGrIw3ogcCAFftZtqNNL2Haj_SAcjjHfR-u-rz9Gg>
    <xmx:Ro2FapkRcjjrAWeqIlgI_w7ln0-RyKmQDh8cttF6ehqpuQAb5qnwqQ>
    <xmx:Ro2Fak91_nVWXyRhKytKPkTWDbfnJgcR7b_5oNbcgbhIQ4sf78t9AQ>
    <xmx:SY2Failbz5x9Ni_gbOR04diBJ3_T5fyb5JWGp6VTwgjZLus8l5B9C_FJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6B7A732A0071; Wed, 19 Aug 2026 07:02:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AcdQlVQC9j7F
Date: Wed, 19 Aug 2026 13:02:09 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dan Carpenter" <error27@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arm <arm@kernel.org>
Message-Id: <e45c75c5-70e3-496b-8885-ab0093234d3a@app.fastmail.com>
In-Reply-To: <202608191405.jP6epa63-lkp@intel.com>
References: <202608191405.jP6epa63-lkp@intel.com>
Subject: Re: [soc:board-remove 200/200] drivers/mmc/host/sdhci-pxav2.c:318
 sdhci_pxav2_probe() error: we previously assumed 'variant' could be null (see
 line 305)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_040236_393601_3041B232 
X-CRM114-Status: GOOD (  12.65  )
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

On Wed, Aug 19, 2026, at 09:54, Dan Carpenter wrote:
> dfe9746aed2d12 Doug Brown            2023-01-16  304  	variant = 
> of_device_get_match_data(dev);
> dfe9746aed2d12 Doug Brown            2023-01-16 @305  	if (variant)
>
> This assumes "variant" can be NULL.
>
> dfe9746aed2d12 Doug Brown            2023-01-16  319  	host->ops = 
> variant->ops;
>
> But later it's dereferenced without checking.
>

Hi Dan,

Thanks for the report! I've fixed it up now, by removing the (now)
pointless NULL check.

As you may have seen, there are a lot of changes in this branch,
and I assume there are still many things that smatch will find here
as it is still work in progress.

If you have a list of possible regressions that smatch has already
found on this branch, I'd be happy to look through the raw data
for actual bugs and fix them before you spend a lot of time
processing the findings.

    Arnd

