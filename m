Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6067EC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFAGiOFg8Ohk1lbqGxk4BCZDcIv/T4pj8Ax5ybWtFqY=; b=BaKWfkHr60ZdyTMBVxPegN8H/X
	iRnuPmd33ejKGiudcHXW0jMBZrfdY0L1MHiKDU1N2XLpeCXePWFgI/2GAx0JaBK1nKJ6PMMvE12DW
	3UamkQ2To+hVXl7fus3AuTVuLkdtV4iyvA846aAF8ZsHOmXoO8VVeFsb4yOtZ11Tu8ZBt7XkLTvF0
	3MU7adIEI7YpuvW1s+zJB2jk+wy0KHTqSdxOHJciG4mUo1Ku/rdaoEWDyF/3H2ji5Xkeq7O1Kxc/R
	LDtaKROPvlFoodBCwVPYDZ9l1Dch7qzH8pMBzqcIIS9jpZjYLtyQlNLcbvxNfcOX5hGxTeBwRM9Df
	yRQC9HMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mme-0000000BfkN-455y;
	Thu, 24 Sep 2026 16:58:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mma-0000000Bfjl-3DEy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:58:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFfb6i2757933
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 16:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rFAGiOFg8Ohk1lbqGxk4BCZDcIv/T4pj8Ax5ybWtFqY=; b=Xu0+sAhP7595qGZV
	puFGsMwbl6q6Rc7svCwZK+AFgMMAFmZn87UZ8N7stAWgs0b0fX/qeHfXEwPqf/JI
	jtokQwdafNIMplnB+yMcLHyw+cW2OteWLk0U7jB5dum0+Gi/XCATXkWIncHTNygg
	sddbbfhSpaQFHFNsp0+KMdS+G74Gb/U83Q3pe+ucyP+BmwIwCjbJI5tR4fVCVMzB
	zgp1sV3lLSGYNFQktGsggcc3+d5FaiXwXpabwwiX70UTB3IMx4MV9zwSKRVDeG6R
	nJ4WDyHPLzInzX0l+Ks9kur02sJ2OKBXTJZnHpgLhC4ExgQQkv/n6naBb9WImHBw
	uIJqUw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ajthh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 16:58:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso81189a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790269131; x=1790873931; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rFAGiOFg8Ohk1lbqGxk4BCZDcIv/T4pj8Ax5ybWtFqY=;
        b=USjx9w6Asyns0NjxLXx+o7IwCxAQz6bIZrH3NTzKhmyYzGLzX9o47XPvr20fLh+SsW
         xdScELuGu5U/S2zgZr2PustTCnS7Kl2p79dlAoL7XJE1TaTRIfMiK16msf17/v5erNSd
         QJ2tiNP9UUBKbpaB0Q6dQyYj1D+w9M5FC7PUvosIR8My8dhQAqMeVQHFXD45faqc/4uw
         EMRAMDj+qucKhuoE7qNhRYFEfZ+sqAapyQFAyIS8zasisL7aH8V28Sz1Hif2b/UcMp9N
         KIhS8n9QF6IlkqO9nqJAkbFX8NV2LPygXUuKIiHk9ls8GQljB+92o0O3rYly2sihZBdX
         RVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269131; x=1790873931;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFAGiOFg8Ohk1lbqGxk4BCZDcIv/T4pj8Ax5ybWtFqY=;
        b=OW0RBf1zX2hwuXckbdEzQdTvdv6HvMlDSTILlx0jFnl/4chouQ6bS4klPYvcT5yrWl
         zbEmjiTcWmDFWGy0n7kOo2Z3eJqrPMiXFlwPJaGfQ0sL4hHDoW2NhkKpxqD3SbJxi9AC
         VMja0O5jLOuIydhpQLFPbiQBxUIF1Z/9fRbrKvalLAmcqcbmQtUmFo+ooig9PVjlPFdV
         4CenHyfWpQFAb9pFCXNxk/d8Okaey6Mv9TpNM5geJI358LyCUoRN1u3dUUcm+8DCNUj7
         Lplr38PANsgZjp0OH6TyRarOwYZHumYyBPRexsTw6T7JhiGETX5uq+B9emX0gkoKLcxq
         cgUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnrS6BmXrPkIraLN/dlvsI3GVX4KmPBNySxPrcdqA8i6gDYCpqe4XRIT+w/Zz1PDChKIiyphVF8jddGYWKcbaR@lists.infradead.org
X-Gm-Message-State: AFuF++nkcTRupUKemkEWsvNF2WWygE1SkaqT3cVt2KQh/0DLeN6ncdwB
	fwPUoclYFxQ3c13hTVSZOUONI1lrsTcfAo59vr8ZYSmBHkpk+yJnXnAPdmZZOapJk6QoNVOVtAW
	YZ2Fr+0EISQrrXSiZ3rMjMumNVBBewniZRtlQBTuLEgLf+AJQO/EGmlsffjRIEdXAeVOfbc43N8
	Xs4g==
X-Gm-Gg: AYBFou2R55AQLsPK+6UeJdG2tupPJcZtNZWGCiSccvqp5yF327ouxYTpq9HR+mcluJR
	bxs7lM49ib78ZnHU8sFeyLlyxwJICIauGKgYiaSOkESm2aSzIibOABPvTOYGDE0R4aXQPDJmtfH
	6MGyrAfmFMcVMcUzXopyWcWp0aR6EhnCojLzMNk6ZpFqsQ2A+6eXi0eBfFqsNEraxlMZsDkkhiI
	40W5SS55HApcdUCdG5A06lxW6TkpF6L+IyAWJ99PnSVCQoJwQe8vYHdhnythLcTBN2c2iYCepnn
	i8VE35YvDouYYIeuKqnUFRxCGwlKgiWGcJc+QHtrgsqehZ1r5DzL4asaHEBrw40xxxmJ7CtHWFu
	Ozbjhg9L9bGhkrWgXahunaTmHBO0lFEdFUQfY45sG61jSWjrL9se90BM=
X-Received: by 2002:a17:90b:3c4f:b0:39e:6c69:7775 with SMTP id 98e67ed59e1d1-3a09898525fmr2917435a91.30.1790269131552;
        Thu, 24 Sep 2026 09:58:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3c4f:b0:39e:6c69:7775 with SMTP id 98e67ed59e1d1-3a09898525fmr2917416a91.30.1790269131105;
        Thu, 24 Sep 2026 09:58:51 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0a8d290d0sm2047321a91.13.2026.09.24.09.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:58:50 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:58:46 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
        sudeep.holla@arm.com
Subject: Re: [PATCH v19 2/7] firmware: arm_rmm: Check for RMI support at
 init
Message-ID: <20260924095846.000051f3@oss.qualcomm.com>
In-Reply-To: <20260924135201.850038-3-suzuki.poulose@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
	<20260924135201.850038-3-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfX3KgW4nYrXGKl
 c1APtrg12PLYbb6ewwrgRKvUALSywoTYszbvcr6LlUl27O/fwNaOBcSB7VC+kEU19jYPFGUbXH+
 BRDbvis/5DPleE06YF6CnsEEEAU3J/4=
X-Proofpoint-ORIG-GUID: GGklHDehbEEERYOQQqzoozVn7h38VCbA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfX6+b2DTrYwTT3
 J74J/3a5vhq0rwuJnSpFEUqvY8TNhW6UFnOQN1ptfCJEfxMwXMJF9iCP8m3AnYYG4Yrmtv3LONF
 qHQn2+lW0qIGkZ2qpSG8LtMyk8LkA46RTf8szHTqbs9pFbByDAWqe0zVbDspamJWG8xQLnuAIAz
 IZKJvWLdjmJV5gsdCPQA+D46RgWircgxU5NvBWrN4BHob4fD6i7dvB9SSKHU1vLR8fX0Uwiqge2
 ehmZcKFRG8IAn3GpNqvoYGJHwUk8eMg92PGujIIFb9KyXRNqjXHlDRzPoPWSx86JWxOcEPwrwx8
 0zGyFwLCSFTykZQ06gT9D+J8WDJs4Xi9cNpTbayCAi2D/hLFWdzNyXUeqkTbMHBJyc57aWRz/n5
 k4DLLCjmyeUaiIVnUcDIHist2X/LPXJ4zMHJp3zeDp1F1HpEr+LiOFftdaN5OJf8sjHHvZrYMOM
 hvcGxw5ay7WI8DHNrfg==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab556cc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=iEv2s1z673h7nQAfKJgA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: GGklHDehbEEERYOQQqzoozVn7h38VCbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_095854_053674_6F527F73 
X-CRM114-Status: GOOD (  14.70  )
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

On Thu, 24 Sep 2026 14:51:56 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> From: Steven Price <steven.price@arm.com>
> 
> Query the RMI version number and check if it is a compatible version.
> The first two feature registers are read and exposed for future code to
> use.
> 
> We only support this for Little Endian kernels, the Big Endian kernel
> support is anyway marked BROKEN and is being removed.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

