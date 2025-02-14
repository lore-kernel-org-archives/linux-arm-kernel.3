Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CC2C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vud2l+W++O1Da7DS2WaNrJ9AJreXoCTXE/UW9zsHPAo=; b=sYxO+EVMl45qjhTOCbEHfLO/+8
	ezLEMcyQ2lktsc7EZTo2+1R1IyDsWgEi1uNc2ryfaqwrPGR7h5eSxpGd5cZ/zQgrJBd3LziyVNQNy
	IIB9/BpfSO/zWv77Mg9UW6SeNlKsWJb+1gC0a3ONvaDVkWNQhK+S/iuIsO71YBq2O9JYPba/159lT
	yyyH/KUXjR0urL5Kc5aWG++DbbTBRVmhyvGE4z9L6yRPHcIyXBp450XlsoaUJFHxbEL2ucdQO7MoQ
	ySQtO5x5cYsOCvRHjyGsLPADI1U691uahqS/AuNpl1p9g44NZTG6ip/ynh5XuQe3D5VZ/z6DXMfTQ
	boj2v1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixfD-0000000FKa5-2Qv8;
	Fri, 14 Feb 2025 15:31:35 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixSv-0000000FHak-3ezL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 15:18:55 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e46ac799015so1622987276.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 07:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739546333; x=1740151133; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vud2l+W++O1Da7DS2WaNrJ9AJreXoCTXE/UW9zsHPAo=;
        b=Hgws/bpgbMZSUYLZd4ITElPFQg0+GiO8kkat59+2w07C7mzZ9nfi+L4jjAf76E0lAP
         qeULKaRCJFjFJLR1MQ/ioAEJi77s97Ig1Q5cz890DNWQEn+qp6guRLLjGFvKz27vRBu+
         b+cwc7dVwaSvJ4mj9N1fc1fmCavBU2CsAjV5seIiGsiaCf4sabWj4q4DvJQb/AisCbGz
         WCbDj/HuNkAuTOSGT4X6hg0FsJeWJLnj3wDAkUA2C3gd5+x4VIj3zRv0/BcMQRSszi1R
         YUNdP6umhbA2slPTuI/NfjAuNCgKiCMZtt3cA1G0z3JK3qF0fEJ3QkiyVZdacFQBAkA1
         yfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546333; x=1740151133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vud2l+W++O1Da7DS2WaNrJ9AJreXoCTXE/UW9zsHPAo=;
        b=ca8JGfQpIfBlAEETnMfoBmPcXxMxG3RWCaGNueEQ9U7tGKWP7Dl+QcSLc/nX7laA/f
         BUla8MszaqAQCPljrn8ZCcnk+1J9q0GzHxjHEk1+mQPRypd3Ha5EnQrGPTNv0UStq/wr
         DaO7S/scOwhsaRX5SkMuwHBNAlRmXhDTRILFjQqNMMadWM8JnP+Jcic+vVxQaiXDajUL
         gt2yXbJfdMrpsGzmm4MYztiL0SwVr7nxZ+3y/ACHPY/6LBdoZICedmzTpfnb72qHZ7GR
         VX4CpUm7vrX45EIbv5TW6Hkp6QDlpVQPyq2pAm+E/xdMUVfSvvEz/iRdcWyR+9o7HLIE
         wcWw==
X-Forwarded-Encrypted: i=1; AJvYcCUeieJ1xRHiHL9eBUnqYvP9/YD8mVUPEl0jWbesabPPiWikf05e74Ppr8DM6bNsqXXF+na0D9uT0k2L8UJzqyZ6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw257AgNYAY6YjUpBTq0YSQP71Zy27FXfCf5FLFhQsUNhokwjtV
	8pXubgGn/JsZ+A6N5VNQGBaUlDUOi89uE1VHdH37r5dj7YMkcqRTOk9eSXhLQIPw5fb3/T8k78w
	UcWYjJIRidObB+O5Qw3i0CVjFimcJu47QJgdAWw==
X-Gm-Gg: ASbGncsWL6HbJSUvrcvAPcI+VHU6A1pPsWx9URp1EDjvl2sgLr3/zaSMWSLnZN50Gth
	YgzfOSyAwXyS6Ah7kyrijKP6ki2G74d0AYuWqOW9vNPWiSnlJquu1s3FdsmivDKTP0lqh06oe6v
	x+uLlNuMu0EBj/HdyGrVs9pPCUXtGzlkA=
X-Google-Smtp-Source: AGHT+IHBLi+DSdWwdkBiZJtFZDCRKWBo+hYt3CPdJ1MsUWNFmP3OHtc7puT3fPX9/BKcGYQszQlVBW84g9IFUoqX2jg=
X-Received: by 2002:a05:6902:10c8:b0:e58:4a5:2ca8 with SMTP id
 3f1490d57ef6-e5d9f17a12dmr10834168276.37.1739546332754; Fri, 14 Feb 2025
 07:18:52 -0800 (PST)
MIME-Version: 1.0
References: <20250213204044.660-1-wachiturroxd150@gmail.com>
 <20250213204044.660-3-wachiturroxd150@gmail.com> <CAPLW+4nJVf0raJ-O3u6uUteBi--N5xGwvzXp7cHqbkdMJ8gCSQ@mail.gmail.com>
 <cf0a5ab5-265f-4429-8c11-8b669f00bc70@linaro.org>
In-Reply-To: <cf0a5ab5-265f-4429-8c11-8b669f00bc70@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 14 Feb 2025 09:18:42 -0600
X-Gm-Features: AWEUYZltiapjR3VtfT1WDOygMRkvnzikuCurH43pDPL6b-n2GaubYKFDPd37TJA
Message-ID: <CAPLW+4nYMShK=mgXcct0QFQa_bTLcdWdcCOKSToxgx8tWqTreg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: s3c64xx: add support exynos990-spi to new
 port config data
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>, andi.shyti@kernel.org, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, linux-spi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_071853_909026_FD1A4042 
X-CRM114-Status: GOOD (  25.08  )
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

On Fri, Feb 14, 2025 at 12:39=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linar=
o.org> wrote:
>
> Hi, Sam,
>
> On 2/14/25 12:08 AM, Sam Protsenko wrote:
> > On Thu, Feb 13, 2025 at 2:41=E2=80=AFPM Denzeel Oliva <wachiturroxd150@=
gmail.com> wrote:
> >>
> >> Exynos990 uses the same version of USI SPI (v2.1) as the GS101.
> >> Removed fifo_lvl_mask and rx_lvl_offset, and changed to the new data
> >> configuration port.
> >>
> >> The difference from other new port configuration data is that fifo_dep=
th
> >> is only specified in fifo-depth in DT.
> >>
> >
> > In the code below I can see this bit:
> >
> >     /* If not specified in DT, defaults to 64 */
> >     .fifo_depth     =3D 64,
> >
> > Is that intentional or is it some leftover that was meant to be
> > removed before the submission? From s3c64xx_spi_probe() it looks like
> > the "fifo-depth" DT property is ignored if .fifo_depth is set in the
> > port_config:
>
> fifo-depth in port config is intended for IPs where all their instances
> use the same FIFO depth. fifo-depth from DT is ignored because the
> compatible knows better than what developers may in DT in this case, it
> is intentional.
>
> >
> >     if (sdd->port_conf->fifo_depth)
> >         sdd->fifo_depth =3D sdd->port_conf->fifo_depth;
> >     else if (of_property_read_u32(pdev->dev.of_node, "fifo-depth",
> > &sdd->fifo_depth))
> >         sdd->fifo_depth =3D FIFO_DEPTH(sdd);
> >
> > Btw, wouldn't it be reasonable to flip this probe() code the other way
>
> No, please. IPs that have instances with different FIFO depths shall
> rely only on DT to specify their FIFO depths.
>

Fair enough. Does it mean the port_config.fifo_depth should be made
obsolete? Or it makes sense for older SoCs where FIFO depth is fixed,
or something like that?

> Cheers,
> ta

