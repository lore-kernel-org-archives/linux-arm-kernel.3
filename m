Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB099CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXimfsnLc93d9P+AWFCnUGcMd4c3BkbDrYHZZJMoFU0=; b=tEaZ2demJ8nfZ8H6qs+cACSfoH
	k6VE6baDZSpIn88gTsVZ1C9pWxqzGJYGBrms2PuHDCDnkzQ1Vby5UL7gltrlfKZEFXYhbu1lJiVB/
	ymv+uxLtpZjm2b2S6yIJEj3l2eD5lU0JkpABthY+T+SAi0TYVlOgbLXdHIp1luSPFIq7h52bpjmF/
	cyDigaSN3BoJYozkIP7ffgaVSUpVwfMfCRPiF4gvrYq6U6qfsoOFryjxVLIhXKMAyK+8EtbAM2kzH
	fiKTi3yl7gtyBhXANoJmJmXqtKuRN/mPetUxdzvX4mXq5eijbRoOqSgKdsF1A0g0zrDERwU4IlXxh
	WleuKyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMot-0000000Csek-2UEU;
	Mon, 11 May 2026 09:20:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMoo-0000000Cscc-1rrI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:20:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7FJAf3332677
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xXimfsnLc93d9P+AWFCnUGcMd4c3BkbDrYHZZJMoFU0=; b=ICsgLT+Yf9GvxQ7b
	Uev6xyRrAiQcnqfoLOaJvAyn0YW5rI1/EIhgv4Vrx+cYV6UaizTtyPKEIyIO6uYH
	5nTbB7Fqh9z+ttHKDexOgZKxknDL+PC8XKoDKQNUMNFm8M1AYPODmWQaQdnPkaIl
	PohERZ5eLUo07jGhsmNGCtO7Roy1cA0erimSmj9l11IgjCflA8mxtT3I/8NUARZU
	FURqOMcp1kRMyBnIiafcYnWtB1DP2akl/DcyPwkRdycbwLxQsHlnDb2n6/LLQ1EG
	SfMmCc2AcaWeWKm9gsAmzUV6J75nz0SS6Xm11HSA2GNC0Q0OvhQNB8p1PU3nc641
	36aZtg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ajgrfhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:20:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba86e35aa1so61831595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778491252; x=1779096052; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xXimfsnLc93d9P+AWFCnUGcMd4c3BkbDrYHZZJMoFU0=;
        b=P0CFw9Of51P+2S2qEbfe1QB86JLL8zNcl7/4pS+NQUE8R+iL+frSLM5jSOg1wBXIKZ
         OLAupY+dFDWt6tthXeui6LYd9Jqk0VgkJg4mQuGmAr7NBdIMYWJFz7uvYJdQh38AETH+
         nnafu6UQgFE7OcZSxSl7SxjzABZ3oDNc0J70czMTbsL9SNaCxHZmaFKry5Qb/xiRkJ+X
         jh8wPXHNfyPMkMZVdykoAGu1h/+T1RmrnZN8SyiyxTRSnNF2+nbVQ0TPhoYgg0HvXWTI
         GPd9VwgJ4C/tw+cRj+amE3lG4CGiXDAZHEA0LybReb3G+kswEPSOiacuOgaPDffcX9oE
         Lskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491252; x=1779096052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXimfsnLc93d9P+AWFCnUGcMd4c3BkbDrYHZZJMoFU0=;
        b=jhRR8E0XfP8t53Foy19P31dM7UOvJQG4NDJkFQMnsNdFCR7n0dtdadswDtTQRDUQWX
         42hbno85kQfEGR9BUffsCB7nF5BgiE73TzUa/IwyTwdhlixlXXijwkbLqc5aHMwOzHdm
         jddBN0kJ1x/sQkOyi7rpk69bAGSsXGBhRlu9wWNm+ySbHdiyDXW0XZDHv3WW4bBJ11ws
         mnljxvFsZviDfk/d7gbYq95N5w/og9fMrhWT2Jk9ZywWHIcIeqfwQkzjlFUq++i9Bk3A
         l1EVwO5bdUmXc5Uz34arkDgL4KFIHSIfTFxNfoe0qlqGUgitUkdJLF0DanwXe9l3TaNc
         LzHg==
X-Forwarded-Encrypted: i=1; AFNElJ+uhq3hvzAaa5e8b+/+qN3XH3kMFy9vHzhgR23Lcx2YCrVUfd87Q+4OsIEgx/dIczZpRe47ML46ntXlr/PVPoHw@lists.infradead.org
X-Gm-Message-State: AOJu0YzpD/5Jh6rldJg+fME+xtYcG1uqumKI/x04DamI5kDDxBXnp6hc
	GwzihEYVld1M3++JHZIT9N4+nuRITORCP/bUPCnetesjsfiQN5tas00rjEl78OzgUhuLdbyaXt/
	bMUuYqSiQK5XuFTi7FH4b3tyDgiPktxK5pqoG00DKnMG0YmJJfeEy8ULHq8zEcOlnNaglkA1v2r
	K++Pz/fMul8Q0w
X-Gm-Gg: Acq92OEd/1HLRu/vUty/bglKXiem4uaoYQ4w1vH8Noy+oIfUVcz/dvaVvC9SuuqOvce
	ljOUCitC7hdqskYZMXQ0ZFrIucerniqH+irr0GG4wBaa1jaLVGQ7aJx40E/1viNjFkcl/cbTDMi
	+cTd4DaiGdL5ztMqI3gVJTZUv5UVCydj944hK2tRYV4Dchu4TS4jS3NJs964e9PGSZJUDlq7F/g
	gOd5y9+ILlrYl2yPv8jlgMhVPcpteaDYpqq6wbvHp+rEBvgq4NHjt00TNFBF9ALq7IKQBbSYxer
	rNvijWBH8KOZggJaOf+BCp/fbQyp2rg0FfuD6pCY1RM9F8yEFQCVNWEqCHZpDiAgvDL7jYnMzVY
	9sO+HxTxxNQqqK93Iggls53zHAz+X+pBuzPJN/QDXId1FnwWudBCnfT+lublX5/l9MnZxTYC1Kx
	3xy1wTbLN8CQ==
X-Received: by 2002:a17:902:76c3:b0:2ba:b643:1f81 with SMTP id d9443c01a7336-2bab64320a2mr145141625ad.15.1778491251891;
        Mon, 11 May 2026 02:20:51 -0700 (PDT)
X-Received: by 2002:a17:902:76c3:b0:2ba:b643:1f81 with SMTP id d9443c01a7336-2bab64320a2mr145141435ad.15.1778491251424;
        Mon, 11 May 2026 02:20:51 -0700 (PDT)
Received: from [10.133.33.31] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e3571dsm96251205ad.42.2026.05.11.02.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:20:50 -0700 (PDT)
Message-ID: <9107c2ad-c4b7-4d2c-97ce-2e20a97518de@oss.qualcomm.com>
Date: Mon, 11 May 2026 17:20:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix source not disabled on idr_alloc_u32
 failure
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
References: <20260511-fix-coresight-sysfs-enable-issue-v1-1-1b3829748171@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260511-fix-coresight-sysfs-enable-issue-v1-1-1b3829748171@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GfgnWwXL c=1 sm=1 tr=0 ts=6a019f75 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5Qk88030wN86dW-1ruMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ozOGoWLmDCz7oUQWsEZDNxJBlAevUlPr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwMiBTYWx0ZWRfX59mDBdv0wEZr
 d1KGBTxuKm08CPro4LmOmuIIENkdhOoUHg5j3KpuBwd0ylDbYmxNSETM4/HNJz5RL9vvJnoP3+D
 JgRM4kUyM5W/qO3fMYFC5GVsUYWLM60WaSWrFUQHhL+od0BaRRqcUF8elnHQj0IKsxTblZ856Ze
 oZkw3eTzhCi+H59qUY2Flr+k42IXJGCSDpCxVmO7JxSTO3ya6ySj3RPztA8H6CDObDCvS3X26s9
 mjpOBN2Epd0VTEkE1vpu+wkJoHWV/IH4kcf12rf6Uy2rbiHZPRE9j16XkJLqsPxE43I+8OdMdXO
 IQnrTHQFTFLCq92XNeJJvK59qS/k5HDSxFDrAkjHRXfhbXRgf9SWpc5sq7elwwuskJPJN6bc9zj
 2nelELtAeyr12szqXotHLOBUtQPccbGtHBF2t/uooE/+5pG6/Zo9QCaAo8QguVv6KNX/ME27HT2
 uYQuT778Vs5hGQt+PzA==
X-Proofpoint-ORIG-GUID: ozOGoWLmDCz7oUQWsEZDNxJBlAevUlPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_022054_608629_42D76CC8 
X-CRM114-Status: GOOD (  23.09  )
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



On 5/11/2026 5:04 PM, Jie Gan wrote:
> In coresight_enable_sysfs(), for non-CPU sources (SOFTWARE, TPDM,
> OTHERS), the source device is enabled via coresight_enable_source_sysfs()
> before idr_alloc_u32() maps the path. If idr_alloc_u32() fails, the
> original code jumped directly to err_source, which only calls
> coresight_disable_path() and coresight_release_path(). The source device
> was left enabled with an incremented refcnt but no path tracked for it,
> leaving the device in an inconsistent state.
> 
> Disable the source before jumping to err_source so the enable and path
> operations are fully unwound.
> 
> Fixes: 1f5149c7751c ("coresight: Move all sysfs code to sysfs file")
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>

My git made a mistake here..
should be:
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Thanks,
Jie

> ---
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-sysfs.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index d2a6ed8bcc74..a5c08fab97a1 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -244,8 +244,10 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>   		 */
>   		hash = hashlen_hash(hashlen_string(NULL, dev_name(&csdev->dev)));
>   		ret = idr_alloc_u32(&path_idr, path, &hash, hash, GFP_KERNEL);
> -		if (ret)
> +		if (ret) {
> +			coresight_disable_source_sysfs(csdev, NULL);
>   			goto err_source;
> +		}
>   		break;
>   	default:
>   		/* We can't be here */
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260511-fix-coresight-sysfs-enable-issue-91533f26f9bb
> 
> Best regards,


