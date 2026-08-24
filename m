Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B216C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 17:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIXa1i4FToCq5BvtMUKZe6PS6FxIaYe/Fw1HFVvct3k=; b=rhsivEHW4Mu4KSVcIow+/SlD37
	teiUluoVaD3zy67yGkDYSlNn8+/lys96wY2OGYM7QvY+tgcrKQ8os+9B11qBImrw1zpyz/GLB/8wE
	9rWHGpziIleh1Q9d+p978wEPwhNw0TZ2MnM+2APovRWsnu5npBzWgKdrMshx9l+/9xylLvKBWWwZH
	yH632gFgfWG7NLplSYDPjBTluFd5O4QrDiQ9wbmtXqxiVAoULpVJLINOyNFXFOHQHUx6AFuyGp1Y4
	LaTSclst1ufu7dpmvrEVuTJaiwQrxtBi4Mqwef1wBT1G1w0z9eFoz939RTkHelJAyJzbQR+mwu9Nb
	oXFkvatA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYi5-0000000HC7S-1OZk;
	Mon, 24 Aug 2026 17:43:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYi2-0000000HC6A-00Nv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 17:43:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFnRW32384990
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wIXa1i4FToCq5BvtMUKZe6PS6FxIaYe/Fw1HFVvct3k=; b=pV2oM7kXSREA308K
	koty8zjmLK2Qxgtx0h1S9TsF7kqd+00WHGUOhcZldg9ghYpsxQICTuzIq/CXrJ5k
	lhuYUKIAr308OeTycSyA36DHP+XlDSIfoWq8oXmZqigQMsMvWWOvlv2D9pB0e1+y
	e2xwI7EYbFs44mabOjXo8CES5+LWWhJTn2HAm0Ag6fDhRpm9y94kzQGWEKfSvtco
	09uNoRZAir2JORF+VpsLQa17WQUrgk0FyTuVPn2lq2AvF8N4F4QQ17DoRu5Y2N82
	1n6FYBVmBux9da1SaHEw1yXTyIWhbY17ghDXywA11Jerwds6dsZorA0T2mKUnxJc
	u7IzLA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv7a0rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:43:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc12e8e22b7so3891164a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 10:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787593422; x=1788198222; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wIXa1i4FToCq5BvtMUKZe6PS6FxIaYe/Fw1HFVvct3k=;
        b=kI8gskZOM8jwLJwlksgFQIungJLR0243vbAcIHYctczqhtkV76RMXXbPKNfiAHrqGr
         I4VxubjTRU9LnBZeQ5vNuZu+nOX5iQaGTRJRY8m3Az0jNmlhLbgRixhglyo6iYQfRADC
         CT8j7nvDayabWJWE3fc26UczWnTzbbvn7nC6Y6ROctGwUoEyElxXD4/qdgzP+A1LWXOh
         vzlXAIxM2gkXOGiU2Me1Rj9B0ZXpMF/ed2JtYhXKO9HNp7yRUv7rX4L6qXOj5I1b3NnG
         qW7/C+NPlQ5wvLNuipHR3GzeNzoLtlOhQzKaymAS0u4IVpYiYtY7sDPRfccpyIlpSX6x
         Grqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787593422; x=1788198222;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIXa1i4FToCq5BvtMUKZe6PS6FxIaYe/Fw1HFVvct3k=;
        b=XObwyxZBpjb58e75rEpmRJNxdgsGJnJA0ATeCohLyReK8L6Z/Na83Kyyq255y/yrlF
         Q3i2EW1SEhcbjOzNSnmpi3JNy0WsKZbMSf6LZ4ZM+tCK7rWXR9Tu73UlbG8LPMEjV4Zb
         TmPgSefHci5dNEfZs/TkyvN6hWZRv22jUBDmipZoQoaI5WZaQ2XaHyfVu+GNhG4/L3l+
         Qh5HyV7MrXIRHIabuc3nrF/tzSgsLLeqqbyWKKyIJ+DMuCf3Slzcbt0oNpePZEP4wfMu
         M+JkjGdUHHwku5W6Yrmdg5T9KqFwNsJDWSFOT8I6fl1yNmNlUPgbFH+oImIm1OYeJHL8
         Sc/g==
X-Forwarded-Encrypted: i=1; AHgh+RqHjrL/lTzr+HrE0Coqxso7C13uLqRIHtxOSf6uEM9dXuekLxV3Pwek9Gp6IlmaEQFftwXOLz+IOA14NNgaHs3o@lists.infradead.org
X-Gm-Message-State: AFuF++lzM47WeRJSgGGhdsn+I7LNHnGnvFPO+XNSisKxahZKaEzVujYT
	BnfEIdI1E9gSF1ET3flF7SRTd2ubtw16G5vz6iI0iN4HjFglbcYresyJGFI0IUBBK+7J3ExCPQX
	l9P4dSJkAiRafh8f1WYwPp9bjdtBQsIN2jQHzN31Es9uy9S3ku9mJ3mgJXvi5DjHQ2kTtHCRMXr
	g0xA==
X-Gm-Gg: AR+sD10odYbC2ViTL4iFv5wKyD23DSEgkDoXEifwy0fdS5OjgsmKWp2ASBdgJGyJHo6
	HWGuXKsLenXMjfWwKBWSEnUajwpa7r1xtdGca0LGMlb/UnrlMySqpqOn1F8FJUZF4vaYwI/RhWI
	JOfHMnDk7SNaZY+Tu1yA1y8gB/MIqAchNj/x4UJ2ilf0eR9bemJK6eLPF8l8+qVTSWVVQoFwGSJ
	ILu5pQKjcBQdZmsKNx4mLnM/yu/qjCiAIRRx8BvhGpx0adQoiHls7q9+F1Jmg2tXVzL2KYCQxWq
	uKQNj0oCxxN9kvQMGnwHjSgIzvfkBV96mZm3ieTPoH84okCcWk2BA5JmshiprEAn5ufTauUi1+/
	uqdFQOHCDzJoU1nD9xtuzwmhoDA==
X-Received: by 2002:a05:6a21:4d8b:b0:3cd:6f46:aceb with SMTP id adf61e73a8af0-3cd91103da8mr982755637.8.1787593421691;
        Mon, 24 Aug 2026 10:43:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d8b:b0:3cd:6f46:aceb with SMTP id adf61e73a8af0-3cd91103da8mr982668637.8.1787593421228;
        Mon, 24 Aug 2026 10:43:41 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm29442144eec.17.2026.08.24.10.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:43:40 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:43:37 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 4/9] firmware: arm_scmi: Fall back to ACPI HID when
 "compatible" is absent
Message-ID: <20260824104337.00002275@oss.qualcomm.com>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-4-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-4-cb6b88b4ebb3@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c82d1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=l6Goj-m7ziazzFgbZv4A:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE0OSBTYWx0ZWRfXzo++QmgZP5uX
 YB7AymkXPOCxdABy4u8w90A36DLER5uazF6PjxiPcRoOXtp3OA94Iy6xRmHhxeaGelxvUaTb7yD
 rJAYMJQSebBFURY8UFHRcKx76blesZg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE0OSBTYWx0ZWRfX7hU/JnotPFmx
 C6fJsPfJPyuZNONKYwUSrYZZB4j9/iP9QEGOl4b0yqOe4PxcUXgTswLqqu8EO+2nzEEvwO5YMtm
 4SCrgsLsf/Mm5KWuEG494233S0dIJnGTHgPOGE//Zwnfnw/Xa30ZNh/ZpgcCz7p5TbQteeALgSL
 izYSkeU/gvTxUOhLJrFCUlndniBK+D8vH0UvGOfU7byZHI3frMNuES9emCZMqgBrhaXqBZ0vTdP
 tVeXjOVKxWB3vrbbBAf28HNxjxN+L9liYog6944Nd93ZVur2yse5qOJxKD4VeQzf1EuzVU5j/nm
 hb02demMDC3znGflSH94U9Cjw7UDO3ohbkDYOhnufzuzQLZ0n12qtNB5LTjYAxLeF4yUOp0vjhR
 G0edOhrIUPlyNYgqRpDtQcYccSmFHEQ5NdEu2MVi4Oha83tC+nrBhZ0A4w//YDdhTbEyZlFIzQn
 g0wP1eBn7DWL9Qa8Qbg==
X-Proofpoint-ORIG-GUID: 3mV7qfup9pDdGNRhJ7EAV-quvuKQ0icu
X-Proofpoint-GUID: 3mV7qfup9pDdGNRhJ7EAV-quvuKQ0icu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_104346_056511_A10748B8 
X-CRM114-Status: GOOD (  23.33  )
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

On Thu, 13 Aug 2026 12:32:59 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> scmi_debugfs_common_setup() uses the "compatible" property to
> populate the debugfs transport type string. ACPI-described SCMI
> devices do not provide that DT property, so the string remains
> NULL and debugfs setup falls through the allocation failure path.
> 
> Check the property lookup result and use the ACPI HID as the
> fallback transport type when an ACPI companion is present.
> 
> All supported DT SCMI platforms are expected to provide "compatible",
> so the non-ACPI fallback is not needed for normal DT operation. Keep
> the explicit "unknown" fallback anyway to avoid passing NULL to
> kstrdup() if that assumption is ever violated.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
Can drop some complexity in here and rely on the stubs in acpi.h a little more.

> ---
>  drivers/firmware/arm_scmi/driver.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 9014723e0f7f..9ad827c6a9ab 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -16,6 +16,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <linux/acpi.h>
>  #include <linux/bitmap.h>
>  #include <linux/cleanup.h>
>  #include <linux/debugfs.h>
> @@ -3063,6 +3064,15 @@ static void scmi_debugfs_common_cleanup(void *d)
>  	kfree(dbg->type);
>  }
>  
> +static const char *scmi_acpi_device_hid(struct acpi_device *adev)
> +{
> +#ifdef CONFIG_ACPI

Hmm. Ugly that acpi_device_id returns an empty string.

However given when !CONFIG_ACPI the stub for ACPI_COMPANION(dev) is
NULL.  You don't need this dance anyway.

> +	return adev ? acpi_device_hid(adev) : "unknown";
> +#else
> +	return "unknown";
> +#endif
> +}
> +
>  static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
>  {
>  	char top_dir[16];
> @@ -3080,8 +3090,10 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
>  		return NULL;
>  	}
>  
> -	fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
> -				    &c_ptr);
> +	if (fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
> +					&c_ptr))
> +		c_ptr = scmi_acpi_device_hid(ACPI_COMPANION(info->dev));
> +
>  	dbg->type = kstrdup(c_ptr, GFP_KERNEL);
>  	if (!dbg->type) {
>  		kfree(dbg->name);
> 


