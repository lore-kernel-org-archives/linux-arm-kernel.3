Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B91CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 12:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRhE2JS8VMDtVgLzaO+li85xbKbuR8ESfHzz9aiWT/c=; b=EYfNxct8pqdE937zSj+FoH54Gy
	kPU5zeC5yMSgZGEf5X+en2kV97DI88boE6/jTaR2UCwsjjWUCi4BGqX5JBfWSrHvSPlKZFJmbMXEU
	/IYlBXosxp6qzlZsRJqtG+ljFemD8JqvA0VXxDrT3Tr/7ebEKEDGGyQIgxqrdiPCMivvBxgMUCou3
	o8bpSAlp+bFAkWhORFSniAdHXnkEfvKvjrG9rcMLk8VYpUHHNBUsbZNx74gROAMQxwTGoQtVEuUoA
	NSQr0+fPYezWDoXfjz9sz7iwOMByuo9taQrQ8QfYLkCVtBIdbzzMWE1daZWj5rwG42dKo7ZUlWBHR
	bbT+0N2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUO9U-0000000CyNM-29xO;
	Tue, 02 Jun 2026 12:23:24 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUO9Q-0000000CyMT-45vJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 12:23:22 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3B8267A00A5;
	Tue,  2 Jun 2026 08:23:19 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 02 Jun 2026 08:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780402998;
	 x=1780489398; bh=hRhE2JS8VMDtVgLzaO+li85xbKbuR8ESfHzz9aiWT/c=; b=
	QtyRN8j29GKZF5IDSW+WQT8pgLgcy4Q3xWxOTXVQTcf4PpjHarj0ZnFQScY83XqT
	G4l8D2xHL7Xfz2vxSMdglyFs9bQNZVNgpjDjQYz2V3+4eH16hmxHsfvkpmhA40vF
	cHvVCuVjO/ANV8SnU+DBZy4L/IfqaS3EIaY6zCLzY+RwoBBiiCMsIX0hVZHzJsFG
	5UyRymkDkenHAIYmylagZ+SqcdrnGpaNPPA7NV9LTpBZ3/vVHJVxwABICowShD39
	gy2qOQ/n0SnbcsEk/tbY8TN2DkzYHrdKdFIF91ZvVc4OdukLK7QFVTtJ+ZvIgVfB
	/BLtzso/+vt/dLHD7L3LDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780402998; x=
	1780489398; bh=hRhE2JS8VMDtVgLzaO+li85xbKbuR8ESfHzz9aiWT/c=; b=j
	THPM8Kd7XTbXh3mZCXz4Fb/3SeDY0VprvCEbWlpXDVGK6tn+4jJfNnrfyzYdLexj
	JQUxMCgb8yh35vdun56MWoc+l8uTuGtVXMkDi7ggHBOtELsg5z0C/Ay1URRslPd/
	sbBjPDNxSMYR7sB1MjjgFK03X+T7ZK/7hvgzxH58Ii7ZFCJM9Dm1P5PhFjjfsQp0
	2dkas3HdaJPw6F25mGobI07+3W64nGs9dCCG1JRDQ1g+BPJFyltRDr6ZEUsluvz3
	hwUo2IqbjuobdVbF7HJJ8WamQ1tr9NY4W+T23qoM3GaLJwoliZQmpJU9V3kAbABf
	8qgrv5uVTlo1zb+yPyJlQ==
X-ME-Sender: <xms:Ncseasli4_R4W3QDYJhW6D38Gy6GqnBetSbVdAG5xsL4JOaODOfyGQ>
    <xme:Ncseamp5bMq5Xy8b_gbBuehb_kcN5n5FE0YIFwmf9e9trU_4tBE2raiCBkX8ER__y
    D8iD2cVce8InU5N1E9yyw7Ee8C5iX5ZDobhShydyhAvejdSxqhxEyE>
X-ME-Proxy-Cause: dmFkZTESgYyi6e4cEOd4bw/XAYmop9bp+Es/eLhRIz5HZQlg/9EMr78/xnJGNo1+hXDWsG
    HTKPM/336wDCh4Yzisnqt6fAwQYJimc26yQovtKNsvcUirJ30fMPswJyTBY9zr1mg+ejEw
    1mqoYpt/rfadcy6R0oEywDm97ts7NMZYeyx9CrKGOKQJPvkXsP8znJaqa88PTLyYdOQ1LE
    xlWDAUqB4umgEl4aTqGGOF9eFS1J6wMDT97kvzM/VCUPBCQObrb2RZJncpZzUjplexsjsB
    8mYTUaEHGHbCmIGDeFmoZYCc+kxrN4c2tNAF+TaQt88zs02gbllA2BK3v1un5gRgAfD1JJ
    dOJYz82z1UeYLXrFxVwlMsvxYzENqiZ4TLd2DQU2k5MPEmm2VuzAuWuGejlrvFsVVl4c+w
    LcoKCKuJBOdaDQV4aTJ/fdBfNGZaWB5XhYw9buY6QbkrzuSlLQg0QgHSnIrhenLb6Qv+J3
    +EaYk2rEzFam+7x8wEb5XGzg6+NdiN3MZP9Cx1zaZzovc0VEP6xn1LxPr8aOy+HsFQJ/6P
    ChtKluJeJdX74hfTjQC4emnYSUYbjuS+ZkU8RNImujGUf3WHpJrpj9TdYLgFwnbQv8y4It
    EF5tHitX3AJAOVBZ2lePP4txZSzdAxRnVWQ6Wkh/APzprwu4BsfB2CS2S3aA
X-ME-Proxy: <xmx:NcseakhJfhRJSqT1yYXRv96xxYAF8Z0uLI7BRiFSNFl4ZIN6wSqbYw>
    <xmx:NcseajZiZoAmHyRY8naS5-3ZEY3D8ad2N_MQpTJu0ff4EwBMi7DHKA>
    <xmx:NcseaoV2jILX7zbU7dane6jIkdvKUCOvAxpRFcNQanl1GcW8VpdBQw>
    <xmx:NcseajGUU8bRCkhiNQIrY4dbBS9lgZMBYgcyIhBF7DYCL-wEoGRHYw>
    <xmx:Nsseagr5NT5Vs_mvZCrzcOsoNkOUOqrFy3slKR94V_adQ4e2pYcqqDC_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4D44A182007A; Tue,  2 Jun 2026 08:23:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AkPwN-kLRsNN
Date: Tue, 02 Jun 2026 14:22:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "yangzh0906@thundersoft.com" <yangzh0906@thundersoft.com>
Cc: bst-upstream <bst-upstream@bstai.top>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Conor Dooley" <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 "gordon.ge" <gordon.ge@bst.ai>, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Rob Herring" <robh@kernel.org>, "Will Deacon" <will@kernel.org>
Message-Id: <24f942db-ec50-4716-9a1b-11ae07923479@app.fastmail.com>
In-Reply-To: <c6e0a027-38c3-4054-b971-033f021dcff4@kernel.org>
References: <20260427062329.3715925-1-yangzh0906@thundersoft.com>
 <20260602084302.2101364-1-yangzh0906@thundersoft.com>
 <c6e0a027-38c3-4054-b971-033f021dcff4@kernel.org>
Subject: Re: [PATCH v8 0/2] arm64: dts/defconfig: enable BST C1200 eMMC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_052321_434113_4847FE4E 
X-CRM114-Status: GOOD (  11.32  )
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

On Tue, Jun 2, 2026, at 14:00, Krzysztof Kozlowski wrote:
> On 02/06/2026 10:43, Albert Yang wrote:
>>=20
>> Gentle ping on this series. It has been about 5 weeks since v8 was po=
sted.
>>=20
>> The MMC driver patches from the original series were merged via mmc-n=
ext
>> in v7.1-rc1. These remaining 2 patches (DTS + defconfig) are still pe=
nding.
>>=20
>> Both patches have Acked-by: Gordon Ge <gordon.ge@bst.ai>.
>>=20
>> No code changes needed =E2=80=94 still applies cleanly.
>>=20
>> Would you be able to pick this up via soc tree?
>
> This is not a patchset for soc tree. This is patchset for BST - you are
> waiting on BST maintainers. I recommend reading soc maintainer profile
> doc, it describes the process.

What's odd here is that Albert authored and sent all the BST patches
so far, including the one that adds Gordon as the sole maintainer.
I merged these from patches in the initial merge and expected to
see future work get routed through Gordon.

Albert and Gordon, please figure out between yourselves how you
want to handle this in the future. You can both be listed as
maintainers if you want, but to make everybody's life easier,
make sure that only a person who is listed in the MAINTAINERS
files is responsible for collecting patches and forwarding
them to soc@lists.linux.dev for inclusion.

        Arnd

