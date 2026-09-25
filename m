Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37017C98328
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 12:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=voQ2O/Dzz6AWd22TDESfkLRIvWXyYSS44IiGTAccKHQ=; b=kJXWY6ZLegpo8oiI3w6x9mla16
	H34PFQOxW9RJF7mMRfpqxKew5QB17S/4bNrN0m0ejmebltVyKLs5TjwCHZpsgmGdjPQAwf80a/b+X
	yUq5BqzOcAvo2yHvtgAJnl8eDJprgItxvH0QpWzNalFxGDyvy/bMKQZjUwd8gl9/f4tuCme+uOLQP
	9zLMQohGPGoywc7O+YUmbCeZjUrRiC+I/mc0KWv0aJEtwbG3HF1m0q/LbNIgfRgOcAgckCslo3FwD
	yeSfvBTCFdQ43REY1KPkVFePCOjcAIgj/TLnKc9RLUmItX8h7t4hwfSNvkaBm+WpkuzbCkg8SWNqb
	mLdJheCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4uY-0000000DIzr-2YV1;
	Fri, 25 Sep 2026 12:20:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4uV-0000000DIyT-36Qf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 12:20:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBV8lY425741
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 12:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voQ2O/Dzz6AWd22TDESfkLRIvWXyYSS44IiGTAccKHQ=; b=b+EXR7DjyDoIih8/
	HSzKykaJj5kLdewcfE5ub/xLBS6N6uqWV639I5n1FU7h3hq4l/YPrsx5JDAm1EiP
	DEOfPIOUVaNtDRle8f9tTyHGIh9caGOwqh4qKvMzFFHwZTu0gTJ9JbMKNd9QRLeh
	24hD5tTLgi9bLxQPNQkvyx3MLuPupxmEQ+IO0/Zs3FkNHRhV514ThJrRK9sdIBAe
	Lsn8ziA3yoRH51UnqRPubv7wNPdnHnexJxTwp/3rPENqzCRmEkTHw4Nb5iMvGtDP
	zl9xEmXub6aeHCKAD+4xT6O88uAW1QVNJPWsZh6PUaYFlxfUM1vp5T20swzcMz52
	NaOlpg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr5e84wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 12:20:15 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8a86a395fcbso8621877b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 05:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790338814; cv=none;
        d=google.com; s=arc-20260327;
        b=BO7Du85srDpNFGj10n/FH+YILFAYAAnu4V2MLVpr0mvDSdefamlELgF29POiVzJVmS
         Z/oxqA3qGrFudGNLAQLLoet64hMY5aFvQ5C50XwWoCRawkdhEoQ6kFdfF6+f1ZFK5bOX
         vgW/PpuY4VewORfNtIOPmVTmrdiPN3q2EPBZc31jBNRTPc8fAnKQknml58wuJUYCO30F
         DbTbuYoeelPv7tcUVT9p/ZDLqn43IDOuT+Loyc+jQWpYaZUahaTEkV46RC67rTCaFv4F
         a32qx7nUAvQTe5foVJiOhF4FC8+AUeQgvYAU67JeWpne76oXGemCS0D9XO3hDZR71YYA
         5OyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=voQ2O/Dzz6AWd22TDESfkLRIvWXyYSS44IiGTAccKHQ=;
        fh=KKaT84ewJaLEYdo7SV4hG+whwjPe0eNKKI6J5TuWzsw=;
        b=noYvc14Ojc0tMOw/SroKWaRnqAFP9eX7RlarAN4FwYFCMjFl4Q5ztiXmdLEsdavwCU
         hi5WmJc7ZrQIlUllJ9rlPHuXBcrk4wn5edkfcW/gmFlkZOdlwoTGEQ9IiHf6XNk5Qvbn
         7oA29kyzoKlKK8jpm/Mmwpm9UqTegTGjuJcjYrdk5f53va1CrXiYolaPCjvIef8WPKdw
         qmNxCDs4azgd7Xq1fKEWs6MxgvmFIfFEakGox5mkyXkSMCPAx/yKLs8/CaoJCjKkMyub
         jyLkJbVwrOJUGC1ZSvil7LhpKp4+yUIi/hhrCxwLVavNe9eMWrGx5k4aer1ILrF/9evU
         GgkA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790338814; x=1790943614; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=voQ2O/Dzz6AWd22TDESfkLRIvWXyYSS44IiGTAccKHQ=;
        b=OjAn4js9kT9kpsnkFXVb2c4OwA50X8bmuuO/MWdrO9/9h/p1O9Kt0cNtdlQNUJ0YpF
         oTxTJcDijlk5crOIq5msI7SdC7q5qizRocb9G/9eU5YlkTjBuSM+U4aAdLPmn3bLbRzh
         oys/vzHVc8DkZtFO4lWwsHulMSC/SXa+xiM0Im/y+X09v/mFvkKg9WvN5Ldfj+cmEvnB
         3LAvsO6Cc6Do+xht+Zs8zAmZUcvObIIjQ/ipX0QNrH+ghkjC25GjjBVDbKIXg1i3x1m/
         FG9gGysGGX0N/r0LIb4yKC1UfvTJBoREeoCN9An5y9/J6QtHcE0VrK5UX/Q2ebyClzAm
         bjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790338814; x=1790943614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voQ2O/Dzz6AWd22TDESfkLRIvWXyYSS44IiGTAccKHQ=;
        b=g9LqNy9P0RuVYLUAXRud0HrUovySYvJySf+jbSiIDZjHLSiy06OEw1KneFgnZHdswD
         16fEMeBS6xO2VTvTmNzw3MKMYTXFSgL6PJWVnbUVPxTI7oAEKiRAQJvk+Edb9nT0snhV
         QAy3zBwtpFdiwfiZC3ouX9MxRSqn+4kTJCqaEs0cNkHBHh8JP3kOpM0ge6dkCC0q4eEm
         0NQ27KRwyAVyh6hUpViHhX8GNF7MnWDHvftLHV/uiRzXM/iAGNjJ614SiUTEGLO92aLn
         A0ujGafZc8oQx2r++JqIvK1abxifEOvXF2BTqwU4tinVQ9gLDH1pE+QJIbayLYLApcZ9
         Uj2w==
X-Forwarded-Encrypted: i=1; AKwUvBwkRgm3fOC/iyqwtOwlto2CqbYvZtjHnAjr5BED7aHqljAtXkC+fwagXO/6eBKBJ00qBosAul9gFqogLjUSsYze@lists.infradead.org
X-Gm-Message-State: AFuF++nhVnn2jpvS3dEh+UWz7p7tFjl7G5mlN0UfK1o1LONiQbZc3L/+
	DFZdck8ufzEcU+FJKBL6omJ17RX7zPEZFbbp0VbjD80pY1rmF/MR3x7Upcmc0NJ+Zy0u9wg3/OZ
	1aqg2M1BpRU1o4SqtUL+KhaFTXlcwI4ChqfA/D+uJWCqvuysRbqmJO+TAKKc3eIs4jBPp6DXJsl
	7d1vZYaiU0G2xF7WigKtIBd0DXbFr8pf0VUCkrB0NhDfzPTGEo5qKA
X-Gm-Gg: AYBFou3E5fEf36f30lR7LDppCFb4YjLTh3SnF1Ac96ZIWFmrZx2TH43kY8SJirnrnzK
	fY82ce3UXnBVu+WDt8fpx83Py0XQodMOg1cwyAGtGF/BXw29DFidMSJTQEFHSWqjwHDYldXbhKm
	haI40u++vH7hHTpny93wi+fVGyVhqCZRWMqRv54YtaoNaV0suUTtrcM5E=
X-Received: by 2002:a05:690c:7011:b0:8a8:6fac:1525 with SMTP id 00721157ae682-8a86fac15dfmr9506917b3.46.1790338814060;
        Fri, 25 Sep 2026 05:20:14 -0700 (PDT)
X-Received: by 2002:a05:690c:7011:b0:8a8:6fac:1525 with SMTP id
 00721157ae682-8a86fac15dfmr9506707b3.46.1790338813586; Fri, 25 Sep 2026
 05:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260918101113.6699-1-shf.chen@mediatek.com>
In-Reply-To: <20260918101113.6699-1-shf.chen@mediatek.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:20:02 +0200
X-Gm-Features: AclHuK-ouBDE3NP5KllgzizL8nzI00TGFeoDBfSmluIKyV7R7AT2q-LaOcyCY5Y
Message-ID: <CAGgiveUPixvTF9vJ2Xo4zTSL3OBND=FgWpNth7F6PuqcidLmVA@mail.gmail.com>
Subject: Re: [PATCH] optee: register TEE devices only once fully initialized
To: Shao-Fu Chen <shf.chen@mediatek.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        tadd.kao@mediatek.com, jarried.lin@mediatek.com,
        vince-wl.liu@mediatek.com, justin.yeh@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfXxuCCRbE+k1ul
 6VMRENNhUosK8dvqmHWtNmcbM3rZ9122shib07ojsAZkvnZrR5xyWZ24o+QGzcCQMTkh4gvI89f
 c1h8xTI4qDnQ/9Zqg6FGeg9iz3xlSQQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX68XCsO/SD3rz
 bsDqzwyuLyND2opEBcYjo2uksnf6GspsfC/pYS/HGN5AfLfExQQj8jM/DqaoinPuR7Uh9NglADs
 8cBtFe9bdrTg3PSHH0joZllmgE2Qq/LHnS4vm7legl9iWxu1eXNqTdSY91fS5fy5C0n7ZJ6eyUG
 I+P89+PSRybqg7udQY+DzI3zvls7DJy7dgcAGgO9fYD7pQWOHgo2GZ8Ic0KFOPXDYABleyTggrh
 iLJOMyloyhYkosCFNVLcmsaS5/T4sl42QA4NLfh9HneA4AJyB21rFZCl6hUuzdWayUuV93cnQ6p
 qBvUsU1yt1Qjh4aQpGEpez2GZ4S/p+yVMvqdM5ODPSaSoBEjMW6Ip3M7vF8mLMQ7SFK+LfIFXtc
 Edi/zydbvRis/vvmTwxds/mFb7thFmTBTHYKBAzerfDdEcHXS0bvMgi0GwGYf0bEZncBdvxG7fg
 bmL1JJUJ7TBFyK7pOUQ==
X-Proofpoint-GUID: dbDGL98bqZs-mWXScmC4NCSMMBvk4mwK
X-Proofpoint-ORIG-GUID: dbDGL98bqZs-mWXScmC4NCSMMBvk4mwK
X-Authority-Analysis: v=2.4 cv=Hf2B3SE8 c=1 sm=1 tr=0 ts=6ab666ff cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=mpaa-ttXAAAA:8 a=oFcAipZnX4TCZRIg_scA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1011
 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_052015_779694_BF88B793 
X-CRM114-Status: GOOD (  22.55  )
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

Hi,

On Fri, Sep 18, 2026 at 12:12=E2=80=AFPM Shao-Fu Chen <shf.chen@mediatek.co=
m> wrote:
>
> optee_probe() called tee_device_register() on both the client and the
> supplicant device before the rest of struct optee had been initialized.
>
> tee_device_register() calls cdev_device_add(), which does two things at
> once: it creates /dev/tee0 and /dev/teepriv0, and it links the device
> into the tee class so that class_find_device() can find it. From that
> moment on the device is reachable both from user space via tee_open()
> and from kernel space via tee_client_open_context(). The only gate in
> teedev_open() is tee_device_get(), which merely checks that
> teedev->desc is non-NULL, which was already set by tee_device_alloc().
> Therefore, there is effectively no gate at all.
>
> A context opened in that window can run against a struct optee where
>
>   - optee->call_queue.mutex is not initialized by optee_cq_init()
>   - optee->supp mutex and completions is not initialized by
>     optee_supp_init()
>   - optee->rpmb_dev_mutex is not initialized yet,
>   - the message argument cache is not initialized by
>     optee_shm_arg_cache_init()
>   - optee->ctx is still NULL
>
> Any open session or invoke during this window takes uninitialized
> mutexes and dereferences a NULL pointer.
>
> Fix it by moving both tee_device_register() calls down to the point
> where all of struct optee is set up.
>
> Signed-off-by: Shao-Fu Chen <shf.chen@mediatek.com>
> ---
>  drivers/tee/optee/ffa_abi.c | 16 ++++++++--------
>  drivers/tee/optee/smc_abi.c | 17 ++++++++---------
>  2 files changed, 16 insertions(+), 17 deletions(-)

Looks good, I'm picking this up.

Cheers,
Jens

