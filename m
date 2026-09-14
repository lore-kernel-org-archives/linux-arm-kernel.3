Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B788CC88E69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 05:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6l+0gLQcnzp1lqxR4kPJgkBMQ80X908dj+Jyrbr2jo=; b=xHrJoRkwqIha3UqGCexZmPAcVR
	H1mmERukxq5kfhkjNObBBQt3sMfWo2W/w7q/qKIUkNPEpZ8OnDdArUzrqWVyI4cYJqqfVqujJpprb
	RpiCo2cz8VyXW0kezqJeVVFwZDFuotdPyhaEizkTaa6C7zpXR2Tbv4pieMOqd8X50zZJ4OmrCM1Uj
	UOVUOv3CKIbwYDLYFahsM1uNOOVY2GTKWekErb9Avf2m0c5nhN9TcX/mjSjtZNx6ILGIid/zVElvz
	novVB5p/9/hNIQ5tWPAe8emregfaGcgIdRNfAZb5vC2dN8RQTtRaSGmqZT/p0ql0T29Jt1gXoWk/k
	Lzr+YIJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zaX-00000002OJc-1lIC;
	Mon, 14 Sep 2026 05:50:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zaV-00000002OJG-0L7P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 05:50:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jU0c3740843
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 05:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p6l+0gLQcnzp1lqxR4kPJgkBMQ80X908dj+Jyrbr2jo=; b=M288KeCsEuYHukvA
	v84DCo+q7FtfzFC04ZNUBLVl5fkYEeinZyZcc/T5bpc9w7IiAxqaHcwW6fjTbpnX
	47B5AT/jVzCP68DKdJIit35hSZiwdNmVxyFysLG2vRNNdox7kZG0jaW4qR7+gCKg
	Bc4sZPnNorNoy4jdcjS26tCynsCEK7kvAlHDt5P5HU0Ls4c6vkedvHLLXa8QilfI
	ztrmbkufWT2yWrfzmpM3czR/q2xSmfA3/wACipEKF01j8z4p/9czXoi/K2alpfev
	4zqWlCsQbDTadEHNSF40/ok9PpkjRB5DWFmXnbdz/CxYVbE1xu4MYTTa8XAGL/Bk
	WgYcBA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dd6wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 05:50:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d959904658so50452985ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 22:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789365040; x=1789969840; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6l+0gLQcnzp1lqxR4kPJgkBMQ80X908dj+Jyrbr2jo=;
        b=ShzFO8yU+7F7J7Wqb9pTRMVACt8RKH/nWj1DpW0M2IKKhlvec9K4mbOMXRoxpet5fU
         VKMMnL16S3gKB0xgO23JoyGg7znyOPOf0MDEuadd7W9eY46Z0yDmJx3XgvKLHBbSAg2P
         3sXZLpLHvSFiUzoGgAGiSmkHue+cTtW78/w3tJr6qu+skzoMzcF5+Fge48YsdrlJEtGu
         ZnbPCjBVf9wY+MtNDjRelhAnD5ZkonWXjYwtnQztDtg8h8c2HKRZ8Au55PES3lqExJUY
         5ZK+PdPMEpwVoB9xsMIbmfthBymRaYnhxFAjegGaxoYyEMhmFZyJS3s3m7OHkE0raC+s
         rUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789365040; x=1789969840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6l+0gLQcnzp1lqxR4kPJgkBMQ80X908dj+Jyrbr2jo=;
        b=s07M8VXgHBb2ZtNypY049ipHdhsUfovQvr9X6Iiwr5Qww5xDD2vjZwucMVI74OW5qF
         QKuZ5IZM9tBRm3FApmDsgAMg3V6jna+arW7jVng7SV3MwolDNRNAk5o/qOjfT8Nt8J9J
         MaE23+E2XOG+aUrZ4Hz0oK7e9oVszUVPHKRngN7MdyxZTXcf8g3CENQ+x3yYm5zuYh8O
         PE1RsdYwhxsKCNQan7bb0pF4f8S3B0LP6hcqVaspFF81DnLvBPLd+kDMoW/gaxYYKnPM
         sUmSK8LaYViLYm80/SEKpgRtGc8vz0qYSAE6IDQjfiZc0ZRktXHDUj9qwlFQft2MXMm/
         dySw==
X-Forwarded-Encrypted: i=1; AKwUvByRD9LfG0CK5czaWhGYWBrSizaY9QNhYuZkeeaK83n0xxWOgXaaqlWK3rATxO4k74nQBGnEo6oM1AFtq9Fz6DbJ@lists.infradead.org
X-Gm-Message-State: AFuF++lRrLC/8VqmuXDZgKTY+WVSVNZ1PvU+RrLRJEtzn8nTf5v5kxju
	uXcYbiO7GyEnwrWCFThpC8/DbyikKj+JJt1We+zDtqbGFMrZ9xpgijCW8fFTzjoujLZ1y1ABliw
	NSsXB6dXw80T9uWPECeuWS1EUHiS4sXXGAMYhvgfG5jHE8wzsC50fiOSbdBye1EgcfB9vpYgiNK
	Fc2Q==
X-Gm-Gg: AYBFou2V160iV5O56o/GnwLi7rro3wGdcdqUP+2kbjA6oYMrOMgyyqLe/7KSbahfnC4
	/nnfJI8aVh4rOevyw3zW8jf2ekOrSkjiAuHjrGsRqwdOJNM2TRtEnlD68H762fQxpg8PaORNhMu
	FDoBc95GtAfk6sQXqzRcxlyf4T6Mm24IHX1GZAa195Qb2p3vtTabJaQwWyB26t0eH1FZ6Elg+wA
	M5QZueKJ6WcRTnAFy+9s+Hs8h4kyw+KGS3XJH/AWNqWNUK/e+7p7FiOzko+UUgFtfTEn/2Vhjqh
	H52TNYYBMOpdaoU0uNrEW4CdDl1M8XOD7RyxEYO5IRVjk/PP1z44IjNlkiF0DVXeBJdmV9j2wlX
	KWtdrJXLIf+jrUZ+6e5UBoBQyCc/pSAVHd4CTsH9YPgXEDLY68BeG0K+PqeVaj0s=
X-Received: by 2002:a17:902:e807:b0:2db:3729:22de with SMTP id d9443c01a7336-2dd6c47db6amr26249245ad.0.1789365040522;
        Sun, 13 Sep 2026 22:50:40 -0700 (PDT)
X-Received: by 2002:a17:902:e807:b0:2db:3729:22de with SMTP id d9443c01a7336-2dd6c47db6amr26248635ad.0.1789365040080;
        Sun, 13 Sep 2026 22:50:40 -0700 (PDT)
Received: from [10.133.33.70] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfef639sm41967805ad.71.2026.09.13.22.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 22:50:39 -0700 (PDT)
Message-ID: <277c788c-af70-4e56-ab91-9c71cee3cf47@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:50:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Andre Przywara <andre.przywara@arm.com>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20260902143757.3469690-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA4MCBTYWx0ZWRfX2RH7pNtv4zFm
 vswX94bvomuO5iYWZGSqU0o3oSl9yJKlxUlSgyJLSYgn6aC8FiR9A+plMo6jyqKczzohJOrBgsH
 742VdHQFqZli6qBieQfbEc6HlyjBQb39p3amkhuA2X6kZGTbfuvIqQY1dnz0C/HLSJ2TKgTqhWL
 9Ub0T3Ww2H8zKwcRjTKIV87AJmirAIYHDv1VjF+mdVzwtlm6j3b3GCT37N3WjEdOm3I3Zajxe44
 kzO/z3AiPtFWGCBjlOygAwCQH935cffqnDUido8wQblBFqiSoeD1V3fqxi9/tycEvIZ2sGZUQBG
 tonTMK7Q5QLiuG8UHDCmfbdBhfZIgD2LKR+CywSrHwppdSutVEXVGv9CvSn3Xz007E7Rpg5TCT5
 PG3K1cSCNVXwKlj6OPkWacMmTgk8KhTlQUkQIij44nGJXeDoDMvJq7SLwkAs5rhrE/7m2KRyCZJ
 aXxk9wrQRnwNuO747ig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA4MCBTYWx0ZWRfX410/voSyaUaZ
 2c9QdG6smH8PuUi6wsPxe61QIift3te/x6T0bZNiKpXC0RCkFYAsqp7idxX59MaRg4tZGrSwO97
 e1I4Xk3gPRMfHzvWNVx6ngRJiVwmRvo=
X-Proofpoint-GUID: 9PGWR0CQtoGadB7-2CeYXHmRMLku8n75
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa78b31 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=yq4xWk7HVLGLVt40E_cA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 9PGWR0CQtoGadB7-2CeYXHmRMLku8n75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_225043_254438_ED19BC54 
X-CRM114-Status: GOOD (  23.96  )
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



On 9/2/2026 10:37 PM, Andre Przywara wrote:
> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
> error value.
> 
> Check the returned value for this error condition, before passing the
> value on to other code, which would hide the negative number in some high
> value in the unsigned type.
> 
> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/resctrl/mpam_resctrl.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 9d223057953ab..a5e661eff86d7 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>   /* Find the L3 cache that has affinity with this CPU */
>   static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
>   {
> -	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
> +	int cache_id = get_cpu_cacheinfo_id(cpu, 3);
> +
> +	if (cache_id < 0)
> +		return -ENOENT;
>   
>   	lockdep_assert_cpus_held();
>   

Hi Andre

This looks good to me.

Reviewed-by: Yin Li<yin.li@oss.qualcomm.com>

-- 
Thx and BRs,
Yin


