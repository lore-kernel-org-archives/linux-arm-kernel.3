Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21D2C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNEq0RGMM70aUC7lAd33dTKu9GtTLMxqmYAyHUnpT+g=; b=TxY8D0RtKwdOvfEm4ZUygnzXIv
	hNS7NrJXVbaUI2qYXU3qoKbyuJpzSyW/PblCNW11tFk9ck+lfWiyFXb+/VmahYAGT7umXMsyyrkq1
	f6TsMwiSjvTNE6PghdFi5B5V0/WVtW8pMW1rYWFrMic0fYJPDacmIVTSEE+O4nmd8YoycgY1545h2
	p4xK1wcCFcr/yMYUqffDSAewuhSObLutx74mL8fOWckHaNbF3j2fvg2BKS5bfuVdtJ34Gq3uTHTaT
	0xxLVdq86XlHJ+6/XZ9ibljs1JjPrwEgERui3baZVXEM8McyOnYRxTEDa6U5W78tprNth/Kx/sniY
	+AOX58Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7xA-00000008g63-06nZ;
	Wed, 29 Jul 2026 17:20:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7x7-00000008g4I-22VS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:20:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TG444m2326408
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 17:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hNEq0RGMM70aUC7lAd33dTKu9GtTLMxqmYAyHUnpT+g=; b=TxBkxzc2szBX1XnM
	VcOef+yzmNUb6dL8uB6Zro2pqGSCzeIfc+WBQ/JMTe5fEymVYYSJIVEEFfR0rmP4
	0kWu90VvM4ePy6ypIprdFR1ut1+SH78oghWUMz346fudMMXvYG0a4QBI//BA9XLZ
	WIJn55QOXKAhcn2r7rHRlqCRjodmmDfZzuQR+J5ijgv6WR5IdzUH9EUlSXbaFEtx
	HAyJ0DM/LqVevPo4lhfRe8WBSwMxoHdnQ7XxikzMwVelUmINAIcKkvbSh6SUyBeb
	CmOTV+wxXwQooKI/CNE3uvEqQDGpMfeQf+nxu1Ql4kRaUYK0iB3EYnOcUAw/jVQ2
	UnYNBA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqmqc0e8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 17:20:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so22862435ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 10:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785345619; x=1785950419; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hNEq0RGMM70aUC7lAd33dTKu9GtTLMxqmYAyHUnpT+g=;
        b=am/25ydH8g1lxQsbsrqBdsLq9gkbCQWv5DK8jELQ2/UrCjcxtv9X3D4pbRQ5XH/qjx
         3uCg4F9aVI0t0kljlslsLWksP5WjQQBQHetBrdJNFVczPIG/eTbAodS6VGQB9wpYdhds
         l4Qe1N/xqdNAaVQeEK8iC091nQrVcG6w1DgVjLo1qlsbPgjU5n7aQR7/Vgtc0qDu6ly4
         ga3kHPNCyRXCaK24PHuEVeFUaGnDuR21XeKM+jrCDgDHGhyr7xrQqXqrYxH/poxoh6fd
         90U1PENXxHAu2MfVu1VWBx4DQL+cRXK6Ps+T7ynXYaS4GiKmygtz6VZGYK821SjAi2wd
         5Jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785345619; x=1785950419;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNEq0RGMM70aUC7lAd33dTKu9GtTLMxqmYAyHUnpT+g=;
        b=Tghua1zU0QxDMOR2Gfq+xujfrFsBcOL4sF4u4LkwzK1Pg1oX8vRSN1xfFl65lpB9zJ
         wkfqj8F2XRq6Kjj+zF4BfhlRfwXzoTbWRswPstI00v43Vlmfb6RxqwBxpsyX+lIRlntw
         7aSbtLVWCI/0kShiz4p9AzNp1BaHYYIil6pUsfrwztsk/Q5Zfly408U16G1z1fzfn5JO
         h/tgiw1AUv1gEhP1pXVbmIIFh5NpOOMJOcpWddRzNHBxzBOC1eFvxdg+BHtvHJZ9ZM4b
         mAG3o+5qNYQqgbgT8fXdjJwmTudDkZ8qeFCEnUwAjDJrEB1Y+cnczEJqrQGlutA9dnpp
         pLEw==
X-Forwarded-Encrypted: i=1; AHgh+RpeM1niSXr/qd79lQlp7DYtlpFTZ+Z3RgZvwk5srNrcO6aK50n5CJdWJDnc6GSCmiCich13yCgvDve+NFAwjks3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/bOH7N+oJ1uWKyUe82TmHvBSS9fy8O+qMAh8KzfN54fPQR174
	B9uYPlBIegxp+fjy6ziAlo4ZylySAUE8SKg2pffQKCVKSBPZz8yHRQAtJgzQNsUNbQm9xlbWzR7
	j1iu7N/GCsIzOgQFzXPPCjy6Fbp6TAPFOGqm3ymCyzIOijyUSaTY/W8pm08lL74k7oHLIZyP5AN
	e6pQ==
X-Gm-Gg: AR+sD12otfocsE/oup0QPom9LZzNChFyC2nvAfL5VaG+CTS8E2qlvSOaTyBYokShkG6
	kZbXdMj89N4RCkNxxvAjnyvWSCIFq0rRw2Zkh/Xhc0G/oNYegn1tzKzeFbwPuzO6ZX4ULBTOaML
	FXQdOuMdEhYw+1LZ7CWOuXRkTtOsPfjjVdWh69dYjyjAZzxMoCoathD25eYObuIKFrCHo2iQYQJ
	J6vBu8Z6mObXeYBQo99i+tHqxRWqTR05oewro/Z21yCEvJCqsjxiip3YhtmF7jOLPQTGchLNgmP
	qL7p2QAyExXQe4U1ZZ5Opa1JXV5bCwgkiRPy8wBX/cSPR/nr3PgH0Jr0bjXoiRhGK23zRTev0ot
	E50xmG5NZC70NhdEONvYA7FC+IA==
X-Received: by 2002:a17:902:ebc2:b0:2cc:6817:d9bc with SMTP id d9443c01a7336-2d015f31b41mr85103795ad.38.1785345618689;
        Wed, 29 Jul 2026 10:20:18 -0700 (PDT)
X-Received: by 2002:a17:902:ebc2:b0:2cc:6817:d9bc with SMTP id d9443c01a7336-2d015f31b41mr85103435ad.38.1785345618079;
        Wed, 29 Jul 2026 10:20:18 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b15f77sm12873275eec.4.2026.07.29.10.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:20:17 -0700 (PDT)
Date: Wed, 29 Jul 2026 10:20:14 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, mark.rutland@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
        ilkka@os.amperecomputing.com, leo.yan@arm.com
Subject: Re: [PATCH v2 1/5] perf/arm-cmn: Rename filter variables for
 clarity
Message-ID: <20260729102014.000019ea@oss.qualcomm.com>
In-Reply-To: <ae87ea9530b3c2073874035a244f34baf7915def.1785252273.git.robin.murphy@arm.com>
References: <cover.1785252273.git.robin.murphy@arm.com>
	<ae87ea9530b3c2073874035a244f34baf7915def.1785252273.git.robin.murphy@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wfc8rUhX c=1 sm=1 tr=0 ts=6a6a3653 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=vzhER2c_AAAA:8 a=kl2wRD5OMsbQT1A7C-gA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=0YTRHmU2iG2pZC6F1fw2:22
X-Proofpoint-GUID: tXDiwvoRL7xrw_Pn_6FoQaB91C3ABu3W
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEzNCBTYWx0ZWRfX2fKm7a+oR4lJ
 qh3S1Ucgq2mgZuWfMLTg0xgXPbb42g34AQ8W/RDvrI8R/yujPGKoy1dvvqfpXvF02elxtUqyj8m
 Dm0CN/W0bxuPq60xSu7uL/q1WLSHNMA=
X-Proofpoint-ORIG-GUID: tXDiwvoRL7xrw_Pn_6FoQaB91C3ABu3W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEzNCBTYWx0ZWRfX6pQHkUaazTVJ
 BQkWo/DYL7xOnCDjGuOP13b/Si2V7QLWJ05vTQBsw25wh2tQRrnpk/xpRiHZt8g086egMHvE9ke
 5XM8S5fKx4W70KhyDpHilsNP8nkmeMcrKCpWhqmtLyog4lXn0UiSbf95v42Grbx70IfMt8f8dZC
 fGJN/dCr3DUL5LUXcS0sA2KoOhM/f/lSHBWKRySeHx4ppv/c6aeTPsAok5S9Nte0ZsMNEazn2Hg
 FCTFsX0nM9JKRxiPy+GdMkKy3cOGtaTvAxOSolmlVDUUIRuzfmdkrkMcdSuxeNZNBwxQ27ffecI
 D2pDX0Ju2uuZCErwfxbN8TZLS20Wm0dc7Ehrh3OceKAIAwwfMaSZ58/VD6Sye3TYb0kRQaqiyro
 H4a3YBWSWs9KL6w2Y8WjoE//r8bY7bEkyco/XltQAxp8vmpSLaqiBNVuG/XkJS8AT0602j9rYp8
 XvZT9VSTuzYsERP37Rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_102021_655029_A56017BB 
X-CRM114-Status: GOOD (  20.38  )
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

On Tue, 28 Jul 2026 16:59:21 +0100
Robin Murphy <robin.murphy@arm.com> wrote:

> CMN has already grown many more event-specific filters than the original
> Occupancy ID, but since they are all independent of each other we've
> just overloaded them onto the same name. Before we add yet more, and
> they begin to overlap, rename all our "occupid" variables to "filter" so
> that things can be a bit clearer and more consistent (but leaving the
> format attribute itself, to avoid UAPI concerns).
Hi Robin, 

Drive by review... I'm a bit confused. 
The print out change isn't a ABI change?  I'd at least mention what changes
around that in the commit message.

Jonathan

> 
> Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> v2: No change
> 
>  drivers/perf/arm-cmn.c | 53 ++++++++++++++++++++++--------------------
>  1 file changed, 28 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index 50402bc4a21d..2a8a67da72c3 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
...

> @@ -709,8 +709,8 @@ static ssize_t arm_cmn_event_show(struct device *dev,
>  				  eattr->type, eattr->eventid);
>  
>  	if (eattr->fsel > SEL_NONE)
> -		return sysfs_emit(buf, "type=0x%x,eventid=0x%x,occupid=0x%x\n",
> -				  eattr->type, eattr->eventid, eattr->occupid);
> +		return sysfs_emit(buf, "type=0x%x,eventid=0x%x,filter=0x%x\n",
> +				  eattr->type, eattr->eventid, eattr->filter);

Changing the format of this smells like ABI change to me.

>  
>  	return sysfs_emit(buf, "type=0x%x,eventid=0x%x\n", eattr->type,
>  			  eattr->eventid);

