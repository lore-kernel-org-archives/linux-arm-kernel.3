Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327B0CD5BC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1uKsUrjz0I8S2LEpuKUc7mm7jWBeKvWru2gsBEv3SYY=; b=trZwDWbRUwARYVYlF5qcEodXCG
	XvIFJlzjGUh97O5agF1g3hgs1+9Hx67tpD8atkrWv34B7op5kbaxKJXY/El3P6QtGDI6v4d8vMzby
	RFCR8m4Wp/FHB1Dsq0kTZEhSOjUJ7tzZ21qzx8WU6uUC4p9dJ8YkF1sm2s84mDnAXbLWzy8nlr/RM
	6gtUyikW7CqVs70EHfija0WIrhQEIq5PRxHIuQWwqdBKc24uydIUTTxHityzKZe6rAFHPqBdiKWEq
	J+BhLRivxacE6sr1MSqA7m7yozlUnPUNgzJkzH4KC4VXVbX7gQtKms6GspQN5/j79MxFOjRjcsVJS
	B3go5y8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQPk-0000000Gbps-3tVh;
	Mon, 25 May 2026 08:11:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQPh-0000000GbpY-2G77
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 08:11:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P1xikk2002726
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 08:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1uKsUrjz0I8S2LEpuKUc7mm7
	jWBeKvWru2gsBEv3SYY=; b=FEI1zkhjDA8FW4jKZwKvB+LivL0t60Q+2nRdGhcW
	aXF8pHiSvN2eFJ9FTbEXYZASBrVg9Mp/+oHKYPgIVtdOywiRLXVPN9VORFqnXr7V
	WPYkRutPVpqepKSQf4p/hleSfV4btVb6ANHXgifsvUnPUi1G/WfVpUE9q6nm3pV/
	PJ7WoEfnXmGI5f3ACP5TtixE84xIqnsVXPPk/gl2eLUXlhmQzPnIw3RITXFtM3lK
	AUd6gyHLuYUlrr37dsXbQkhDNHsLAx3ZStAEA15Ah3wKG+ynWXx6vrer6FBINanD
	ioMhZ7kSv+4M0QC/ZXrZiThRGmPNHOMinoGVhUZIekof7g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmp3h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 08:11:52 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6313c9d983fso4609053137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 01:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779696712; x=1780301512; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1uKsUrjz0I8S2LEpuKUc7mm7jWBeKvWru2gsBEv3SYY=;
        b=MnT0WJtzC5P8Jv7WMq6j40jPbc8XNMEEy4kouohK9ABCzbos+3U57yIhOtrLNMVt/p
         ecsQSlotBFVONnUhQoP3zvbb3lGkbbWvGiy6LrS3kaj/Ey/r6CwEqAmTQuoR533Hmfy3
         Z6Ym/+6dP3kER47TkbTLt2dS5r4Q8GS/W3KGzmpd3vgaSxInhtRgMN3zAUfyQUn0rZTo
         lCKkQTaQ1TQ8zWCuT3Osz/su1d8bXVQEGK9pPNlcC2BZ89SonpwLdJ35Oxfedar4pZf6
         5nVprPIWWAbZXRaIWxN6pz7rY7P4krUxl9xA47nNHTFzXHSpFRvH2zqdnN72TlBWOJTI
         Cj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779696712; x=1780301512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uKsUrjz0I8S2LEpuKUc7mm7jWBeKvWru2gsBEv3SYY=;
        b=fQOFXgUL7jiKjIkiczaQxEwbrYScs0gAaBjf9KH6N7gexkJf/WJc3aBD43uQifNUD/
         Ur2L+n6UE6MoW5LreEwCnZApgUQym9XPasquP6R8Djx7q75e9LeTZk7ivHhp46u2wQL6
         y7yclx7QqHIy/P1tdyxDd/3UrGT/ENFHt0Y3PbKST85n2sMqki4l6J5VM0SihFAEDR03
         Wt2nWbViUDJOxrIm2i/k3s4YWoY4F3GDN6iAeIT8C8/wh7TXotG3gqYCIUKdTvCNfI27
         OSi/qtJVS+R1ljtN15ybtysQqsWRTCuzqEBvnwr8Q+qXRLlejiyWrKQTOQzY1oj2rJzq
         PapQ==
X-Forwarded-Encrypted: i=1; AFNElJ8cARy+uWht/9hF1nr6Yvheb7+PVN380nfupi6tJPP3e49wSR2RLFMaRxqHLDhvOoAeQLfDnZlH51ViGrEXs4Sk@lists.infradead.org
X-Gm-Message-State: AOJu0YyGGaV0I+urATnHrh/v7qWMoUM3ofQa1jUD69olBq4YlA3pueiX
	LlhGZgLQOVDp1LeC7UK7K3PRybdo5RZZ9RYgGq8hkXBozSoIJSRdgG0E5QtHLo755SZrmz3G5Vi
	Ofo1VtZw/uI/CWpWlVn2YbzXjea+g7CUKR1SESjNnZ42Hfsg6Ok0Q287bQ2b36LYx+jEbdcPyzL
	wlTw==
X-Gm-Gg: Acq92OEYEKtxBl4TDaHBzRWQwnU08K61YUuTkINun/KX8SpJgEl0fcAWvqc0ZviAKOU
	JACE+e2tFAW+FoWfdLek5CeSOGAdixAqkCkwBo6p0P41vE/RqCPLetQvs8QZKa8julc5DP03VGV
	ZjiORiGth/COT8KEIdEtoY2DvFAzCgIuDIhaOYGKwleUHgt0p+lQxIEhdTeyruRp86UPYKTcmA+
	1izQUHwdSRh5YEJVoySb+aY6f3nmUHP5Nwq9o67ZHmsQ9DEuYuKf9YsN+OBtNB3mDdFFhc0FDue
	OXENMg1oBYgCQRiycpGLySYz/zxx9YYzJ2rBoWioGUyvnvji9ykDkSLxwSxHV4fxvC2L9CyFOI6
	Qd07R+yUKkBLSwKOenY5XmLKPU0dN/k3RjEKOiwJyMkEJhV2VVFDw98QR9IwlRVFKxQTqSqNqqC
	mf8QaakGV7JIDRBS0yRDI+sZmSY8HOQGysg3g=
X-Received: by 2002:a05:6102:3f9f:b0:631:ab8b:c34e with SMTP id ada2fe7eead31-67c7300bc83mr5975213137.11.1779696711899;
        Mon, 25 May 2026 01:11:51 -0700 (PDT)
X-Received: by 2002:a05:6102:3f9f:b0:631:ab8b:c34e with SMTP id ada2fe7eead31-67c7300bc83mr5975193137.11.1779696711479;
        Mon, 25 May 2026 01:11:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cb3689sm2529041e87.5.2026.05.25.01.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:11:50 -0700 (PDT)
Date: Mon, 25 May 2026 11:11:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] crypto: Delete Qualcomm crypto engine driver
Message-ID: <rb35vwvusd733s2zbgsitof3cpoyyfope4cpeh47xldw27ufix@7fm6bgr4wtkz>
References: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
 <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
 <7rgfuvv3hai7g4wt4accbkejtzdt5dnb6mkj6x7ox5sz35q4n2@h7j6rr7extuj>
 <66317f6a-645e-432b-ae11-8f40569d4117@gmail.com>
 <d97382a6-6c5d-4a3f-89cc-3ae9b432de3f@kernel.org>
 <20260524204537.GB110177@quark>
 <e36172c6-4424-4b77-9b3c-47dcdbdff05b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e36172c6-4424-4b77-9b3c-47dcdbdff05b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4MiBTYWx0ZWRfX8jve9r4gdlW4
 kSEQaReRRZ5iOoBzsOz0Ylvpt1umM4D1QpgWzd89F1e9w7hseKwzP2sTblu7ze+Vmf2AJs5nJyq
 +MTvYNjx8hbwPBWFa4uACEmpxvFjJNTQNFiIaialXpv6XH2Tmu3Z62us9vZFsX0bOGrmPagSJDT
 URE4yTtbtp+fUUG6LlK4r79BBDHipGraB+kSTqkK1WhJTlm1G0aQvcr5+WcAbyfb3bfAyRopyuh
 81GhDWkdNI/VRKtWKpM7sVdkOrDavQXu/BJBkzno29Kgr0+GwDDg2F0z1E4VMIMCqawXfDLLg8u
 9+0CFt84Rp+6V3OZ99KLRjtI4pGUti5RX/Is5VZJe5cSvLGGDLM0GDwrM6Xce+rmvEXvH6wJ0of
 +rcaX9v5BGAXpE+DpaOTKTflwO8IRe29TmcyyEmbWk0mH2dzzyXyKO50b+AqnLyZAPKKriPR974
 IXM5bR1wEF4nq73gLCQ==
X-Proofpoint-ORIG-GUID: 79UI09pweFnXRx21_ZP6x4XXsZHCJIc-
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a140448 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hz7RXHJ8Q2vzIh2DF4cA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 79UI09pweFnXRx21_ZP6x4XXsZHCJIc-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_011153_696144_C0A29173 
X-CRM114-Status: GOOD (  28.47  )
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

On Mon, May 25, 2026 at 11:59:33AM +0530, Kuldeep Singh wrote:
> > This driver is more than an order of magnitude slower than the CPU for
> > both encryption and hashing.  See:
> > 
> >     https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kernel.org/
> >     https://lore.kernel.org/r/20250615031807.GA81869@sol/
> > 
> > There are many examples of it having bugs as well, for example see the
> > second link above.
> > 
> > That's why it had to be disabled via the cra_priority system.  This
> > driver was actively making Linux worse.
> > 
> > This isn't particularly unique to drivers/crypto/, of course.  This one
> > we just have data on, so it's a bit clearer.
> > 
> > I've yet to see any real reason to keep this driver.
> 
> https://lore.kernel.org/all/c1697372-54ec-4f57-85d9-ad375ff1a44d@oss.qualcomm.com/
> Kindly check my latest reply to the thread. There are numerous usecases
> like DRM(Digital rights management) coming up and qce driver is required
> for secure content.
> 
> > Crypto drivers need to be held to a higher standard than other device
> > drivers, as well.  The onus is on those who want to keep a particular
> > crypto driver to prove that it's worth keeping. 
> Sure, I'll be working on stabilizing self_tests infra for qce.
> Kindly allow sometime to go over failures in crypto selftest and will
> submit fix if applicable.

Why are not selftests a part of your default config? How are you testing
the driver?

> So far, i am observing 2 ciphers failing(xts-aes-qce and ctr-aes-qce )
> with CONFIG_CRYPTO_SELFTESTS enabled.

Please make sure to run the tests on older platforms too, not just the
latest & greatest.

> 
> https://lore.kernel.org/r/20250615031807.GA81869@sol/
> May I know how to issue reproduce steps because I didn't observe
> crypto/ahash.c failure with CONFIG_CRYPTO_SELFTESTS?

-- 
With best wishes
Dmitry

