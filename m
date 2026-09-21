Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD600C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isR6N7oua6mI9Dmgnu3gC3e9cJewlveSIcCXH4NLuyY=; b=QIWCIBAo12IRe0QX4f86GG98uM
	v3gMfUdiLwSFAmJMevWZFt2ojQN9c5EyrouOXPfcdl7Sgc2DGNMotpBy3NLyACIDHGIWEz6BVo/RA
	G61eSLINcIz9JogAwC3mT9XfugnwGOTJU+8w0o7TnWzIsGS/hpamIu6sDG4+Ntq0VCDTit9pQOj4O
	hx6xwEWw0DyfFFO85584HbiaYYAttfg+fcmb//8myYTeaVopye9UuPC9ee2Bm8WW7MhgnzjRj81th
	1XbHKEcrRXx2zIWcijqK1mCwfvzIZqtcRrqIIJHchqT/cY67jpGfP7wyZJQ8mH/bdsIerR6eK7L5c
	P4Ii9ChQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8a8T-00000001Ti7-3WIw;
	Mon, 21 Sep 2026 09:16:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8a8R-00000001Thb-1iPW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 09:16:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7A4u5608070
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 09:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	isR6N7oua6mI9Dmgnu3gC3e9cJewlveSIcCXH4NLuyY=; b=fGRvcwqCJZhEzECr
	FMHMTJce9NFzwUvxWQ9gGKTW3DUJEGaQ1KF0J8jMmimCE9ZT/u/lAmXKztrw+ffc
	/lIaNgUuReSay/rwbgpEy7V/gt76GmmTMWBd10wd1HKxcCz7L5EAfrf9Py7qvNck
	Pb+fYUcZnBKC++yTEitn5OptTABxkyNDs0CVaw8mqAxJ7osuvCr6lHf+H5wL2OQw
	ko38k0RtZUDBQSwnnLEyLV0wBWSssLZdIKeMF6Ht/IQJVH8TJQHYywFLsEIG6LNE
	gj/L9EeSmpDg0iFknUlOqPj0UWZ2aB0S6j019gNx4sJqhaaQWhX+HnsXHVGHP7PA
	g0CYXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtu1ehhhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 09:16:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so418324685a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 02:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789982185; x=1790586985; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=isR6N7oua6mI9Dmgnu3gC3e9cJewlveSIcCXH4NLuyY=;
        b=G76b4TEEYN462unLUI1eekcycKRuEV3qc7VM5gBNs6MlCgrBuvLJu/zkHZn0051UgL
         sPJgGBKpH+UXFTHOIczkEuZLPEgmknDBdjCP6i70+tZErlUTez36YcnzTfHEdpkKsN+G
         AXGdAWO0w2hAGbY3VYHiABxl0AS3rj9U1Z7qe2MA1ldttebudPkOf1PfjYR+NPUmyBPs
         ebPhdQx1pDqElWTsgxHh8hLBXO6RAq4qiqp9TC93DPm1R2+Qvym+JUJ190htlhlyr+S/
         NS8DebLIL7cfjlGOBsIm/27T7FS0p3X3ihxOx4Pb/iusiPt/XZUfUhOxECRKcCwOGpok
         tIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789982185; x=1790586985;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isR6N7oua6mI9Dmgnu3gC3e9cJewlveSIcCXH4NLuyY=;
        b=casistsTstagHCQzsQXswDtgDGSAIdzssNiRtfb7vh2xI0wBZrcJm6mnhrI2wtzJoX
         IpCXufBbZs65goKvvCDmVA8xgD86Ht6VUAHKwgBeA1P86p0Ct7cHmMVKwXXDpPXIN5m1
         RAx0LAgsQryAaIcZ02SRfJR2d+LeBOQEQZ7Ewbr59ScFSLgCeZsG6m2gFRfMC4pk8VCX
         Jwx42hnJkeBL1dTt0C54f8DkfdOKYBj5buEbrgl8Bg+PFb+Lag5N2SllTBeVLYTPygh7
         2ca7UCJ2ILVJD/f93HiRSA2R/QXJDrn3YzlDJJUhw/DaAOqRGm1OW2p9xRJDJBQwpR4n
         aWOQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6H2OP1KHujTfoQG9DS8HXeAN5q2nJ0upKP3Gl2kfXV+Sbf+J2GgQ3Nnhzp2C+weXqhDIEb7iafaIz/w8Ky7Hn@lists.infradead.org
X-Gm-Message-State: AFuF++lCTKVFugkuQ5kkDrr9ScUQ1+dd1+NtKCPPv/6NcC3StTVpLVU8
	ldpzMXf4w6jQKBPXx/sv4E8jAtj0eyhUZFBgm8RpvojIP5VstX6pgh6AmnJhMm9hfD1+pAjdvLs
	kSPTd2qaAEbFgcwU/7e8lLMvDJ49idwMJ624zpYMRsuGjQ7I7phG9TSD+ckm2M9IPNoYLx9tUmG
	qZpA==
X-Gm-Gg: AYBFou3YHvDTcsBqqkWczad933ImJawY1GVcAXlFGbBLd6HunTjKNFmN0QmzOhygMaQ
	Jb/zETuGc3144BQPMGsfyP2ooMCTgXRRkyAQffVtbpBo6Tr/plRH0S5N0MkGm8E2JZSN7ojbgju
	bfEd9TsxyY6oWO2zPr/+TP/n+6FKMcTNPwWJhhlqYPmeHkjtNJ/JMKEx8OYwpB/vMw812s0giMK
	pgUC0iweZ20D4oog54Bg+jISeEK9z+TQgMJ1DpdXwmch3d/iDavjGK4TdoSQqFdrnOKzvq5e/6J
	r9tYm8faDEXtHfQDWxY56YAC5Kq+f5mqhJ5DpxPXmW6vnd1bCNIaL17j29dsu9kPVPhCBjjx8Uq
	XEhh5N5CQLHrh3n3kw0PTx0wigw==
X-Received: by 2002:a05:620a:2810:b0:939:5ba5:28c5 with SMTP id af79cd13be357-93bf5564a5fmr817539785a.17.1789982185259;
        Mon, 21 Sep 2026 02:16:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2810:b0:939:5ba5:28c5 with SMTP id af79cd13be357-93bf5564a5fmr817538385a.17.1789982184876;
        Mon, 21 Sep 2026 02:16:24 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487243cede9sm23544040f8f.0.2026.09.21.02.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:16:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Mehmet Fide <mehmet.fide@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Haibo Chen <haibo.chen@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: (subset) [PATCH v6 0/4] gpio: mmio: report the line direction on chips without direction registers
Date: Mon, 21 Sep 2026 11:16:21 +0200
Message-ID: <178998209530.39208.11869939955617063502.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915080501.329424-1-mehmet.fide@gmail.com>
References: <20260915080501.329424-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfX+tvMyc2sCYTk
 2D2XoSO/dmBs3+xshGnJRZdv3Di6T+q51GeMFOygGpZDHPGBH0ANq15Y2HfdrYQluDLAnFSnxmq
 TVMEcVhdtaK6mxGUJIgY/XXPcCgRtEo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfX/MmMU1mohfqD
 8ftzqDlp/EP5pB69E8n1zWBCnKOxAzFf64wZBIFNG0jL9LqM8BZWYn4/y5P/M3LnNLqK4Yc4QCT
 EYlk2hBaOC5xDjx7oV8abeb7ArN/vDPgsxl7ywrVDDdOssn7FpHDN7cXnxqwWGrS4AFikDvMZI+
 htAppG71lQVwbsrW+w/USLyuQP2Bpr7N9UMqV/VkQcSYXix/4pprIMkakHqMQ5/ZbY0y1bhC632
 JKU3X4zimQpmZE6JVWvQzGnWWE294Xmu1RUAoYsYKaAshMwW47ctZQWcjQN0TTIcAHZMXKvcGg5
 Q69ivS8llU70hRhIlkdV+N6cm8eMm7FH8rih5CNBwcNzqh68+WjTE7GGZeS2PYUK1V3IOQy8mNY
 GVKFaexbnz8UArg5w4JxLUENpsfaDu4PvTqDLzobGan3UJ6bULpoEPy/H8qApVrd1XBzA40eZuE
 IOCTn2tUCfgCqIv3hAQ==
X-Proofpoint-ORIG-GUID: rG1v5kAnMYqtas_CZ_QUJm2sp-qWzk9R
X-Proofpoint-GUID: rG1v5kAnMYqtas_CZ_QUJm2sp-qWzk9R
X-Authority-Analysis: v=2.4 cv=A6r5rKWG c=1 sm=1 tr=0 ts=6ab0f5ea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=anw-P6zLAAAA:8 a=EUspDBNiAAAA:8 a=niCvQgg7AacVuODDKsUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=7_zPmhNiJtJTypZd5sO0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_021627_451270_C71135C1 
X-CRM114-Status: GOOD (  13.77  )
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


On Tue, 15 Sep 2026 10:04:57 +0200, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> Hi Bartosz, Linus,
> 
> this replaces the gpiolib guard patch [1], along the lines Bartosz
> suggested there: instead of teaching gpiod_get_direction() to stay quiet
> when a chip has no get_direction(), give gpio-mmio one and let the pin
> controller tell it what the pad does.
> 
> [...]

Applied, thanks!

[3/4] gpiolib: add get_config() and gpiochip_generic_get_config()
      https://git.kernel.org/brgl/c/fc291104d01a4e42b44132925c46655d4be5ed13
[4/4] gpio: mmio: track the direction of chips without direction registers
      https://git.kernel.org/brgl/c/b5c26686305e070ecb8a4af3acbc4aa92266029e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

