Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1E3C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 15:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lxairpgLiXIXVMdCgp5oBtZGa2taxpEkryecJUmNAE=; b=M05pD7ej/FvRDIR+Yek7snXJ2p
	6Ljjz24I1ZzFNl8GfHdStLirzx4MvSvtSYPHIIz+kkjxcOiUtJ5XyZtoMDlxBLKMkrbnQs2hsbGOg
	qluVJ1pzz8CafBkMMih1iw2z5nB8xyC01KUN/nIE0PoEtFew3Ym/8r65WYYryGfeWQCV4qFNjPaZO
	BAaK9DWbmKpUt3g40WSBFX3u90x3UQOukQU3rUisjBL/nWBkC6RepmaUPrp4y6amgTCUGucwUZjVM
	/x7JNtISUeAvde671c/mxEN3GlU78fF1gjEhuwCzrQTaGPry+d/hoqanGLb2/Z7h7ukc+UwtuRku8
	YxUlrEXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbb5-00000004DIM-2QvK;
	Thu, 27 Aug 2026 15:00:55 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbb3-00000004DI0-3EQy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 15:00:55 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6a5f91ae397so10977a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 08:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787842849; cv=none;
        d=google.com; s=arc-20260327;
        b=Xv+8R72QszaoU0AaoHliKaRGXOim/hXe+dojPWDzA49Mazr21bJy+o5N4AZKqBsA8o
         HsicGpDHWorWOrHbwi96fRrmkm42xBmRtzp210GsTs8xcXnW7LbHaa8VOk6cTFF0gafZ
         cjMJdqI/peit3iY78blW3NLg7FP87VM+DYH7xPN7jRmiLpEOihzcsT5VEWIyzRFw2Tz0
         MI21TSWr2hVSPzIysG041MXP8PS/5B+preqcUmK7+Z98BuzUvAKQVIxb2NsNoDH6TCZd
         bfba7OeFEwItru+MPvBG8lil3WRV4VcIJQdut8RhU+4npAdcMYdddPBBB8rHaHPkntUC
         v+Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9lxairpgLiXIXVMdCgp5oBtZGa2taxpEkryecJUmNAE=;
        fh=IuZ8+x+zfHGYe/2rMFGoscUd3z2Ht81FkxKB4OG/J4E=;
        b=X771kkzVR5eQZALHEXx5OzKb1PXy065MIf05qfDGBTR5IGnGAXW9qCnDd16zbqH4uI
         ImhlHpWYmSg/RF6tIy5kQpJNnW426DM30kzgBd4X7u2d36Q5ZVxtouaJaElUrewyT7bN
         5viuEWEpMmvglm6FbMukRmFKpnGT63XR9h3mzKHYNUT4GG5g8vys8awhpufn4Q3BWT7L
         TzF7sFNuCtHd3DaiDShwQQy6sH1kPIM+HBeUxqdW7wdTkiUS5gjo7D5IhR8A5E5kNtWZ
         ovkZx3EE4f5LAIXSKDcimAg5Jnntdpc2uv/HCWW1MFggvOk/tY56JpybMPWt4PeMfb92
         fiZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787842849; x=1788447649; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lxairpgLiXIXVMdCgp5oBtZGa2taxpEkryecJUmNAE=;
        b=fkEKV6Bp1ODuMuMWQqsLYny0aZ2dSetCFZoCbJjOYfF3WoLCNsSRpPsgiYpFn7Uk/J
         8fkqnbxoTBMVIBMS1/selIiMFkI7k0GuunCnIRNATyx3AebC/Ou0AtZ8qLhjndtdepp8
         ud3/DwEUBishpLIvZ2Bu8dagGDUdVdFNlMCUFLUAgdEBRJbdgiJg+gsZ24UqUNSGewiQ
         Ue00FJKqGvrSU3xqZ9+PUSHa+g8g6cVhohSSDzrAoYy4EnMaUuLd/duLWsSHNMrSqjiv
         psanRVm3yKp8495sTCYHtIGTbtQfmbCSz814bzNpaYRU39L/jkpr2mWMy+FsPks2YF+B
         kffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842849; x=1788447649;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9lxairpgLiXIXVMdCgp5oBtZGa2taxpEkryecJUmNAE=;
        b=X4/RhGBOy3rqyoiESb1VNYkrRFJsM5QwikMky+YH/VLm6BvnRJmvo3or6SPcSIzaBf
         d6Y91RGcyABRQZrqP/GTtqI4uFh/Ou7WN35eY5EKOpxE6MF5DjXebrylPhHlFVi1z+VE
         sOsa8LYBPlO+lpkR/Qy4Mt6ZD3lY5Ie06zLAGMuRmg+Itn0bc7OeEo3MtYlvnHOgO3XK
         dnqAnoy4YN+0a76QJAuKLuHvgUwoRFhkIHRiwBlzjDQgi2NKTzftYyHqiPBpUn8+UUx9
         MHwlPGHAGhdkR/UpRx0M30j+E6cmNWoKIFdwBP7OpGoDkTVcYo87x7SH8ehXfk3q/Uu+
         LAzw==
X-Forwarded-Encrypted: i=1; AHgh+RpVZo7bWUGuR7L+PwtGu6AskZv7Z3/LdKUYbqtq5maiy8k9ZWozYRdKxhgRLy7SKDfJrVyhvvy2q1aLzZsqxhEa@lists.infradead.org
X-Gm-Message-State: AFuF++lYjH4O1nt/zB5294cY1PyOBPRFR4kWoLxiV5A5lttoDFeToecp
	Y/sBHh5rdswp5VUEvS/3ET7eNYXeRiM1O9vEIKwsdjl5GDmbeyAs39XOPH+UqhI2DWOzJ8fgofd
	9AFaRKRnVw+E7xYr5gE1Q3PWI8YxtNN86Vnry++VB
X-Gm-Gg: AR+sD12BSjKYpNBVV+j3qO09es0kX0ndYMpv62z3+WeEGQamCMXVHH1NKUb4e0nIM7x
	VNonSpVFLcmGzuASSwXzY9/1dUXZ1UjQiujeYlZufBmlG+frpoXA/8vv2oDFkW61D7czt6Jjryn
	Ztb+AmSXcM71WfNv+elNPd7zh/1sqQSTP9wQI7Un4y5BbFyJChOJYL/M2rUoJWOTZAFWY3K6vhD
	iFnUJw+u+RBaWQ9hRG1R2PC7wGoBWz9ra3qua6mTtgioGw0jkW6iH3ajIBFJ8xM+E7FVT3Wox68
	g//uYS1CWsTreRFOCdQd8kL3Vw/+X0V3nt2zEu3AEwIMBg==
X-Received: by 2002:a05:6402:611:b0:67b:7d05:60b8 with SMTP id
 4fb4d7f45d1cf-6a5f5647937mr53711a12.10.1787842848394; Thu, 27 Aug 2026
 08:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260826134048.854748-1-larisa.grigore@oss.nxp.com> <20260826134048.854748-4-larisa.grigore@oss.nxp.com>
In-Reply-To: <20260826134048.854748-4-larisa.grigore@oss.nxp.com>
From: Stanley Jhu <stanleyjhu@google.com>
Date: Thu, 27 Aug 2026 23:00:07 +0800
X-Gm-Features: AcwNN1UTquEpZeWJV5own34vt8ybBkfXz7pYThlv5e4VIyfdz2_DSFDAfqeUnxs
Message-ID: <CAE14pddHBP6HMihTePR+-Pqhu2DKjVgRA9++5Epod6TOCLagFw@mail.gmail.com>
Subject: Re: [PATCH 03/10] ufs: host: Add common Hibern8 TX FSM polling helper
To: Larisa Grigore <larisa.grigore@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, 
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Ajay Neeli <ajay.neeli@amd.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Pedro Sousa <pedrom.sousa@synopsys.com>, clizzi@redhat.com, 
	aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_080053_865607_872F7C54 
X-CRM114-Status: GOOD (  14.47  )
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

On Wed, Aug 26, 2026 at 03:40:41PM +0200, Larisa Grigore wrote:
> [...]
> diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
> index c2dafb583cf5..034ee988924a 100644
> --- a/drivers/ufs/host/ufshcd-pltfrm.c
> +++ b/drivers/ufs/host/ufshcd-pltfrm.c
> @@ -563,6 +564,84 @@ void ufshcd_pltfrm_remove(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(ufshcd_pltfrm_remove);
>
> +/**
> + * ufshcd_check_hibern8 - Check if all TX lanes entered Hibern8 state
> + * @hba: host controller instance
> + * @num_lanes: number of TX lanes to check
> + * @timeout_ms: timeout in milliseconds for all lanes
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int ufshcd_check_hibern8(struct ufs_hba *hba, unsigned int num_lanes,
> +                      unsigned int timeout_ms)

Hi Larisa,

Thanks for the great cleanup!

Would you consider moving this helper to drivers/ufs/core/ufshcd.c and
renaming it to ufshcd_dme_check_tx_hibern8()?

Since ufshcd-pltfrm.c primarily handles platform device glue and DT parsing,
polling M-PHY states via DME commands would fit more naturally in the UFS
core. This also keeps layering clean and allows non-platform controllers to
reuse it.

Additionally, the ufshcd_dme_ prefix would align nicely with existing DME
conventions in ufshcd.c while avoiding potential confusion with
ufshcd_is_link_hibern8().

Thank you,
Stanley

