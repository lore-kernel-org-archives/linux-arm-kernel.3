Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52291C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 09:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xe9yKMk7Eypr5knTG3yOuK/cqx3Z7cmsTjnuVuhrHUY=; b=bUIvTrkHmnTt/XeWGMq2A+JYGm
	ve18nY4/5r0m4fMzcSNRrpED3sHT4X+yLpwWOsE0EIkZJ1dMx5XczCxMWhN3RfJ45TXa6sFamUo3S
	t+Mb2lfmqB+PcK8MhuIklEzvMPUoc6N4qov3nRN7j0cKXzGXTuocYGv5YGJfRft1VbuCRTnkYyLMH
	z5f6Mlf1BZv6+4+skA/NU7Lob2FE041JDYh3qJyhpmG9Z2LhVMg/uAXTyXtGcrdVXSgCqC7UqVnx0
	+PvScbQ+dB7+/fPSwQdmb1CyLmcjFVt2R4gjqBI/gs3iliTxc44tzarTALC7knBaHRRu15Sgnx99V
	fZGWyU7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1iSZ-0000000H86P-3cEI;
	Mon, 07 Apr 2025 09:08:03 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1iQo-0000000H7xi-0idk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 09:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744016771; x=1744621571; i=markus.elfring@web.de;
	bh=Xe9yKMk7Eypr5knTG3yOuK/cqx3Z7cmsTjnuVuhrHUY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=X1LdVynsvT7LMZUL48PGjcF5QfwADAOJBci+gK0YQC+mYO+Oth4dixt7C/us06Fg
	 izM1kujfXxr00vRFMmoCjSSjSzQNQPpi3Q5Uf7TzQyO9RbeJqq2kOQtXbrCpNwhi1
	 OByikFCOXyimwXnMfGeOE4MsOyDuAAuJPbZSOPtc2z9kDBeeybCIdfu8iJXJLxT3K
	 JYVgAl/IVVe2rQTLaKPt2A/g4guNKVcoVXhyDdhHTVMC5A9nO6F0Kz2/1Df6skXDs
	 hyytHJmajV+hbatfDGBEW83/d4J5h9ON1il13hOgwfJHA1xs/qsXpLTKoUVAwNMUR
	 jyCeTIdRPihqgurNDA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.4]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MCol0-1tsx0M3nIO-000KwN; Mon, 07
 Apr 2025 11:06:10 +0200
Message-ID: <e8e785a8-5f8f-4ea2-a150-2837f47b4472@web.de>
Date: Mon, 7 Apr 2025 11:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-pm@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Sudeep Holla
 <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
References: <20250405092314.76297-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH] cpufreq: scpi: Fix null-ptr-deref in
 scpi_cpufreq_get_rate()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250405092314.76297-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Hy+PR5k1xY84cSBOrA+CeAth7lHjF5yH3qIF6tQorjq8ujw9unB
 Ks4IChpY96tqaRD6pGhUjBBs7AD/6yfZH4xvKnUQos26x9FfQu93Gd0XdE89tMqvo0YPdcR
 VDNRT6zLixpOmCXyHpEuRlwGTQ+kxaz2YwER1KLPLm8MUEqfggXWCP9yivXFoymxsgDOsRm
 GXoMf51AyhgIEgfCsmzAg==
UI-OutboundReport: notjunk:1;M01:P0:Vr4ssYFlXBA=;CwpOnPasjk7LIzSK0EdCunmDOsF
 CmFnhsW9Fwns8jYe0WBp01axpuwv73QwaF2JzHNiIxidoEmo4nEXlfrsN+mLINpCu60C3wwNb
 +42cmsxOkKM4rIScVM7n7VH3grZZI8CWCNyxaCrGa9PqwKZsiP9QpjQn0u3XsrDt436yY4q/B
 J0dQd4DJoHQ1ODnOBTP2jMipcHhP1QaVABQCEetLZjfQjBBlScsr/XrhyIosWpSt8K0mOg9cr
 I/U/+/ELHTlRgiREvA2bvT08A32NrAdDOU1U4JjjJUwp1gDm1z0bPsSsbpe7Nnpeb0rKbSuj9
 cylTuhl1bnNPklWyJY44CtfgXIyqjMYki2exg/a7KwBSGUvz3a1XBhPBID6T9gSm8zWwG+Dk0
 j3AyDrCZIUpuJDx2NIXj3BJyJQ1W5q8R+Cu6lyu4PjHjh4sPYeFokygpwWS4kasn9SH8n3gNb
 stG2PM6JhJLklptT1OZ56+tWoO7b1bRiuvHLu+pYvr00/naqUUVJCzoD/mER626JVLFvaNHvv
 gGuZJD0+jpmtliv4AVA/0ESFeI2kmAPeMlJ/Su+MLLM6qKyBIHTW2VrwvhPT8R08UClh3GlWU
 gHA/K6gxErMGyuStkatD91valEW2Bh3tSB/cVkmHfTWP29QGNMYhmP0/ToLzHrU17FfCOJ/n2
 VS+iKsa00P9NRFq5vZ1FPDdkRzLcm3rrowIFJFHiF2LJj2WQ6j94c5LByIhLHPgWYPSnKsETZ
 L0BtPF8JYyZrKY4/hKuDUErdpiKoaneLohoZfUyVgFwvIY08JXtzCzObAWmHZA3k+f+CANXGh
 s4lSGes3w9L2iqUHi40kr+cBK456TWWX//zVT/IoPh7NpGBrVro7viyCzRLNI55i4cSfif4wb
 VyL7y+ngIGlzmIYHinuddbT9Tg3hFjeWBdu81RnnPxrKgzBEhkGRap6p2uznca2l4NHAo+Bka
 4e4KpyUMPhLgs3jDPL0SPgoxrdg85bt04niJw4s2lyr0rJ6geh/qkBiAX9/Zwa71Cs17gvw/B
 VlPZSHQTZ5N4+aiWyGxUBk0aaYWoIzvPbdhWzM9tOgEiu1YVXSM4olXRhECHTUazM3WEBvxFP
 uCF4prVBaHsxDFePgW4N7wIPewTI5/prYKgwd8MV1YasTs6e44Y4N4fXczGx2yp77FgwE4QPJ
 mEzJR0elzo4fFqxinahkKUuZ02TCgup3nHySV+ZGeROXW8CPkENQoBUabmpAId+1ytrLxU0e1
 IJ7mHKesEhboV2IaeCGmjGpWmw92A46GzRkFntHldoZfff5GGuHQWGijMRvko5suAfndd7v2E
 2o1Xveuh6AwSXqeDVOPBLJnkiLsj3fZTFscGuthYUJ3BgZeeCbWiuGn8Ch3I138ZoJtZ4vfBg
 KDyjZ2y8rrF0iUEqgu+YPtg69zUa8WyK6jeqyVmeSMa+MfWSiRlmQuT0Agm0SCwlYkcgONBAZ
 N8UudDLTplOwSFjDVO73Z9lnf+U8BkfscSghwVOmOS/DVRK6D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_020614_596438_24583D85 
X-CRM114-Status: UNSURE (   4.72  )
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

> cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
> in the policy->cpus mask. scpi_cpufreq_get_rate() does not check for
> this case, which results in a NULL pointer dereference.

See also once more:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.15-rc1#n94


Can any other summary phrase variant become more desirable accordingly?

Regards,
Markus

