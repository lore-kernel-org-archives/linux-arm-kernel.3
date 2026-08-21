Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52504C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 11:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oh9SGcJoUiskZKX4r4ZOUupPC4HusVwgeUCpZ4i0z2g=; b=1LmBh/3f1mZTG46s0I/hT9Bvdo
	TsGipclmDo4oyAHe5Sz8B90aARkMsUIcadQM26DwhIbsqikcq1FTMO2XS8wOTPY2qK/CdwlgkOF+r
	inebK/U3bBtwwD/wZwCH5d9AwOi4a6mj4Zag1YC8DKVrk2bmVUYOJsajTw07s+JPmdqBSyw1UDYXq
	qjus+85CHkjq76It7AvD6NLBvOrn4o1ie9p9TNdIRpMPXTjn/46JfqAsxzlh4534Hiky0T0rL09Ve
	vZrNCk+W8yiQJRIAJkDE0EurljtUAW1AW+C0XtxZmjKHPSDuts7JsoiVALrIwLO+P4AUWd2emLRlQ
	X7AsXGbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNdq-0000000DCyp-23vP;
	Fri, 21 Aug 2026 11:42:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNdn-0000000DCyC-0cPX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 11:42:32 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9Lpg13029483
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 11:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Oh9SGcJoUiskZKX4r4ZOUupP
	C4HusVwgeUCpZ4i0z2g=; b=dIiHrkTie97NjxVm4NvU2TiTEPat6N9VWVR5IIA2
	RhkfBrap9NoBtwZeXf84BAFAvVqDmeUEEBvzztw6grOX+S36Aah6OQKe33ZrZhj+
	IQUgKQ8o0BiJOn2Jx761e3/gJcHAjbEg0SDLZ7ZCNjGn/u9gzb4R5hXN7n+9nqVZ
	QGRYA89WYA0/kMgPqzGdns4lDCPLwQmN+Bt/35DOV1DFLVLdr4Bp02FWo4/EkgNt
	MNCqVVGTiHHDjxxxZ1Q7yxqzfCfBUWr6xzYIYYQ24/B/k+ePz6/3Xoxfas9PWnmG
	UCmHB6WAWGlYEXM9Yd+WTwz8LeHPhNHji2REd4PtzfIpGA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fg9sfsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 11:42:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07f25de2so6470601cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 04:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787312549; x=1787917349; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oh9SGcJoUiskZKX4r4ZOUupPC4HusVwgeUCpZ4i0z2g=;
        b=aBoSipodtUDdRNbZuWLPZ0EJi45IGmvz+sf1SdjmZZxL+XJxSbGQTq2SuaoLQ2y17k
         4GPVE8UPQoymB/DFqP6Ggd9TS4Ogkxfm0GSktqGEan3EuOWr/9+l2eT8CEeRtb4/0F9W
         UJCDqoXwSh8ATE12cMDH9q6o2xwEIR6MTKt0Yx2wDWtBrihrSK8llA6osNfK2hI5r9OT
         51gDt1HIooCwA7955/uiLRDvKtOl+eIaI6DfUrzfL3LXr+4PMIXhe+bVvdil+PH8+8uX
         dHVh2pnnBLDft4Fsp0Q6rwanlX5Jgc+SOmxu+CZxX9s+vDBhtDDf9QIF6NLxqqQh0LFn
         47HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312549; x=1787917349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oh9SGcJoUiskZKX4r4ZOUupPC4HusVwgeUCpZ4i0z2g=;
        b=EK4yvzl8sV0MYMWN1WjtrIyOuRpeoZCGo+X6bR2hJRgKxTcVfXhGJwaKIrPbIJJtil
         rNHGKAm9JdmBFiJDkD/u8j3wXPsZq09ctFNATHC/+j95w4bxSdHGvjwaLLvq3+P+Sxlk
         mZiZddiOdl1t35CW3fZG+iM3uQkG96Lp2agN9lrstVGOd4+7HyBpyXpuEqsTx6G7GiXw
         pCv00U8bjnDQhdLmzjIyUhigGQNLww3YzY1vVZkd/CE17RatAqEHLzhNdaZlZvnyjXg0
         XXIZtCM92Z8IwZOssPOOD+UY1BsUtTtIVjyl0e2jWb+tGAtbamchg3S8RoEtl1x4z6kj
         +K1g==
X-Forwarded-Encrypted: i=1; AHgh+RobetF9ZXvPI9gsAWoidC7FNM9a8m4hK65Xzok0LVypZ6qgNEdn/WkJBRQMaUDcMar4HZ6GGoZ9ZtWuDzMpmAze@lists.infradead.org
X-Gm-Message-State: AOJu0YwKJ8uRNgnqS/DnuPvGIaqYoRNqn442PiE12C1z2o6DnI/svV+7
	c5YOMDMpysRDCJ13hSrSCreeVShuxNw7VsB6MOEqAb2B7yJjuOat16dE2zWAJ4xGTaafPF10I/U
	H7eA/J8a00Bcipj4KgWlIQ4zPMOumhmN8Lkxhzbk+4AqRVnFo+noNM4Mox+LvyFmaUBPu0tSAV4
	wPYQ==
X-Gm-Gg: AR+sD10/n2abeeCbIFiJq6JttDHGb6QmsrBxKeKaNK6ke4oiqi10ewZPYANB21SY+cU
	wEKy2SfzY2ktcjNhMBzr4czv1LpOojVN5U9AK/YkeyCjNRlGq3U1Wwt7YT0mQHmmXNN2+33OG9c
	KWBhErUvLzsZo/Cd+0HhyvEK5/ENHQ5G6CWg97lt/OYOWZe7ch40D984RdQChRS5DwNtkzKgO/E
	FZYWvEJNJ6mA/yoy0GNiwmFcvszSejd2/geD2EV9JjfHYbmg9pu4nm/ulqFntMJVMYI3dBoG7yU
	U1t0SzbADL3WUkOO8SuZfa34HXQzUUOnz6HtPHFFWVFlXmiOF7VmqUqe1vrCUt6gioY+cHIiq+c
	GrHtTMjBdD7B0SGU=
X-Received: by 2002:a05:622a:283:b0:52d:89f8:4f8 with SMTP id d75a77b69052e-52df56e491bmr49500001cf.5.1787312549413;
        Fri, 21 Aug 2026 04:42:29 -0700 (PDT)
X-Received: by 2002:a05:622a:283:b0:52d:89f8:4f8 with SMTP id d75a77b69052e-52df56e491bmr49499401cf.5.1787312548864;
        Fri, 21 Aug 2026 04:42:28 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591df293sm474840366b.45.2026.08.21.04.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:42:27 -0700 (PDT)
Date: Fri, 21 Aug 2026 14:42:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] pmdomain: airoha: fix unselectable AIROHA_CPU_PM_DOMAIN
 kconfig
Message-ID: <7hlarbdpln2y5ckt3i6nz4gskcxl6e6rher6rvsgmwop6bj7jc@exu2d7paa5iz>
References: <20260821085222.140633-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821085222.140633-1-ansuelsmth@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4OSBTYWx0ZWRfX3H0H5t94xK3W
 6CmWip85SK5zp/A5wme3FCExgd+4JeoKJA+c7aflBqGO3Zb++AQDoNT+U/L9hz1QZiqTIKHTl3B
 1eCv7Bc8TYN0s4WY2h3YjO7dqbzsashPpP36Cr2R54ZGjp91mDAfmpUgR+hHEJhKXj/xTK7Dngf
 Q/vMM1Qvd5MoJ6t/FyNr5RsnM8kEKLOpy53t80C8uvMQT9gAe5HLnd3yxW5cs7fEJMLPbDG8I2z
 /GGYZfzTtGwKfUh97BtwXjmCx2mbdQlEzPHBdXfdQeQbWDwGnHsauFuls71uQhmpzGfDXm0KZ7d
 2yDwKPxX3AVuLUsvnDUGjcbaksvPs9Sg5wnMPuZqnYIGPz7zy8qjDmnVYGKiDj3QZ7QLcUTP1pE
 SQsKUXT8VXvKXkpy0HYE1ZliTlpFXVHL95B8T9bw8+KzZZClM3HebE1+1uhoqr4M5MdVS0wN6zj
 k/N8nqSaGtDFmEbkwkg==
X-Proofpoint-ORIG-GUID: 6rwFGXSX1UAlLXVmtHgtK3n_c-Xs4mU6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4OSBTYWx0ZWRfXwET6Ds1ROlgZ
 roTY4qRI/ykBVpKbwE5IPCMbDQ3AHkye5+pev4WCc+zCHv1LT7ZCEgJgdjAvRRuCBK7fvv6tKUy
 JLsg2EXOxWb76XfnRRQ7VfIifXfgs78=
X-Authority-Analysis: v=2.4 cv=Av/eGu9P c=1 sm=1 tr=0 ts=6a8839a6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=8jWgAth1d_VLo0Q-LswA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 6rwFGXSX1UAlLXVmtHgtK3n_c-Xs4mU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_044231_197026_08DC6482 
X-CRM114-Status: GOOD (  12.02  )
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

On 26-08-21 10:52:15, Christian Marangi wrote:
> The AIROHA_CPU_PM_DOMAIN config was wrongly guarded under the Mediatek PM
> Domains menu and was unselectable.
> 
> Move it outside the menu so it's now visible and correctly selectable by
> default on Airoha SoC.
> 
> Cc: stable@vger.kernel.org
> Fixes: 82e703dd438b ("pmdomain: airoha: Add Airoha CPU PM Domain support")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

This looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

