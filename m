Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A20C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crIWXxpiTTenJI4NMZwEJ9fdFrkz5l9k/HVg53VTtqE=; b=n1DRA6ALDNEU4CFIKyrhh8CcrN
	B7asqjejQc0WZoT6Yswl6u4Hv/H/duA1T3nMwHoVfkumKlELlfL72vgqGuLSfCJO5kisEm+G8gfjh
	E6EiMLS7MgNVP58Pm93Ls8xIDDwKQlvkoJW6eUgYAxqkfbMYBZI6KZkxeJ1gUZIz9K+gKuygUYXsy
	uAsCkzLtb/3it3XV4srp9+Vsr8Ayt+YWyqay0TGsrXgkX42Q4q3l1kDubWHffz1dpOA1rd+dxRLET
	DMNfiG9ljzGx23gg+OTkEvrNoB9eIrD+DCnpyayg7Mu+gbPzBtWNBof4YgeV0ADzL5TRlTBjiNbOj
	jYx0Yy5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5Sn-00000006nf9-1Uzi;
	Tue, 11 Mar 2025 19:40:29 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5MI-00000006mou-40bR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 19:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1741721613; x=1742326413; i=markus.elfring@web.de;
	bh=crIWXxpiTTenJI4NMZwEJ9fdFrkz5l9k/HVg53VTtqE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=b1oBtj5evIXNknb3NeEPV99kLUhqWyoT4lYI0S0Be4lpDQF5/nGiBkgwOJqlrZ8k
	 SoW+8JENSO0T+rYSKR7UytO3bd5SxPgrC1iYNdT7uz7FAlW+vpUKQLbHa4I+io8vc
	 Jfeu2Z4JKkZMvMu+NvD6c8GNz7MaBlv+3ZfpIegyWylSyxcLqR8zn9tThYBgDSdQw
	 GOnaM7ATG/gf7uprFRC/9r3RW125Beg+X8Y8ULjIozEs5tyCvT0Kw6oueOMnzIPGr
	 YHF9BfL70Q0FqjDNCLbApW23DBjJULwdNyaZfI8JUpzDtaWg7+a8WFFBeBpitCcMB
	 VVCXMneUQeDtI7XXsg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.40]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MdfCH-1tJ1if3fzl-00cquA; Tue, 11
 Mar 2025 20:33:32 +0100
Message-ID: <0a2e1d9f-4046-49ee-9513-dbb3af9cffe9@web.de>
Date: Tue, 11 Mar 2025 20:33:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <csokas.bence@prolan.hu>,
 dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>
References: <20250311180254.149484-1-csokas.bence@prolan.hu>
Subject: Re: [PATCH v4] dma-engine: sun4i: Use devm functions in probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250311180254.149484-1-csokas.bence@prolan.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XqSKuVC0JiST6xXnkWzAX/+X8jnpz66Ha3o7kYN8HmTq1zoTzhs
 /2wQcykvychlhAjfg83GeOlw3OlYrm1QfqtdKwlDF45cx4ubxiwMSk5eZ5GooeXwbvvuIJF
 kAwQGRBNm+AMhDT51sD/URk41EP6gXdnIEA3XBoi15qZ5U9OOBqOHF7A/jkrh21qNoNn5dn
 yyzKJLVuXdLgB2RWLhrHQ==
UI-OutboundReport: notjunk:1;M01:P0:UdA59599wXk=;z7L1HARrJsNvNEBleC2wdhGduLT
 863Gmt71ISm98yn6cKUitonjZpb7yIUP/TaEhh3aE1gg6OYpdtNWWfxGrohH+FwIQ5muzyIqP
 esSzDNkjrHK5CIknWZakDHOt/x7icrokAsOhR5BTg+kF5/LjzHtZdHS0rFYP2FRJzSOoLgN0n
 8KGA82PaIrTNdhWOq8k0m4jVCXtW1qEW/CCp1/tT3l4X/tym2CeqJhugX03HZrT33vnTy2U1M
 1WY/R80yXoQ2BTx9ZZTLPxHNfSud8kFFlQ0XYcrFl2qD68U/Swu4zf+sksn0DZQ9t/P5UQmeP
 l2wQpsSb8X7XEnTfV0KtqmgKeYIhrsOHj5igrurJTKhgGX8yRvtIURT7XJIB+2wwALdt4HG/N
 VmRuJHVCw3GTyeNGRuFeDHZ1BXCEyg3Nmt+xIEaJfBdPM1UlfLSzM+l8bd5mgebK5Ro/dFjY7
 W8hMQktvN4R/KXy+GkrG/aUw26siL7Txg/i5536FK7atpsHq66wN1h/TVTagjxJK8EGIx8S46
 52NEp0EjSsuzy1zDZKVJ2q230XXNOXmVhHwnSvz344bLzsZtgUf4Zlaf/NeMZUPb0iMXbeWsu
 Ii1Xm8G0c78CSnL/9luA2GDGZdr5gBBMhisINKq2w9OgBzDwQC4PKayQVURAIxY5qC4O2D/Er
 bDJTIXJ4tRjYx9ZjerbyI3JIiThUrTZnbheScvjey4a4qxH3H4ss/ZJODX58h8aaU5EuYrRWk
 UxEW0K4CrVpzu9SbJrS+3fzvnUvy+yHdoip8ZXHWDd8SIWX6kHO+jCixNgvSRlvxXVTbC67I/
 WpyaeaTuEt+wyHKvyTQhnwslejUkfLz55vmCbDg9fvvt8rdcTMOXhCu+FScqYLMfdoW5Gjjdb
 62qWC0Afa2z1K70WrXRPgeJbM/VfeS+P528S6RO3n1QvSKw+JCMttznxKLBK1dLL/MgU28N3U
 fmQBfiaaHAvR2I9MMFsomNSqIhA2V2OBY0rbClHdbKtGL/4dpofyUH54g4A5nBu6N03wxqCAR
 ivBd5wp3evSjlWRc1+QCgrItuggeC9xCNjFf3ASedW2GVvxrxqCrFZaN8m16VJx2cPGthyen1
 LIxAdhLE+GNQTkLS+v0KTVDyDS2haE7LPyQfhUrl8rC2zE+3u3YbFpcwMJmpWQ/lwnXNmchQc
 wY3v6Twsm8jfGbTjd1xvNZfDEv2Op3XcvjrKuQdhv1xLMJaVrjcrLijamIKOsPZS9cBbxIVQO
 VBaW9a2Iwp/ZfYhMhg3Qvz8uxSVBtxGwXl6ZxwghA+9YkZVe3m4b8raCEY9NJFQcgMmyvB9kS
 NuxsOQtwhMcL0knI/pMzfOJrfTn+2gyMGOo+8GwqemqvfvYqu/I/+9Kz2xN9anLe6RYjOqfoS
 4YFqqBOLCBXKKXBcOLPOWGIIMQQ2Ng7sGqGo8P7bWataZiBa1ff61cbx7VVO4xL1/G+BRfhbY
 1M1bW3LdnDXt4iM3SYQFr+C97ESTxdQruYYdpPJqRm6Gzs2efZ0womck7UbTQSCvAUDwA9w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_123347_362433_9A745921 
X-CRM114-Status: UNSURE (   5.33  )
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

> Clean up error handling by using devm functions
> and dev_err_probe(). This should make it easier
=E2=80=A6

You may occasionally put more than 47 characters into text lines
of such a change description.

Regards,
Markus

