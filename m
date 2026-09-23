Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A781C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 17:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mhMgPy0NdyeMrRrzvm3C/TebfdiGs7bXMmAUtAocDI=; b=RIIVd0iRmUJAAc92pRv9B1Lr9S
	EQgzkP4aCw1QvGrgk7XJ/dXiwh7EX9HDRtscmh9nZ4G20ZdYvchcebvwp3SNDU9XfOua1+GQjd0NM
	U7qvkY1S/zuvmDMdijkr+cfmhFsrNces1gUe/1F8b7qotzxmX+7BuwIDlZA20TyIEYRU8msw9WoB4
	pcqIELJORn2EyPGO9dAhOR7fOLqjNYtnuv7d3qN5H9O5H6EHTDrlmcI8llDcaWLmEBj2mO8H8sWBR
	r13tzn+drY1nRqwhSpzgqt7/HjtN5e916he9LU1f6EZPwwmruglA7+pZj7iosQ00NF31NDwUO6/Hh
	Nu0TGj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QUN-00000008yXz-3gct;
	Wed, 23 Sep 2026 17:10:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QUJ-00000008yXO-444r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 17:10:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGThh22470172
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 17:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9mhMgPy0NdyeMrRrzvm3C/TebfdiGs7bXMmAUtAocDI=; b=ft5VuPmYL51lxpZ0
	4GAQ3LMXuo4MZIC+nTmJG1iBYfzA6d3atgbfi8aG1C9GDd71+o7PQxn5O1uRiXQD
	oQD4dERlABtQlZY+XT1gmPmk+XPAJ4uWDdC/8+tgd9kpoaKFxStnlLzsGzJNThRa
	Z5vBx6+uEGv0uCl51DGJp3einpnNixtpQF2hEgNhGGjnuTHlduCy7G7S8HxGosIA
	f+xOvRlEs6QhYb3u5qEYeXUv9Oj1DXkPzClvvTDohofc4AibpkGwgi3AvqXUTzEF
	wnrbhTqOrlf4/NonzQGAjEMnQfqHV8k5g0ziTsgMDwqWypydk2N9PHDt/UTpV0Bv
	TZbI/A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv12ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 17:10:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e18af9f48so64917a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 10:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790183431; x=1790788231; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9mhMgPy0NdyeMrRrzvm3C/TebfdiGs7bXMmAUtAocDI=;
        b=Tdl7OaTe+l/kH3s5gBbyUkl5ApEDE4iH0WGymNzxSZTsx+yIfmxgz3KCrOZgcC7kDN
         l6q0SsQJHYl5RDKeKt7HIhgDKp+hbTAAsLJCygsv0kVEeQZ1patd6XVq2csjVncwCu5X
         u3dHPLBinZt54U6+zhBkPsFofut0HA5ggN8h+gmM5eS6SdJSbo6pqWsAQit1mbBl2w4J
         i4bB9TqK7Rk/NTy6ZzyJH5VeJqUFpwfGYyst4KCykpq+cD3tegg58KdBzTJQ+0CixMHU
         WCfjM6d10nNT2es/OSp7/PSqQZih4AbiS/rQv2TS53j+DzHuLYxLU6A2Vj2FbrUejGPM
         Bmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790183431; x=1790788231;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mhMgPy0NdyeMrRrzvm3C/TebfdiGs7bXMmAUtAocDI=;
        b=1NFeXZ9QfAvdTHSoNUSoI4aBzKLsLHwPxIXaN4fcj5HUH9QDdnuosGthRyX2kmZ/5p
         PZhBzNhuuCHbZyWKVYAVgwdBcbocbBkPaotj7e49E/ia2aCcIX179RV78kIjrqKqGAiV
         hxiVLFQYwfe2e86XvloeWuUn9cCcS9LOVdDxHOjVT6YZgAx7Xuh7uaYgLggD52jSOpnQ
         gJcn+5auPfh6FZJZCILEBO7pcnc49JST93juQlpyK7chf5dpxjw/3MvISSDz5sCZkB1A
         03s/9eAR4GgxqT65lHk/JnBDv6IHGReNsXFuv742XEPdAECgobllhvvlyRhRHr+siKq3
         ge9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzjSXn21d0f4lciXTl2nhlF0NJkUzhZAcHbvjYuKhqebq3wtFRzQOPTN7dbKnrMnNasBpJG1NiqAaTRxSMaRbHJ@lists.infradead.org
X-Gm-Message-State: AFuF++nASjebTqhlqsqTzO9B4aAq8+6pbELassjWmx4W9BAEPhC6nQU+
	9ov2pU9vVQaeoOVbV1/O187giMqIgUWCCC+ZNZeqMFL/l4KHS/tcxL0Ebwxn8suM/2xR0m/Dfrg
	OlX5puowfROig2hddW6OICsbwR1O7CrimMxQC4UmtHF7unw/mCNifjf+0xP6rU156NH/MOFWmwP
	D79Q==
X-Gm-Gg: AYBFou3yc7tdDJax4thDZ1sg0tc0lCD5ESuk7YtMpe6jkNFKnIHZS6GkZ4qdo5b3aYg
	+5J9dQCrztZL4/tdxgEs29kRm0Yxgqj+Ypb7umdIznjzUNmL5gIh9gliNd6QnDL16OA77LWdjra
	K5Q7si0u4H+EXZPU+O79Ftx/Kn9jz6mv380+HTs+pERGaV0ZJgVsDzM0fVE8Sq7K8ybLYz/v+Se
	5BHbBHdGt7na1XzvNV68NgOWw0qFtZ3rvKVeM0WfcLAASeTxZeocT59G3mxZXPk71rRySQTbz4P
	WCjeUC2BvRSrU/hgYIKiZSBRpD595DOZBBMw4K+AiVs08WWsUK0TL1jBl8s7iNTnAOTxhdY84AM
	Ew+nMejkUNdfjLrCk5Ki1NHfN6oWJL00V/Ed8GM1p32ZrhP4IZaFFEg==
X-Received: by 2002:a17:90b:4a0a:b0:39e:16e3:44f7 with SMTP id 98e67ed59e1d1-3a07308cedamr4172363a91.6.1790183430470;
        Wed, 23 Sep 2026 10:10:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0a:b0:39e:16e3:44f7 with SMTP id 98e67ed59e1d1-3a07308cedamr4172334a91.6.1790183429947;
        Wed, 23 Sep 2026 10:10:29 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f409f96sm1480850a12.32.2026.09.23.10.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:10:29 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:10:26 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Radu Rendec <radu@rendec.net>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] irqchip/gic-v3-its: Drop ITS node reference on
 its_of_probe() errors
Message-ID: <20260923101026.000034ea@oss.qualcomm.com>
In-Reply-To: <20260923165447.619477-1-oss.patchbox@gmail.com>
References: <20260923165447.619477-1-oss.patchbox@gmail.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX6fTyHfS/r3y0
 TBVnFn1zmDdK4QEPGl5cA0MKRxSc67pIORguzoy5HH9Tl6hXEhx4GQ+C9lzeuhUInpEvhu3ETwQ
 snKcapjmZL8KU8omj2/Ag1Noz1FYVv+aQFUX2V4QgE5GOfn8379RkPGfRURffIAznzq48IOYxoI
 dINbfnzlkea2VnAlU+UhNvcVmpDc+Wg2qNuVmB8gs/nyQwmqqqt33yxpY6AbA9ecQblEwteFKux
 y6fFzOLibReHMfjSMA+K8iJwOwOjpHfKqld1RFd6G+JnpJSBGD6xLcn9yx6vB5dRNPXOVREtezt
 IUr2agzCoiTIdSPyTA0COHs+gGBQURYxsCLyQu+DiylCyHKfw8fKjx83RP5zHCYeZvM8m4Z8kw3
 +LhqyZISk+y1tOKPkSfvZ8ofBdcCs3iQNEG78Eihq1wNYbxIGztzZB20vWmKw1dwejdaj57jkdd
 /t0tQNPvuoKCK/cie/w==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab40807 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=4U-m-mCS_-ka2SPo4XkA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 1WYkYWG1-9YQ3pJ_hTgzlDlR47rE_YoE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX0YjHHAw3KAta
 RU24hiM2al7AUEwN5ZgnAsuAZGbmgLotKr62XMawUTmO8AdH6W6hPpuaoXIoeYnQjI0NYvO7LlB
 ZKOJBOhLEslnKq6IzOSsnPMcUQNWPN0=
X-Proofpoint-ORIG-GUID: 1WYkYWG1-9YQ3pJ_hTgzlDlR47rE_YoE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_101032_088458_3B1F6D5F 
X-CRM114-Status: GOOD (  25.81  )
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

On Wed, 23 Sep 2026 12:54:40 -0400
Yuho Choi <oss.patchbox@gmail.com> wrote:

> its_of_probe() walks the ITS nodes with of_find_matching_node(), which
> drops the reference on the previous node and returns the next one with
> its reference count raised.  The loops are balanced when they run to the
> end, but the three error returns (a failed its_reset_one(), a failed
> its_node_init() and a failed its_probe_one()) leave with the current
> node still referenced.
> 
> Drop it before returning.
> 
> Fixes: c733ebb7cb67 ("irqchip/gic-v3-its: Reset each ITS's BASERn register before probe")
> Fixes: 9585a495ac93 ("irqchip/gic-v3-its: Split allocation from initialisation of its_node")
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>

I only took a very quick look but why can't this use for_each_matching_node()

That doesn't solve your problem but it would be easy to add a for_each_matching_node_scoped()
in similar spirit to for_each_child_of_node_scoped() I think and that would give you a cleaner fix here.

There may well be other places such a macro would benefit. I just haven't looked!

Jonathan


> ---
> Compile-tested only (arm64 defconfig, W=1).
> 
>  drivers/irqchip/irq-gic-v3-its.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index e9807af23537..6361d20bd920 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -5579,8 +5579,10 @@ static int __init its_of_probe(struct device_node *node)
>  			continue;
>  
>  		err = its_reset_one(&res);
> -		if (err)
> +		if (err) {
> +			of_node_put(np);
>  			return err;
> +		}
>  	}
>  
>  	for (np = of_find_matching_node(node, its_device_id); np;
> @@ -5602,12 +5604,15 @@ static int __init its_of_probe(struct device_node *node)
>  
>  
>  		its = its_node_init(&res, &np->fwnode, of_node_to_nid(np));
> -		if (!its)
> +		if (!its) {
> +			of_node_put(np);
>  			return -ENOMEM;
> +		}
>  
>  		err = its_probe_one(its);
>  		if (err)  {
>  			its_node_destroy(its);
> +			of_node_put(np);
>  			return err;
>  		}
>  	}
> 
> base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4


