Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C61C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 22:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ld7zw7w+D26Vm9Xh7U9t1auGYWtusnRjK8Wbc8/K4cM=; b=YJHPpTGtu9SxNk0sPZbQDzB7o4
	r6X/O4cquYiDv1ZVZd/NrgqqBRgagHPv2ErEOQs5XhwD5lf88/dVF5hHSVowNPfO8PeeyxpeNQ09i
	iyfpwrS+o8RBceiiBV6c1nMVEf4B/6vtEf5tamotx+7hCK3/tnh1pUwhcgVZxUork7mhOCx5uLhR0
	deuqpbNACAM7OgS3nvmSaaOmAgHkC9Fpvl2+2RpoVWd81bXQLrLcnci3QKIhJ9x4kukaI2sgYdiWk
	Q+OOgsvs/qkpZcgYKMFRn2ekm0FtPJ9zEuV3lyg5rIJjO6NJDgJgT7Y6QeHN84MR/pX5zEtB0cqO/
	GP4xl3IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1QL-00000000cr1-08qB;
	Mon, 03 Aug 2026 22:46:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1QI-00000000cqe-3ezD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 22:46:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Jkn9H1391015
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 22:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ld7zw7w+D26Vm9Xh7U9t1auGYWtusnRjK8Wbc8/K4cM=; b=dPncHTobnieZCTIS
	aV2nCorCPU64e2QR3wyF39PfwkyWWfPb5p1zCOfcFPdEsnO5o5Fmh6j+XqtBcNBB
	YAuFwaBl85EaD9AJo71YhJksIrSNUj62+N55Sfav8/oqPLcPu8lqwa/ZXJM6lg6J
	rLI95LirSEwldK8H1vI9H9U/VMyLYigYLR2HpxThX4d199tRxmcmnubk+MwIaaPl
	DmbYDYZdZYu+tom7JapFKeE98l7JpdefnrortprWgcGh6p7spAI9TAVeHL3QLMeJ
	7QrVT+o84Yj0iX+pAxomt0ltWQs+rFUQBjNYYoxdo3G2/Abbg3qxPfmF0i1csJZb
	kybqWA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp4r3yfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 22:46:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cab041eced3so6181517a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 15:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785797177; x=1786401977; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ld7zw7w+D26Vm9Xh7U9t1auGYWtusnRjK8Wbc8/K4cM=;
        b=Q4ssfVZQbt6HDrmkjlzqSWe1zsuw9PMA6YvAXsceHyP/RrYHS3lhro5MCRhFEgzbob
         aPq7g1ssLeHUckrULMjPJZiPk2TI9LhdKCFtxd0t57lDW1fI4cVtcdJmUIfnDcrtb77P
         wo6AvPGqaQsHSuLXqgXyakV/ecjkNe8umHHeKclnxOOSm94ZAoCzNTx2rsJQYIkXOR45
         l+okoiUgXwr8rfCXlpSkSgqG6XFHOvDs3nYBIKFWuLfEtXiw6P12sQozseSMkeLPVYa2
         0z5ulo+uj/8Jxcdqvk6OHyypEtqlCraOG1bkFkFygPlw/pTDwFZUmzLh9selJc2Q87ij
         k+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785797177; x=1786401977;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ld7zw7w+D26Vm9Xh7U9t1auGYWtusnRjK8Wbc8/K4cM=;
        b=bqWBgbdH6+iKURqJ5jbfNy4CRbnPPlRU7i2Dv5Zt2XO16zWEtEKnk1W0mgVNSQKNkd
         vcTbmQgeSW4m2E9WnTWLdc1uE5YudYWyHWXLCXyiUTH79rSIn8YFP+Djyvx3IWbo9yUp
         yAtT+TdmEaSf+I69KdinYcXT57T+x4gVbC+EV/vRoR/dBT1n/35etgCh5EBhsB1t9420
         GrDq1m97WLC/lpnGO2iEnNBiao49KFxN3I2gAtLTvYOBVSNF2DLV8U8DyKtfXDr4hFLK
         J20se3yonK+JQbGfrPbocOf51Zb+sHVfZ+292z8+UlG/xuUrAxkaofMKmGV+nmr0lE/6
         Y/wQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqq79BohtLoN7/fclZSMDUbenqEEwvzI/n8dAbygxbg/BDup7ae4Qpxc1vcMJ+KuoIo5j+LRdGfMzYoNAGYdbw0@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc4WSuGyRMP/QcqVILhASEfEu3ezyIHuEzvXCUUI8QFTdEaD0Y
	ZF87xgjTRregG5WcdGOsaJViUgex/tcudKsEfWzE1Piv8JMFy+zRCGdB7yXFZcWLUpHP+2ozI2Q
	aDU+vcmtt8Jp288duaMoQtCoirnd5bjLzUUiUCPOnCUCJ9JbQ7CkXH3NMBRGsuL0Kw+q0h2JEZ4
	jZHQ==
X-Gm-Gg: AR+sD12ciEe1I7bbiwPF5WYGJThDd2GRWzmkzj4Ysz5g6zbZNvVbkLi1KbHLbSIzMdz
	yhPlmbjQltFjOxPQaSJ6q+n5Cah1rssXU8meHbTWdQ54qOXzt9Q+QSI6tKpv12r66mkTZSgDE7H
	fzhOBZ9i7b1wzegQ54rpAt4cZVrDNDnOEwKqksc+YVwSLPzJJeGdpp/aU6mOVSNIbWUcE4ziLbJ
	hUtb2vlGE+dBMwC1WLblrsOAPBGpBCxo2xwJgVUm4G43ZzDiY5OxDFSsBECAt4B2NmOtNnJ6AwN
	S+zE3CZMUVh+J4iZ8aniD0xECLHqY0CTUqjxcDOtBoWgNobOlHrXnxgQfrCszjdYCvLKechV8jQ
	t08jSyiYzsoMgwbZMrYWwQZkvew==
X-Received: by 2002:a05:6a21:9f10:b0:3b4:931c:3c7c with SMTP id adf61e73a8af0-3c92a7bb452mr11971730637.44.1785797176770;
        Mon, 03 Aug 2026 15:46:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:9f10:b0:3b4:931c:3c7c with SMTP id adf61e73a8af0-3c92a7bb452mr11971714637.44.1785797176358;
        Mon, 03 Aug 2026 15:46:16 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab2530c0sm34545273c88.8.2026.08.03.15.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:46:16 -0700 (PDT)
Date: Mon, 3 Aug 2026 15:46:11 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre
 <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan
 Cameron <jic23@kernel.org>,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait
 <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma
 <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 10/11] arm_mpam: change MPAM-Fb error IRQ to use a
 threaded IRQ handler
Message-ID: <20260803154611.00007d6d@oss.qualcomm.com>
In-Reply-To: <20260731170324.2927758-11-andre.przywara@arm.com>
References: <20260731170324.2927758-1-andre.przywara@arm.com>
	<20260731170324.2927758-11-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X9Ri7mTe c=1 sm=1 tr=0 ts=6a711a39 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ePHNPm31KbGbtx5XAOQA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: v-JXPkD4AmWV9dxMi_DTIiwTZOYGL1GM
X-Proofpoint-GUID: v-JXPkD4AmWV9dxMi_DTIiwTZOYGL1GM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDIwMCBTYWx0ZWRfX2amCnkkDNycb
 Yd6E4RiCnQUNhCsnYWi5Aub4e9BGCnpRNghH26yfrVuUOx/RWtXINENTcG1wZBU6vmViSH+JKBg
 EAe19JxnN7PifpWjmJOvOric70ewTyM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDIwMCBTYWx0ZWRfX4QcUNkMbPCns
 Xp3UVs3KSH/97dg9414bxYivt+yOGaUklHFO8+9zhy+jo0dBUM6PTpY0govZ0FtN0fB+pec8mYA
 U0YcqGqUC4FijNF7h/97q2Fa097JqnH2K/ht0iexKWtbNc2tCBKj4TzaiYghcdz8gkGY83FfljW
 4UP2dVsdDij0CB1pp49YGYifAWsDsDpbUm4tn6dpfGFrfzBen+RMsoLnR0HaHWX+if04Zh2aXmm
 BWL2znX8QS6xsmyYvpP39kB7xg5PvcrcNPwBZYUhNbz6MmhAUHm6SMw3ZfXxh35vK5lxvVowdRh
 z1P/h7bquVcQTrPHYIzgdySX+YF64NOrTG0q1cI/gVh1DVypEoSLliAaUqHrdwJpyQYQ+3R8MU6
 3VwTnBxmtUi7ZQlrVZfUS0A1b7m9YJYIIvJcqXQAoejrCMXr1MPRX0QvxpgB9vymdn/U8wWXJ1P
 2CWQpU4zM0qywxv54WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_154619_036026_B507A454 
X-CRM114-Status: GOOD (  37.14  )
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

On Fri, 31 Jul 2026 19:03:23 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> When an MPAM MSC gets into an error condition, it can trigger an error
> IRQ. We cannot really do much about those errors, but we at least query
> and log the error, then disable MPAM functionality.
> 
> This error report relies on reading the MSC's error status register
> (ESR) in the current hard-IRQ handler, which is not possible for MPAM-Fb
> based MSC accesses, since they involve mailbox routines that might sleep.
> The same is true for clearing the interrupt at the source, which requires
> an MSC access as well.
> 
> When an MSC is using MPAM-Fb, change the error IRQ to use a threaded IRQ
> handler, with an empty hard IRQ routine, and doing all the MSC accesses
> (to access the status and disable the IRQ line) in the threaded part.
> Also forbid per-CPU interrupts (PPIs) for MPAM-Fb, as we cannot use a
> threaded IRQ here.
> 
> The change in the actual IRQ handler is minimal, we just check for the
> first MSC access error and bail out early. MMIO based MSCs keep using a
> hard-IRQ handler, since they must be at least non-migrate-able when doing
> MSC accesses, for the CPU affinity check to work.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

A small thing inline about a refactor that I can't spot a reason for.
May it's one of those cases where the code evolved into something that
would benefit from another look.

Either way I'm fine with this
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/resctrl/mpam_devices.c | 52 +++++++++++++++++++++++++---------
>  1 file changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index ea08c12f717a..b238feb559d4 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2741,19 +2755,19 @@ static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
>  			   msc->id, mpam_errcode_names[errcode], partid, pmg,
>  			   ris);
>  
> -	/* Disable this interrupt. */
> +out_disable:
> +	/* Disable this interrupt. Ignore errors, we need to proceed anyway. */
>  	mpam_disable_msc_ecr(msc);
>  
> -	/* Are we racing with the thread disabling MPAM? */
> -	if (!mpam_is_enabled())
> -		return IRQ_HANDLED;
> -
>  	/*
> -	 * Schedule the teardown work. Don't use a threaded IRQ as we can't
> -	 * unregister the interrupt from the threaded part of the handler.
> +	 * Schedule the teardown work. We have to defer it as we can't
> +	 * unregister the interrupt from the threaded part of a handler.
> +	 * Check whether we are racing with the thread disabling MPAM.
>  	 */
> -	mpam_disable_reason = "hardware error interrupt";
> -	schedule_work(&mpam_broken_work);
> +	if (mpam_is_enabled()) {
> +		mpam_disable_reason = "hardware error interrupt";
> +		schedule_work(&mpam_broken_work);
> +	}

Why the logic flip here?  (!mpam_is_enabled() and early return vs
if (mpam_is_enabled())

It seems to be doing exactly the same.
Is it to couple the comment more tightly with the code?

I don't mind it done this way but it is a reasonable amount of churn
for no strong benefit that I can immediately spot.

>  
>  	return IRQ_HANDLED;
>  }

