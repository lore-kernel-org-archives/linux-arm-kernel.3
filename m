Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF39C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 10:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVMjeVimj9bigs3Ft2HZzQg53xmlBKzfvvopzZb05O0=; b=EgybUjkpuDnf5k5UqvA7dNV72p
	9Z0q/q7Oj2fZSgmYudlgUAmkMfWLtoa/QyK7wtwduEIsdA1dx27SAtJ7wRruhZpkwk72N+6q/TLzG
	QLoBNlIqn1wtPbvJuJ+CL3Zkv9trpqDB+fkS2XDH9GoU8Y/jqWftUarxRBUrrYDR4o/OY45b+XxC2
	7ObnKlZt2EV5o4uwEAPxqxqTiOAYc7amDxtwNzyohsYz3NmCFrAfHWV4KVZequ7d1exV+DJcLivgt
	lf++eDAivoVt47so43eCba+h2qzU012xs9GmJG0RFchP/MDEnF1chfOPrQSTPwe3T2FJ7eYM15j60
	LJ9xdZew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8zj-0000000DQBm-1jU1;
	Wed, 13 Aug 2025 10:46:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6ra-0000000D6J5-0NPo
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 08:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kVMjeVimj9bigs3Ft2HZzQg53xmlBKzfvvopzZb05O0=; b=bi7DiA2U8uYprqpJPU3FfNBkPv
	EuNF9bzG+ALxIdErKMM5Lj1Ze6YkvAbOl05GdXoSButNQMO9Kgj3oy2JGM24g/5tKLO96skHGJTT7
	HdmvDG/M9s09vFRSEWNgnlf73Yk2VNuqn28aLwV+lSmL5fZstJqE5SJr12lt5YPLJ8O67IO4QMd5s
	aMeDk+C9ByY+X5PRIsSAqjUvkkLoV6DMzHXyR3q9eQEZ7d/9tdIlcdB9ulSr5bT+uObT6YR0pN1Uq
	sfoFRsnoxrLnopr451WRnTEHGqcl7n5aN4P2eCYwXOjqUWZWUCe+m8ilKikAp6sU9fPlTkSNqzJHL
	QkLZP1cg==;
Received: from fw2.prolan.hu ([193.68.50.107])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6rW-0000000G0cn-3LlF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 08:29:36 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 823A8A024B;
	Wed, 13 Aug 2025 10:29:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=kVMjeVimj9bigs3Ft2HZ
	zQg53xmlBKzfvvopzZb05O0=; b=E5tytUhXXMptxH2U2Z5HK9cD5DDwOqB7OZuA
	8Ygm0pG+3d782Fv89BRFsm8NkmD7QbU/u/3kvdhQqzduShzMMjvvZNOEOv/fV2gp
	4afRxcHV7UN68ndSGmlPYAQymy0uwyeLf/bBXyBTEiyrtC2tjKiXr6u7XcY52We9
	L7sh6wQNJIWw/HIZrdCI2A8Mcqsx/mlUFvC5L4UxEmqicv359Ny3LN5maWsezGR2
	yF6LYNebXletH93zeqoigFtnNTJkGrJRNnRA1P4dQkiUilVBItfLNTyOZnm28S6g
	CmMZ5+Mpla0H7r1FKoiSxcVI2DXtbDBzeadP8jgGzA2/CdgjZ7ASsfOhnGxHz5av
	7DY2DOY56lXRTumCOJ4qFj3H6ET62QN6oacTOzWLy+CSTtLl5VUd2oGMS/8ZAIzf
	jjM8WiuxexfXJW68Ace1O4xNFTJiU1kqU+YoiRt4E4qYcvuNP2PRIHJZbPbnNPRf
	RNwvL1x9oWH0F320FQE62Mi+OhDFe8RwxHsX1deMRvyeRg03xeiKLRYnlZqybeqW
	JDEQVur9QKioq/TaELXoN/qjPGE6xdNFmKmoH8xk9xczCw3b5E/825u2NLiDoqiN
	teOBNoUYQ9swJ05cgU6x/OzIuE0w74I5KqWYL7gk0ZV2I+gKIgrYgCHCx2+YfXnD
	G1eC+g0=
Message-ID: <d9e81ff2-5621-49db-92a1-acf304b225f8@prolan.hu>
Date: Wed, 13 Aug 2025 10:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Subject: Re: [PATCH] ARM: dts: imx6-display5: Replace license text comment
 with SPDX identifier
To: Lukasz Majewski <lukma@denx.de>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250709-display5-dts-lic-v1-1-81e46a650d3d@prolan.hu>
Content-Language: en-US
In-Reply-To: <20250709-display5-dts-lic-v1-1-81e46a650d3d@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E617761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_092935_282107_98F18B98 
X-CRM114-Status: UNSURE (   8.83  )
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

Hi,

On 2025. 07. 09. 9:32, Bence Csókás wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`.
> 
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Cc: Lukasz Majewski <lukma@denx.de>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

So, what do you all think, is this patch acceptable?

Bence


