Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2862AC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 06:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQ3bgQN5Dp8+Qvmy62hDVi5O4cZCEw7wjVOCUUXKBjk=; b=3tWVtj1RWTHYt008b+MV11Unbg
	wqsYOHHjNYqXY/8/UCTMbhJ8947PY94Yb9EX1AT2Wk7x6s7lJgEwMRVkMd9XQA47qmmVm4NxU+//Y
	pBtOumdtDSUMj4t9GDXXS54SLMLX8boWAPD1QRuTbhVCqK3QAVsLfihWLQqlqiPqQGgR4muXDLmDN
	ChYoBZcLo10y/VUsqsx7dwqBnvIv1LX5UqzqjB9GwDoQnOsqRVilZ6pMLW8Mnt0ZmVY1nEG7e9adF
	0xoayEYI9mgB8BWplwsgjr0sWOo4Tiz5Yr9NG+wXiYt7xniww9j5KJaRBo5yC8u081WeTgYLVCF5v
	8frVJM1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8taO-00000004IyD-3BDL;
	Tue, 22 Sep 2026 06:02:36 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8taM-00000004IxT-1XbY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 06:02:35 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-39647184c73so526849a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 23:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790056953; x=1790661753; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQ3bgQN5Dp8+Qvmy62hDVi5O4cZCEw7wjVOCUUXKBjk=;
        b=C3MbbXetypz6Z20pu5JJc3McwOty0pB4YmFbpBiou7hrbLEP61hawG6UuvYT5pqXP6
         r9EmYaQH5rF69nXW/6VX++pqsx6bETe5su2Q2HwId87zVabX8ii2W5AD4D4hraeoCayG
         JnZ8B1Q9eXUmu3wLNFKcdFVAwK1aZV4LBFVSCfFBR93l9JntHEy+um8evnfWB/pM6px6
         TpwWCefGAadhUBE1/zo/hdQx+4Hg7xIxzpJD9KE1tfUFtOXgtzkUmixk4MDBz8uU4EHd
         FAcpOZnXt8v7S580SrN2PnlFsG5RwBKFX+OcCCc7dNT6WOoDYiI96NB8FAI0Zvrfz16q
         wdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790056953; x=1790661753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQ3bgQN5Dp8+Qvmy62hDVi5O4cZCEw7wjVOCUUXKBjk=;
        b=p2QpuNA/371mOJ7lZWUfN70ulOBKIKMVwtjwTvb9wGojZLlE7pali9BJ2spF5NMwEg
         89kVtNRhfOg914Ji6LmXIW/f8mOAbYv3ZBx5CezSO65Dh1HWW4MtZpi47WT6IwpEWvl4
         AvbISGhQEawu8MmrJEA1t+ZwxqNJiwgDz3y9ozYle0hIyGRT7uGW2yZ9EX//xsR/D8HS
         vBPd0cT1Ne3gjd+P/0OYAjoyxFpqmuOLXZDNSr4C64jXRrleftaYC4CZk64pvV4sf6ms
         jA5Ev+OBY8gWb4kcDGXUpueLTI2XDNoFwRobeZ9hOy5JVE77d1Qnsu6RaIUwpe9ltoaj
         KTdg==
X-Forwarded-Encrypted: i=1; AKwUvBxH8i9/oTpxL+WYXwpX7HY2dpadTUd46mhWzLOlnOlSe4KSavr6Z7MmsiOSg5aXtqZEWA/x4BD8oAu+GOsMTv/g@lists.infradead.org
X-Gm-Message-State: AFuF++md9wPbYAF06HD1UYkWeBScPGnhAeSar5E5v0o1/VKiSV/0hz+h
	m6WWzaPiCWfQfYh8Yqtuw9vkiK41LKPyKTwhTI0tIQ9x6kRbKN0AMWes
X-Gm-Gg: AYBFou3i85ugdpd2OhIy0o3doKNOH6TbhO+tAKaNO2tMx9Vp86rcQcy34Azkgi3cHc6
	0Mfx3YcXCDR/5rObYIBKpnZxeuvqH/ehgBEb2yEQp9ATedDTtfAlSYUIL9Eku3gF14tocpVNF5C
	HkBMTEjIBKLebmrXiJMvX0QXgab/MOpNJwpeYSJAikyrEyxRMiRV64PHgZHBAvumcJpy14MRyDr
	SRUi7N6rNMUV0OTZ/iymR0lP7g6TNwNJIGmOotCzLXWEKLUS6m04Iq2H11SCBJFIRLMZDZBU+up
	ch6Mhpt03lQk0SX009Bx/3MVb07EHjUCXUWqb1oDRDB0yxGRJF/h+9/JzxecQICEj0FAPIVeShe
	fvkzdJuUUYj3MWY4bFzFao8D6ZQvyQ9w3O9BVFzzd9rxWNlZ7g6bF4Vp0EdQV3h4jVA9JgPcEBD
	fik2vzAiCNt6H9HGXv3u4AQ3qpOkrwEAH9+uHshMeSyxOE4Z5KcScT+j7uaueD4wnEkfd7VFl4r
	zMCjbX+OuIhaEUE+EI=
X-Received: by 2002:a17:90b:3fcc:b0:39d:e78d:32d2 with SMTP id 98e67ed59e1d1-3a0730cbed4mr111836a91.13.1790056953102;
        Mon, 21 Sep 2026 23:02:33 -0700 (PDT)
Received: from [10.25.133.25] ([165.85.205.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e61340e56sm3366245eec.30.2026.09.21.23.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:02:32 -0700 (PDT)
Message-ID: <976f828a-bf48-4788-adb1-7204c27dda60@gmail.com>
Date: Tue, 22 Sep 2026 14:02:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 5/5] ASoC: fsl_easrc: expose individual DAIs per
 conversion path
To: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 shawnguo@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
References: <20260922033428.1690822-1-shengjiu.wang@oss.nxp.com>
 <20260922033428.1690822-6-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260922033428.1690822-6-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_230234_416332_0235F235 
X-CRM114-Status: GOOD (  11.10  )
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

On 9/22/2026 11:34 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX EASRC hardware supports four independent conversion contexts
> (A, B, C, D). The driver previously registered a single DAI with generic
> stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> multiple independent conversion paths from being used simultaneously.
> 
> Replace the single fsl_easrc_dai instance with an array of four DAI
> drivers to allow up to four independent conversion paths to be active
> at the same time:
> 
>   easrc-0 -- ASRC-Playback / ASRC-Capture (backward compatible)
>   easrc-1 -- ASRC1-Playback / ASRC1-Capture
>   easrc-2 -- ASRC2-Playback / ASRC2-Capture
>   easrc-3 -- ASRC3-Playback / ASRC3-Capture
> 
> easrc-0 retains the original generic stream names to preserve backward
> compatibility with existing machine drivers and board configurations.
> Each DAI retains the same channel, rate and format capabilities as the
> original, including IEC958 subframe support on the capture side. Update
> the devm_snd_soc_register_component() call to register all four DAIs.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu


