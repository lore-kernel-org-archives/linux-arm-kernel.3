Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3BBCA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hWw6ijG79i9KKO/GsUNkSlod/iFx3QaGdrECeuKXoE=; b=pQzgiZ0lzFyaGjxeNRi0rqBOWh
	jBWyzT3yfs6BcK+bBMGpQpbbFntHfdhgALCzEoSb2ks9KJULBSgmli4AhXJmcbLDKHOM+0mLq+xsa
	DC2H03d7UnnUIrHq45mnx667iBdSNJZM7+FRUAjiSw3+Zufz6/6v3RL+tGBKL4Ga7HRNAqKOX/tNh
	bgxTQxcM00ZLFBJ58/QR2q8ohXR62AHBHUcT+MDba3q4xxLCBbG+lINo1cmPK2EL3Feyh6g+uSXNn
	+auh9TzhuhT8YGkdsPbQua64nUVB4e5nXP8gEJGJyn97WIUFOThLUucDgrVBC2z9nfQbSYW6sl5rV
	DE65ueYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Zd-000000060sj-320k;
	Fri, 09 Oct 2026 10:11:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Zb-000000060rz-1iFO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:11:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KOJ21252508
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Oct 2026 10:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hWw6ijG79i9KKO/GsUNkSlod/iFx3QaGdrECeuKXoE=; b=B0Es9AhRU0OYIAlk
	2jrbzCTxp6K0FjJNYQif3bdLi3/+BMe/Plku3+XP1/VCNoEFxdZMLIUDK5BqBu1h
	N8OJd9XcXIiD5s3jifoP5H7gtBCHDfrE3waSj9uJ75COUzY+wJOy6w0d+Ji4e5bK
	efGGqeu01JuV4zwRNbFGRNXnXkKhcPtp4dZ3UQ9pQuXx8ur/BMRSLJJvQEOqYJ/v
	8zRTvbvdsu7lCX6N1+8rVq8glc7zeCWqMUnZQ39LqYBOsXMJ7LHvrSTmYQZ4PGUJ
	qf/zeCWMgD7LkRrSOO1pkPdghqxpNi4FkHOGwflHQEw8n3ed71QowJs0xypoqVT8
	qMcx2w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj48ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 10:11:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so9278327a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 03:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791540690; x=1792145490; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hWw6ijG79i9KKO/GsUNkSlod/iFx3QaGdrECeuKXoE=;
        b=FzGup4LqnLOFQC6Pnz3LJ/nuTq0Cl+paPwNtFGnrKrbmyZD6nmuVVzCGhcg+eAPKGZ
         RTIqKKBbFMDJqWYcPSSUgT5OgyXu9u3J8aRrv1toNk6mBKLRaL8cWIJijBIWnwrcivQ5
         3zZE/Y5civakkgeCcqQn+1lr3HiGVYvioxBiXodBTv1kKbTjaIeH0kNRVi3cHmK+o8eW
         3M2hSicLZicZGSnxbr16ruFfHhavf7MNY6/bfMrUE5TbY9WNTE+wyqmdMA5uWsK/WROO
         E/8WdtWK/Hgv7lFulDAyxR7slWJ2JaxTEZt82+QNDAT5k1s/aBeYNcxEG/gRLqcZ0LWv
         Vgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540690; x=1792145490;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9hWw6ijG79i9KKO/GsUNkSlod/iFx3QaGdrECeuKXoE=;
        b=aFVUKGlE/+n7WE9Zqxtmr5Lnpplq5c3AX7xcqB6HVlBuWpu5ppXq4rZ+opSTXdcU5w
         oy/Zvpor47ADp04eke5cXjZRrM5LeoTbOettwabZAf/eOW39+sWDvuLDg1pBjSsZmj+d
         fK7/bPDkckZePqPzzEkSCgVfT/15JQ+gJnifX9ObaLRBINjbUJuezS77lM9OUpWsajuv
         jfEC88Ky36cVls5qbEF9ckIAheFQsTW8U//e5/l7RjzURdy1wXQAo15r6FaBWms5JrKZ
         QgGHFbiN/Q9HhB8F1WDZUBsUstnH32b2dYMa3QOXw+Xr5ey3ZVmvoQ8nxY+MmQZhbmI2
         VgTw==
X-Forwarded-Encrypted: i=1; AKwUvBzyGuSSsn7cDx6YCaKO75kPEYlo2MkOT1LZ9mQHVmS3zS5+5MWjjwZAzJPwC2CQPOg5wT6hj2HVhFrh1F9JzoLr@lists.infradead.org
X-Gm-Message-State: AFq9FYL6vamqZMAdCXkdIl7QkLTPzTjlHNWcgryuuO1TTdF47n53Ae2w
	qPO89Wi1nPrC8zi5WsRLhSSm5m6ZHgZiUn4cXaSs8yXAUy8nnpT+UI71P76EdBg1Oi/FftyHLwK
	6QIl/avUTdoLZX2K22LLNvSzZONCiyp5tWh/j0Zb3sz15eamT0kuePkDtK0VlicvXzq5TKeNC0d
	lrTA==
X-Gm-Gg: AYBFou3RBlFUK2kZesYtpWkUZASlpD//4Z2DclbPscmv/YtSrgeqyFm8pUDR0+PKKY8
	UsWatBZQ9wruzwEPdmksQSTicwfJ+1wx2uP2q4iWutxDH20ANpPWnaDqd90cxSMF9iHq/qPX694
	Y7S24Z8y7n/ugabVgi2Kr4FRWvjxCWJTxf3gSXNYVZW85/ddnLMRDTSuhAyzsHWVyCUfwkDpzKc
	Gs2TMcUj7cJFepPkt/zok6nR4yPesRyAl8ijooKw2rWZ4kupqcrVugcW5t5izEaNZ1ZbOy2nydn
	Yh2qKIElY+HtewAXOC3chXQ40erwVHS1S4H9LhD7r1lVHVxWphLrSMcvXp/UTcZ2FfYR4+4r93Q
	PCmOSmrZDNFuqNrTBC+6zlNMOkwOtjeW9
X-Received: by 2002:a17:90b:5887:b0:3a4:a383:f9cf with SMTP id 98e67ed59e1d1-3ab3a9a78f8mr1583037a91.38.1791540690334;
        Fri, 09 Oct 2026 03:11:30 -0700 (PDT)
X-Received: by 2002:a17:90b:5887:b0:3a4:a383:f9cf with SMTP id 98e67ed59e1d1-3ab3a9a78f8mr1583010a91.38.1791540689904;
        Fri, 09 Oct 2026 03:11:29 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm2744168a91.13.2026.10.09.03.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:11:29 -0700 (PDT)
Message-ID: <40fc4ba7-c016-4b91-afdd-5443869a4b4b@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:41:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Mentz <danielmentz@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
 <CAE2F3rAMAnV9+WNLZtGQX6cHPsZ6wbfRJ1Z3d5mF1+8WHL-uMA@mail.gmail.com>
 <20260924225534.GD16465@ziepe.ca>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260924225534.GD16465@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfXxk7EQmo+lgmX
 ahYzD6hz222XevCJo+8TRB+d4mn/NQQVRpaUjMZO3wrT7cfNdBMqVttOVb/rfNyD4TicShsmySF
 lbVRCSpyy+oDZ2e8ls8iMQCCEVIATc2dtT5o7CsPEDqkVsjWKaENtWYZwr36nSz/bSueAbFWvtG
 N2p2MvFdLScdekJDq9F5u9c6JufwF9t0VUovFjaAj5ZmCWqSUS8u0zpWfDrD6TF8HWQNsgh5CTj
 dRtSSR+FpWVPeRdgCkkuttPmuSpUbRh0PSkM6kWakVw9D78Ch15mUI71Pl0Yru1eaMslCkONH0n
 YW/ZtVXUFbIZ4AMP/IOkggBeCyGxGgIEacr45HDYCZkCwORPzFaf7hFQO2DsX8XbnMBqRoWP6T8
 HovJSyabhE5x4u6KkvfD08uovxX3FNV05ziutVkQbbaJyrAicJZE1uXEPCpIaK5Rcx+x+dwrOuc
 verXUCpgF/XtiwJc0/A==
X-Proofpoint-GUID: zhTaxKMGGKLiawkG0xjSKI-fu1zhb3bm
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac8bdd2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=_TL2m7dhMTXhWvRYaIYA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: zhTaxKMGGKLiawkG0xjSKI-fu1zhb3bm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfX4hohlSPyzPgW
 H1XA+IvPxVdhLSiE7yNdrD0Cv1+1uKo6wyjVF9y/ZKv7DhGvkbBUIizm82Wo9SpVAvcf4fOQvWB
 CreE++sAnFffPpWZMLhOWKHzAE3benc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_031131_539389_99A320EF 
X-CRM114-Status: GOOD (  16.08  )
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



On 9/25/2026 4:25 AM, Jason Gunthorpe wrote:
> On Thu, Sep 24, 2026 at 01:36:12PM -0700, Daniel Mentz wrote:
> 
>> Interaction with Hardware Dirty Tracking (IO_PGTABLE_QUIRK_ARM_HD)
>>
>> When Hardware Dirty Tracking (ARM_LPAE_PTE_DBM) is enabled on Stage-1 tables:
>>  * In visit_dirty() / arm_lpae_read_and_clear_dirty(), dirty bits are
>> queried and cleared on a page-by-page granularity
>> (iopte_set_writeable_clean(ptep)).
>>  * If a single 4KB page within a 64KB CONT group is marked clean while
>> neighboring pages remain marked dirty/writeable, the descriptors in
>> that group will differ in access permissions (AP[2]).
>>  * According to Arm ARM D8.3.1, all descriptors in a contiguous block
>> must share identical permissions and attributes. If dirty tracking is
>> active on a domain, consider whether IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT
>> should be set or whether CONT sizes should be suppressed when
>> IO_PGTABLE_QUIRK_ARM_HD is active.
> 
> This is right, handling dirty and CONT together is a PITA. You should
> probably make them exclusive for this simplified implementation.
> 
> SMMUv3 is the only user of dirty and it will switch to iommupt which
> does all this right.
> 
> Jason

Sure, I'll set IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT when IO_PGTABLE_QUIRK_ARM_HD is supported.

