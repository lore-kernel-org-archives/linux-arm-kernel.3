Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9433FE9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 17:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHhFczGS9uQYaoR9nxZmpAenZS63HvctKLxEMX2PzNM=; b=dqBnX279FkVOSuZ6G5ESQvcskl
	64ye9yKR/z69DKfjZCWnrbRm97EyVer6cYlgD481Zg+GlR0NQwFN/XqFWHOmZYe/eJ4lW6ojXyaRS
	bvKjPDkKDdANh7qGjPyIWgpT7WXZTdJOJUVF9SISTXUJxWazJKkXSp0rFLl/CSKImgSq28lHXwYsR
	5/p6f1MYcn0qWXtCtu+8UFGrHYwxw+gH/kLmD+WwUvrUMMpt+1U/L3mkRRttB9a+TEG1gWwc66pLr
	W0+nJkP6VmNMP/QB/Vz7fjXPYJuoKQbkTQGuwYsNwck+hpV2CWPA4bRbh1Qv73izGSmoFq9kE/QU2
	2jqVmcnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslEz-0000000AAjb-358H;
	Wed, 18 Feb 2026 17:21:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslEx-0000000AAjA-2NHy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 17:21:32 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I8Wiwe3380011
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 17:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CHhFczGS9uQYaoR9nxZmpAenZS63HvctKLxEMX2PzNM=; b=Puq73Uhecq6xQVg2
	7woR/Mms6FnZqxgfShEUqV0nzjkcXj7DFXEzWJPuv2xXbi6xXDDpUv0BsQXXnrdg
	fzOB1S+2ueJc9kr2ysDApRy9BiAr+ReTIMiGfR38zNyqnsH6trK70+j10RYiIiTg
	VLgcYVjbDvGhOeCXptTcIskhTOPJgK2+OhXXfjc0pUQATl3BNzDMynAmwDsONoKK
	Xv8IbQjyaZ7SMmCnCxi/iwDcs8m5B1fuUD7A39fqxfPZw6Rcm1YhTyA87v3gUxzt
	TeENGCbfMDUz6m3i4ckNsZDLUkjdFqkm/TBpn7LT7AgJf6jQAilUFOvR8rnFb/Y1
	o+FS9w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccxnyk6h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 17:21:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb413d0002so80741285a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 09:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771435290; x=1772040090; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CHhFczGS9uQYaoR9nxZmpAenZS63HvctKLxEMX2PzNM=;
        b=Vl4M3/D75PcF0ESLxDIvTTYtNbWU/aqdfD3M2gt+dGGcmHObe6gsKGzXbj9ugywmtr
         NYezSlIcUu5/92ndYVrUlzUycgolVakRD/gGhvBkNkU6Gqg66L62ZNHExRvrY2/xrPd1
         O2/ZHYYg6K9nPYAuUTkoReKzfyCfcK2u6knevGkZpIn/GpD2ntSmEbYozTf/cJBNQHNa
         2qks1Lmdh6uOlEdKGR3AsS74Aqel/zTwuAvjZV1szDv8mJaYoKgyF/is8+BPP4byghpf
         6ME5lE/q36wlx4cT8yUKjTTirzpnBzvefhlo9UHp5UXBOae2yZFB/HPoYpeFYbUJ0eT5
         JVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771435290; x=1772040090;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHhFczGS9uQYaoR9nxZmpAenZS63HvctKLxEMX2PzNM=;
        b=YSci7NneDK59GvpIhFflNmornY1WmFoCVNPgHNY3zKyHoEflb+ZiZvDddFsA/Nr7O3
         AnCIxOT0BRIBVcbN3Tw3WYCJ60vzThYWr6Gdl6CXRVNlRW7agUBwvCG457xzVMHLNAl0
         Kd9iH3Qfr+Fwos2mjoWnTK7O9NjfficnvBr7EmFtTde6a3jvVPoQgsr6AC3av2RoZulP
         uwjhLJWXvhUIDTaQ4WyYPBzoiyGNzbZZ+zzAodUclncrwf8Jt7VdczKlWO3oflydNl7L
         sdigYdql+l1CXr6TFqcTF1XvkSBfJI55vbU2/5v3f1G7aUcBQZFtcWdl2WmY9rmV0EA0
         EXjg==
X-Forwarded-Encrypted: i=1; AJvYcCWe76QkYh+1vDswOtLYIY3STuM1xy0aQw8Eb59M/oYWSmE9BCq975lEh+WeHly5HyCKQmufTJ4odQh6esa5qCbk@lists.infradead.org
X-Gm-Message-State: AOJu0YyNMdr9x7gPwAFdwEW5ftFPH7o1AErVRy5jkr602PHZVA1NGp5t
	tf+IDPUKNNFOqMpV1v8t+VUpX+kBRg4cms4AzmxXLuhoi17OTatXuZ0aTpWUPGZN83KjYNLyZCf
	KZ0OcLaWwdLcE5qnLCqScZC5fPvewpYVlWjd+Eej01ciOP0q8zTIbn5fCm2G0v3M8Gr7Hfs0t48
	sboQ==
X-Gm-Gg: AZuq6aJmzVLKd8AUE35JHGic6zVD2OOI0Fn7FG0+D2tLnRDoaCNuRbCKKq/+koIoExw
	RukOXqLG1YQ4sbYglcQjwjQSh6t7NcjeBa/6i5WdL3gQjdkoMjHKP+xTB2sqSdhmrhZcXC0GlEE
	v0X3OHlmzoo1wPHv6HhxzBHBAofqomJsOTqgBc2f7NDUN7XgRUGt7+otG67jwhoIOjLR4yiOyKg
	nCATtKL2wrlkDgrHnNI/615SLDMVAKmwgncAdYy5suuG/Y2QTfb4UErqPJxbsW6hoo1U6qkbmYo
	fDbVC3qy5cbOlJ1hIYGnBmy6deuasnN6TQefEcZoKWTGsAm7mQS3J4Xz//KElGwB3hrpOODIVST
	c54zOt+5yMxUjMii0luZN989wO+NBvTLNfHUOmXH8srTtxmZLsA==
X-Received: by 2002:a05:620a:2916:b0:8b2:f5b5:c9bf with SMTP id af79cd13be357-8cb7419d7e3mr300477685a.22.1771435289699;
        Wed, 18 Feb 2026 09:21:29 -0800 (PST)
X-Received: by 2002:a05:620a:2916:b0:8b2:f5b5:c9bf with SMTP id af79cd13be357-8cb7419d7e3mr300473085a.22.1771435289062;
        Wed, 18 Feb 2026 09:21:29 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abc8b1sm44819664f8f.23.2026.02.18.09.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 09:21:28 -0800 (PST)
Message-ID: <ded00e66-3f87-46d5-b41a-a4c9e114e1e1@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 18:21:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: MAINTAINERS: Include resctrl MPAM driver
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Will Deacon <will@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260216110240.159691-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260216110240.159691-4-krzysztof.kozlowski@oss.qualcomm.com>
 <aZXnbDZvzDnUKVoB@arm.com>
 <5e2f98c5-993b-417b-b27c-a683283d1587@oss.qualcomm.com>
 <aZXzSX7mR6do-xDB@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aZXzSX7mR6do-xDB@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 05FhHo9cdwwmA-Ha2SE3NJQI2H8A16kH
X-Authority-Analysis: v=2.4 cv=Do5bOW/+ c=1 sm=1 tr=0 ts=6995f51a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=a0VmEMaI1AB2PhKXyAUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 05FhHo9cdwwmA-Ha2SE3NJQI2H8A16kH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE0OCBTYWx0ZWRfX1PAgLpc0XELX
 EErYd4w/Z3mskra8dc2DTLJ13Ofzmo0I7LKvoMj2eRbD9k9iL19MtSxNmRi7zALz1IGS4kgOW7t
 uBo4hQkS9hyAjSia2wYqvaPXlU/zLJRiKk3dmnUDSK8kw+bTNqRU/n/0BWjyCgeb9eaHPgekyUy
 XOwnLZTsQ2jjEgBl0hKz+vYbvwWijWgNl9Da7bSlwI1V72ul/FRQi0dGcFL+g8HudKYntlUA5iB
 AMTIalNN2W0GRdOPvcoAhupoSqAjSse/pGjIBt33+WbZtmwftW8tZqGZ5s6UyjdA7zZiqqlCOO2
 X1jIM7AEuWXI3N+vg7M+fyug7tMF2wGdE73ukYnFlUCoGfSp/XXDAVYFRx4JmmgHRN7AEE8wizU
 TqwTavVIryzn05qJ5dfPINTbTMJU8hKXRiOtoxN5bZjzxiq+vWgH0ue5Fr2ALCAdftT/3+HT8dS
 4tI64R+UplaGJrp1KSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_092131_630088_7B6B13CF 
X-CRM114-Status: GOOD (  20.13  )
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

On 18/02/2026 18:13, Catalin Marinas wrote:
> On Wed, Feb 18, 2026 at 05:46:40PM +0100, Krzysztof Kozlowski wrote:
>>>
>>> What's wrong with the current entry?
>>
>> I explained in the commit msg:
>> "No maintainers handling the code (so subsystem maintainers)"
> 
> Yeah, I realised what you meant after sending my reply ;).
> 
>> It does not list the maintainers picking up patches, so if you use
>> standard tools (like b4, patman or scripted get_maintainers), you will
>> never appear on To/Cc list (relying on git-fallback is wrong).
> 
> The arm64 maintainers won't proactively pick these patches up unless we
> are asked by the MPAM maintainers. I don't mind whether the patches go
> in via the arm64 or Greg's drivers tree. We just queued the first drop
> as it touched arm64.
> 
> Let's see how it goes but I know little about MPAM, so just being on cc
> won't make much difference. I rely on the current MPAM maintainers to
> tell me what to merge.


OK, there are few subsystems (e.g. cdx) doing something similar -
listing only reviewing maintainer, which later has to poke the actual
maintainer picking up patches. I find it confusing practice and might
lead to patches being lost on the mailing list (happened for example
with cdx...), which is very poor contributor experience, but I
understand you might not want to maintain them (same happened for cdx...).

In that case MPAM folks, please kindly review and pick up only the first
patch. Or tell me what should be done...

Best regards,
Krzysztof

