Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE1AC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 00:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAu6FAZrz/0nPKw/nvzZjGq46uTuC6g/2xv9LMCM1sI=; b=VU7uMFYqYF8/At0QxLyKRDVT12
	RBZPv3SPohIxApsNqyTVtkElzEIDWLrjKa0vRvzovZp+1PjVxl76PskYG6c8352x7Hj9/GHkbT0Ko
	ixRPkwWPAjo4rXcdz1R1G7GQNFfLWcpqzxxBvkAgp/gkd21bmm7vXmODE6pkyE3AItuE9ohYNEQqg
	ehSztTfPLySvIahuZSVQP9B6fBERSLlY471fGfOYpuqUGSPGTN2Q5icERXiHzTzogjkGYVFMaUVjH
	J2oVvR2dSXXVh4ZYpND+o4NDAGopVShI8lzsQr3y1RtAJaaNjAFX2WB8Pm6JzEhL5r6od01YYfnua
	j1NqN6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWBh-00000000pQb-1CAp;
	Fri, 17 Jul 2026 00:12:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWBe-00000000pPp-3Cdc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 00:12:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNJU7A098031
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 00:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAu6FAZrz/0nPKw/nvzZjGq46uTuC6g/2xv9LMCM1sI=; b=etx8nOtefC7yx9k/
	wcbgY5CWWROFa/aoyBhgrxlIeDoz2e4Dvp73L6PXFnzFXRe2NyxM1csusGqZB1Ib
	uQvBBdt/Jt9nRPPJ3O7owtuA/Z3OzUs2c2H8lXRMnhJscqHpX3jXKF7zl4/0thsB
	6ZlUwX43/3mx7vfSjMaXp9JIhrrVV7Ce6LvkSB9gQN6wOeNtGN9vjCiyx9Nlum2h
	xUzcuuZW6YkQWEN32DisDNRXm7Ei0AMwh2eURNyksFAerjCBcwUzgMeemkx+FZ8g
	EgUklHG9xptAn7JKDoE6kWzMd+BRGtY7lWrk+s+eukOYv2MJYinPZG162u5V0ZKo
	cYX/Jg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u818yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 00:12:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso17035598a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 17:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784247137; x=1784851937; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HAu6FAZrz/0nPKw/nvzZjGq46uTuC6g/2xv9LMCM1sI=;
        b=GpG9zu+j1KkEscMClo1S24GaNjanGzLQl1NuEVT0Cs+KRvu0NpjOmHCejCHgQestrY
         lykIVZbolcLtS3WtR4VRlkgIsCE+i4eBLwK/URhYEyS1LgMFCn4PEp0ICWzfoBR+FH/X
         YYHQ3qvRrMeh5AZMCU4+7K2vGJKpM/JeP5+4G9EF6ShsdTnP6rJd+vpBlGj6ucbpVEX1
         Vxg7lZOt6xPD05DvKXVrGr9lwrwL1LSdhcGaPwWP8pY/2slfk+/0+4fgIitIHM1egIn/
         pjsjF77oSs+qGyBjIbPNq4KTPoHHkl2AGP8c6y0wjqe/EpgyDffe61nTLX53LVsYa2DP
         T7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784247137; x=1784851937;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAu6FAZrz/0nPKw/nvzZjGq46uTuC6g/2xv9LMCM1sI=;
        b=lOFciRUVJG+0kWMmxTQzeTDtbo2wz/HLa6qC7R0PVxwnRSHOHybutegSQRwSJxBha9
         SRwOX+XuSoqLhJOtvEmFEguWwAMjvj/TB8GHzHVP6cKtUUjpFIBmFerpkK1xwIGJ3auH
         S4dVvisjxAD71TpQ9srxi2bJtBHhHNREsSfPJkYWU1PFtOz6sCo3AHxa1rjum0a58FdO
         aiCIiJED/4+Jw5D1kyRCT5s2IvnaeB/EjjU/h3tzgrwpTwFXve/ddRQjmkllvU1hoRPo
         1APZtHBxeCjaq68zVHd9Y9YL+QNq4FYT0mqgrkSsHMi1vInqxlxWIvULYD5/0sahgn6s
         hwnA==
X-Forwarded-Encrypted: i=1; AHgh+RpZq7rU621a7RTKisdy1vFaHbzaMZsfgjpGTie5uvY9jmJxZi/IfPaRSH3V4Unp0Vg5yT1rvqi1DyBdz97tvCTG@lists.infradead.org
X-Gm-Message-State: AOJu0YwdVJUuTvajnSyl+JfoxQQ/kqinBNceDz1I7Udo6suYtdUpyF1c
	ftwW9oZpFckQQhbcDZoXoEptKLYWJUKxfE3N5F2XMlatKJpenPktLIg2xyM+QrkF2xHwDE8fdkd
	V5zLnkQOsS4xpQcMUPzye6E3Zc4gGRDmenTn5wkOswt9X16F4lZk0IvHRwjc52tqkyxG53fAkbm
	3anA==
X-Gm-Gg: AfdE7ckRregwpmU2MbjnqTQVLogS+UIPq2C+6Sh+kzyNuvUFuoLWC9KmGQaX0/H1G4E
	f8V8zyooHvZ7DEclIoxQVrgoYR/cMRVTm7qrLEQBV6Z66L/rX9QsvaP9dyRpi68a+JYsppqB6vT
	P+N1eBTzoqrJCY+pzBIupp9TNB7rmDxUX3yeFkX9o7hlSACLOL9wC3nkxG27xxFCjg25k/uLdw+
	s08UrfF9E8LEdsuDTUkV0TansMSGlIEuMdVeV2oYtkzMowhGbYLqIM5LznTfnTPo6ovvrJCM0pJ
	dNzaTkXQhv+cvWoUl2C8r1BRoCUXVN80JK4Bb5cS8Fmbhz/8Yk2Dyq2955GHuC+4WYrHqJDKwJW
	k7lVXGxqeKc6XwToEWQAklQxgjQ==
X-Received: by 2002:a05:6a20:430f:b0:3c0:9c18:d5a4 with SMTP id adf61e73a8af0-3c3ad997edbmr163340637.65.1784247136992;
        Thu, 16 Jul 2026 17:12:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:430f:b0:3c0:9c18:d5a4 with SMTP id adf61e73a8af0-3c3ad997edbmr163313637.65.1784247136490;
        Thu, 16 Jul 2026 17:12:16 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd42a155bsm14958468c88.7.2026.07.16.17.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 17:12:16 -0700 (PDT)
Date: Thu, 16 Jul 2026 17:12:13 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com,
        ilkka@os.amperecomputing.com, bwicaksono@nvidia.com,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v2 3/4] perf/arm_cspmu: Improve sub-module error
 reporting
Message-ID: <20260716171213.000026c7@oss.qualcomm.com>
In-Reply-To: <256bcb4c8c98dc95bfdf295adb66b917545c919b.1784213435.git.robin.murphy@arm.com>
References: <cover.1784213435.git.robin.murphy@arm.com>
	<256bcb4c8c98dc95bfdf295adb66b917545c919b.1784213435.git.robin.murphy@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDI0MyBTYWx0ZWRfX9HObHusoJP5D
 YGYqvf83940vo1MB1tvywmaR4VgBjjw0Ko9BmxxejLEBSpKfhjrFKYTleAeS0mTenYS6WtHgivi
 1R13Eh/iDRAgOFYF3fovHyYLdpIeF+hvC3iheI/eYqh9J8FWYj7kO3JQFUY4QZAK5AZoPBDCFwJ
 mDOR1XT57wHz45uBqDHZtxb4PzDFAbQ3mF/I4Grbtn0vkky+llqd+qM6AjEmswaWUZYyYsJ3Z6v
 zP/upNEJyPR2bLZ0gysYstxfmHinYWvXWl81J2qrbG4apXXwFQOoXyF3/3ssZ72afdh5MeoqMLo
 QKwBmAufjT02z8ERvAXxXMOh8rSq+Trc+3b6zrBGemFgX7xFAfRsF3GksZ2vYPKDRf1xT6Pw7oz
 1Tlw2IszrQ/zL177FJ1yflFwBzye2sXvQu+Re/RGGQeV02PNyP4TlwUOqevmjxgTgTKb4+uaiz/
 YQf+4nUpHPTADyjV1uQ==
X-Proofpoint-ORIG-GUID: sKQNLvP8KikBxaeWOC9hKnNpDWGUAjqs
X-Proofpoint-GUID: sKQNLvP8KikBxaeWOC9hKnNpDWGUAjqs
X-Authority-Analysis: v=2.4 cv=VMvtWdPX c=1 sm=1 tr=0 ts=6a597361 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=vzhER2c_AAAA:8 a=orpSRISjaG3fHkWwNWwA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=0YTRHmU2iG2pZC6F1fw2:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDI0MyBTYWx0ZWRfX6/vDZWOJjHnZ
 7soItPd8nu2ONfFuWXGP166T/9755HQvJTrONFsujwqi7j4BZgKN8pfYn5NcPmU614sutNsFsZ5
 BM5Ce+coPYQgh0xCG7oMnsGrSHoZ8j8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160243
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_171218_825241_952B8415 
X-CRM114-Status: GOOD (  22.30  )
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

On Thu, 16 Jul 2026 15:56:36 +0100
Robin Murphy <robin.murphy@arm.com> wrote:

> When waiting for a sub-module to register, we return a bare
> -EPROBE_DEFER that ends up showing the end user:
> 
>   platform arm-cs-arch-pmu.1: deferred probe pending (no reason)
> 
> wherein it's not necessarily clear that they might need to take some
> action to ensure the appropriate module is available to load. Let's use
> dev_err_probe() here so we can show exactly what we're waiting for.
> 
> Similarly, in the case where something's gone horribly wrong with an
> already-registered module, we can use dev_WARN() to standardise the
> device/driver attribution rather than just open-coding "arm_cspmu".
> 
> Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Hi Robin,

Maybe sprinkle some cleanup.h magic and use a guard(mutex)() and direct
returns.  Simplifies this function that you are touching anyway.

Looking more broadly it'd either take a scoped_guard() or some refactoring
if you want to go that way cross the file.

Jonathan

> 
> ---
> v2: No change
> ---
>  drivers/perf/arm_cspmu/arm_cspmu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
> index 8c2dda17d73e..caad9a36651d 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> @@ -437,13 +437,15 @@ static int arm_cspmu_init_impl_ops(struct arm_cspmu *cspmu)
>  				if (ret)
>  					module_put(match->module);
>  			} else {
> -				WARN(1, "arm_cspmu failed to get module: %s\n",
> +				dev_WARN(cspmu->dev, "Failed to get module: %s\n",
>  					match->module_name);
>  				ret = -EINVAL;
>  			}
>  		} else {
>  			request_module_nowait(match->module_name);
> -			ret = -EPROBE_DEFER;
> +			ret = dev_err_probe(cspmu->dev, -EPROBE_DEFER,
> +					    "Waiting for module %s to load\n",
> +					    match->module_name);
>  		}
>  
>  		mutex_unlock(&arm_cspmu_lock);


