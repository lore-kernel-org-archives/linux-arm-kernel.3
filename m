Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D289CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dijpLU+OU7oGppfwXWO2pPWD4SaRJOSfT1ZxhEnI80s=; b=dqPrM5z3iBJg/6egLkv+w1hD6B
	5Dn2qCgw//q7SCLR6EqYzJXABSvxGC2YMIIx6j4VR07u/+XlDkgrtzZ4a0gzWc7X0gBkOftNvkkUa
	aUxiw8OnifLlT2YYfXwiCy1guG3PYl9imXtf+dON7pmPc73khLTiPCnzNHqL9IQ+aSiLKyHqyY5F/
	WN3R3ORoZzxrgXVpspqIXrbgykk/8feZT/P1Yo2qodn4swZA+ahKXlVIM6tkz/oEzMh42SiC5eJNW
	BYg5q/0jjxeoYo/WcKtET0haRPH+1iWDU5ZNFjnh70x4wRk9/4s/KA++NCvwDFsXcDBheF4sn0yut
	yq5IAs/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxQp-00000007SOJ-1hLi;
	Fri, 29 May 2026 13:39:23 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxQl-00000007SMy-1Gp8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 13:39:20 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id AB2111D0012F;
	Fri, 29 May 2026 09:39:17 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 29 May 2026 09:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780061957;
	 x=1780148357; bh=dijpLU+OU7oGppfwXWO2pPWD4SaRJOSfT1ZxhEnI80s=; b=
	Lo9E5V+AZL+GiAHP4+j8owKk2lO0iOlOEcfTYsz4aXEz8bL7ZnY4EPL6cuyhJuKF
	Y6b1sBPh6Ghrk5t6ZoK4vnpaf6lMlrBCL175Kq8Uc8VKotoIWt7Bl1mzYMO5avEm
	7l9EA+oKCsdohu0ntJigWmz0jTuYK5LakwTUhhNtIrNFY7Ncc6Yaio8H9/WySJDz
	K9CAzp0DpcTiXz+ltW0A3bWhFG8Ghjdi88yaiSsTCfYbBmQVshOvi8Ed8+xKu8y0
	cskhNLOvTb6qescVEiTwk6qGfg5f9QRjTMUvY5f+J8RSd21lMALfqF0E5Mxhdi73
	HdwkUCM2RUuPLb8/Q1ufxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1780061957; x=
	1780148357; bh=dijpLU+OU7oGppfwXWO2pPWD4SaRJOSfT1ZxhEnI80s=; b=k
	4e7HwEXRVNh6dH900tHVwoL7ogfzg7KG3xdLfAFyAiYv3GRBwARAIMCTAfyG+bCF
	tpoEr921JcUq1xlDloncqsLNJ6AGH7Qp/MRcYe+t4RLBlmLk1QdrVDrTbjOgwCdU
	bW4JhmJSVGnfuHp6LzrNkODwJt6bmcfhF86OA0ui0QrTgOGOKSqAT0sDeEhZOdmr
	aBhrJim3pno17MpxdAsdPMQ+4D47mPk4AhkLCa449FgkG6qCa9QJOo6hvsc2xUC8
	UIP8ubjbMfa6kebQ2RyWL7yyVtptJPwrQCEboNDG4usYYlTaVI2XhbbGJduxQnFu
	JRFtmbEyONFtVZB8CS47w==
X-ME-Sender: <xms:BJcZalCWshej6AmMmJXaY_6zBVacFwUK7u4zefuHmr_Mz1Jiqi4iRw>
    <xme:BJcZauWzZFebLRwx6O8-trkwKe91XRP7xKJnCB_qZWbosiuRkIjqJbywp-etEJLd3
    55UrTOTDfAfa9cncsrmPNaEDXkWzn5atnQhem9hdrR5LKchUbpkizk>
X-ME-Proxy-Cause: dmFkZTGyRrIgFgQ6qfer+Y4a1h2hQq6z7xkQeot4goKpuHSqMIzgKw47he6xTaYx2ppKRa
    VqvD1CTTOrF9lbkxxeuSc1JZk3o6VnpMitGIIDR/YC3t8SVtOqJyFHkHw5x3fk8hu4gw4z
    FOGLeRY21OB6MM/Gufhtmf5TbvS8+zZvhpro4mmVIbzRBstlAYcH4RKIEQduH7m89NY66z
    5l4IPLL2B38MOxmhI/2RVQQRxFkJfsM1cCWOQJlTz6yfu1CFqgWrqqQvf0BYGjr80yIv2Q
    ZByDnlVnbFzNzAP6QRxmyyX2lSVWFBYkykG62xXXsUcBdPeYs7q5bJ6EKHzlrvnRdEfvKv
    iW7rxVF0SWC3/HI545Y1U4SwZ3bpvqA+YfBS9FnD0s/5xCYVx2kRh/5eNbm0ccCeJiFFNl
    g+WDJciGwQWuioJVW0i/8uWhWk+xYxe8hvTEsWhD2xWpO2ECT9SusERqhWOUd93qDRZMX1
    +p+d6PDvYHyOrIvDZdRBQNOkwEkwdqRWVgvvoIvk7KLliPVvf3D1OZ59RzVs4kZu1j/2ed
    nhmiU+WICvO97G1nWX8KCbVDYgNAngwT3+BthY8yLHGNyS1vbQjurA2IxStDiOWJSFDpO/
    SBKHkpUcHhl8Z3HasfHDtpvtk3rISL2zRhGJ1Re0nkZFed8Rhwp+4A7uyRsg
X-ME-Proxy: <xmx:BJcZalmCK4e3Ic54lPmbCwKLn9HE1cZbVaecAebrT12EKo987ihSGw>
    <xmx:BJcZaiazXC_cC6W9gQDrNLB0dNNsaYKrtAj8Q31zqVGysp5V4qF53A>
    <xmx:BJcZaq4B_9TqZn9TAgDUPRx40h8zrarbk5xtL6NvK0r2igI0B69ZPQ>
    <xmx:BJcZasDcfGcxG8N1ipfTYGLyhCuAisAuM2QLcPpM8eCruxUOe7S-Kw>
    <xmx:BZcZasHvx4WBlV5jYiCc9RHyNL1NH40bZL6NS_ZGrXwXXp3nwRj3mZQp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9E60B182007A; Fri, 29 May 2026 09:39:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AIgwaTVwlN8Z
Date: Fri, 29 May 2026 15:38:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Peter Griffin" <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 jyescas@google.com, kernel-team@android.com, stable@vger.kernel.org
Message-Id: <d6663bd0-178e-46d6-af3a-69b8be197375@app.fastmail.com>
In-Reply-To: <a7994860-24a3-4f87-84bf-109ed653dda4@linaro.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
 <20260505-acpm-fixes-sashiko-reports-v5-3-43b5ee7f1674@linaro.org>
 <03dc9ccc-d819-413e-b8fd-23ccd85675ba@app.fastmail.com>
 <6c77d706-5944-4e7d-8a4a-b3a6cac6a83b@kernel.org>
 <a7994860-24a3-4f87-84bf-109ed653dda4@linaro.org>
Subject: Re: [PATCH v5 3/7] firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_063919_591587_CC6E5D33 
X-CRM114-Status: GOOD (  15.32  )
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

On Fri, May 29, 2026, at 14:37, Tudor Ambarus wrote:
> On 5/29/26 3:09 PM, Krzysztof Kozlowski wrote:
>> On 29/05/2026 13:51, Arnd Bergmann wrote:
>
> I confirm that the ACPM protocol is mandatory for the clients to
> work, thanks!
>
>>> the option space without losing any build coverage.
>
> nice, I didn't know this. I guess it's a "greedy" algorithm in
> allmodconfig, if the dependency is met the dependents are enabled too.

It's not even that interesting I think: the way I understand it,
the values (=m for allmodconfig, random for randconfig) are
assigned first and then adjusted if dependencies are not
met. This means with my change, anything that would have
CONFIG_EXYNOS_ACPM_PROTOCOL=n and CONFIG_EXYNOS_ACPM_CLK=m now
turns off EXYNOS_ACPM_CLK as well, rather than turning on
CONFIG_EXYNOS_ACPM_PROTOCOL, but this still covers all
the combinations we need to test.

>> Sure, I am fine with it. I'll take your patch with a bit adjusted commit
>> msg.
>> 
>
> Thank you! I need to drop the devm_acpm_get_by_phandle dummy stub from:
> https://lore.kernel.org/linux-samsung-soc/a59c6e3a-6092-4114-8961-c2a71a812959@kernel.org/T/#m0ac077507129c37b84443513eecadd70b5eaf8b8
>
> Shall I send again the entire set?

I'll just send my change on top of your 8ad2c29d53e6 ("firmware:
samsung: acpm: Add devm_acpm_get_by_phandle helper"). Since there
is no way to hit the actual bug on a running kernel, it can wait for
the merge window, and that way we don't need a rebase.

     Arnd

