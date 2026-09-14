Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E81C88E6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 20:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNbtU+fYM6Bse6/ahm7UnypPYDX2ByCgnI422mmbSzw=; b=yJnJoStG9R8f7kYKZ/yq9bqWBR
	R9clKCS0uXV+QGeSH4V4om4KqV0RfxQ0P6atlaSXrfNfbbVh5ieuu0CbhoQLa3liFoS+T+jdnnFrn
	/JrF1kUf63lLUgR8D8vbBNV7N8xJI8yYazAp0Zmo+bWVWFGfSYhDmQyp8eiPoGvIW3MJ4qEkCyRnj
	adAOBqh8Z37aJAsdQup1yTwTj/bhIQ3erHAYmX0Bxg/J+4voylM7u2iFqCPkzNcHNmFBxjMqxuSr6
	Oxx9RQ+J8KXmQahw5TPYTBIymEaii8fSqbxtCP87IGiP50FPxoTTKBwlme6Cj76yX+I508vCi/LvU
	xv5yQvAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DbY-00000004d63-0AWw;
	Mon, 14 Sep 2026 20:48:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DbV-00000004d5i-0UaC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 20:48:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYdNf2074512
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 20:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNbtU+fYM6Bse6/ahm7UnypPYDX2ByCgnI422mmbSzw=; b=YfjqILKR54Hcu7Ag
	fnSJtdYq4XcDNViCQaRA9/je893O6NtKOZOlV5Hc10pnpWZvK8b5DldupNePKVhR
	6D/YwP0eIaaWOTL4X8R1jlV1aLRiwePlvvuLoHjbxjkqbvtv2GmAQxizwPCuS8RA
	JQ5SrvTdezavOG9dOYfGQ2HxX65GcMH2mbe9yGk1NpyZXDT3V/LlRySk0JJtgnT3
	+2l6YogzrnmqJ1RMaWrkI0irds/sZegCTxg0Y35a6OmO2jFiASRY3bjPawZnL/An
	bicjOpWu7lBhZkFxAZF9tH0dRLQNfhmUoIqKRJidebYXpxmobzm5YBwW4jfTh1+O
	aH0XXw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevtwcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 20:48:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so4606455a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 13:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789418919; x=1790023719; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oNbtU+fYM6Bse6/ahm7UnypPYDX2ByCgnI422mmbSzw=;
        b=cEhOSxzeauRs8DzCAZkeAa31jL68VVa+ijbC9pduou7EEjUmGvKLkX/s2Vpu331eGt
         YV48/0QmNUJskaB9sJ+/TsZ2jnqZRn587pUA6uxo23qCoSUnbYrmTYTa3aGmP5Kr6cQx
         8lw8zLep2jwKR0DEO7VXg39haqwBc3LriA08sS2FqK8D4RBJKPDTSPUrk1v1V6drrWWP
         wGVZu2M6vL53Di+zokIfwJ++9kiilqPEsiSHjCpJFjBvN0Vh7YxlJJO2eHeNh0lAZUY7
         FE20n3rpyEuOV5m7q6difch39E7+ONQAS5vGRLBaTnhJaD/ihVxndne7V8w6koohX2j2
         +oQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789418919; x=1790023719;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNbtU+fYM6Bse6/ahm7UnypPYDX2ByCgnI422mmbSzw=;
        b=eJ1elWlT0QpmUSZrX3gQjKf18IGHC/AsRMY1RQteSKMpifdJHJJYu1zPGW3qlNb109
         Lmvvw/Yp/5SmhBeLud8riGqxGlGb2e2LUEE+R3slCgAf98/52nIz9jmrhnEyHnV12V4Y
         7o8Vr80TH0HiyVqe2PoPPh+c8qCBuZ0guyl0UWPrkB8W/eGNc7h/kSRsKVdwnTrRl1hE
         +zRX+Zm2MXzldELFJs5tAGizbtP1sMRz3Llm0XknW7+aVHEsFaE5duqF/Q8Hb1ujkyQI
         PF744KXOMEKpWsNVgWyL8JTlF6XclioaevY0ByQHI95YQk9jC9fVcq6g/4BcK7UuyJnx
         nlpg==
X-Forwarded-Encrypted: i=1; AKwUvBxJ5+dEIsnAfl1VA/R6Ns3RBxSsxVeqMlIjqaXNFuF+VKCzSi1Z6V7lx5QdAdyLyQpnNGya0zdb/xmmNmW2ZF53@lists.infradead.org
X-Gm-Message-State: AFuF++lR1LQmoauOsVV5W6aVV3UYcTXu4Tm0IHAyjxZwuaout/cuBRZV
	IaLiaqipnX1Sywt0DQUqnEifSqKlD2134Z55pUnxMuDxVauxAWLi7aCplSYjWBh4IDC+BtCfE++
	Jp7/+I+vCyQ517U2CAKHOvoMNRYPcvrn8HhoO3McKghp55Ej+nefWOwsx11KO2Iccjmx5RnP4Dp
	Fk15pwGKTR0A==
X-Gm-Gg: AYBFou2X3TRIutx/OVRMP/WM6fbXqkGJ+e4n5rJ7nbW0C2qndXTooZ2Cq2qYOkreb4x
	2YuMKbpZBhwrapY8nYkKVD6GZmdkicVdfaoLmyyk8zD9rqI3rEjKYmG/tfwf/NRj7Jki1Wm/kHe
	z/nfXApHBTccHOekygDqW0aswlfvOlnBdg1AXNHZkngnBluWkehr8W/f9zTwwGXsxFVZ3JEQNFA
	OCaJKLlTuX6zIolVZC0WzUOfygYMwXQrIWWsCaxXvJo4JApOoGbzy+vO64mdv49v2rsnenjIIlQ
	FHvtbOu/cxUjpC7FO5Ulx6tFapMsfpibmFvKkshae4mXyUajg0YNxdSXFiv1ixjZ8LU0FCGpKk1
	KjUsQXfsx2LPcr4joRcbM4lEypfI=
X-Received: by 2002:a05:6300:6708:b0:3d3:ae40:51df with SMTP id adf61e73a8af0-3db405679demr8759764637.19.1789418919015;
        Mon, 14 Sep 2026 13:48:39 -0700 (PDT)
X-Received: by 2002:a05:6300:6708:b0:3d3:ae40:51df with SMTP id adf61e73a8af0-3db405679demr8759688637.19.1789418918602;
        Mon, 14 Sep 2026 13:48:38 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm18430177eec.9.2026.09.14.13.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:48:38 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:48:35 -0700
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
        Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 5/7] virt: coco: arm-cca-guest: Rename TSM report
 source file
Message-ID: <20260914134835.00001fb3@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-6-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-6-aneesh.kumar@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nDoMmf0I_TbhkwS8pwKNP-bwBge-Aw0O
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI5NiBTYWx0ZWRfX9/FqN6O0u/Hl
 uWpzwLxpyeQD3nWmaV2ptKrltVE9XkaHXVdPaXd8dY3EI3/kagNcFr2dZARWDSn39dg+S8EnccY
 XcgewstpzNCeqNxzXmSVSYgJAe5uiTw=
X-Proofpoint-GUID: nDoMmf0I_TbhkwS8pwKNP-bwBge-Aw0O
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa85da8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=WpFFXPemFeC_EDwlIHcA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI5NiBTYWx0ZWRfX1q9ha7zvyKxw
 WRaEBDwDS8PKwtRpM2EqPZ/eFUO7XIFcAZN+sV0UNprAA9DlFqlU+1xSl2gcoGjYEV6pcF7cpFU
 R9qa90/xX559OPR2k3g407qfIuReScXyTmaenNtqktSFwPlNkmjNlXGOYNhbXobXoPCzBV/HxqX
 wew0QkACI50WoxqB2ckWaG+7oyDrHQMKoyUX0clQHrbN6d8+EEYTzRxzxVoM6aOfkQpWYZtz1jG
 lt6OA1auYj+yS1XEGy9BO85K5X3zuHnI1KfXwukHPzEaczGllXJQOEK5uEmvd6R8+/CgNF0gnOL
 pN6kXxUa4+uHbs9qu+gER6AHBCBuHfAKMlH2v5vvkXdWThi1/f8KFVmpEJw08UD7eOXMR1OEcwH
 MV4Y/FK9HWjUi6PPAcfT4xwEszlqN4TA55UKPGXi9K+PkKgZrKmNeH+NakUa8RPg9EJvWVzBvi5
 o50JQum43mJZLlvcFeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140296
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_134841_276659_534EF2C7 
X-CRM114-Status: GOOD (  24.91  )
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

On Mon, 14 Sep 2026 11:35:09 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The Arm CCA guest driver currently only implements TSM report support, but
> follow-up changes will add more TSM-related functionality to the same
> module.
> 
> Rename arm-cca-guest.c to main.c and build it as an object of the
> arm-cca-guest module. This leaves room for the module to grow additional
> source files.

Should probably mention the structure renames that you have in here.
I wasn't expecting to see anything other than build system changes and
a file rename.

Jonathan

> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/virt/coco/arm-cca-guest/Makefile                    | 2 ++
>  drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => main.c} | 6 +++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
>  rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => main.c} (97%)
> 
> diff --git a/drivers/virt/coco/arm-cca-guest/Makefile b/drivers/virt/coco/arm-cca-guest/Makefile
> index 69eeba08e98a..7564f4fcc4a4 100644
> --- a/drivers/virt/coco/arm-cca-guest/Makefile
> +++ b/drivers/virt/coco/arm-cca-guest/Makefile
> @@ -1,2 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_ARM_CCA_GUEST) += arm-cca-guest.o
> +
> +arm-cca-guest-y += main.o
> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/main.c
> similarity index 97%
> rename from drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> rename to drivers/virt/coco/arm-cca-guest/main.c
> index b741643d1364..80659f0885e9 100644
> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> +++ b/drivers/virt/coco/arm-cca-guest/main.c
> @@ -156,7 +156,7 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
>  	return ret;
>  }
>  
> -static const struct tsm_report_ops arm_cca_tsm_ops = {
> +static const struct tsm_report_ops arm_cca_tsm_report_ops = {
>  	.name = KBUILD_MODNAME,
>  	.report_new = arm_cca_report_new,
>  };
> @@ -177,7 +177,7 @@ static int __init arm_cca_guest_init(void)
>  	if (!is_realm_world())
>  		return -ENODEV;
>  
> -	ret = tsm_report_register(&arm_cca_tsm_ops, NULL);
> +	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
>  	if (ret < 0)
>  		pr_err("Error %d registering with TSM\n", ret);
>  
> @@ -191,7 +191,7 @@ module_init(arm_cca_guest_init);
>   */
>  static void __exit arm_cca_guest_exit(void)
>  {
> -	tsm_report_unregister(&arm_cca_tsm_ops);
> +	tsm_report_unregister(&arm_cca_tsm_report_ops);
>  }
>  module_exit(arm_cca_guest_exit);
>  


