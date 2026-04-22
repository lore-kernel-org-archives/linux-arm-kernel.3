Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F84FAD3F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 03:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqg20wTmq8Z8TSjsvrM02yefrEnboDHI1it5JnY2M4w=; b=K105Il+ksnSJc+afFm6hJRk/JH
	sjYgF4SjwIz1e8bctQeMg2iocOfw3fY7t78NGfwEV1rhxnqQB+epV2qq7vhLjZyRGh77rb/hAtuTj
	NXNrtvNkyGotKCCdPsLqc1WnDUskUxa9V3mMpsFwBNGaYeHvlfRDD0cKUNVnFCeEM79q1YagLX9tY
	w43f471RXVwApsUKL6Qj5hhETZVv1JUmFVHe2C62Oj2SUkDiLTk76zWChzvCY1UlwnU/eYMLOkqzy
	jXzv8MhgYfolEK3qhLygB5sBZVINVMfCPMlSp9VdYVDDy64c8QTSUxTiVQEHk7dSTA9LFZjAdN7XJ
	DR04mXfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFkKu-0000000AwL0-1cy4;
	Thu, 23 Apr 2026 03:02:40 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFkKn-0000000AwJa-3HXL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 03:02:34 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g1LVY4SHFz9tn4;
	Thu, 23 Apr 2026 05:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776913349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqg20wTmq8Z8TSjsvrM02yefrEnboDHI1it5JnY2M4w=;
	b=o/+KqGLkY3wr3P9i7PxWQ802rlboNPqclymRppllQdQBimXGnwJjPGoJx6gu6EsdGM3yM3
	5xWWd+WIUsTycp9e8DybnqYo1OoaROAxAYEKU/uq/U5TnFSNM7NkUYCQaPTbvPqyMmoYOU
	OHvGyjos2Bzs/oQi+Dzu1mtGcJEupfIUC65O0UT33qOmwMEqh8Um6X1RwrC8Xzm4xo2qLj
	1rCEtOEkmTqaZEgE6FyGig2iXwY28dsBceaNd6UNAvXBs8IKQoy5l8BvhPtZ97Or3fzEO2
	QENbdfdjuRWpB/xlloPibhwlCnb3BRP55RYiVUlld2/BqaMl2IA75o5To2Aa5w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=K4APtoV7;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <0dd3a417-5da3-4667-92ea-207beaccb42d@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776913348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqg20wTmq8Z8TSjsvrM02yefrEnboDHI1it5JnY2M4w=;
	b=K4APtoV7VLf6CPP/zTzYnWizNHlTR451lPKQ3iJUsnVhgZQKjuPxXhe2aSDFMqPQog18YK
	C2U7M1/3u0WlSoZPenp6OrPTH5e6JNuco5rqmed0zte49stHHub+VUdvFtl5xtfp2HufmM
	BvCLlp0H87a96J8p2yuXRGDJsnxqan9L6Y6fAXB9Gau6qR9V49lzA9C36OkrIWP7ppBd++
	azH8OAzIVp//8vTVD0ADo3oIy5xSen6NPBWEbqkKLia5m0wrxE39DXtTNLhd1Ay6m9VVvC
	2EnYuRgO3t8zmMvo+JGKabvu/qzqqwdHrpzyw4vzyo5fetZWvkX0QGOI0mtCtw==
Date: Thu, 23 Apr 2026 01:33:49 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: renesas,cpg-clocks: Document
 ZT/ZTR trace clock on R-Mobile A1
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
 <20260415233300.457892-2-marek.vasut+renesas@mailbox.org>
 <20260421-attentive-cockle-of-finesse-e5bfb1@quoll>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260421-attentive-cockle-of-finesse-e5bfb1@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: e573a09fcd5b5d099dc
X-MBO-RS-META: sccnpsjcz81hnkokqi7o699t6n5uzk7q
X-Rspamd-Queue-Id: 4g1LVY4SHFz9tn4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_200233_971486_8B14D8A8 
X-CRM114-Status: GOOD (  12.69  )
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

On 4/21/26 10:01 AM, Krzysztof Kozlowski wrote:
> On Thu, Apr 16, 2026 at 01:31:38AM +0200, Marek Vasut wrote:
>> Document ZT trace bus and ZTR trace clock on the R-Mobile A1.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
> 
> This might affect ABI, because you are basically requiring DTS to have
> additional two clocks.  Probably it does not affect anyone, but
> technically is an ABI change, so should be explained in commit msg WHY
> you are doing it and what is the impact, instead of saying WHAT you did.
> 
> If there is going to be a new version, please fix it and please keep the
> feedback for future commits.
I hope this is addressed in V3.

