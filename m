Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF291D34092
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 15:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eOuyosWnsXIdwMTE3mmiW0j22cD4OeLu7JqhilojCE=; b=AstmalQVbgiRj2Ram09fmCy+1N
	3b1w8/ddENDz2RiBKrRxihlUD/aq30bYCePHvujIzbt3CVADOo0hHDpU035QIoFSWwefNtAYVgMA0
	xLbMp5Hk127jE56nT2BpAolribfsbGl19f5U4peCAOuY8IMtT7UhliyWjEJ5L67SiXvkEG+5u8dOh
	mKpSNBuEj5AOoQgTfshsW1tM0nKizpc+Tb11okxIrw0k9owlyAlMZmG5tg41mqwnT6TDB1N623xSh
	7NE/mEkkX7M9VfT7cpw84ke08mpx4oLwnHYYpXdEcseH1b+hVYQsZnFrczYcZpAJMU+xBc2K6KevS
	M0uchj8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklHx-0000000EZkB-2f1o;
	Tue, 27 Jan 2026 15:47:33 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklHv-0000000EZjZ-0JsD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 15:47:32 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b8837152db5so872280566b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 07:47:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769528849; cv=none;
        d=google.com; s=arc-20240605;
        b=hZyRz9TpWJDYa9HzyPBg1lHNbaQn4sspJbayCc9ChGb/uI17RkBQPWjImygHq0PBhY
         2jSSd/EwTXYsNjFiNaUt3IxwDpDYb2n0FvjFJuydNd53BjJgE8zwKBTpG+qHJNilU9Cd
         JNLVzFN0bDfKx6MqaYyHgDnymnTLfl1RJy5pklZay8/rbLyI7qRouSO9818seSbcVU3k
         bq+MdXk610odU7fEAJ/TeaQs7bi5gzyLbD6lmjLEUAVIYlevOj7gCPh96sTVip6JrTAU
         hRSW7UPuCoUPpvduDUuAfa6Ef+F1rs9IrB6Fdu+1Ism44wZaK833L80U2yrYI19ty4Q5
         M3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7eOuyosWnsXIdwMTE3mmiW0j22cD4OeLu7JqhilojCE=;
        fh=wO/ohcQbF/ARDB1XoCL646Imu+jInbIAU+S048zrnXU=;
        b=Oxiru5BxHy201UjIXVSzBELzXZ+iScd24B2iqjJfYBXQ1siYCV0s88qXPcL97uuGg8
         ii+IwFJz6bJvZudSImOiYE3fsit8nihXCPTUlDNre7IZ3IqX42kLa3KAMjuvIEUStc5g
         8PFg2GF7ZRs9JGmQxujCVCVs41cQbgmphsyjr0Nu2IJrujHdyPN4IF1uWYlQxFphUMh0
         pALJoIuU6FDkniFo5lA8ekE4A3x67wLBrV18TpvC8hp1m9ACLhAR2Vc6YJDuDHbvgBa6
         0DcqLsGTzENy1uDt+VdnkimOZK8IyIS0P6AB4KKJ08YzOM+11Ug/B0pt/jVSC/MI2dai
         RKEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769528849; x=1770133649; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7eOuyosWnsXIdwMTE3mmiW0j22cD4OeLu7JqhilojCE=;
        b=hYM2hZTfTLq95kwjMaWoj3poU0Xc3BSun0unjjfgfewyw4IFSHEm+mZL38qG/DZ3uI
         QDr4APM4LZKWQHPxXVXzG/QySGcOaLSQqoBLdwto+8oYaH353Np7y5WGIqTlWz40C1+B
         L6OYYrJXf8ZyMtyCLBa0QAvxmNh6LJ0fcpWPSRPkzCi0fpCN6SR2dTu8zVhgzcSXa8Ck
         mhN4Y2vc1KzAMna4qXkOFa5IqPoDIDRQBxhUCKRforT9JjG+izDO281tJw9v47NtiYxe
         YKZKXEjs6liBDGy5S385H61ycwoJf9SeXAhkjoJbPzqO/cSMpZpZyFwghtgG/3z23lmK
         NXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769528849; x=1770133649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eOuyosWnsXIdwMTE3mmiW0j22cD4OeLu7JqhilojCE=;
        b=OyJb/OCtW6eIObUVVX7+zAnAo+7gfelPDy++I2aaCRPjGDP8YCUWIuMriFymMGmQRd
         FhO6/raoxbNt5ZrN6j8Lf/vGkSaD+zkxW4dlNPNMq6niDvGlBjOTIk3sXCHajYuz9R7F
         1Y5/abF4bgOxY5lh/dqrgpC+L1O2cCHxV4ppvvo1YPgCPwl67JK3EDjiPArNGVbTrsPg
         zWrsaKHoVUpwXXJ1+52wBMtwMWCQFnWqHO3QsfY3CsWKpdbTZEfDWogD7FXIhAwu2laT
         CjXsama2LmhgxRf2GeOaUt0vCOyeIrJhkXXZUMiXJx412DgWNzeEALO1DfHRdxHKebCH
         wQwA==
X-Forwarded-Encrypted: i=1; AJvYcCUE94qKbHN8/JNgh6TmaxiPXUai0nqR1th6smp+0Zjzx/kpgA98IYjJUA+jf7+bPUTdp7SOujoyfIefbaSwqB1D@lists.infradead.org
X-Gm-Message-State: AOJu0YzIBuVUxfTR3JgInd+0rTTsdDdfDHJAbnZDCRV9Xk2XtGikKq+9
	PihC3CrGOvaCAus+3sazg017o0Z+zejj/9rvcd+6PkjJGUtl4PP2JbokmXzAPb3d3FOPZJAA+uu
	bPVNzJCfP/AKGwY+yitfeM1K20KFxqxObSSmiz7vZCg==
X-Gm-Gg: AZuq6aIYWr150HnrnGI53kaCB/e6BgdRDCdJeQcsbG/kRco+a/7xl5ZcXaKwB0p24UO
	4RA33nMlm1NhFs/lrxooibIopWuRFlZ2yFclxkCU2Twcobw70K/3R6ZoOC4RfNMDkKJ44XNVkyr
	VqI2puZ8NXUJid35hPwnI6Tjztizenu/Ka8JMTm5/VRbcEw+cNtWs8Aa4rYzNLRx9vE8rb2/Pbl
	hCm3O1RwdcP+hg9jkj1uYyNqNYbVvmIejynidvKlwKAUktUlq3KE+bRkXIjUKOA2F9kfcjY6Y1a
	Cd5NWkJKaEAEPELRPgkuSX0kCKPTug==
X-Received: by 2002:a17:907:1b24:b0:b87:2cf8:f7b2 with SMTP id
 a640c23a62f3a-b8dab3e10c3mr158375566b.56.1769528848592; Tue, 27 Jan 2026
 07:47:28 -0800 (PST)
MIME-Version: 1.0
References: <20260127-imx-rproc-fix-v2-1-7288fcf74385@nxp.com>
In-Reply-To: <20260127-imx-rproc-fix-v2-1-7288fcf74385@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 27 Jan 2026 08:47:17 -0700
X-Gm-Features: AZwV_QjqQbFcKArui8POG1LTyVyFyhUaVHLmRHbU-P_6uXh9D3Ex2V3D86esp5E
Message-ID: <CANLsYkznMVh240wMUZGayJHRzsUV-NNTiU+ezpLt3rjcwSn5Wg@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Not report loaded resource
 table when none
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_074731_145247_7D6A04FA 
X-CRM114-Status: GOOD (  29.09  )
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

On Mon, 26 Jan 2026 at 23:51, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> priv->rsc_table is not NULL if the DT has a "rsc-table" entry, indicating
> that _if_ there is a resource table in memory, that's where it should be.
> Function imx_rproc_elf_find_loaded_rsc_table() is buggy so the narrative
> about a previously running FW with a valid resource table can be dropped.
>

(sigh)

You apparently did not understand my last comment.

> In this case rproc->table_ptr is NULL because the current firmware does
> not contain a resource table, but the remoteproc core still interprets the
> non-NULL return value as a loaded resource table and attempts to memcpy()
> from rproc->cached_table, leading to a NULL pointer dereference and kernel
> panic.
>
> Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table() when
> there is no cached resource table for the current firmware. This ensures
> that a loaded resource table is only reported when a valid table_ptr
> exists, which matches the remoteproc core expectations.
>
> This issue can be reproduced by:
>   1) start a firmware with a resource table
>   2) stop the remote processor
>   3) start a firmware without a resource table
>

Another sign you did not understand my last comment.

I had hopes of merging this patch but the changelog is too garbled to
be salvageable.  I suggest you ask Daniel or Iuliana for help.

> With this change, starting a firmware without a resource table no longer
> causes kernel dump.
>
> Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook for find_loaded_rsc_table")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - Per Mathieu, Check rproc->table_ptr, update commit log
> - Include R-b from Frank
> - Link to v1: https://lore.kernel.org/r/20260122-imx-rproc-fix-v1-1-36cc64369a40@nxp.com
> ---
>  drivers/remoteproc/imx_rproc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 375de79168a1c8d11b87ac1bd63774a3feac106d..f5f916d6790519360f446f063e09d018c5654953 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>  {
>         struct imx_rproc *priv = rproc->priv;
>
> +       /* No resource table in the firmware */
> +       if (!rproc->table_ptr)
> +               return NULL;
> +
>         if (priv->rsc_table)
>                 return (struct resource_table *)priv->rsc_table;
>
>
> ---
> base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> change-id: 20260122-imx-rproc-fix-e206f8e6e477
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>

