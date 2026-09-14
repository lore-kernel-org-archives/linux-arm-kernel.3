Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679F1C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 20:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SVZ2YLsBB6VGQtK8NxlN3Z4ynzgoiLnBiZCMpH7eJk=; b=0R+YzYKEklK86CtnlzXXJokwBL
	Y22Un6aQKgbUK265auOJD4HtI8UMr9H3zOyqri8hs/vFN3YuOubOyAdcwlFhWylkZx8TUExGDAD3/
	I7nKdCN7jeMWr1GmSL0IjER4+uftU/hhOlIa8QcHc7qvB2tzGJHl+xuwv/t3v0CQednSsoOs4n+iK
	ev+jcleeaUU8q6fmziUf5mHTK7GPhCKAdyihHmqZumV/guEo8yNMwT2V2cf1Y7CwaHqeTRpVFonP0
	b0MOGy0eFsT/qAqiKqwlf9leVBZHQSCvb1Y2yadMMCC1OXjSEKHwQrIUuXW+dQ8QmrPwCQ7kZNXHC
	RWOO3cIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DMJ-00000004bwl-12Od;
	Mon, 14 Sep 2026 20:32:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DMG-00000004bw9-3BHd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 20:32:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYWL71383218
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 20:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2SVZ2YLsBB6VGQtK8NxlN3Z4ynzgoiLnBiZCMpH7eJk=; b=iuDe0ImdpagSJSP8
	pcUICe1qwK2Nh6qBJ/n705GYvPYKqd4woeaWEtiWJh4d+mzUXzHf2ap2wZqe69jg
	NzRkqhu1inSazJPrho8zX2foQZfcpIbbFzC4whh0BYQ+syYQaKpvVNctGXvfQoJZ
	/UsG6WQkn2VWEkdOIlLlINOieiLQqS6Yesu06YYSHOw3XaSz9ALy5stbDFRzelBT
	Xm48hCmKEyY5LbG5z+0aI/2juTAJIu9yb2PlQPRm0rqlJFCANJVdNdsEFq2dbo81
	fGNahXW67MzAmKPcdcEPgNlZStKCvOERD+F7XDFzkh5iaJ4yO1pOjwTAUrADu3Z9
	Zwb2fg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtj0v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 20:32:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so6675419a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 13:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789417974; x=1790022774; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2SVZ2YLsBB6VGQtK8NxlN3Z4ynzgoiLnBiZCMpH7eJk=;
        b=UyGJaVBYLghd5TU/8GLbw0H1pRXZt7SEjIBaY1880ShvjTFxbeVNfcmUsoKQwAp3t4
         ddXuUSdRKh8dTu7nq8RddLufFYIffv5pJwAWSS/UbYy3Kvg0nDFz23WZSmMPmZbHCle/
         Wr8chWe4GdfQlORsrjj6TEY2a94NRNm6MyOcedmQztrVMu4V9dL/CdRc8bv842ke96GK
         iG8qonC5uQrv1Mt5T5iM1BRbPx+ToC+p8cg+c+98mPNiL/CuiLdVHLoRE53mH/uyJMt7
         h5+1YoDJZMbU8kr4Rf7P9a45C9kQ0OGBHD+sMcD41U/OmNQfoqEKLyZthojNX1RZ7x4z
         v7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417974; x=1790022774;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2SVZ2YLsBB6VGQtK8NxlN3Z4ynzgoiLnBiZCMpH7eJk=;
        b=vwT/w/nYzVKywOsU6/MYUvuxyot2kkZkuc6fsTI42MTwX6YvHnAnGsP5FJknQ+XHZu
         8UzCvUmXrHNFHR7oG82F8dcF2NzAhyTrQoql4HacKJnoxtuawKQTh8VqTzyGLtojy9Wv
         RXTaBQ34hkafzbJVQH5zm1BAFu2ryTFpYVM/pqlhSaADhho7AU33/jfE/xFbnHPdFX6l
         ZyJ0azwoHvYk6iAG/W5spyo4RlnGDlZYU6UdK4BoYUxlunvucwqAIKITDW6up9HikXgO
         LpwI+NevYmA9HI80rl+Xkfq+FByuUsXVYYMSawbG9UyK5mTXnwZlwaEA7Ft6ttJW0+IH
         Q4pA==
X-Forwarded-Encrypted: i=1; AKwUvBy4nJkJ4o1KowfcjeDlYoBHjlvas3XmuCjaQUsxq4TeECjIPCFGSDRYa+XbUN1UAg9o3re+NIeQrT3IREX7Pr7Q@lists.infradead.org
X-Gm-Message-State: AFuF++njx593wZFKXb42Bd8tBMxZKUYCOjKG1fngtUNjpH3nV7EyjE3T
	/8DolV9cSf6Qh3nnYBOCjFgESebjSooySz5xic7qtmDO4QU5CxwvUiW8XrZnpUhuI9Xy59qLuEy
	DpQxygD1zQ0pXQlTFQCheMTWnl2kCc+r7Awcg48HO8ajeYZdLl6Rq8AsseuJzAngjtyPO+hYKCg
	uXJg==
X-Gm-Gg: AYBFou35KlBo7DA6vJr9brjTYolYe/OkKO16gv60VxzAY8HP23Mivt6yoW/XfLMPELD
	xZeqJM8/WBKQSYHjkL+l+Qa3rVdUvlkMTcZOe8B2HCI8jauyXCJc7pYD7sHGjuba+tAit+Pa5QX
	ktXEOffeZ5tyDHlbzb9jucTs0+TjrKH99GoGEQqjiJtGWUnK48/r2dhNeJV/5hAr5E2RpQhrlrD
	vLiDBTOGBc9v/S5Xv4chjKBza2aZeDktYJACDKxnPwzhajV4jfURAQqoFI5GIf7gC/2lupfeuQW
	CQ1O/CJM7zOg/HT9tsG4CNdfcV8nuJSwa+csIGquChxMjKMEXmvYEdrVDs1wiNrruoxsbtPI+HI
	HI/uQyJpt3X0w/T9ys3KPwL2DzL0=
X-Received: by 2002:a17:90b:57e7:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39dec05d7femr8511310a91.13.1789417973830;
        Mon, 14 Sep 2026 13:32:53 -0700 (PDT)
X-Received: by 2002:a17:90b:57e7:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39dec05d7femr8511268a91.13.1789417973397;
        Mon, 14 Sep 2026 13:32:53 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bd8ad03ccsm9880610eec.2.2026.09.14.13.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:32:53 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:32:49 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon
 <will@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Suzuki K Poulose
 <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Sudeep
 Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v11 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260914133249.00007d35@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-2-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-2-aneesh.kumar@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa859f7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=rWZSSP1HmsjXzHu-GLMA:9
 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI5MyBTYWx0ZWRfX8KqGHepb8Wgg
 cymytm9Y5hLz6jJ+ylTJLOAVL/6/5HvF6u13mJ3yQ8CoTtrZUEJohxEwaf+RxUs+X5rWpJX+YwE
 ozxWwIPNDyT9Xq+as5R5Z/H34W0UQlVgVcWWPCvQz95hTFERzfbF/KaBI/6v3QYzynk8HuAkZtf
 5XWNebOhXgZOdJMWrcGEQpF/aZpVgSU+pA/jSxj+T2aGUW9FKpsScLNVjKhCPSVlULzrnBUYiH7
 8lSY2PRjkUl0qrhmZQlL3ops7l93nZFfcxGWXOyw0fuoyDL3eZ8Uw0Uf+8M0c3KQwyQ40F6E2Cb
 ALgv3DFHagfMV7pZq0hS+bJEg+THRhG0ALe+Wk4bFz68ejJMP2OVZmfHSXRvG2DJe7dbNY0C8np
 sZOu9pufGqcg+XE/73BECFr/5jIgFHFVnV5fiASUaGRmem8NxB1nL44m5jpVsLGWTMD1S2tEfUR
 9usKCpgQFouYtA2mjVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI5MyBTYWx0ZWRfX5k455n71wISp
 QBWfyxsBgFyvDTZG1x1OX3ZPR1KvpO9pTS71/aQapIrdxRnpRk/jIMbr9N37Jq1uwYsa+rdsVGm
 3ryap+uxzMVtm3O1iXXDYP2DTEkBExo=
X-Proofpoint-ORIG-GUID: tTwnYpGXzk9ZTy27gEwKQn_1Vv1P_uKM
X-Proofpoint-GUID: tTwnYpGXzk9ZTy27gEwKQn_1Vv1P_uKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140293
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_133256_930604_B57EB25A 
X-CRM114-Status: GOOD (  27.15  )
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

On Mon, 14 Sep 2026 11:35:05 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> SMCCC-discovered firmware services are currently represented by separate
> platform devices, such as smccc_trng and arm-cca-dev. Those devices do not
> represent independent DT/ACPI-described platform resources; they are
> features of the SMCCC firmware interface.
> 
> Add an Arm SMCCC bus for services discovered through the SMCCC firmware
> interface. The bus provides SMCCC device and driver registration helpers,
> name-based matching, modalias generation, and a sysfs modalias attribute so
> SMCCC service drivers can bind to discovered firmware services and autoload
> as modules.
> 
> Follow-up changes can then register SMCCC firmware services as arm-smccc
> devices instead of creating independent per-feature platform devices.
> 
> Based on arm_ffa code

That code has the same issue as below and for bonus points doesn't check
if dev_set_name() succeeds or not.

> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

On tiny bit of fragility inline that I'd suggestion avoiding now rather than
later.  Down to dev_set_name() doing allocations in some cases under the hood
that are tricky to tidy up with device_register() being used.

With that tidied up

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> diff --git a/drivers/firmware/smccc/bus.c b/drivers/firmware/smccc/bus.c
> new file mode 100644
> index 000000000000..caba1a03c997
> --- /dev/null
> +++ b/drivers/firmware/smccc/bus.c

> +
> +struct arm_smccc_device *arm_smccc_device_register(const char *name, u32 func_id)
> +{
> +	int ret;
> +	struct arm_smccc_device *smccc_dev;
> +
> +	if (!name)
> +		return ERR_PTR(-EINVAL);
> +
> +	smccc_dev = kzalloc_obj(*smccc_dev);
> +	if (!smccc_dev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	smccc_dev->func_id = func_id;
> +	smccc_dev->dev.bus = &arm_smccc_bus_type;
> +	smccc_dev->dev.release = arm_smccc_release_device;
> +
> +	ret = dev_set_name(&smccc_dev->dev, "%s", name);

Does protecting the string defeat the nice underlying const handling?
e.g.
	ret = dev_set_name(&smccc_dev->dev, name);
might be better.  Not particular important - I only noticed because
you'd often see this between an device_initialize() and device_add()
and then we'd be relying on the device_put() to clean it up.

So as this stands this is fragile as any error paths that later
get added...


> +	if (ret) {
> +		kfree(smccc_dev);
> +		return ERR_PTR(ret);
> +	}
> +

here can't free the name allocation.

So I'd just switch this to a split device setup - something like...

	smccc_dev = kzalloc_obj(*smccc_dev);
	if (!smccc_dev)
		return ERR_PTR(-ENOMEM);

	smccc_dev->func_id = func_id;
	smccc_dev->dev.bus = &arm_smccc_bus_type;
	smccc_dev->dev.release = arm_smccc_release_device;

	device_initialize(&smccc_dev->dev);
	ret = dev_set_name(&smccc_dev->dev, "%s", name);

//up to you whether you care about const string handling.

	if (ret) {
		put_device(&smcc_dev->dev);
		return ret;
	}

	ret = device_register(&smccc_dev->dev);
	if (ret) {
		put_device(&smccc_dev->dev);
		return ERR_PTR(ret);
	}

	return smccc_dev;

> +	ret = device_register(&smccc_dev->dev);
> +	if (ret) {
> +		put_device(&smccc_dev->dev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return smccc_dev;
> +}
> +EXPORT_SYMBOL_GPL(arm_smccc_device_register);
> +
> +void arm_smccc_device_unregister(struct arm_smccc_device *smccc_dev)
> +{
> +	if (!smccc_dev)
> +		return;
> +
> +	device_unregister(&smccc_dev->dev);
> +}
> +EXPORT_SYMBOL_GPL(arm_smccc_device_unregister);
> +
> +static int __init arm_smccc_bus_init(void)
> +{
> +	return bus_register(&arm_smccc_bus_type);
> +}
> +subsys_initcall(arm_smccc_bus_init);


