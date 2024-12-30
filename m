Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBA1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 12:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrhfBZO4d8LJrmbj06Hvndc6qxqFtL+h4PzU8edkkqM=; b=QS0LD2kG8qRunCbKhvhIdXRrak
	W2FZW85gpbeC/cnn/y+1+1ONW8lXLABgSp5WoLl3oDtFhlLLjviXBN1o2CwCD18KJ8/1N77JCleDm
	rqHIHsMdrn1lEjqW5wurgqlkqzCVt7D3RHv5Lum/2tQg9woXCknwSoLOjqWKJNo5AC1mAptuqrON3
	tJvG82q4H+xBAG4ZPJzVF2QekNFcuLxuB0NRN7kUlQ9ZJyf4sK3NiClN+WvySXEi0WMX0SHvNEty5
	sa+bCok/CmYnk7nfFbc8NtYr8ItAtwPLK6s2+Jtbt1XC9OkdC7vqP8k0H7995PhyafstfR2fy1C8s
	b+Udd4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSEeg-000000059xL-3FL6;
	Mon, 30 Dec 2024 12:13:54 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSEdU-000000059rt-0kf3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 12:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1735560744; x=1736165544; i=markus.elfring@web.de;
	bh=vrhfBZO4d8LJrmbj06Hvndc6qxqFtL+h4PzU8edkkqM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ClHpQJzYkGepa/eD4+13QBstu4fHD3oNMtkE+b5mEc7CrZJEMCzrWeXOVmBeRMcv
	 P855zHbyIz4qO5cbJTHVJQylQTXk1SfDZ9I63mdDqjcQmgmVB3c91obr8sT8CCmkv
	 BSv/abWYDlEjGRlfqoPhg93pD+ngLzudgg7OuLAAhol7aFXZ06LNpJu9xnoe2111G
	 +ZonV8G8ktsO1ElFfVU++0HA+qpJIJhDLlnLUEbAZm0QJDV+y+JVqmXumwoNlz6SN
	 VbqglUbGBjrZ1uY6xjnTiu9/KA7ulxLDwiDTONvD6RNNxQM86cjWYti3DwbVH5ajq
	 lBBZEBUcsVrCrnOL9g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.93.2]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MOm0x-1t9Kjw44Yp-00NWXx; Mon, 30
 Dec 2024 13:12:24 +0100
Message-ID: <4468a196-ad5c-420e-aad3-becbd64279d2@web.de>
Date: Mon, 30 Dec 2024 13:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] cpufreq: apple-soc: Prevent null pointer dereference in
 apple_soc_cpufreq_get_rate()
To: Charles Han <hanchunchao@inspur.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>,
 Marc Zyngier <maz@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Sven Peter <sven@svenpeter.dev>, Viresh Kumar <viresh.kumar@linaro.org>
References: <20241230091053.247719-1-hanchunchao@inspur.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241230091053.247719-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VfaTF5vQqPaErO66NQBR7gahShcY2SttGneHvGpX6GLNJj9KqIj
 T/VJYJ0rIMq25R31maw7Ce6PGFBwTbwkVMcGS2OI5dtlKavrUhYujctCV4kNJkab5pODW2D
 UDaxnr4XCjWox/u4O05vql73Z4iMrRaC/BmHvci5rAZJEiyQiHWArVhy33a1Ttor9X6YQ1T
 svDY+6iZvmrQBS7Z9fSDw==
UI-OutboundReport: notjunk:1;M01:P0:nvOYYyCpOlc=;B12RUNw+2h3U7p0F0avz17+lx7O
 8BV2jIjum8DVUi5FFUxsV6AClI1tLcMin+4eEEWmhuwGSR8UWNm85NLDt6Wn5LLir9DROKF4s
 okPH15NyP4DIRgVlPCGzuV5KLenQgU0/up4aEq9O4PfOB8x8nVR4niTsmPDLI59IecGjC9kiH
 N8kqwJp27f4Xees3ggfHAUc6O2aEwZNLpHzNfxZWldKpPSZbYKR0hP99KyqE3GT0J/+RrmyZZ
 JZUyXUyIxjvUiq9ygfgHlYaxW5mVd79v1vCnQlo2+r/G8xTIsvuujMiwMYcIQoY54SO1IVKT6
 qfgTIJ+/UvZBNBTN67JfLn3gZkLYFF9yOuJdIaD/YiHBDBJi9oUyq2q6/381L0q8mDmA1UlOf
 0RbhdoP/qkYR78XvHsKu0qDl7QcqlrBw7x1TFVAwEe/M2ucKc3aotQKuNvEtRm1srRtBo0SD6
 Dwj9oJ9QEL5EX7VKnaXXIoGHEcW5MTsqQ20i2TsOKJHo40e1uxHr7vrTVGBZJvYU7lHjmZ4Zv
 FRLGeMDeuWeV5on+X+vWnCpNm4lWKsIxDr8EhZY+lNQ3PCQF/cjn+1OfRxkIWbAJZXsyj5yXq
 /y55lzbRktVlV6Yh9pdJTwsAyVlf4v2YCi9EgMoF5SfAfxVA5EO0lEK95HCB0uVfXc1182HZw
 4tQU/Re3KHSB1Y2v4LxvRp+iWVyh1P54G26oRtlFEWUT+2YdVkohpPgPQv+xtQzsd8xuwatL1
 lQbD4f8ZPjGBp6Yja6yfGNtTRFLUzQh8Ga7PaWEbUEIGe0mRA7Y9k4lL16XIx3dA80uPrXPsb
 aTrNVSD/PzrCf4jFE09YtN/vQMzM6StGC+zKkwwyjYn2ZmbUK3vesPYfwx5vlegQkgotuRIFJ
 OZ0sUlUYheSUx4rZVGAwnuhXwcg/A4kDoFG0rGZoRvNl1JofyrWDr5hMCp84//ugYa+pTmj4K
 kzYfFT/2WfbYmnb1VflP7V5w1zZy5EiiE86xkm2qLmgtkKYpXx5U5k+xveelc85dauMHCtK8F
 JC7hGTMdEX0hLWSWORMquG+GXtPkjzZqo+J4+GKObDOyVOWWOx2iw7/Li/UydDhzIaInoYoBJ
 50tDOuBCM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_041240_594770_1F07EC33 
X-CRM114-Status: UNSURE (   7.46  )
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

> cpufreq_cpu_get_raw() may return NULL if the cpu is not in
> policy->cpus cpu mask and it will cause null pointer dereference.
> Prevent null pointer dereference in apple_soc_cpufreq_get_rate().
=E2=80=A6
> ---
>  drivers/cpufreq/apple-soc-cpufreq.c | 3 +++
>  1 file changed, 3 insertions(+)
It can be helpful to provide a corresponding patch version description.
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.13-rc5#n310

Regards,
Markus

