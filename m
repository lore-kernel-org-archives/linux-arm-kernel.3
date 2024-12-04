Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93989E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pjjfQePfOyiXfU23/6F9LerYYHMnwqmdZzt83UCtIxE=; b=v+bFlgQRmRd8iX
	GSy52/ezTGhkyWdolavvwQzkCRedk6si1eoqbdZJSjV56hhXMDsHaM5u18eE1MKGWhYF1vOv64pQq
	hRAARvzl38KA7RFmCZ+mqaKUopcn7uJXpHm/WJ3hrc17C/8ng14I1PcTfUBJ3X16H9pj+GgUPiI4U
	SQJZb26OqCJJGrZpCw28PmGJnnAz8SsGl2o6In7qH+4sLrXJAd0rVjQ3Kocme2HzpdMuddPLMSbsX
	dqWl6wLgA4sATNb7gr06aIt6JgifyTblcOYSuOHZzMuzh6wVziSdiGK69zAbaGWFfngJ5snZyv6iO
	a3++rOtWaH5VHfG/cM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrLj-0000000D0c2-0PB6;
	Wed, 04 Dec 2024 15:31:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrIK-0000000D00F-1VTA;
	Wed, 04 Dec 2024 15:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Reply-to:Subject:CC:To:From:
	Date:Sender:Content-ID:Content-Description;
	bh=pjjfQePfOyiXfU23/6F9LerYYHMnwqmdZzt83UCtIxE=; b=qAKWBc+3M9BPKgTs4ndhsmVaOx
	hGU1SnV4y6h11PmeQjJXEcrBH5Nrlu9QDkztpDrBOzqObqVAPKy/UttRCRbHVDxLZMCkQ5gWEUctu
	sf+zRVBxCoLHHEx33z4up7EZEDb2QajukBkQjRwhfFShCfuXqglWCZIW7ffC59HGr9/mjoMyYWE/2
	gjWQ1MFE2wi6StR4vzEquAXuHnp0JMns654NRs7VcmoVm0lCK0SKR36gKWdJBkR4e/wSF4hNUcN3o
	YLDsMecBm6NKptu19rmDWIEQANH5/QaYkfELR9UUlyanYQf5HfF7w8VlXAowe0Mak6S6iZT4QZkst
	NRI8Yt2w==;
Received: from mout.gmx.net ([212.227.17.22])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrIH-00000002eI4-1dbh;
	Wed, 04 Dec 2024 15:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1733326072; x=1733930872; i=frank-w@public-files.de;
	bh=pjjfQePfOyiXfU23/6F9LerYYHMnwqmdZzt83UCtIxE=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DxMgR2v5Nu8K+l4ugF2setlK9SY+S1YLY0EX31fX8E4ocdFP6bkhZu2/rM8Ogkc7
	 c50vHSQJt2BB3LWFzlsZ/3s6JT7BMVMXFqMFIfo4sXDPKoG5WJuIxfSIxbodSzNds
	 FdAwaTt4yEfPo5mzeuw6NWcF6MdwjLaX7cbptsKXIauDTn++jvktgCqzGQOQAPo4v
	 eYON6ptShgRLTSoLPGqs03F8oyKq+mB3AwAsDv63++3rAWPCiz6gP15g9LEkuZ25n
	 UiPfgMmme8qdtU212Xs8aDMX9MZz9gITBszFiDk3QJTVb6IXYtwgh6FW+pLcvdfkl
	 m7l7ACdWWYR3/qkP3A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([194.15.87.121]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M89Gt-1tFGmi3scV-0065xH; Wed, 04
 Dec 2024 16:27:52 +0100
Date: Wed, 04 Dec 2024 16:27:50 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Rob Herring <robh@kernel.org>, Frank Wunderlich <linux@fw-web.de>
CC: Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
User-Agent: K-9 Mail for Android
In-Reply-To: <20241204144341.GA191772-robh@kernel.org>
References: <20241202110045.22084-1-linux@fw-web.de> <20241202110045.22084-4-linux@fw-web.de> <20241204144341.GA191772-robh@kernel.org>
Message-ID: <52A93441-8BF5-412A-8BE1-F662A4BE8BE0@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kpFFKleEuGcdJHmJZilFO693NLkTAOjN7Dy30NGmeEjUA55Vptu
 QBH5J7IWTtURuj92DBQ2660+XQtrK7kfRWDWNreJvNhqC39TH/Io+xhQJKOi3SMQgRjKbbE
 WTu8FV5vZVyOk73fuXPF7swyETD9G6luYQUddUExPbcCDelFKuNxW03GbS1kx/Jbx+mqAnr
 ukw4fv3x0Y9MvFAIuYtSw==
UI-OutboundReport: notjunk:1;M01:P0:Dy8xoDf5gfM=;WVivEMm620DfJ0o/7Vy0T8yMHy2
 KZvWF4noSwYtFh3ihcvRp76VL/lWTgkwj3G4xl+xeKkeTIgMgMndk73Gvx3HrZHTCKvn6y6kF
 7s+P+6sIj3JFxbGoB7NovdcDaYRCY0MOofn4oSAIC0trjx/NT6erOEbUY1nAYkgA3nskCV5zM
 6c3GZm9xmiHAfB+3e2fpVIxZj3ysX4hN4WXMqyMIdVfz8JBwJHLfxqSzAyN2SNoQdjGK9/m+l
 SVZtZ8fM5Kkqz2Qxbl2TCvl5Oj5bvk1GcuGIURkuseJL1e5PQUnU9Bxa4BPuCD1nlXOyq0J/Z
 HRsGbGX8ogPrfQGqpYyatS1Vq+oLHnqYwLCCSLI4NFjILeWRMcMtI4WI2HrEdRP/4u2SX06lT
 o6izjdgJALZcLJ0H/kE/JI6Bd67omLeWhjTxF0D4umcDutjilMFpetkc26/BVrQJHPl9APIRA
 yLa4oj5J/28LdYlhCQgPBOCLxM5I2lcOv0M5KObC86U8SgCjaGJvFYspALYmhLkq9y3sZV4u/
 LnBN9JBWrkArg8OSDVDd3AJzREeUqlT4i5Rry7E+UQ9HoCZGhN9lIvwsTKCCrMrn9Vn4ldQHK
 D1Wfr/E7sqt747C6B4x+oPMPYoYTEulhs46CSoWL3JYju2GF+BdpneT8Xednw7iEtnvNLRE5U
 B8CCrdqEn1uoWT9Ia4xnzxbCi9oXtos9kMc23LCLHosmi3G2dbfTdOOXfx3jFVxhcgb2qrhgp
 IsLm5/JYTT4PjSbDHIZpSzBQaPvIpsmkrnA9Dg4lxGdo3xF7JDfNPihvSmT0uslXb1Jou0vTJ
 NOmSoAuRth/WTt7nkjeyNb1IzlhsyvDHMVfbA2Uq+VtN8+r6imRnhetbXpnOzE+VisBfa/oTO
 JQ3qmjPUgAZEZBc5wA1vW3lYc2xS1YaR5XxmxYlvb4EboQSSXJAXkSLNhPNuw56krNG9Ae/mf
 tSrNG1drUs8IymUycvsVH6zbFKb6NbAKvNAy6z4j5jmVwjVSrh7OnGIn8yUahu6enT7hTqb6j
 OynjWGUJRnW/+ERwgYF+KIpoFhHurQ12eZ7bghBtleCBY9DERazQmmoKnWDsaexhuOMiEsYAJ
 n5sb1qPH8yJipObVfC4Mjbro8igKhp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_152801_618912_391BBFCB 
X-CRM114-Status: GOOD (  11.07  )
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
Reply-To: frank-w@public-files.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Am 4=2E Dezember 2024 15:43:41 MEZ schrieb Rob Herring <robh@kernel=2Eorg>:
>On Mon, Dec 02, 2024 at 12:00:37PM +0100, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>> changes in v5 (so not adding RB from Rob given in v4):
>> - do not use MTK_DRIVE_8mA in example
>> - add _0 functions for pwm
>
>Minor enough to keep my R-by, but if I review it again I can always find=
=20
>more=2E :)

Sorry for the additional work now=2E=2E=2Ethought changes are enough to no=
t add the RB=2E=2E=2Eok, doc says "substantially" changes for dropping the =
given tags=2E
Imho it can make the "code" better :) I will fix the issues reporter in ne=
xt version but wait a bit for the other parts to get reviewed=2E

regards Frank

