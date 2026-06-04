Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FE5CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfgOto66Y3BLWLac1kUqpihI4RTvBJSSkEWoerZ0cj0=; b=Qi/efjW0iiQVv/UoFq+IDte45c
	CZPROfOrDR/5dTsNG85tbtdGZZ+23quKXHw0MZehKurJmzDed1sS+kjUHEtfUcIugXhs9Jb+WZH1q
	uRRe6EJHHBZtiaYvEXJ/9YCh8i/wMnrRxi8LUEESZMVeRS0J7EJzo1UMIwsanh8CJ8GaV5alnAoPh
	jdzR6UkkdP+cFi7vcGWLdKMKvbhsYe/pfSO9yUhul6AynIVuR8ON4YvisHZx9/WV9r+IbO8Y25kLb
	XsahMHHf4zt4HaWsi4+lwwUbhpqdLPPtkgyqL5h/289Nx2zj6krDqQZJGy/FhZnlGywIsrr3kIIbC
	ghbSQqUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7j3-0000000Gkyr-04Mq;
	Thu, 04 Jun 2026 13:03:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7j1-0000000GkyW-0cTe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:03:08 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654CCfSo3221208
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Jun 2026 13:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JfgOto66Y3BLWLac1kUqpihI
	4RTvBJSSkEWoerZ0cj0=; b=H8KFaz4vgr9C3gNzdMlBYO6OFNtIQCeo1LdaNXs/
	YpfqyoP1Aa0ccSgUiwDXvz0HasZVd8x49Hp/pU6gksfHztq/6Wy3SKKixJTHzMtX
	3H6SmVJmEDX/HT4mdzSaj/+GXrz97sV0TjpxBSu1IjBnfEEisk/puCehARlyz8Ii
	tquZx0zMSUtxv1yU6U8NbBjtAPYUH4Zs/xHsTtMR1llEfTTIKRQuayosNPeVyuI+
	cmoNGQr8Kw4RmphkdGO4DLpS3cXrGD4iNN6BxL4TnhLJId7KslM7EV0TSYddCGxi
	pa4BGp9+7X3brrSKDNw7waXFKI4KS5t+xzjkAZnPNif/rw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek95u877k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 13:03:06 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6fd5f007eso1267872a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 06:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780578185; x=1781182985; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JfgOto66Y3BLWLac1kUqpihI4RTvBJSSkEWoerZ0cj0=;
        b=ZiN3weS+4wz7WSr4X9kzxnzUHW5KLu41AstpGbjXM6J8vKu3z5kba/AUd3v/UbaCBS
         OHaGr2LW6fLXqrZBze/cqKqIx7CNgdU8j7Rzm/mK0hF4W3qNO6vAXhBfYphbDAfRN4WF
         1ulCFLjibfejO5CfdvUofwY+C2ZfbPlB8kyXzkHmYoio1Dt4OI8VAhUVig99RwAQIot/
         gjJmiF2vvrbjIaLiG/G9HHi1vO61b4eOw0lIenuNsvDw6iNDYGQsjyc3XIANx8futv1Z
         6ZgnvyLA+jG0J5zl3qRnEyAk4Sop2Q4fuyGJthqkzsrX04JU0RwV2WQf0BiYU9HBr0by
         lWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780578185; x=1781182985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfgOto66Y3BLWLac1kUqpihI4RTvBJSSkEWoerZ0cj0=;
        b=ZkqycPqZBnB2NtNCMpsq4k1T3mZJo1YvuExW/iOjQc70bms+z1GTDVba+10ksKE1s1
         Ym7zxMr/k1vSIREy5gdSkcdlDo3Bbi/89KtS98iLwRxEOCvsfNTxztHkXtdlvBaXJj0m
         UEtSd9lY8QMMWTFvoOAJQ/4SUfHJjgZd4LHEaDIojnpP4TdXAsmhvvRT0c3vr7lYKOfT
         9bu0q+AYjNaz0yWjcPpXF2tbCho2z1RZ6zw/tuOUqQDuBCTUGUBhtG2APBFrEHx/97Rx
         qOOfUadlx1ggEa+N7dQU9Mm7qjx7E0iP3W5+aWq79R9pNeJJkesL1Os+wLdqCSxw4CGG
         lHNw==
X-Forwarded-Encrypted: i=1; AFNElJ+LzVyZYtngaw3eKor7dtK0v6bylxZGB8lP2teTKzH2TizXIihUsORVIxOhW/4geI+pZHwMGLXEqgubx0e78mwV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc195TFnnB31XzfOAt2EYlMmNcnCoSATdbFRSKEzTtCAnyYQzx
	7pz/ldAFN6JHQkodcHG/wqpOlFpKqXuidW87LA0JQJEDFVfaxo8L0vyxUefc9EUqOVI7S5VapnM
	UG/bPNSaeTWttog3sAt8ZJiByoV17hZa8JGfDqZMNC/LNLZySB0MqVBIBsFpK6e8T8NOIkQtceK
	jjcg==
X-Gm-Gg: Acq92OEOFiMnSr0g1ROs6v/+uzV3QceEc2JlVAD/GP/Gt9MLYJ2XXO2ST+SOJNX95vW
	IRbuPDDa4KLbbq9irN8ElpgynVhIx/lk7TaemN8Vxlq51MuPw649goabGHvN6pfzScgpEX3Kyla
	qWsdzrurc3uh41r1ETE4jMSO0ON5ZxzApN0cv9p0nahAcu9Rm1NT49uvTkJzQo+wZTAGnsDKDb6
	73YWy/mAObedCL1CsRmT1U+gnSjirTmbtMzzCqrrVPt2fZG7GSeeSH5EpFRns6wsJ88mR+4ki90
	E5Brig/oOraef9pjlX6x/F867uU5k9/sHiSw0PcTQAEFocIzsU6DSiY2KdJR+7RW1qksJKDqXwU
	+MfrXsDNsZ82TeQ4VdQsSU8IwfJgkGtWnUtOb4dDjRmxooeWvVpu3OE08BchlQ6+sg8YffeKYgo
	Y+RePV4PNDvepSFwL3SfEvz2ZqwbH96CQGaByxJn0jC++4pQ==
X-Received: by 2002:a05:6830:1e3a:b0:7e6:c8e:89f3 with SMTP id 46e09a7af769-7e6f9244026mr1380375a34.6.1780578185153;
        Thu, 04 Jun 2026 06:03:05 -0700 (PDT)
X-Received: by 2002:a05:6830:1e3a:b0:7e6:c8e:89f3 with SMTP id 46e09a7af769-7e6f9244026mr1380291a34.6.1780578184514;
        Thu, 04 Jun 2026 06:03:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5034sm16257901fa.29.2026.06.04.06.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:03:03 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:03:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Subject: [PATCH 0/3] Add Shikra (QCM2390) display
 support
Message-ID: <cvszjw5psd6cenek7ujczjkmcvrzhtckknrifb4pphxotca75k@irvape42pzzn>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=at2CzyZV c=1 sm=1 tr=0 ts=6a21778a cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=FTaq_hUnWkcAyd37DvkA:9
 a=CjuIK1q_8ugA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNyBTYWx0ZWRfX4ObJ706w4PV7
 k8WWtNd1gmpoZ8scFDjRKjcXqylwpKigFt9/6j4WTetJp+trR5YtG2Snxuf+Swzod7D3X1cN5vM
 Mqeg8ThhVZXczOx2qlFnx4Ywz0syV9648ShvF9Vlgy0UgFlULtjF7S4MBEWwj/3sMbTwjup5goP
 g2ONtinYVz8wIAzNAZmKvwZDKZ9aRxPnIDDjwZOAalEYJ8rR6vAb/C3t44mwnzA5+60KXJNue5z
 jIP+p7MleCThXT9J3FQEeUgX2hfz8eEpIAkpf1GlvQsF/g7Ss0wAKdWMVtpC3pPwFSSfxIrS0TG
 4nVfbWM/sKeKb8XQ+fLqwuYp/cxuPGUMpF7c5r7TFMSaRbhh1vKCYNLn1aauH8Z5lf/LeLyUgmO
 SnMEA5074jAmQfxp6iZV9XyEpEd2/jqWqqGTKLRCRr7QnlaNadnk8HexKEq8EWp4PGCxYso1Fru
 6Ou+29Ox7lC9scwsyfQ==
X-Proofpoint-GUID: 5qs2iQzcTkKBZdIE43_osdhfvq2tRy3T
X-Proofpoint-ORIG-GUID: 5qs2iQzcTkKBZdIE43_osdhfvq2tRy3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_060307_189664_78419C9C 
X-CRM114-Status: GOOD (  11.66  )
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

On Thu, Jun 04, 2026 at 06:00:46PM +0530, Nabige Aala wrote:

[PATCH v2 0/3] Subject: [PATCH 0/3] Add Shikra (QCM2390) display support 

The subject line is wrong. Please use the tools properly (I'd strongly
recommend using the b4 tool).

-- 
With best wishes
Dmitry

