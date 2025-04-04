Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BBCC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 06:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/4qwZL8ALkw/vYGl2tSW7T6VpQ6UVMgVUFv0nRJD6w=; b=ZHE4mblSHkLZqC8X6hZbgdY9w7
	EqY8NbRwdmZfAtkqcB3j87BdOWGBfMOyzJl7HlRujWwyhcx5QdxW3hOLfdC9O/pWVfiBG8iSpJqs4
	Fl3dMXUdPWBRWjHJhI6aRJyH6wNX6wTwlw2lnR5Qs92aqnQhZPGfu30IBKOjaHx36myvM1a2wsQ4+
	ONG5qatr0mdQBEQ2+5YEUqofCf4VL5WHmICDj0DodPPwERu1a4JNdp8UV5Rvo+1AohaHUXKkbdqg4
	ug3MNqHeTUzwwAaHIR2uj6oN2I9oIfG5xYwQghN7yDN1XsY4l5hfljVv0zWNNsS29jLFdsAXF1oNf
	8FVQa0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0aNv-0000000ArEF-0fwh;
	Fri, 04 Apr 2025 06:18:35 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0aIl-0000000Aqe1-1pqp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 06:13:17 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250404061308epoutp04c90832e36087e647a47f1688b5ee698e~zCNQ2ExNa2588725887epoutp04I
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Apr 2025 06:13:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250404061308epoutp04c90832e36087e647a47f1688b5ee698e~zCNQ2ExNa2588725887epoutp04I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743747188;
	bh=b/4qwZL8ALkw/vYGl2tSW7T6VpQ6UVMgVUFv0nRJD6w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jQ2y9EgIu34u7bwo8ofSKBu0apSjgG5AmSjn/fpQwdhN27EerROiD12cWVax3v+Iz
	 01G3RdFQCEqjOS2H5y/2aRaaQwe0RT61jY6fe4CSKzp2JjC6AylDEWjyuHPytMtlzW
	 bXWfbaf5glwsTRoXVlw+vS4W5zTdP2yBKiUk0+8c=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250404061307epcas2p47b3f8dadcf6e38f6712e716ae487ac8d~zCNP6quft0414604146epcas2p47;
	Fri,  4 Apr 2025 06:13:07 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.69]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZTSvk5ZDmz6B9m5; Fri,  4 Apr
	2025 06:13:06 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	9D.E9.09787.2787FE76; Fri,  4 Apr 2025 15:13:06 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250404061306epcas2p2f35e2d4cc2657de8bdca97247ff9da4a~zCNPCKUGc1434314343epcas2p2F;
	Fri,  4 Apr 2025 06:13:06 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250404061306epsmtrp287f0b3b028e1945f0867cd7f10930e7f~zCNPA3yMS3248332483epsmtrp2I;
	Fri,  4 Apr 2025 06:13:06 +0000 (GMT)
X-AuditID: b6c32a45-9e9fc7000000263b-81-67ef787282b6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E0.21.08766.2787FE76; Fri,  4 Apr 2025 15:13:06 +0900 (KST)
Received: from perf (unknown [10.229.95.91]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250404061306epsmtip27789ea7a2e625e77903c23a7d4f3688b~zCNOyaHSw1844718447epsmtip2P;
	Fri,  4 Apr 2025 06:13:06 +0000 (GMT)
Date: Fri, 4 Apr 2025 15:17:22 +0900
From: Youngmin Nam <youngmin.nam@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Saravana
	Kannan <saravanak@google.com>, Donghoon Yu <hoony.yu@samsung.com>,
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, semen.protsenko@linaro.org, Youngmin Nam
	<youngmin.nam@samsung.com>, Will McVicker <willmcvicker@google.com>
Subject: Re: [PATCH v2 0/7] Add module support for Arm64 Exynos MCT driver
Message-ID: <Z+95ckP/shi2EeFq@perf>
MIME-Version: 1.0
In-Reply-To: <ef25c226-6801-48b4-8347-3362415d9de3@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfVDTdRzH++63/TZIuh847dtMjhueHSSwIWNfE7CUbGd1R0dnDxcPO/Zr
	Q8Y299tK+KPQIIxDUtM7HgQmz+1Q5oCxwAGOJQxpq7yD5BSy5EGKh0YmWUAbv9n53+vz/nze
	38/3833gYCHTOI+TrdKRWpVUyccDmZaBCBSlPbYoFzT8FIl+rrHgqGOunYkWm0oBarW5GKhm
	eTuqdbhYaPDSbyxk7eKi+5UTOHK7TWxk/nWUhW52X8BRubuXgUzla0y0ftXKRiX2VRzNlHm1
	dvN5DHnG01HhbREyetYBqu/3sF/eKrH0WFiS1ppWIDGY9RKz8Qtccnv0Ki5ZcLnYkvaGTyVl
	HUYgWTaHpgS8n5OgIKUyUhtGqrLUsmyVPJH/emrGgQxRvEAYJdyDxPwwlTSXTOQnv5ESdTBb
	6Z2PH/aRVKn3SilSiuLHJCVo1XodGaZQU7pEPqmRKTViTTQlzaX0Knm0itS9JBQIYkXewswc
	xcX6VE0V91hXiYFZADo3lYAADiTi4K1Lt9glIJATQlgBtF5Y8gceAGvuGzE6+AvA34famI8t
	s2uNOJ2wAWhynPBb7gL4YKWI5atiEjtgk7Nvg3EiClqG1oCPuUQEHFt9yPIZMKINhwMrDsyX
	2Ewcgr227xg+DiLCYeuMG6M5GDor7m20DiCSYOfUCNNnhsQSB8652/17SoYmYxOgeTOcG+xg
	08yDyws2nGYKFkyOY7S5EMDhsVmMTuyGldPFG2aMUMDV5RNenePVw6FjnEnLz8CTA6tsWg6C
	Jz8PoZ074aNzJn/b52FPfYt/RQns7xvwn90EgOdaGlmnQWjlE/NUPtGN5l3Q0OPBK70tMGIb
	bF7j0BgB27pjDIBlBFtJDZUrJ6lYjfD/K85S55rBxoOPfNUKvppfirYDBgfYAeRgfG7QHeWi
	PCRIJs3LJ7XqDK1eSVJ2IPLezhmMtyVL7f0xKl2GMG6PIC4+XiiOFQnE/GeD7H9MyUMIuVRH
	5pCkhtQ+9jE4AbwCRinr++rQldWJ2ox35x27FlL7mhqspWlvHudMc/VOgatqYVKwJMuvb37t
	UOBYcqP4cnZF3uGwHY+KgcUWeO144+H8tqMN/2buC//mlS0xA19OYLLdbP2ISV/8Yc9Q0hFx
	ydjb8qp/XBGezndEFQaLMX7b1MPp8vngvti9hhHHnw1n91d/8O0oQcyciidkLW7TlbquwJhP
	CtVVNsVBRvpn18uKnHuf+zFpJv9B0dP91bwzkW/d+Pq9QfuNxMX9f98syuk7mzCfkLt9rnnR
	GnH3xcmqI8u1s5nOa2lPDf/Qm3cg+OO4utPD66lX7l3n3UlX7Cs/NWO9/Avf2XQ+7QVDHXdT
	zeDRbpLPpBRSYSSmpaT/AVLG9QZ5BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02RWUwTURRAfZ3pMC2pjgXkCYimygeYFjCiLwYJfDlBDSQSI2LQUcZCbKF0
	AJcPqREigtTdYEXEiCx1SLBIQVlEZE1YRAwQQcGFAG7FoqmYUKQ0Rv9O7rnn/lwSk/K4F5mU
	nMZqkxmVjBDj5ueytXLtCYsyiC+XoPEiM4EefarGkaX0AkB8Y68AFc2uQXdae4Woo/KzENXV
	uqNpw1sC9fVVuSDTh0EhGnhSSKCCviYBqiqw42ihoc4F5bbME2hSvzirNl3HkPV1PMoaDUFG
	6wJA95qtLuGraHO9WUjzRTygi03ptMl4nqBHBxsI+ltvrwtdXZJJ6x8ZAT1r8o0W7ReHJrCq
	pAxWGxh2SJzI39DjmpGVJ/Iq+3Ed0ItzgYiE1GY4Zb9P5AIxKaXqAbTefYc7hQ8cqRgQOtkN
	jmW1Cp1LYwBapioIh8CpDbC06+nSEkHJobnTDhzsTvnDoXnbUoBRjwl4oV2POYQbFQmbGnsE
	DpZQ6yE/2Yc5r44DWGK/hjvFSth18+MSY1QAHLZPLwbkInvDMjvpGIuoMFgz0Y1fApThv8Lw
	X2H4VxQDzAhWsxpOrVRzwZrgZPa4gmPUXHqyUnEkRW0CSw8N8K8DtcYZRQsQkKAFQBKTuUve
	qCxKqSSBOXmK1aYc1KarWK4FeJO4zFPiOZWfIKWUTBp7jGU1rPavFZAiL53A6N/uH+Eh72Tf
	ddQ0Zave6mzsOibK2H89QXH4kDAklVQ8nDlgyHaL8ZC2ZXnmN+0KvZLoIWNfrJE3b+MKU9lg
	0fbokDMvv7Wt4EjX5xMDCxszTfP1ebZSud+zneM5jZrYJ58Vp3uKLs7eDM/53VgrfZ/KDTE6
	u27a7/tt0RZ+U02Dennkngzfc94gqsZdZF9YFsS9j+nR7f6qWz55OUL68Gzsq7jdUqVux1CU
	7dZo/ozr94597ZVfylaVlFX5VPgcLI8cuRF/NSe9kxRHG4e7y+fmmrkHgeMPwo5HWHgU11A4
	ulX2JcTGtQddzPwZFL+szUoxe0uiuF9z80d/dMtwLpEJDsC0HPMHUr1n9D8DAAA=
X-CMS-MailID: 20250404061306epcas2p2f35e2d4cc2657de8bdca97247ff9da4a
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_8fd50_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250402233425epcas2p479285add99d27dc18aabd2295bfcbdc8
References: <CGME20250402233425epcas2p479285add99d27dc18aabd2295bfcbdc8@epcas2p4.samsung.com>
	<20250402233407.2452429-1-willmcvicker@google.com> <Z+8xrLbya9/oFg7y@perf>
	<ef25c226-6801-48b4-8347-3362415d9de3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_231316_111400_9F63A47F 
X-CRM114-Status: GOOD (  22.43  )
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

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_8fd50_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Apr 04, 2025 at 08:02:41AM +0200, Krzysztof Kozlowski wrote:
> On 04/04/2025 03:11, Youngmin Nam wrote:
> >>
> >> -- 
> >> 2.49.0.472.ge94155a9ec-goog
> >>
> >>
> > 
> > Hi Will.
> > 
> > I tested this series on a E850-96(Exynos3830 based) board and it's working as a moudle.
> 
> Hi,
> 
> On which kernel did you apply these patches for testing?
> 

Hi,

I tested it on the latest torvalds tree.

# uname -r
6.14.0-12893-g26d035c84315-dirty

> > 
> > # dmesg | grep mct
> > [7.376224] clocksource: mct-frc: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 73510017198 ns
> > 
> > # lsmod | grep exynos_mct
> > exynos_mct             12288  0
> > 
> > # cat /sys/devices/system/clocksource/clocksource0/current_clocksource
> > arch_sys_counter
> > # cat /sys/devices/system/clockevents/clockevent0/current_device
> > arch_sys_timer
> > 
> > # cat /proc/interrupts 
> >         CPU0    CPU1    CPU2    CPU3    CPU4    CPU5    CPU6    CPU7
> >  12:    2566    2752    2467    4026    3372    2822    2115    3227 GIC-0  27 Level     arch_timer
> > ...
> >  77:       0       0       0       0       0       0       0       0 GIC-0 235 Level     mct_comp_irq
> >  78:       0       0       0       0       0       0       0       0 GIC-0 239 Level     mct_tick0
> >  79:       0       0       0       0       0       0       0       0 GIC-0 240 Level     mct_tick1
> >  80:       0       0       0       0       0       0       0       0 GIC-0 241 Level     mct_tick2
> >  81:       0       0       0       0       0       0       0       0 GIC-0 242 Level     mct_tick3
> >  82:       0       0       0       0       0       0       0       0 GIC-0 243 Level     mct_tick4
> >  83:       0       0       0       0       0       0       0       0 GIC-0 244 Level     mct_tick5
> >  84:       0       0       0       0       0       0       0       0 GIC-0 245 Level     mct_tick6
> >  85:       0       0       0       0       0       0       0       0 GIC-0 246 Level     mct_tick7
> > 
> > Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
> 
> This means you reviewed *every* patch.
> 

Yes, I did.

> > Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
> 
> Best regards,
> Krzysztof
> 

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_8fd50_
Content-Type: text/plain; charset="utf-8"


------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_8fd50_--

