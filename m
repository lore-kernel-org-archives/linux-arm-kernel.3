Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651D6C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZg7i9Gkt1p2UGCmQVCKIa0P9txKm7ecHDqIrA9B8RM=; b=jLArnwmKS6yOZ1Je0oyGY2DGs4
	YcCyk+ASrSRcbmwah+zd8pev2sqFd+xpeGSJEWPoUFtU2YlDnPwDk2r3CuT9QWkVZ/sV2GAkXtfTh
	a8Ok07yxZkB+OKpPu07oICNSAz1wfuVoAjFVTG4O6nYpWFM+BRYLxfKU3hyRNj/T0Txtk9ItigKZ1
	t2UAr9fD9mmr/UdOVSZjl1ZqyW6fdsdwSa/UVCOSHs+w5G0AlNtzpvrhCS0cvSbZ+RPab7ZyBLHEm
	dfQ5l6LQW8UjOP0/3Ft9lw51OH3H71bKxhFWpoEyiVOAiXG7FSyWYk2pkCJu+xSENZFw7NL51Hm19
	jX93QvWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSLd-0000000FSE0-1ogB;
	Thu, 16 Jan 2025 16:03:57 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSGQ-0000000FQ2i-1Dle
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 15:58:35 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e5787c3fcf8so1988564276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 07:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737043113; x=1737647913; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xZg7i9Gkt1p2UGCmQVCKIa0P9txKm7ecHDqIrA9B8RM=;
        b=NZfxiUCG6l+keIykCcRXAk8mp6U9cSn/oR4vOOOGIFFAOUsSDDtJaYwJo/un6Wg/vo
         Wl9dHY5SrovSbgU1VutEZIV5fIEZ3h9Jww2MEjfHHlairLCoD/R0+ljqH3DDje4TQx6K
         /z4w66RF4X+WoLUNAYqnhYMW/h7hACQqUFSf7jo/z25IXGPDvS33nkzUBSzk+UfFSVP9
         YNL9e2W7w+nXt/KczpoPtP1g1yo78OJJLXV4iES3wwJhplYDtT+SUvzplVyewu58BPg2
         9M3XawqxrLTjT+EtP7Ask23RZa7IShMwDWPjjo8so4Ox+GZB3lxSELVa+0AV5yZpqsUp
         BU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737043113; x=1737647913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZg7i9Gkt1p2UGCmQVCKIa0P9txKm7ecHDqIrA9B8RM=;
        b=b01EMYByIunrMH7RO7u0KqyEszRhuJ43WhmmgA3VfbEOIQQMFE/axHtkRZ3gXzsLCP
         gOp0V0jGoGhsha34v2KDAPbKsO9rRBDHLlmRz4WpjUuAWbuQpwOqtGLljd6z+FYHeu+0
         WVk1MlJuSDTXmMTgWAyUzjDA4HtSJS5p0N5FfX/a9yVOdloqmQZx8bFAVUHrrc9Yhvjh
         2oShoYPchaDrlu+euKHr3TZdeql2QQFcOBqQ/gCqoUB7St6MRCFrMjMRZVsZzT2EBMvd
         /MnwLRsELXlcfPBSCfr/q8XkJv2SwSgXY7jOvhxC+T12N7KBLzbsO57e2ne51Yelh5Do
         OrmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX1UWIg8FkXNE27NjykQq5NycJTKOKZBcuDbjSePFDcol46Q89XISJXY6OTAKWofJg3dZxmMReElHEGYgIAgnB@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8bCrWr/XkziC5S0cqUNGtaNQbPp/qyUC/i5abMvwnmvVIKlBx
	ya8xN6UUy78TJVWzADUdhUAY1AD5f5Tyvl1K7IBBEA8+brbaDxare/0P4avdcPLGkCeSyRu/50Z
	zB7i6Imyh3QZteIcRib2UHYIKfcQ9t/3P9yQp9A==
X-Gm-Gg: ASbGncvA84O/x1uOiFrbZlfH+ggWMpTihVKHG2NjkeCBt4Ws+wPQLum8Jv/AZvWHyce
	XGTj0m5kiy4pWurVqMG62fzhEyK+aIAdogrNJC3w=
X-Google-Smtp-Source: AGHT+IG1qVTRfq3rD5NuthhfaJDGZx9itjIkE76nEv6cFISZ83dbq/vsbg+foxsWE2MrG6pQrDxrf7Opr66/DdtZa/k=
X-Received: by 2002:a05:6902:161b:b0:e57:31f1:972e with SMTP id
 3f1490d57ef6-e5731f1a4b2mr20182789276.29.1737043112819; Thu, 16 Jan 2025
 07:58:32 -0800 (PST)
MIME-Version: 1.0
References: <20250115014118.4086729-1-xiaolei.wang@windriver.com>
In-Reply-To: <20250115014118.4086729-1-xiaolei.wang@windriver.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 16 Jan 2025 16:57:56 +0100
X-Gm-Features: AbW1kvYIxEEhaAOaS13it3QYjlHMEzrYgUS_q1Twane_cAE7ZLMDO-j-7TvLw_Y
Message-ID: <CAPDyKFrpwPLjk+fzAC+1=z5rWJ0UiSTndbq2hET64KDcwsNzKw@mail.gmail.com>
Subject: Re: [PATCH v3] pmdomain: imx8mp-blk-ctrl: add missing loop break condition
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, Frank.Li@nxp.com, ping.bai@nxp.com, 
	l.stach@pengutronix.de, marex@denx.de, aford173@gmail.com, 
	linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_075834_327126_C132C64D 
X-CRM114-Status: GOOD (  17.03  )
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

On Wed, 15 Jan 2025 at 02:41, Xiaolei Wang <xiaolei.wang@windriver.com> wrote:
>
> Currently imx8mp_blk_ctrl_remove() will continue the for loop
> until an out-of-bounds exception occurs.
>
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : dev_pm_domain_detach+0x8/0x48
> lr : imx8mp_blk_ctrl_shutdown+0x58/0x90
> sp : ffffffc084f8bbf0
> x29: ffffffc084f8bbf0 x28: ffffff80daf32ac0 x27: 0000000000000000
> x26: ffffffc081658d78 x25: 0000000000000001 x24: ffffffc08201b028
> x23: ffffff80d0db9490 x22: ffffffc082340a78 x21: 00000000000005b0
> x20: ffffff80d19bc180 x19: 000000000000000a x18: ffffffffffffffff
> x17: ffffffc080a39e08 x16: ffffffc080a39c98 x15: 4f435f464f006c72
> x14: 0000000000000004 x13: ffffff80d0172110 x12: 0000000000000000
> x11: ffffff80d0537740 x10: ffffff80d05376c0 x9 : ffffffc0808ed2d8
> x8 : ffffffc084f8bab0 x7 : 0000000000000000 x6 : 0000000000000000
> x5 : ffffff80d19b9420 x4 : fffffffe03466e60 x3 : 0000000080800077
> x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000000000000
> Call trace:
>  dev_pm_domain_detach+0x8/0x48
>  platform_shutdown+0x2c/0x48
>  device_shutdown+0x158/0x268
>  kernel_restart_prepare+0x40/0x58
>  kernel_kexec+0x58/0xe8
>  __do_sys_reboot+0x198/0x258
>  __arm64_sys_reboot+0x2c/0x40
>  invoke_syscall+0x5c/0x138
>  el0_svc_common.constprop.0+0x48/0xf0
>  do_el0_svc+0x24/0x38
>  el0_svc+0x38/0xc8
>  el0t_64_sync_handler+0x120/0x130
>  el0t_64_sync+0x190/0x198
> Code: 8128c2d0 ffffffc0 aa1e03e9 d503201f
>
> Fixes: 556f5cf9568a ("soc: imx: add i.MX8MP HSIO blk-ctrl")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> v1:
>   https://patchwork.kernel.org/project/imx/patch/20250113045609.842243-1-xiaolei.wang@windriver.com/
>
> v2:
>   Update commit subject
>
> v3:
>   cc stable
>
>  drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> index e3a0f64c144c..3668fe66b22c 100644
> --- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> @@ -770,7 +770,7 @@ static void imx8mp_blk_ctrl_remove(struct platform_device *pdev)
>
>         of_genpd_del_provider(pdev->dev.of_node);
>
> -       for (i = 0; bc->onecell_data.num_domains; i++) {
> +       for (i = 0; i < bc->onecell_data.num_domains; i++) {
>                 struct imx8mp_blk_ctrl_domain *domain = &bc->domains[i];
>
>                 pm_genpd_remove(&domain->genpd);
> --
> 2.25.1
>

