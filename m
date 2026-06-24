Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613FDCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 19:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=udgVp90SDPGbIOBxVnWXY1WCLuwoS5DPJrSoPLrCVAk=; b=0fEEoIKv3JSIBZ1xcMFvSd+aWj
	ElsgI8EjB8PXj/OYt4RPq8wnaO3RGMZpHz2B5mloOfdoDsaZqLNS+zr/It6rjBtSpBmYf8AfdlXRa
	CV9anvdlz+jlAywxFMMlag3mQbyQhMvz5xKaN2NNJLkFi6/yKyZ8nNUT3rxVCim3eKNPXG/RvCEBg
	PdyVU0xv15AXWZG0qcBJo5G1wxDHdg2k8pMtL7N0etfHgovf2puIfs3sqJGSiXfy3McfvpBJ0enNv
	DdqpmwVvg4z5PaR2jyTQBtleXyP+NCCVrASrp7EQDPk9IhIOvs18MZn7b//G80xnHZCPCP5MXpR89
	EPl99LcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcT76-00000008GDX-2Qim;
	Wed, 24 Jun 2026 19:18:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcT73-00000008GD3-2zqo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 19:18:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj74q3492835
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 19:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=udgVp90SDPGbIOBxVnWXY1WC
	LuwoS5DPJrSoPLrCVAk=; b=PfZ9dcVJORqePQBzW6lwOsScDqmLHXoFBPAABrVB
	bl8NOEwNJVPz9F9RRiSwOTATqeOzi3U4tl/NWmovo8tLZARr71QzD3Nvj247z/7B
	wUxopQM6lI441zU39Kh5/IbvZ4nbvjK89ycUV8zk43XBo/rCedhW2l/hJlpRX8kC
	xoJWddo8113178eb8tBHy/cRjseMUDJWkS5OrCgxO17s3qsMTuEVCXyHCOeUUOli
	CF+poZdKWpZHRdfL5Cm4weW22j9M0XkyMKZIThomhDyx7d4d/8nrSCQNyLt+Vlw9
	+cF+GD5Umoj/xlmvilnzAt8KiEMf9FoQSjzIYt83hKPyKA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bfbwj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 19:18:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f424d5bso1066184b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 12:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328696; x=1782933496; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=udgVp90SDPGbIOBxVnWXY1WCLuwoS5DPJrSoPLrCVAk=;
        b=KALNwHy4VyACVM/YltkFy10idcDl7zg3ANVTye9UE48+VaCK1DcxOsCLHiRkBc72rM
         wAvGMlARCvaSvJNQTH8xpzKEPAXaaVhJ5cc2gp+mhuxxjZaeWJr91oIi9CInNe6SqM17
         KOm7UolLYPygsSUCZ4K/xJGIGATBb5NlbI3vhDSPKhUltfqHEvryEO/sNXLycsfW1E82
         x4BfmreI85QNsyEwMgcXTNZMS68IETy3l53yfuZKpMagyu3/wq4/vM67Wt6E46Ol2h4T
         u6dRgt9x1lmo4r9kpqCT4pL5E017DlY1g+wqnUgxXgILx0bGrxjEbJtaRQ+cUbmyu6oX
         qHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328696; x=1782933496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udgVp90SDPGbIOBxVnWXY1WCLuwoS5DPJrSoPLrCVAk=;
        b=eIi/2bzcx+4oqpwRdLumbeh0dVLTnyfiSjau0Br20NsuxzbUbQb+zqX7qLsU7ZfoQ5
         /WEGpT7xjUmTl3dmCJ5DDFm/zFsAyaYB99xLPqwK9n/cEpU8SqjDxOdbyfoZ4gN42cVo
         NwMPf9D6SpiHFKW+9O+rPmTDiaT0191krVZWjh/UIis284duDHS1oFwj9L6ceG2xrwHF
         MPPDhHGo9qMW/w56gdLySIeL9V2dLGl9nkFj4o0Mpuw07ShNdS+WT26qY5adjttUOF4h
         iqH5HbqBeBqE7Lqog5CdJ7S+k3ZvbGd4c+48749sJLui4Wmgbi711N7j8qtwLJKCBJCa
         IfBA==
X-Forwarded-Encrypted: i=1; AHgh+RoMUZBmKAecDFtu/XlmoLbeQRK+ZAs0UPMhoESaXLR60esL7VyZhYWrTgXqKF1TqOKew3HHVle3sBuG5/770xHE@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr96HuAwdyNncxt5+H4OeH8PSemIc+7wdTYJIumHUYCOFHdA/I
	Idy+P4M3ul3ioWzHnLqezhXhx7BDdAzeImkyNVIoScOgHUhlo5B4rGS6/BiXqkPU2aDCnwRRv8R
	vox+rQ3IzJF2XmgeuSwzXOzPRo1Mz8TlXjBfc31wtR5afwwzhUazhF+Fmp6bznhF0wgSLs54N7g
	dz0w==
X-Gm-Gg: AfdE7clB6v4/yGhxJmVx4lOBG7OKZJXg4ITLxFEWGqIt6GdZ7LhrbXev31utEJba2rj
	esAEUFI11QBtxCYFqb+CPPjyah/ZT3C3mIZeJTJJBFX6tLKb8qtfDht0JxOPwt5n/Q/+0WoKHrO
	DIVccdFRulEMn7JYMCqhDUuYt7bJuX7qCIlVX+r1hGbqBVTOr7SfdKxYPN15r9ZetzSK4aApjpE
	vWSu3f17EfQVzuqSSdSYrK2yLDM6rcOlMIwE90gXN6iQoeKL+jGRqCyLFtHfroFZyms5h9Nkusx
	vLtRt3gblcKvA72wq/emghHdsWZxk6xPPRDxVX6HSiHBPG0bgaytyIx6ElU76szTHrddTT8Q7w/
	UdCb4eFZfcAkpXA83E9eKofC4p5rg3L1zf1Ek6Q==
X-Received: by 2002:a05:6a00:b52:b0:835:405a:7e6d with SMTP id d2e1a72fcca58-845a2793df0mr5859855b3a.21.1782328695811;
        Wed, 24 Jun 2026 12:18:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:b52:b0:835:405a:7e6d with SMTP id d2e1a72fcca58-845a2793df0mr5859828b3a.21.1782328695233;
        Wed, 24 Jun 2026 12:18:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d272asm2893385b3a.34.2026.06.24.12.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:18:14 -0700 (PDT)
Date: Thu, 25 Jun 2026 00:48:09 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] iommu/qcom: Add NULL ctx check in TLB invalidation
 paths
Message-ID: <20260624191809.pkpppasztzrbnfhf@hu-mojha-hyd.qualcomm.com>
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-7-mukesh.ojha@oss.qualcomm.com>
 <3463e5cf-05d3-4e4b-ac22-699e5f95589b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3463e5cf-05d3-4e4b-ac22-699e5f95589b@arm.com>
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3c2d78 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=dwmHPF28QfX-zPQw6RQA:9 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 9hc8Liln5nDWTz9B4Y44S3uiwSQbUqi_
X-Proofpoint-ORIG-GUID: 9hc8Liln5nDWTz9B4Y44S3uiwSQbUqi_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MSBTYWx0ZWRfX+6hjh5gwFQiW
 OlF+IP6n4EiTgzOnrGYhjsb6Dx/5frAxfW1FlxPr1uKMhfBsqt7ivMlkKeeSZOj8XP+orWvtmJ2
 MveVkePDM/AMWot49y6uCaM6wzL6UbE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MSBTYWx0ZWRfX9kQ8UNDhowZn
 ICKrnjflq2NegvgToU96Q+2Xw/yTbFBGl2TrG4V3ibPIKlrvqBCKVzjHOU1KenXQMvxO4S321zb
 GMZDt8lhJYlA2F2kMEUT60l5g1k6vNSK9sO1TUFQqVMJhcvHkuWBV/AVKkylfFyhH5BrbiV4H5D
 0MZXZFUNedRy+Dto9oAm1oQv78AttSY4TVY5mBLieo8Y9iwWDldfyWx+4dXa6DYyyJzdwSi2TmX
 4AIEzJPsmgPlwd4fsArYVe3m+mK4TIrB+CJ7ToOg8GmUpcOPE/ayxrfj0sKOTqysA1WvXqFmCGn
 T2uruoYiytVDI0wxPAxS/Fjo16Qd/EsJwRCOVIPD+SwkOfpfg4D40uNVFEjBlzKiBU29TC5kRlM
 JYV5KyM4MQUCyDK9G2ryWpvZN0SK4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_121817_759611_CFDFA098 
X-CRM114-Status: GOOD (  16.53  )
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

On Tue, Jun 23, 2026 at 06:08:08PM +0100, Robin Murphy wrote:
> On 23/06/2026 1:20 pm, Mukesh Ojha wrote:
> > to_ctx() returns qcom_iommu->ctxs[asid], which can be NULL if the
> > corresponding context bank failed to probe or was already removed.
> > qcom_iommu_tlb_sync(), qcom_iommu_tlb_inv_context(), and
> > qcom_iommu_tlb_inv_range_nosync() all dereference the returned pointer
> > directly, risking a NULL pointer dereference.
> 
> But if there's no context bank, then how has a domain been allocated in
> order to permit io-pgtable operations that would eventually call into
> qcom_flush_ops at all? Can you please clarify whether you've actually
> observed a real-world issue here, and if so how?

You're right, I haven't observed a real crash here.
qcom_iommu_of_xlate already rejects any ASID whose ctxs[] slot is
NULL, so a domain can never be attached  and therefore
qcom_flush_ops can never be reached  with a NULL ctx.
I'll drop it.

-- 
-Mukesh Ojha

