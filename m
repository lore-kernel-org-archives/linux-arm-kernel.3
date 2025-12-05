Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E82D3748A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 19:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wM9ZHbZ5gPCyVTZL6N8CtsU8BUTDcZjFM6EaKvjgNpw=; b=F6X7fiX1rglQ9zdJEQpVHiwYz8
	Sctz4D2lzzGqFKp1A3ivV561Y0N51KovfSpvldvpFI6Tf81NZB3CCEPSM26ol0cxLF6u95WxkZ53q
	24jmLW1CGo7RSV69alDlIu98Desg5g9RDzSZe2eC6EvXe8+r8oUcKDV+7xFWE0P7dJuVahPPNHYKP
	OsmNQen9vueKjDJWVNFi9lZf8znOSA7LcriWNeqf1wJIh5YyKRceUlLH8tZZq0adbV6AdbcY/yEPC
	MFcuP+f0B2pNH+DOzejzV+ppvo7eQnr4ftN24YYwt6DiJjN7gUk1HqncRW61+yiZiuzFNfFEVgCsD
	DOQn4qCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRbDp-00000009vYq-0Kia;
	Fri, 05 Dec 2025 19:12:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRbDo-00000009vYE-0cPp
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 05 Dec 2025 19:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wM9ZHbZ5gPCyVTZL6N8CtsU8BUTDcZjFM6EaKvjgNpw=; b=UD99Xpvol+jUF8Q4A4SBjSqFO5
	z+eCbxOOe9RKL/izAB0eUqUeNWUCTROmOdSTjSTKo3+bD9THX39dFPEbhgGn2IutfPiNB/+h2bEoD
	EWurCmP5TyvE8OeJsbOnW4X34Xl0JgwGvt+eGZIbaj866cyxcHR60EO841M3KkhGE0JW+wlxFLOcW
	Fl/KpQh1JFd3PDg/79o2zkT+ZMOO/sZM40q2aagAbVN8h7qNE6MDcVuh0rnYDANTVbSn/5FFeR2Yf
	tNwPC/dVkq8FRvPYstbphcKx62a1rmuApcOLkzNt1g3RYDjQOsW0vpomnuroK++Oy1JJMvEi4uiFK
	cDqRi3hA==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRaMD-00000006eWX-3Wzq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 18:16:43 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-29853ec5b8cso31703835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 11:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764961918; x=1765566718; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wM9ZHbZ5gPCyVTZL6N8CtsU8BUTDcZjFM6EaKvjgNpw=;
        b=UpS8uDeYvU1gDQOpxHCggEM2r6g5AAtgiy+t+G/bLWRxtikQNWa5T7swWlU1f/TiXE
         l5z7XhUEQqZX8AWMp7tL9fDrQBMRIqNMhQX/7IPzxuDdo8tXwzkV29SoDVPOSnFj+95f
         kfqKO1LjlvU4UzZVEHYwgGk8bmmk3Oq6xlepyUB3kqsLUUZQXFufcr70z1VxQMT81rM8
         KYHiUZqM9SzgGyXnTajWvHS+h1shG9d54mb49tR98nNY63PpTuJI1edE/j02fyrlACk9
         5WOdX6aFkfSiq7WiTFxkVVmRskBd74e2QYmBq7FLEBZp8wfa1myKjgmDBsDc9GZjOWAy
         mgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764961918; x=1765566718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wM9ZHbZ5gPCyVTZL6N8CtsU8BUTDcZjFM6EaKvjgNpw=;
        b=fAon++ugpUm3o/ZsRFbMfIvRPpjUs5QccSEHaP74GpCvtrdqOwf1AqWoQZZT0IOdAU
         1zXkxy6L4TsE1AkctohfK9/fZqO5VIogyhtT46Uv9b7WOiSMtUN44KhopER7ivPtg3Oh
         AkZBCl1yyiXuNRilnX4tm84WTLHmzPa+u7lE+dEi/QdYjLzyR6skOPxNp7gMDBw9c8Jy
         Ffb/CRKLS9mdIepEju73htqR8pOBDD7yD3tEpmnWsiRLR/KY5xwsGerOrj0FoAHicDnh
         rfvJ5S0IHg34/IT24kyqi2BYa+fo1Bh8+eqkXEApvGNR46CKSLpgQWHOcVerzWiv2tFx
         R/Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWkOZ1SR9iVzSnR6msoEIbWCfbUtxheoK8Vxk/vGbW10kOCVY59Nc4oENHHo7HJks+ssSr6FxcADux3/6b/vYb6@lists.infradead.org
X-Gm-Message-State: AOJu0YxUAc13+eFEyeMTErvL3dR37yqTwxypV+H+Wuou5zm+R37Fvu6i
	jQzYLPZQ+fIGU73pDAokSUrGmt7zzRtSLA0+5Kecspgu+lJxwUgIC8SrAQI9u8krXhuBdWD3Ksp
	d6/9kcNBM66h1j+lf04OpC5WqHvf6+prBKyC00BdA
X-Gm-Gg: ASbGncvECB/lIWdQ0kun6pVRIy36QGYH9G5Ttk7SkKRkIh6KWDntufEp8R1V8/zT+TC
	9YiIUopux/47QeBINvTj5LyZqnZQ5nJ5G/lWEMeAQtiMBur2YnDZJjZUhK96fPgddjstA+lWvCH
	U3UXIGJL8VPZm5PZhHMsy84HZYp0YpH0+pBS9zLnwdaXlHfJVETv5tH/V9JRrBSS0ZsXHecRcVh
	InQu9LHX8BD6H+FM3Bq1APml6ecLjc8m98PieHMDJFAWzpiLgeCL4LqNrME+NWIJ4fLaZMpCJIT
	udMqDe6lr73LxPS+bWEs2Zrd6Ms=
X-Google-Smtp-Source: AGHT+IF8J92R4M7+pLwot0D0+DgTjmbE3S+sUzVpC/q61q+B6raArwC6JCX3rpjp0dZrIL5XNz8EpvQLm8BmLoh84nA=
X-Received: by 2002:a05:7022:d93:b0:119:e569:f627 with SMTP id
 a92af1059eb24-11e032b99a8mr103172c88.32.1764961917558; Fri, 05 Dec 2025
 11:11:57 -0800 (PST)
MIME-Version: 1.0
References: <20251205-phyb4-v8-0-c59ea80a4458@google.com> <20251205-phyb4-v8-1-c59ea80a4458@google.com>
 <18eeb1c5-d21b-4505-b6a4-472f6e191864@kernel.org> <CA+zupgwa+m8Pa=+8shORaOA1OO6zoo6zYEojFS2UDuP0doBq7A@mail.gmail.com>
 <f32e0810-56f9-417e-abf6-0cc7b361bd15@kernel.org>
In-Reply-To: <f32e0810-56f9-417e-abf6-0cc7b361bd15@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Fri, 5 Dec 2025 11:11:21 -0800
X-Gm-Features: AWmQ_bm3YiJStmimt8YeHw9S3Ay4OOTCAl_PiUAMxoeOahq1USzcbH6CTsqmBZo
Message-ID: <CA+zupgyxQisYBnLj9_3DtcN3R1Ugfv+-p-wimFp-hnqkhrrgyA@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_181641_962523_E0F65D96 
X-CRM114-Status: GOOD (  32.32  )
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

On Fri, Dec 5, 2025 at 10:52=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/12/2025 19:47, Roy Luo wrote:
> > On Fri, Dec 5, 2025 at 9:13=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 05/12/2025 04:54, Roy Luo wrote:
> >>> Document the device tree bindings for the USB PHY interfaces integrat=
ed
> >>> with the DWC3 controller on Google Tensor SoCs, starting with G5
> >>> generation (Laguna). The USB PHY on Tensor G5 includes two integrated
> >>> Synopsys PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort com=
bo
> >>> PHY IP.
> >>>
> >>> Due to a complete architectural overhaul in the Google Tensor G5, the
> >>> existing Samsung/Exynos USB PHY binding for older generations of Goog=
le
> >>> silicons such as gs101 are no longer compatible, necessitating this n=
ew
> >>> device tree binding.
> >>>
> >>> Signed-off-by: Roy Luo <royluo@google.com>
> >>
> >> Why intentionally dropping the tag? How are you handling this patchset=
?
> >> Rewrite every time from scratch?
> >
> > Hi Krzysztof,
> >
> > I dropped the tag because a new file is being modified in this version,
> > Although it's just MAINTAINER file but I thought you might also want
> > to take a look. I wasn't sure if modifying a new file qualifies as
> > "substantial" so I erred on the side of caution. I should've called it
> > out specifically in the change log. Sorry for the inconvenience.
>
> 1. so just squeeze that change into second patch and no need to ask for
> re-review

That's a fair point. I will be more mindful of the review overhead
going forward.

> 2. You did not read my complain fully, look:
>
> >
> > Regards,
> > Roy Luo
> >
> >>
> >> <form letter>
> >> This is a friendly reminder during the review process.
> >>
> >> It looks like you received a tag and forgot to add it.
> >>
> >> If you do not know the process, here is a short explanation:
> >> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versio=
ns
> >> of patchset, under or above your Signed-off-by tag, unless patch chang=
ed
> >> significantly (e.g. new properties added to the DT bindings). Tag is
> >> "received", when provided in a message replied to you on the mailing
> >> list. Tools like b4 can help here. However, there's no need to repost
> >> patches *only* to add the tags. The upstream maintainer will do that f=
or
> >> tags received on the version they apply.
> >>
> >> Please read:
> >> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/proces=
s/submitting-patches.rst#L577
> >>
> >> If a tag was not added on purpose, please state why and what changed.
>
> Where did you address this? You dropped the tag silently.

Why: a new file is being modified.
What changed: MAINTAINER
What's not changed:
Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml

Could you consider re-reviewing this patch?

Thanks,
Roy Luo

>
>
> Best regards,
> Krzysztof

