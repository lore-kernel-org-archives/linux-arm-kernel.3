Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B68CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FvrWgtYM1o1H3GtR4yRdUrofDJ3VZExWe4rEvgf3XU=; b=qKln/1sfPZ/F7RqSiNB3AoPIko
	ug5Xwzuk7yvQ0AVDmuhjTUrplUVNElxxsA1sjDKeV83LoGX9Fv0j643OUa5S3sJ/44XtSjbFGndTA
	4SXAGztemxn87lc4mwnNcys+SYNvQRWOBqJJJeCgbPB90nf++HuWaJQ45yVo5Qepc5/B3q+9xMPIY
	iXVAf9U2HmVVnytZhU4tN3EyyR34V0iIXGZnSjOaJZINqWM7R7coWAGkIPIfnfBoW3dv3OPsk9aXV
	KaVzc0iHFTmxh9YPKgh0WOpx0+fTLh9D9eQ2ULcPPq5G9iv7p2BszFCdeJeo1X9z/72A4wZfVwPJV
	2f9eaxbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESPR-00000004BIR-3XTq;
	Thu, 30 Oct 2025 13:09:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESPP-00000004BHg-2ZCI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 13:09:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so1018628f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 06:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761829781; x=1762434581; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2FvrWgtYM1o1H3GtR4yRdUrofDJ3VZExWe4rEvgf3XU=;
        b=jGx5lstS8GWO+41DW5QVEs2+n8lU8iZf2fXsEHmmBRLPfJdIfxh3gwcaNKKvZSdXoV
         g+Ik4Oa1rsecyBjIF+JFDVNBmicFEPWYMruU/R98Vu4z4LXzcCek83rBEQRf7GAY+dqq
         Jix0CtiCBNQoOevWXnsoVciANTXU4/EYlKaaZgjqvh9SY6ISaHaqaU+UjlOcLEUkq9en
         9zJZXHPCFuLvddT4jt34WiGQ08xxYgCYtTDSSVUASXtaDcIK4xStj2sx4M8WzqW49TtX
         z7XT0ple7gndKuoqS3E0+P14E5k0tm8m/y2gHge3OKBJ6xNdq1eKbDsoICXRMXeQzCIs
         SvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761829781; x=1762434581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2FvrWgtYM1o1H3GtR4yRdUrofDJ3VZExWe4rEvgf3XU=;
        b=ukQQHWNDWp36dDklv8nbLnlHYg5GVfA8gVeQluPnLquE2nkn9pxiDM2TB3gwTdFR3c
         6Kn3zJYQVSOBVQNev68cp85GFUt+O9oApBnR4pja1nE5fMgZtPOm7+HLVFXlvgFYlxO2
         +VcP4Dh97gRafviOyaB1e8r1mGmoVDdTct9Xp+gxuKVpdqtbkzyVrdhTzvCHFFbQCUz5
         Bxr5dJH4q+SAGXruzqs/SKURVo3AVQ2hEhhfbb/osIPKOgI6Fm5w9hds68VI+lX1fLy8
         61bRqFLMGrqruEw0dvH7Kkgbt+IkCXuUl2MsB5wO1sP9xW+WALDvbvmclGYxlfuZa9AY
         qObQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZn1yXrc95y0Bc5ma4KEqdbCV7GC5TwN+MYtNFA/2UzZ4fX8wqysun67xghpI+Ii2+VCITCUzRHxvt4M5Ex6fi@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz0Elbba0tDL0PgA8QHi/YOG8cGGWOX4RHZwl+7D61xC8mE5TI
	6UTYiGH4OAcLmkPApsHR+w77ZDSLmmnseyTsOA6FYmHGtWH/GPtqMbCh
X-Gm-Gg: ASbGncsUhNVWdjphBkitfoQSXrV3n6SJD7ycns7Mye/3N1O22DBikcYVD5wYbWW/o3W
	ETLZrZ/bf6/WDs2YvsbSwgUNAB4pwTSgnm9Wkm4h4DVYGIOTHSqGB78kSS9MVEib3wNFP44LBRW
	kmr9g7TznFPf0tpLwQcpbOmP/abDVTrbE7iwoK6Wrne0++MJV3fN5/q9zAUPjf3lO0bWb3nNmCZ
	dksihxYkUlxQpy+u4E/46yFhaywxoISL9RPJwQyky7nEhl/ymOX8pm+nendVKjoDP/t7ts7C1tb
	LtdouHEzYDmBu87izq2SUm0FjEwThSH53mNqIXWFzksLZ4aq5dVXktU4c25cymHs98vZ69UNF0h
	aXyvHaV/PoeefKqRa9rA5TooNlQuHFWuW9qlnVS1GwIzUd2h/eD6hev276NJGxR070IIlP7xfy1
	CFfbbygssmLgVM4xqj7PgzC4fa1zUDFwU9SSJKVEkm5PI8+37I4vI1odUCWw0jjtHtraYbb+ZNP
	c92lQcmsd9lLrv3m/iXySAQzBnhpUvBXe0ibugABWGn7W0=
X-Google-Smtp-Source: AGHT+IHt0qZj97JBfhSm3bU2Z3jejv68CgVJx0PCPzKZeY8wdWN+4MGQv4dUD3at1v6e8mwpzpu6rQ==
X-Received: by 2002:a5d:5f96:0:b0:429:8d0a:8108 with SMTP id ffacd0b85a97d-429b4c8a0acmr2867282f8f.24.1761829780332;
        Thu, 30 Oct 2025 06:09:40 -0700 (PDT)
Received: from ?IPV6:2a02:8440:750a:26fd:c3f7:5627:ab4b:232f? (2a02-8440-750a-26fd-c3f7-5627-ab4b-232f.rev.sfr.net. [2a02:8440:750a:26fd:c3f7:5627:ab4b:232f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952ca979sm33491156f8f.14.2025.10.30.06.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 06:09:39 -0700 (PDT)
Message-ID: <287da4e3-0a28-42a3-8f59-7e41dde4d20c@gmail.com>
Date: Thu, 30 Oct 2025 14:09:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: stm32-mdma: initialize m2m_hw_period and ccr
 to fix warnings
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20251030-mdma_warnings_fix-v1-1-987f67c75794@foss.st.com>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20251030-mdma_warnings_fix-v1-1-987f67c75794@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_060943_664105_CF319B6E 
X-CRM114-Status: GOOD (  20.76  )
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

On 10/30/25 13:26, Amelie Delaunay wrote:
> From: Clément Le Goffic <clement.legoffic@foss.st.com>
> 
> m2m_hw_period is initialized only when chan_config->m2m_hw is true. This
> triggers a warning:
> ‘m2m_hw_period’ may be used uninitialized [-Wmaybe-uninitialized]
> Although m2m_hw_period is only used when chan_config->m2m_hw is true and
> ignored otherwise, initialize it unconditionally to 0.
> 
> ccr is initialized by stm32_mdma_set_xfer_param() when the sg list is not
> empty. This triggers a warning:
> ‘ccr’ may be used uninitialized [-Wmaybe-uninitialized]
> Indeed, it could be used uninitialized if the sg list is empty. Initialize
> it to 0.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>   drivers/dma/stm32/stm32-mdma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/stm32/stm32-mdma.c b/drivers/dma/stm32/stm32-mdma.c
> index 080c1c725216..b87d41b234df 100644
> --- a/drivers/dma/stm32/stm32-mdma.c
> +++ b/drivers/dma/stm32/stm32-mdma.c
> @@ -731,7 +731,7 @@ static int stm32_mdma_setup_xfer(struct stm32_mdma_chan *chan,
>   	struct stm32_mdma_chan_config *chan_config = &chan->chan_config;
>   	struct scatterlist *sg;
>   	dma_addr_t src_addr, dst_addr;
> -	u32 m2m_hw_period, ccr, ctcr, ctbr;
> +	u32 m2m_hw_period = 0, ccr = 0, ctcr, ctbr;
>   	int i, ret = 0;
>   
>   	if (chan_config->m2m_hw)
> 
> ---
> base-commit: 398035178503bf662281bbffb4bebce1460a4bc5
> change-id: 20251030-mdma_warnings_fix-df4b3d1405ed
> 
> Best regards,

Hi Amélie,

Thank you for upstreaming this patch.
You can add my reviewed-by tag:

Reviewed-by: Clément Le Goffic <legoffic.clement@gmail.com>

Best regards,
Clément

