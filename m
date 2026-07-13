Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADA8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 00:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0bmxuDEd3/J3xqv1cuE3jF8wxqe+yrO2LZe9w8bDHc=; b=pIdPiS0xYT9tyVCjXT+KJg5gOY
	qlWtkm+npZQZMZoPrNoyYMtyh4dloz2eRRoqTnexZNuzDJ4w61BeRCHFrlbahGMVXckNWHnQV1Xd7
	VD/t60QIBk2GVGefCT3XK6h338ScU2HHmT2Rii1BFVmzUOp9GtikIb9/sOg/tIJUGmMBpR8kSn+3+
	dCb1two4ePMG/fFeAa1iD2j7TZOOsfcxok4u4mkROtaZeCbXFODAitUcsQ0O/pS5lIaZCXTFlsWbp
	IoVNbIcqAUmgUlapTb84TMtSpd99+UlIjX0jC1pjsWfTzlBIg1ZGOn7v3BGUo6HhbdXjF9jZQaDzp
	/JiWGOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj4br-00000007sTD-2LQ7;
	Mon, 13 Jul 2026 00:33:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj4bo-00000007sSY-1wmS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 00:33:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CNVaiT3695099
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 00:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T0bmxuDEd3/J3xqv1cuE3jF8wxqe+yrO2LZe9w8bDHc=; b=dj1IS0N9fiDEisEN
	2opjupITBFEunYno/r9d/iMg3afIGD8xWRGxrw2B/xv+tECiOqit/zfXiWyUK8+Q
	uku98X7Sf1zsBcN9v27BQ+x9WD27fvzRzn5ELuJYP/f6r2u0KHXIwZf19Hd6/q1i
	rikYzHTq59UUQFfrIRqWGzyDIsFzRfCsT83v1uzZ+WILWLuZMbWRT/e7IA7cD6ne
	TqD5gcN91jsOYPT3bAVmp99VYvOYCTx+btV3JXMV8F7k4ST3TfabUlIC8w4GRchR
	dOtKeMj5PGeKer77a7I0ilSIGQUsI1wQHqeWuToF498yF5vm1csXlxalYic0ncIL
	flTB8Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gkphu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 00:33:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3810960140eso2316447a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 17:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783902799; x=1784507599; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T0bmxuDEd3/J3xqv1cuE3jF8wxqe+yrO2LZe9w8bDHc=;
        b=IJTh8/IOnM+5uH5S3dGTGLUOQm5CzPkg5zA02roGf70RMExg2KoZ3eEd0wvPhE5mwV
         oUKoObPHcmzbqrt0KnhPm2kW/pGPMVAZ15SdlBxq1l/Ljp1w1ZVpHhKJefQOOxTbcw/g
         CYK0baGiqLTVMCdhFzmsaOXu8DfAk4TqPS1tkOTFzkGBJHQVBq+vizqr9EpUJGcnphh0
         YEaYGN0ChOHLGF6P8zYIUmy6H5Ns8gKPWqyeMBG9dcriABVcSRwjBXtE72lU/6H+2VHo
         hrPi32QTV1/atAKqsahEGpPkzQo2L739ts4LIoSwXLwE/FbvARZS26iF+YBOh94eJ8Tn
         Ifog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783902799; x=1784507599;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0bmxuDEd3/J3xqv1cuE3jF8wxqe+yrO2LZe9w8bDHc=;
        b=X3AqtdTASay+uYtRA2nR4gV/G+2sOQkEbv2Dw3Di3TxPGsD41mHgCUyQmih92iS+tQ
         f5GtXJwdOCPD7WS3cpqVEmAfeh3HCsFBo4a+UGtJ5LnP6saqAi4P3c/vyfEPTuefPMMC
         8vzJYyftyRIyXo9aEk1rnA+HrONk4G8ln7GvgbVmXZspKKgIuTfs5mB7gd+WweH0KX2R
         JaT2sfiFY9cmuJIFWyHAK84KJHJ9+do0QT9sdSvnvDeJ4Ybneppv11kWecyMA2PtaCtP
         Yylh3GxkJUMWKiecK7DRVOiKsss7wRROVrKV9F6S53uLfI5dpx2YAhrndl+fKHDncbFE
         jxyw==
X-Forwarded-Encrypted: i=1; AHgh+RovPb238BdwE7u0nMuWdnWjenofQ2vVKdF4IsWyzGwOAzlUOL9bJ/dYiMGCPP/CTHed1pH5l+8uLuwbyZGxJyRH@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvv8VLLKmN7mtrS538u30FoADpcv6LXtkA6XH9rl437/2jwVmD
	gRBFgVw3nYoTimS6OWP6DSU6IkyBSmMV7PNLDEt0ZER9vcLNFpzQqlKEPcIXVsOe97DyDTgty+1
	EdPW2NLNtQUSgKBE03zWLfklwxPR70qT3eyG7jioj0HT6NYeRBJ6cnhFFGhrOZT+iM01NsHJQW6
	30Bw==
X-Gm-Gg: AfdE7ck6bJoFsFEh9ZmBtTvh/HIao8mKctE3L7CRqGyYr8FZjn7aa0CKu7ufJC9aSC/
	8yvti0NJ69G5OgohwPRdSbhdvQpC1fW508ehWKcUiH0VqQ6IMIs8ufe9qgIrZGN+uUARQ9DblJ7
	yF9Ti26GbZynyTLU96QL1H3FfWDtuf4ktupSnIND73zrkMUGSTgIR9VKg6I+lom+H1+3CQfAG4M
	ATW5HSf4NEDF43lXwWXoO4Ugm7DF+fcLihu/9Oto77YoAmmUNDLgpz8sErZg5/TrqeIg5tUGWSH
	wWLzSmxyg3Fsw4e1rnptFrliJDNjzU3KDD/pecM4HZnIgdB2hE0nNtYPt4toJQNkIMBHMdWnBNL
	9n5VAlQNb2XV5H985gOODTzd+FOc=
X-Received: by 2002:a17:90b:562e:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38dc761ab25mr7330244a91.6.1783902798682;
        Sun, 12 Jul 2026 17:33:18 -0700 (PDT)
X-Received: by 2002:a17:90b:562e:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38dc761ab25mr7330218a91.6.1783902798263;
        Sun, 12 Jul 2026 17:33:18 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a583a22f8sm5493983a91.15.2026.07.12.17.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:33:17 -0700 (PDT)
Date: Mon, 13 Jul 2026 01:33:11 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: rva333@protonmail.com, David Lechner <dlechner@baylibre.com>,
        Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] iio: adc: mt6323: remove unused header
Message-ID: <20260713013311.1dbea6ef@jic23-huawei>
In-Reply-To: <alQRYcO5grXoEk39@monoceros>
References: <20260712-mt6323-adc-rm-header-v1-1-d96395d1a323@protonmail.com>
	<alQRYcO5grXoEk39@monoceros>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a54324f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=IpJZQVW2AAAA:8 a=sfOm8-O8AAAA:8 a=4veh8QkxCU5BpHafbtMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=IawgGOuG5U0WyFbmm1f5:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: gunryJwjf9SQVTzH__yRvSJGm8FjGPuV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDAwNCBTYWx0ZWRfX/w+bI77fpkls
 Er58xaOhe/X4ffQcM+YXttkGhtnYAjik1ZuRJnwLU2Tuc8/O2QGxsUABCfO5c1syiHr1fagSVxn
 H8qnE+lpvOjvtEVJUvvMCkD0uH2avSrcB3BrA40pfOZ227WDehjDv9EUaDFzCkkUKZQl8Eo/aT5
 igFDh2jxqJMF/8ItUzjVte8V3GYRt2d8VTAo3PHdG9Q7GvfFmk2NGSJxJZSbT1ICUhW6pSWLhGr
 1T9WGV9c+4v/BLxLJZaSlrUMC92E2FjseVcklJCTX8izVwPZTBQKL9VWQyap4UbWIYRP5JfqPP1
 nDoZSf/YmroB5IUT3gfj2fr4CUDsCBHFvelFBWwD2ErdSJuIA8eE7enpwbIxXaQS9zIspNF12Zk
 jVCRyWuywbHpzj4Ak4r2GqlH5W+MhGdexQWG99a/CbuaW86UHoyVSiHnfiPMHK53obTWSKxmPCl
 lJiXmKEJvfe1pkJevBg==
X-Proofpoint-GUID: gunryJwjf9SQVTzH__yRvSJGm8FjGPuV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDAwNCBTYWx0ZWRfX7iKMN3XJ6AuM
 sugGP8Nm8qnupPuCUmhbuEjs6rXhQa3iDboS+gLCcMMEURPGAGrsIvCaDc5Q8OO4Ka25b2eMDQV
 uaqjVQTbxolCGolxGnI8gv66CjTrl4o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_173320_531698_85648A68 
X-CRM114-Status: GOOD (  17.88  )
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

On Mon, 13 Jul 2026 00:14:45 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:

> On Sun, Jul 12, 2026 at 09:26:36AM +0300, Roman Vivchar via B4 Relay wrot=
e:
> > From: Roman Vivchar <rva333@protonmail.com>
> >=20
> > Remove unused mod_devicetable.h header.
> >=20
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> > ---
> > A small cleanup for mt6323 auxadc driver.
> >=20
> > This patch is based on top of iio/togreg branch. =20
>=20
> The only device-id struct used in this driver is of_device_id and this
> is ensured to be available by (e.g.) <linux/platform_device.h>. So:
>=20
> Acked-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylib=
re.com>
>=20
> Thanks for supporting the effort to get rid of that header,
> Uwe
Applied to the testing branch of iio.git

Thanks,

Jonathan



