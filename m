Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60C5FD0650
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 07:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOemrfvGiBCiGgnJ8CfsltCzoFMPUgEW3U050UEVSRY=; b=Wbtg7W3bS6orPHaMEMSTpl7fre
	qJi2nsY3OF6zK74thhhGAL0tVi3O8314g1NLPgeNslCFYCcJd/VH5nPeR+s9yugWEClPJMD54LsOI
	ti6vEKvZ2YtC5YLOXRAkgQ1O4b3WmpIAf89WyjbWl+qPTbKz54pzw0zhCVvCXC8kjCy5Wc8M4SxI5
	tY/JhDJDMEsn/R/mEeajepEZTjcYqHzmsYZOcKZKuH+dfhOn9q3fXac1pZMqKVX7yeDab4JKPZAZh
	eQgfAJfW2kLQgY3JreTNaxDzIsGkzGyDldP+zlXlwKyfWvDw8LY7n2hZH4tYsbZHmnNYJ2Wuo05J/
	sWgnvbVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ES8-0000000B6ON-1r9w;
	Wed, 11 Mar 2026 07:58:00 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ES5-0000000B6O0-48EV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 07:57:59 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1273349c56bso17238585c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 00:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773215877; cv=none;
        d=google.com; s=arc-20240605;
        b=EKF2qPvrgGio1LIoNAwH1dg1i0omBbb2PnbxFaZH19rW+vh1CfBtdNYe9jf5I8D6dt
         ms/ERZ16A9qo8R+GuwMckr3n5eVRU8NEf0/wEy1d57X9ZDd0/uUxaiE8X9h3v0DCGSyu
         Cj7PvxeJwN9Hhkv1hztFvCYTjr8Hv+Iw6tUGB0kw7ZnzG9YkAMT9P0vv+NDslqUYIhO1
         qtw9gEDEUr4Aa+GpEPufpl7lkZm7ogRCZcpBdheWCxPDP/zz98jGPTlkQwe404d4pnw+
         31aQxm9yRP6E0Ew+W+n016tQU2whmPKKK13LQwbwBg8TsZ9u+iSeknsVj+Y2LfJGTZq9
         i5pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KOemrfvGiBCiGgnJ8CfsltCzoFMPUgEW3U050UEVSRY=;
        fh=MAIbYpTGLpzEOyaXiIX6Avud7MjpKTTe5PnQGEC9KRk=;
        b=GQSjXF/RjjIiLE/OmQqnkFu8ekbpOCR7YUn8igYkaT5mnzACFJ2ESo/1UDPxsaKCCU
         TI9KYV9GA3f7nflfSLXTGYVKLmRRl9PhX3SLfznDXG1nMf4jzddFF/y7ObjyZ6XVR6vS
         84D3eTR29Ui9LFhZREqAIVLHB4iwLrFAelk0SZ7cgSzh5XjQ+4Ca98o7UcIdVSMXQ5aC
         bUBOMGE73CelckyQUQy9ERwPBOE2yOcDmSU2I1yqa52/UiP2Mes9GUCJc3HsbBat+Rsz
         s80f6kx9xpaPwSGNDVNa4fCe0XbNDkclg+YN5k9VmmmSZoQVhC9Ypq0hVxl4Xzk+wpJm
         szZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773215877; x=1773820677; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOemrfvGiBCiGgnJ8CfsltCzoFMPUgEW3U050UEVSRY=;
        b=BtuARh1v0P4nYIzWQDA8yllKaa4egqq3+0miOh1N7wBxih0JnrQZa6QnSr92rm3bgb
         2GHdFb3e+NkbIohqvW4oN2LySRT8BkZx1J2PWGuuj3r8gOSfJwTHi/mizuzX5IaQRQMc
         Y/62+BChNChyLWiDLrStTrAg3HrwdPx0clTd+wrRG9vw36YyoTB7wHrTxG4NaEKuq1VJ
         Wv3chXeTNoQH9ymdbGI0n4TUCqJN+OGRAG/BEiyn+mf5LvRmDOdMN5k0slbIni9QDeF+
         3SLVWkRHrijV+EhVe977lrMc/M80Vv+fZ4ul7aDJ7K4A7ec4O598ZcWZCVR708RtHpAp
         kJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773215877; x=1773820677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KOemrfvGiBCiGgnJ8CfsltCzoFMPUgEW3U050UEVSRY=;
        b=mBF8giqMTdUUWXF/fQq9Wn0wV+avLK9QqtVBiRUEHr6qDhXrtnq3OJ06uEjuRevOAs
         Dtt1gnmBK27E4pwqFgE/7Ln41iuWKSksfJmc3eBu0kRyrIRODI/pPphPsgJ61tyLggV3
         J64TF4+W54eykAU4dGZB/B8s+Z2iqtUplphtZ3tdUYRzAKxqw5lh389XDgek1liVLIry
         qhSyI//cRh3WVnt2B6QUwR9c4NQDiNhxsxaYCFhCoVBPS1QUdaupOvzM5YtvCyJC+Mxa
         8fbPD3nHpijFE00p7mkiRCwIqJqWi1gyAA88VJ1VswCdGfp4HMHFgmhe+a50W0k2NaaK
         FfwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6y3bjalui46+ZKc+b8/cbga3OlbAdzZ6bG205Ub/8M9RMBLhitcmScesLS+wWzdS4CY9chZVNMRSMpCIR73th@lists.infradead.org
X-Gm-Message-State: AOJu0YynFqOYM3O/NWYle0JcQQGqcjhwIlWWTxK72k3gAomtFV8Gmo6z
	E/ETOEILD0MvcDUTNKkWeIxbyPBXzUDhBhHGhlobIrT0hf0LkCjjR+ChZeaTtDPVk0tbIXZtfBV
	Ph01LXGPBxtKFQblqPEqtFQncaULgo1g=
X-Gm-Gg: ATEYQzx0/3Nd+HaKKXl+B7k7A96srbj0wc6tYBJGEKNN38pax0nr2lL/01L6nLI4llV
	a7neM1xS5+MsQiJ/d5AoSZJa3NOMEFgPGFZelku6iiR2OtjWazIbu862cnms0/RC05KAa6EQrno
	NNhDNLFTO3PVEuZ9z42H9RPLtLmSeSu4IoaDQIMOi6VOeKH/pJYotBTEweycqJqlW9dKTayCeku
	BCgG3IJpjsyf73w/EMVGjsl/RyHeu7pxa6UqEkk+/vWo3w5hHjJ+9vJGu16n0zAssIcmyOM1KO/
	mSBpbUR9KV03D7iJ33drT93JEOUOPbSNCTbxWhOY/aT0vS4a81sNtWoPm/ZuRZB4OKHqsmp2Y3F
	CSc/fU83usyhkkQFugfSm+A==
X-Received: by 2002:a05:7022:6a5:b0:11b:65e:f35 with SMTP id
 a92af1059eb24-128e779f429mr633648c88.7.1773215876789; Wed, 11 Mar 2026
 00:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260309181524.39423-1-egbostina@gmail.com>
In-Reply-To: <20260309181524.39423-1-egbostina@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 11 Mar 2026 10:00:47 +0200
X-Gm-Features: AaiRm50JciUmzn7VGe0FizTaDHsgHdp0SKlfOQwmdsfLT8aVkL95VbuXbIkGlKU
Message-ID: <CAEnQRZDZ9Z9ZJhETyhNRK3fcxtdCKxTXuiToagWRFZOhtBWpOQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-dhcom-pdk3: Use symbolic macro for IOMUXC_SAI2_TXC__GPIO4_IO25
To: Eduard Bostina <egbostina@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_005758_060697_0512E6FC 
X-CRM114-Status: GOOD (  11.51  )
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

On Mon, Mar 9, 2026 at 8:20=E2=80=AFPM Eduard Bostina <egbostina@gmail.com>=
 wrote:
>
> Currently, in order to configure IOMUXC_SAI2_TXC__GPIO4_IO25 a magic
> raw value is written in this register. This makes the code not obvious
> to read and modify.
>
> Use the MX8MP_SION symbolic macro instead of the magic value to improve
> code readability.
>
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

