Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F35CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9r5w+GpWf4gN47am+35rMxigCSGjr21fClI28eL45A=; b=Tf/bQ6Y8NffaUww0+ATlg9hxqS
	rMNVpIOag2k0Woi0fck/DqtTAx4bX17SK0WLu5QcHjB55zzjIRoOY2i9+1jCEnxt0v3AznDWLIdN1
	pOr/1h6fpvnUWO4Zay7kSDlKIS8rcDWYRQJI73zATCFmaP/mQVWYQbAempz/zNca6R5Rw6YNx1tf3
	rAMT/xQ00UPX2Kpdi37Hk30ZzWWz4LuEppsLanbnSL34DjCuf5RcWghsWhcY6+AYbqgTq+zn2XxqV
	W9IsLSlrvIIKvC2USjJb3FY+JnrS8FK6J7FT+PE4hK670gLAhT1na6pIUyQfoz+eazjlRnl6pkR33
	5UXhRsQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCflC-0000000C0Ae-2gVE;
	Fri, 02 Oct 2026 16:05:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCflA-0000000C0A8-2XYX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 16:05:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FHJ0x1647662
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Oct 2026 16:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q9r5w+GpWf4gN47am+35rMxi
	gCSGjr21fClI28eL45A=; b=f28IOkX0NMivWOlFrM5h2LD84mzH5dS2zzRCXJeG
	cNl6Yu1uurWycyU8Vv28IJ7qHOBql33dhZF28ZGzvzk031rdZh1yjpeyYThTD8Dc
	tjFc+3vW/2477pm8nwG9okxyoCB+PKbRlq2BuyOpyykQUZJK06fYWEenbYGZqFyd
	lm+w+QiFXnBLRbJ38ShJQPQ4ZjRKK1tE7KcjFr9aehzNcEQztD8WXW0lFdQQfT7M
	BBLrQoZRrxsfpKugqh5Nf3J30QBSPdRwoWXDlHd2JlljjIE9zjC+dvUStmXLNINW
	E9CHLOk0wcUBKgGBj1zETnJBZQE9rDGf6ueVUdQG1oGZFw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ec98dcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 16:05:19 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98909a978b9so349303241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 09:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790957119; x=1791561919; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q9r5w+GpWf4gN47am+35rMxigCSGjr21fClI28eL45A=;
        b=ZJS04JMHTh0CxTwwrlf01zvwVAs47vlNDxD8rbdMb4QP7tKjE+ifKSFKFR0w39cuHo
         nvxptUCXoDGcvyZ3g1e9UhzXxl+3xfu9o469t6SHbZIKyMbTeSCk8hImsJsBwgEoYj8r
         dnJrWhc+rhJute3macKYloY8HceG8HAdB+wBss7t9WhGv0k4eKYaEaZgkaRIjgcAI68L
         o+AAaySl9hkKZ/ubCkcsjKDwthzXUviMgFHqzPWRY7LioT5XE91qAfGAdEUKpZlVkw+M
         QodwRtexdJS8h7XbBpba6FKdIyqy/5MZ7AXTLXW/bwYuCoc3emx4K5OqNEn6ndqW9MVZ
         32hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957119; x=1791561919;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9r5w+GpWf4gN47am+35rMxigCSGjr21fClI28eL45A=;
        b=NBxp88wvMONkU87Y9sWS4IEGlsJ4QeiewaRxOOh02a8e6DPjQtTXqMJsfJQvuD5vrw
         GhRtsHG/xSMP6U4/TDKwgxpiFc1x+5fiRCgtiYD+hIR41WAbaqS8S0Pj4dkv0wSgm0uk
         QtbbrE3uBAa0TOhbQrLGUI+wLU/y9HslGkw43YbG+E3uG3kNqlS5xXeEYtJ3ZBX8nf2b
         jX7gAOLz1VjK5oNjJ6jhevn4EiTyU0eZTyAcwkUuMldN02mEAGOznr2Esm6IcuOrc3va
         o6bwx1r2/ATrzyj+y8A1DVY5ghHlc7pgtH24deqh4RAy4Tj7aYVXPCz3/mh3TisI4Z/p
         D6lA==
X-Forwarded-Encrypted: i=1; AKwUvBwY7wdkBLU+BoK41MX+X9oXzzRcdhYlQoAr79RQq6k6gSOS5xNAPmAJMau3wfVRaPpPQ9VbRqTaW8DdcJ+F6kWW@lists.infradead.org
X-Gm-Message-State: AFq9FYIw6A7msKcbGVkfcoEFpoJxwtvorIGri90V+HthLipcN0c4lHAT
	hp1bTR5J7E3/vIuSsfpC0KESDmbza6yLn/4fUPhNtkuabmbgKHZ6N0RUvpIBHbX8QjC9euS+Baj
	jw3UzmmSOrDPJQJlQPMNozYMrP2kUMm/iODFuHD8Mei3BE4L+J7z40kQdQ9ZjTcXHNe0ly5OvnG
	capA==
X-Gm-Gg: AYBFou02j0YnuUQOryZIe3A5tpFputeNxI35mRfnuEVts+PUxcAPghUUtcj6sPVjpGf
	EdRCl444k94q4Ev9Z3wQHvdWRgW41f8/6Bn4lo3y7khcWSqTpiBPcoS+clWaiTHSJC0vReqwYx7
	mVttdNfpJye67fx4QhVm1f8QZeP5PFO3WbHMGfDcAmnbRzJJMC9VmtvYR6uej7390sidSD7onfI
	vcVAlwwOdusPWDWHMfGrNG7Lbo6n897CL5lP4bX9InvVgM81ZhsG/rNhs78A+BTLJfsOTy9LXG4
	aJVi8fpZlE88B8AJEk3of7m2xnxVJ/yl3nCYbXe90tg/xqVYAIpzqzuu440S9v6ZYJtbbQqwe6M
	Bs0IBUq6keXOhtGABUC33DgiOZVn6nrqqYa4jMaegfyDdueDCphgR2901CgerD0aUdziV3YBe4b
	Dpr4+jTb8ElGjB
X-Received: by 2002:a05:6102:8519:20b0:7c1:3b2f:d275 with SMTP id ada2fe7eead31-7c13b2fe0d6mr302686137.24.1790957118583;
        Fri, 02 Oct 2026 09:05:18 -0700 (PDT)
X-Received: by 2002:a05:6102:8519:20b0:7c1:3b2f:d275 with SMTP id ada2fe7eead31-7c13b2fe0d6mr302662137.24.1790957117997;
        Fri, 02 Oct 2026 09:05:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e3030ebsm10982661fa.16.2026.10.02.09.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:05:16 -0700 (PDT)
Date: Fri, 2 Oct 2026 19:05:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Michal Simek <michal.simek@amd.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] ARM: dts: qcom: apq8064: Drop PCLK from static
 replicator
Message-ID: <umknnkfjevejagydaktpq6zgh4l2uuxy4k2f5l7v2ypr2xb57q@obtxdmeihisp>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-5-c3edca1c480b@arm.com>
 <z2bu73w3xcl4ofbp4td3rj7wazzoth5gq35obiqkrfhhfxufcq@hrfvij5jnb55>
 <20261002153328.GE1208404@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002153328.GE1208404@e132581.arm.com>
X-Proofpoint-GUID: wZapLqn1xOAGYUgYodHznBInFXBTeCsR
X-Authority-Analysis: v=2.4 cv=Ie8Symqa c=1 sm=1 tr=0 ts=6abfd63f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=8NyxROJaIBheOw5Anm0A:9
 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2NCBTYWx0ZWRfX2GgckVb52Gld
 9cJJ5TNizO94B14JTzaP4g9NCGv1oCgYFuciBcQy69jiK72rjROafKv3zbjz8bvyWa+IFQXjMEf
 ZWS7qR1UqWfF4ER+4PIGp7BfBdHejb0=
X-Proofpoint-ORIG-GUID: wZapLqn1xOAGYUgYodHznBInFXBTeCsR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2NCBTYWx0ZWRfX/RbOfX537PwH
 C3iY6thJcfarJ88aWIeemamn+IX0tQ+if+o9Fy5SM17AkEscgdu9LK5j0uMD9bTLJtoYTASpCBk
 5kMWqUvGTOl/ajMCAdOYsmmcGrtk+w5gTXkFGQwqlWDTdXo2s7Fceqnk+iPQvOmP/FLJuIQdM+o
 T87fPbvZvr1r5Wf2rMQlu4o4N6sFqN17duFKjdeCPzgoTm84lJHYueixc0Od3pMvwkjpF8bDE6l
 1Z+GMP2Y3mbF2n5QyOT4zTydgStIqzl4vivlyzQXoKU0R8edbk6puoZrG/1tk8yRepGD4y/gsDp
 Qr2Y2RBC07HGhZVyQabGm8b5qsSK1dScBAf7/u2jCcVJ2JjwWSKC4th2g0WGkEWvjmSI/xMbLCf
 2IUpTbUMd65coAMdKpLlwbsWvnOdg6jr+Vr4OcXjgPj2K5MWbBuvpzkFnUsjjJPjmy2YjLxWctM
 VWzs369MpV1rqlV5jPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_090520_776886_31EB731C 
X-CRM114-Status: GOOD (  21.51  )
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

On Fri, Oct 02, 2026 at 04:33:28PM +0100, Leo Yan wrote:
> On Fri, Oct 02, 2026 at 06:21:36PM +0300, Dmitry Baryshkov wrote:
> > On Fri, Oct 02, 2026 at 04:07:24PM +0100, Leo Yan wrote:
> > > The APQ8064 static replicator has no registers to program, so it
> > > does not need an APB clock. Remove its RPM_QDSS_CLK reference.
> > > Other programmable CoreSight devices keep their clock references.
> > 
> > QDSS clock is not actually the APB one, it's required for the coresight
> > (or to access some of the regs) if I remember correctly.
> 
> If so, it might be atclk for clocking the module rather than the
> register interface. Could you confirm this?
> 
> The replicator is just a middle component on the data path. I read
> that it shares the same clock with other CoreSight components, so it
> should still be safe to remove the clock from the replicator node,
> as other components on the path will ensure that the clock is enabled.

Unfortunately it might be hard to find info for this platform nowadays. 

-- 
With best wishes
Dmitry

