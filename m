Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1C8CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 13:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEtc4C9NcRRM9nTNYMQQDv4iFGCBOEem01v80xMhTf8=; b=CvuW5xYpR6oN5+tsw32TMXahVx
	EB5Um41TK2Z/mSejQaPrmbRyAuOmGiY7rsJGWqsUT5kzqCaL/5NKz1FXIRsBeidTbgHuK+sCC0MSC
	j+0HuuWu/XlfQ3ziM7vbMxID2Cide/GBPHUuPHs+mnu0mIUE5h7U73o6q+ba6tDzvrpqo3rVitd3p
	KjvrOyQIGJkp0ALCouX0ne13h2M1UEL1HypRUxW7cj3iFb+8c11VnRN3+CSmmdqSQfucx6kDb3CkN
	XWUMX5jH5Jk0HUIJDACTPkf8jqpghlJSVkikSmdkBiWGYfZzCxgnTRPoS4Pa2ERd94euHIGV5/98w
	LDS4YgTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIxq-00000007mBR-3f1x;
	Wed, 10 Jun 2026 13:27:26 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIxn-00000007mB4-35xp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 13:27:25 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490ac10e337so56601965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781098042; x=1781702842; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEtc4C9NcRRM9nTNYMQQDv4iFGCBOEem01v80xMhTf8=;
        b=sGwewCw57Kr7PhxKQidXF96R/J8NkZGpkErP3OAa6/Yn7HAYPTlOtfY1j8/R/7XJfP
         fOVWzPkOl13phdZ5FD7ZlHjUxydag3G4pjjwD3J9VlX4G38dcpjYyu1A1zojZGugfW+u
         2dwI3Df2g4lQzgvNoJlQkRoO75l/waV1gjGJf0vVXVRCXih+wDTl0mvn/FeLCBiO6Sav
         Ch5EMtngFR9TymyM+7O5OteqdeRLUz6B7t3Mk2jCUo3VHqVnCDcQC+vFuL09vjPG8uEq
         LIchgGd9waGy81Op+GWNxQmNoHtfQBqH79/JPoH6UjgH3DvlCAPYvf9e/G6omfgec/Ne
         rE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098042; x=1781702842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEtc4C9NcRRM9nTNYMQQDv4iFGCBOEem01v80xMhTf8=;
        b=GLPPVRDpLJFoWDTQJDTXksoK/OcCYDP7yHYdmyhDk7/XNp0bhlFZeBEWGUkyiI8ib9
         Bp70yyf7ikaggvAISryYQIuif6bZ5Ho5RLnrdg7S74o5hMrwn0D/wAwJZPDDuRoRl6WP
         iLsDCMQf1SRNRalHTSBPoHLaCJ4KqDRVlNv2vOleExWU1QQi0ICuNZ6rdvWiNgzm2goL
         NGIpewl/pefnhJjJWQdf2Me/xveEfajzfccVQHTj7vE4YUnCP96uaZ2nDl6biXZ3sYQO
         NuWgEBR7PpH2ExxUZL1Epdt/aySXBa91AxB+ZDm7dOXnPVYkCrhkX/HjqFkitjZYSiOl
         IYcw==
X-Forwarded-Encrypted: i=1; AFNElJ8+EDJet0oCe4rhDdR6dfdspcT2cYqrUVly2GmDK5welWTYK1DqIfA4mFyrwH40cmz66J/DYo6NTvtgHQakCq+Y@lists.infradead.org
X-Gm-Message-State: AOJu0YyT0jpoBm/Uk9GVy7RwW20CGjb8dzAM4YOFyyHeK0YGXr6QF86t
	IPxV8LU5jx5vwBusKrcmaIWB7m65tCZ91RXd5VeWmYTdU5BlxU7auT4w
X-Gm-Gg: Acq92OFhHq71ZPsgUGQmPOX433/dFN9hYBVzJZJtJCdmG61LfGdVPG3WonK6wbU3P55
	0kv/ZAAzFwZJYlC2iWkyiw9nWwXJoPlP2YqqCM8tb4lUHFKXo25LmPaMBFahsbfeWkhVFGD65Bx
	p5oXRdM+89B0lSgF1YguQ4IB2h9037jeybAcgkNPbXbZxqdQiMqGADbiWYS7o/JT58bzP/e4RYT
	WHEnZn7wt/udB9NeK3meeyjVDD4XGclEoB9VdGqnznm33x2S1QQ2tbTxQC5FkmjvdCItyva31St
	7/uyc21ohpRZybiYtpZkMZExgAETxgujbIBJ2iHGoh0BlIAv/qOjBh8WP67WJbgPkaks0lTn37W
	TbQdBhjzABukgnjtDm3dMTwYlSPl6tLDiJVCvpWG3GRhSHHIkmWxaoH1wVz7uJy4ZTcHsza19/D
	q3Mc+wc060OBO/AAiC4GzvyQspa9gDyQo0PBHWJbnqJ5Fbvxl5247eiVhl7Rg2ngexovk=
X-Received: by 2002:a05:600c:441a:b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-490c26e1b8amr267071875e9.25.1781098041631;
        Wed, 10 Jun 2026 06:27:21 -0700 (PDT)
Received: from [10.25.222.173] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dcaa924bsm114022165e9.1.2026.06.10.06.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:27:21 -0700 (PDT)
Message-ID: <f9f9c026-716d-482c-953c-373333514846@gmail.com>
Date: Wed, 10 Jun 2026 06:27:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
 <20260610-adventurous-granite-marmoset-e0eaa8@quoll>
 <2fc48536-5af9-419e-b4df-746b678cb6ab@gmail.com>
 <aik69L0xCW13TCZE@gaggiata.pivistrello.it>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aik69L0xCW13TCZE@gaggiata.pivistrello.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_062723_799286_293BF883 
X-CRM114-Status: GOOD (  15.19  )
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



On 6/10/2026 3:22 AM, Francesco Dolcini wrote:
> On Wed, Jun 10, 2026 at 02:10:37AM -0700, Laurentiu Mihalcea wrote:
>>
>>
>> On 6/10/2026 12:37 AM, Krzysztof Kozlowski wrote:
>>> On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> The names of the carveout regions are derived using the names of the
>>>> reserved memory devicetree nodes, which are referenced using the
>>>> "memory-region" property. This adds a restriction on the names of said
>>>> devicetree nodes, often bearing specific names such as: "vdevbuffer",
>>>> "vdev0vring0", "rsc-table", etc... This goes against the devicetree
>>>> specification's recommendation, which states that the devicetree node
>>>> names should be generic.
>>>
>>> No, it does not. Names like rsc-table feels exactly like DT spec is
>>> asking - for a name matching purpose. Are you sure you read the spec?
>>
>> Quoting from the spec:
>>
>> "The name of a node should be somewhat generic, reflecting the function of the
>> device and not its precise programming model"
>>
>> and looking at the examples provided in "2.2.2 Generic Names Recommendation",
>> wouldn't "memory" be a more appropriate choice for the DT node name instead of
>> "rsc-table" since it's more generic, while still matching the purpose
>> of the device? Or perhaps I'm interpreting this the wrong way?
> 
> Please see
> https://lore.kernel.org/all/CAL_JsqKRW-=er+DCTob0HmQv9OyVt7yiej-Yht6UR-mcW=LHUg@mail.gmail.com/

Thanks for the link, Francesco! Things are a bit clearer now. Based on this and the
comments I've received so far, I'll drop the binding and rproc driver-related changes
in V3.

