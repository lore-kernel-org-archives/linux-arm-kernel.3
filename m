Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEC0C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 22:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2drbkgZlh4qyEDNlYRs7ZOmbKY3/yfqRkbgXttKS+c=; b=cFZqkDcMV1lfsbQWvHxQfsSUsl
	4fPsKzDksfhZ2KfAvuRQOzNwQpe1MQePi7yksZZ5u5uiOX45rzJQQgdoiNK/Y3Vok2tSXTkQswU/a
	SlYYA2piMXFs/9NZ+663nufZ8OghCRi3fS6hfOfNw7Titv9KAlSbyDp1lwdFa3Jn4uV2opZSOGYkO
	V5aoho/HnHNwFl8qCalLn6DefnaBDVDiQIAo4NznKdxgGz1OO0kS3tJ+HrwYvJtQLa2uWgaqhmkix
	t36vvdpHowgV6pbyyhw24ACSdc889E+DB26nNOja/KUx5jPaK2DI1e9m+k7oAgIXPfhTJtZfct8dk
	Kg2DixkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRtw-00000008iDV-04t3;
	Tue, 18 Aug 2026 22:03:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRtt-00000008iD5-35H8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 22:03:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ILbIPh2524746
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 22:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o2drbkgZlh4qyEDNlYRs7ZOmbKY3/yfqRkbgXttKS+c=; b=fhhjKy0TCVGLuY/l
	NkxJ/DkN8tjzWxF3DMTCtchQ0gyFeb4YwdxzRM52VlTe4COcHQXEbeqYNPIBwL/q
	tyuUpQw09Oo+RUWw5OHW0TqJnH6D+l2nudk51IaWVsMrhTcFN8W8Wn15++um54BI
	bvobQ1lprFSjRaN5v8SYzQ0CtoMyB0c/LFDNvL4LyTvSF0OMT4tMxj71HgGHLfWO
	/vTi999SA4shtDKFEOH3DWiuwdW9Un9tH3DS/r2KXVbFOrgk+d+PBV2ZhQ37kUJV
	JmzvZmLxmHex5tymVaJeGodWQIuoN4w0DHbWzonnYJPRdcHisPSvMEnRmiJ8lLPP
	YJiZlA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfk84dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 22:03:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so788121a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 15:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787090595; x=1787695395; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o2drbkgZlh4qyEDNlYRs7ZOmbKY3/yfqRkbgXttKS+c=;
        b=HQfDyMFk5P9O5VpcZcF+atJMK5Uh5Yd9JrwqpzfnH/QLIwC1zalPIsBQl/4y/kIat3
         4Yc1sHOvj3K+fqwuoBAp57sHsEQA4uE794Ch5fzDx/Cu1OkHpmIhl7XGMR2PdQb6/gRV
         VUUXrME/bmjQWq56b4R+gmR7FdOcMjh64ntILKawSXQssckAxrJ7wN9XO2Bb9WnokkAi
         MekWdhE1HGHRFWxGHFU9yAcDC/QtZfYORoM1CHLWpbFzfWtAo17/OLzSVPe6U6B3abjO
         w7zyh9EmZh9dps8OWzHRvl11ElBJHM3b+adO86RsiE6gzamXk9JNIlOTqRzOvuvxwAuz
         AHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787090595; x=1787695395;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2drbkgZlh4qyEDNlYRs7ZOmbKY3/yfqRkbgXttKS+c=;
        b=qOMLgAwth71wi/c5kSV8WdnrEEfwfI0gTuieaazWyRXtumzwSG2y+/3gzyxnU2kmn2
         /h+gZLreriMVuw5Qvp9X6yP+qea13PWnwFiXxdNHdMnWtsZ2W6eVlB6xtsRRWiq1xzCV
         PZGBidUP9VRfEcsi4vSL/0m4ZI57FLiLZEXH2gOPy88J5qSyf0gD0GjKU/j8DbZOpDyI
         2xcaOe7Z99+G7YH7xarqfC+XntIv5UN6MwvEAHI6aB53VVqglKLQjelv3QtsyfLnMQ8Q
         oJT7T7q8W/M6EMwRwJJXQ1pPiM15fvn9jGXXumGXgeCOmBtRYUsSnIq9YxJKW/H5xhwP
         Pxxg==
X-Forwarded-Encrypted: i=1; AHgh+RoZfy1+W3+LSJ7U1P6v+3L0H4vbkCpICbGzmk2hx1zdsDcSO5KND6LIky2zgs2uXlxbuAXmnPbXBQIytzV6eA9T@lists.infradead.org
X-Gm-Message-State: AOJu0YzyV4kV1y+PtciigYHMfPsHmM9WM6LwZdCkplb/VFiKjtggfDhD
	lkGthikpMh3Xu5gyT3gC0eH/16yvEeyjTKsmAwyqL+VItKNUee46XBEjhpHVpQd2nUK5rX26j8Y
	3xrsmn+i2Fb2uBAvJDCNM0460j7qECpgW8ZFSQhjakJqCybGE4NsKJqr90Me9IJ67+jycCTssit
	yhRw==
X-Gm-Gg: AR+sD12xObepAaEiJf6H0lRbuc/7MYp+OuMiaF1TULfq+bW9JZaWR51i8M1F0efrESY
	Mkui6IJleConw2hX1AS6dZ5cfudAbfSR6HxNOApwV+IRJw/2RKBO/bDRTzbTJsrMFCMxkh9WpGX
	eDqV1+dbXpyAkrlkQyFOcO88PAaStp6WgKaFWyMvCK/MLI1t9hCwq/vDkYG8c2KGWcoaXQETpca
	5aS64RcFfs5TYQbfeija7/AI71c8wjtFW3I9H6m0zwr3u3n6yrioXHSgTYEYqku9JVn7JgrDs3a
	qZ1g3FNhORs4nlIe9aXs9arXJxX4V2h+FtNmOSom64wGjBtWEY7OamAKatoJeRjC9MQCnekphqu
	SS6/FydM/ynbZWuA6V7jlSh6YcQ==
X-Received: by 2002:a17:90b:39ab:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39580ed4567mr75872a91.4.1787090595357;
        Tue, 18 Aug 2026 15:03:15 -0700 (PDT)
X-Received: by 2002:a17:90b:39ab:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39580ed4567mr75803a91.4.1787090594821;
        Tue, 18 Aug 2026 15:03:14 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm269654c88.15.2026.08.18.15.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 15:03:14 -0700 (PDT)
Date: Tue, 18 Aug 2026 15:03:05 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
        Vincenzo Frascino
 <vincenzo.frascino@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>,
        Michal Simek <michal.simek@amd.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ
 ARCHITECTURE),
        linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCHv3] ASoC: xilinx: formatter_pcm: use more devm in probe
Message-ID: <20260818150305.00000a2d@oss.qualcomm.com>
In-Reply-To: <20260814204428.37786-1-rosenp@gmail.com>
References: <20260814204428.37786-1-rosenp@gmail.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jj1EJQrxtgS2KCPV8I3OgQsl0NnsnrCG
X-Proofpoint-ORIG-GUID: jj1EJQrxtgS2KCPV8I3OgQsl0NnsnrCG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE2MiBTYWx0ZWRfX1gbAdmypyGzl
 YHtRAk35OR4b1QSNeQOFzOxpGAB/ichTM9Wc0JkVlJQPPMdn57BpeqLh1vjYSgsQw3A0YiF/hMn
 Uj08yRBuS6x9eBGMpNUMr7yfRjYW78xFYe2XZlaB4T8Dugc7w87xgPsaECBNVh+bDS8sJnXAzen
 tf6dL6yuyLSippkFZd/mObeehrjm7AEzRoCj1LCevn5/heI9WQ4ikO/87jhKW9NMfhld5O0fLKe
 8OFTaeW+6H0fpxsSETUR5CN5O0KHzZpHtIU/euSs0JRQdF1OKBrcCyUCBtg+DC9xB0XqDewxSqw
 jqxoYwLzuzOsjzw+WlsXaQ7DDGdhVByUneCga5WF8tDe5xVVPSWG9PTVaFMGZ/mg3TKF0UmMDie
 HXKX3Rap7vcShkFp/JaY/7vBSJGPY5cdJJPK/CPPKek8A9PFX2xVmHu0BYkVBAkGIFCEcQPfyjl
 LV0f4eSSg5QuOEW1Z2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE2MiBTYWx0ZWRfX7/0Fm3UuDr//
 ylp9WYPJRWzkYPR8Qn9ZygBUQWlgySGuCOwvL/1qv76Ym8f6io21I5y93hN7l8DcS9SVW4WE5Oy
 whQl3K4X5xbxkmI6JPHLCKXi/rWljVk=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a84d6a4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=zd2uoN0lAAAA:8 a=7CQSdrXTAAAA:8 a=b7Ee_MopkQ2dvn5odMIA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_150317_926415_A95DA94E 
X-CRM114-Status: GOOD (  28.19  )
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

On Fri, 14 Aug 2026 13:44:28 -0700
Rosen Penev <rosenp@gmail.com> wrote:

> Use devm_clk_get_enabled() to let the clock be enabled automatically
> and cleaned up on unbind, dropping the manual clk_prepare_enable() and
> clk_disable_unprepare() calls in probe and remove. As a result, move the
> clk struct member into probe, which is the only place it's used.
> 
> Simplify the probe error paths by returning directly instead of
> jumping to clk_err, and use devm_snd_soc_register_component() return
> value directly. Also remove error message from ioremap as it throws one
> itself. Same with devm_request_irq().
> 
> Assisted-by: opencode:deepseek-v4-flash-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Michal Simek <michal.simek@amd.com>
> Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---
>  v3: rebase.
>  v2: add signed-off-by. Further clean up some stuff.
>  sound/soc/xilinx/xlnx_formatter_pcm.c | 71 ++++++++-------------------
>  1 file changed, 20 insertions(+), 51 deletions(-)
> 
> diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
> index 3d6f1e4046d8..5f63fb28ea5f 100644
> --- a/sound/soc/xilinx/xlnx_formatter_pcm.c
> +++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
> @@ -82,7 +82,6 @@ struct xlnx_pcm_drv_data {
>  	int mm2s_irq;
>  	struct snd_pcm_substream *play_stream;
>  	struct snd_pcm_substream *capture_stream;
> -	struct clk *axi_clk;
>  	unsigned int sysclk;
>  };
>  
> @@ -596,30 +595,19 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>  	u32 val;
>  	struct xlnx_pcm_drv_data *aud_drv_data;
>  	struct device *dev = &pdev->dev;
> +	struct clk *axi_clk;
> +
> +	axi_clk = devm_clk_get_enabled(dev, "s_axi_lite_aclk");
> +	if (IS_ERR(axi_clk))
> +		return dev_err_probe(dev, PTR_ERR(axi_clk), "failed to get s_axi_lite_aclk");
>  
>  	aud_drv_data = devm_kzalloc(dev, sizeof(*aud_drv_data), GFP_KERNEL);
>  	if (!aud_drv_data)
>  		return -ENOMEM;
>  
> -	aud_drv_data->axi_clk = devm_clk_get(dev, "s_axi_lite_aclk");
> -	if (IS_ERR(aud_drv_data->axi_clk)) {
> -		ret = PTR_ERR(aud_drv_data->axi_clk);
> -		dev_err(dev, "failed to get s_axi_lite_aclk(%d)\n", ret);
> -		return ret;
> -	}
> -	ret = clk_prepare_enable(aud_drv_data->axi_clk);
> -	if (ret) {
> -		dev_err(dev,
> -			"failed to enable s_axi_lite_aclk(%d)\n", ret);
> -		return ret;
> -	}
> -
>  	aud_drv_data->mmio = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(aud_drv_data->mmio)) {
> -		dev_err(dev, "audio formatter ioremap failed\n");
> -		ret = PTR_ERR(aud_drv_data->mmio);
> -		goto clk_err;
> -	}
> +	if (IS_ERR(aud_drv_data->mmio))
> +		return PTR_ERR(aud_drv_data->mmio);
>  
>  	val = readl(aud_drv_data->mmio + XLNX_AUD_CORE_CONFIG);
>  	if (val & AUD_CFG_MM2S_MASK) {
> @@ -628,7 +616,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>  					       XLNX_MM2S_OFFSET);
>  		if (ret) {
>  			dev_err(dev, "audio formatter reset failed\n");
> -			goto clk_err;
> +			return ret;

Why not dev_err_probe() for this one?  Even though maybe deferred handling
isn't useful here (I haven't checked) it still gives more compact code.

>  		}
>  		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
>  					    XLNX_MM2S_OFFSET,
..

>  	if (val & AUD_CFG_S2MM_MASK) {
>  		aud_drv_data->s2mm_presence = true;
> @@ -654,7 +639,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>  					       XLNX_S2MM_OFFSET);
>  		if (ret) {
>  			dev_err(dev, "audio formatter reset failed\n");
> -			goto clk_err;
> +			return ret;

As above, I'd go return dev_err_probe() everywhere you now return due to
the other cleanups.

>  		}
>  		xlnx_formatter_disable_irqs(aud_drv_data->mmio +

