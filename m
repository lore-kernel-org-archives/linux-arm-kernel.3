Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC06C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 15:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euqtbZ8JKHVRTKJRjjj0PorQ8eQxhdkHP+XNgxpwhdw=; b=xZPe3ll831q1cTLqkSAMLC26AE
	S2Fzdo1QLsEpB+EJPt9eN6GjzJcWKmSkDcCx0UVhgvUIdzynU2fEe54B3v2D4UFRbyPLXMtr7PdKe
	Gi5xFrcyrlvQ8o5bDJsfx8ra8x83aaikNfQRsCFd831rw9hBOe8e8xZju8X47zPx3e4+W1qnnCfQX
	St8sLCFybqp8csv9nJnw+ivZ7bG+YKlbeXiBk8/aD7olAkhfTA6DN4FYJviuEov6BoA7pbCUdSman
	kYegM19A57jbMKVVIIkSMJ7kKODm3Dp6Xw7KaV79y760mPat7FYizw+oirKQ8NtA4qyQtdbVgazJl
	sjVH+4Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUaM-0000000HX2I-2K0z;
	Wed, 08 Jul 2026 15:53:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUaJ-0000000HX1c-3hhz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 15:53:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3HQH2752124
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Jul 2026 15:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	euqtbZ8JKHVRTKJRjjj0PorQ8eQxhdkHP+XNgxpwhdw=; b=povksdEEU32r3U2F
	208oi4s1n1bP0yeqPcIppmU/CFq/z0p08+vUOGb1+bJfQopePrfbWPCi5pKmapfu
	xY5ZMZL+fhM+mHK636+iv6T2bySKiKVPwxvAafADP1rm0E9YF71ZlCObddX9+b7h
	eJ2ZLa89O4/eY1XXhqiLtPo3zpQQUrhecZ1u9YWOyFZncUKFGmH4wNDPyVYOcFWx
	C4TRD1jkgEth0B8iasVRKmeX2uUWUJw3TedN9oHHXd/jfF9gRTq6QBCYw9Rvfbya
	yN2GRoHefAatw7UHrkAFHJQ5+aqvsBJYfxPgWtc66NTUjrf/uYyO0qdv7XZbyuUl
	8jB6Eg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hjjy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 15:53:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f18c4d1f82so21437946d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 08:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783525994; cv=none;
        d=google.com; s=arc-20260327;
        b=XJBEOahzwevynaCCCc+3CsOBsY+4M5VHBcbmybdXwQpyxr9QbQ0tN/MGLZTrWLnz+2
         VtOb/pr6vglvYrd9e3isQAUR7sMAr6NWrXy3MQP47O1PGDZyCQ44JdEfHd9bdlb7UOZU
         uzrulimXI5a6pRQqOhtoLNCqJhaur1ENzkj3sn/OuJnNLBJAzqaafOxAWnKqgmsXMBEW
         WBl6XgufghETfH7BhRUkEdooq20nRR5tsKQzB+xUZ277BVYHViadM0VF8lcuN+Lg1pJi
         yldVvb5iN4dQPM6YSgJE5acEfJ9ymoFCy7fU4Y7Kjx3wvpARkhPSSLWrBEA3NNox78WD
         CkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=euqtbZ8JKHVRTKJRjjj0PorQ8eQxhdkHP+XNgxpwhdw=;
        fh=cGhJSjSTgTkmVQUqUU/TGWD+FMWcU7sK3jtmlTehGmg=;
        b=POydPZsV3HhLYsQ8SAs8Wv+WSA7HuaTekYxDlOYRtDiSo5yvit0ADHjdciY7cUDwgr
         CoTSdsQRduqgVRnxjUhvIHBjKZwydD0niiZ8wps4hnH9xV9ODa7NPAXxHHiwhWncKs21
         ibOm0gpz/zYtZ+xMeLhOzQznkGPsx1+UpbxvmdgGzUO0rp/HkWd7CoVKNqOPRaxu9PAH
         dYHHtoZu8bK7+RTWFJew8fkxiWEjtQrP9BIbXZKIzyUrDSsmN4ozPGQxZrl9Z68qVhbe
         iMd2MOCrvWFa2x4/nUShgUDrgbIr2mW1Z0xcyaTBxWmZm8WRp4iy+FbX7AaIz833ydTi
         f4zw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525994; x=1784130794; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=euqtbZ8JKHVRTKJRjjj0PorQ8eQxhdkHP+XNgxpwhdw=;
        b=aBqvRbS/nXFF7/XLsA/mZDkNuXLPe4YlXkrtqF2EscfJdH8mU4eOOGM2FS6LEeBESp
         JCllvZSRTl8p6dqrZbbF4a0p9bfYIDV2+mT3N5kFsKdBYUXsELv357UCqDB/ME15hlo+
         cu/Hgrka+308fRJ4Wt9oip3DTmatkzaSXzitKfZ+H2CS3SpM70LrSwXW4gASal0ZhS58
         snRtt8RgbL4/5Rc5gA+ixDa3tZ/mbEWfVnFYdoZzSm7uygZeVhodz9MfwkEw/dyyNRVW
         JshXMORrI7x2PNrj6eI6NKDMsmK5OGICLWDSdPPbQg+Fln8xCQFfrWgRf+yDgLkwSyf2
         LVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525994; x=1784130794;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euqtbZ8JKHVRTKJRjjj0PorQ8eQxhdkHP+XNgxpwhdw=;
        b=rcqYh84TqmlvnO5DP1rfEa8QINGgsX5M38Rr0fUNIsgaFWuQBxMbR9xIpsT8ZP6T6l
         M/gTNOzZEYsZpITHQpkJhN7QctVhmB00VkIJFLiSrd/SliUZ+gLxjqLJUt65LMaOESzR
         EJVcrBMZ/CFF9tSPGTc0uCDHH+pJUlUgr53mrRdtetqVOP/lo1usclzwv15/kBfufTbR
         hCjlXwrL4cXNbsKGR0IYdziyrtGe9i6P08ZetcS1ivKNW3bD+RIyDYr3h0raF+zMalC6
         TBlSkR00i5jqdhLMwz5pGnrkg9MyJZY/A4csXBf4bHHewk60sywb67xX1XJDM1TX7bqH
         tbKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqo9n5l4s2ZRqfVKvDy4CjW3XuYQYAB+dPFuMUlM6gYbF0h94D9yV1TKbrdMvS13EChvfjIdOa3tNgYljbmuGqQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwbPQcsqHRFwHvcCPD9STpyMZHFT4/Coh4vXKSrJ6NIgcTt7X1T
	yu5pRqqxvF2FcFPOAGjXgdmRHm+0OBoTV//zRbzAxSqckyKT1FDNZzlIIgVDjDXNCUHKztcLi8F
	I76KOijb5WHskTJWoFJcsjsBj/kbRY5MeBxkSYHMQX4vvAzK9AeNOw+KjuZIE/ZI1EprgJ9r7Rb
	AmhltOYVtP4zo/lMwdVNsVqpCwspDzschyQMoeCtYVowtw6BrkOksyvKUG5ieK
X-Gm-Gg: AfdE7cn/CbKrcE/PJsnutn1qFDW0NWMKITSRdC1eRd5FozB6kvCaktwdBC68XMcVEwN
	CaguyUIecw6CVwPeehVCGbHqidMHxQpOrj0j0mSnaVLtda4vpXhvSz65k+wQvlrw9CuOY5/brQ9
	hcwEjf3sLrvT6cDLjsqsANs24TOQbB2e/5H7aBYQd+pxHe2pweUOgl3wLnKjUpm7vdJ/X0
X-Received: by 2002:a05:6214:5508:b0:8f1:323a:fc54 with SMTP id 6a1803df08f44-8fec361ce5fmr26792446d6.42.1783525994355;
        Wed, 08 Jul 2026 08:53:14 -0700 (PDT)
X-Received: by 2002:a05:6214:5508:b0:8f1:323a:fc54 with SMTP id
 6a1803df08f44-8fec361ce5fmr26792106d6.42.1783525993919; Wed, 08 Jul 2026
 08:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org> <20260618-ux500-power-domains-v7-1-v1-10-eb5e50b1a588@kernel.org>
In-Reply-To: <20260618-ux500-power-domains-v7-1-v1-10-eb5e50b1a588@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:53:01 +0200
X-Gm-Features: AVVi8Cfl9mmuZ0-N0YzXyQTku0PxVhLh9qj1SZFF_tsUR-VGJVPz8z3CnsVKBnw
Message-ID: <CAPx+jO-ow2vo2wMxERLGse88wLoaR=HLdOWk6Qwv97ZdbE4R5Q@mail.gmail.com>
Subject: Re: [PATCH 10/11] regulator: db8500: Add power domain regulators
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NiBTYWx0ZWRfX5+vjj08EePtT
 JaROmfnMzg5bi9HToVvxzgUHYv0tS0vvq+Alejy9+z0FMfdPepKRXDQ6DuP57n1JTcD079WZgPR
 8nEJWNVHiX5DfgoEzBw0QG1vgkLBgKbrAip4RIou4+6mCz1h1HeakyX97OaE2bsSOugjQoHGUph
 1dyFyMxVpgzCrleM77e3cXWu03plpQ8kb8J8Cp6Y9zBbcabEHXAw640QJtfYCNQN78cPdtlGmTZ
 P9m60wJ5pi5aVAyH9dNJDQdOeMpJTcuBvTI9RMtRXQ1r/4WDioWdr+FIFKiGcBwrZ6NiF4Ks/zZ
 WC1JgoPJjz3OVcEU2BwxLWyJCMDf0I4bp6kAK9z+U7U9Opu40hX0Dc0NDmsyRpv8jk3KsRcNXjK
 2jaa94/UgNajaWgi5MZcyiqnLs+Jx94iLYYFuSB+Tfgx2vGwk5RRlDr9DnGVitLgRB5Y/5TvwLK
 3iJ3mMf2BYMNd+3eeuQ==
X-Proofpoint-GUID: laraxSy_cnLu3PYnGhtKpkcDFuPb7phN
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e726b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=l53Gh-upYCO10StVhpkA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NiBTYWx0ZWRfX9nGQox0ZXi2S
 NeFwQE8a5TPMEmYoNIkt0OrLzRfa35NxTgNk6oAUJS+tHM/dF6pLCwGoc9omSxDyk8Ayei/+KY1
 K/Tg54hNK+AfFdgSRqdK3zW0Kz1cemk=
X-Proofpoint-ORIG-GUID: laraxSy_cnLu3PYnGhtKpkcDFuPb7phN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_085315_925710_422178A6 
X-CRM114-Status: GOOD (  21.20  )
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

On Thu, Jun 18, 2026 at 7:01=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Add a DB8500 regulator driver for the VAPE and VSMPS2 compatibility nodes=
.
>
> Back the regulator enable state with the corresponding power domains.
>
> This is done for off-chip consumers: the corresponding voltage rails are
> routed out so they are used for powering different peripherals using
> these voltages as supplies.
>
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm/boot/dts/st/ste-dbx5x0.dtsi |   2 +
>  drivers/regulator/Kconfig            |  11 ++
>  drivers/regulator/Makefile           |   1 +
>  drivers/regulator/db8500-regulator.c | 221 +++++++++++++++++++++++++++++=
++++++
>  4 files changed, 235 insertions(+)
>
> diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/=
ste-dbx5x0.dtsi
> index a6fef302c994..fd6a075e4c93 100644
> --- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
> +++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
> @@ -673,6 +673,7 @@ db8500-prcmu-regulators {
>                                 // DB8500_REGULATOR_VAPE
>                                 db8500_vape_reg: db8500_vape {
>                                         regulator-always-on;
> +                                       power-domains =3D <&pm_domains DO=
MAIN_VAPE>;

Hmm, isn't this the other way around? The power-domains node should
have a regulator supply?

We may even consider to skip to model the regulator altogether and
make the power domain operate directly on the prcmu instead.

>                                 };
>
>                                 // DB8500_REGULATOR_VARM
> @@ -693,6 +694,7 @@ db8500_vsmps1_reg: db8500_vsmps1 {
>
>                                 // DB8500_REGULATOR_VSMPS2
>                                 db8500_vsmps2_reg: db8500_vsmps2 {
> +                                       power-domains =3D <&pm_domains DO=
MAIN_VSMPS2>;

Ditto.

>                                 };
>
>                                 // DB8500_REGULATOR_VSMPS3
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index acc698c17bd2..8db63d8d3fa4 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -397,6 +397,17 @@ config REGULATOR_DA9210
>           converter 12A DC-DC Buck controlled through an I2C
>           interface.
>

[...]

Kind regards
Uffe

