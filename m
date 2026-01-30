Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31CCD49C66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 07:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1WR5ODyKHxb0v/kKAHtZd8QE/NKwhLOL+jqvJJiv/A=; b=VQyiJLacyxiBOyhu7yXUQHshpZ
	8kMZL5O7hBYEsaJvewifeCr7Jn0uvbrAaN5M0agMac0PXxAtG92kTeedmgh2WiyKt+ujxQdQiyhtu
	gvmUl6lYyQQy7y6Er7Q1D+TalkgoELhCVDppFrybRx0Z3Av0mgLOjO4hOew3arqquYPN5gXQJ/l0I
	QIImneEWT01MvK9saFITB5uDwJDA1TovmqoqPxLXDSC4V/IrtinpPwPOWXINMh1eaXr7hyeqSQJ3E
	mu4E2ncBmuycQrF+hlx18tVcl5gSXa7cXhixxl/+NQxhwhtviuLj1dGplNUbdS2PhMUiuT/q7lAmK
	LG5l4ANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vliut-000000019Cv-3m8p;
	Fri, 30 Jan 2026 07:27:43 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vliur-000000019CZ-2y14
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 07:27:42 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2b714f30461so1672677eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 23:27:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769758061; cv=none;
        d=google.com; s=arc-20240605;
        b=jzsnIyFBL6wooJS3/OJlE5/okT33PD6TEK5V4yDIG2A0X5IcI0lWq7ZPGtagIUCBTw
         Kt4jblAuyL2xhDkic/zptz0BZsSjAB0fWP0GuTx1n3f5vg4K2vYDUTo/7pVi8t75hlUv
         zVSpsXdDc2vEtMpoqnb5KGMNNtORvpZ6TT6snzQDnvJquMcGukhVtzuTM4WoU/quQ7kb
         ELrqG1ohf/c3DHerPdYU5GgIP7jidGG7vIxNFVjigmAP7b6FDOiY5PAW8DrTSOqPmPD+
         7rkzLWaFcFMrypl5Kak5r0uLHxAAp0huvxCNiEmyl4YrGjsNai/k6BKM/xGkqO2cf1gs
         nopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u1WR5ODyKHxb0v/kKAHtZd8QE/NKwhLOL+jqvJJiv/A=;
        fh=dJPjr1Hjo/xlSFsXq4o+w6M7v26nY5xHvZABhOBLnTk=;
        b=lkYoInvecY05UYl+XxulqlRGjtzr5ky6FzHmHiG6kaliNVbi5BGIMod9Y5+IJVlBah
         SJ6gV4fnjdkShtb755wo5T5wASLPtRodncCHoMJEOoIfx+V72YHtdHD+JtUB5pbwQD5v
         0oa8FOrFjQg5EM/3AoUFKYCdYFKUpNx+o0H803g4oCT1Wl/9goFvX6brqc5JvOECFOV9
         smev08X80eT6obdOB98v5nTl6kQ/XvfJQBvlN9wMGBFkFhGpEHVE3CrjBKNFgBzBH0yt
         dGfKvapv59Imm87uQKCIgonMvYkTyZbMqwhZi5gA0qoKBXln8rq1Zgl0LCgiyTydtIsy
         kYCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769758061; x=1770362861; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1WR5ODyKHxb0v/kKAHtZd8QE/NKwhLOL+jqvJJiv/A=;
        b=AuyO9OAb2yHHqCBnKi3yVYBN3Wl8MOrBV0CeHodAV8UJiE5zAgfVbQKLMTt2rVMuiw
         2o/fzkn7+yDgqPZaMNUfyQKlpEWIWZUg4E+2YIZGc8qfq9TrjDUgo9TUYTLqK8OD6nCG
         0XZPz+AZmWMdhlL3+U4auPm2b1H9ACDHkkT6sUpfACIzYHkIps3puVsgaFSaBdmvCSHm
         QmNWlh4156TzTNkMWeNOkX9vGYEH1YbPPbyK6Uuv3pGgnx4qAPpfWz5Ayy8WhQTRGMX9
         BD5aUyLdvEQBr6AIyki2Qn6XgkUiqa5zy5jetocERvC1aHqJM3gEwGCGQKS4VNwWeigJ
         oF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769758061; x=1770362861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u1WR5ODyKHxb0v/kKAHtZd8QE/NKwhLOL+jqvJJiv/A=;
        b=ZkFdf9uL9eHDyw1Os8rroJF5UXyOfUVvY0a8p7OCIMOIqqj6gv58lFhcQXjVtkKg6v
         qLVLwoQU5IbOZie6TEHKOCrdd9XDEcM1KszGiE899CY53YcqKFEmy50sWq9UJlElEYJ8
         TAQNMNqZ8zMkGAlrXwg3CMmA5fp0XmCk3lWx3cLjyVXM4ycTO1SNcX2U/8frmfaYJzGN
         VI4t6uanTWVtVk02EdpbQ3WEf0ktZEciBiGZ1fgZFT2zWOLUhuHpI9CzJCvkAsd0W/Mn
         aAmK2HmIKaMbWJ17Pc5Ff0ycvTHedhawZizmGIFpVQmv8NbzrJjoqJH5dnsSzEpTSlnI
         +Iiw==
X-Forwarded-Encrypted: i=1; AJvYcCWAiUy740kVcQ7JGunj9fFunWTIcZ6booz29Mf3sNhkud6Hv2jUZUmB+ySh2gmsChkC594A7k8HFcKjvsD5sXRx@lists.infradead.org
X-Gm-Message-State: AOJu0YwwZH2UzBswBaETIGxcr8ajWplIdNqjvZbEdyQTkSH0mZ44s5x+
	Fbvu7InCLItWx2eyOT0jJSkryz6gwMh3x2Y8Cg5Mi4mYhBGEio6jdNxk4cbl0r2DG2sM4XcvgDG
	fzrNBOkO1KDwSYWj7Trn120fVki4+1Lk=
X-Gm-Gg: AZuq6aLlf0CbRyrfWTlHIlrI3Ub96yfTkBIeDgZ0whFORyITpt2IwQ+WOfuVfTLVBbx
	yT6jL0awJtZN4Swj+4TL/y9Bz3mnIgVFc3I3yUZuyUHMB1HQU8Md4ThBXlmP2MDoAhsl+EUHokU
	6SvqTCUY2KatL3EDxNehYHZQcgFx6YGHg5ackNIBNrt+NphmEv3GCbaLRg+zHbwBjQsK14EihPD
	TP6iPyaNqIhoKCrWt8KAsDhzCsZ51Tg11KlXZctlU5fg6QQR107K9vtveshg0VnkkfRjL6PG087
	r/zJ+mZgYyX1ZCAOWmRSJ6R2UCem41Fe1RAZYoTpRkyuIWyzHO34+RxB99hPj8Ft9F7Dk0kI8Ub
	VsHZEHmdH4s0orw==
X-Received: by 2002:a05:7301:5f8c:b0:2ae:5db9:f32c with SMTP id
 5a478bee46e88-2b7c88d96d3mr823727eec.26.1769758060694; Thu, 29 Jan 2026
 23:27:40 -0800 (PST)
MIME-Version: 1.0
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com> <20260130054330.3462544-3-shengjiu.wang@nxp.com>
In-Reply-To: <20260130054330.3462544-3-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 30 Jan 2026 09:27:28 +0200
X-Gm-Features: AZwV_Qgjn1kkHIU5h0wzpNnEdB_ncps3lPvcrbigVIp1umd_Brl0rdk5oiMuE6E
Message-ID: <CAEnQRZC_6xRRi6y2t0MGe8udTPYWg9XEBFrxhFCbKYBCCD=OeA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: fsl_asrc: Add support for i.MX952 platform
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_232741_750286_A49E80BD 
X-CRM114-Status: GOOD (  10.66  )
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

On Fri, Jan 30, 2026 at 7:44=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Add a compatible string and clock mapping table to support ASRC on the
> i.MX952 platform.
>
> The clock mapping table is to map the clock sources on i.MX952 to the
> clock ids in the driver, the clock ids are for all the clock sources on
> all supported platforms.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

At this point imx952 has the issue with dma request not cleared you fix
in patch 3/4.

So in order to avoid this you need to swap patches 2 and 3.  And in the
newly patch 3 you will fill fsl_asrc_imx952_data with correct value
for start_before_dma.

Thus we also keep everything working for bisection.

