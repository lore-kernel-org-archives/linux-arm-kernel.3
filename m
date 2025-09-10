Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233CDCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 01:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/cQztE6JVsN29H2UCnnOkTaLkGI3st9SaYIAZ0Aj6I=; b=MnXd0ukb3bgbFVT8OXnPwt6Scr
	i/piwSgiTftRK80vv/vHVrDiePZkkyM98SikfWiY5vCMtt6PAv6ddIrHEGyv2smnzxKaWelNrAG8a
	Nyj7+1bRKT3wBmZjZDI+ZI2NbXqVjKvhLIK8mNZ033TyyqHtcmk0nEWHS/Dynd2wv9vV7PpkpkudU
	7JA32NWxzdzyWCFdGfttryQaS40Mg8Hmu+Xbg0syZMUFAml/ZHlUTege/5y3lMpvjSibJtwai5jAu
	cTn4bnlJHoizqrnwn6uGIM/3wwyXK+1jjhJJPWLwm3ix8Zr257H517BoscJm/Ug/deB6gL27T26Kn
	VNwXYEPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9in-0000000BQIb-1aIi;
	Wed, 10 Sep 2025 01:34:05 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9ii-0000000BQEh-0GeZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 01:34:04 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250910013346epoutp016164b3a862d36587d809e305c8808ef0~jx9vMmFzN1494014940epoutp01H
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 01:33:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250910013346epoutp016164b3a862d36587d809e305c8808ef0~jx9vMmFzN1494014940epoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757468026;
	bh=B/cQztE6JVsN29H2UCnnOkTaLkGI3st9SaYIAZ0Aj6I=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=jRGOMphxr9OlYaJEH6x1gYZyDvpOgTnngtS/3I3ljide5pEQgBPHPyvfPhpoecHxL
	 MIApyz7+jUfWexphehLhwg6aRsUOj3CAnGERFpgOk5n9bZnwnsZlDyxsipwQ5cWOc5
	 9MerGn9AbIJGYFCRZ9NMOm1pfNQ3IgfUSKGKrM48=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250910013345epcas2p1627ed06365bff0aaf2d6a0810b074777~jx9ui-Lrd2488624886epcas2p1h;
	Wed, 10 Sep 2025 01:33:45 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.70]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cM3B075H5z6B9mD; Wed, 10 Sep
	2025 01:33:44 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250910013344epcas2p265fefabdfed14e90b66cc856c559e561~jx9tOknPz1132511325epcas2p2b;
	Wed, 10 Sep 2025 01:33:44 +0000 (GMT)
Received: from KORCO115296 (unknown [12.36.150.221]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250910013344epsmtip1bcef11072703a7ec40ff187ab78578bf~jx9tKKmwA3018230182epsmtip1Y;
	Wed, 10 Sep 2025 01:33:44 +0000 (GMT)
From: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Bartlomiej Zolnierkiewicz'"
	<bzolnier@gmail.com>, "'Rafael J . Wysocki'" <rafael@kernel.org>, "'Daniel
 Lezcano'" <daniel.lezcano@linaro.org>, "'Zhang Rui'" <rui.zhang@intel.com>,
	"'Lukasz	Luba'" <lukasz.luba@arm.com>, "'Rob Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>
Cc: <linux-pm@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <e71e6f3d-af02-4910-91ae-acf41692ac5b@kernel.org>
Subject: RE: [PATCH v2 1/3] dt-bindings: thermal: samsung: Add tmu-name and
 sensor-index-ranges properties
Date: Wed, 10 Sep 2025 10:33:43 +0900
Message-ID: <03a301dc21f2$f2236380$d66a2a80$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQJcDpuT0zWDya8nliyk6vzs/32vBQIURjbqAvLO/ccA7RxvPrNcJnHw
Content-Language: ko
X-CMS-MailID: 20250910013344epcas2p265fefabdfed14e90b66cc856c559e561
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903073653epcas2p4cb25058c97aab9a30c7e68ef5f10fb91
References: <20250903073634.1898865-1-shin.son@samsung.com>
	<CGME20250903073653epcas2p4cb25058c97aab9a30c7e68ef5f10fb91@epcas2p4.samsung.com>
	<20250903073634.1898865-2-shin.son@samsung.com>
	<e71e6f3d-af02-4910-91ae-acf41692ac5b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_183400_765980_97123D97 
X-CRM114-Status: GOOD (  19.71  )
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

Hello, Krzysztof Kozlowski.

> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
> Sent: Saturday, September 6, 2025 9:06 PM
> To: Shin Son <shin.son@samsung.com>; Bartlomiej Zolnierkiewicz
> <bzolnier@gmail.com>; Rafael J . Wysocki <rafael@kernel.org>; Daniel
> Lezcano <daniel.lezcano@linaro.org>; Zhang Rui <rui.zhang@intel.com>;
> Lukasz Luba <lukasz.luba@arm.com>; Rob Herring <robh@kernel.org>; Conor
> Dooley <conor+dt@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>
> Cc: linux-pm@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v2 1/3] dt-bindings: thermal: samsung: Add tmu-name
> and sensor-index-ranges properties
> 
> On 03/09/2025 09:36, Shin Son wrote:
> >  > +  samsung,hw-sensor-indices:
> > +    description: |
> > +      List of hardware sensor indices that are physically present and
> usable
> > +      in this TMU instance. Indices not listed are either unmapped or
> unused.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
> > +    maxItems: 16
> > +    uniqueItems: true
> 
> 
> For v3 you also need:
> 
>   items:
>     maximum: 16
> (or whatever values are actually correct)
> 
> 
> 
> Best regards,
> Krzysztof

Ok, I understood. I will add it in the next version
Thank you for your feedback.

Best regards,
Shin Son


