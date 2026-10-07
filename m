Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2178FCA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 09:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEY1HiXG+k0FBzAZcmArh1yUEuv93JP9npYHqIESvQw=; b=hV6wu7wy4rPQ7RiVsImI5+UaLA
	3NP8jdomeySduZNFLgQ5kabyA9nRd/DdObExg/D4NAkvJ+CQYHIskzyzAmxWebpt6dY1jbZS3HokR
	DF6GuB/CotG4uF057Kyj0I/JCmLDPbEmA6RuJdz45RlGGr6CQQATlWwz3vIjeZTsRs39j6OWjnMeo
	ZpJgDy/NFYkwz9EVKt9wkR5jPy4MSoKC8v8x823U9hjeC5Y9cMHZkUIAFrZxCUdn45LnSHCY1eSzJ
	OkrVqrpjBaxfn5JINrAhE1Qxmx1jaE9CzGd6/lzAwDO56NTrCoaWWqXAZTdlmLB7D+k+6CCiBx3bd
	P+BOPpEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOLe-000000026Uy-0nDZ;
	Wed, 07 Oct 2026 09:54:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOLb-000000026UM-14f7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 09:54:04 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jREK3298190
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Oct 2026 09:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LEY1HiXG+k0FBzAZcmArh1yUEuv93JP9npYHqIESvQw=; b=TPy+Cw5QB2vpNE2i
	5NgyeChwcjy5BH5Kvs3fL1GlKecMT25SK1OkvkoG4gJZmI67XYjtxOSXKkwG8suz
	vtqOuHAisUxjRc0EgL9XgVdyxKJirjBe6+KJjDUs31+Ujt8QPdqIiM6aKSKe9J99
	JNyMTeQoBU0WnyXr1HzrPt3KcIt6iQFEefR6243Q2srU43UuPROUpuVzZAeJtUzv
	d2lmM4Z3MRzZo8ZiOScasAY1IRWOyQRC6tZw8bbBGcMRwT751Q6ELACfjoJakz4Y
	oe4eoVyZD+iRrk4Fxwqdg9lhtWJw/q3ED4a4tbr4cj2Hv0MYd3T9KCz7E+8r/ozI
	vhduDQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrhnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 09:54:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a6d95d6e08so3023191a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 02:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791366841; x=1791971641; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEY1HiXG+k0FBzAZcmArh1yUEuv93JP9npYHqIESvQw=;
        b=c4lPOaE2Kb2xvb5jyNwirFMrlU1aOOwXdqrchlHNuY83At4mXdj6+eCUeaqwuV+XdQ
         HC1Y6Kwdt769X4NQMtsIrbWrHBfmAd5YtaP6KQ8M7VYMd58ROW45HjfJs3X2U7SQ99Ea
         HUn/6SshyrVCnJrb/gdx9zu/ykM3Qvd3EFUMBn4tOD0EyAYnPOSJU3DyzStHEPVPHV9g
         n/n5VdFDm5pJJIfoWPX9cu+McQrAAdeppNN1Pacdh5QRvRT34u/Ak682BTpG8DzQ2CiX
         ug4K15g/FOtUXKGmZxXRu0jKTQ+SL4TsaKoWB5Vu8l4X2O5kdXXqKa74wbF2JTZ6g2KS
         p5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366841; x=1791971641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEY1HiXG+k0FBzAZcmArh1yUEuv93JP9npYHqIESvQw=;
        b=fjzfv5FJ1ahQrv6k446PA2OQDUfepG7AeNvpgmf94sb7gocdiRpAg2/YloqxXpKQoV
         0zvgvu0H5Pc+0err7tuIqzj9m+iNQlDNEKnpAvgDknnqDps+y8hrL2Z3KPNX8wzld5Xq
         DwVd5M43xSEMs20eePKgIZLH4EHosF8v63yr5VdZwS5N0+uSe1/9KRBr2B1V5DzeE7zH
         j663FxkVUsXTGVtmapxKtvNG+Pzci3j49PLh/ht9MNtow88VBvFexsQwHBnDH0t4j77Y
         Ry0l/FjIG/QpCVgQpXzJebhTFlrqKb8ksC/iwdKQEgtVPyZe5z5Z6+vuz2qPiadmCSO2
         hNfg==
X-Forwarded-Encrypted: i=1; AKwUvBzjhPN2zx2IRF1w8tvSXwH3aNV9ajF5SpV1p3rxaFU3Qdt1qJbR6mEBma6FymzHD0MrNr9z4/ACzqnxmmKCxenK@lists.infradead.org
X-Gm-Message-State: AFq9FYKtfGSgIbMIajHVdTE/K8BneyrLr+ICfTpZnCFTFjMFp9NvQ/5C
	TeTl2htPFEsEyVY6ZchZrJYpsQbW4G6pKwmrc18bnplFaUKNmLB6KeVV8Cxm/6gA0nd22Pe26Jk
	Sp9ijCDgKHRsJPZcP95cUKF9+beGia40E68r6Ii4nVERvcceDv0H9OHUSvw7RJwk740CPop7Gwa
	LyhQ==
X-Gm-Gg: AYBFou3oUMa7hbgaInL54afb5JKXLmX+fi+OkQVBI+3A1v44pNJs84s+QICzU7i2yXT
	XENAD9khdqjaH/9JeQrfYQRFxo4RKcimtOmRzCeklujytglmoO6WCVz44GC46u64GJcMULu8vcp
	zz8QWN4Hva1vAYBFuvBkycz1y3UQMLzSlZXoQ9Yw8fCAxaSZJdC4bj7ejQPMisllQZZb9ArP9kv
	oWPA2WsNBuZCe3PPZJVqnqNywHGZUE7NzEwuCXcDOHAnEeUVcWFCJuT6S5aY8+lrRFCRk50ANIx
	FN+uuxHYk1rGWL7Xn4sDtbxxif5fn4ZXwSTd8sVEwQappH2wRGAa+BLLJgpp3jE/QL7KODo9crU
	f3pC8gBzrNMvWV59RdwNlxJCrd5s=
X-Received: by 2002:a17:90b:4a41:b0:3a0:4384:adf6 with SMTP id 98e67ed59e1d1-3a89f43624amr1437328a91.0.1791366841111;
        Wed, 07 Oct 2026 02:54:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4a41:b0:3a0:4384:adf6 with SMTP id 98e67ed59e1d1-3a89f43624amr1437320a91.0.1791366840551;
        Wed, 07 Oct 2026 02:54:00 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a60e5166sm1300131a91.4.2026.10.07.02.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:54:00 -0700 (PDT)
Message-ID: <8f75db55-66b2-4b94-b0bd-ccc52f08d197@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 15:23:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
To: joakim.zhang@cixtech.com, lgirdwood@gmail.com, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ajay.nandam@oss.qualcomm.com
References: <20260928053613.2158446-1-joakim.zhang@cixtech.com>
 <20260928053613.2158446-5-joakim.zhang@cixtech.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260928053613.2158446-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8C2JHgzeaE5MCzPQ4lEuDDPrO6x2c5gU
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac616ba cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=TAThrSAKAAAA:8 a=Krqe4lgBS7SFU2rUEjIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX2z6G1j5/oDwP
 Ocj+/Yzwuh/z7QMIFqCuKXIK3SB50rZu0b1+cm2FIxsEVdAqMyWL6kNoFJkcjejuHUfMpcsK9wc
 rMs0o+1BQpvRA2BeWW3T0W58lUH9+Aw=
X-Proofpoint-ORIG-GUID: 8C2JHgzeaE5MCzPQ4lEuDDPrO6x2c5gU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX0ynmVpE9mhTJ
 4oO1D8ByzGfuf2cCx2psMYYTSbtl8KqrLOhZPDx0n0XkxXoY6Wdd6MfcMSyZXHkRyk5VlgIJrDX
 uGxcWDCV5a3o1RJQ1n5FtJvr119cx7p7U+zxDdesacKoOZ19YC4sI2f3hGT0+FEtR9T92CKS1/W
 pDIzzjD+63dgt2BTR2eCZy1RAw8Pcbg/t0IyNKhgtMOg+m0MXur7UeXn2G1VOe/ZqFqyG23GiaQ
 pBKXy0wbQ/K2z1IYfMTmTqIOpAXOGlJxo7n4uJltXemiWNx0wJgbxjyDcaZu4OktQ/kkxgOn20k
 xL5DIUC8yKUFn7jWNjTCCMvspouSfptQ/v0Mwr6to0SsBjnD/KeGQuGxlYghiMU7jyILTHCS1Uu
 JPyJ3cW0epx5+rWjrYhagyrP8nu6yOJuvYfuwh7knZmM5br/BpfT+53KerSkrNXMRmgvdzvtIPM
 RhCVQA1pdCAt+tOoJSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_025403_419922_A2AE8B62 
X-CRM114-Status: GOOD (  23.58  )
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



On 9/28/2026 11:06 AM, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add support for the Cadence I2S-MC multi-channel controller found in
> the CIX SKY1 audio subsystem.
> 
> The controller moves up to 16 channels through a configurable set of
> its 8 data pins, each pin carrying two slots. Wired-out pins may sit
> at any pin index and are described by cix,pin-out-num, cix,pin-rx-mask
> and cix,pin-tx-mask. The driver exposes a transmit DAI and a receive
> DAI which can act as clock provider or consumer independently, and
> streams with fewer channels than the wired pins narrow the enabled
> pin mask at runtime.
> 
> The driver registers the dmaengine PCM helper, selects the audio
> reference clock parent for the 8 kHz or 11.025 kHz sample rate family
> and keeps the minimum functional-clock to bit-clock ratio required
> for safe clock domain crossing, with an extra margin cycle when the
> bit clock is sourced externally. Runtime and system suspend/resume
> restore the registers through the regcache.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---

> +static void cdns_i2s_mc_rxtx_config(struct cdns_i2s_mc_priv *i2s_mc_priv, bool on,
> +				    u8 pin_mask, u32 strobe, u32 sync_rst)
> +{
> +	u32 irq_mask = 0, clk_mask = 0, i2s_mask = 0;
> +
> +	irq_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_MASK, pin_mask);
> +
> +	clk_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_STROBE, pin_mask) | strobe;
> +
> +	i2s_mask |= FIELD_PREP(I2S_CTRL_I2S_EN, pin_mask);
> +

This patch has the same build issue as the SC driver patch: 
cdns-i2s-mc.c uses FIELD_PREP() but does not include <linux/bitfield.h>.

ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to register dmaengine component\n");
> +
> +	pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to enable runtime PM\n");
> +
> +	ret = cdns_i2s_mc_clks_enable(i2s_mc_priv);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
> +
> +	cdns_i2s_mc_rst(i2s_mc_priv);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +	i2s_mc_priv->irq = irq;
> +
> +	ret = devm_request_irq(&pdev->dev, irq, cdns_i2s_mc_isr, 0,
> +			       dev_name(&pdev->dev), i2s_mc_priv);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}

After cdns_i2s_mc_clks_enable() succeeds, the platform_get_irq() failure 
path returns directly without disabling the clocks or dropping the 
runtime PM usage count. The devm_request_irq() failure path also calls 
pm_runtime_put_noidle(), but that will not run the runtime suspend 
callback, so the clocks enabled  manually above remain prepared/enabled.

Thanks
Ajay Kumar Nandam

> +
> +	/*
> +	 * Let pm_runtime_put_sync() disable the clocks, and take regcache effect.
> +	 * If CONFIG_PM is not enabled, the clock will stay powered.

