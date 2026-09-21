Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBD1C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 22:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEnrmQFNO2k7A12pfE7wpLl5Xljl8coTbLHitjukYz0=; b=gOk4aFxvm+gyat0JRHHf4MPDmW
	AamzGi4aLUW+aOUjzRIWTm9lUJoNU3cT7IqDCFXvMwZ+l7XtrHOxa3PMtBqDBOLtE40uisDRv8jVB
	uuLIarstbFppyYi7TtggxloWkEnFQOAt+Ta8NGSk4ZrFCKbIVvs5ErmrBvbbPnQ7SApgrD+SaUbaP
	1gvdvKChkGnbAeslXCt1NIvwf/W3QLSyqQ9lKPSjqH5pGM0N8nHS2mNRTWV7hX4800j+LMzgsTcY8
	iUU5OLhXsamSGoGbCPbJ/T0wtEpIo8UcZjE+VASQBkZN72GxARFwVZnatwnRSUdUFlpKzovnvxTpN
	bUAj5xeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8mR3-00000003YXz-0S3z;
	Mon, 21 Sep 2026 22:24:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8mR1-00000003YXW-21yp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 22:24:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKfi2q1751663
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 22:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OEnrmQFNO2k7A12pfE7wpLl5Xljl8coTbLHitjukYz0=; b=K/xcSmpxtl9n8TQh
	Rl2usZ/nN/0vFKrk61FkqDv7ONpqFyqom8ZcGVkPRjrL0OFfL0C3xBzoKNlMeSju
	p2rPHj5hIFHZ0R+/0o/rdT7wJ8GIDprx6he44zqzcbO7MN7BYv6oL5JBiWP71nMU
	vmyW/mc54wDCjf1I6H/dY9KkgfxJhBNFX/ncUkJjYX1V9x0p0U3geOfYM3zQtNZ8
	x7gIubUZDaDDAgIwapP8NCLD7473rhRERVaIOA1+PKEIXzZLNq9ed9ETlqI9C3Oa
	KemlSJoFwzwV0k3vcka/9TMuIiQV0DsA6R02Jahhcc08rTr7YFQRLIoIVmitvQJv
	WUXR8g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xes2ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 22:24:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deda201bcso4640461a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 15:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790029466; x=1790634266; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OEnrmQFNO2k7A12pfE7wpLl5Xljl8coTbLHitjukYz0=;
        b=f0aRX/wSmOF/rlmTJ0V7ERm94UFbKJqnVCpUATPAmL3sWndZ3pN7UBtrQUp6whqp9S
         jsmQdIdWhCifnWQrIrUlsj05862HpZQ0Ab0+kERSeBKVpnRdVi1lzcYyc2FM7+kC3TQF
         GBcpSawitUfpeNHd9I29pDJZu5tsGqJBBTFNJJhF1aM56o8BbwLxL4lbJVpzQmhiqz20
         y4izhbDNebnM6NtmIVPCEx8evMu508VKXi/6UaBG+ZMR8kCBC3Q7V2Sqdder4wiwGtj0
         DOAxMg/XVB521vWcJhgX4HFjGfRzfUGT6dQGAKi7xErhCUo1wtJkC+2dp457TG6nxYsg
         7QUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029466; x=1790634266;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OEnrmQFNO2k7A12pfE7wpLl5Xljl8coTbLHitjukYz0=;
        b=Xg1MldaPacNxCDrNhM62E0uzVbjKOXokK6nfAQsikZ+Ut3j9DCGJ1Q9m/vKa3ZTlCM
         o8oHUIhP7Cd5XO7vGfAkhKXN4dmiHCcfL2rsZJ8P4bYd3JmrK5OdVW9kaMslkv69DzYB
         DzoIyEiK2oXaj8ScHXqZcSSfZQGYYlwFst7fRL1dfhkfhZ3YTgO+avHqmZslkI92P5M3
         5gdW3hMchd21sdPrka2deGhGTPg9LKLGchwSilWLgEydJ6UGCO1AG5NngI186RzPCmYN
         Pmj1kJcg4VEla5BOqH1iKZhoo+pQKBTwJLcePC+03LEYnVZpn1IYoY11XKylqjZSAI/K
         hDDw==
X-Forwarded-Encrypted: i=1; AKwUvBzBSlqf9pGI6xB+/NlwEgJKgVgPUpt+7C9/KRBC9QG5ORCQcCfo4wU6uVZbQxFF05YlYc8j/+yv6VrJ0iQ2wXz8@lists.infradead.org
X-Gm-Message-State: AFuF++nVjoM8JQbiZ4FjZWAqdPrlstOmaTaSyj6a86y9oRJLVlMXdOME
	HNSCVlnCArsyTKm0u50elCDB2qwCnYDjDf3PeSEwy8shDqrKXASjEUnZ7OlfKrdkI1WtsRljOGW
	mquobwiSutVx6JFJvJSK1QA0r+sT23MCU7L0kxnDWVtgp/w4158Z1FxCFguDOypRF5M6Zq1LN14
	f07MN2H6C/3w==
X-Gm-Gg: AYBFou0ujU8njkeqrs4UHsSjSxF2O0NXVl8G5Y/tJIJ8ZNuTe4GhGRKgOzTcwz6dLNX
	bcJe9jqdMFgSa0lDPa1tlOK114FbH5SRvkfVwpLitVtYjLVSXtLxzh1vC2XVheQPO/q0Ufr4F/C
	2VsjDSIFgeNyQYccKksN52zZSfRHdG0kDMVvMGWinjACf75qnYrmTzm9ARs6HYI9zcWvThhPq2s
	hHMDqDhQoXxcq+ikli/ScK2LVVnagHuIjIGbo12aGabXUmVHpuHB9zz/lRC+QopflgqYCRboUSG
	jJShkbAcUn2smcpLGr/bVeaQlDQPMxUFM0ch1cNAFIUbBHA+Dp69ImokhiqsA6xGrF8XzwPyz/j
	Ofasf6vwLtOXyuDMi8WTyoJ6Edg==
X-Received: by 2002:a17:90b:4b85:b0:3a0:42a9:9c73 with SMTP id 98e67ed59e1d1-3a042a99fd2mr5462359a91.38.1790029465927;
        Mon, 21 Sep 2026 15:24:25 -0700 (PDT)
X-Received: by 2002:a17:90b:4b85:b0:3a0:42a9:9c73 with SMTP id 98e67ed59e1d1-3a042a99fd2mr5462337a91.38.1790029465452;
        Mon, 21 Sep 2026 15:24:25 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e613014aasm34921eec.22.2026.09.21.15.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 15:24:25 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:24:22 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon
 <will@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Suzuki K Poulose
 <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@ram.com>
Subject: Re: [PATCH v12 4/7] arm64: realm: Move Realm memory encryption ops
 to RSI code
Message-ID: <20260921152422.00006d80@oss.qualcomm.com>
In-Reply-To: <20260921053807.354802-5-aneesh.kumar@kernel.org>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
	<20260921053807.354802-5-aneesh.kumar@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3jD8oHoTDGeAq9AFPqwm4eGj6bp00pd3
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab1ae9a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=OqFrNVoMAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8
 a=EUspDBNiAAAA:8 a=O44U9CcMlGbnah6vnssA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=H-multw7KC1Cw6hvqdV4:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 3jD8oHoTDGeAq9AFPqwm4eGj6bp00pd3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMyOCBTYWx0ZWRfX9IQoZeu75kY9
 ygTBFDI3xNZFsntaTW51x4hGzwqNYUQNWQGWk4Rl4Pi+zhMyTGq66smMneuT5QcLqA7clmRQHwV
 UiBNvdzi86Rw+16QYMjgsUBPN0yYXEckaNK50kXYQk0o3L9tne05Sswm070lUmKsYUU88rJV1jc
 QwJNLLQgolMilYUN0wQLAkRB+cYdjDskVb9AiXUN0ylIHayfzZFCM64tUip64PBXZuppnp9z2D7
 VdKc2lElj3XjTFLvjsBt35f90xMuSFhxH4T3/FIzpZgeAJH3dIoNTQle9KEab01I5PjW37XLGRM
 u9ZHyBia92APnHaPUNbdNHqzD+kYQwu5+TmwQpRpg4gha0Edlp+F5V/n/M8CQI7oyWmoh1aI4as
 VU0dk8bnbIrw8IkflhBKLyy7GV8uUpTDUav+FW+QJY0yM5oiea8KX/P3lsnBr54sCn2p8GYoF27
 qbWsuszRjEOqb+nlj6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMyOCBTYWx0ZWRfX7SciL4bW0j6c
 zlDGOVy9QXyD6AiJjWTudF78gqA0FcqzIW/qbPFEryA2TiSvmfsWXdbp3/21q3p2B47V7gKytdW
 6K5RrvAny+HVF/05DNZY3zDqaoxU6p8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210328
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_152427_542055_EF6D202B 
X-CRM114-Status: GOOD (  14.61  )
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

On Mon, 21 Sep 2026 11:08:04 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
> registration with the RSI initialization code instead of pageattr.c, which
> only needs to provide the low-level page-attribute transition helper.
> 
> Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
> the Realm-specific encrypt/decrypt callbacks and warning policy.
> 
> No functional changes in this patch.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@ram.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
Mostly for completeness and so I don't read it in a possible v13.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

