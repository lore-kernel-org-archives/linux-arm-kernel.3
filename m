Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3180BD19512
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 02:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mg95GMWQyqE1ExVJVSaQd9MBAjTkj0cnsmy05b2IZIQ=; b=c3WP6kXY4/SwFYoUMb14yhhFnJ
	m6b7fZEDpUiho5kZ26XJiqO4lobUHc5pbVb9j7ykEMw3RIFlHaoDme3Mu/ebkGjOkE9v4KY5EJesM
	qYOsUyP1KESjJ6wpV0FI9d84k1e43s9r1SPPsZKazqPfHeL7IDxyL53yj9ETxNd7PRB2/JHI/4Ft7
	CbcA2zCeL0hLOr055o1LGnS4Wy8oQVAiNF1cMw+QOrcxhMZf/2Pa7Su+htrbYLkr9nnpuwVTaOMUT
	ob1PGCdDxgxHF6/r/HaGFiCiMNvYaxbib5SlAxGPPJUTz/HWWz89OLp4DUpTw6OtwGmwBp5W634ru
	u9Hf/8xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYaT-0000000DTWE-2QY7;
	Tue, 27 Jan 2026 02:13:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYaR-0000000DTVt-1t1p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 02:13:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgsgg3481823
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 02:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mg95GMWQyqE1ExVJVSaQd9MBAjTkj0cnsmy05b2IZIQ=; b=GjuNKuMIVlQvX1/g
	isbwR4w3grcQv1yeShvaoq/mYWmbzIt7MOGr5YY7eJm77C1aw5w/4DfNuXskIsg8
	urgt5rn0Q/rSgYyo0yu4G7T20MZg39fztbrUVRCSPsly6CWr2Cu3PqdY/2hHvR6Y
	xWgMNcQqe1LVtCnzLzOvaHRXWFGvZXzGFvEN331JffBru8JGHvU1SHbDyf4mcF/j
	GKkzDvKOoSFMqwye/PdWcCvQEBAyUBg2d8Qr3CPMOXlsfgvh69+L+3EHbOgMzsTP
	Hk6g7pgJnhro0Fa1Cq+gnr/ArpkwB667NkcuuWGiZSEh5ZnqHoJ8rxXfripzmKkz
	1Gb7sQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx0v33ax6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 02:13:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f2381ea85so108416085ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 18:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769480026; x=1770084826; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mg95GMWQyqE1ExVJVSaQd9MBAjTkj0cnsmy05b2IZIQ=;
        b=jUzppGz2trjhpNda8B7QxRmoT/Ra+nCb/pk+Pi9i/Iuv0DXbdRuwGhvOHOY12bhtej
         Nt6nxa2Gicu6chaj9YmpTlZgZRUELXGllG7irEctHL7sZ7XSwgEGe52SfaAYY7CpKouA
         MGIWBynicsC3R0p77biQuYcgKhuiBBjdfUPHP5PQoWetrmhMJcG1BMYiXQ9x/ZzRyeCp
         v8eDQur+4bOPI+/mBstYNKqTIJXtkbwy5XPZgNERT3ZU+ju/3muYh2KTlnbkSskYQyge
         f+0cTi+sDEM5HLsQVsmlvQbYqjELfhXH0Sx1St9Z/YddOWvvqid4uc5tfk17nRicFe1V
         wOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769480026; x=1770084826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mg95GMWQyqE1ExVJVSaQd9MBAjTkj0cnsmy05b2IZIQ=;
        b=prL45nJSWexE58JkQFBH4mLPbckYZy2PHPNpJpTraXI+qDVviCgeHYPUsJIMhND3RY
         0KkYZYJmyus+7yqhrkjM0hj4zLT/TKo3lBV3OA/ARBDnCdzq5NAnPPBZfAGZOitRPdhh
         ZfdwANT8QydXiWIQA8/6KfoAX+hTIef4rXNPinyTjvaaQOYN6XZ9Tu4xnDg9Eg4Dioy9
         /eX/i7j9CWJqc6eXTFwx5CdppRkw5aHyx6LqrQA5al0NSN0uuv89UtmcJt44uLRv3HxZ
         M3GQu9FuLeTdUQD7Ob1qQebPTHlDBSvJT5iE07I8+a6TZ5a8jFF9tWLk2iIuSY9hESD2
         xkpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOGO3r0mf+aP10WzEto5J/vi7TyoXsVVmlpPPh6SVXVPMLsoz7is272k+fCN2SD7XuLiVP0D4K22oPKl0FHbCF@lists.infradead.org
X-Gm-Message-State: AOJu0Yzap/ooiy5su/dKGl6SuZlPau/0OVUJYN7fC9INfdnse3jfYUJQ
	NUZBC4MEHGpZacKBTHFjNX+b95yASpzSrC0RZlPbaz7vDnag0fP/Txgr+7Qj4gcFMO9Jkbf/dpt
	Pl6V0+C8zQwW4SkQdCEogZ2mLVUp7pM8g8rEluOBjjiZ/bbqpXZbCPQ9161FdLw1wVoGZ9GubNy
	jNYQ==
X-Gm-Gg: AZuq6aJx9ixCe9Da8a1gWBYiW8VsRluSG04vVkIdeDjKcXie/TbLJ99jZyvrtwPfI4P
	ecLZ2o0vxfa00hN8NNTIr6G38A98UTg/fCxsF9UwvTDPNwg5lDxLUjChtJ9sgfpxDt9/LhR7dqe
	+P7EBY8Rd1usHjJxwnsRCYzN3wVgudzhqUwB/85K3NEmIIXlAnmhAP6x22zZsJ28ZCFKDnVW5fM
	POuYVAjNeve7jTzwvaunYAoklnFeP2w5SqHUrjVzAFJ3g3K2uCDdiBCoxvQ60uuBGGwqV7UmJMr
	LY2oe1qouEcuI8VBNneflUZecrv03kB//GqsOG08DWP6bFnyDYxRsNyerTKZv0EOklBsLDtUc/a
	B+s8szCgTxMKN0/7Q71v2zVjUFc1GoL/z/sQmRbU=
X-Received: by 2002:a17:903:2344:b0:297:e3c4:b2b0 with SMTP id d9443c01a7336-2a870df545bmr2164865ad.54.1769480025599;
        Mon, 26 Jan 2026 18:13:45 -0800 (PST)
X-Received: by 2002:a17:903:2344:b0:297:e3c4:b2b0 with SMTP id d9443c01a7336-2a870df545bmr2164465ad.54.1769480025011;
        Mon, 26 Jan 2026 18:13:45 -0800 (PST)
Received: from [10.239.133.242] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa66asm98956485ad.9.2026.01.26.18.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 18:13:44 -0800 (PST)
Message-ID: <54e3a23e-6426-445b-b5e4-43d727b88709@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:13:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/7] qcom-tgu: Add TGU driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-3-songwei.chai@oss.qualcomm.com>
 <c5569d62-1dd5-4dec-8cb9-dd1c6e3938c6@oss.qualcomm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <c5569d62-1dd5-4dec-8cb9-dd1c6e3938c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAxNyBTYWx0ZWRfX2si0+lcoPbM+
 sufiHWwoBj+05GMCxXNOv18kpXzi8hRTWAff5nkoPElJm/fi0YV8GZBYV8VQbFPOoG+MeDChEo3
 wewJHGKE1U8qh1oShse4JqvkXX8/CnhpQK+9OhaSVGtNmpJ+Ou0eKXLAc9Rb30vV5+9FL6c/pPH
 nAN9iwSiCGW54i57Ro034t+oX0Rcd91patAqLAGn7THBnSSlA7y+NFqAGMNZnTjuifJmh9dXuRF
 Lsf/zzhUlw1UQUoLs4Zjydsbeyv7B+PhEJm/nzLnavZFxLNJxk2s6mTrqNG02vD1/SXtsfd0hY+
 5sCszbGzZoJKMnTzDGIjP6MNLU8b7++4DtA7PJsxpCKvBaHfmpB5pJF11Ik9+PRb+v76R0j+g2X
 vZYRPoHryNUVB6uDArJsjKQYjMU5qQaPhgpniIuoSFrkv/tT0URXIpPJoj5k7QedixsHfR+Z9X1
 Zkt2F0uef7BYIVvh99g==
X-Proofpoint-GUID: NMl6w6pYGevXtqExkF-6M-QO84YnXRWK
X-Proofpoint-ORIG-GUID: NMl6w6pYGevXtqExkF-6M-QO84YnXRWK
X-Authority-Analysis: v=2.4 cv=JYyxbEKV c=1 sm=1 tr=0 ts=69781f5a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=w9XZVCsArpARl95_J0UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_181347_500679_CF9699B0 
X-CRM114-Status: GOOD (  36.78  )
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

Hi Konrad,

Sorry for the late reply.

On 1/13/2026 6:33 PM, Konrad Dybcio wrote:
> On 1/9/26 3:11 AM, Songwei Chai wrote:
>> Add driver to support device TGU (Trigger Generation Unit).
>> TGU is a Data Engine which can be utilized to sense a plurality of
>> signals and create a trigger into the CTI or generate interrupts to
>> processors. Add probe/enable/disable functions for tgu.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static void tgu_disable(struct device *dev)
>> +{
>> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +	guard(spinlock)(&drvdata->lock);
>> +	if (drvdata->enable) {
> 
> if (!drvdata->enabled)
> 	return
> 
Marked, will update.
> 
>> +		TGU_UNLOCK(drvdata->base);
>> +		writel(0, drvdata->base + TGU_CONTROL);
>> +		TGU_LOCK(drvdata->base);
>> +
>> +		drvdata->enable = false;
>> +	}
>> +}
>> +
>> +static ssize_t enable_tgu_show(struct device *dev,
> 
> 'enabled', in all references to this, please
sure.
> 
>> +				struct device_attribute *attr, char *buf)
>> +{
>> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +	bool enabled;
>> +
>> +	guard(spinlock)(&drvdata->lock);
>> +	enabled = drvdata->enable;
>> +
>> +	return sysfs_emit(buf, "%d\n", enabled ? 1 : 0);
> 
> !!enabled
Marked, will update.
> 
> 
>> +}
>> +
>> +/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
>> +static ssize_t enable_tgu_store(struct device *dev,
>> +				struct device_attribute *attr,
>> +				const char *buf,
>> +				size_t size)
>> +{
>> +	unsigned long val;
>> +	int ret = 0;
> 
> Drop the initialization, you override it immediately a line below
Sure.
> 
> [...]
> 
>> +static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>> +{
>> +	struct device *dev = &adev->dev;
>> +	struct tgu_drvdata *drvdata;
>> +	int ret;
>> +
>> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> +	if (!drvdata)
>> +		return -ENOMEM;
>> +
>> +	drvdata->dev = &adev->dev;
>> +	dev_set_drvdata(dev, drvdata);
>> +
>> +	drvdata->base = devm_ioremap_resource(dev, &adev->res);
>> +	if (IS_ERR(drvdata->base))
>> +		return PTR_ERR(drvdata->base);
>> +
>> +	spin_lock_init(&drvdata->lock);
>> +
>> +	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>> +	if (ret) {
>> +		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	drvdata->enable = false;
>> +
>> +	pm_runtime_put(&adev->dev);
>> +	return 0;
> 
> Please keep a consistent \n above return as you did in all other places
> throughout this file
Sure.
> 
> [...]
> 
>> +/* Register addresses */
>> +#define TGU_CONTROL 0x0000
>> +#define TGU_LAR		0xfb0
>> +#define TGU_UNLOCK_OFFSET	0xc5acce55
> 
> Please align the values (it's easier with tabs)
> 
Sure.
>> +
>> +static inline void TGU_LOCK(void __iomem *addr)
>> +{
>> +	do {
>> +		/* Wait for things to settle */
>> +		mb();
> 
> What are we waiting for here?
> 
>> +		writel_relaxed(0x0, addr + TGU_LAR);
> 
> If you do a prompt TGU_LOCK()-TGU_UNLOCK() the writes may arrive in
> the order opposite to what you want, I'd say this shouldn't be _relaxed()
> and we should probably have a readback here to make sure the effect has
> taken place immediately
> 
>> +	} while (0);
>> +}
>> +
>> +static inline void TGU_UNLOCK(void __iomem *addr)
>> +{
>> +	do {
>> +		writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
>> +		/* Make sure everyone has seen this */
>> +		mb();
> 
> I believe this should be a readback instead
> 
>> +	} while (0);
>> +}
This lock/unlock sequence is intentionally modelled after the existing 
CoreSight CS_LOCK/CS_UNLOCK helpers, which have been in mainline for a
long time and are widely used on ARM systems.

The barriers here are meant to provide CPU-side ordering guarantees
around the LAR access rather than to wait for the hardware lock/unlock
to complete. In particular, the intent is to prevent configuration
accesses from being reordered across the lock/unlock boundary, matching
the CoreSight programming model.

I agree that the comments may be misleading in that regard, and I can
update them to clarify the ordering intent.

If you still prefer a stricter write + readback sequence here, I’m also
happy to switch to that for additional conservatism.
>> +
>> +/**
>> + * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
>> + * @base: Memory-mapped base address of the TGU device
>> + * @dev: Pointer to the associated device structure
>> + * @lock: Spinlock for handling concurrent access
> 
> Concurrent access to what? (presumably the TGU?)
  Concurrent access to private data, such as drvdata->enabled here.
I will update the comment to avoid the confusion.
> 
>> + * @enable: Flag indicating whether the TGU device is enabled
>> + *
>> + * This structure defines the data associated with a TGU device,
>> + * including its base address, device pointers, clock, spinlock for
>> + * synchronization, trigger data pointers, maximum limits for various
>> + * trigger-related parameters, and enable status.
>> + */
>> +struct tgu_drvdata {
>> +	void __iomem *base;
>> +	struct device *dev;
>> +	spinlock_t lock;
>> +	bool enable;
> 
> "enabled", please
sure.
> 
> Konrad


