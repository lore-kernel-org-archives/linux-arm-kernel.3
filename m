Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30A9C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QoU2sou/2NEY59DVI3hWXvNKjx2hz4p0U4PpxsOoZ3U=; b=JGzW3R1RTrj+k1hOtIviZ0WSSf
	fz5X+aMT2SxOGQ3J1J63jhN2bggTRuolLRBRg22rpzbd97AiYSHW25CC3wcLr9taF/p/Iy2lsIEW3
	KEFB93ZA6NN+OHMn4vH2g2jSYdzKBGmzlTYH7uuO0ofLUr1eGhC+7dCE0/elwJvLbEoTZlieqOSAd
	wvq0fpVAtrGbjArpC1sKcyeJ+gpFePPl3Oyv4s42Fjao0skNeZNQjToYgSDEckgVFh4diBjfmVoTI
	nI59+i3Sirm8ofHvOhaqkcoPKI+nhcocDik4QvYGn7ViYLC32eXp1m21RCZlFrocQsRI9M57QYIt6
	sjxrYgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q4D-00000008uUI-3zL2;
	Wed, 23 Sep 2026 16:43:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q3w-00000008uSK-1OUq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:43:20 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTZFU740268
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 16:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QoU2sou/2NEY59DVI3hWXvNKjx2hz4p0U4PpxsOoZ3U=; b=hA3I+ydrYlOFql4X
	JxWFom9ApvGFxIhW4iJAVmHcOlr4cRb3xmzkr+vaEQCjobOzbQgcXZIJw5QXx6mA
	HRgAb8OtcT9QYxPnXB/uSwR5OYu+A90dBDS4mxKJe5utoT0RLlSQK+2zTV2NPzKH
	7yhsmARmBg8enrgp25pv444D9bfSod249/l04RP7LOyFpv5leqIqnDign7vVxOIH
	GBPFdJ4bCbOnKPh9FTNSFNHNUQb6cbePrxD+69dggHrzrKIxMH/5voHOvWOcJlYF
	uO9EbOPPdi8bwl/t/Tqz9m13OePvNio0dtFsXosSlWU/0JfzW8kurZFj+jXCuggC
	ue/a6g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsgy0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 16:43:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3dad7ab3so1039649a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790181795; x=1790786595; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QoU2sou/2NEY59DVI3hWXvNKjx2hz4p0U4PpxsOoZ3U=;
        b=CKvqFb9ZE+RUIpv51AFfPgLtCeccKFzc3ae3KDBkmhixDRSDepKM98zZygzpTaUHeY
         015lcDwow317QwLgBQy2V9DcKer+MZhMV3SmgfGPMSm1npKoJZ5YcSqB8mDEwPqZ+0f2
         yxArzSKI9WnJ+mhO0xrHxQkIhJTJOQACT5tZp5GgGmYEAYmVs/9xSXK7EMJ0rz1sQ6ho
         1n5kH/8qnaqV+nBHIKNUdOrjbzFtTyfpGket2LcEbveu3ToBeNqVwmIsPMYAGnUF1DeY
         TwlvGaRvqjF/17vKUQfPxfcOmixJl6Auol7kduC9fYDhT1gnTt942NePa6oiZLd5WFOQ
         0s4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181795; x=1790786595;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QoU2sou/2NEY59DVI3hWXvNKjx2hz4p0U4PpxsOoZ3U=;
        b=r29tbUzti47klF1zlPeclYBcMelvb+MHWBuEsOMmzz/44XZ17SpYPIloUBonCbs4wZ
         p5t+zyV8NoyPk/EA1XBgt2//QORWZXmQfzvfImoQXHLF3Bs2t/WW0P9/Zk7jmnNML8VD
         HB0Dtb0sJ6gJdpx7GG8Us+PZl/xmnwPfHyKs5qHTp3RPvU9nokMVB+PHsRhbknPtjtyd
         mz8TiHaUfhanvQTN5THVoeJRG1GTol/kXmHJ4fC+94e7taoCD7CyW7LawqWqlmE+0Lu8
         6n2jHnutPpQQxg3L6HHnZidJ778eBtZwvsdNIZ/cb5o19/TOT4bcL3KVOMDxhRpEoNyO
         8WXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiF08hS+XuWlPxRBOyqLTNMwi3ELMEN32sYO16YIPo8OlRZXReb8NUMamumENu4FcmZj9rYqJOt+MFq1Qajg3G@lists.infradead.org
X-Gm-Message-State: AFuF++miFhNV07jn6BLqBxpsxV1mEUcrNGbyNYIImhNDk8JiTX5CB6Cb
	oNU2Ci08x2qaiYk5ekr3lGJm0NTJHW2pmcAMOyHPaWk/vI4ET9mCsasZCk/6m6PiMLehFSAgehH
	nYE640EdaOegBcUf0vKCA2VYoEFi2//7Qm+zPWF5kDPyHzn0jmJoavRFuf6q2yN0rxmTwy+S5HW
	yd+g==
X-Gm-Gg: AYBFou3Jydv99kdViyIwyypQg7XXliPRpmYGWsvT6s/wyEqld/gfNG+0y6NBFJp/tBF
	672kiyAfgNUePicf/eQidKS+iK6gUdnJQipqfMGSeg5XxF6tbnQ8DMt6ogSIrfRhf2LCaZgbluE
	uFLLTFRyu0tG+sy3v3W9paWmt6oIsAPteE1e9jp571DA+m4p7ZPNQipPB+dfjKNksvmVs5V3Ems
	aGfr/Xrti8EODbHRPqokhSah1WoZUJJxpEG9rQhd1VzyW3CUz9yr+T72YwzFyhQYPGH7G4HPVmw
	Q5Xk3hZY0MazyYCgWJ71Ok1/hQHuA4NzoMipIUYlTWzm5PSj8pPa+B9KT2U7TzR8a75Kcq+GHTd
	6p+STc7N1TwaGjH39CoCkqoiPMs7X7e0FJygBAnm6vdAQZQFSFv0QYA==
X-Received: by 2002:a17:90b:3c11:b0:3a0:7d5b:8d55 with SMTP id 98e67ed59e1d1-3a07e4e41acmr2957145a91.8.1790181794884;
        Wed, 23 Sep 2026 09:43:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3c11:b0:3a0:7d5b:8d55 with SMTP id 98e67ed59e1d1-3a07e4e41acmr2957115a91.8.1790181794393;
        Wed, 23 Sep 2026 09:43:14 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a082a0edaesm2135555a91.1.2026.09.23.09.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:43:14 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:43:10 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-coco@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton
 <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo
 Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
        Steven
 Price <steven.price@arm.com>,
        Suzuki K Poulose <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Sudeep Holla
 <sudeep.holla@kernel.org>
Subject: Re: [PATCH v11 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260923094310.00001d5a@oss.qualcomm.com>
In-Reply-To: <20260915114601.GQ3968357@nvidia.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-2-aneesh.kumar@kernel.org>
	<20260914133249.00007d35@oss.qualcomm.com>
	<20260914222836.GO3968357@nvidia.com>
	<yq5ao6dy27jt.fsf@kernel.org>
	<20260915114601.GQ3968357@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX9Mx5blA4N2+X
 MnarVQPrgOGCFTrCJtGxFCYJHDMvOyLynJP4A5go1ufz344tfg321OUb+3G8mkaxbV4JiopDUoz
 IoZ4bP1TA7x1BUgQTSwF+ZJj1ZcQWR9B+XDa9QgSCN9q5i/f+bLWEMGsrRDsq8CYTjj75zzBeIT
 +0HvSeNgzCNhUlsT+dWzWmaxcCkPlPhjyCX6hdGSlbEYnd6FTITyG0NzITMo987nKIPNfcEWJ+V
 bNwiSISZdHWq/8o0afEo8BvdKdFBVw0+LFC0ITJEyubbF29wsJZ/DCO37FWV7Bs3iCVGCq+4i7I
 wL2qVwhgC2gy27w3oakpRBdt178HQm7NWtSUl8i/3Rg7ZwsWkMNJB6UPczQk59v4MqcZne4H/n9
 ed8TXGaF439XxUxhAejECV9dn+yJuXEx9+kw1rnzs6EnnaqQnu9K/XkXEOCg1crpUr06F46lls7
 wxYW93D4LgSb85dLVVA==
X-Proofpoint-GUID: UFoWv39gPbmnzyXiI0lR8NRDHx3gVGjf
X-Proofpoint-ORIG-GUID: UFoWv39gPbmnzyXiI0lR8NRDHx3gVGjf
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab401a3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Ikd4Dj_1AAAA:8 a=xhGKRIyCQN_Pw0lyfhkA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX46cgxNE2p/s3
 rf32fYcpUVqGxIYDMZWciRDr1DIKWyDuTeF5473eT7vpZ7ZsWa416EQQUwKWDk8pYPiK6kHMEY/
 n0N7oY7erNEvgTxG22YiE+Zd1rjOSW8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_094316_405361_BD7581EF 
X-CRM114-Status: GOOD (  20.48  )
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

On Tue, 15 Sep 2026 08:46:01 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Sep 15, 2026 at 02:52:14PM +0530, Aneesh Kumar K.V wrote:
> 
> > > Yes, but as written it is OK, and this is a common pattern in the
> > > kernel. I agree it is fragile tricky..
> > >
> > > Still it isn't an urgent reason to change it around, but the best
> > > pattern is to put the allocate, dev.release=, and device_initialize()
> > > in one 'alloc' function. Then the other function calls it and always
> > > unwinds with put_device. Use device_add().
> > >
> > > This avoids mixing the different kfree/put_device error unwind regimes
> > > into the same function..
> > >  
> > 
> > Something like  
> 
> Yeah, this is the safest way I know to use these interfaces
> 
Agreed.

> Jason


