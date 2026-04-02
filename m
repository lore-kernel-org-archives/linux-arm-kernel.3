Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B52D3940D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ad7yMc+Zzf3jPAzQlQ8K/22b/l7iYAslpn7wfq6IfvQ=; b=u0CHhSpT/Hn/p4IcO0tuac9CRI
	NbZSQcqkZxOWvY+D1eSe94GCdH0PQKZ0NOo+Qyngh45kq8owGLdZYIUhApG1ICrpXUxNidru9qOZ5
	OPASPSCtcPWCaMGxOefcuoahuPf6FS/a6DhfGoLRdOzCqAFhwI01cBOK9QDO3Cgvj3iu17cBK0Nd4
	ItA6OyrhnEy1NtA/apOmD7RPFgFIgFsSpShzPXDrDZrgrJK4TT77Ceig0VsJ7ZD2g2xYpiTbJJUOA
	8NMoZyu+BrNMDUYxcEKAoG9NoJNaIQKrccr7/pMVB2WL+bqQWwewZDAEPW6v7sdP3qbxGv7Zt7Bun
	Rm+JY3Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FDK-0000000HOsX-2L6B;
	Thu, 02 Apr 2026 10:23:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FDJ-0000000HOs5-40p9
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 10:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ad7yMc+Zzf3jPAzQlQ8K/22b/l7iYAslpn7wfq6IfvQ=; b=QULrhM2SO/0Teyq9LXOgAd8/0O
	3hH8jNCklfXgFt0olyRITc4pTGI9eoVCslWVHp7ts2ZvTjSkL10ISpPrvmXmCKlmnxiDueVPSgLtv
	Krim93i4RYvfl58ua0Aagc31mC7LDlKXL3pxJQ6GXSNVEo/5duEub9c24eLR1Rf8utlagVb2vc7QE
	YP+Yy3fH21T2vbFxpyHrDmO/SwtkSgL4fk7LZ5aHqrZK7aJib1wMRJRYhJsPlaQIFnDEXF2PkuLTK
	Lyzhf4ZOMMy7Glscl/Ud3Sy2AB2C5NRMosavz1NyhepWk0BkzAzct9yxzx/gLfU+pRdHq4bXzq7Bd
	JXsQDnHQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FDF-00000002E9L-3uT5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 10:23:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63277ill3044208
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 10:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ad7yMc+Zzf3jPAzQlQ8K/22b/l7iYAslpn7wfq6IfvQ=; b=SuXxaieHPReMMqeq
	4LgpLYLr28H+Me5PK/qKX2i5qt+NAE2h3M6Uvo1yrIeol75RdYadHCVMEVQelgN+
	lJ5YE0vY3ulkp7So3ld9vtPzNrs/sohJQXcJjuC/adeBBWFXyR2s89n/DFXjxww2
	rHwHJhPssJzR2IZGPdAkM+TiT4YywSljDw1FAUMTBSSmt4uSM5B57uM3r1NYDCUA
	f88MLDCHd2xUFgaRY3n6/JLyq+FZvBM/82ZptD1o3P2rCUh3H5G+uDJXvGUfYNZ8
	ZKOqrYwFMphskNawWn2AAvz621pr1h41JwJwMPuRM5qx130Vueq/KGrxsHD8OpqB
	/Oft1A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483vcaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 10:23:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c8768a704so424808b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 03:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775125422; x=1775730222; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ad7yMc+Zzf3jPAzQlQ8K/22b/l7iYAslpn7wfq6IfvQ=;
        b=cYSFaWLrU8tgZU6qjQPOhizJFmZmSVO6aPTXpR/+xyTzX3FxqsIljVtZ2TT4VWRfif
         xOB8hUN28nPnv39OAU0gdSyTUqMq07oJjTgm71kgKJDXF4g6dxnVLDOuD1i6M1IL5cwS
         Ozl3s6b1Yzr9js1Se2LQAUx0YW1olm40OZ2iISG908UjpdUuuW07bm20DoH/GJ7gCyUm
         xjETrfacK0HbAHpEriaiWqKJjHCFDQ1mDKd0ca6Vz1pK8ztCVtioqn31oo55JtGcHG94
         sLk9I9mxd5FHICXB6vhiEwf9vqycuTAAC2giwL0kXRWNyP0dnWhJnrBxTE/4JGYb0eHi
         FlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125422; x=1775730222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ad7yMc+Zzf3jPAzQlQ8K/22b/l7iYAslpn7wfq6IfvQ=;
        b=okF50ArstoMSqYOV10LFtl6OBjrPBy16QCU2/DWoqQwQLtaJ7C0j1DrMy1Snv0j8NN
         +NZckE+L9Kfmssgdl3T/lPuE//6wgsN+zKnXwIbzhckLMwLuq6hkpUQufVjNYqy3evQj
         IcDv0OsFhYRYHnpcGkK9MkVYBoYNl1jJsnL6+i3wW/zSBp663OLkDxI/BHldeP4jUCYj
         u3nwINRwNXlzn72CIXFQMJroGDSrlO/ptpHy732nHBA2XdyR4R+dZlN+9RmE1AKBaK3Z
         EcOT+9UFC+sCVy7QIiSgTSzv6SAjrYTZgaxxAEnpFNiFuqynkBr33NDSdlYaZxOLKVfS
         tsqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOQ/qIESNZ1w7EC2F7ebP0GCJ0WhRlHEUZqDq95+SbcIvFk5KL8r+C1D1j+6wtYTzmAfVau2LOaY7wsyJtMVc4@lists.infradead.org
X-Gm-Message-State: AOJu0Yym/uB4SwGfV4faPIhV5KHnX5NfjYXxdvl+tKKU9eFWYE4mTQ3L
	1OfhrsR2XqHZtq0op1TU8vQ5zsrvFKwe412eJIBgi3wQdVwi56YC0/Fs+BzRb7PxN0VnZMPiB3p
	hoOxLxsfomo5tfZnBipalV6rp4PJykhxAmVuD3HhOzvETCs12nAdhFRD8C5oNCPZBQgDmizkhK9
	tdvg==
X-Gm-Gg: ATEYQzyXLfgMivqAOU0OfDsTcAuCZjiBOPB2B7lGmBQhA3Xn54efMcN4XDcnBpuIRSy
	FIL+daJfV/AWSM8H8lQ1+pmBgiH8i89MRDFwrm2KhsYZonF3ZK60IEOyny+WL66NI+NBE3mTuAy
	zswe0Y5ZJswaqnIPLTyzxR2ZB6wZO9a0rniySencfVeQy+Jqk2OfnVcKiu2JTYgX4lto4zOJIsN
	82aOz/JfjNmaEhNurySHhNOPxXZO66a1WaANWoMFU1UVEzwfqhs3EZAe0MMXxdQ2cU3/066i14b
	Hm8KQlkxVnCmRt/9k1a7GjPGfz8Rr61CxA0VO472LNMsj+2bb9LI3QuAn/Q5vrUSHREceX0VAIu
	8wSDOsPgGgtSXCmyXkypRaFBWDakmi/fKrMBpW1mZphPEJNJwfDtinK8nHAPJt/UaMxYWUMZ4zO
	DndLRJhDfKT/Q=
X-Received: by 2002:a05:6a00:1d86:b0:82c:212a:906a with SMTP id d2e1a72fcca58-82ce89b8e11mr6553091b3a.36.1775125422336;
        Thu, 02 Apr 2026 03:23:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d86:b0:82c:212a:906a with SMTP id d2e1a72fcca58-82ce89b8e11mr6553063b3a.36.1775125421710;
        Thu, 02 Apr 2026 03:23:41 -0700 (PDT)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b23c6asm3681586b3a.10.2026.04.02.03.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 03:23:41 -0700 (PDT)
Message-ID: <5ef0b9a0-9ce2-4d62-941e-13fbb5b5e04f@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 18:23:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/7] qcom-tgu: Add signal priority support
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
 <20260402092838.341295-4-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260402092838.341295-4-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce43af cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vWkLcuJU7nNpPdD76OYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA5MyBTYWx0ZWRfX23ap74St0FQS
 uI2qThuq+ftTj78WA7ZUi64DLovINXTWgOiuLLiNp7uiExMu1vtqANbTTUfp+CkpJ6sxG1umNZ5
 WW6D/MKPM5/D35a+B1XrWavJujV6x5RduNGcAkXhk7L7frmfvrXOx90PcMu7vfdY9bLPt1WG32m
 Nksd7KS3EgtTrZDOAWpHR6IsXd4l6lRWukiytQ9EMrWew8kwX05TeVkWre4cj2IWEU2IlljjMxq
 bTcfV8gqzxG2YvQC4X+dKqKqKmIr7YE3WSFnJ+Ji6jLbD1EPsfd04JOUktWiwPill4uZ2N1f8Zf
 mVrmCWyjZRU+ZZ5xOc/S1zuA8Hu6Xb9C74y43l5bxMJ/jMv13aWdJm9o4dEs+W1oAAjGJ3yfzRo
 2EVC0122+Ux6fOo2fKBpxDuybvlXPnq3j7r0xCzaKe48mxDxdwCpt0GrZ18afOCjfu1bVij3g3b
 TNOVU65i8EYTh7DPLkg==
X-Proofpoint-ORIG-GUID: bLNtjzLAPQdkkb4-UEKUYbnmZHOw0poM
X-Proofpoint-GUID: bLNtjzLAPQdkkb4-UEKUYbnmZHOw0poM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_112346_614204_0F26994D 
X-CRM114-Status: GOOD (  29.86  )
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



On 4/2/2026 5:28 PM, Songwei Chai wrote:
> Like circuit of a Logic analyzer, in TGU, the requirement could be
> configured in each step and the trigger will be created once the
> requirements are met. Add priority functionality here to sort the
> signals into different priorities. The signal which is wanted could
> be configured in each step's priority node, the larger number means
> the higher priority and the signal with higher priority will be sensed
> more preferentially.
> 
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>   drivers/hwtracing/qcom/tgu.c                  | 161 ++++++++++++++++++
>   drivers/hwtracing/qcom/tgu.h                  | 114 +++++++++++++
>   3 files changed, 282 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index f877a00fcaa5..223873789ca6 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -7,3 +7,10 @@ Description:
>   		Accepts only one of the 2 values -  0 or 1.
>   		0 : disable TGU.
>   		1 : enable TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:17]
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the sensed signal with specific step and priority for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 49c8f710b931..7d69986c3e3d 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -14,14 +14,123 @@
>   
>   #include "tgu.h"
>   
> +static int calculate_array_location(struct tgu_drvdata *drvdata,
> +				    int step_index, int operation_index,
> +				    int reg_index)
> +{
> +	return operation_index * (drvdata->num_step) * (drvdata->num_reg) +
> +		step_index * (drvdata->num_reg) + reg_index;
> +}
> +
> +static ssize_t tgu_dataset_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct tgu_attribute *tgu_attr =
> +			container_of(attr, struct tgu_attribute, attr);
> +	int index;
> +
> +	index = calculate_array_location(drvdata, tgu_attr->step_index,
> +					 tgu_attr->operation_index,
> +					 tgu_attr->reg_num);
> +
> +	return sysfs_emit(buf, "0x%x\n",
> +			  drvdata->value_table->priority[index]);
> +}
> +
> +static ssize_t tgu_dataset_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t size)
> +{
> +	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
> +	struct tgu_attribute *tgu_attr =
> +		container_of(attr, struct tgu_attribute, attr);
> +	unsigned long val;
> +	int index;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(spinlock)(&tgu_drvdata->lock);
> +	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
> +					 tgu_attr->operation_index,
> +					 tgu_attr->reg_num);
> +
> +	tgu_drvdata->value_table->priority[index] = val;
> +
> +	return size;
> +}
> +
> +static umode_t tgu_node_visible(struct kobject *kobject,
> +				struct attribute *attr,
> +				int n)
> +{
> +	struct device *dev = kobj_to_dev(kobject);
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct device_attribute *dev_attr =
> +		container_of(attr, struct device_attribute, attr);
> +	struct tgu_attribute *tgu_attr =
> +		container_of(dev_attr, struct tgu_attribute, attr);
> +
> +	if (tgu_attr->step_index >= drvdata->num_step)
> +		return SYSFS_GROUP_INVISIBLE;
> +
> +	if (tgu_attr->reg_num >= drvdata->num_reg)
> +		return 0;
> +
> +	return attr->mode;
> +}
> +
>   static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   {
> +	int i, j, k, index;
> +
>   	TGU_UNLOCK(drvdata->base);
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < MAX_PRIORITY; j++) {
> +			for (k = 0; k < drvdata->num_reg; k++) {
> +				index = calculate_array_location(
> +							drvdata, i, j, k);
> +
> +				writel(drvdata->value_table->priority[index],
> +					drvdata->base +
> +					PRIORITY_REG_STEP(i, j, k));
> +			}
> +		}
> +	}
>   	/* Enable TGU to program the triggers */
>   	writel(1, drvdata->base + TGU_CONTROL);
>   	TGU_LOCK(drvdata->base);
>   }
>   
> +static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
> +{
> +	int num_sense_input;
> +	int num_reg;
> +	u32 devid;
> +
> +	devid = readl(drvdata->base + TGU_DEVID);
> +
> +	num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
> +	num_reg = (num_sense_input * TGU_BITS_PER_SIGNAL) / LENGTH_REGISTER;
> +
> +	if ((num_sense_input * TGU_BITS_PER_SIGNAL) % LENGTH_REGISTER)
> +		num_reg++;
> +
> +	drvdata->num_reg = num_reg;
> +}
> +
> +static void tgu_set_steps(struct tgu_drvdata *drvdata)
> +{
> +	u32 devid;
> +
> +	devid = readl(drvdata->base + TGU_DEVID);
> +
> +	drvdata->num_step = TGU_DEVID_STEPS(devid);
> +}
> +
>   static int tgu_enable(struct device *dev)
>   {
>   	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> @@ -121,6 +230,38 @@ static const struct attribute_group tgu_common_grp = {
>   
>   static const struct attribute_group *tgu_attr_groups[] = {
>   	&tgu_common_grp,
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
>   	NULL,
>   };
>   
> @@ -128,6 +269,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   {
>   	struct device *dev = &adev->dev;
>   	struct tgu_drvdata *drvdata;
> +	unsigned int *priority;
> +	size_t priority_size;
>   	int ret;
>   
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -143,12 +286,30 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	spin_lock_init(&drvdata->lock);
>   
> +	tgu_set_reg_number(drvdata);
> +	tgu_set_steps(drvdata);
> +
>   	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>   	if (ret) {
>   		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>   		return ret;
>   	}
>   
> +	drvdata->value_table =
> +		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
> +	if (!drvdata->value_table)
> +		return -ENOMEM;
> +
> +	priority_size = MAX_PRIORITY * drvdata->num_reg * drvdata->num_step;
> +
> +	priority = devm_kcalloc(dev, priority_size,
> +				sizeof(*drvdata->value_table->priority),
> +				GFP_KERNEL);
> +	if (!priority)
> +		return -ENOMEM;
> +
> +	drvdata->value_table->priority = priority;
> +
>   	drvdata->enabled = false;
>   
>   	pm_runtime_put(&adev->dev);
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> index dd7533b9d735..df570c89ffd7 100644
> --- a/drivers/hwtracing/qcom/tgu.h
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -10,6 +10,114 @@
>   #define TGU_CONTROL		0x0000
>   #define TGU_LAR		0xfb0
>   #define TGU_UNLOCK_OFFSET	0xc5acce55
> +#define TGU_DEVID		0xfc8
> +
> +#define TGU_DEVID_SENSE_INPUT(devid_val) \
> +	((int)FIELD_GET(GENMASK(17, 10), devid_val))
> +#define TGU_DEVID_STEPS(devid_val) \
> +	((int)FIELD_GET(GENMASK(6, 3), devid_val))
> +#define TGU_BITS_PER_SIGNAL 4
> +#define LENGTH_REGISTER 32
> +
> +/*
> + *  TGU configuration space                              Step configuration
> + *  offset table                                         space layout
> + * x-------------------------x$                          x-------------x$
> + * |                         |$                          |             |$
> + * |                         |                           |   reserve   |$
> + * |                         |                           |             |$
> + * |coresight management     |                           |-------------|base+n*0x1D8+0x1F4$
> + * |     registe             |                     |---> |prioroty[3]  |$

s/registe/registers
s/prioroty/priority

Thanks,
Jie

> + * |                         |                     |     |-------------|base+n*0x1D8+0x194$
> + * |                         |                     |     |prioroty[2]  |$
> + * |-------------------------|                     |     |-------------|base+n*0x1D8+0x134$
> + * |                         |                     |     |prioroty[1]  |$
> + * |         step[7]         |                     |     |-------------|base+n*0x1D8+0xD4$
> + * |-------------------------|->base+0x40+7*0x1D8  |     |prioroty[0]  |$
> + * |                         |                     |     |-------------|base+n*0x1D8+0x74$
> + * |         ...             |                     |     |  condition  |$
> + * |                         |                     |     |   select    |$
> + * |-------------------------|->base+0x40+1*0x1D8  |     |-------------|base+n*0x1D8+0x60$
> + * |                         |                     |     |  condition  |$
> + * |         step[0]         |-------------------->      |   decode    |$
> + * |-------------------------|-> base+0x40               |-------------|base+n*0x1D8+0x50$
> + * |                         |                           |             |$
> + * | Control and status space|                           |Timer/Counter|$
> + * |        space            |                           |             |$
> + * x-------------------------x->base                     x-------------x base+n*0x1D8+0x40$
> + *
> + */
> +#define STEP_OFFSET 0x1D8
> +#define PRIORITY_START_OFFSET 0x0074
> +#define PRIORITY_OFFSET 0x60
> +#define REG_OFFSET 0x4
> +
> +/* Calculate compare step addresses */
> +#define PRIORITY_REG_STEP(step, priority, reg)\
> +	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
> +	 REG_OFFSET * reg + STEP_OFFSET * step)
> +
> +#define tgu_dataset_rw(name, step_index, type, reg_num)                  \
> +	(&((struct tgu_attribute[]){ {                                   \
> +		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
> +		step_index,                                              \
> +		type,                                                    \
> +		reg_num,                                                 \
> +	} })[0].attr.attr)
> +
> +#define STEP_PRIORITY(step_index, reg_num, priority)                     \
> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
> +			reg_num)
> +
> +#define STEP_PRIORITY_LIST(step_index, priority) \
> +	{STEP_PRIORITY(step_index, 0, priority), \
> +	 STEP_PRIORITY(step_index, 1, priority),  \
> +	 STEP_PRIORITY(step_index, 2, priority),	 \
> +	 STEP_PRIORITY(step_index, 3, priority),  \
> +	 STEP_PRIORITY(step_index, 4, priority),  \
> +	 STEP_PRIORITY(step_index, 5, priority),  \
> +	 STEP_PRIORITY(step_index, 6, priority),  \
> +	 STEP_PRIORITY(step_index, 7, priority),  \
> +	 STEP_PRIORITY(step_index, 8, priority),  \
> +	 STEP_PRIORITY(step_index, 9, priority),  \
> +	 STEP_PRIORITY(step_index, 10, priority), \
> +	 STEP_PRIORITY(step_index, 11, priority), \
> +	 STEP_PRIORITY(step_index, 12, priority), \
> +	 STEP_PRIORITY(step_index, 13, priority), \
> +	 STEP_PRIORITY(step_index, 14, priority), \
> +	 STEP_PRIORITY(step_index, 15, priority), \
> +	 STEP_PRIORITY(step_index, 16, priority), \
> +	 STEP_PRIORITY(step_index, 17, priority), \
> +	 NULL                   \
> +	}
> +
> +#define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
> +	(&(const struct attribute_group){\
> +		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
> +		.is_visible = tgu_node_visible,\
> +		.name = "step" #step "_priority" #priority \
> +	})
> +
> +enum operation_index {
> +	TGU_PRIORITY0,
> +	TGU_PRIORITY1,
> +	TGU_PRIORITY2,
> +	TGU_PRIORITY3,
> +};
> +
> +/* Maximum priority that TGU supports */
> +#define MAX_PRIORITY 4
> +
> +struct tgu_attribute {
> +	struct device_attribute attr;
> +	u32 step_index;
> +	enum operation_index operation_index;
> +	u32 reg_num;
> +};
> +
> +struct value_table {
> +	unsigned int *priority;
> +};
>   
>   static inline void TGU_LOCK(void __iomem *addr)
>   {
> @@ -35,6 +143,9 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>    * @dev: Pointer to the associated device structure
>    * @lock: Spinlock for handling concurrent access to private data
>    * @enabled: Flag indicating whether the TGU device is enabled
> + * @value_table: Store given value based on relevant parameters
> + * @num_reg: Maximum number of registers
> + * @num_step: Maximum step size
>    *
>    * This structure defines the data associated with a TGU device,
>    * including its base address, device pointers, clock, spinlock for
> @@ -46,6 +157,9 @@ struct tgu_drvdata {
>   	struct device *dev;
>   	spinlock_t lock;
>   	bool enabled;
> +	struct value_table *value_table;
> +	int num_reg;
> +	int num_step;
>   };
>   
>   #endif


