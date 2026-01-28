Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFF6D46BFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 20:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfDqLnr78jrG2/XLP9Dn27y+jadR+KNn5dnX37UWvRM=; b=qG1F89F4TyI5mbJiQ6SVjMnRkM
	sxU2ghl7Bfan9UHCyt1gX9gXiJnprRSD++YChj+hvdVITSVxqOHu9V1pry9QtJvtpQWesNcM0TYHX
	gwLPyNiOV/DXJefV4i50wCpltnvnVbnD4CI5faMh0RnlmW8t9n2SwTrvgfrPZf6I32BM5BihaMUFj
	Kgr219S3O/dun6Fo25VsTQM7cBElLYJbp0EFZBc2e8W4JXfdbveAXwqMdYWVihThlCZLCZODlJ8z+
	b/X4VDB6vUltmUH6Dw+ny0qGo3RyRhjf2u1z54t2CfAylwtOsFma8upsOIiII0qf8ijJ8K2VZx4gv
	vX1vRLPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBlG-0000000GiQX-1H8M;
	Wed, 28 Jan 2026 20:03:34 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBlC-0000000GiPj-3IRn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 20:03:33 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43246af170aso169083f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 12:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769630609; x=1770235409; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xfDqLnr78jrG2/XLP9Dn27y+jadR+KNn5dnX37UWvRM=;
        b=ByuEcBaKGntCN0xk6Bbym2ufhLv2XuE48qaUcKAADBBY4M4oYdXV+hVJ6RQQIvTlkd
         bI996wCLyTxxcn2NIYKyFbLvFxeABemWi189ui0QOkPPwVEjjJAZa+93QKiHEZzIf3bx
         H0xOljUfIznepGVwuZ/m3kJKFMMKYUMggGuZKJjyjU8mkg2AYilrjyB11kRphPVMhBPT
         LJHezjjRyHc1Y3hyWcD852PUPlcnhLNdlyQXQdw5Ib8gCPVAGWAGmJXJZfgNiSZhsg1a
         SX+zCozynVs3G6efFd5Sto66v+H5xpuwWZPrwfwX2reKae+/8AgFpyUY1ffLo3eljhWO
         boLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769630609; x=1770235409;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfDqLnr78jrG2/XLP9Dn27y+jadR+KNn5dnX37UWvRM=;
        b=c2/F6suZVHPa9o80O7+s88atNO6Tj0cNYNKKKaTzetd4Kw5sVs8YeMSDD5rRUDTNUt
         nNJf+mcrx2wmazopgKQ0hn3DkahXLxNCkofh2nSR1g3gR2flaneNPYOK5eQeOJLQBsn3
         eLAaqpJZsZpx62FIMIaY0z7/vtKeAxtBletUy+CIZFIAh+oXKfG4s+8I+vN+Qd9lZDeI
         NWGoHm27zIqS0R51QbhOkUJRBumUJ70X5YkCSoSK3oCK1eEpt2/21jpozLCau8CZ5EJF
         3YUB77VbLNfNNSnLAE4LTWBib/61IbwldfirNU7xBBPBDsiUoQXxeMfEwO+O1/pYVlmV
         x01w==
X-Forwarded-Encrypted: i=1; AJvYcCV45cTxFdtBf6CLVWGOVJzIldrdkrl1p9ovb60xX4/o/1nATcOX3VTXSVQqaZFbU8zcTJLt4qsmjrARsPKrzewe@lists.infradead.org
X-Gm-Message-State: AOJu0YyWqNvLGNKHQgkH+4yJwyUXxNty0o5tiZOcPuQU863z70++fy3r
	UrWGGJWj9Lfq0pVI/8lydILuX+ywmDPrZJJnB+dI3SY3wjppPMoR0XvuLyMUbhKq+6w=
X-Gm-Gg: AZuq6aIGAKmCrRIuif+afJwrcV3ydaYZCL5OMitY5CtcggDbFKlNa5+TYFyqOGyXeY+
	GikoyxAQy8sEABaAL0rodE69TF4GeZkA3Ml8d0RqWiXfzXtTM5sdt7MWwlhyK6+9a9FKJp22de2
	khCDhVzeFOJNoY0clnwyLPRimtGeYcO43JQXPEy1j/5zFy7yaZDH6kvN/nt/C14zZua+kPU6vJb
	03eqtQaChdmS/HiRDLHSoPZMbYnPp1/8q0AwIp777jCnFNfeIjr8LXnMHNVuPl+lHHOA9G0FXxK
	YwW96mASehU7sOO9IZ4zM76pnBponxr5vbRf4gnxp5RHcBIBAC8yLf/VfVCScO5DrUHZyOS4NVM
	58Hw9vvtBFHdj5whYQxIyWEyZpL1Ypc6Mb5IP/OFJ37t3U/sEzvANptEdaEEf63U1OkpVoszxGk
	e4uhaeKxW0KNHjIGDPUoVzObI=
X-Received: by 2002:a05:6000:4011:b0:435:db9b:5885 with SMTP id ffacd0b85a97d-435ea0672c8mr948788f8f.10.1769630608753;
        Wed, 28 Jan 2026 12:03:28 -0800 (PST)
Received: from [192.168.235.30] ([80.233.75.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1322dc7sm9169904f8f.37.2026.01.28.12.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:03:28 -0800 (PST)
Message-ID: <e955868c06547ac62d34d594d45dd07aa19e361b.camel@linaro.org>
Subject: Re: [PATCH] phy: PHY_GOOGLE_USB should depend on ARCH_GOOGLE
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Vinod Koul
 <vkoul@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>, Peter
 Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Naveen Kumar <mnkumar@google.com>, Roy Luo	
 <royluo@google.com>, Joy Chakraborty <joychakr@google.com>, Arnd Bergmann	
 <arnd@arndb.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 28 Jan 2026 20:03:25 +0000
In-Reply-To: <0caa3c449b0c3d64944da3f1003d9389bdc13f98.1769541083.git.geert+renesas@glider.be>
References: <0caa3c449b0c3d64944da3f1003d9389bdc13f98.1769541083.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_120331_541868_4F6AE8B0 
X-CRM114-Status: GOOD (  17.13  )
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

Hi Geert,

On Tue, 2026-01-27 at 20:12 +0100, Geert Uytterhoeven wrote:
> The Google Tensor SoC USB PHY is only present on Google Tensor G5
> (Laguna) SoCs.=C2=A0 Hence add a dependency on ARCH_GOOGLE, to prevent as=
king
> the user about this driver when configuring a kernel without Google
> Tensor SoC support.
>=20
> Fixes: cbce66669c82ee9a ("phy: Add Google Tensor SoC USB PHY driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> ARCH_GOOGLE is not yet upstream, but that doesn't hurt.

I can see your point, and have no objection, but for context, Greg
had asked to not add dependencies on a config option that might or
might not get added in the future - ARCH_GOOGLE:

https://lore.kernel.org/all/2025121728-reliably-crabgrass-2601@gregkh/

Maybe an alternative would be to make it default=3Dn, and change that
default once ARCH_GOOGLE gets added?


Cheers,
Andre'

> ---
> =C2=A0drivers/phy/Kconfig | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 142e7b0ef2efb920..3ceda9a20d571038 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
> =C2=A0
> =C2=A0config PHY_GOOGLE_USB
> =C2=A0	tristate "Google Tensor SoC USB PHY driver"
> +	depends on ARCH_GOOGLE || COMPILE_TEST
> =C2=A0	select GENERIC_PHY
> =C2=A0	help
> =C2=A0	=C2=A0 Enable support for the USB PHY on Google Tensor SoCs, start=
ing with

