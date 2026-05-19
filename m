Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51ACCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 01:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Pgq1DCRhxh3w2geotao8iZxv8LzDha+tYB2biNcGVg=; b=mkAtXT+eCA/9tPcIU1usmF9QOg
	DEUJEjfk2rv8EBtjpV0pmvpcHtYeo3+g4QcPsnQC6lpqD/c13pn3o/5F1e3S9JTGSE+H51x9pf53Z
	QPM9i01gIdkKVUuU0RQBIWxb2HJi/2l+LjS1eR2g3CqbQpC80q2VXp6kmNhO5z3qt/RMGO/THiAnV
	rvPlMb83lBqzga47nXm712sfEFCR1/bG2xmt2cOFwHq9ta1B8gP9yak4RvkAT8G+eO97rAoWJpp88
	ScsSzQ2KW8eH+5rbkDqC1x/UhcqZgW6bX8W14yeS9y5VfakTITQ84gtVEqlclHMzb2tgcDnH+nIG8
	xO/Zf9PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP9EO-0000000HMWS-3OdX;
	Tue, 19 May 2026 01:26:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP9EL-0000000HMVk-3jfb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 01:26:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ILW1oH2891993
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 01:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Pgq1DCRhxh3w2geotao8iZx
	v8LzDha+tYB2biNcGVg=; b=p5cDsLgoOpzHCl4Uy7kxrXdGkGxwM0wAuq7kU6zo
	hWMQMPDQ+K/B/qVz95z2RsflJTgTgBEshu4IUfA2j91V5FN5brqHcQTCO3u7QMK3
	nha85kfzDR3iN+bmVFFLw7qOfqv4vojnoM4k3l57kMopBKmZV6z1Pc3HNyulVrjg
	nDdpNf23VUlHaYupZrRLsnlEEgQqc35haKsPAm3B0uPdZfdmaJ/umbl74HJFGHeb
	rbLTsUFRBnXg6HikIy2gztYa0G+cqeYQn190YRBgdr5hocvTkDygFWEfsikKGShK
	znmFL4dCr/IJput/RclK+TBjf8bZjakqL3sV1gEWt1LuYw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk1bsug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 01:26:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so1562547eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 18:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779154004; x=1779758804; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Pgq1DCRhxh3w2geotao8iZxv8LzDha+tYB2biNcGVg=;
        b=XE3hCc0bMxwlXLs8L31id42+YHorCNR/VeDy0crJj4Gcb+6E/wFSwqxxr/oW3LZje/
         eG385vcbWXXfxJUyWUuwsXxmX7EJXjdO4gX/+XwWPSyO5FSr6FvpPAlgTeGNogTh0fxW
         LMbIAlZjqgJguh92DLInGe+QLs+7vpZnPEv45b/QNY/EOWLcVt1JkPbwWXa4t6XjosbH
         9FLLtZecG4+7eGiixdoRpGpx8aKmW/zsMLlhE1boAjwPxeCmXYhErhQ7tLB5WJw+jeaQ
         aPLsnUU5sB4q8F3xIEXhmHKGPkAQA5dt6y7VPzxClbkgWKfDPHQq+2Izn3Ds15LNTdGl
         OiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779154004; x=1779758804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Pgq1DCRhxh3w2geotao8iZxv8LzDha+tYB2biNcGVg=;
        b=aJrqxFI9P6Qq/4/HmwLQRglUFPss1ZmvSVoNhtOjHItxzMcx66WHTPIdBK45bofjXv
         qMBsQ7KHMt5/pGfZtYhrIvkn3m9MWKD+upvVJ6fMD9CUlweCGK7LOcGOhsfy6yDkjITy
         /GTeX0nZe3No5PPuHoD4MutQv190fm0lM2yc+CTlygTmAhoMeGHMmlpWzVvlkH2lT+lD
         5Z+JGslPAcw/uXvupi5FwCRpmDntYw8sOvcKcu+YMNcvtFi0TF7pjt1Axc7ZPkmZnzC3
         d8HmY7bVjDnB5zYTZkssbTuByTYfP/rnLAkBVKF1BvsHIjZWF4nKayEoaKKIB5Yo9lYL
         hT0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/sJfQY7R8oM48h77O3op18t6Ds2aIaPsDqya/YuElp42r3gViUsCMJtkkNTS12DS/1B2o5GQX5z6NLwmv5L/Kw@lists.infradead.org
X-Gm-Message-State: AOJu0YwKDApSfGHRlLl7bn+xsflq4zP7lLklbwMeSCBBgishb/wS7UQ3
	G1DFPzw7NemhSddWR4hX0FKLE0SFwY2cA/tQ3hCTP33pD0gndK5GjbPTqCOXQt7hzpqKq+4AwrC
	8fRbZ7fxHRLbJmw6PJUUbM2CpTZTpQTyW6uypH11zDKZ2lt2cFG2+aGWFqP5a9VJNKqztSCqS3Z
	jNDboMjp/Le/MI
X-Gm-Gg: Acq92OGCkql+BKSgtNLYgbaiZ4iL+kzUvVK8KdzN8fcb7yXSb8XiZembveLAC3qqV8r
	WwIuXK4AiAkg5CKS3VRAhIJX+0I46vRkjhYPaTXEuNy5FtBeRrv/mz3qP7QRF/YbA3O2ZfN5raN
	vqwrVh159oXzE/mVD57Ptu9uMdLsl0texps8tbeWYcTMFAv+bFhVYrm/Gv/jZK6c+8VFkZwrTEB
	bbifhaxvM+3J5k9LMi9nq2cAIuk8TP242afsAUQHfyud8cBQPAPQGOmnA836YfwFicb1yB3MTc8
	TYJh2jFdHAbsUtlViLep2+hAj/X46TS6lYE6tYm8monumEjI+GfALCppYl2SieFwkIs/aYQyMn7
	gu+7vY0P2UiXDd+pkuupi8ReFTId0HF5CBIdMZ30jWyRp8/Ll7nQ7ytxwOgWg/kfc
X-Received: by 2002:a05:7300:e125:b0:2f5:6d9c:7156 with SMTP id 5a478bee46e88-303986814f8mr8376360eec.17.1779154003776;
        Mon, 18 May 2026 18:26:43 -0700 (PDT)
X-Received: by 2002:a05:7300:e125:b0:2f5:6d9c:7156 with SMTP id 5a478bee46e88-303986814f8mr8376345eec.17.1779154003281;
        Mon, 18 May 2026 18:26:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978b1a79sm15050372eec.28.2026.05.18.18.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:26:42 -0700 (PDT)
Date: Tue, 19 May 2026 09:26:37 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: Constrain clocks for newer
 Qualcomm variants
Message-ID: <agu8TRpjYRqs0Sja@QCOM-aGQu4IUr3Y>
References: <20260505071453.34000-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505071453.34000-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: q3LMwxrnn7FCCXq94ef2yd0djwdZ1okr
X-Proofpoint-ORIG-GUID: q3LMwxrnn7FCCXq94ef2yd0djwdZ1okr
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0bbc54 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=I7k1zq4nAz8js2EDA9IA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAxMCBTYWx0ZWRfX16XyudjtizGm
 OweXtrZBtuiMGtOC/GLq8S2lEv3aTEDX9wVytM3Kt+WtI6pdYZtPz9fMv+sW+1So+WIbMWfygn6
 ixK3LRJK0GkNUDx1EWmQyeSslxSQf+WXcpkVyXcLUV/LKOzSE46QhLBC6vHlQ2hk2wBb7EORq25
 ADF2kqOen6mW8998z1VrbkyM1gPMnOaFyLq/WtbE0dw9xgEply2klGf1ws0n/vtLSEqYBjrZFOS
 JLIqfb2ROYlZ7DRr16U3Q3lFrlb0Pkyda7yFrf7oApmlFj4I0V9/j6dcMiwY8YDe17Sn0+3zkmt
 yd876JfiZdpDzBxdRD4hZUm8L2NUQn/hk5csaruO+lNQn93I4veBO66KapVW6pFsnUV1lNn+Q7U
 IgEE3RCTwEIlmzvC0bHspmnyIQBlPMDm3+OwWzNChxVVVeIx9NgnV9XaFDPoTgAnV26PN6csPyi
 AcYnYDRFW1ZjOjPI0wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_182645_932949_FB0D7F2B 
X-CRM114-Status: GOOD (  14.97  )
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

On Tue, May 05, 2026 at 09:14:54AM +0200, Krzysztof Kozlowski wrote:
> Many of SMMU on Qualcomm SoCs come in two flavors using same front
> compatible but a bit different fallback:
> 
> 1. For application processor, usually without any controllable
>    clocks,
> 
> 2. For the Adreno GPU, with some controllable clock(s) and using
>    additionally qcom,adreno-smmu fallback compatible.
> 
> Add missing constraints for Glymur SMMU on Adreno GPU and several other
> Qualcomm SMMUs for application processors, to restrict the clocks
> property to a specific value.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

