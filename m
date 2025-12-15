Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC40D5B16D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 02:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qgsg75s3qAHMgvIkSidcSt/1Y3c1SrFas1wQzevvAw8=; b=ZVQBs0xezbE/t5ofruoBhYwxvC
	RTfqDPK9i6xz4tzwdh/yCp7tQ8xXitwxeEQPY6hM/v6wXHB4SbryEu70EieZcx+ODr1/UjosaOwzG
	rZeLducMUZ8yopXDXLbi0IrMM7Y0O6H5wzmHnw0yAyrUnL6+qU+StRwco0gOCHHLaAVl81Ubn3hcy
	9PTCjZB521B63I4Sf59lGw70yGTX3kI7As/46ShiNso5VoneR9tiIGS1UVIwkIqKtCuJUr9zSTU14
	4ik921+jyHipzQ0E9/wkZb2z04I8cWUhY5XzRloyFymPOL/nHJN1vofc3vdQocsbhsQemQv3AyqWo
	jtx6iywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUy3P-00000002vsG-10wd;
	Mon, 15 Dec 2025 02:11:16 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUy3J-00000002vra-2DLB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 02:11:14 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7aab7623f42so3446136b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 18:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765764668; x=1766369468; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qgsg75s3qAHMgvIkSidcSt/1Y3c1SrFas1wQzevvAw8=;
        b=jtFFzhEd29TV+P+qzRzrQR5K1MeYDAKQJWbEx6Wci7d2EvoOIryP1uR9Xq5lQEL0g1
         7hW4n/VoiMLnb/cwuDHecTxfTXsH1O/F7rn4qMfy8vKwGnVrFRTFJh7PltQl8tSY6OBs
         ++8TC21nnbDoGxboJADKDyLH8rRuwosjsNePeL1voVO5iCLSEAvqvAGvu8upZFz6Aybq
         ycfWNkHnke5D+yZYFUrwwIdMw3b4VHmThVV6+4hK9z09GW3AGBjT2S6Vgg4IxPnuFAlD
         IYSthgFOlx+NKNN+a+n6toaMRAWbpKBAhBRnuVmxsko0NElFBmXUdaFDUnp6tmx2sMaT
         QmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765764668; x=1766369468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qgsg75s3qAHMgvIkSidcSt/1Y3c1SrFas1wQzevvAw8=;
        b=WTsoyB4d7vsyokexuqs+DFbz82eSOeNzFxwWdHsrNeXdeq3nttZbBkPScwNFswSCZz
         cAmkIPTP1/gO5jq7sw9zrm36gZBU+2+sHWzPAadepPkLKvhEnCb2CC4/iQFlXg+hUKtB
         RrVw7TJyGsahAGUNfYlhkL5oTJZlIJv9F7jBEOHVHHPMb3EGPfbZ2Yu70ri2eofZUF9M
         wdmSMkYhEm9eO2GMa3ZMC9UUq5dm6sqs6QUz2cppfwrdKNe6NODpIhgDAdB2EQZiQZAY
         igI4Q+7ehGkFHm/n0N7aL4zrH2Llfw4YQCwfP3psfISPbzZDF+naeLHa3lvu96adhzTd
         /42w==
X-Forwarded-Encrypted: i=1; AJvYcCXYhajriHejihWTL9ZHb+Td36upap1YCxjesdknHmAYYZysMyh9Q/M7Q/fUbjUkguIu2mGcUbWIaWUeCfixdn4x@lists.infradead.org
X-Gm-Message-State: AOJu0YyUwtm7UYR8cLo4h6axShQACejde8YM5rnH4NQoN/LA14Wh7ecp
	7eE5dBPBWCJ+Q9qGKH8lkHpzU7+XHDkUXjhANWXPTlyy8o7P1aIlKgnWe1imUN6YBAg=
X-Gm-Gg: AY/fxX6F/uZ5syRfmgJMAkVWFNsNfpCkUt93w8Wy8Mzd7UVWlFw0kvWoH2iU4hKmnhI
	qnI2Q/37PYULgEWZJBsNXUK07HuWn0PtbRBBQ/ghEivTZ065hAuV+O3gHYx5tATPnhPklMD6MGC
	0/xeh25Axe8ExyJotziWjfO5eBzaYYUOV4qaCyGjpRR8EKS90gKa4EQmAMsZk0EQpGnzjiQTeVQ
	90LQsiSIrpNIk2CrahGHyF7mZRiyRCzodRjve1DanPY0I1jSMsXm5pl9tXBZVKFD1rWR+UJwVJV
	k8Z/Z5CHHt7Z+HMf5kZz2lGyeE7KkAUUexurTfOB+mjqgT9o2JDRDrTfYRy80CAgASJV7gxneNS
	amOydLwp5owM5adJEUfRAATnfVmwqJyNpGv4wsN6z92+/dk8Z0E9k+YhXhqoevquGncVse2JODR
	/NphcfzIYfjB8SbeOeHSuEzPCnNjVN0Tuq6qtJ8xcofw==
X-Google-Smtp-Source: AGHT+IFshcXVNij9zJ81B5WuJafD0T1VgLx62XssDHNaTIpACeotR+RQvJl07N2kvTSSjnWlXbJGOA==
X-Received: by 2002:a05:6a20:e210:b0:366:14ac:e1fc with SMTP id adf61e73a8af0-369b0999301mr9246879637.78.1765764667976;
        Sun, 14 Dec 2025 18:11:07 -0800 (PST)
Received: from p14s (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1361b76c4bsm3021918a12.35.2025.12.14.18.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 18:11:07 -0800 (PST)
Date: Sun, 14 Dec 2025 19:11:01 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 1/3] remoteproc: imx_dsp_rproc: Skip
 RP_MBOX_SUSPEND_SYSTEM when mailbox TX channel is uninitialized
Message-ID: <aT9uNSboYCGK1DYL@p14s>
References: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_181109_590059_827CC1A8 
X-CRM114-Status: GOOD (  19.77  )
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

On Thu, Dec 04, 2025 at 02:28:23PM +0200, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> Firmwares that do not use mailbox communication (e.g., the hello_world
> sample) leave priv->tx_ch as NULL. The current suspend logic
> unconditionally sends RP_MBOX_SUSPEND_SYSTEM, which is invalid without
> an initialized TX channel.
> 
> Detect the no_mailboxes case early and skip sending the suspend
> message. Instead, proceed directly to the runtime PM suspend path,
> which is the correct behavior for firmwares that cannot respond to
> mailbox requests.
> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
> Changes since v1:
> - Wrapped commit message to 75 characters
> - Changed dev_err to dev_dbg since this case is normal behavior
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>

I have applied all 3 patches in this set.  Next time, please consider adding a
cover letter.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 5130a35214c9..f51deaacc700 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1242,6 +1242,15 @@ static int imx_dsp_suspend(struct device *dev)
>  	if (rproc->state != RPROC_RUNNING)
>  		goto out;
>  
> +	/*
> +	 * No channel available for sending messages;
> +	 * indicates no mailboxes present, so trigger PM runtime suspend
> +	 */
> +	if (!priv->tx_ch) {
> +		dev_dbg(dev, "No initialized mbox tx channel, suspend directly.\n");
> +		goto out;
> +	}
> +
>  	reinit_completion(&priv->pm_comp);
>  
>  	/* Tell DSP that suspend is happening */
> -- 
> 2.25.1
> 

