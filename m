Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3349C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8tOw3w9WOlBwac6L5boAJMWocybycmH2cMyGQykxKE=; b=Pc+g1AfB4VWiHh1+seiM9Fc0Y4
	FV02mx6hHlDH1x+dUD1Djn3RF7Dub+aicqhOdKeuFc5ABKw28GvX3srBT9/GLnfn+joCZzdzdYA+0
	mqCkeC9nliqlyQie40Xx8WS3wO7jpV8le563gRPCBsaUhFHIx+eqjxR82gxoAxp6pAqRjvz5pwaGc
	CfReB4uDWXdekiEFZS/QxG6soPpo2tIotQYXTBpo3SVbEs+EtC8GRNI2P2s+h2lhrz3QsQAUe3FbW
	nz9LALoQfH4/q7JOPPLZkp8hXYHmzBt7X6VAlewznX3mCQxjOsAzTdNourZXHx2qAMDv9kptM8o2i
	0zjWFCFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ml8-0000000BfVg-2rnT;
	Thu, 24 Sep 2026 16:57:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ml6-0000000BfV7-0ghb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:57:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFfQFY1279336
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 16:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8tOw3w9WOlBwac6L5boAJMWocybycmH2cMyGQykxKE=; b=pMi043bE6QGr1lII
	pZb0IyUUMlzTpHxw6zL3pxwMkGK8zJVP5wf0pJMCdoiBDmqx+axCDSvvbSt23IG+
	BXfrMC1Wk6A8fjtC5jzeO6bz4MdM8/VtpzpX5o5gQfB8x/IaQ8q666ePw+XLT9jY
	hN4i54agbS8Ri8oQRajPAwr8WtpfK2LI6h4DcFh427uEJSvVII/M1WCRWYDpOEF/
	B+o+xUmeg8peBe8ZjmHPFWGCZMUcUluWBmV5cZiAO5OaeKNYVATURT3c9sJwbHjx
	sxtv395HGmucKB5F44AWHi/W2FjQSSkoJZWovi/F9mNyWsryNblI5zIHqqEqpQPI
	dx6LCw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc9rk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 16:57:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so134483a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 09:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790269039; x=1790873839; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M8tOw3w9WOlBwac6L5boAJMWocybycmH2cMyGQykxKE=;
        b=g44CAjsHVlLre/FIO4LHq8elLFsh6QFHF5pYgz3vClXLumPEcPy8KU3bpxs6D2G08u
         q6UbYYZSlQ5vWig9JPqIinb30DuRLBDJH9T1Uls0HvA/D2whfNrbj51H2vNPrtbbnJlp
         2m76Z3rZOAjg1WlzsTtaGQ7aeaCX9qZ+cKJh5ZerCRyBgC1o42+/q5495aXGkvyVPaoT
         y5POD9wawgvlMxvaJK+fz1uQyxJFHyutUgxZheKWeHJ4lScONHuwF0gtfK8goN9+J2ec
         altFHka8CTkNouoqMlXZfDs1VRLbN9fVjPy866OnA3EwAol/WltIKDBa9hcmzrIuVMqQ
         9UJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269039; x=1790873839;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8tOw3w9WOlBwac6L5boAJMWocybycmH2cMyGQykxKE=;
        b=0slqxTIRm9LUe44npXuL14MLn3f2BmuKUB2pMGnqmkHjJMEHtBCrns2iJeqX6XwpTA
         PGn0FwPr4vbinfc4uR+lM99c53c10kMkhd+XgACGY+m3eLPxiztMhvp+rWKzg5KZ5LFp
         RDvHXSL2egclMLXgCSUBESOzokk5HpcABkG35kJn9ZX3UUrGXAoAuocYc22Q8GGSkAF5
         8uMt0mzudTGwLIq2GshxASGx6kj4vgmEbo0VruGdo+psd7tN2bdlYfEEZ64J8mouQGrr
         yZv5IM+p3P+Hc6k4kn980G37Ju0AI3PpycVmbVc/DzNBPGTgUxRiBsArADMapGBgjuY6
         hz0A==
X-Forwarded-Encrypted: i=1; AKwUvBxOssWiYf/d5IHwSdRFvH44RdnLVi64D1RmQg/qzahKDcpm0pbB19a0MKOqfo+WynbgQmqEqYNIdok5uKc/X1KG@lists.infradead.org
X-Gm-Message-State: AFuF++l6QdIOVnFQYguu/jy/1YlWSuEpzqAcsVRtLGgCvE2Wzy5PbHun
	Iz3A/N89AtwcyTsuvo/3YlYF01tHbjWKZyjWItTOBqIdrXTuliE9y9fFp2trOab1HTPu4h+gfKJ
	rz9EAQWBGze3ejTCKxBFyPVVLjOjJEj/mjkLvcQ3ZZ+EXcfj0JVx97iixrcw5w+0z7KpOLm3bAR
	z7+A==
X-Gm-Gg: AYBFou0LWVBuMsjZzd+XvRV7rJNkcWfl4szgjqAkk7yAFJV/ojp09wUa+3g8nbnWlCH
	OIzFSCPo3mkot3KqknTgmgKb0NDRk3FmZlr+oqD+S8H2UZdTb8D8hlR2zwNFy0ZyVozWxf2GrO7
	jeB6lFjJ8nwNfFocmWiEcxQk6uN6nrA057jIe8BxFiNlG3bbSsT+nGwMexyjTHiwWtnU6kyXnnN
	u6Q1okGRTPbjjkVmlpCkTVpjKkLvJlttEt7MlxTFottXYxmVUgzm4S6g81jxYiThV2Kkvbci7ma
	OlKJOelDFnORrDDnNqumSgpWdr+gD3BLJMILSpZghrusVk2MU/So7M9xbH2bu55SNmiNw+i7LXW
	z3Leuc5Zhq8Wyne/ayDwpYhx2svA90WVBXav9LCXkX6MdP957IiMYUg==
X-Received: by 2002:a17:90b:3c0f:b0:39d:eda9:febf with SMTP id 98e67ed59e1d1-3a098da4171mr3197744a91.18.1790269038455;
        Thu, 24 Sep 2026 09:57:18 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0f:b0:39d:eda9:febf with SMTP id 98e67ed59e1d1-3a098da4171mr3197707a91.18.1790269037987;
        Thu, 24 Sep 2026 09:57:17 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm5687417a91.13.2026.09.24.09.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:57:17 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:57:12 -0700
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
Subject: Re: [PATCH v19 1/7] firmware: arm_rmm: Add SMC definitions for
 calling the RMM
Message-ID: <20260924095712.00004057@oss.qualcomm.com>
In-Reply-To: <20260924135201.850038-2-suzuki.poulose@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
	<20260924135201.850038-2-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VIZLUqT7CQ3_w3AstzZrFIqaTN13bkD8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfXwlU1hbnq7KEd
 I5RrgYxzyPpRod9TXYlHBvoLDbxYFRKvosv5KJ2pYG2CqJ+USqPRVKgGlTPs7JgLp8s+ZOWg7K2
 VpizHrvHtqx+YxlGQNFEE/YoyyeIHDfS4mZ8NLSuEG/7E2PuqPmBRfg9W+j5lmp4GMI/rTuSQaQ
 zbHNf+OPE1tq2hk1v2EroB20DinFgeesidJtZIKmgi3qA5ndYNjMcQiD1J9gKs64hOaxC2Dxrd7
 PzL2Lt0SRzVFU4xs3MXyi3BwJr0YtQmPRKdRIGSoq4OqyGVII9cxwNG3oklRJhERVb7u/9i+tO/
 QcK2f6Aw9fJFbZ3EGJqBozNX2WYQrRGdGUKkYgkO0fsewTVG7Re7eb+qobWosdXDdZpx4LZ4RnO
 EIpv4Su6zdYLK/Iq5vX4UaV7B8ozrT4lcftqrc2bZU94TfMDva8oE2vAfBMNG+ijFRikZaJDg/y
 DozkuFKQZGZ1mcufzJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfX0m808dOlE6pU
 vm1NXLyZ3dVa8g+0NN4Dq8mwjCQyE2B+b2eVrYqyiLQRflGp3b83E52Brt04IvK5VsQD2uV9HYU
 ADbU3ZnKByUfWWhs6GuVn6FcBYdQJDs=
X-Proofpoint-ORIG-GUID: VIZLUqT7CQ3_w3AstzZrFIqaTN13bkD8
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab5566f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=SeLr52ClSpxFPvFle8UA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_095720_214907_E6B87248 
X-CRM114-Status: GOOD (  15.31  )
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

On Thu, 24 Sep 2026 14:51:55 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> From: Steven Price <steven.price@arm.com>
> 
> The RMM (Realm Management Monitor) provides functionality that can be
> accessed by SMC calls from the host.
> 
> The SMC definitions are based on DEN0137[1] version 2.0-bet3
> 
> [1] https://developer.arm.com/documentation/den0137/2-0bet3/
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Hi Suzuki,

One small thing I didn't really care about but where I thought you
said you were going to tweak things.

Either way
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> +struct rec_exit {
> +	union { /* 0x000 */
> +		u8 exit_reason;
> +		u8 padding0[0x100];
> +	};
> +	union { /* 0x100 */
> +		struct {
> +			u64 esr;
> +			u64 far;
> +			u64 hpfar;
> +			u64 rtt_tree;
> +		};
> +		u8 padding1[0x100];
> +	};
> +	union { /* 0x200 */
> +		u64 gprs[REC_RUN_GPRS];
> +		u8 padding2[0x100];
> +	};
> +	union { /* 0x300 */
> +		u8 padding3[0x100];

I thought plan was to fold into the padding above?

https://lore.kernel.org/all/d7ccaf22-5bde-4344-8bf0-a5a17dcac0f3@arm.com/

> +	};
> +	union { /* 0x400 */
> +		struct {
> +			u64 cntp_ctl;
> +			u64 cntp_cval;
> +			u64 cntv_ctl;
> +			u64 cntv_cval;
> +		};
> +		u8 padding4[0x100];
> +	};



