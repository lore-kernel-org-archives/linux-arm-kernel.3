Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979CBC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ye0pmBSQNQpD1Ixqlj4iy6xzBJOLNvLjVgnEcTk9udc=; b=hun4uVF7HId9UhCILlQpb5Q5ix
	ZLrlalNO8bmLIwW8ClXs9xV+lzKYRhF6FpTCJOTYHC/IEHJqyDRUFafQMl3PTlve5PXOeuqDc0U58
	1NGDHd2UryzD7jyMbLYUPKAkKGKjzm5jVNwWEc+BSqUc7o5jNGye8dS8QxbaDlM4RbBfCGVkSS+3r
	3nc2PQKuQfUnTp17uj2bVtfMcCBL/AL6fa3MLQpVCawYwPSsgyMcoA+vWpnEPw/6npOefvQnhihjV
	ilW07JQO7HQRBO/6S1/ttvmMQ004RpKENQBSFHXpziVxT/XDHWfIbkurTI4RKG/MqeMkJS4UKTM2C
	2kVL5RWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSt4-0000000BKX5-39bD;
	Wed, 22 Jul 2026 09:05:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSt1-0000000BKWM-3Wgr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:05:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xdm1123841
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 09:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ye0pmBSQNQpD1Ixqlj4iy6xz
	BJOLNvLjVgnEcTk9udc=; b=Lb+Y2MtEJL6mOdAV5TsbUJUb129e0wN+miUU7+Jx
	FKNDJWSplwfsPeWSA75BTsexEAgrOjgg8YE2bYUvzSLlzXEUNJVCXwUydVdYS893
	bOdOWNDMD24CoHqRbkKyJEpijqOu4bn7zvMBMriMWizf/yS6JtJy4YcagRetnnK1
	gknUkbWROgC4UKkN0FHfoH55XHKq7TXfJNJhzW639SSxUN44c2xVgDSvcEDLXlDB
	hCs2m+PgRXrJJWWXe+ORcJfN8vHz/dpE2IHrec4BVz/eTrs4SYxmJFR5yXpAhA/y
	BQNfKX8Zd9oVPNXcY8UD0aKKtfcdblHCz2wjkpuoVOdsiw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4s97v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 09:05:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so4781510a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 02:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784711107; x=1785315907; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ye0pmBSQNQpD1Ixqlj4iy6xzBJOLNvLjVgnEcTk9udc=;
        b=JEX/CVpCx7yor5uPIbTHCyhDQxGNW+4MocEFzPj3E81LRqUI2e9qmUv0uoU/l+mlNy
         NHAeKiThfEZvgxXpDe5JuEm9ImRUhTH8hTfoQ29EipmdQ6HLaXPyyG3ezvuuxSSPPZCI
         58+YsQ0RTmJ4kkkkxEqoWYs0RPBNwEMNErCjND/oxyge85BelVfi/E9w1OWq/2BGIdt+
         1DEOiWth+0YNtkkC/6aWIZgD2QV7ygsoe/m//djV1TmeMRGLA9HSHu+XwJkga7aevsdk
         CQAF6FuUM1V/uXHyJ9HQIPM5XLz8eDY4eW3WkSSr1SVgvoaH4wV5AnSdpD+bui121Npf
         /aiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784711107; x=1785315907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ye0pmBSQNQpD1Ixqlj4iy6xzBJOLNvLjVgnEcTk9udc=;
        b=KadWiC+2eLkF/AnSMFj5zuJjuBuF1VfulM5PvHxqga4i7BtsgG127aXXKdGfGbsZkF
         MW7DKS0L8iSM7movNZXnwtq1LsEfx2EWkVbmTJ28lOj3kjXOzE43B4d32mrxgIgafa3N
         JBy5YuM41P4srUP7Kmiwj/Byray1IEiiyEgasvERKt5bcZsJjzgNKOesBDuur3AnOSeN
         PIGq8oVbWyJHSvvCwClBNj3a7rLPCdLGn6fvzLKEKUG2rjOKyXCy19byvV6kk9NIa6zD
         Y9IXeJnhTS0Xy0bxYAUDzn8I2590bOo0UR0+d6LC2OdH2KICLAWskPYa/KTBBL27iHI1
         bYQQ==
X-Forwarded-Encrypted: i=1; AHgh+RokHF6H8Mp7lnVWNOa9IwG8rAbE2pwYc1N1qiqCp0nUg61+34t/M6Kuzv6l5sQLiFp39mACxX9aZcrSQrOjQZSc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/UbS/SGXKb6wRKON6SP118oW9CNpqxBVfkXVswMEn9rJHWeex
	zFG9/f9hfS6XRbO7RSOrIZTeRM1Y1askFiZUavCDc50cLnJMB4+jESr1+oWyDzwkNUQe5xD+EeC
	eAzI4O6YW5L/cGXTCiDPMeJUCSwCelkA12HScWrVhsrTveewAh8uHd1vbnvZAFp3FULU4mnx2J5
	T/1g==
X-Gm-Gg: AR+sD12M/cayMkAjcI7sJY9FWvG5s5UeObr74rIUd0xP5HFXJioUUwF1fw5PpoNCo9d
	cYEv+8cncWSoY2S5nbdJw7Gzc4cnpTQtf6iw/FxHCTXTUit4OW+40HEi/+NZMICu5JbRSjXgpiY
	cF5v4TZ/J5Ji0x09hfQVdyXZ2EromTS89oGbvk+GVWYi2HQzTOAAkMHkhewyTHax4p9pNF1Aazz
	2gdgqHxhZYVF3tZVMGLxclN5NrUPOmyiYvl8m1WaLaKeZuzPBb0sUztAgjH0pYy7hkneZaICHse
	os2KWJDXB90QzaD4Ac1dsgFy13a7LxTSVGRkm93NfywXpH0s1NuUGpCtrzTCsQJSsS5zeIQ4hvZ
	e6AJzrRqybDJQueeCxSP3Y1nGWCso2kHRIQ==
X-Received: by 2002:a05:6a21:1506:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c3ad665a9fmr23634854637.16.1784711106465;
        Wed, 22 Jul 2026 02:05:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:1506:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c3ad665a9fmr23634822637.16.1784711105994;
        Wed, 22 Jul 2026 02:05:05 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm6811568eec.26.2026.07.22.02.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:05:05 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:34:54 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v23 03/13] power: reset: reboot-mode: Add support for
 predefined reboot modes
Message-ID: <9367ec1e-d01c-489d-aa3a-fb361538331d@quicinc.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-3-e7453c548c21@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-3-e7453c548c21@oss.qualcomm.com>
X-Proofpoint-GUID: SwZ7hGksz1xIJf1vC3RmbgofYhZWJVhX
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a6087c3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=2P-C3DqZnQur8SwEehsA:9 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4NCBTYWx0ZWRfX7bRoyfY1SqwJ
 72j2CdCCKfIStRArYfWgvE5IHoPSBydD2UeJGZXWRVMxkRrnfwliYJ0PRjRS70PkxmuTgSOR7Ge
 0fPQ3vR8ISQjOH8Jn3fIJLvuJu2kq6Ln5Ddwqig1DDNcMCIwkCcL2r4YxfZZZLZcTx/O8v0BfU1
 VuMr/Yv1cQKVugQoOrNX8mvWsNvysNAvCHj5II9ah79x1rUklHjlBIIQF8fNfKY0UHxHeb68L5k
 RJcfrfJ1lu+0guglZs9L4Yk72GsolGPOVPOEumV3Bn3836Ie9rKMUo3+Lum/MRu45GLZMBn8eL6
 g9wMx587fsGayXxV3wJLb6HEDy8VmwLTVKKCITuA+3f5AbMmRgwNQW5BuEBdqfWqOyO1SLPVluY
 +VwBhgQcUo1xsR2jmnPjnVPJf5AEBRdtlFd+6ONCL4yc6Cp4b68FjvjXq/y2grXjkfVndTV9tpD
 oZhbDiJVGRHbwjzdtYA==
X-Proofpoint-ORIG-GUID: SwZ7hGksz1xIJf1vC3RmbgofYhZWJVhX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4NCBTYWx0ZWRfX6XWQSSxdmpYf
 x5ZIQnPFYvD5pjJ5cb5AVgBFeX7bx7WeC7Zz/rd7N/Z+lbQK7eBnm9aIOifM4vrfGffsTggVeo8
 1PsoQprGk5lGBPXNLoDql1D4A6dtZbU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_020507_886385_2CD0691C 
X-CRM114-Status: GOOD (  16.44  )
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

On Tue, Jul 14, 2026 at 10:46:31PM +0530, Shivendra Pratap wrote:
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 34a81e4b4f95..b216c7595f7e 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -4,18 +4,34 @@
>  
>  #include <linux/types.h>
>  
> +struct reboot_mode_entry {
> +	const char *name;
> +	u32 magic[3];
> +	int count;
> +};
> +

I see some where `count < 0` check, should not this be size_t or u32?

Thanks,
Pavan

