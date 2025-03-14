Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0842C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 20:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVE/X+1dvBgKywWxxHtjJI1otue6/+H9v0hJ6Relc5w=; b=i6s0q+IERxzZtJ8xWvfSk2Ajg5
	Ztd3Ngnemsom6tiYfg6ZMrMJ1OP+eZe5SkODImcaxhfmPxue8neOMA/vDRsTRv+iaACbLaxGf5ZkK
	5cpzeRUlZXpNH3mAoHM0m4nM4HWvn+r0V2aBDM7pXXHzbdrejaSUP1iaEMU8gXWnC4L536P/bLkIq
	t9RdbjLAVya0XarZl2bNLaxcqunAGst4It3O66gfWJWzIcz3Mmm4U2ise/5j021rkN83Zv3EOE0/B
	Zug9WhcRHQXB/OeMM6d6Nowcfd4BXF65f/g4HsPUt/j8/ukjaouZQPfbdz5enIr2J2uktKjrFxDM8
	3Wu/yDwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttBVo-0000000FDyG-1do1;
	Fri, 14 Mar 2025 20:20:08 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttBU8-0000000FDn3-11AX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 20:18:25 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-224171d6826so62515965ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 13:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741983503; x=1742588303; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kVE/X+1dvBgKywWxxHtjJI1otue6/+H9v0hJ6Relc5w=;
        b=qfQU7WN6kJcYX55aFFXBsGp7fT3LE80SWeHhs6CSIZ8JOKlJ2YtAKqfj/hJplx/TbR
         mg6FEMooX0x3pZcWTvoFW1JhZEQ7ti+eG4yFf0LkK+bdL2q1bGvNQqffY2fJ5NuEdeAs
         UFOu/fnc/ou4x/r+FLqBYPjhVWBQDO2RAywUVz1PyZ6WFGv7xy+mDbJYfkxvivfZKAP/
         EdMNEnvWE5Dk3BzE2qPmzCvqK2a90rEqJsk70i0F/DFARDGAihf/26sIlJt/fWgBOd5/
         E/QdyVVN1DfNc6iItejVdnU4zDEWPDDIZfAg45Z8ODWJcYNiH784xpZ9uVSl9QRPIvD9
         trJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741983503; x=1742588303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVE/X+1dvBgKywWxxHtjJI1otue6/+H9v0hJ6Relc5w=;
        b=s8iSOi8mqpx4S15GmlbXB6yfFPS0vBWwhlo7WyMx4w7SoQWKIowpY9mO68hPNQOvZf
         tz5oDwQHsfJO7Ej+FbfVQFubHMsVbdzAVrQ34hux+QgesSk3ehAlON6NMt+kNHHIe7Zl
         0WmV9rTc4LF2KfImRbE/u8BH7I40fFy1bTpu7yOqzv33MW2pgF0wPw2V6talZ8kfIKzx
         SX5yWKAmZcxaVjSWT1EGUacGhmascWbcRs6U+NTK9vPcnI6fUx/oiec1wZBcCvgxQzxb
         c2dDWGA4BOqeBE0rj9SaCrzlWaWNpgFoOrNHWH8McemW2K0G+iArm8GgQIvxCojYNF0n
         jpzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwhC8NfeqUo+Y1FeYzJceyUVmBQUjQTKZ628XgSoatRalUK0e9OAmDy8N0jnjO5+7iThr4Lq6Sl5/mq9JgZrrD@lists.infradead.org
X-Gm-Message-State: AOJu0YxIL27fZFEeLp2uvUkl2xHuEopN0C43kDZuZmS3ve9eRlQTpPEf
	vDRNTdpGeYbaYryXGqnY6++lUyFWAS7xiU254Ta6RAvVD22YyO+W3xI86zFC7DE=
X-Gm-Gg: ASbGncvHE/CWnbFTqc6YDjzJ3BRydaa7kj/beA/uEGpxQeNnkqZ5GCOkZZiF+Uo5LsI
	guzWDns+YgK2kjKLZOdT+BX0SYGgoH/cnaVyYoP/M2mLdEQNw9e1ueUJSsoL0Et07cSV0pFRmzA
	srKxVc2Zj4EiW4CrJzvzs9hvF1aF1hPBaoh3bnMnaUY1/f9VXuRDtUNfkP7xLDMlSuAvyg8bZ4G
	rxS8hLfQUTKyMNqVvdlqMV0wjaCGV7fpU9QFx2tHa8/JQuN0fc3UWgJ3nXKzgbqzmKmKRMS0Vwp
	3sNdN3rHcwd7LPPaqilQjY3WK3Og8q/K1niwTU5AxriA6Dk=
X-Google-Smtp-Source: AGHT+IHXBdYKz+0nlSrPK7TcM2iKiILeG/wu7hs+o6yF94fn14To6hkfN4AHSD2DhQ5uyimEFEKDcQ==
X-Received: by 2002:a17:902:e843:b0:224:1acc:14db with SMTP id d9443c01a7336-225e0ac3830mr51638205ad.29.1741983502703;
        Fri, 14 Mar 2025 13:18:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:edf2:f43:33df:904c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd5a7dsm32535845ad.251.2025.03.14.13.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 13:18:22 -0700 (PDT)
Date: Fri, 14 Mar 2025 14:18:19 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, Frank.Li@nxp.com,
	p.zabel@pengutronix.de, peng.fan@nxp.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: Document run_stall struct
 member
Message-ID: <Z9SPC1Rl28NKjFTV@p14s>
References: <20250314151720.1793719-1-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314151720.1793719-1-daniel.baluta@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_131824_286676_95B4E946 
X-CRM114-Status: GOOD (  16.61  )
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

On Fri, Mar 14, 2025 at 05:17:19PM +0200, Daniel Baluta wrote:
> Add documentation for 'run_stall' imx_dsp_rproc struct member.
> This also fixes the following warning:
> 
> warning: Function parameter or struct member 'run_stall'
> not described in 'imx_dsp_rproc'
> 
> Fixes: 0184b4fdbad1 ("imx_dsp_rproc: Use reset controller API to control the DSP")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503142125.IE33sCto-lkp@intel.com/
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 1 +
>  1 file changed, 1 insertion(+)
>

Applied.

> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index bc60edcdd661..90cb1fc13e71 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -96,6 +96,7 @@ enum imx_dsp_rp_mbox_messages {
>  /**
>   * struct imx_dsp_rproc - DSP remote processor state
>   * @regmap: regmap handler
> + * @run_stall: reset control handle used for Run/Stall operation
>   * @rproc: rproc handler
>   * @dsp_dcfg: device configuration pointer
>   * @clks: clocks needed by this device
> -- 
> 2.43.0
> 

