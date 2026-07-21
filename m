Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786FDC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOpXARkKmNj6Eb4RGQZtpa8uRlFLKJu52rmjCAOrvGE=; b=bFcgOdZfZmwt69NFcIUHL//xlq
	K2UrqebJnAJmPMF+tcVsuob+4SeTZKfEUJjiT+BxMLQuozO5xKt3rPHCF8j3Wf6Qz/yo0Zg9MhzUO
	cF8RYti8MztMZ/zejtnZEg43rAx5VbCDRN+sFJvXjLRUMWe7AvpLFjAHdequNbKL4/suwc1bfmboU
	CdjM/RufmL1nc1igvmV4WzIR4Sj2PVqdMWO8C+o7RhTn4ACmAfb/sF9YTX3nkG0zLfjUlrnDS3Sx3
	2UDeExikZj5e+V0a4NSlrq1XHf4R90FJHxUjtvqtuQjx8Zmu9/95ucjo9TrQegk+fCxPEpYFCEprw
	uE71YWcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5mt-00000008oWn-2yU2;
	Tue, 21 Jul 2026 08:25:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5mr-00000008oW0-2KxF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:25:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L4Shol526991
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZOpXARkKmNj
	6Eb4RGQZtpa8uRlFLKJu52rmjCAOrvGE=; b=gCrU7rNESdBaziZfASg/j/KEnMQ
	sdlPBSIT5NYy8W/vsKm1PIHRQOoaN1kZx+0mOp3sFJgxqa9gnVQ0+LjRX/x8uzcN
	C4ZwgcgIDNI1+mIUyfLz+6J/yhejv6Elal4j7p/vmpumcaIPWtLNfXMI+Vm7QjOd
	4DeNvwp5dVK98Axqbt91dTcWJcT3r/slntjW+4llujsAcm4OQphLHGyvD7/T13Gp
	EDs4bp8O4wcyswzyNF7j7ifD03hESYOfCokjbvfLYXdz4w9+sD7iVhu4HBkqmVOW
	vXI6NoEScJ2l4LZPJBUggIzVUavw7yWejaIGwva49mQJ6bKPhHA455WGdRQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se0vvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:25:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a9764f0so223290421cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 01:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622312; x=1785227112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOpXARkKmNj6Eb4RGQZtpa8uRlFLKJu52rmjCAOrvGE=;
        b=X7Gt5CrUcCLN1Y8mXAeLf+MLAgjU7z4Kp2ts6TaaK9mmXZTFi2fRXPpB7nSgzSHKEH
         KwvOGObN6GIw8vTyCQ3ZI1HDA3n42t1wIMFgKl4/8oZ9Q0b81nPIm64ct2s+cU8DiXMv
         l/xGtZWZhXb7mZLggS7iS987HuPHBo38U4XQzhGNb/BZwjBSQFC9BgdjJuDRiS1nWyq5
         dJWjLhXtDmzi+aeOowqEMbN5rGZJEmJEaHOI2w4pnrdvJTcTxbxXn+WDbzBhLc4MXNqi
         CpD7GnGtJJnO60L4ISSC3Y1pJi+RIL04qteeVFG3YPLhQZ5stOSyeo7dKjI+CdCyG8Tw
         id9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622312; x=1785227112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZOpXARkKmNj6Eb4RGQZtpa8uRlFLKJu52rmjCAOrvGE=;
        b=JuxfdvwQQ1y1wjftXF8V8OK8s0F6e/gbG8xVjNEeiCV76luORTS90UQv4aB/gSf5iY
         1l+bENcg7JpRXMUFSl1BnxsYxyI/lfUpQ9JzsCaMvlVYntxv8DU+ks2DwH+KXhv29urM
         XEyznheOMBdiAvxB3GnQjSHfT9CdKVsWzoBYm7iqm5uqP6p5lFoQsbzDjkefxthEio+m
         NwAxLO4exY9l+3OXFd+sUslpDSa7pjmjza8j7n81s5NRSZ97hNRbZBjOTlIvJhEzboSi
         qJBTjE6wjM+/8ooIXaQ2Ofep6VP8X1S2NuskC9Z52T9oz+RisNoY99ACKVmZrlONiUFl
         alFQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWMmhiqQ/f06gm7Ei/kJo65S0tDt4irouHrk7zfaS/p9DOzCjQxktIZv+HCcgPvEa+UqAPRtPoUedQ8kpNVW6E@lists.infradead.org
X-Gm-Message-State: AOJu0YxskvNOrCDojXA9NEctphJZ+KdWvOXWa0uiJKyKFjgqhW/AUab0
	lsA5+SYSV8I82PYpNQltd5ZRkZ96r6BBzkAQK7ZoZz5W5TKWiv9gpyRcg5jxoI7TKVCrjasWc6T
	MWcB7KodKWm6Cg/KCKBX18BQ9Z12vf/wSf+vc6rn3tebyry0jVf9JyY6wjZybz+7tkyUBTec2t1
	KbVA==
X-Gm-Gg: AfdE7cneJXB0qjJYhf+/wqth2DieZWaxG7CGTsADixPcMQP1Q9WdyumAqziF6IbZ1gX
	6QxcFEpU2nK+vOSPLu+aVt1pFj4TGi0uwOJk93YEBRjiui7spnpwmWiJtMRStRs0iHOlZgH59Gz
	pJ2xMKDttMCM44X6Ni2shzHkesls6BRpsJPFOVkL++oHe73SL3j+tQQuLSftdWbqyGmO6yLynZF
	57xC8hG1+OlPZSWYYS4rpZRACLE670JQye66uHkl7sJsQU+fEPii82MN7p//LMpYDCpV6RnRycl
	wRVMGzYrOcMpWgyG6n1b6iisSvKKDyq9754C3leFdA9um57MBqqQ8aluZGYdwE7gbGVSSuXwqi/
	V0pkl9QsqOhhLjtKUQkcIgyEYBcvV
X-Received: by 2002:ac8:5d13:0:b0:51c:bb79:a52d with SMTP id d75a77b69052e-5213aa6d813mr166970921cf.14.1784622311642;
        Tue, 21 Jul 2026 01:25:11 -0700 (PDT)
X-Received: by 2002:ac8:5d13:0:b0:51c:bb79:a52d with SMTP id d75a77b69052e-5213aa6d813mr166970631cf.14.1784622310894;
        Tue, 21 Jul 2026 01:25:10 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm39901054f8f.21.2026.07.21.01.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:25:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        demiobenour@gmail.com, Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org, brgl@kernel.org
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
Date: Tue, 21 Jul 2026 10:24:58 +0200
Message-ID: <20260721082501.6128-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <alnlaCXmoLRAlr96@gondor.apana.org.au>
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com> <alnlaCXmoLRAlr96@gondor.apana.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: T_qbCQUgKl1Az1Q1LtooDkw41lnHkY1o
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f2ce8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=SHEdVmtcqMJQtNp9YQoA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX+f0Em3B2DKvX
 V+TL2XVy30tboTbXMoZBMwvwqPsitGkQaDj5OYxnbzNmx9Np+dlMDwPw8twKHRkbllcrEtwJQDp
 y3/psbA6FleKlWn5Cq2QSWaNuy843M8=
X-Proofpoint-GUID: T_qbCQUgKl1Az1Q1LtooDkw41lnHkY1o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX78C6RCHzKps7
 0e2TmNIi2ApvKgQeuOHAPp0lEA+0Yhh44ygxgAYEV4XA8ZnSEsBXwLMec2VcrphsnHTrNTzQk5n
 Pj6SLPKXd6LoajtapBxY1bIS5r+rW+HuD8wwcB7xQjmIlJXQ/kgsB3tnNCiE1VSFk37XadNlGvp
 tlbv/kZmbOujs2S8J3TQ5nkq3jTJdzrWnZFTwYq9Xml5c7i0iH7SsKs8hAoSTQ04Tl4bU1touFt
 5gbujKQ+zX4ncrixh1z4QV8UMSaE3PNjCtv1iX95bwqmNypkmkj3a0YknOf0N58C/Go4g6DRTZQ
 NoKQ9nP6SyO4Dp2EYT3Ib42gvqUX9WvgqRD8X8P28U0zamJbqE3af+fofZ86tX4cRnGkiZY1ude
 szyiJV8xN+1QKsZX5tI3xQPMKK62dsU8vJtv+ycWQw2eie2hnOTHgUUaN6mjhiJOSAXu/zWquAK
 3Qib6IkkzlLOZjWO+9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_012513_715643_1F28EDCB 
X-CRM114-Status: GOOD (  29.20  )
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

On Fri, Jul 17, 2026 at 06:18:48PM +1000, Herbert Xu wrote:
> On Sun, Jul 12, 2026 at 05:31:31PM -0400, Demi Marie Obenour via B4 Relay wrote:
> > From: Demi Marie Obenour <demiobenour@gmail.com>
> >
> > This driver is harmful:
> >
> > - It is much slower than the CPU [1] [2].
> > - It Has a history of bugs [2] [3].
> > - It does not have exclusive access to the hardware [4], causing races
> >   with the secure world.
> > - It register its implementations with too low a cra_priority for them
> >   to be actually used [5].
> >
> > Therefore, disable it to ensure that nobody builds it into kernels they
> > intend to ship.
> >
> > In the future, the driver will be used for processing restricted media
> > content.  However, the kernel does not currently support this.  Since
> > the driver will have future uses, allow building it if COMPILE_TEST is
> > enabled.
> >
> > [1]: https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kernel.org/
> > [2]: https://lore.kernel.org/r/20250615031807.GA81869@sol/
> > [3]: https://lore.kernel.org/r/20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com/
> > [4]: https://lore.kernel.org/r/20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com/
> > [5]: https://lore.kernel.org/r/20260524204537.GB110177@quark/
> >
> > Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")
> > Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
> > ---
> > Changes in v2:
> > - Add Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")
> > - Add Cc: stable@vger.kernel.org
> > - Link to v1: https://lore.kernel.org/r/20260712-qce-broken-v1-1-85e2bff17871@gmail.com
> > ---
> >  arch/arm/configs/multi_v7_defconfig | 1 -
> >  arch/arm64/configs/defconfig        | 1 -
> >  drivers/crypto/Kconfig              | 6 +++++-
> >  3 files changed, 5 insertions(+), 3 deletions(-)
>
> Patch applied.  Thanks.

Hi Herbert,

I'd like to ask you to back this patch out. Admittedly I should have NAKed this
under the v1 thread but I thought the discussion we had under the Shikra series
and the subsequent patch making myself the maintainer of this driver (note: Demi
did not Cc me on this nor the Qcom mailing list at linux-arm-msm) as well as the
pending series[1] fixing the QCE issues was enough to imply we should not mark
it as broken. Please consider applying [1] if the fixes in v6 are correct.

Bartosz

[1] https://lore.kernel.org/all/20260717-qce-fix-self-tests-v6-0-455775fe5f6c@oss.qualcomm.com/

