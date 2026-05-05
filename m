Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96ABCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAYFcoBuVm/XcG40EG9yN1cf01dwHoZZydGSBQe+fRk=; b=29RZMIP+2jJ1b5slPQQQFb7P/1
	McgwIZ+99Yy0XMHsa4ufLsCC99Ce+peexX5hO8YKQaxKu+1AbADYMhNdRsq8TXLK0D5k5HMX+s/Wj
	699Vk3HCvzgMgxsi3mcYyS+aH4Qwp+lRlQqrdPimv+4SGp44eoVJcHNdKebVzxZpLecL8M5sc2QZJ
	qYSZXENR814kZ8qjnemOiuq0FZsM1LH5truKxeN3EK8D07Hg04pbaYb8uipaNN4FLkh1E7okmrdoQ
	plhbpcktzsGpw97ncwDRg2GWvmjf0qAk+xDO0qcZO5WHPRxY2mxxomi8M6Y2MnwnEbIYT6yOLI45f
	ciwDW+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIrA-0000000Gvvq-158b;
	Tue, 05 May 2026 16:42:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIr6-0000000Gvus-2pvY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:42:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645DAb5F3187751
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 16:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iAYFcoBuVm/XcG40EG9yN1cf
	01dwHoZZydGSBQe+fRk=; b=OjftXHJV19fGxCUgY3Jz9FOUwuFlMyIvE2v9eq/r
	Csyto4GYkW31L5U9eST4MIKUcvENbIA8pp6Ma1FUOidL0K7MOjMfgjXVL/i0FnDA
	XphMZ8h4+N/0ZYpTL2BPZSQhxPzFo/K2KcmPT6DYB+4UKJ+dwRrvZoCKCj49KgJH
	7c718rJcgmjNAENjF1HDZTYX7JCdBHeSLp6Nn7tv8gPxJp0fMji/WDDx6CJCZaYB
	pu4dUwRprcupX2wyhzbWr/F8IvsWvCJJjOU9ScFdQkHTZVUoPg4jrN1N4dWw7f1W
	YfBe34FRZkVd/mj00lulLO0reQND555HWK3GlKXbsaM5bQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dybkkab6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 16:42:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9a6af4bc2so96155325ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777999362; x=1778604162; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iAYFcoBuVm/XcG40EG9yN1cf01dwHoZZydGSBQe+fRk=;
        b=ki5wJeeeRLtmq2CnteX6ODby/p6IcALYxx+o8olYd5daq5W8NbDRd5mf6tNBAo/Cvq
         9YM76L5E2lntVScfEC65w/PTzX1EPtHed8FH2HgpJB4jpF7VNd0PAzNSQ+n5Q3DYbgZM
         Qh6c9WVZqxLogwNbWxkjLZtjCguVymw5pu+QGz8aP1UDL59YqpUCAC6RUC5YfS1gChJB
         co0lq8GQnNOuIsUaLmmZZUy2rASXMusZyvFACvxukxbQWYeVUqZSuO/3zKiaU3Fq99Dn
         iRxPUe9hWQIVs/F79QgSK9XvTGW42OlitzpOWK7ddbrsCg1Y2oHef3eb/Mhijd2lgM2r
         10uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999362; x=1778604162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAYFcoBuVm/XcG40EG9yN1cf01dwHoZZydGSBQe+fRk=;
        b=cDnuvX8G/oA4Re9QSkrO9Bn5xC6KP802/dSMtmeu9GmYetBVLsZ47hy7lVOlVtnJEm
         HxihwZ8Nsg0VEgmwb8yIk4ZUPtxK9fk/bew9t3BuZIa6xC3xDZsFovrDODl5WZNVEmuD
         NEfLahbpBLgbFhDyMb6t9/QcDw1dHZkH/j+PXepxmTEtctkpErFild6nWy2l2G5Xy8n9
         KoFt1Dcl/Hkt/FZSG7ZdKoj9sIZBCJ2yQBz00vQBpQgyconbEN9Lei90+MV23Zs4AoF8
         mAvrT0tkcHmw2G4a2vu/XMAYI8xRu/H5L6KPB/gnCicYgwwWmiII0snGOy/gGX4W2XXt
         vxQg==
X-Forwarded-Encrypted: i=1; AFNElJ/r051h6h43+TGyV3OOfCgRkioX0ObayPNaNgmJJioUzMxAUaQrGNsDYMm5FGycVe5rYTHbzrpUQ1IScBu/sjob@lists.infradead.org
X-Gm-Message-State: AOJu0YyE5WmG/OVP5073CqBhSajskNBoPeS8xpwrHQu9kmLvwYNmS8sk
	SKS3d1V32/C3rqWpv3GcqtEfN5aAele4BRC18RPt1lx46UsU9XiQzdJyHkBpmuKHXsDKHX0yckL
	JPBDuhn4LOjAkc5Z4iwII25bjRdyANWBpxiu0AIg+nGlHSeob103O34PA8izh3Ox71JtI1SmxeC
	BGdw==
X-Gm-Gg: AeBDiet2DfpZAPwp+CxOciQT5Z5Aqgk/ERcRQBFjzq0zko8B6W6klaqZ7fuSacd4FkG
	g0iMQf3aYhjdEj3MbrN5/KuVJB1XIdkwr1HgLv7IGOaLMLWWvUHbQNao7g/mb3DRKn1nZwDou3v
	qJyD1rrvsza7y3KhwPQn8hR+vAyMpHpgYVAzq6pqq5Sha+iNAbMLgJTQLVk3LATPbLcJ8PsnI7x
	OygwqojX+1exqnCgEdTzyMn6aQn7TGWX/05DaPfuYrLEJUn26EGgZgV0lDsdpLrtXuNqsGiAMiA
	x/5oIKSrrjcswjnY2LxnyTjturtoK0orlfQU3anGCB3XeqsYCxhTysrZbuRE45tY98d3TOwrExo
	MUHf1a714LiIgw5T2Ryhs0jJnnMweS5cCTyFm/zUc/PH5Gw==
X-Received: by 2002:a17:903:2ecc:b0:2ba:15ff:345d with SMTP id d9443c01a7336-2ba15ff376cmr108941265ad.35.1777999362286;
        Tue, 05 May 2026 09:42:42 -0700 (PDT)
X-Received: by 2002:a17:903:2ecc:b0:2ba:15ff:345d with SMTP id d9443c01a7336-2ba15ff376cmr108940885ad.35.1777999361838;
        Tue, 05 May 2026 09:42:41 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae0f6d8sm144847685ad.39.2026.05.05.09.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:42:41 -0700 (PDT)
Date: Tue, 5 May 2026 22:12:26 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
        rmk+kernel@armlinux.org.uk, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
        gregkh@linuxfoundation.org, Daniel Thompson <daniel@riscstar.com>,
        a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
        boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
        chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
        julianbraha@gmail.com, livelycarpet87@gmail.com,
        matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
        prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
        rohan.g.thomas@altera.com, sdf@fomichev.me,
        siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
        wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable
 TC9564 with a single QCS8081 phy
Message-ID: <afod8ot7xb+g0wzN@oss.qualcomm.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501155421.3329862-13-elder@riscstar.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MCBTYWx0ZWRfXxA95HqRWfcRE
 vMKiM7YJdERtUopwZEGBygIXuS5i4xbUu+386zV6zhzPYlJstiK0bPt6g96pSuwZf9kjlzWU00t
 31D9bpPYP4VqvGW5CnYgYeisZtI/PtDNh+wlt0OekiamlPo9mjjVAx3GtZSU8G+U5zigysDQuY1
 6D7H1FI+FXLew/QsDror6bKjatMu0caSvH0cdwFiYpsxZahLJ5tL6KzjWCZaUr4ov6oQwcJWxSH
 UHLPCTTvSZlk5yZiHiL+0luXPjm1GsheB/kYlMmni//wfND6AMkrZuecp9L3B51jzGBMG/+zCb8
 1/Phffj/JWSJVgdBDaz95Kqw0C0qyF+j+gV1YGTY22sNgwWvTRnGBJ7kQZB5YvzFIzKwHKbaGhs
 9MkGPOq4MogY8jO8j3kOUFlz51MKy+uHv6bvXerQmIEYzaaamGqmDSxbRj4I9tYB0hoUP4Cmfvt
 S0DCkpofIW46gkxjmGg==
X-Authority-Analysis: v=2.4 cv=SPBykuvH c=1 sm=1 tr=0 ts=69fa1e03 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ee_2aqc6AAAA:8 a=lW0hg0oAPnnF6MRRTAsA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: HM94SbaO8rCFl-aNDsWvHxtcAADxLwUJ
X-Proofpoint-ORIG-GUID: HM94SbaO8rCFl-aNDsWvHxtcAADxLwUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_094244_835156_42C1E063 
X-CRM114-Status: GOOD (  18.16  )
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

Hi Alex,
On Fri, May 01, 2026 at 10:54:20AM -0500, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
> TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.
> 
> There are multiple builds of RB3Gen2 with components included/excluded.
> That means whether or not there is a phy attached to eMAC0 depends on
> the exact board. However all versions include a TC9564 combined with a
> single QCS8081 attached to eMAC1.
> 
> Add properties to the existing PCI nodes to describe how the TC9564 and
> QCS8081 are connected to each other (and to the host SoC).
> 
> (Note: "pci1179,0220" is documented in the "net/toshiba,tc956x-dwmac.yaml"
> binding, but checkpatch.pl doesn't recognize that.)
> 
> Co-developed-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>

There's a minor typo in the PHY name - QCS8081 instead of QCA8081.

	Ayaan

