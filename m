Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B79AC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 16:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLPE6u9pVE9mFKhORQsoD2PjZ8/6f/PPPShr0ovcjeY=; b=ga8gtUsdjxg2iZvs3ocpQnQRMt
	aerBDiIcHqgcUK6znK/nFWCTiWFqebV48c8+Rt9Z6FCOFamvrva41vbuq6VayJ50MBxAYjl+vDWLJ
	WQhik692vFB8uf2bqd62qE2wpern4Ei53Rny5CJXbX81wUUlXDHL/JeL7FifBVp6CWABwQy05Pvyz
	HDn2MGeYzk/ZSBg2aU1vdMi9L1UAny/Y3Ocf3Q9cT5kijTxJS4ZIzTX8Hfqsw3AcGflefo3K+xpQi
	55935cklXBK4rDzrYONPg4KaVAF2MojSa9XQUAfVpR1XX40MaOsIwNCN+n6vLccXN2D0TWlCWGNJt
	g1Mq+PMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjjl-0000000F2RD-2fw8;
	Fri, 04 Jul 2025 16:58:09 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjE3-0000000Ex2F-16S7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 16:25:24 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-748fe69a7baso997407b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 09:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751646322; x=1752251122; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gLPE6u9pVE9mFKhORQsoD2PjZ8/6f/PPPShr0ovcjeY=;
        b=sqkAkMBDfbNUiopU/6LSqoT9j7ikB8FvL8ulGfXl7N+rVYJ5AevBbN+Na97KX63FhK
         ipjp9GtMGfzhLbzNPgGnYgo5CwKVCmEL4+3Zk6VkaNeY9w6QSJxG8ly1224AGaOomGew
         31ES/y+wOsUSYE8/FXD/amdYrEZrtBZKM6tdNNL7+DnkQYwdbR1fbqsfZ+ksuGymiTeS
         TISA4mpRYdfJCZPnLXMD7S6/UOz8LTRfDI7aYbp898tt1C1YQez/BXnpThdkTK9unN3t
         8VdCCvE2fUXq0I8sC0rPpMf9DcPABEhM3dWYzA9uoR9u8eA7SQ90KnRlSshKqshe+tlX
         00bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646322; x=1752251122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLPE6u9pVE9mFKhORQsoD2PjZ8/6f/PPPShr0ovcjeY=;
        b=N6Dov5omQzVHzizIJaQ9jRq3B3N4He+EfORhSHuImM1/4zxr9EhFpfGdKn46+0CcNO
         FY41Ts2wbriGu4riax3P5Gv3VFnM102jPDCrNMsghJmwGIF6+7YtkQKcbMtPRGhYt8xW
         nFRWaZrhUwQWmZ8WexnocZy+ZHv5crhw/9QVvLCegtmkeOdT2K6WWVnymNymrQ/xX7yp
         SYq0UeMckfRr57FyuHTvae+iSYSOMvw1Pas1NTZWD3ZhGZrtDTKM/MZl0uVkipJrolhA
         LphzLu5eeQImP4q/ooCnsTF1Hx6D8dTF9lr2VWfxGS+qD0BkDoSOxDMQkSmC3n/g6o5t
         FzYA==
X-Forwarded-Encrypted: i=1; AJvYcCUvrYOkgB5NSU1FGElo2J2kspW8pPD+5+4+plHdole4Qa9Ka0ON7ZjtHamSZyhD0/k6gl7gpaVgajwMIzoU022P@lists.infradead.org
X-Gm-Message-State: AOJu0YxECKscpcHgtFc73jfIwTDZuzpeF7uGbbrg4NOB0YGonidRpDw4
	m84yhP4Vt4/KTPkLaFnjqBCAkMGhQCO0wUE2u/K+mXCcMWGUBw5ArfHH0VO+ea/C9eM=
X-Gm-Gg: ASbGncvPEibnQEfpdqmiCMmUo3Wch/dAHRpXUfuHNZiq/S9hQeQSxZrsnK8uKXuy7P2
	vlqaMLPYf+/RetLFudCjxz1veTAvtYT0OkmCkrTyjLcPa2QAzuwQvnGUV5emczbmT4PxrO59VPy
	GfOB0TtBklRINRbHd3dhsFKAqJoNJXybfT/2gmM1UyO032ruNOcOy0a2R7UgPZKkFU4y5vzKSXG
	7UkunYMKkSEsmjZVjaKb+Otze+T5q2Dn9qIX7Cg9n8PZ3e5VNjHzkXKVQdX2QLRO+M78AqU6agU
	iTL6TbiGUv72+H8aRdWoURTX13eKK/JSnoqOBmyWcr3vqmIKvT+mUtO728UstHPCFw==
X-Google-Smtp-Source: AGHT+IFBiad93Pn2/FAtXLpWzkQ49cPn+B6HjvtiH5Apy3jz1Cm6ZSX7XnZ5N4+nL8xIggbIhrfCsA==
X-Received: by 2002:a05:6a20:548d:b0:215:eafc:abda with SMTP id adf61e73a8af0-225be8d93abmr5288088637.18.1751646322493;
        Fri, 04 Jul 2025 09:25:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ebf3:da99:de93:f600])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce35cba78sm2572801b3a.57.2025.07.04.09.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:25:22 -0700 (PDT)
Date: Fri, 4 Jul 2025 10:25:19 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Ritesh Kumar <ritesh.kumar@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM regions
Message-ID: <aGgAbwToGhsc5VV9@p14s>
References: <20250703130831.18830-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703130831.18830-1-hiagofranco@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_092523_343908_E70991E3 
X-CRM114-Status: GOOD (  21.27  )
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

Good morning,

On Thu, Jul 03, 2025 at 10:08:31AM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> Merge the contiguous ITCM and DTCM regions into a single region to
> prevent failures when loading ELF files with large sections:
> 
> remoteproc remoteproc0: powering up imx-rproc
> remoteproc remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
> imx-rproc imx8mp-cm7: Translation failed: da = 0x1f48 len = 0x1fcb0
> remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
> remoteproc remoteproc0: Failed to load program segments: -22
> remoteproc remoteproc0: Boot failed: -22
> 
> This approach is the same as commit 8749919defb8 ("remoteproc:
> imx_rproc: Merge TCML/U").
> 
> Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
> Hi,
> 
> The ELF I tested had the following data section:
> 
> Memory region         Used Size  Region Size  %age Used
>     m_interrupts:         680 B         1 KB     66.41%
>           m_text:        6984 B       127 KB      5.37%
>           m_data:      130224 B       128 KB     99.35%
>          m_data2:          0 GB        16 MB      0.00%
> [100%] Built target hello_world_cm7.elf
> 
> Which triggered the error. After this patch, remoteproc was able to boot
> and work fine. Thanks!
> ---
>  drivers/remoteproc/imx_rproc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..bbf089ef48ee 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -166,8 +166,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
>  
>  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
>  	/* dev addr , sys addr  , size	    , flags */
> -	/* ITCM   */
> -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> +	/* D/ITCM */
> +	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN | ATT_IOMEM },
>  	/* OCRAM_S */
>  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
>  	/* OCRAM */
> @@ -180,8 +180,6 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
>  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
>  	/* DDR (Code) - alias */
>  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> -	/* DTCM */
> -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },

In commit 8749919defb8 "dev addr" and "sys addr" were both contiguous, but in
this patch "dev addr" is not.  How will this work with new kernel that use old
FW images?  Am I missing something?

Thanks,
Mathieu

>  	/* OCRAM_S - alias */
>  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
>  	/* OCRAM */
> -- 
> 2.39.5
> 

