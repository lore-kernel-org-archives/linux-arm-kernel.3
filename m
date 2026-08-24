Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61D1C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 21:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dY4LDVqEdH5RNMCgK81yobfpThMPmEumfnbZe+5z5us=; b=pxZOD8Wqrkh9OAqIyeecw3BpLx
	xkE8Oj3c4bO1iC+nD0Uthge5pWg5AybElQWSRhjI2kwhSkQtAN48SaAyEHxMDLt4aiBZch7hyZ6Zx
	XbQT88BUhB3z2pRyyU2666KQdz75I9eGWShWpvq2g7TewaawdLrQ0pQax2D5QRU/v/t81Wgkwqkjd
	Zkgd+eIxbx8NHtO85znFYyvzu3o1on1oWDZnxcDcJvs0ZejKmSLfnniVoAiK6owtl13J+4P4Rpats
	d1VhT3/Ln1seZibaeCDtTEGRQ08wHbOXspq29OfPu5VbpKNZhXcp1N41gGrBUiyHvgNxp2mPeX9tR
	DpjccFaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybqw-0000000HOCJ-3nUR;
	Mon, 24 Aug 2026 21:05:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybqu-0000000HOBr-2a2H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 21:05:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OJGVXt727689
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 21:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dY4LDVqEdH5RNMCgK81yobfpThMPmEumfnbZe+5z5us=; b=j5Wg91AiUCvpf9z0
	GCHp8sZbfASpFvC3YB8g6D0OzFR1sTydswybv9P1aMHb58BL//s4J69OvusczLkj
	dA6ljc9/XfzBWbLQ/FAgwrTEXMTofgaX39asu2cXvk3bg/8BcZUCHZh8WXVyAE5T
	OqIA3y1ZjFhFzdPbeeMKqTZGd49UaGDotjaqBCkyuSzX4IbamOmBCyqNUKsUDysY
	beHxoWNdCDcufAZzic1AaJApJt299P4NdhzkNHJixAScQb4un3cd6spCTW63vKWE
	YZCu0M89kd5f/a7uyoDw4i5+PaVVMUmC2L7viwJ5JbMGiNuv++Lr0aEjH/JvbWzU
	tz1ojw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swr8xmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 21:05:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so6475240a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 14:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787605504; x=1788210304; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dY4LDVqEdH5RNMCgK81yobfpThMPmEumfnbZe+5z5us=;
        b=KJmYE0U1lwfWBFmKMp6J/CVqWtUyyJAu02pGSQTQuFpPmIqSdkTtDscMb62rIfbcq3
         xYBPtEzl4zEkNenbqo4gcCBn/oP5wUjV8Pa0QQDe+GUp55Hh36ZLOqBuQdMet4wp4Kko
         S6v9S4xRA+oyaU/oa0x/hQLzfIehCko2/qnS76+4dz/F53lyZ8MV2ExQsrzHPCLGagY4
         1HE7hbYmrf6R+ChM2pPh1erhOjY2GqtzYImrQT2DArk65jc17+3EpkwGXRfT/1SbJWFb
         arJCNiUnZar8LxEY4xv7hopXcHQ0YSVWQOIVuZkOKg8iFW0vjR7KjSOWJnVGFR8eB0kH
         acww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787605504; x=1788210304;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dY4LDVqEdH5RNMCgK81yobfpThMPmEumfnbZe+5z5us=;
        b=lUQaVzCYshoK0/Rzd1Pkk4qZBV40CIV3Ta9zNvur8RxPEooE/cFjGLoUJ6/mV8yGH1
         czGZl+Chw4YBXThVVseAYCqJDF6SVfifv3mIZXFCCZJ3CBKlOFlgksNMCXm7JDURy7Rv
         s6zk5rHdXVn4hGIslKlr37mJc6eeyZl6mva4LCIu7op7PGwUVIGQhVq3uTHPk9VWqJvp
         ogG0/goVadM2HJ3Gw6+SwI5V7PbGayNYo8vPvMOzUecVJ14IcTVaka3esvfPAx4ACXeJ
         9tKMBjQsjq2I6XtzB53GS+70OgD4JtKi2W5yOGm2I2EoPDoG/1SkihEX8UIHPd0T6IdX
         8A5w==
X-Forwarded-Encrypted: i=1; AHgh+Rrwai54HSdm8Kp90GSJKCWJ6BmBRQqa4hn8oHBAOPDy2J67MXHSV44KhEru7GX6JuV5ghOZUMaZ2oJtq6ZizXPa@lists.infradead.org
X-Gm-Message-State: AFuF++muX62j0XPSAveWQtiu+et5tl10UjS7msBKhmeyisU4cdEmi4Qb
	Rp6+O6HJ4q1rvU2k5RGCXDIPCFlLIP7C7Stcp0pcb1JCkBCuRNzQkItzhsP2Ex/C91R2eY8InsS
	SrkXp8Ou5Il8xNnWABaEwyyO6wOlMuTNInjYQwCrqqU/0/utuIJuUQCuAY1qG6i+ZixnFn+2xUd
	JVQg==
X-Gm-Gg: AR+sD111Rjh3mrIBR+vn97hMksgwKr63yKgNpuSTjKz2YcQK5Xj2iaUpHnf52LxfX5W
	YU8b/nsdh91uQo7BWfvQe7pWgkPThtlmGf2Gemec66BdsfMjJDpT3KuO5dFqZ6zZ4K8GFrALUvc
	kvUO85ZKuPfhddO3rZ1om1HY926ZdY9Z4yh2DUUsHQNFtPUvKWOwSeTAxL3dEvFfOt2i19v+fFe
	2Lpiw2CtW6Xp43rNycFU6/JGyPLjKf1QPTEVfD7L6hD8qAYzo2iNplaQkO3xVfmKgeIzQaLroDp
	p7dyVhfFVNSbjuBGm8Ppag+J/tFw7dRvqzGeu3Llr22Q7QUckQyvNa5KqROaIDXyQ6lfTpdUJvQ
	nOGEr/ptFPzTOsisRhgTHoSWZmA==
X-Received: by 2002:a17:90b:5745:b0:380:f389:447b with SMTP id 98e67ed59e1d1-396464ce7bcmr3158197a91.11.1787605503951;
        Mon, 24 Aug 2026 14:05:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5745:b0:380:f389:447b with SMTP id 98e67ed59e1d1-396464ce7bcmr3158126a91.11.1787605503492;
        Mon, 24 Aug 2026 14:05:03 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1418619d6ecsm27307004c88.14.2026.08.24.14.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 14:05:03 -0700 (PDT)
Date: Mon, 24 Aug 2026 14:04:58 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
        lukasz.luba@arm.com, philip.radford@arm.com, david@kernel.org,
        souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
        puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v10 06/24] firmware: arm_scmi: Add basic Telemetry
 support
Message-ID: <20260824140458.000072d3@oss.qualcomm.com>
In-Reply-To: <20260815232604.3730754-7-cristian.marussi@arm.com>
References: <20260815232604.3730754-1-cristian.marussi@arm.com>
	<20260815232604.3730754-7-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DTg0zj-U1Y8V9i7G4w7GsfcGpMbZAWzj
X-Proofpoint-GUID: DTg0zj-U1Y8V9i7G4w7GsfcGpMbZAWzj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE3OCBTYWx0ZWRfX0Z1yRrIkkJBn
 X6BqJ+bsELJ7F8+0WRjYlR6qQPKcirKW18VGnVLLgAYXVQbtrv4ncX78w1BTqnnnU4yrOGDN0DF
 X1dx5pz/ykkMXq+/7fkSC2G8mmQeQK8=
X-Authority-Analysis: v=2.4 cv=TqPWQjXh c=1 sm=1 tr=0 ts=6a8cb202 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=y3yABLib4jnuYGgama0A:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE3OCBTYWx0ZWRfX7taHBjSHfwjw
 DQqf4EUHIZfDZPjyq/NOlsuXwCbVhUp45azCjJ105Tly+yjDn09fTQQlN256A3lkoP/a5R6IHGu
 MpNvQPtuGuuSU7ruck3D6Rb605GPotVRZE/LHXKyPGPkcmbkbCEgG1pIz6T8gYcqhf32oUTCDQe
 jedkFuzo2iVBQgSnsWWXtOuMEgPM9GrfWAl/wH8AfRlievDMO6a4/XTMrNCPGtBsz8KnFMETTep
 YClI6fx58kRlhL3nKXqVuXrCHDqsJkb6OzIhKBdhIsw/lC0lwoYCcaX7XhMC1qR1JLBy4tVvRvm
 zG/AWJQVxLobfAaUnKlVFb/Dj/IR+2gwqJ9cCv/kPZazowY9bfAWbVEKsernL2761WC5mMQfwjP
 EmaHDjzU2cGwY1aFD+/qdKPo4L5rbo6tZcCZmAMr1jlR3d7fP9Y02RXZAFCMt8+YviIc3nqr/K2
 kUql1FfyTwXHI46Dnrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_140508_671557_34A1B043 
X-CRM114-Status: GOOD (  37.56  )
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

On Sun, 16 Aug 2026 00:25:46 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add SCMIv4.0 Telemetry basic support to enable initialization and resources
> enumeration: add all the telemetry messages definitions and parsing logic
> but only a few simple state gathering protocol operations.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Obviously this is huge. I'm not going to look through it all today, but
some quick comments form the part I did look at.

Jonathan

...

> +static void scmi_telemetry_resources_free(void *arg)
> +{
> +	struct telemetry_info *ti = arg;
> +	struct scmi_telemetry_res_info *rinfo = ti->rinfo;
> +
> +	/* Ensure rinfo is no more accessible upfront */
> +	smp_store_release(&ti->rinfo, NULL);
> +
> +	for (int i = 0; i < rinfo->num_des; i++) {
> +		struct telemetry_de *tde = to_tde(rinfo->des[i]);
> +
> +		scmi_telemetry_free_tde_put(ti, tde);

		scmi_telemetry_free_tde_put(ti, to_tde(rinfo->des[i]));
Seems resonable to me and avoids the need for the local variable.

> +	}
> +	xa_destroy(&ti->xa_des);
> +	kfree(ti->tdes);
> +	kfree(rinfo->des);
> +	kfree(rinfo->dei_store);
> +	scmi_telemetry_groups_free(rinfo);
> +	kfree(rinfo->grps);
> +	kfree(rinfo->grps_store);
> +
> +	kfree(rinfo);
> +}

> +
> +/**
> + * scmi_telemetry_resources_enumerate  - Enumeration helper
> + * @ti: A reference to the telemetry info descriptor for this instance
> + *
> + * This helper is configured to be called once on the first enumeration
> + * attempt, when triggered by invoking ti->res_get() from somewhere else.
> + * Once run it substitues itself in ti->res_get() with the simple accessor
> + * __scmi_telemetry_resources_get, which returns a descriptor to the resources
> + * that were possibly discovered.
> + *
> + * Note that, while it attempts to fully enumerate Data Events and Groups, it
> + * does NOT fail when such enumerations fail, instead it simply gives up with
> + * the end result that only a partially populated, but consistent, resources
> + * descriptor will be returned; in such a case the incomplete descriptor will
> + * be marked as NOT fully_enumerated: this design enables the kernel to deal
> + * with badly implemented out-of-spec firmware support while keep on providing
> + * a minimal sane, albeit possibly incomplete, set of telemetry respources.
> + *
> + * Return: A reference to a fully or partially populated resources descriptor
> + */
> +static struct scmi_telemetry_res_info *
> +scmi_telemetry_resources_enumerate(struct telemetry_info *ti)
> +{
> +	struct scmi_telemetry_res_info *rinfo;
> +	struct device *dev = ti->ph->dev;
> +	int ret;
> +
> +	/* Ensure local rinfo is initialized */
> +	rinfo = smp_load_acquire(&ti->rinfo);
> +
> +	/*
> +	 * Ensure this init function can be called only once and
> +	 * handles properly concurrent calls.
> +	 */
> +	if (atomic_cmpxchg(&ti->rinfo_initializing, 0, 1)) {
> +		if (!completion_done(&ti->rinfo_initdone))

What's the logic here?  This waits only if others are already
waiting. Why?

> +			wait_for_completion(&ti->rinfo_initdone);
> +		goto out;

return 0;

> +	}
> +
> +	ret = scmi_telemetry_de_descriptors_get(ti);
> +	if (ret) {
> +		dev_err(dev, FW_BUG "Cannot fully enumerate DEs resources. Degraded system.\n");
> +		goto done;
> +	}
> +
> +	ret = scmi_telemetry_enumerate_groups_intervals(ti);
> +	if (ret) {
> +		dev_err(dev, FW_BUG "Cannot fully enumerate group intervals. Degraded system.\n");
> +		goto done;
> +	}
> +
> +	/* Enumeration was fully successful, ensure this is visbile */
> +	smp_store_release(&rinfo->fully_enumerated, true);
> +done:
> +	/* Disable initialization permanently */
> +	smp_store_mb(ti->res_get, __scmi_telemetry_resources_get);
> +	complete_all(&ti->rinfo_initdone);
> +
> +out:

labels that just result in returns rarely add to readability of code.
I'd just return early instead.

> +	return rinfo;
> +}
> +
> +/**
> + * scmi_telemetry_instance_init  - Instance initializer
> + * @ti: A reference to the telemetry info descriptor for this instance
> + *
> + * Note that this allocates and initialize all the resources possibly needed
> + * and then setups the @scmi_telemetry_resources_enumerate helper as the

sets up

> + * default method for the first call to ti->res_get(): this mechanism enables
> + * the possibility of optionally implementing deferred enumeration policies
> + * which optionally delay the discovery phase and related SCMI message exchanges
> + * to a later point in time.
> + *
> + * Return: 0 on Success, errno otherwise
> + */
> +static int scmi_telemetry_instance_init(struct telemetry_info *ti)
> +{
...

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 5ab73b1ab9aa..2850b018da0d 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -2,16 +2,18 @@
>  /*
>   * SCMI Message Protocol driver header
>   *
> - * Copyright (C) 2018-2021 ARM Ltd.
> + * Copyright (C) 2018-2026 ARM Ltd.
>   */
>  
>  #ifndef _LINUX_SCMI_PROTOCOL_H
>  #define _LINUX_SCMI_PROTOCOL_H
>  
>  #include <linux/bitfield.h>
> +#include <linux/bitops.h>
>  #include <linux/device.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
> +#include <linux/uuid.h>
>  
>  #define SCMI_MAX_STR_SIZE		64
>  #define SCMI_SHORT_NAME_MAX_SIZE	16
> @@ -824,6 +826,184 @@ struct scmi_pinctrl_proto_ops {
>  	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
>  };
>  
> +enum scmi_telemetry_de_type {

There is quite a bit of stuff here. Seems only related to telemetry
so maybe a more specific header makes sense for just scmi_telemetry?

The same applies for some of the other stuff already in this header
like the sensors protocol elements.

> +	SCMI_TLM_DE_TYPE_USPECIFIED,
> +	SCMI_TLM_DE_TYPE_ACCUMUL_IDLE_RESIDENCY,
> +	SCMI_TLM_DE_TYPE_ACCUMUL_IDLE_COUNTS,
> +	SCMI_TLM_DE_TYPE_ACCUMUL_OTHERS,
> +	SCMI_TLM_DE_TYPE_INSTA_IDLE_STATE,
> +	SCMI_TLM_DE_TYPE_INSTA_OTHERS,
> +	SCMI_TLM_DE_TYPE_AVERAGE,
> +	SCMI_TLM_DE_TYPE_STATUS,
> +	SCMI_TLM_DE_TYPE_RESERVED_START,
> +	SCMI_TLM_DE_TYPE_RESERVED_END = 0xef,
> +	SCMI_TLM_DE_TYPE_OEM_START = 0xf0,
> +	SCMI_TLM_DE_TYPE_OEM_END = 0xff,
> +};
> +
> +enum scmi_telemetry_compo_type {
> +	SCMI_TLM_COMPO_TYPE_USPECIFIED,
> +	SCMI_TLM_COMPO_TYPE_CPU,
> +	SCMI_TLM_COMPO_TYPE_CLUSTER,
> +	SCMI_TLM_COMPO_TYPE_GPU,
> +	SCMI_TLM_COMPO_TYPE_NPU,
> +	SCMI_TLM_COMPO_TYPE_INTERCONNECT,
> +	SCMI_TLM_COMPO_TYPE_MEM_CNTRL,
> +	SCMI_TLM_COMPO_TYPE_L1_CACHE,
> +	SCMI_TLM_COMPO_TYPE_L2_CACHE,
> +	SCMI_TLM_COMPO_TYPE_L3_CACHE,
> +	SCMI_TLM_COMPO_TYPE_LL_CACHE,
> +	SCMI_TLM_COMPO_TYPE_SYS_CACHE,
> +	SCMI_TLM_COMPO_TYPE_DISP_CNTRL,
> +	SCMI_TLM_COMPO_TYPE_IPU,
> +	SCMI_TLM_COMPO_TYPE_CHIPLET,
> +	SCMI_TLM_COMPO_TYPE_PACKAGE,
> +	SCMI_TLM_COMPO_TYPE_SOC,
> +	SCMI_TLM_COMPO_TYPE_SYSTEM,
> +	SCMI_TLM_COMPO_TYPE_SMCU,
> +	SCMI_TLM_COMPO_TYPE_ACCEL,
> +	SCMI_TLM_COMPO_TYPE_BATTERY,
> +	SCMI_TLM_COMPO_TYPE_CHARGER,
> +	SCMI_TLM_COMPO_TYPE_PMIC,
> +	SCMI_TLM_COMPO_TYPE_BOARD,
> +	SCMI_TLM_COMPO_TYPE_MEMORY,
> +	SCMI_TLM_COMPO_TYPE_PERIPH,
> +	SCMI_TLM_COMPO_TYPE_PERIPH_SUBC,
> +	SCMI_TLM_COMPO_TYPE_LID,
> +	SCMI_TLM_COMPO_TYPE_DISPLAY,
> +	SCMI_TLM_COMPO_TYPE_RESERVED_START = 0x1d,
> +	SCMI_TLM_COMPO_TYPE_RESERVED_END = 0xdf,
> +	SCMI_TLM_COMPO_TYPE_OEM_START = 0xe0,
> +	SCMI_TLM_COMPO_TYPE_OEM_END = 0xff,
> +};
> +
> +#define	SCMI_TLM_GET_UPDATE_INTERVAL_SECS(x)	(FIELD_GET(GENMASK(20, 5), (x)))
> +#define SCMI_TLM_GET_UPDATE_INTERVAL_EXP(x)	(sign_extend32((x), 4))
> +
> +#define SCMI_TLM_GET_UPDATE_INTERVAL(x)		(FIELD_GET(GENMASK(20, 0), (x)))
> +#define SCMI_TLM_BUILD_UPDATE_INTERVAL(s, e)				    \
> +	(FIELD_PREP(GENMASK(20, 5), (s)) | FIELD_PREP(GENMASK(4, 0), (e)))
> +
> +enum scmi_telemetry_collection {
> +	SCMI_TLM_ONDEMAND,
> +	SCMI_TLM_NOTIFICATION,
> +	SCMI_TLM_SINGLE_READ,
> +};
> +
> +#define SCMI_TLM_GRP_INVALID		0xFFFFFFFF
> +
> +struct scmi_telemetry_intervals {
> +	unsigned int grp_id;
> +	bool discrete;
> +	unsigned int num_intervals;
> +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_LOW	0
> +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_HIGH	1
> +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_STEP	2
> +	unsigned int update_intervals[] __counted_by(num_intervals);
> +};
> +
> +struct scmi_telemetry_grp_info {
> +	unsigned int grp_id;
> +	unsigned int num_des;
> +	unsigned int num_intervals;
> +};
> +
> +struct scmi_telemetry_group {
> +	bool enabled;
> +	bool tstamp_enabled;
> +	unsigned int *des;
> +	char *des_str;
> +	struct scmi_telemetry_grp_info *info;
> +	unsigned int active_update_interval;
> +	struct scmi_telemetry_intervals *intervals;
> +	enum scmi_telemetry_collection current_mode;
> +};
> +
> +struct scmi_telemetry_de_info {
> +	unsigned int id;
> +	unsigned int grp_id;
> +	unsigned int data_sz;
> +	unsigned int type;
> +	unsigned int unit;
> +	int unit_exp;
> +	unsigned int ts_rate;
> +	unsigned int instance_id;
> +	unsigned int compo_instance_id;
> +	unsigned int compo_type;
> +	bool persistent;
> +	char name[16];
> +};
> +
> +struct scmi_telemetry_de {
> +	bool tstamp_support;
> +	bool fc_support;
> +	bool name_support;
> +	struct scmi_telemetry_de_info *info;
> +	struct scmi_telemetry_group *grp;
> +	bool enabled;
> +	bool tstamp_enabled;
> +};
> +
> +struct scmi_telemetry_res_info {
> +	bool fully_enumerated;
> +	unsigned int num_des;
> +	struct scmi_telemetry_de **des;
> +	struct scmi_telemetry_de_info *dei_store;
> +	unsigned int num_groups;
> +	struct scmi_telemetry_group *grps;
> +	struct scmi_telemetry_grp_info *grps_store;
> +};
> +
> +struct scmi_telemetry_base_info {
> +	unsigned int version;
> +	uuid_t primary_revision;
> +	unsigned int num_des;
> +	unsigned int num_groups;
> +	unsigned int num_intervals;
> +	unsigned int num_shmtis;
> +};
> +
> +struct scmi_telemetry_shmti_info {
> +	unsigned int sid;
> +	unsigned int len;
> +	unsigned long offset;
> +	phys_addr_t phys;
> +};
> +
> +struct scmi_telemetry_info {
> +	bool single_read_support;
> +	bool continuos_update_support;
> +	bool per_group_config_support;
> +	bool reset_support;
> +	bool fc_support;
> +	struct scmi_telemetry_base_info base;
> +	unsigned int active_update_interval;
> +	struct scmi_telemetry_intervals *intervals;
> +	struct scmi_telemetry_shmti_info **shmtis;
> +	unsigned int num_uuids;
> +	uuid_t **uuids;

I'm going to guess a __counted_by_ptr marking makes sense here.
(I haven't checked!) I won't bother calling out other cases, but
looks like there may well be some above.

> +	bool enabled;
> +	bool notif_enabled;
> +	enum scmi_telemetry_collection current_mode;
> +};


