Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DB4CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ey8VJPwrz6nsFUg0zcYFZgipjxqAi5SgWS8aYTsmB70=; b=UssX+YY8WWxwkvzJSqoWbfIU/w
	If8vyjk1DUePNTs5gJVeVY20MOrvCXVo8jHe7XPBLL9uuAKfqp9FsEbKNkoMBe73kliYhW5Qk7E0+
	I2VzL28nR6p56a3WbeNhYK4MSp1n3VSpJeVKIa40PAbHyt5A7tsVq/ETzWMuyQY5J32j7luW+P4Az
	IM8ZAzBVLPhEubpuyJcURPWZbeXx4XbDNSIYftwnhf311N7kfJ+zfIeafim0zo3AP4zlHxPfNSnEG
	VoDcCVx8WdvzVnxGyqBtPg2NRuph5cw3NZwB+48Y43LEau4MZc84wLDrVvlf6vTg3UdmUVaczfkDc
	a96pq8XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4C2-00000006eSr-1xnT;
	Tue, 23 Jun 2026 16:41:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4Bz-00000006eST-3pbF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 16:41:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXZd43752848
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 16:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ey8VJPwrz6nsFUg0zcYFZgipjxqAi5SgWS8aYTsmB70=; b=ABitfkkZzRaL271H
	GuBYdjpHGP+N4tSr4kA1TET3ahrGfC8pLGfCYYKxtrd7og3WU36WSTPXZEtb+r++
	Gow7Osgf3rCVFrUhHZ/OS1FMSeulDiBzhmNMgzK0gpma3gGYuy0NWwUyZ4AM1W0N
	3JBElH0sw0/xQZaEcCJil10rNlfHyfJkm7JRNGqlnhlonoQJlucnqliBNjrEzTWg
	mnxkVS6vkIooCBEBizAZU4miw8ekbEJ7F9UiQlJdXaPdrgLODlZJFOtAXosTsO7g
	cJnnJYLc+v6SlSuvL4kP2vPcswGk5pdxHLh+o5XaQWrUl3UH6TLD0HtkQuvXLEHA
	lzuh0g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29j9s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 16:41:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a15cef334so6795651cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 09:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782232902; x=1782837702; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ey8VJPwrz6nsFUg0zcYFZgipjxqAi5SgWS8aYTsmB70=;
        b=HYTyyKwKvqhhhbCRiP+0XePtgYi5aJV/Bm9Cxf3BvrODrwqv29fRmiDO4iYrmhCuXH
         Ph/yt0wDYWOovYZd+/6sLJqYQYCZ0EJ+GEUJJHsJShQNBN4Bg5uBVGpmxv6cAzXxeVF1
         Z380SsxstHmBGDrHmMO0eW5NUH51tUyJknys9+HfOrZgAS1gUHNyzBcwQMVouZOplLtD
         94hLM18pI/J3cKfY2EsJ5SmShlj7WI85oERKxAfvzMpJbi7cyIhkpLMSCCvrnCkOSFmr
         ATIP/5m+QIP5AchV/IUd0mEFp+9lQohfS7mRftYSIx0j1KVR+dL+6LDXnS2MYF5ms+Oz
         YJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782232902; x=1782837702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ey8VJPwrz6nsFUg0zcYFZgipjxqAi5SgWS8aYTsmB70=;
        b=FitUyC8/P4AO/Kd6Vxhr/cMeGGkPdlmfsDuIvPRQ6Isrc6jlquHiT9uuK/LOWutPwK
         7dXVq8fhjn8ImBKlturogqRJ36V0xvWcwV2kNSPWnQLo6iCrkdkUCNxk3IHK3ZuYkAnx
         roqUj5TRbB5EWPHyuTiutZkAqAqmTBwh/igCjyveAFhGLxMZU7jva8sG6YApTUGBB7dR
         pAS30cLIstcQfphqZLEqFnBRcWqcZjNE/SACJ7OyHb+NoTkDiVHs9mKfO31spwvx6aTN
         x/N5bcP4ZvVVZfnRYXEZuOXidRJpfzN2HG4ZFn8HT+swb9z9ljTeEODl/OcYIw/XgV/K
         VkzA==
X-Forwarded-Encrypted: i=1; AFNElJ8R9HmsFM/kdyM6B/nFPQN+m5mgyeFeH5Hf65LDgNXkB3lhNP8Bmhpn9tuypfrQKGlsz5mMFE7TomvCe0qH//zB@lists.infradead.org
X-Gm-Message-State: AOJu0YyO84Ox8GRnNUBj3vB8MAF+LfnurkFVlc869TN2DIzsb0VTmvdZ
	e4lVMmfZqWHh6cdcOnILs8ep4lotz7ex3Mkw4tLB732QfhsNWA7SAvFgpzQPKh4tc675gI6Xx88
	PMs/GGRAC/EMuQ0YxCkFfwCQ+zfBsXO5sH3FnBbuNkaC316ks6ptYX+5JI8qW7jR66rZYPCdaPS
	PcpQ==
X-Gm-Gg: AfdE7clHH21JUCwpxZgb2A7BnQpjZwPtljoe1ca5wNg4RfvhD3JORRxV3PZnv5gi7Jj
	QAnuctcZZP4KvTKX3ETcVRvlSreolmccVAIzHe0kVFqYUQrQiPgLxmGf3/TekVMNgRsvUNar7O/
	XutbTRyR2PYJ5gdTH68/6/dC0pmRdF4gjrtip/j4gknwcYYlEPZy1uGpxLznQxnlZYPumJi4/9B
	kHfHW97Mz88CNMUVkwkKtv3Q7oMCCZBXcfaWhH4LoCjZXHvuNSG3a5EatcJczK4ZftIRdPEw3bu
	kTgJaY0Rvnq+bZXG5epWUpjh50dJXg85PCt+yZSSfaGyvXfGTG/U8xmq50PNK0Quy5h1vWgcH1/
	sx7OkQT2IobY8sxSg2ONQsOPxX6Zs9mEmPo4=
X-Received: by 2002:a05:622a:1652:b0:509:2a92:8088 with SMTP id d75a77b69052e-51a4f42cb19mr58800591cf.1.1782232902343;
        Tue, 23 Jun 2026 09:41:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1652:b0:509:2a92:8088 with SMTP id d75a77b69052e-51a4f42cb19mr58800311cf.1.1782232901978;
        Tue, 23 Jun 2026 09:41:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697dba9c118sm1295449a12.5.2026.06.23.09.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:41:41 -0700 (PDT)
Message-ID: <969f78f6-dc10-45d6-8cdc-f4f65fee68aa@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:41:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] iommu/qcom: Document why sec_ptbl allocated flag
 needs no locking
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-9-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122034.1166295-9-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3ab747 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=p1Q4quDVZRqoN1qXw5YA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: zm1L8qWIo-rxqzlH6hz4Yhpg_HovXbyv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzNyBTYWx0ZWRfX8nifhAi5yLB8
 hEzI/AYY9hsaimnCrkY8/Xp7/bWJg8e1BPSpqpaXTqMwvBylfepCRsd/65gdCWWSUkJqjgnthbt
 +/gw2HIVPwcu284fGOtDvCgXIJQ5eNg=
X-Proofpoint-ORIG-GUID: zm1L8qWIo-rxqzlH6hz4Yhpg_HovXbyv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzNyBTYWx0ZWRfX8/pnFd+8dEAX
 vE8M1S9chgco6++Rg+7xNdCqog5M1KA41+xc1pB4x9bFRIsp5cKMVF2DvHgwoTtZoZZkdDky+zn
 Oy6XRstiUZbybKZEOxTMs0n1oiZOqM4HKRPUXss76CkeHTcWhDrDaZOBZug5VHXn4PxMCgHvXBQ
 sp+SmUDZCj/lWsWBb1xYotrd6CasOVZRVngEN1JU8XlUsL4SIyjM1OJe7V366E80kSHVgx4oR4e
 9+lHOFqP1HyWqQlIRFs0eY+hQNqs9uHSr8y5uOoBDIRAJkq35GamzQyB8gexWKt0Xbk2nnGuGZ+
 vjgsx28jnw5ZmqbLU0gGXCXGNyvB2ZFkidvoFtUL2xAEQXtpDiHdUvj7bcX+geWKO2S6klP+k46
 F3O1aGKlhvQIzetZ/ocxf8a2oV/hyf3HsJ7mEMTXn6M5ocYYETM+lXW2mAn7P7kbeA9P+Y5L7K2
 wFRBFB5s25FUK23bUHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_094143_961225_3912A146 
X-CRM114-Status: GOOD (  11.96  )
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

On 6/23/26 2:20 PM, Mukesh Ojha wrote:
> qcom_iommu_sec_ptbl_init() uses a function-static bool to track whether
> the secure page table has been initialized, with no locking around it.
> 
> Only one IOMMU device per SoC has secure context banks (the others have
> only non-secure context banks), and platform devices probe serially since
> the driver does not set PROBE_PREFER_ASYNCHRONOUS. Concurrent calls to

This may be influenced by cmdline, so I'd rather not take it for granted

although I'm not sure how this plays out with the context bank device
always being a child of the IOMMU

Konrad

