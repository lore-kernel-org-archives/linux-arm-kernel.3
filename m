Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4464D1D460
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdcDXZFwVNVQ35x4VfoLKdE2HzK1zTeVnCjAhVxyojE=; b=XBggrh+IpYSxY1gupFHgT18c8+
	dYa4Ne7PUF0QkPTLn44yx7nEyTNVPBeklU6P64tbfe2fvmscpnFk9zz6LNGFrLBhyoT4U8wiTw8gY
	8ncPl29q1dPPc6kxQBloc3Tk9o4WBuK1L2G+Wf4VjkqM5Kpg+tcj8fxt1r7dRelu4nY8CgV5Ua6x3
	/UMx0MQhm1An7iCXrvij3b+iY0rGe050DQpPzTdLc2tgeLgWkR0JPXzA+VPS36EelOmVnufvnDq91
	Rj9vmzqtfeCuf1dx+aqJ4TK8Ko/Q6avwYZHObdVV/zGlpIlKQQyvUtsBgbJarZf/Rmp6B8/hPycjk
	GRJasDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdr8x-0000000HN9L-3ylZ;
	Thu, 08 Jan 2026 14:37:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdr8u-0000000HN8a-3Omk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 14:37:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F08F8443B2
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Jan 2026 14:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3ED3C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Jan 2026 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767883059;
	bh=xdcDXZFwVNVQ35x4VfoLKdE2HzK1zTeVnCjAhVxyojE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IOyluDY4kJjcYTItdNhuLEPi6rMXyGjrvci6CdqVmLRi/noHz8SDHdVxZzPQOvAA7
	 +TjZBVKb9i7FsE06x7Geteq/GIK04bG1VN90fz5QHjgjpHrAeDkfHeLN6bbCLjLTVM
	 Y7dbnON8PfeHExVn4tQzhjDuFe7i1GY1JszHUmLKhVypVIimMnMVAtYT7yDm5GEt5m
	 ujG2WP//OShFFoAQz56X8iaMPGLzAakG7QLoCAA+QIvWcRp54Ci2hrYfk3MFcd1Jbq
	 91LRvXSpx0O9vbvPTErNHuF+GElkpM3L5aHeaEJN4Z8jhlzMN7DFvBBItxPWUMCTGV
	 NcVD0LXUxe+ZQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-382f4aa8dd1so17491221fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 06:37:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbGzOLpvGUvIGGXvyfFpcMhsZczQErK9XE79UNP6nGHbPukJKn2Rtn3AgmyMdApgvvJghaKmS8CMgM+rsd7r9s@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5ilbgc2NIwtw/OtWl6WCi5Ct0Vxos0KEoUkKuFDDZ5OUdTlc+
	ivZRPl983PQ6orjICJuzdS0SIZhg7CcZazEGK5S9szVSg8USOWFjC1/l17ftOqzU8K65fupECA9
	pIFyD3X6zHWvSmHwk6/DLVVzuOZHiLDu+d713IKSxig==
X-Google-Smtp-Source: AGHT+IGAua+w0hZI7dvEczygU3mwU2kIlCKMoSiV+njFMOBaS6ramgIFu7BmUN6yjnHn8hqSM1y6y4DJzIn424D4Hjc=
X-Received: by 2002:a05:6512:12d1:b0:59b:7c3e:21bc with SMTP id
 2adb3069b0e04-59b7c3e2310mr42036e87.46.1767883058441; Thu, 08 Jan 2026
 06:37:38 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <66eaf003-c397-4920-b3b7-93ac8a5adfda@oss.qualcomm.com>
 <CAMRc=McXFTLjE=2-xsx4sodHgd83h822iEBHT7bxcNOQm6OJ3A@mail.gmail.com>
 <98d69fb9-d3bc-4439-88b4-60f3cdea3422@oss.qualcomm.com> <CAMRc=McmvaM9=K=0NLRcLLmo5ck=m8Fqekh7tBMz6quO9K4opQ@mail.gmail.com>
 <5151bdfe-7e83-4aa0-b9fc-28209d535e1e@oss.qualcomm.com>
In-Reply-To: <5151bdfe-7e83-4aa0-b9fc-28209d535e1e@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 8 Jan 2026 15:37:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mfa=350PWw-wNd3my4SD4DvJn8qDqGdTnTfrGR1XhA85Q@mail.gmail.com>
X-Gm-Features: AQt7F2oTdt9i_Kj_u8PfWHVcxRqKBe83LD6W2bJ2swryLe_OAXk-Wja4rSdfiH4
Message-ID: <CAMRc=Mfa=350PWw-wNd3my4SD4DvJn8qDqGdTnTfrGR1XhA85Q@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Will Deacon <will@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_063740_914153_08AAC39D 
X-CRM114-Status: GOOD (  18.01  )
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

On Thu, Jan 8, 2026 at 10:44=E2=80=AFAM Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:
>
> >>>
> >>> Hi!
> >>>
> >>> This is not really the offending commit, it's a recent one in the
> >>> implementation. The issue should be fixed by the following series[1]
> >>> that will be in the next next tag. Can you give it a try?
> >>>
> >>> Bart
> >>>
> >>> [1] https://lore.kernel.org/all/20260106-gpio-shared-fixes-v2-0-c7091=
d2f7581@oss.qualcomm.com/
> >>
> >> With the linked patchset applied I still see the same issue
> >>
> >> Pankaj
> >>
> >
> > Is the gpio-shared-proxy module available? If not, can you change the
> > config to make it built-in like CONFIG_GPIO_SHARED_PROXY=3Dy?
> >
> > Bartosz
>
> With CONFIG_GPIO_SHARED_PROXY=3Dy the issue remains the same

Can you try this patch as well in addition to the other ones and on
top of current next?

https://lore.kernel.org/all/20260108-gpio-shared-false-positive-v1-1-5dbf8d=
1b2f7d@oss.qualcomm.com/

Thanks,
Bartosz

