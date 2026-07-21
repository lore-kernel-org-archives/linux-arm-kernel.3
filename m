Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCE6C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 18:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvgrk0JD8puxwL9uCDMq26QW3QE0+BHmqpodlHbEJE8=; b=BgaNoJ65iNSflKWQbp7j1OS1fG
	4SWjeb9Gr6fW0DKdFg6mD/FSI5JRQIPUIxYMbvVBrxub58Le+VlDMgLp0vEXk0Kw57DF/0wipG4wr
	EEyJnr2UWGXbc8KgDO/HAqpWYgWsw0z7NVQhKh9vufiLMwJ7g9ROcSwqHvFhAXWFhoxLBNFxVMnYW
	HYht7Epg+BFNk82sT7JkTrCUTDn+5aZB0j4SFO204ZRBvVk0g5NgTdaIc6eo/zsr/PqA+3/SI0Kn3
	PmG2FGl1coZSMCmV8OdmRKUuGUSNx/m6Zvb2sR3CjMtzsOg/Mu6Q+bh8cbfCjyIeALGhQfTMypbHL
	TLebQueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmEsT-0000000A9TT-0nQv;
	Tue, 21 Jul 2026 18:07:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmEsQ-0000000A9SX-3X1b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 18:07:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHR8992375968
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 18:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvgrk0JD8puxwL9uCDMq26QW3QE0+BHmqpodlHbEJE8=; b=dfw0BPiDNUu0Gi6Z
	bWZ3/fyFqObxL29UiXVFnI/KCl+2rr8TGeyYQZjQabD4ckCreCjBTPgx3egEwyvQ
	HUp4GxBfAysNYgFdVArI/zJeIyAdHryaFXC8PAme6e1CRNA66zQpra3j5T1atC2R
	XGhGKcIygx4OeLyJotMKrlXoGD39Q7HauokoDHMitgaIrkIUgRoD0rjmoHrU6YK3
	P2VxMU7kRFR8UHIS0q7ENORA3m824sbBGu612WYq+Ngq7Zstai+EPm4heyT0vE/o
	LYKby0qSnfBmvUvqIe0zUmESvWxtOXYo7y/zQFIPpkWWOVGXF5oyhHDYDrzwTmAv
	MI7oIA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6a86m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 18:07:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so16811186a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 11:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784657252; x=1785262052; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvgrk0JD8puxwL9uCDMq26QW3QE0+BHmqpodlHbEJE8=;
        b=hjIKA6cpFyZm23BFvwE64fqsfXJmM8IpTygN/zsgboEX6zXbqbnuaNZFC71J9SUFhR
         xNZX8WkbgQAHll9fnfzJa3gurANaKFCWDfv5c897obZlqQvC5F8z0LuU9yYPNbXUvlS9
         3CgGQCL/NeI4SCdxE2Lv68S2SjHREJCtYdjQeSczgBTmCkQvtA08PVRHbYXK6etG/tQ8
         77g2qz9obd6YgWq2Ipp+KmiOcC8jj5UQR/ZWZhoGfiR4Tgbh5aa08NTkg1Bi9XMk5z1q
         JIyXtMw/n9BVbDJnR0W9lpZn79tV5w/959rgVDeVOUSINTPWp/81dhqztY8+d3gyfXgl
         Zrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657252; x=1785262052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvgrk0JD8puxwL9uCDMq26QW3QE0+BHmqpodlHbEJE8=;
        b=F+i5/AgL6DYkGCOmZILk12zfB2gEBiqp6ypTRvVgT/nLpTHr5UZqaNQqWs8ROLWEHA
         Bs6C8/0xksKqhvexg4DJtLKmHNqexmI1zdIQrk0oolquJXlZVXa2iwmx65meFumd2YG4
         S/j6FwLqTL+8XIKHsMYjb1DK8akAYE6bu9ZuTSTFsHPy23nrzIhMruTQUWaJku7ZcYWT
         jdywTOMMiFkcjnxE+XcqXee43GUcn0Pv9c/ShPCljBlP2TZ1GRjpOU/m+06Rmn6zzFPJ
         3yGFUKIJG0eSlfCrORP+/+jSta9Hg05t1mu7DSKydeKIubJjH90pdurVCwgtLRtUiwuw
         XYcA==
X-Forwarded-Encrypted: i=1; AHgh+Rrg+Mpxah7ZXhDu/HSETSeahOJYn1HdxIL0ga25My4KoOgrWvzXasrJ46m5zSqT5AT8k10shSzDr6bFTL9ONT0a@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0uuKUyh2b6vBvK7JZfmWOeH/pRwR9MxR+aSoI7YjzRGm5Xy+j
	gkHKqPI/2pvZSB+LQPe6hjOZb1to1A4VsxGY+sEljP1Zo1Zc/fUvY4GDI2ZSY2+Xng0oq+xn+PG
	8mGoZlUkwbWxili6jjeNtMKPGT48FH5K3w4G/k3kYe5IahhFeIaLuF/z9tSBrFgyscII0g27sGu
	5/Tg==
X-Gm-Gg: AR+sD13+V3AbuJmKc16an/YiJnU8KNwZRmzDvXsQ+/4gXGtUofbY06sKMeJULHYvz4T
	9FXkTbHq2Y27F+CKw/c5DKNdep6m2nKcxbpmnAmufJ7wfJ9g7yh4eFs/TtIiNkkdxvwbw3Kt4SF
	LHmdfSF30GfjSJgGcm3BhelO+VO78i/ZeCQ4i+W5+sjGBY7dZWkHf9XkBz1PiTQeEOD+M0SB9tp
	NgvFIDHzPXh4h5Se5VfC2Cps/sLljMB8xg0AwbxvuCfgrI8mcmNrLZmqcwqNBs8Xg4DRewUUox7
	qq6DxTH9uYKM1A+3gVbKab5tgNdBNOAowPCXq1ms8RbCjkyZxAwH8Jssp4nh5eLJNOuex2YqIAx
	MkjT1fG0/PIJzEHjfmiJQX9ds7+aPpZ8/m8k=
X-Received: by 2002:a05:6a20:6a0a:b0:3c3:8041:89f5 with SMTP id adf61e73a8af0-3c3ad9e597fmr23899568637.66.1784657251641;
        Tue, 21 Jul 2026 11:07:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0a:b0:3c3:8041:89f5 with SMTP id adf61e73a8af0-3c3ad9e597fmr23899525637.66.1784657251224;
        Tue, 21 Jul 2026 11:07:31 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.235.145])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e088d3fsm908106eec.25.2026.07.21.11.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 11:07:30 -0700 (PDT)
Message-ID: <bc7854a8-1dd4-4e0a-83bd-a8c9dd95645d@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 23:37:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX6WS6JKcnoaqb
 WcEhzA/XIUWIOqV4AJFc8EaXIyY5Do0TmxWubu6G/jN63TcLuflIaQ8xdfWwMWkcJb62jO4Ou0g
 /EYtuNEcnDnmWEDo4QHx6APvsWqsz4a6uq8K7ZBHGWW6s3w8Gkk6IGwCfzIprt8A6TT/0sEoF5v
 LhxVSyW0fFdv7n/ZOKdiv8h4mWF9XCzB5P6YOecgm3zEfZsLB/nE7eMWA1Cl3S61P28ILkzWM5F
 TIp1iDods+9eQ4RH7ei9wkl/cGiqlLQUi+ACKC5MNcIwbepuNyqbv7AZJsQiiK9uOi2V10bcLrM
 yb+Ei05EHRHVDnfcUKcc63R1Pftr8T9jLovWDoIyLqbuYOOjSvTFr6cpkFFzwtjc64Doh2ov9ER
 dxjYb7WqTQYJ6ryisyHRPO7q2ote/Rf2O0XN+jIv4/uY1bxDElW4p9uG1QCXLIxLNQvOGuro1Mv
 Gj1va/3czD7IQnSIXgg==
X-Proofpoint-GUID: fLiazd-hVFlQpfqtOL7bEjodKpD8GSMu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX7bFcOyYaMMTk
 pjklT3ydJzZXRuSk3kyQOC6B/z0pN0yMOIeg3oz8qg3WLThsw6710pIfZPTyczAI2CNSgehMIbM
 7GBG/ZG9xou6YRo6VwphgTWLcNBTbxQ=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a5fb564 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nYgDJefOb7ZtON2RxEtQrg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=5tee5T0z8aEC-XiIPRgA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: fLiazd-hVFlQpfqtOL7bEjodKpD8GSMu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1011
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_110735_006422_C33FEEBB 
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

Hi Bartosz,

On 7/21/2026 7:03 PM, Bartosz Golaszewski wrote:
[...]

> @@ -676,13 +691,26 @@ static void bam_free_chan(struct dma_chan *chan)
>   static int bam_slave_config(struct dma_chan *chan,
>   			    struct dma_slave_config *cfg)
>   {
> +	struct bam_config *peripheral_cfg = cfg->peripheral_config;
>   	struct bam_chan *bchan = to_bam_chan(chan);
> +	const struct bam_device_data *bdata = bchan->bdev->dev_data;
>   
>   	guard(spinlock_irqsave)(&bchan->vc.lock);
>   
>   	memcpy(&bchan->slave, cfg, sizeof(*cfg));
>   	bchan->reconfigure = 1;
>   
> +	/*
> +	 * This is required to setup the pipe locking and must be done even
> +	 * before the first call to bam_start_dma().
> +	 */
> +	if (bdata->pipe_lock_supported && peripheral_cfg) {
> +		if (cfg->direction != DMA_MEM_TO_DEV)
> +			return -EINVAL;
> +
> +		bchan->lock_scratchpad_addr = peripheral_cfg->lock_scratchpad_addr;
IIUC, peripheral_cfg will be filled by the client driver of BAM right ? 
if not, who actually passes it ?
> +	}
> +
>   	return 0;
>   }
>   
> @@ -802,6 +830,7 @@ static int bam_dma_terminate_all(struct dma_chan *chan)
>   		}

[...]

>   static void bam_start_dma(struct bam_chan *bchan)
>   {
> -	struct virt_dma_desc *vd = vchan_next_desc(&bchan->vc);
> +	struct virt_dma_desc *vd;
>   	struct bam_device *bdev = bchan->bdev;
>   	struct bam_async_desc *async_desc = NULL;
>   	struct bam_desc_hw *desc;
> @@ -1064,6 +1197,7 @@ static void bam_start_dma(struct bam_chan *bchan)
>   
>   	lockdep_assert_held(&bchan->vc.lock);
>   
> +	vd = vchan_next_desc(&bchan->vc);
>   	if (!vd)
>   		return;
>   
> @@ -1072,6 +1206,24 @@ static void bam_start_dma(struct bam_chan *bchan)
>   		return;
>   
>   	while (vd && !IS_BUSY(bchan)) {
> +		/*
> +		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
> +		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
> +		 * already have bam_locked set and must not trigger a second pair.
> +		 */
> +		if (!bchan->bam_locked) {
> +			ret = bam_setup_pipe_lock(bchan);
Hence, overall you meant to lock bam pipe once during the starting of 
the bam dma engine ? is it ?
> +			if (ret) {
> +				dev_err_ratelimited(bdev->dev,
> +					"failed to setup the pipe lock, deferring transfer: %d\n",
> +					ret);
> +				queue_work(system_bh_highpri_wq, &bdev->work);
> +				break;
> +			}
> +			if (bchan->bam_locked)
> +				vd = vchan_next_desc(&bchan->vc);
> +		}
> +
>   		list_del(&vd->node);
>   
>   		async_desc = container_of(vd, struct bam_async_desc, vd);
> @@ -1133,6 +1285,10 @@ static void bam_start_dma(struct bam_chan *bchan)
>   		bchan->tail += async_desc->xfer_len;
>   		bchan->tail %= MAX_DESCRIPTORS;
>   		list_add_tail(&async_desc->desc_node, &bchan->desc_list);
> +
> +		if (async_desc->is_lock_desc &&
> +		    (le16_to_cpu(async_desc->desc->flags) & DESC_FLAG_UNLOCK))
> +			bchan->bam_locked = false;
>   	}
>   
[...]

