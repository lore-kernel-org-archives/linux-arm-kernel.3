Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A40CCCA464
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 18:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zav+Gjddp6UP1v5C7q5ymScI+/MzyvRDI+1MHC1/OuM=; b=y9zIjYX5fAAwigKFb8DLIgaemZ
	8hSiNGvqUdb9bj2Ri4pIKCFXJQpx88/v14MullTJ65SeIBuIMLAZ6qLVHxLITPGbigzwdP8jCMIJp
	Mmg73H6Id7BvGtyqbniGl/12SO9NRjIG5F2VT2pB0qPUp27SHSkUgt3FDYPEpVH7C9QWOSFsZ8if4
	UqT/OYY4wG0dqZMjrD6DOgHgboVDvIXm6H/KkYGvmlQfPOpdo0I+KOT6VVY9QKcUv5sQngQrfGgnh
	U+BzoX+lLOYdjzgv2aPpp3/d10NkSEy3bXwegf7iHgprcq/yFjaZDH+8aNoS/WTI26ONu4soZpRlr
	wYa26Rqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQDs-00000001A0w-0R5F;
	Thu, 15 Oct 2026 18:30:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQDm-000000019yp-3cgd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 18:30:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FGkGTv4100213
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 18:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zav+Gjddp6UP1v5C7q5ymScI+/MzyvRDI+1MHC1/OuM=; b=WeIsWoEmXtI4pgs3
	30zWbkpt0e7Eq5oUsCE5qmQXaB+kxxSzLNk6bDIuo3NvK3EE48SmjiV/30RrFkjl
	9dqofsGYtD/yEaumBFHgRVrqmfvD4ouJRXzlixOJvKGmnOiDDSkmqybyfMNtnozu
	w2O3LBcL/ndil+0mirjePNvELRDwx2RxkVe+NG9S+BvemSor1Hl/K2aaFOq5y1dK
	2aLlkg6+WA1qcili/sjWyAV+WXw67wskVnrRV0LHOzMCJfLAWoiw5qS4FtPrnlnN
	Dg7KfSYx+BpolQ3K69ao40Nd41pChGrKs6tDWbM9cnsdFJE0Wi7DAcpmzinYtamI
	luTZ1A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r9xvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 18:30:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so7193164eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 11:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792089025; x=1792693825; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Zav+Gjddp6UP1v5C7q5ymScI+/MzyvRDI+1MHC1/OuM=;
        b=HJgnt/4HQS9Y8x8NbpaSiOg1s8aK62DXyld0YVbeTXZCuZDcxSCb50VEA5QASiAlQJ
         NGqlKSX42pnylX9GeoCG7WqhDYzE/wcSxr4ItXpUMLbHmkrCkfpJX4FuMy3+peWj35T/
         dfupIvz/pz3aSaQsSZZZL3B1VzcCfVkdcbwjnfxPNoEtxMV8GKbcy/z4YmiQtDJfZbNO
         kQDNdHpbr0K6W96zqKvF0hm69+WK+aMRaaVk5oGxcvAxfj/iIXhUJkIjAXyA7fwnyqD5
         eidXrVX2mD+cpFM/aN2OEgY9NOB7Gfy8mzivyl9QhRr18wOULho2kLbIiZrDnkHiXgd7
         o6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792089025; x=1792693825;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zav+Gjddp6UP1v5C7q5ymScI+/MzyvRDI+1MHC1/OuM=;
        b=gWrhhLMiIphotGhmowTEMsjudGowHTo9lXeo6BLsSO5A3AulJecGc1xsi18NMocK9t
         FAtPOiMHVnh1vRQ8Sm6/klRHtYMQ4odiQ4QmkLXmWSiZLYttsaQ+IH5K3hgDK+pvogGt
         ztAvFbNgDVBdbgCXTRr/ile7CSYTjTUVYYv7ojtsxqAumBKeSulr3ZqYT0yJZGUlDGdK
         srILORbSaE0HU5Tcc193m2FzGSSGO8RPgOpIr42I5oO/phsuq3atN0e8WXYjcN2r+gH3
         9FQ2RKc0zuVSiNOR3yL5ljaryHPAfW4rIQpG43HQ9wZ6RcIE/tEUlC7fsWbg9h2lX8T3
         WIuA==
X-Forwarded-Encrypted: i=1; AKwUvBzd/ZfUFwMvnnWsB5mFX3J0e9eRqey6qs+LvYFXBicij9O3NqIZMbQgINVhlynYEaNBkhsWAUGh2GUbk12Vj4/j@lists.infradead.org
X-Gm-Message-State: AFq9FYLDbXoi31Cuh1Dzd5IegUiQIvg11CeHjw4NdIuwOVZvw7B8Zo/Y
	QxwB4N5KQhuvruVun16i47qzQfsQxk6yuYvNpnQg3bXZGgTrPcd4zUFOFzrmeKadlrkCK+YGgpV
	16/y8d7zSFHsbgBdNbx2hOWq6WLOv4H2S23YES1+aTb3oLrEn8gnVLhT+tDKTYDuz3FADQeZ5lL
	2HdQ==
X-Gm-Gg: AYBFou3bXR2bRmqlMa2xIH/k4BHuQMKgjRJ28xHablrMkysG19PANo5ArEob3bzjXnF
	Mj/OQkC/r6m4mp3Eij+YZlZd53NU+ly37Vv8+gzV/vk6dijT5TAQJ3/WTCAc/fPePcJAVbuUT5z
	jWUXXB1DgQn8eGZ4Z6/KaiHXePmVypHE3cXPpkqJ00Ii7QvaXUYr6+dAjE1QbRYUb19e0PKZvlp
	zXzwbmjoumpD77XebDEWB3bx50wX9UbYGqNODhn5EltBYbcmVPQU99nnYlUriiM2jtUxwQv2eax
	J2cZ8dpXibQ3/qsH5bFuGKdbnQ0g4BOB1Ekm4eDUwLcp+Ct/dwTcZmq/gDXq5PKZvquTheeLBNi
	Hmt+zbG4BIATYjegY3I+MTKrY791ITLs1eQm6rnKOlPabP8DROEMizQ==
X-Received: by 2002:a05:7022:170a:b0:15f:28e1:7c7d with SMTP id a92af1059eb24-16a61d5c4f6mr23763706c88.42.1792089025332;
        Thu, 15 Oct 2026 11:30:25 -0700 (PDT)
X-Received: by 2002:a05:7022:170a:b0:15f:28e1:7c7d with SMTP id a92af1059eb24-16a61d5c4f6mr23763653c88.42.1792089024649;
        Thu, 15 Oct 2026 11:30:24 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a16488dbsm665948c88.3.2026.10.15.11.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:30:24 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:30:19 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Srirangan Madhavan <smadhavan@nvidia.com>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org, sudeep.holla@kernel.org,
        conor@kernel.org, jic23@kernel.org, catalin.marinas@arm.com,
        will@kernel.org, andre.przywara@arm.com, aneesh.kumar@kernel.org,
        Souvik.Chakravarty@arm.com, treding@nvidia.com, jonathanh@nvidia.com,
        bence.csokas@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/2] cache: add SMCCC-backed cache invalidate
 provider
Message-ID: <20261015113019.000050e3@oss.qualcomm.com>
In-Reply-To: <20261013070205.3566865-3-smadhavan@nvidia.com>
References: <20261013070205.3566865-1-smadhavan@nvidia.com>
	<20261013070205.3566865-3-smadhavan@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3MyBTYWx0ZWRfX+13lvhRkHZ4f
 gTOyalSC6Bj4pDs0upKxwaMY+hXY1rzUZ6OUDmDPMEqg5ZopCmzKKQZR6mt4ovf1LqjiDxASf+i
 WD0LNRc8EFp2GBd6M2atPi0Wuo2FcVw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3MyBTYWx0ZWRfXyAKkRPV6z+AI
 Qg9lvqINDg6EY8QY8N4vOTBy/GGvguFVw0vKRxWRcQUn7AkzE7olxw4KVfd5Dd+H+NfwqJb8FP5
 xKcr5a5TShXUxxAd/SGgya/1hk9r9OTVu1uRSOLJIXU8Vxvh97mdZv/NKl1hxXNqryyqlAqYs4s
 dYi1yob50N0dC2R9NQvAYyMc764LhoEsa52K+tqd9Y9VctX8xxKLvdfu6yb4nKFLu7yIXb2jf19
 ivAhkvAisRFPSvDH2oU+ZyrdjoWdadBiRDe8Pnx46wpsW0AUfwEH2vCLaPBS+I78ODnEZrlJio8
 kI2mDg5Ux9i4I+XWxBZxaJqfjcaabzdd1eg3hGq9f7RC58p6Fq+RRp1zzfng8tQjfeo7AFUE1IO
 Bs4d+2BJw3lsKE60yA8hpMR13WdM5C0AsqnKXEi1ugAbB6ZdlueyvdaZNF9nf0gfatyeoT/L9q+
 FxuysDg7kV4uaBPYzqA==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad11bc2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=24jIKSGD-yZtkObPp0AA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: Lirtv1EzgAAz-5ApOn2pNusUAVrAfLfU
X-Proofpoint-ORIG-GUID: Lirtv1EzgAAz-5ApOn2pNusUAVrAfLfU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_113030_940778_74D73771 
X-CRM114-Status: GOOD (  15.26  )
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

On Tue, 13 Oct 2026 07:02:05 +0000
Srirangan Madhavan <smadhavan@nvidia.com> wrote:

> Add a cache maintenance provider for the cache clean+invalidate interface
> defined by Arm DEN0028 v1.7.
> 
> Register the interface attributes function as an SMCCC device and bind the
> provider through the SMCCC bus. The provider reads the firmware attributes
> during probe and serializes cache maintenance calls. It handles transient
> BUSY and RATE_LIMITED responses with bounded retries. It also registers
> with the generic cache coherency framework used by memregion callers.
> 
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>

I'm fine with the changes to put it on the bus and Andre's suggestion to drop
the latency value handling. So with that done

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

I'd probably not have bothered with the mutex_destroy() given limited
utility vs code added (I mind that less if devm is appropriate, but doing
that here would be messy).  If we ever see a use of that after the destroy
then something exceedingly weird is going on!

Anyhow, doesn't really matter either way.

Jonathan

