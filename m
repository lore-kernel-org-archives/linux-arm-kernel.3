Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8B5CCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 08:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKQ5jVf0l4p+IXXgicmYUBfdOUjcnM90HD067+of6oU=; b=k3U0prCKNQhEMfIZg+RxUjCstO
	S7Xw7Ej6Igx50P5dvJvLUegyAbZXOmHsgRrO2qoKbVU3bPjMQOVQEhHfkjU7z0j3TZEvLidRg+4nP
	Y2uHOj73w0uJ1ez5k/bcLORCbINBdPHC5RZOd2vf8mEnf7nGFllA355P50FGhoh0Cdkti0CkuqpLJ
	04BpANILsqpH/GypYmdKy+dz0jaCffeS0kxol5SvKXPgzi7V07oFlkRyGf7bb9KSNwe79/RfR2TyY
	NFH3p5xgthj0zDqczdvojTkVyFcrWbpTu/eZ1RyzNb/wMdtQG6Oj1qapp3e5OLNM9v/G1UgAlReQZ
	iet4ykSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENk3-00000003feR-0XI8;
	Thu, 30 Oct 2025 08:10:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENk0-00000003fe4-267y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 08:10:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TNceia810615
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 08:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sKQ5jVf0l4p+IXXgicmYUBfd
	OUjcnM90HD067+of6oU=; b=O+yO0p9BDKyV8PNn4MnfKFPmGYM6YDHn6ZBQiHeo
	BK9qB9UmT2+yrEpng4Ytd04oZ3GhJU6ix1gjQtGbXnR7uX0YUWbTM3oIrHBHdcDv
	8nd5/qgkyVEfbNQ/cKQG008O7J6qEU378LWWS6BfV9ggbGfVciHqLpSKJ9TeOFcQ
	gb2WakR+4GUa+a/96Few+2O3EGE1s3+a2GJF4jmxJu/RBmCrtMWjWOKjV9eehUGd
	VQVg5ORBQ4QGw0H+P9sbvB0DHs9T4tnH3+fNaAu3zBMfNus/JQ5bfLIfut6c6eWA
	27FPTj3cxJdU8brWEcrhwtr9ej/6Eu5383EuPCEQtzrGcw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3mvgas2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 08:10:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso1448826a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761811838; x=1762416638; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sKQ5jVf0l4p+IXXgicmYUBfdOUjcnM90HD067+of6oU=;
        b=XwX16/kxftTmknWg8q0MAQZQPVH68fb6yc+LSCjaDQqEYnm4ZFkFCjA76ENW3O0c1V
         0o7tKE5i0Ao/ccwJHcELPkFRBim5x0FRPR12RiMrPM5IgV4CZZliRFpGsGG9iWtQnbWy
         sYpBPG15OdDkhXFaO8pbGPtv8CegOM3jBcR9j69+9JicMZr68uh5ol9EwoEfHpIDnTSS
         N8btmgqmf2M1zV2bRdqLr9rrGZcTN524/qU94nOGJ5SbP5T3/pT2tIzwWvTQotaOVM+J
         VL8ZLC6pr/T1p/66yeDc5cM9D1ZzLl3h1R9Hpmu/X0Q/pTLqg6dTkoO8RyVLaX0JQStI
         XNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761811838; x=1762416638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKQ5jVf0l4p+IXXgicmYUBfdOUjcnM90HD067+of6oU=;
        b=GEaA1Nq4zTGIz2eq9gyps9zEMtU504HtNgGFoU61V23O+D79p1Kk2zlfJUOAMBPDxj
         C0EJqQ0Z/KeoXcZtO+VuZR+TX4/FuFNU0zq+40GfqwzryxdQJpTzczLaQOPecs20hsuh
         4Yt9kZKNno6kofz8tM604V2j7+vUMpfo2pQ35UG/jB1xsFjPRXv9uAboeouCYcH+C2z6
         xAy5Z+qdKm0RmIVtKoLIy9aj8ae+ggDhLzvFtQW3ygVAdl3zz4TuONJGuQmmbAVFKoPJ
         BxHMPiJgx+PZIjvbq3pWZQBEGPRh55ekjssYPCfQAZzMMPVFt8Xm4NeO0YClpoafGEtd
         Uavg==
X-Forwarded-Encrypted: i=1; AJvYcCWnyYNpHs7Nm5mx/4C00HXCWzL7UN28m1HD6y28wdt4UBqkPm3nYjnEHln9mLqiMoc9Lg6vP/Zq8GJljMY90pbU@lists.infradead.org
X-Gm-Message-State: AOJu0YxK1h3UGcIxButkQ3qS/Tt7FPEon8WQaNMk7FVNI5XKlyhCxlcJ
	aEdC7upMfPu5mpZEJIN4zLWpMN19MlC0UyrclQxVn1pCk82MNE6MQ9wKNYHRykRTDy776PLbmS6
	rfn5hkm8/bEP8fjWLIZowrM9tg0029y1JS5UKr2b4v6k+RjGTXoocQpQZsv4v/xlVZi6hwe3c68
	lT2Q==
X-Gm-Gg: ASbGncvwkqvnEF6G3R2LNIFAdaMmk2ZNYNyn4CjpsWlxQLgQtZG8AoQsdPvzD5ZKBqa
	/LjKH8jL2D9ndpKbVJ1dUN7E+1w1sHrIvHjI6Xn2uPm0j1CdbxVVw1Y8iksME2YSwPBPZS1d/5b
	C3SEVTf4ZPmInxNrnM/4ddxe0Jt8gS5672fs+JeN7aCX8lZY1O5J/Sx1bEgC9+Yr5RJvZCFiVqf
	sOpNlehXhWPrWqkrEQ/PdMUR2avyIsGuftPGF7D0iSKmbUQcvA8XxFcm+ge74XOyHqV5y4OLwhW
	QGs/TCL90IL2wq5Weu0cyFaIB59X7YFpGJ5bR5eFlq1xSi5Iz3xQNUcQp2DuvY7iSJFUqbpGcs/
	akG/cLkAuEzDdQxnivXrPhOP9e6QFoEsw
X-Received: by 2002:a17:90b:4c10:b0:33b:c9b6:1cd with SMTP id 98e67ed59e1d1-3403a281deemr7057762a91.19.1761811838224;
        Thu, 30 Oct 2025 01:10:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcXwJ16VDmZHn89sViUhOlCtgQOUsBXdbwSglJJN9TfXEZWwsHddtgf4n3/AsvcnxW7oW5+Q==
X-Received: by 2002:a17:90b:4c10:b0:33b:c9b6:1cd with SMTP id 98e67ed59e1d1-3403a281deemr7057701a91.19.1761811837588;
        Thu, 30 Oct 2025 01:10:37 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340291158c0sm4612475a91.1.2025.10.30.01.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 01:10:37 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:40:31 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/4] ACPI: GTDT: Generate platform devices for MMIO timers
Message-ID: <1eafe745-068b-4c15-a3d0-14e7222970fd@quicinc.com>
References: <20250807160243.1970533-1-maz@kernel.org>
 <20250807160243.1970533-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807160243.1970533-2-maz@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA2NSBTYWx0ZWRfXwVft0ktCVWqz
 /oomIULyOSk5jBUfvXIx6PFTcFqGfgN8QOaqfnyV77cIBpHxxXogY811D1t+1svemiQdllhQtop
 +ytCJhQJflwHP5VGfVDOvK8ISDzjSFRCNBiTyJEeXJWuQg5heO+9igOalNFhbwCiqrCAKji0AXz
 dM+46fZtzYwQ/vgBarxgfW27t2AL/tzAuN/4DRQTLpUOrO2IlyQGZ+q505rfM/9kmnKsiFDv+sf
 PbRUz9bm4zrhJmEUMHh/QyisEhOEPIglSwy0F//xpW/sth6uzZOtsGHYcHAbVefKLGDr4DHF0K4
 eujXnAqROKw9595l1R0M1nfvIkZfIsWtKKv4j2ERb0qM6wEIGoGmbvmD1ADr9fY37mTer+QQPDw
 OGbD3nDGFNmJVSHQ55VQSV/5ITDdUA==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=69031d7f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=XE_7NARKTCcpHfg7NDIA:9
 a=CjuIK1q_8ugA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: bbgXqKBEu1YN07OWcI8HWTkw2LR6O4-a
X-Proofpoint-ORIG-GUID: bbgXqKBEu1YN07OWcI8HWTkw2LR6O4-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_011040_546961_5F4426A7 
X-CRM114-Status: GOOD (  24.43  )
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

On Thu, Aug 07, 2025 at 05:02:40PM +0100, Marc Zyngier wrote:
> In preparation for the MMIO timer support code becoming an actual
> driver, mimic what is done for the SBSA watchdog and expose
> a synthetic device for each MMIO timer block.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/acpi/arm64/gtdt.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/gtdt.c b/drivers/acpi/arm64/gtdt.c
> index 70f8290b659de..fd995a1d3d248 100644
> --- a/drivers/acpi/arm64/gtdt.c
> +++ b/drivers/acpi/arm64/gtdt.c
> @@ -388,11 +388,11 @@ static int __init gtdt_import_sbsa_gwdt(struct acpi_gtdt_watchdog *wd,
>  	return 0;
>  }
>  
> -static int __init gtdt_sbsa_gwdt_init(void)
> +static int __init gtdt_platform_timer_init(void)
>  {
>  	void *platform_timer;
>  	struct acpi_table_header *table;
> -	int ret, timer_count, gwdt_count = 0;
> +	int ret, timer_count, gwdt_count = 0, mmio_timer_count = 0;
>  
>  	if (acpi_disabled)
>  		return 0;
> @@ -414,20 +414,41 @@ static int __init gtdt_sbsa_gwdt_init(void)
>  		goto out_put_gtdt;
>  
>  	for_each_platform_timer(platform_timer) {
> +		ret = 0;
> +
>  		if (is_non_secure_watchdog(platform_timer)) {
>  			ret = gtdt_import_sbsa_gwdt(platform_timer, gwdt_count);
>  			if (ret)
> -				break;
> +				continue;
>  			gwdt_count++;
> +		} else 	if (is_timer_block(platform_timer)) {
> +			struct arch_timer_mem atm = {};
> +			struct platform_device *pdev;
> +
> +			ret = gtdt_parse_timer_block(platform_timer, &atm);
> +			if (ret)
> +				continue;
> +
> +			pdev = platform_device_register_data(NULL, "gtdt-arm-mmio-timer",
> +							     gwdt_count, &atm,
> +							     sizeof(atm));

Did you mean to pass `mmio_timer_count` as the `id` argument to
platform_device_register_data()?


> +			if (IS_ERR(pdev)) {
> +				pr_err("Can't register timer %d\n", gwdt_count);
> +				continue;
> +			}

and here too.

Thanks,
Pavan

