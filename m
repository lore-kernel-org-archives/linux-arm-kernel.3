Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FE4F506D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 14:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9qImMPTFN9l13pEaVZexXF0+F/wHlqkeGvCWUWvFc0=; b=DMpR01d2GLAVXljdVsa4EPMH02
	zd1MRs9vgjFFrujamZiHgNVzk0VHJy0N8Q77gCbLIxigPaz4gb2caTuiR8VLCs+2b15TTIdEPruxB
	PD95VmLcCwH4YmH4QD1E11McjhjPsbwte7eTlAFL5jEvFaHnP8T3A7IFA63I7tbhCRaS519gYKGbi
	0wtEHUvca8aSO09w75X2oJJQeTO9mHDBSKbR1EY/q0AGGsu67qOVMpu+nsT08yalqCPqF3CRWaUQK
	PW5XwL8IygW/Xof0WR1z+n9g7aA0t3oU4HFoSWey134/tqeu6GxlDTBtbdTYcoMRGiEuKX7QKolxE
	+D0DtI5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28rD-00000004AkF-3LwS;
	Mon, 16 Mar 2026 14:23:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28rB-00000004Ajj-3iup
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 14:23:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AB5F44564
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 14:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFF2C2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 14:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773671025;
	bh=o9qImMPTFN9l13pEaVZexXF0+F/wHlqkeGvCWUWvFc0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NzGLe0MxaJ6b4oDrU7jIw7POfBs6WQhK9MokUeJZmK1iorKNGExFfp4+cbDRBy1+r
	 MwB38IheT63yy32AjDHKZp26QAFHx2O1TgGdVGS1K8zk8OAf+7bqjMfJwfSpKyviIg
	 GqlarZ/EtuYdo9tj1+ZfxKFY8Eg1WowSXVX5/nwLQn532pLRUGz/l6tZmIgur2SHGJ
	 2VmiZe6iub9TvE32oTer3V0ZDOqZxyEEwYVd5k5gf64TFUB9dWjx3/HOkqu0h7Kx/g
	 iiX/CXJHWsZ8TMzp1u/LZpLyE73G/91zUIjY6v3fJqALNCB1WKoBj5Uj7S8LVR0cLF
	 bjajcaCpeBl/g==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a12f88d839so4727858e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 07:23:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9Uomugm+SucRlapsuk045PkdGgbb+VRujvyfhvmoZaeQAFcl6eR34mhwf/i+71EHAATSMwhLj7bmgJuagVdca@lists.infradead.org
X-Gm-Message-State: AOJu0YwiRa3Mim1J9q8Blv7vcuApeTiKd3xCJeUaJqyO7mIy+2J1DJwy
	HzMpO0n6a3VBWJx8xEE//9nE3XkDshdYv/8IcyAsq+fwiyNvwedSnMBSgl0e0g5x5lMGXiGofg3
	C98BStngvvYjNK8LbQ4h1Sni9n7atgXQ=
X-Received: by 2002:a05:6512:1589:b0:5a1:3f66:1d75 with SMTP id
 2adb3069b0e04-5a162b1feb3mr3926051e87.43.1773671023606; Mon, 16 Mar 2026
 07:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
In-Reply-To: <20260313195801.2043306-1-shenwei.wang@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 15:23:30 +0100
X-Gmail-Original-Message-ID: <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com>
X-Gm-Features: AaiRm51oPQ0PGDQyh1c2t_SBzYfjFDmFeidRXonO75pnfFoM__wwYFbbiMK8ux8
Message-ID: <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, arnaud.pouliquen@foss.st.com, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_072345_948555_32080780 
X-CRM114-Status: UNSURE (   9.62  )
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

Hi Shenwei,

On Fri, Mar 13, 2026 at 8:58=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com>=
 wrote:

> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.

I think v12 looks pretty good, if Arnaud gives his ACK on this patch
series I think it's ripe for merge.

Yours,
Linus Walleij

