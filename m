Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54129CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 08:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXW2IphKbo7GplWl05xgNhXN2gy6tyX9f57ENEuNe2k=; b=0M4kys9DlnU0g9UVVhzu8YAjj1
	VEV+hgoKbQ+TAcB1GRfwQYFsUYR3gN7e6GlrA7X2Qb0hKILUr645HCr9gHOrSpcqeqvvKCs7d4YYn
	biH8HZpArEcE1lT/+HRDsvdhBaDY6qHJw7lUP2Nt+oZaq1NFvsyTAp8SldDP5AcXI86rJKDvRlcDa
	1zX55Za90NnG4/Gh6JUywtE/byMRWs/khJxgPkdSL/6JoHZA1EkASZVMlv4ffpEj1nd57fYFUHTQh
	6Liblx5jsEMFbdYe9hY64Rhvjr9E8hBHw/ZVzr+rrw/WwI7enoLLEjSo7afFhygGGQ0yINm/WM4L6
	ZO5R8f4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTdH-00000002tIa-2a14;
	Tue, 29 Sep 2026 08:56:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTdF-00000002tGt-0aGb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 08:56:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Txbm4098390
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXW2IphKbo7GplWl05xgNhXN2gy6tyX9f57ENEuNe2k=; b=AKaf808aV6bj7PYH
	qnzKe7dbmfabfeS+wGEmMF9ew3p99NcDFokzIbz1HqGEhA6uiDrNE3tO+qh+MCtm
	rPl5iun4t9lVW87QNKeYEbj5ZD7kZCSz71DVcNIypokeo1EtE2fJrkLL3cCe1gqI
	IdgGYwH9qy2bXffcCFSFWdohVXZTHHpaK5Desl8a+0EIIAz4QwFmdv+RfqrAkKOc
	TfyhE0pUKcEm/byvFTaFRQ0g/WjnkqHeui6xhGT46pV18pHqUKzRR1GV/E9qIF4/
	3Al1rKzCi0NuwjL4QLFDe7I8aR1Dz6z42tm5mj+RFzYxLOSNIZzKwXtged33q4Vd
	X697NA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew1kv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:56:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so4089202a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 01:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790672170; x=1791276970; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXW2IphKbo7GplWl05xgNhXN2gy6tyX9f57ENEuNe2k=;
        b=N4mN9FyeARSi3X2rTDdsJTN+hGaIrDCKgvPLLWuibLlfBy5yaXCBoY9BZnRKZqGoSX
         7jsn50ufXZmlS84scC4iwjWd77MRSVwRIvvCAcUABsLTBtcpfwihsUzN3B0rLWwc/M/I
         z+h+ythgJAHcyRixwlL4tVRD7q36N+U0+m9IDm1v5asME63A9zwy1GUf5/XVNhF+ErtQ
         BEoh7lYYHHiW9pc6oKh0xG4yq/EjEl3ZmCx/U8AbbHHDy3v90N2SAICXHiiGId2HTtFG
         7cPDLD8XwiufRQf4x/HWEzmd12Ew9p5KrFEw+84al3z/YbVs3Cauz6GRKlILwh89xmD9
         OHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672170; x=1791276970;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gXW2IphKbo7GplWl05xgNhXN2gy6tyX9f57ENEuNe2k=;
        b=2dRg/Ol4A2oXFP+g0eiCvMM+urGnSjw/kXJvvkEiVokhlc7lFcPDyIj+Q6o/Vff711
         pthYp6yPDZLsbJsL10dPpDokoGQ8Z7hpG20xhD8mXYf4fMD26tsLY5rDUmX2XQYfVjuX
         AvCtaHjoUu0z2vrvTtkf0AI/thyPkDo0uRT4CENRvvgyJgZVFSCojrPIFkQPXfBO9zjj
         ZOwZAIU2+jqLG/GVDF+on8RLRHqvh6KV/TmgcDxICUulFqd9ot6dNDjoRgg5aAc1kFHH
         KuahnN6IF0h9HcPmmTINFpS2+69KN1e8SXjS6YbAUgZBtMIJWeIbHfKk9ixybtkIECw+
         PMGQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/30xzfTGaQS6FinIWc9pd4evYRn376++rGu8tIQpxDbScU+AlKZKbyyRWM5OH/2KBpWRA9uOQ8UC+YUomDIRn@lists.infradead.org
X-Gm-Message-State: AFq9FYKBcYf4McLFjmp1wkxzfdt06y5c+Z8UQ8s9E/8GIc/DuTktByfK
	QaYTVAlpWZQY2LuCR87yE74ipsGMSORywEbKLVhHot2TEVOWRBPCHVFsg4fUFgUYjNycnmnredE
	CsQPR0htkSKyB+x72TsQ9JCIF17oi7wIKVqgzvzm51Mml2JX4h/k24fOS71oqavZQllKRGIwF9L
	R29w==
X-Gm-Gg: AYBFou3/De4adKKEaubKmigrim3C4XQYQLMhSgNvwn9oh2+rpEbmi6suno14KlBxAG3
	wTI5TB4731de7kZu409f3czUAXq8dawW27xL/6QXlZ6w3Tekp0ktBS75OfuNcUL1NyRVaHDU6Di
	mqEMwzZBV5d6s0de7O30adND6uBSx5TWgRokLV52szAml167P1TQcYDhbt3NYLMSjuOhFMxqFlF
	ClRNCIrkdztWYz7LNPeGyIQMtHW5/R/YrpV7nlBU/+rT6vatimq5Mf+E91EbsRNucFzdGLub95a
	OQu7T/E14GPFM/XRoSV8KPTdkELMz0pciACAP3gTe1RafMTg0+N0Ypiljyw0rxL4vgtq+dkXGby
	tOQKYnKdy+DboHPpdi4wu2HVlaa1HUqFbAf4gsAcNcArHoKsc+ioqESZfmt9BAxR7QdD2roAZo+
	qvGOZuxf9IIhv/S39tgg==
X-Received: by 2002:a17:90b:35c4:b0:3a2:aebf:9211 with SMTP id 98e67ed59e1d1-3a2aebf93a6mr3668350a91.15.1790672169793;
        Tue, 29 Sep 2026 01:56:09 -0700 (PDT)
X-Received: by 2002:a17:90b:35c4:b0:3a2:aebf:9211 with SMTP id 98e67ed59e1d1-3a2aebf93a6mr3668343a91.15.1790672169304;
        Tue, 29 Sep 2026 01:56:09 -0700 (PDT)
Received: from [10.79.116.160] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497604d60sm4347201a91.0.2026.09.29.01.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:56:08 -0700 (PDT)
Message-ID: <3b97d843-c4ba-4384-afab-51067b1b8414@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:26:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] arm64: Implement parallel CPU onlining with PSCI
 v0.2+
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Borislav Petkov <bp@alien8.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Jinjie Ruan <ruanjinjie@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        David Woodhouse <dwmw@amazon.co.uk>,
        Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX0zpTVTSo8+7J
 mqcW//jDoLzTKMfwwjVc9hGrFu4w0G/2K8zzbx/u8mPD8NqEnMNjK2LMg5s1WzyVWiJKPpV6027
 OBNr9J2xHQDqVad0WS2jZQoFgDws7qA=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb7d2c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=vnREMb7VAAAA:8 a=EUspDBNiAAAA:8 a=HVqqhRQ12WVzVhQ49iwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX7bjVqe5UPwjS
 kIkrc94T6iEJbjKMa29AAnGCTTV47DErNYIuk6GSiWUMC3DopO7ArELBcZRZhSwvvPX0aRVS7UY
 jell8gB9IcgX4kMVX3NV6/3bUx4+YSFCa8krp44R2xJCGF/Jm3iZeBClUYI+nokilxPQ/YuwQlG
 /qTdIe7eJXkUOWGEjHzexNGQ7cAWhhxeL6rQyyQotqs+zVwqeMnXpRT58G0+YOxo3ZYiMTHwNLh
 vhYrmavbB4ctgK11YQXHqICgzIyxk69eFXpLibZq6vETs9bPPZbHBB0JFhf04zCpUyK+YdXtonO
 sHiNH5NEouPlLWh5ekxRE4Os4lvEbnIccXt3cEBNCkqFMB1B0kIEozQf3c8WTMQSUvQd2UgyIGd
 sog5y4Czee0SeqW5pG+ckaDJt3K7SFQwT4OFt8+pp1TdPficp/c6MBksj6sTc/jultcKHlWwtXf
 of6IL2siYQrDPmVVL6g==
X-Proofpoint-GUID: ZYOZv1D-aMj3b1xUJ8XQYj4XaKbK3Vtd
X-Proofpoint-ORIG-GUID: ZYOZv1D-aMj3b1xUJ8XQYj4XaKbK3Vtd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_015613_425038_D1FE9FB4 
X-CRM114-Status: GOOD (  20.73  )
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

On 9/7/2026 10:10 PM, Will Deacon wrote:
> Hi folks,
> 
> This series implements CONFIG_HOTPLUG_PARALLEL for arm64 by utilising
> the argument to CPU_ON introduced in PSCI v0.2. This supersedes the
> previous series from Jinjie [1], and I'm grateful to him for his support
> getting this alternative version in shape for posting.
> 
> I previously spoke at KVM forum about this work last year:
> 
>   https://www.youtube.com/watch?v=Q6kOshnnQuE
> 
> There are three major benefits realised by these changes:
> 
> 1. We ditch our home-brew secondary CPU synchronisation in favour of
>    constructs in the core code.
> 
> 2. They offer a performance advantage on some platforms, where getting a
>    CPU into the kernel can take time. I'm hoping Jinjie can provide
>    numbers in this case.
> 

Tested on Glymur-CRD - 18 core qcom,oryon-2-2 CPU, saw ~6% improvement
in smp bringup and ~12% improvement in cpu hotplug kselftest

Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> 3. When used inside a confidential guest, they provide protection
>    against a malicious VMM that puts secondary CPUs into the guest
>    kernel after the onlining operation has timed out.
> 
> The first four patches are small changes to the generic code to make it
> a little more "Arm-shaped" but the rest of the series is largely
> confined to the arm64 architecture and PSCI driver code.[...]

