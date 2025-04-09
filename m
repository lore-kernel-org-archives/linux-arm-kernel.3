Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E4AC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 11:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wF9y/J3VsbFPV5qg4NPTB22BV1bKOQm7AwHR9rufrFw=; b=nj+v6ZqICM3fJG3d5Q7XK7RImf
	biXTmBsv+2INPjELTkubdQv5IIMFZVlUkkkWykvna8OGpz46+0Ue1xM87PywL1R0faKDtX0eFBMaC
	I/pMRVrw2dBw3HUKtBcGMcTJhqvzPYlu20X0rZmqT4R4hrO+/CfP4TDyJxr/LN9Kd8GaAdAjS28zN
	oK1uYIOYqNth2MfCrF1dhxFipH8su6uhm+8rJs8kwdb3gmpnJ+AVqCOYkgB3pRSRla+Hun7AnO5bH
	+N0jq+PKFNaT4I1DF5zRvgHoiROa269t4PAg6qNdPLaL/l+TsF72jl628BVS+d9eQOKXAazozazqE
	sR1Apm8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Two-000000073Yw-1rSX;
	Wed, 09 Apr 2025 11:50:26 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Tv1-000000073ME-2ep7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 11:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744199314; x=1744804114; i=markus.elfring@web.de;
	bh=wF9y/J3VsbFPV5qg4NPTB22BV1bKOQm7AwHR9rufrFw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HFtpw7ycizwyNIlZ69V7ZQTFYWJEb8s8ShFXOE0MSrAoLhkU7Bc7lVpw9LdQKM3B
	 dZum5cT/KmAm9OyxQEPC9S8rqYSFSJnFwVjaSMBLGuKPm6rQLUHxRJAzczJremNxE
	 U+MWNySyaEtUMwRYeaZqO4dUziEgO/3bHgMf/mRtzj8WOZ3Ty8w1drMC9WoVLxkVu
	 /xThGKRl0AvpJB0m5T1a4nlcBSOw6gV9qAZ9nh8mwUTnlHwwqGqt7Epes2eGlUmYN
	 iuTIOHm4vPcD22yVmABb9KskbP/fbdMaf2BgK4YC4UaTVkECmp43iOpvryLZ4lYzn
	 U9XfCkR2T1aKlBIUTQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.27]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MMY1D-1tjQxx0BwF-00Vncq; Wed, 09
 Apr 2025 13:48:34 +0200
Message-ID: <52aa52a5-7081-41ee-872e-f1728c06daf1@web.de>
Date: Wed, 9 Apr 2025 13:48:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] cpufreq: scmi/scpi: Fix NULL pointer dereference
 in get_rate()
To: Sudeep Holla <sudeep.holla@arm.com>,
 Henry Martin <bsdhenrymartin@gmail.com>, arm-scmi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
References: <20250408150354.104532-1-bsdhenrymartin@gmail.com>
 <0558b7f7-8c69-4664-afc6-bae4fdc6f071@web.de>
 <20250409-merry-gay-lemur-8288cf@sudeepholla>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250409-merry-gay-lemur-8288cf@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:X53yHopdPIDmGmiruirXCSOmP/kCyEItqusd7/5FHAh4OKeQZgj
 uMj+IcyDAW1kAG8RSKbkdC9EU/xw5sccS1CjSCRgFep2i1Ea6dUBwjsk9+NGFZkmfYW2Hv4
 ojiJtarJTJFcGOk9iH8+MRT56zZFe1RPyCh9XihM2Y0vHXkCM2yzIDJKK8c4iyBGZMndeuB
 tnzsytrwJCvG5ZmG04uLg==
UI-OutboundReport: notjunk:1;M01:P0:amzieSPgePc=;wvcCvc51KN9eWdRTJotmxzzuQqG
 yT/hPmcXnWfYGQ6JRQNq/rZkStx4JDeWcQloa4sOHTJj8HacXTSDTSUUQqUwdc3ATwAznubXl
 i8aPkdnuQMnPkwOmQIaOhSt3WPj38NCi/9ofLMK3tRFf/K4uJFszhHN7V6MW7DtLOlS3xpo40
 AHjGfR7UpUsCRU9TmQibjeskhWMwGpR3ZB4sS0aElolcbgejecwgGXEDyBZHYRO7FoaLs01Bo
 n+950hVskRLRuMgDtwyZ9HpJswXjEARZpFyj9uUc4VlIb6IKJfmc8Nju0nw3OKlQoZLENZ4xP
 Lse9w5H6bTOGoQxXN8gipIvhM1Nc4jNsGir50QgSCkqXvBcHLt6znduNd4jf7uXScztGlIMSI
 K1ruQZOyEYsWA5J4iss3Ky4b4SfIW1u2omUcB343zDa/kArYU4WKISZSzzDQBwfiE+Y/lUdG+
 Eiv/9WB14BaRGPFwPnbzVoqE88YTSqc874NU0kPIWdpsWWWEHo1GjzTcraoUX63AnMTDNDHw+
 IvyFvJWiA0Yruh1yyRaLj3Ltzf8Wp9VSz4FrFFSUUxQgvEWzyr0ozihABycXzxZsTjOZ1GBBl
 +LZqY9GhKtP4rTH6JATudwLSxM9UXhc+w5U18UbDOtgRItZMYTqFYtxiARjvtW05MvrTYqOYT
 1GY0hdlQYtbcao/BOI2GkdnAz1HmLq1U3yzlsEvUYiAsS7a79IYxcBCEE4YuAl00Isu4u7Z9c
 HEYtTlmEFx0Uk5hRlZ8QuWLu1Cav5POWid1KhXZS6Z71wTPz2LhEjwf4Ni0Y9KRgDSw/3myzG
 mtJdHH/RdIZ1ppMzrHmb2YxdD6or31yFusMxFvwShB1e4BW5qKPgxey7nrNNT16UqF1N/MRZd
 kxCQqDj0xJ2PqAWXFPM9aMz7rtrmOjwYhKuqL3x4HMKwvXmMa+h5CrQulM+jhwtvYXaVAupcF
 0VgmEdfipv3mijweHdmhSZ/Cd5T6pp0+xehb8e00bOQ+lWNjZTx/npaK29vFSohIXcSF+7Vw1
 K9Bs9YN3yuhN7clT4y3JpMeXcNNL0Yxu/QBzJfrkhWOIprqep9/KSf6kKDhrosLzkJ3w/p1kN
 vs0ZriStj9V5o42Hdpy4E6TnOzgNboo56tAN/ph9qFsf+yAMSNO7TqxQWSo3nfvehL8j+92AG
 aSZOV7XCQuVGzExMVdOIsG5F4RQa5mO19YUFcldvnpwO51nUaW3FUCVXcFpbO4EW6bTzfc6Mb
 ui4489CP4V2wn1NWVME+9rm0xG2yUIvD4X5nUDojQhEwXpGaunkT/M+olwwMgkWAEn6ouzFqa
 0H6yTSRIgszggj23Opz+8GGwTAuekFRWVis2BFR14MS4YZTppSBDPl7jYzZteSvVlxN/PxPXi
 SEOPyBRYNk1ujFUnvNkJqAKrUc1tLHAjFkWkgsSAjT2Ey9HO67ltZUEmbJFEgpyXTzgcYc44b
 s/+YgxmQ8vfKVyMMcm3g38urkiPht5xO2NZ+EpDI/d+IFUoohyqCyLPT6aFQLmg+Jqjmt9jlI
 9u2tkWCYPz/B+bOnBL0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_044835_977989_51E4C4AE 
X-CRM114-Status: UNSURE (   5.41  )
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

>> Can any other summary phrase variants become more desirable accordingly=
?
>
> This is meaningless, sorry can't parse. Ignoring it as others in the
> community are doing already.
Do you care if the term =E2=80=9Cnull pointer dereference=E2=80=9D would b=
e used in consistent ways?

Regards,
Markus

