Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4D4C44520
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 01:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S26ezyycOtOJJs/eO9LtmBbdx8jrwPqoD6H81PFFNZE=; b=j7v+w5mb/ah7QSs3Qsb4StIHnL
	WJEGVQ5sQUGigJXMQ/OPXGBxmuJ3edL2cyP6fRT5ZBx53GRB46C2mO8ot6eQm3BFozKBCpKGqP6TA
	F2uCJaFAxp7Fngr4yMqwmCpwJQz5ih7Hr4lmC1ZypXXCIyjvCEcztJVLHoUSyPPiQo0Rz4Eb2vQOX
	woLhi9SowJPayuO9pxf8PTmarKgK0B3thZSdebI66/nziJCYk6D9pYp4tseZgMKh9X2jr8Qgc+cyx
	7w+1bU226WFPQC/SlsCtON96Go01CydzWrzMhGu8IS26Yh1GhaOe59kPivcho8vOWS1+8JGZgcSO3
	kwzwZ4gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wku2K-00000003Vj3-3SZI;
	Sat, 18 Jul 2026 01:40:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wku2I-00000003Vi8-1Xkm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 01:40:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HNEJgY3023688
	for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 01:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S26ezyycOtOJJs/eO9LtmBbdx8jrwPqoD6H81PFFNZE=; b=MHawPBaUfTnwVOG7
	o+SmVpl5eFJPZ2WXCmraE9lW2gZFB1lQYiFwDBVktPQ2i95EZDExtLF5CId4OUCD
	5j9m0mnSQs8AeTby4bSwduGrqb92g4OX4ZWWGLNn/t/SHZK83qnZOjFltejMhigE
	rzEfX551lm6XUptgUjpIOL1SHt+pARg2pSvZKOJ1IpC02V6Jmcp0iFtsnXL0O5JN
	HmtzNFFLVhp7EY8kPCGxfhRJqb45eC+Hc6pFWwxyPksoMQh3jge5cXLV6lHDeBk0
	/sAnTahoFhxWiIK+3vrMXpG6Qc+QXkoO0sMfYRuTQ5nd64GZaosx/pinic1njspz
	0BSCVA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrp8sfde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 01:40:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a651759a2so8769362b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 18:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784338811; x=1784943611; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S26ezyycOtOJJs/eO9LtmBbdx8jrwPqoD6H81PFFNZE=;
        b=VaQe45o1hKJ/hDv99Os/Syb6pO3wB2eCZrNx4R8vqv+cwHUu1ZV/QgjK2IL0nqn4pM
         dQYq0iMTmdUjaKsgh6Y9cu8Fh/i+Yj9+yVzf45uH6EJweTSnUp3CPq7trzBvgaKwuunc
         l9YsRqeiqfjr/Vgks+uBCsPpJqbZ6r4OwniKGbYw2HoBUD1UMcNabFq48qwHFhez0Fhg
         5i5LmeU7nSk2OUQWT7FEKUqQ2LrX3Kcpheb6O8odEZEWvMuApE0q6E9ni2WiyrftIOEN
         SH5ST/xJn24TZC4urHXxXPmp3BvP3dJ/hTrkNn4P3xdoLzYagdfXeGhJ9VciH+6AME3J
         +3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784338811; x=1784943611;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S26ezyycOtOJJs/eO9LtmBbdx8jrwPqoD6H81PFFNZE=;
        b=k9HbM3WOPlHCmswha7sKueh3cpy/hRqkrLA4Qw+y2R5tXxNAN7QV7fW/i8BD48VeoP
         8WrvRtOeMgY1eXjb3W97ERFLOcG5kSCS5ceyijGkUBzdN3YWl18KE/Lw6BrFqST7AKbZ
         KqZScaQ5c3YA3S9PK0OWJbz2WlUNOjVy4TX7k0KbjkDnvftMqIkVt5mnInOrMK3BTJO3
         Uae3/81gqK72imap0hn+vUeTC/g1EKq85cx8aEg3AM14DbHo1hIZIBsdT0OSawdr4xZh
         upDZRMMwCI4EoWo/VgKVy+/yA3BMVhuB5e4RmvVIu5HwTK63ToVADiilcWZBb8e1Thbf
         tv3A==
X-Forwarded-Encrypted: i=1; AHgh+RqrYB8cr75Xv04dx5Qs3X489130BUXGlE1ltiglgRihJ0TkH44oJLi1xSh4U9cyLh0MaHaOChgaN8eHjgXeem6W@lists.infradead.org
X-Gm-Message-State: AOJu0YzpHcXEkniXiYndXpCAyLS0k5HWeoracXlv2IuM1IcU3WYHX4cw
	uDXcbJAgzRXwIr2epX4WEYxKwaELK86NKlASLz83co7/pNweuk0z3aANe375OOaBkM6MfFUyVpc
	OAPqBKFV+gz5IHQjAQ97N1VAY0OWd/34xC7vfz+4A1/LCaS562xExKDbNV2kpPNJmE4U8CT5UWl
	sVhg==
X-Gm-Gg: AfdE7ckmB/1l2+V/vG4ombxNRXZQcX4xlLosE7mrwUj5d637f156MZkh6wHOY66P23v
	SegNg+dTNz9t1UmG9dW4qh50j8MYjIaL/P9fh1LLkZ1fNEFF43YZB99scVgRCI+s/THQqdcQI0z
	OyhL/3q66cdA7/GtdrtieMIdeweLGEphJzJ5akZA/sVtM5UoGFEqUILuacYNOs2un2mAK3OlDDB
	AWgXgoofBdKKX9UHzX0KaMULe0/Lmef2xnNV3RB/AL/ym5iXTcX4w2reId3YvAZ5Lqf67tueONM
	eAGD2mMoxUdhI80mDpP7NT8Qd41Lh6YmA81ERcTbwnZenHUMJ2xLUm31eO+J0yhh/lkanXmg4F1
	kvSmfKKtZQbVk1pJH
X-Received: by 2002:a05:6a00:278a:b0:845:d284:9e0a with SMTP id d2e1a72fcca58-84c294d4d65mr5211978b3a.49.1784338811353;
        Fri, 17 Jul 2026 18:40:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:278a:b0:845:d284:9e0a with SMTP id d2e1a72fcca58-84c294d4d65mr5211955b3a.49.1784338810876;
        Fri, 17 Jul 2026 18:40:10 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adc3466sm2028562b3a.15.2026.07.17.18.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 18:40:10 -0700 (PDT)
Date: Sat, 18 Jul 2026 02:40:04 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Petar Stepanovic <pstepanovic@axiado.com>, Akhila Kavi
 <akavi@axiado.com>,
        Prasad Bolisetty <pbolisetty@axiado.com>,
        David Lechner
 <dlechner@baylibre.com>,
        Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Harshit
 Shah <hshah@axiado.com>,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <20260718023952.5627abec@jic23-huawei>
In-Reply-To: <alnpMFK6_ZkdWlLi@ashevche-desk.local>
References: <20260716-axiado-ax3000-ax3005-saradc-v4-0-810527a9d27f@axiado.com>
	<20260716-axiado-ax3000-ax3005-saradc-v4-2-810527a9d27f@axiado.com>
	<alnpMFK6_ZkdWlLi@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDAxMyBTYWx0ZWRfX4x62J+OshnxC
 7VzWLJjZ1OvLtPCDhPtVW1mQ7LJehKjapjJ+BCnyQ4aGYEAKvyu04AB5JSdSlFSc7AFRPkOdHHE
 XEmAnRtg3PX6YSsFyrqQARLFT9haMeI=
X-Proofpoint-ORIG-GUID: pzYw4R9yf4EB_xuMoBGWAX3NFqAtFw3h
X-Proofpoint-GUID: pzYw4R9yf4EB_xuMoBGWAX3NFqAtFw3h
X-Authority-Analysis: v=2.4 cv=fMYJG5ae c=1 sm=1 tr=0 ts=6a5ad97c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=QyXUC8HyAAAA:8 a=JNnEj29XURRsWGGOtMsA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDAxMyBTYWx0ZWRfX31rnG97MTNtR
 8kfIMOSqm9lTEtNQ88UPW66iRO1yQABDhjC2elIcSYWzs2H8wRuoMdS5wfCm0Q+6E3hjBWPQkY6
 7hDQKjvt8/pe/LN07QmcyrGZuren8COUuw+9Xh9NWPjiLq7YQzBpjrels5YpCizqJcmyRNYb8Rx
 TUb+ek/RELnbxA3vPsF9JxnlSOCegPe5Jgp2+7h8BZY01A3w+VEL8OPTmAOCu7r9O6EmTBxXQvR
 LLmRFAEi6XKKSSLlNTpS2Tdk5uLYq1bBcUlyT6Opzh3y/Vp/fWTo1R1fVyZRNoRLsrRm36L6MX0
 viG1Mxltx6ZIzayZHDbXovCTfizPyCsunmS02nl77I5bpuEAmFFomEynW9Kj6U+8mVoh9NYWipD
 VZuGaVXf9/5RxGUat2kWOMq3vkHO1XIxV7P32e6+eNwlUr1SlV6M33V+Pp3z9pGEwbobHLAlmuB
 QnzxPkpNHANyuBC3DbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_184014_440131_09605E7C 
X-CRM114-Status: GOOD (  24.14  )
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

On Fri, 17 Jul 2026 11:34:56 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Thu, Jul 16, 2026 at 10:53:02PM -0700, Petar Stepanovic wrote:
> > Add support for the SARADC controller found on Axiado AX3000 and
> > AX3005 SoCs.
> > 
> > The driver supports single-shot voltage reads through the IIO
> > subsystem. The number of available input channels is selected from
> > the SoC match data, allowing AX3000 and AX3005 variants to use the
> > same driver.  
> 
Andy already commented everywhere I'd have said things, so just
a few places where I'd take a different approach to resolving stuff.

Thanks,

Jonathan

> 
> ...
> 
> > +/* GLOBAL_CTRL register values */
> > +#define AX_SARADC_GLOBAL_CTRL_SAMPLE_16	\
> > +	FIELD_PREP(AX_SARADC_GLOBAL_CTRL_SAMPLE_MASK, 0)
> > +
> > +#define AX_SARADC_GLOBAL_CTRL_MODE_MANUAL	\
> > +	FIELD_PREP(AX_SARADC_GLOBAL_CTRL_MODE_MASK, 1)  
> 
> FIELD_PREP_CONST() in both cases.
> 
For this second one I'd rather see defines for the values the
field takes and then FIELD_PREP only used inline.

#define AX_SARADC_GLOBAL_CTL_MODE_something 0
#define AX_SARADC_GLOBAL_CTL_MODE_MANUAL 1

To me that acts as clearer documentation of what is
going on at the point of the write.

Similar applies for the SAMPLE_MASK field where I'd define the
value 0 with a name then have the FIELD_PREP() inline.


> ...
> 
> > +#define AX_SARADC_MANUAL_CTRL_EN(ch)	\
> > +	(AX_SARADC_MANUAL_CTRL_ENABLE |	\
> > +	FIELD_PREP(AX_SARADC_MANUAL_CTRL_CH_SEL_MASK, ch))  
> 
> Missing parentheses for ch. Also wrong indentation of the second line, missing
> one space.
> 

I wonder if it would be more readable to just push that inline rather
than having this define at all.

