Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D748DD1359F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDLQY3qQ6e13iwTfkGPYuIXPQSA/x/amsdqW39bGlDw=; b=zYhG4skoYLaxoO/+xoqr0f/hjk
	DzuZKjy0x8l1NjCJyWu+W7GfLLJ1XGotEr09ZKrtqjD60V4i4Z/OwNyDEx/q+nAydwT41Ggy1jrVq
	SPAe8VX154+XRliZpFJG6WQDGcSG9wd0IdG5R8n8KNCQcIx/WqmMFsJwfOQ6VGzN4ACsTBRpRSnz5
	4nND+xZGLpy5yRGdx4By+kqs/NwffX/FsW05iHKc0QkO6dee5kVGD6M7YiTWXcBBU5VtHUiH1tN5R
	cWMurcI0VxJlbkXh+rUOle+P5Sm5O8RZBpwuWjZLWaKZixs/iPb28465fjIUWi08p9xgV77kDzTwl
	54BF44TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OyA-0000000AlvS-23b8;
	Mon, 28 Oct 2024 12:35:38 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OwY-0000000AlgT-1SHH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 12:33:59 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2fb561f273eso37477731fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 05:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730118836; x=1730723636; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDLQY3qQ6e13iwTfkGPYuIXPQSA/x/amsdqW39bGlDw=;
        b=P0m33zL+/9/QL9M62KQnMLeLeZfXo2jKN8e/adb7tsC4uqpiToUtapKikcwXeh6aAZ
         S6NAiqq2hCiiKAVyUESZZdcyycWyYOtwxdX1ezq5CwU3Q6pL0P+0syyl9c/zCQ1tvB3S
         9TK7e4sxU6dtRIDjEqH72xBRw2w6S00IE1UpGtxRq+mMo1ioysGBSz8kq22fvw1CImQP
         SM7nMplfPpcflSMSX4YuCqRZ3hLRJfYqZeu/VapEquL20Xakml13RHBPY7iQuty0U7Cm
         zs1czXaeDL/E9khoe1STXAocn2DZIgnrqspxVnb5abRQYUSU72ZjIVxMUMo1r/F6EGiA
         GWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730118836; x=1730723636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDLQY3qQ6e13iwTfkGPYuIXPQSA/x/amsdqW39bGlDw=;
        b=wi/HeK8rdZGw6zNIFIBMQK5kC25A87AyVsOqohOmGpkZdQ89QOxyDLK5WKgTHn/nvL
         5ThtNkGUW+QOgeW3XH88t+jss2DYW1mRt6CBYaa/pnfx9z29IgAPnAL7qTz7LHAQxavP
         FmplrdIk1KvK66RuSiQfOHCO+8t6vp6VosRbOd71kvq1G0Spio5fNVZIGZKqcXxC9dAv
         A0XsEv7ul/cOMCvkzJl/IB015uEE5w2Vl9iB3ekMw1LAQj/8g3yeKMf+FBWHi0qIEwzX
         XKEB+SHkaxphs2M2sk9rvlcJovtzt+opmzxuDYPIopPHoBbaHKXYbPx7UW+QtLaGfYyJ
         b7BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr/2VwCPiQm6td9JvG02gonzOvxWAEMJzWwGpSEDXJKSB+PqDUuUtcJzfoX+QU4mjHrntn1jFcGWz0nXQ5/G9I@lists.infradead.org
X-Gm-Message-State: AOJu0YxLXUTmWU3nhx73W66GkrE0SLT3t58X4La5X/tUs/Iroco6rtBK
	bI8sT0D8Osf9rJcyr8goAZGuTP5E6bYEl3nICrCRHt7sjaCQRKUZolFJNV+NG/yD5DdU7GM2hS0
	jhY7WvanYfm6YSU4ujVOo5g/E/o4=
X-Google-Smtp-Source: AGHT+IHZj/V8KLGee6BNlI6LrtJfPAxAxG9OQGWFq92wsn4uuuFerhAkdyRsDdmrgpr6My5eZvNh+rg/W6QZpCi0EqE=
X-Received: by 2002:a05:651c:222a:b0:2fc:9759:4e3d with SMTP id
 38308e7fff4ca-2fcbdfc57bdmr30593791fa.19.1730118835677; Mon, 28 Oct 2024
 05:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241027225408.195475-1-gilles.talis@gmail.com>
In-Reply-To: <20241027225408.195475-1-gilles.talis@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 28 Oct 2024 09:33:44 -0300
Message-ID: <CAOMZO5CR0=Vqd6v=N=Ymtsfw5F1M54tEYACpzk1HcMcP3tgAHA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-navqp: Add HDMI support
To: Gilles Talis <gilles.talis@gmail.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	shawnguo@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_053358_404674_B17C4A80 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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

Hi Gilles,

On Sun, Oct 27, 2024 at 7:57=E2=80=AFPM Gilles Talis <gilles.talis@gmail.co=
m> wrote:
>
> The HDMI connector on the board is a micro-HDMI (type "d")
>
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

