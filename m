Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073DFD3E2C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 19:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kvSrQqqbLNQTUVRHoadSzM2dB0+MrpOREbt1fRDUeo=; b=Znp1oijlkwSI0KEdrQ9OeTJ9GP
	UkY0V3/2P6emxKgnFpk0gKvcALlUx+SdEsFolOu3C28SnyGErz5sYkcDZk3jN8vNwthuWhVYiKKB3
	4XWna0ZlxESLrdF+uOUPYP9QBtosTH8vlHH2MzcuPWjSiDcxxtFHe4wd9lbbr22WPY8fNYz7kvRsX
	1/mnb91R4YAme2ZcGYQS+ZAkKMPXdIqT76z0Wlyk6cX2YBoO7i/IMejfqPXBCoSvgGhT5iCddGVx0
	pXPPTV+60IVciUYNPLp4V3lSmX75qDbkbPpDmQufDbXLnbYhl+EDgPYPCmh5S6oh97MKcruKB3oXT
	J5jpjmOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Vkk-0000000C3Wi-3ww0;
	Mon, 28 Oct 2024 19:50:14 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Vj4-0000000C35c-0ZOb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 19:48:31 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so46622691fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 12:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730144908; x=1730749708; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kvSrQqqbLNQTUVRHoadSzM2dB0+MrpOREbt1fRDUeo=;
        b=YfUG7BmKOuM3VuYSsgeykRxYL03e0yik8231mX7Cn4z9fHZ7ino7zntw4B4VdjtHqy
         gXU6n654xXnSDy9EkfG7gZj0IVAjxUzXfAy8klmfMte8TW4V4d6GpvQ2RtiEg80SQM05
         Q5E3uH3jnxPCcFO03AeH5kU48AtyRQ8KHadb7yp+wLp1/wFSIIOFNQH3up4aRHWBYMVq
         SEr7O2+AJfitJiFbSID9yX1D3BHqpG131WEm7GiBHjaE41N1y0RnzjIpfH6Owm4c8/bo
         QgYHJ/74BAniyT/L0Rhts7ETbBeNf+TUc0LMNSmSZL9o1F6D5K39iHBG8lUnLbVwxwXc
         OHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730144908; x=1730749708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kvSrQqqbLNQTUVRHoadSzM2dB0+MrpOREbt1fRDUeo=;
        b=GLsJHEr42PQDeYlPHPYiIoBe4SxelJb28aJcqxdCfaJ7Ta+YOIWCX1EzyjmrK98etp
         lAYWw0FSOf10m9nv8vhw8ZtrNbyGKuSOq4R1jA80cTduiPHYqypNvBqhvHDK3VlWvkTe
         gteHl2I3xBUNMObWzhnwkM43GH7KBDYc7VJyPtWkL3+lzHWfnsFX5v0PWaSCxb4NPmK7
         v4UqwBjbxZfL3A5PatTPpSHOlOBVI18xvp2mzqNZJdO4qeAKZAria1Or56zSvR8ouU8J
         unf3H77VZA5prlsqZNhoMPNbvMRhRu30x7OuSMAFvjn4FbVWRF0Z7eiwXI+WCSpn4+Ed
         5xZw==
X-Forwarded-Encrypted: i=1; AJvYcCWW5AGBcCxoGIkw8Xmm6ubRsARBLZ9eYFdLn8DQRV2j7JcmZTm38Gp73i/g+rJHKjky43pI7aM4zct9SSHdccZp@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg8ABcI5avlOaw+VEi+bDQbsRE4bpgx8DOyvCSmiZVn8Z4tjzo
	K2bmy42Gj5KAGfTVmHJKTBSvAWksNkA4Wr/h7s+EC8VxMA4EV9vlrKizBbpE/TnBKdIGw/v7y0k
	HANBTM7pKKKs5lMXuQSgMO/sc2c0=
X-Google-Smtp-Source: AGHT+IELGhB95rG+9fE7ziAngeTj3KV9sBRB/cO1X2UqxH738DKa/nlaAv3YXumbQYQm4kl2IZm04mlWo9msT3Gf+zU=
X-Received: by 2002:a05:651c:2115:b0:2ef:2490:46fb with SMTP id
 38308e7fff4ca-2fcbe08973dmr38305511fa.37.1730144908053; Mon, 28 Oct 2024
 12:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241028180844.154349-1-festevam@gmail.com> <20241028180844.154349-2-festevam@gmail.com>
 <20241028194728.0655edd3@akair>
In-Reply-To: <20241028194728.0655edd3@akair>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 28 Oct 2024 16:48:16 -0300
Message-ID: <CAOMZO5APJM57_ixBiRFZSZex3AiawA=mtqMszdGezVoajaXYhA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx6sx: Remove fsl,imx6sx-lcdif fallback
To: Andreas Kemnade <andreas@kemnade.info>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_124830_198323_E2B83446 
X-CRM114-Status: GOOD (  10.87  )
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

Hi Andreas,

On Mon, Oct 28, 2024 at 3:47=E2=80=AFPM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:

> As the devicetree might also be used with other software (e.g. u-boot),
> this might break something.  So if u-boot (or any other software) does
> work with fsl,imx28-lcdif because it only uses a subset of features of
> fsl,imx6sx, it might be worth changing the binding instead.
>
> Same for Patch 1. But I cannot test that and do not have a strong
> opinion here.

U-Boot would not be broken after these series:

https://source.denx.de/u-boot/u-boot/-/blob/master/drivers/video/mxsfb.c?re=
f_type=3Dheads#L388

