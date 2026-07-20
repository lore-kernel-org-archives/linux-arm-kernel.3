Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD57C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 01:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHtfumkrjgWV6lqa6yLCz3o3in3lRj0JfrLm7BDLacg=; b=A3pEuHlly+V004T6t6Nb9Y6hmg
	VZVE15fPQXYIYcqKIQ1f/OKC7tUPhRAiBgQsUZlwWIQvJvrCbnnmRZ6mzpmMaubFflLXwBEXOVRVV
	DrXfgPstAUiws9eX5Wkw3i2QibvK4aDSuab5hgaAS2jiXaSO5i/7bRusuzRNoM5dBkbREcKo+pLzp
	tJDyoO018VO3XUIgnPyXRoz5i4ownBFEhYOoCmw998Y7NebYvYrT4InmOIW/0UrM6cQ9ffaK5oax/
	TXYzJ7ErRNiOUoQ5NW4/0feFxdQ7h9mTTUF5Dn/U2wwBtn500DW1UsGDzS7O8QRp77BrXZbp1j5kp
	JnhZbYdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlcz9-00000005coB-1T6Z;
	Mon, 20 Jul 2026 01:39:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlcz6-00000005cnT-2HQO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 01:39:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsQgm756106
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 01:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kHtfumkrjgWV6lqa6yLCz3o3in3lRj0JfrLm7BDLacg=; b=Gf1eMcpZ+8HPLJAN
	fiCceCP8o7gZyVS2ficRMT61jE+1kif8cDyKp2T1NMhKtz2Y2q63BlRPiWUIy8Wx
	ClhT/nckFZRUezDlKJAJYLKBzNkwyV3y7FSgeEc2dtiHWtTF5vn73qZnyJCwY/Pc
	MDh+3AXYn3S9mFxazvO4DgAG4nDdcTJiGlgEKiXMAZyUvUb1ZQ2bQ4//YXiUNuEX
	TmycDo60JjR+RSmmEwmiG7Dw4UeuZ7yzMs2Tgz4hw5MHHHX2/USiF7cawmLTghao
	Cwo26aAoFMA1aC6bQxpS71lVfm1/V+/sD1/27YV3Du6UeWKH44ezy5aNwnhAxdJS
	ZKL3Ug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bnkvrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 01:39:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so190351005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 18:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784511593; x=1785116393; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kHtfumkrjgWV6lqa6yLCz3o3in3lRj0JfrLm7BDLacg=;
        b=D1hOaXZNRjlNeT34K4Zzx2y4dgqNM3jXj6zw4uapjp+8mE+4WxPs6KhYLDxT+GGlmL
         Fra2tSgkwN8d9I6NtbE2HGNg7WVmeMRmZlUBpR6XIjhzp2b6gjtn30GWIH29XAxFPnoK
         3KQCIRuvJB4dtAJ+mQuF4ZXFMFk+rnkSrxxOVf5BYaAtTTpmoxzYKuRxVnGYoSPQSMSd
         QJoEkOy7NAiwHgImGl749e0DOl2L7HYXEGj+OGksn3eI7wCkC9wfx66kmlICuMb2zCEX
         IB586LUC7RGcsAGemgybLP65W6dvo/KvlHKnCCen6wrsUpE/zTKWJ24cw9wmc0G0RKqL
         XwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784511593; x=1785116393;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHtfumkrjgWV6lqa6yLCz3o3in3lRj0JfrLm7BDLacg=;
        b=QC/+PS1goGORWZi3If147A8DE28dwM+9x6jxRs+lrPP+z6JU8yacNgcS9jwpth71QT
         svuP6BovXdHnH2EyYHAFJ5Ipy9LDpWcKIr3iGknsKiz1GeBMJzxONRm8+N6RlgBGdQeG
         UTgUhZLzh+keucDAKCaX/rJaMve+lPxh4dOHAw7bu02KPctOhr/KT/QZDAweo9kPnLI5
         tVO8e0IiLkx6WPOkjlzWqnNevt/IYsHl39N/BL1ajiLVx4YOqeg5hqdxYKQirKhemaha
         Iy2+AYhQO1fLVUwxiWXJpbyXA6+CedPzKwLm51Tuh4PNZOQQ4r6wxsYiOw1lWsYj1q4j
         eysQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrv9VvgysS/O1W/qu55wYXML33rEB1nK70l5WaIoSqjs+ooehG/GKtqKuhNVDoqgFb61+/G7deBRk54OOuXbWun@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy0GeurRDA4JfnT85Zx7Azc22um67Uwq97wAXJ87gf6H9VeBr1
	urYNSbqLCR/eCQ6eWosiGwRPBtw5scvvJtAGCTDE9lOn2I+ZBc/gct9yLwudz1FAPLBQKGylObE
	zcLyVGmErf+NZmPDyfpcDB8fwJYUGGaNgQpHicKcE7RvZ5tAMLz6bNf+XZFEr6JayK+iB8ybDo5
	S10g==
X-Gm-Gg: AfdE7cm/jdfI1gOJx/gc2S+x3zqrlfLtaBwug7CrJcyPmJ9XUGvLtq/9Exc2lqg/Seo
	bl3fxr6qIX7IjcPdujFE7lRSlnSzceP3tz7r8KwdBQdU3aPvaqAuLatr8lrNA27yDzJ9jI/vMsI
	A0u7PRh8THGyO1GywdK6cpnfLKed6ZTdodsgw6KYUm6g4zj7WgcHFGiRLQ2rdKzHg/qJ9sp8WOg
	l2A2WKiYxLZaH8Kwh2DVBK9ydP/SWu021gvDTfwnVSdXSJWX50KLAXIviziYZwJG7pRG4/B84sq
	Kznj43P0Pt6Y76j9stMzFEZRk7cdMNCIelgNEDNAqw5XycwzqmnZPpn9hscNxjXaeMTUR7uhjet
	R5IQaUm5s0jJMVcyN
X-Received: by 2002:a17:902:d987:b0:2cc:a977:4260 with SMTP id d9443c01a7336-2cf3489c64amr138490545ad.21.1784511593219;
        Sun, 19 Jul 2026 18:39:53 -0700 (PDT)
X-Received: by 2002:a17:902:d987:b0:2cc:a977:4260 with SMTP id d9443c01a7336-2cf3489c64amr138490325ad.21.1784511592787;
        Sun, 19 Jul 2026 18:39:52 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34730e35sm47246165ad.64.2026.07.19.18.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 18:39:52 -0700 (PDT)
Date: Mon, 20 Jul 2026 02:39:47 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Simon Glass <sjg@chromium.org>, Andy Shevchenko <andy@kernel.org>,
        David
 Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Rob Herring <robh@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: iio: adc: rockchip-saradc: Add RV1106
 compatible
Message-ID: <20260720023947.0064a45c@jic23-huawei>
In-Reply-To: <5684233.Sb9uPGUboI@phil>
References: <20260714131631.v2.1.0b846080833e4b836793c43fc26d1c6d817cf9b4@changeid>
	<5684233.Sb9uPGUboI@phil>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: l_Xe6ook7Q0eB2dgAG4mZApw1SR9KomV
X-Proofpoint-ORIG-GUID: l_Xe6ook7Q0eB2dgAG4mZApw1SR9KomV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAxNCBTYWx0ZWRfXxj4gIQfZwkKh
 wYZVJLq3wrxwnQAIUqhrSJFKdV/3W4tkiYK/b/ZHUfUj5dhdk8aVwlMp5axa11StTPuHNDx5EwP
 sLu+XQFF+dBYUanVYn2xtsnAkmi4BMEE3STQ6jazWA0L+IW5iXknvWR9tPACAC8JXjqG4jB+bhK
 mS4IveqTlauPvQRbSydlNVRJlP03Is4ryNocx4l4rVlO/zEolkVQfTUQDcVxd23W6w5P/u8qRnK
 DfUaW3Veh58PcsqjXaAMxnsK7lYyg8pWWMV2vfeaTpVPyOID/Fi8Dc3BSDDpvbncvuItXq6Tm3/
 7rmv7HSRvurm5n4HxEBJyrIX2V4JoG5YuDcwf4KTSUN7wmj0aqG4i2qMoGnlTKDDdCkLlDBbcAX
 34UWZmFbb8mC4XgT6L/mgYeHFLMSIWkogOevfFuyHD9RjVfWT3GpPow0oOS68oGcdNXHPSDdHPR
 PNDCyvIrQPBas9wYL3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAxNCBTYWx0ZWRfX5Kc2YEFDzzP+
 vEiJvuFm5GDyUMvaJqxc/AJhmR6efu+ak4pKPnAaM/CAsjgkZvbwLqfEEzNvTFPPGpHOJlldg+1
 NdGnJ4i9xfbt8CE2mTm2vmvn6eqC9Ow=
X-Authority-Analysis: v=2.4 cv=YsQ/gYYX c=1 sm=1 tr=0 ts=6a5d7c6a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=cm27Pg_UAAAA:8 a=-xwdloifxYJzbv6MhYQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_183956_690000_7BAFFF1E 
X-CRM114-Status: GOOD (  14.08  )
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

On Wed, 15 Jul 2026 21:21:17 +0200
Heiko Stuebner <heiko@sntech.de> wrote:

> Am Dienstag, 14. Juli 2026, 21:16:32 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Simon Glass:
> > Add the compatible for the SARADC of the Rockchip RV1106, which is
> > compatible with the RK3588 variant.
> >=20
> > Signed-off-by: Simon Glass <sjg@chromium.org> =20
>=20
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>=20
>=20
Applied to the testing branch of iio.git. Thanks,

J
>=20
>=20


