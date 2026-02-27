Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA47FD9E39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 03:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDbsVEKZhLBEvaXz/piLWHN8Be3D0IK5o5PnFyICBEw=; b=FxEUORdqCuPV8c5PvXk8jY8n4n
	nn0MRYzzZdcDlHZwiO+fKVsrYP4CEMAL6RFcCH4cXLIeWFfQNBZAr70IALa0cd2Vj46mmX0Gpgqtm
	B9Ex2SrIWvfnBQ/nMTwR0TggdhJJQM6E2DhJ+T+a6Gv5Xd0hvgAR9ktrEWl9ZYI5foUKXerz9QwtS
	+BtAtnRb8c1ur23UpQBPH3i4AvGpu5pryTGd38da3VI4m7JSciIevFkGruQj4Ygz4uh3OJ5GPj9v+
	JBP6Hnfgx727mxFwWFJmR+RNNXXkJv3v+AxH9uNT0l6CxvMsQ/LmvJY8kBTj9MhXcwI961zJCvp04
	dMpDcp0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvp01-00000007cUD-4Bdk;
	Fri, 27 Feb 2026 03:58:46 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvozy-00000007cTp-0SRY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 03:58:44 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-65c01595082so2647937a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 19:58:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772164720; cv=none;
        d=google.com; s=arc-20240605;
        b=Xt5+54y9FUrTe7/CVjultnUdIPnU8yItXphd0AG433TVto0UEBmvj+f2G26+i0Jw74
         nJICM1kt0WxTkhguu7OmOhcRf02FdB5hxQiJd2TN69itGXdtknPiKUy7p3TbzTtBh4hz
         0gjuzUcyIlxun7OD7BKmKqXzW3l/OJ4/6TmLX5lvMXR9Fl1tBkehksfvKGTZ75yfWBrc
         CDyyEYZ1DS73Nr0j+ihcZ54rA9X2xHcGicpPFkoZhQHb4w2sVBgEZzUOXXarln68HjTw
         VgDGXgfnoiMxefPfPDVciysjan5MBc3zIJ6kpjLBQbvys7itxChqpGZGAqJPbo2jFRli
         RF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UDbsVEKZhLBEvaXz/piLWHN8Be3D0IK5o5PnFyICBEw=;
        fh=nxAc3MBTiIr36fW8lo9+wevV3AqdZhKtnjY4c26D3iA=;
        b=QN4doCKb1rReiaxVKeRjaApb7Jn+dX7zS3+v/gJ6DQLzWXiMgujlt0LFJFPCoEem/H
         MrySKgizYSy7JIAbxHpkcaHVDzUPmfNob88XLmPtk2y2KW+ramfjSviGvZxcYtk2Ix11
         ooAo/bzSmGxuj3MuNFqwdsoxNwyZ3LH0wa+nLq7A+A05y0+8Rqn/OpdNqV8Ue/iXf8B6
         WLQjUYTzYUK2VSfkgS8t1AYjTctrw9smY9WTUEUmvS2wW3YTMOVnfmEE91ud5Tp7dMsC
         IIQdRVQBu6ccUyS5vn1rbOhJwc6VOa5K/EtukhhaTuzzKIKWI1M9nMZACmHUhRIicD+Y
         /q2w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772164720; x=1772769520; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UDbsVEKZhLBEvaXz/piLWHN8Be3D0IK5o5PnFyICBEw=;
        b=Ho/dgfDgbAxrlR6FtRZkCUYBLoHKjjiSU8wGMwo30HTeApbxsMPTAPmlReVm7SjVpb
         lHfqOBL0My4IAuuYBhKuujM9Qmv/raAUKs8KIaZ7yLsLiFlpclecZwRVZLv34MGV/EG9
         N0E5x3xZSezo0RBgteFLE+8plrFtxJKRKU0ycb8HZKgPeq8gXTgHV5MFISM3Bt+hJmAl
         spi/e/MxkYhnaKYnet7QDeUP43uBD9uyCi+Tq1fc8CqfmQybu5Wuvnw6i53wY4QuUp/2
         jp8xoquoRPumjT/2Ni7iCXZ2kr6mjq7cSElnluYfmTXOBH5FFHNShjiXoYx+VztKmBPe
         e20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772164720; x=1772769520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDbsVEKZhLBEvaXz/piLWHN8Be3D0IK5o5PnFyICBEw=;
        b=hBNJG61KJ0+zEDCyj5b+uXksBcPT6C17iN/yHa0EXfb8ReCm7scCC+wPjkOXhredcH
         jGnW5Hvsvnu3BfG0QyHeiKB81FbKf1fWPeWya9GJISPkuz1inOHoetrZmd+aplzS+6LB
         k1c5Q+kygTkzOE2MfxK61qGKqg1QC18qPnhsnp4827rxksAqXsz388O8YCIcAFNP7dab
         th/HtlgZxjv7fIpcEw0V8dg2WNUE2KUuYj7hRQp2qGcTrJMLg8p5ZgY+WaesNS8LmUdz
         RmGtZSXiolQ+x2T7eAOO9SH5pU6A9CQb+ruj3zucM1DPpmx/qlVmnHd+38oYXpanW1G1
         GuuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2sqt6Y7txfDXzcClszXc8LY2h667CeGRRqWwEBxEpIDQsNWHSGEoZZMT63hBsx2xCE+Ym42tlGBMVPKq0KjQd@lists.infradead.org
X-Gm-Message-State: AOJu0YyuO6ayfJwwF3F0rI8O0zx47FZ1XeOaEHKFTkIprogand0CKwwH
	U87OoBfuE1NJj/mxr5DrS5WTlPnW2KBmBDfNTW2eFv77n8Txwz/quO3EMpVP1YpdAFfCPkKdOox
	zKiRVHUNXPcwD2vJQBjtsB2H7294qrJo=
X-Gm-Gg: ATEYQzwxcKDSw43bx5nd2SjDhZ0zwXdT9hOsuBlT1ZVenvS5/L2ICEro8a2q21a64ek
	7OP4YcPfArzgpX/szMwJQK8oCfYTS1JzkB9DiXhgdP+dIJn28FlLCxNxQu7OwEFoqP5s+rUX5au
	eS9Vlt6BtZBu6UVFKc0ys9uzdrrN3cC4vdsVzrDtBAMxXLCYF19WvRpTBjvwvvNmyMb6Z2q0lXK
	Y0ysTXWfK7w/6tzCq9gCUdV2OWrL40IdItd9OTzOEpWs5Ki13fh635x8QgzFyTrGT9GFzgY+Ofm
	S3SmsZU=
X-Received: by 2002:a17:906:fe4d:b0:b86:e938:1b21 with SMTP id
 a640c23a62f3a-b93763b6903mr73471866b.23.1772164719886; Thu, 26 Feb 2026
 19:58:39 -0800 (PST)
MIME-Version: 1.0
References: <20260129022910.3942028-1-onlywig@gmail.com> <20260129022910.3942028-2-onlywig@gmail.com>
 <aXsdyzZEUaVzC34W@shlinux89> <CAPStFe7ASmYxJdDorJ0KAerfTH51ioZ=89F8fRcs6fBVqqhdUw@mail.gmail.com>
 <aZ4HrSNp32lbnVT-@lizhi-Precision-Tower-5810> <CAPStFe6sFCo2-+9ataPBy9pvEUo_uZ5G7XNA_8jH+sF6=FNOpw@mail.gmail.com>
 <aZ8SAvjCvTyLNi8P@lizhi-Precision-Tower-5810>
In-Reply-To: <aZ8SAvjCvTyLNi8P@lizhi-Precision-Tower-5810>
From: Wig Cheng <onlywig@gmail.com>
Date: Fri, 27 Feb 2026 11:58:27 +0800
X-Gm-Features: AaiRm51WYOya2X-nIX6UgHUWlRFoVIP5ReV9iuqHFak9xmEpTugEBlDhZEMDjhs
Message-ID: <CAPStFe76LVHBrx57_WETToziN+DJq3pz6gpPm7VBaLRjXoxfPg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] arm64: dts: freescale: add pixpaper display
 overlay for i.MX93 FRDM
To: Frank Li <Frank.li@nxp.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, shawnguo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zaq14760@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_195842_503321_70B0E717 
X-CRM114-Status: GOOD (  13.90  )
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

>
> On Wed, Feb 25, 2026 at 10:11:02PM +0800, Wig Cheng wrote:
> > >
> > > arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: display@0 (mayqueen,pixpaper): spi-max-frequency: 5000000 is greater than the maximum of 1000000
> > >         from schema $id: http://devicetree.org/schemas/display/mayqueen,pixpaper.yaml
> > >
> > > Does 1000000 work for spi-max-frequency? or need update binding doc?
> > >
> >
> > Both 1MHz and 5MHz work on i.MX93. I chose 5MHz for better refresh
> > performance, which is within the LPSPI3 controller's capabilities.
> > The 1MHz limit in the binding is a conservative generic value I think.
>
> Okay, let change to 1Mhz first. we will update it after updated binding
> doc.
>
> Frank

Hi Frank,
I've sent v5 with 1MHz as you suggested:
https://lore.kernel.org/all/20260226144819.3428730-2-onlywig@gmail.com/

Thanks for your help,

Wig

