Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75C2CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVvAXF9dVNv+RiFGpy3EXZpalacZAoCjGBc2U1lKRE0=; b=Art2EZhF7vKsh5XHlYWsY+3vLj
	f2VLIQoHDgJnh8Wuo49vIg/INqQg2d9yn+B2W55oDomtEjNwTshDwJ8XYnlRVZTdxbWPtuCzHuXFf
	YNirNYASbqvHC6OEWwONFKAdnyBFIWuTARobuVUwSYsaV7jgkDi6cCQftrZAOUtiOKm9hbCUycoKo
	bRvxe++84w/qronE3V32IqliOAlwYRK4BDZvM5vL1B1EfeeE8r9i3Omy/gqsv4Gx2NPt0DP5VNZkQ
	qhstOqq0nfDPqiSblkNk7Hmn98OPGI6kZ25Z+aTs8ATB//DdzcYkrW4VZ06hu9yLTi3N65Nwxvviy
	eR/sPWUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLdh-00000006bTS-1yf2;
	Fri, 08 May 2026 13:53:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLdf-00000006bSW-1aOx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 13:53:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648DFrn0317564
	for <linux-arm-kernel@lists.infradead.org>; Fri, 8 May 2026 13:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVvAXF9dVNv+RiFGpy3EXZpalacZAoCjGBc2U1lKRE0=; b=Ko2ox87OWAQtDqKK
	TvNzzeUeQ0qnjvqRDq8mLaIg8aXPnxMr/h2RHofLOYev/sMtfEqPOHcfyyU0cgVl
	broKzh/8gCNzivwMozQNH1n+CIGwH0d5V7fbxqnZirugLLrwVaEfwWKa/XjTc11A
	NRkkmRke64wVzfz8D7maWFJ3H0oQw7Gl43Bh9quTD3sX7geOu/cwsSTMhaUuhj6r
	/wiueP+t7FIc0+IaC8O6nc9GSMiiM90DFckUOkQc/g2QfiWxlVjSu7vuACPfJoE+
	IcNE7nsfhHkr3VM10b0k8hc0dw2tXSA1sRj5oWrkJHt1Nyd0y7gkgw0YVN9EMe1X
	7L/MJg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1bc01j94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 13:53:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f9f49e4beso1083737b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 06:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778248389; x=1778853189; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uVvAXF9dVNv+RiFGpy3EXZpalacZAoCjGBc2U1lKRE0=;
        b=ku3LryeI/Le/Iy599LzjGanwNNvQOzc3je0/tCDT2RGbMzotoI5nEt3MxduSR6zaHT
         GOlNMR3bQBk/cnqQnZ7UyuHrl0Ow4K1EXlMIzSzjoeW0Lzi/pgNb7MjekcKRRPc7S2sC
         +LCPBJmigdmLJzllHltUJdyGK+JAo1nMGpZt4mcabMkxB68Inkg3D8pR9+5OFEiIaoFL
         Jxz8YI5XTfu8QX/3404fRZ1rCvNW1CmCVVoFGaWZ9TAS2olJUNh1nCSTGf7FFEzrg8Sa
         e4QlGWaue3UuSG/N6IHUp6wOsUoQ0nRR3Xy5gcxt3+tvolBX5YlkRG5q2NEUBnkQ+oVf
         gnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778248389; x=1778853189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVvAXF9dVNv+RiFGpy3EXZpalacZAoCjGBc2U1lKRE0=;
        b=SQEGiwiTgYt3myMyrBgkVGbZ/mpu93cIk5i7EwcYlhfhnEdqF17g+j8u2UQgWdq506
         0MDTFIq2KuuFkiythhr+tVRt2IVXwBwAjeS8iUW979qNtbKyglzimXi94B+FkvMeqBk9
         MBAR0z4YuF/3ReceQP/4xNiBwQGTsb3V3lc/Iia7QKt3q7lU6J9U4N+v12R4bNhHH8U2
         khraykzRHRFor5KUlMf1+6J2pbUe6eHQffHm8zMzHCsM3b+uqrb93Y3QIvHij1OYJeD0
         9w3iTHbDsDX1Y9wAgeQlUiXvsDe2V+MRBK10jdYoSv/YsEATK2TGQlN1CkyauunZr6cy
         O0sQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zKgJ2A9vOnxJlm5K91+4vGIOI0H61spIXqPE5buj0x90ucG3pMhH7ssYJyAoj5uN+Uwg9L4/m+BM8wCaELwuM@lists.infradead.org
X-Gm-Message-State: AOJu0YyXkSX3+xnX6J/eW3pQCQpsHCx4m0UvquKGtPB9lYdpL535Zw1y
	XfsMWmS4QNRijRHv5fUiERIDLNvv7WAC+VRnSC84+AjZz5XcwF0SQmZcmzsOG9f6RpBZugqCR/8
	VRT5HpRB+uVu/sCcGE7JPFUQkeeT9c2HQ/kp7PHmKe9vFmiwXjHxz8/EbJdrBk1RcOA/X61d604
	xrew==
X-Gm-Gg: Acq92OHWMUsFJ3C8qLsh1Gjj4sqhxnM4MiaDBQaDNpdGo3Az9OSTfvS3bOfDmotT0+h
	aCTwLERjLwvKpKAsEd8uoUJTgIvM2RZKcVbWAAMq65Do83c9VG3h5TKh7SnzMcN4s6V/iKr2W8Z
	p7ry22no5fWdHT238H7XfXk+9V7IwfJBJkoetiD9upKikYMTTJG3QJMNZumloWlSJdr3K/eB7wy
	GLPHUqbgX7k3A4FJqFtRqhR4Pxm+fhjhRGAW78MCvPtjbtyG+jppRZS7u1HveOd6GlsZiP8qIO/
	tsmHfuYz2JpE0yFOFdnk8EoQeFMoRbX0HqiSOjLVTpiu9rJ8FzyR6fpyNPizXlqtUvOAauvxOYC
	vO2wonB15VSX0KLKuh8WhLF7ZXMlrIHxlh3Se4btarkVi+tg7AjHItAFbd3M8DyOaQrag67vEEz
	Enk59chYDvu4A=
X-Received: by 2002:a05:6a00:4fd1:b0:829:7e6d:cf22 with SMTP id d2e1a72fcca58-83a5e35d551mr12165848b3a.43.1778248388827;
        Fri, 08 May 2026 06:53:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fd1:b0:829:7e6d:cf22 with SMTP id d2e1a72fcca58-83a5e35d551mr12165816b3a.43.1778248388287;
        Fri, 08 May 2026 06:53:08 -0700 (PDT)
Received: from [10.133.33.235] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965b333f2sm15555774b3a.20.2026.05.08.06.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 06:53:07 -0700 (PDT)
Message-ID: <d2d58621-77c9-4075-9904-5b7a2cc2b9fe@oss.qualcomm.com>
Date: Fri, 8 May 2026 21:53:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix missing error code when trace ID is
 invalid
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260508-fix-trace-id-error-v1-1-5f11a5456fdf@oss.qualcomm.com>
 <20260508134437.GH3778514@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260508134437.GH3778514@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE0MiBTYWx0ZWRfX6CqCIh+awyNJ
 SI+qfTR054EJZ3DLPXZwijMIhPP4Z9IRv8BjaUR1d8rKwtZuzJX/72WQ8CtgXGt/X6K5aJ2NEvY
 nSOPiMoBxXovP23+he5/L6L1JcJkLbiHL9qpZHfTYbW16fl2RhoTqQNE4UX7KPEpkGT+utHy16A
 5Sl+9WhQ0uZhC3YPKSv26KqlMTzBHDRJTdYxS8nBMvgqXJW5VLO5O4zLz8Krpsid1R/yQOZdXlD
 1NV1X7a4iGjE+g7DX6s13pvaeRtb3MegkvVR1XgXNcFlWLrCGLBoHBjdEkNfdJ4/YdEY81586vm
 Ndv3A2drQS4bzFR1iFMbf6IEv4rXD9fK0ynRyvRjm41d5PyGyZ6HLc8iDALWfP8VPO4XOdotW0w
 TtpmuWihBzuZVAgrhwG4oRQXZ7X3WSQf7G+5/hot21gQSD0jcogZUD+OIvzKk2dN4016TrPzqAa
 Nb/JFFwA+Q8Z/SqcU6A==
X-Proofpoint-GUID: PZ4t1xSLdlJSLtB3DlE5yo8i1iAzhMbe
X-Authority-Analysis: v=2.4 cv=JJQLdcKb c=1 sm=1 tr=0 ts=69fdeac6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=ztVgkDR5hBTvFSzV1csA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: PZ4t1xSLdlJSLtB3DlE5yo8i1iAzhMbe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_065311_429274_45DABAE7 
X-CRM114-Status: GOOD (  16.75  )
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


Hi Leo,

On 5/8/2026 9:44 PM, Leo Yan wrote:
> On Fri, May 08, 2026 at 01:45:35PM +0800, Jie Gan wrote:
> 
> [...]
> 
>>   	coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
>> -	if (!IS_VALID_CS_TRACE_ID(path->trace_id))
>> +	if (!IS_VALID_CS_TRACE_ID(path->trace_id)) {
>> +		ret = -EINVAL;
>>   		goto err_path;
>> +	}
> 
> On the top of this patch, could we do a further improvement?
> 
> Move IS_VALID_CS_TRACE_ID() into coresight_path_assign_trace_id() and
> return 0 for success and < 0 for failures. As result, callers only
> need to check the returned value.
> 

That's a good suggestion. I will check these logic once. I will send a 
new patch to do the refactor if worth.

Thanks,
Jie

> For this patch:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>


