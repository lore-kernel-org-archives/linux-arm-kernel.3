Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9284C369B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 07:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvzVunjooJkOd76fbmWLggolhiDrqhzGzGsPDBPnwNY=; b=Fj8LXa+GE0LQ7TEbDljqAUDN5D
	uqb4KOcIkwLef+2ZQOq8U8FPSzkOGlRFb8DCXFjOPiqDyO01ELAueFK2TpU6EbZlfiSzQ4j6loTk5
	zOrIwyqvEZDIQyPFeqk4RdxHcxi22OhxoAB0ZKevDfVwx+WDTkWwWdw1O/EVJuw5IPRzb5zrD9khw
	x8ZJdL1IfmbEmWJQCnJgJ+SKjL4TYHEhmVBGMOGoInuxF7RckcQDF0JZ/j3JmrhX+ipxHPNUKmSg+
	6HpNGjQoNkvNRi/1e8H4FsXDxYmCZf1hsdMof3+0u+sjgvK1Ma8VpaBSTuziiIh+zvtyfv1+T6p8t
	x81y4K0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4b8y-00000004tPo-0zyc;
	Tue, 15 Apr 2025 07:55:44 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4asa-00000004pm5-1cXs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 07:38:49 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-306b602d2ffso5446167a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 00:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744702727; x=1745307527; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvzVunjooJkOd76fbmWLggolhiDrqhzGzGsPDBPnwNY=;
        b=Eb46uR1TF/n29v6wl0QRbQSC7ckLjf87NM4udgc7c+dcZKCHLY2xiNFbR0tVjhhCgl
         o4EPZG9PdYm7P9FMEMglh8AEE24Br1oDO27gqFocsLid/ykej2XdEgOmt9EF6tt/t3LZ
         WgU4avT0fK5G7SLaafWnTVjHKw55Ua7QcVyYDMj7SfurMoqXGT/Ljw4hDrFX3au/MoaN
         xmh/54DU9iP3kQzuPCD2uvH7Os4VB39719BxVnQlwPqwO0JpUMT6ZEG1OGaZ9Ts4kZfd
         r8cmVY8lOgTCmO6ZIXJKMjjdCL2xJDRLUKOxfYnCVpzptXoL0SbagoM8QCw/VibHSTth
         rryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702727; x=1745307527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvzVunjooJkOd76fbmWLggolhiDrqhzGzGsPDBPnwNY=;
        b=fP7i0DCVJJCS65553QIIqQy/GAHhiXihESy2H8/rJVR9U9lwRMH0YKlFeE15Z4dSA6
         mvUGSmTmz+Ntv63FsSkTC/XaxUn8F35iZAsbdQMMYXY3f926HR2SVjCGu+AUCLzYUErx
         kHS0KVKgOBO6iB3nH9CWlY5uECRl4iX2otbV3hU3L/g/eq6CjH5bP1ELrjwlhilRvanJ
         eydlQ4sSdNVx1mJ6xWDPctrdQj4ql3d5o9Y2C1FVw2QtO1l/K7biRdapnkOrwMgSBKVg
         c+/zrVRwRCxFrRBg6QJwN7DKql4RyVPaM7vG5Ziof4TQn6mgjVJ7+N9zfIAs4x6DwYjG
         UHsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd+hW7IPyVxxXDLWAOVlRCZHQ8tdylYUoBw+Vz9H9UHAGQ6OuIUQY7LMuqnTOV037WR5M0K1U99benD64Gb6m5@lists.infradead.org
X-Gm-Message-State: AOJu0YxHBCySL2xcKWE4h1qlPUu2WvWM3i6JViTr0VDpUiMTXeSu6df2
	6wm7mB07j7Xi2EFFqsn8tFuQV8hqq/1Qv/K25ax5bEwGsoPVoTJmqOPkyC79MsOj/iCnkeaDVmz
	vvr0ShnMOGT5fRhVCQCke2xvlRAw=
X-Gm-Gg: ASbGncucsvMb/5VkVyH2hwL7vRM7sJo7jQfN9Jk1UGX+RTHJoh58ehS6dimeeNdgedu
	Ll4zJtOfygMMh5GjRveSBZt87/C7n09J1QuFcOJ/QHX9CmA0A47rFdrS5bqElaRkKdngvkLb0jm
	AvJOg+AKvZQPSCKQoKEg==
X-Google-Smtp-Source: AGHT+IEaQw1fMF+aLm6pFlRnZGVkYepFCANlU8kbPs9GBkc7bc76oOvq8qIgGhVqNudolyAIqZhr3iUCEwZKISUsLJM=
X-Received: by 2002:a17:90b:524f:b0:2ee:d024:e4fc with SMTP id
 98e67ed59e1d1-3082367f7b5mr25807985a91.33.1744702727316; Tue, 15 Apr 2025
 00:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250320121004.2542314-1-daniel.baluta@nxp.com>
In-Reply-To: <20250320121004.2542314-1-daniel.baluta@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 15 Apr 2025 10:40:32 +0300
X-Gm-Features: ATxdqUHIjcegsRqkaCNjdC-btbkENgkxvRanbyOKxKHVbD_D9EvsKEww42I_CYM
Message-ID: <CAEnQRZBFoZuiFJtzs0wCjrHJro3c=fWshRogNBnfGmkeyh-LtA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] Configure imx8mp dsp node for rproc usage
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, krzk+dt@kernel.org, conor+dt@kernel.org, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	frank.li@nxp.com, aisheng.dong@nxp.com, laurentiu.mihalcea@nxp.com, 
	shengjiu.wang@nxp.com, iuliana.prodan@nxp.com, a.fatoum@pengutronix.de, 
	mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_003848_426499_1C7B3061 
X-CRM114-Status: GOOD (  19.69  )
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

Hi Shawn,

Gentle ping.


On Thu, Mar 20, 2025 at 2:08=E2=80=AFPM Daniel Baluta <daniel.baluta@nxp.co=
m> wrote:
>
> DSP found in i.MX8MP SOC can be used by multiple frameworks in order to
> enable various applications:
>         - rproc/rpmsg framework, used to load for example Zephyr samples
>         - Sound Open Firmware, used to enable various audio processing
>           pipelines.
>
> Current dsp node was configured with SOF in mind but it doesn't work
> well with imx8mp-evk dts. SOF controls audio IPs from firmware side
> while imx8mp-evk.dts preffers to control audio IPs from Linux side.
>
> So, configure 'dsp' node to be used with rproc scenario and later will
> add a separate dts or an overlay to configure the node for SOF.
>
> This patch series configures and enables dsp node to be used with rproc.
>
> Changes since v6:
>         - addressed Alexander Stein comments
>         - enable mu2 separately in patch 5/5
>         - put "status" always as the last in node definition
>
> Changes since v5:
>        - do not enable mu2 node by default
>        - fix dt_bindings errors
>
> Changes since v4:
> (https://lore.kernel.org/linux-arm-kernel/Z6zGLn3B6SVXhTV1@lizhi-Precisio=
n-Tower-5810/T/)=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=
=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=
=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=
=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=
=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=
=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=
=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=
=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7
>        - after comments received on v4, we implemented the run/stall
>          bits using reset controller API (changes merged ->
> https://patchwork.kernel.org/project/linux-arm-kernel/cover/2025031108581=
2.1296243-1-daniel.baluta@nxp.com/)
>         - drop patches related to DSP run/stall/reset via syscon
>        - picked up patch related to using run_stall via reset
>          controller API.
>
>
> Daniel Baluta (5):
>   arm64: dts: imx8mp: Use resets property
>   arm64: dts: imx8mp: Add mu2 root clock
>   arm64: dts: imx8mp: Configure dsp node for rproc usage
>   arm64: dts: imx8mp: Add DSP clocks
>   arm64: dts: Enable DSP node for remoteproc usage
>
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 14 +++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 22 +++++++++++++-------
>  2 files changed, 29 insertions(+), 7 deletions(-)
>
> --
> 2.43.0
>

