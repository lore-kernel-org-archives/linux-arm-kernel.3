Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43254C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 23:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcMIWFES6oqAmi3k3/qne93pIx7ZR4rKJz2Nj99pEyU=; b=fb4eEkzoAvbKdaKjpVOjaxYr4d
	zsR8hvLyZjKflZ6nWstFSgQ6dN4Jiu0hH5WUOG6ye/OpblWbNy9AjBwW0n0qrSUBlMNoaCNOfdxFC
	G/97kmLLcu1BQYejEoNMA0NVgxkk9QiDrt9JXvmClthCkIFKr2gZfB2pnVZgrNlrb/Sr0KgecM6gc
	4ECSLa9G6dCcyyCBWBTJKsL9K55/7Xsl3+QaTJAoAY9oBl5jCc16C1INmInNfZkLLFlg8CPfimaST
	6Sm5K4leT4bselCjYdCYvA59F1mHNvBwwx/k3faCjAcz5bnpMbjNYQKxFCwG079oFr++Ix4G7ebbE
	dOE+ORMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWNbr-00000003fMy-45cL;
	Mon, 30 Jun 2025 23:08:23 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWNXR-00000003f37-144P;
	Mon, 30 Jun 2025 23:03:50 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b170c99aa49so4062072a12.1;
        Mon, 30 Jun 2025 16:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751324628; x=1751929428; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DcMIWFES6oqAmi3k3/qne93pIx7ZR4rKJz2Nj99pEyU=;
        b=PEtnGMcn66rLC44aATdv3ayJMiTerrXRVwVRnj1N4EEM9Kdzc0T379TF1ryvojTfe7
         NOhCDQhYXnQeVAoKXhfBDhZjYSToIldCJpj5fUza7u0pHT5FUBRcNIxLwaJ6ip7jyr5q
         ZN4RnSmc65YYnO5h9hjTkduurW7u1jKLY70YWwGDBG+WQ/96Wo7s7VwWgBp+cJF7eWxr
         9sSnC20pvKxeHQgLMRpYKZNjPIHvD2HWFzTMV1JWAq6B+A+SAxfH6V89NYHHhVWKJNuS
         fJi6nXv1Uor7bUuMfkbgJbbLmeX1sp0VEX7LuNz1MlastxD3TJEk5C3i+zCbp6e5THCj
         YuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751324628; x=1751929428;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DcMIWFES6oqAmi3k3/qne93pIx7ZR4rKJz2Nj99pEyU=;
        b=vYSafn+01NUvvzuyxb/CwnaB1shiAjdpZsF6s+DmUnHPZC1S6J2omj4bO7ZJlUGCv6
         nd617hTQlGJTjP/xGkdyuvXzs3sA5BcGT8WLjgD1I5mpPOwFtGUYLJGKBfJgWnlfF5LS
         Zxa/umtR/ntZf094Y47Gvh4hBS9TUYyIrpIvUbt61yoG6wl6dKRTmj56oZHvK3DLsROA
         to49WUM7vagSFogwi6tWvgcjCZYlUy8NUR+IvOvvJOALPxglet1QPgU3ADbJweWrjuR7
         MUG39yeqU0DQ50AFX+jfeAVxMQ+8iFifF1+mBpMt34HH8u7xbQk3elm+tq3kh7LVjy3V
         jlOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/p+AhAMqf9GaogXcxBRBba4IvjEJswF53cOFh6ar1BUjte5aE3R942Q38wB2vBoESxrhvwplL4BKLuxq7euQ=@lists.infradead.org, AJvYcCVq1Ofs34TMKuuz9fMBuP+qfH9Ik8d4oeq5sNZ2TS2Ouuk6ix2WgWy1q7DnAtU3PCeGFNO6xzTv5dxNeD5fXTK7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5iRrMtR4mEm+qR1KyalycYqdowdXxK6A7vhdhSRW9xHyF/0Mh
	OUNEOibb1tZGBGM+zWXeIYXhNf7btNAhpJHZr9uAj+Baodw6lqlk45z4
X-Gm-Gg: ASbGncv+Xjsv0Qgn0LD3EJNxyV7wW/IUzwyspRomm1RYzsR8llZHpR7De2FODZEwYIy
	C+k5hNFDSTD0FTWfI6n+j5bH37OKrVN0khx0QoMpZNwB9orEmneCmHDmHaGmeSjpRCcTiCJiKOa
	fG1dF0ZQ3P2QGFhrU5cq5igq2kP27vLzmJsMch3hvfggsi9Woftd1Ffn2fbynPSHiak593/7YVM
	62Pf3UIiIJSsQXbks/qtdbvGVamn3rjsl3jCbSDQhJ6ctQ0NEa8NkNF7eg+SKZxkO5m19ey/YyN
	dsKZwBHvdYKC2nGBsthh9/SHBPlL+0UPtVOxvNyODWK3vonJvSVFAk1RXruzZw==
X-Google-Smtp-Source: AGHT+IHKbAQSwj+eXwJLDhBipfTSg+qZzjJ6I0tpy1EaDnqoZVZaoA25wQdULxKVIR4F7iCenLZ2Jw==
X-Received: by 2002:a17:90b:2c90:b0:312:ec3b:82c0 with SMTP id 98e67ed59e1d1-318c9314d79mr21601226a91.29.1751324628355;
        Mon, 30 Jun 2025 16:03:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a494237adsm214315a91.0.2025.06.30.16.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 16:03:48 -0700 (PDT)
Date: Mon, 30 Jun 2025 16:03:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Input: mtk-pmic-keys: Fix null pointer dereference when
 no compatible data
Message-ID: <yconjvlgrgqsiyclce426i2u4pqcheqxeqxa6fpduqrxtn7njb@jr4nvqvmad2k>
References: <20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com>
 <28111607-d5a2-4b54-964a-d010fb99193a@collabora.com>
 <d373gpdyqejppdysdbb4k6aat5i33epnqsebxdkjbrgfwsnqtm@43si4kmjvsmq>
 <48f573941d64217240f4750534e17faf4af0e3f6.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48f573941d64217240f4750534e17faf4af0e3f6.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_160349_295816_5738F7CB 
X-CRM114-Status: GOOD (  23.66  )
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

On Mon, Jun 30, 2025 at 03:59:46PM -0400, Nícolas F. R. A. Prado wrote:
> On Mon, 2025-06-30 at 08:25 -0700, Dmitry Torokhov wrote:
> > On Mon, Jun 30, 2025 at 04:06:53PM +0200, AngeloGioacchino Del Regno
> > wrote:
> > > Il 30/06/25 16:03, Louis-Alexis Eyraud ha scritto:
> > 
> > [... snip ...]
> > 
> > > > @@ -316,6 +316,9 @@ static int mtk_pmic_keys_probe(struct
> > > > platform_device *pdev)
> > > >         const struct of_device_id *of_id =
> > > >                 of_match_device(of_mtk_pmic_keys_match_tbl,
> > > > &pdev->dev);
> > > > +       if (!of_id)
> > > > +               return -EINVAL;
> > > 
> > > Please, change this to `return -ENODEV;`
> > 
> > No, this definitely should not be a "silent" error because it
> > indicates
> > there is something wrong with the kernel.
> > 
> > Stepping back, why do we even enter mtk_pmic_keys_probe() if there is
> > not a matching OF ID? Are there any other patches that are not
> > upstream?
> 
> I'm guessing it's because the driver can be probed by a parent MFD
> driver, drivers/mfd/mt6397-core.c, and the compatibles defined in the
> MFD don't necessarily match the ones in the pmic-keys driver, for
> instance 'mediatek,mt6359-keys' is only listed in the MFD. Adding the
> missing compatibles to the pmic-keys driver should fix this.

I think if we stop using the generic "mtk-pmic-keys" in MFD core it
should solve the issue. I just sent out a patch...

Thanks.

-- 
Dmitry

