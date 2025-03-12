Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AFEC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlyhz4BQvRz1GDHVrSLjQoPo3ZuW0aG7DOk50KPSscQ=; b=NFh1h+IwJHPoeVsOWvwA/RRn+C
	vMjhEy2Z76ZXyBlHO4p683qb2t8r72Lmt46BVCKoRcsSLquPZ6wemspLPKvJI2CnL9WhU2Us49q29
	+SZrByWwVtHQzIgg6XgvqlsJApsT/aKAN4OqIqq32IuH8AQmrwxAKACCW8kxCgCWyPwwcwIF9py/N
	8Y6NRPTp0bvGx3yJEFHARVu/Gz1uW5t0UfnXAPLLG68CDMHeGPx02FVYAErylGC7LQIEJiWArC0sT
	inDP58VC0B9VY7Kua3/K9STkx4/cfrvuuLHdcrrHaKt47Fb21sscmKdnR9oU1ANwXsfCPGPApclnr
	3oFHBlXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK9S-00000008EtM-3Xb5;
	Wed, 12 Mar 2025 11:21:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJzW-00000008DXY-2lle
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Mar 2025 11:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wlyhz4BQvRz1GDHVrSLjQoPo3ZuW0aG7DOk50KPSscQ=; b=qdAA8Sc+1P14AwbAIOEIlI2ljB
	Y1OPGr9rolaM2RYVEnuCbk6QJjHNbAV4dDhdxoazyzdF1EdD2d8j98hndeYyIG1xBZ4RKbcTSsVoE
	SA2W012v4tPikqKApxIZC/oGHSv8WdIILHE2UUPmI+24gvlTf7rfK0/LmcvjEgjhN1YTUAgolSEOE
	T3oiufhyjDdG3Q2+gQHtxzE9wlwXiPzG03R8QoL9677JfgenJVtYd+t8TMgmmAPASoHMFrgIEl+VJ
	iYPbSm7P433u+slwTAT4ue2IJ7LpZSZeVB03Rw+53RjM5G32HTKrMUntrYNhCeHrI/P8f13GYqerr
	b/PlB3cQ==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJzT-00000002MOJ-0W1z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:11:13 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3912c09be7dso3588780f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741777868; x=1742382668; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wlyhz4BQvRz1GDHVrSLjQoPo3ZuW0aG7DOk50KPSscQ=;
        b=ZKofDtOWMvPf+tM3Fr7eIk/ik0ro6IxuLjlzTjq1wTpbTRTmvSLQs3ULLAXxESzezF
         fRLib5/wMr6vP6rl9ohQKboBjSY3Iz5CcS+DDTTD9DWkSTx9UzYD5/2zNoIxVFbybtVX
         L2do6sEgxKAM8GW7OYN13jtev/94RN68BoTPf6MtVP+IqV+a6aQvDnwZ7opZE8Iuj1oL
         d3WkkaFHAbFyUkzNzXzIwAyKfRDbCTxFaLFEgsx0ay1T+VyO020xJ6LJq/MVKpOu55kV
         NES0u7saVKR6fJ/LEdX5/xDoaDISMR/Mhl9kGT0oqZ4APOr69ZBTD3juMzjbsBYWFN+v
         u0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741777868; x=1742382668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlyhz4BQvRz1GDHVrSLjQoPo3ZuW0aG7DOk50KPSscQ=;
        b=T5q2rWvumABjt+8IcGAqRXMCqy/yCMl1IjsSy5RNYuWV4/IgQ1lXi9tHI7oIVoiy7Y
         H7pkUFHsaBqhWgHnPjB9Lv/gOHjme9EQyQraQI9mTjYLRi4cnl0Y5lpHk4ly5LTI04ZY
         DSmF2zSXfYlMvBJLsUnFO/eTpE/conv5z6enpe82rFjqm/kbXZgmPXLwxCE8mHxALw7V
         5Eo7W+jzr3GQZJVGOHLaTGYovoOI+gPvCz3IHwyc0VoU7ixwfaIec9wAr50lhWUvL4GV
         iERFutNJkisIH5LW+P9yD1FTchzC0EKXT3ncfP2+1m3+9sagdxhrrLBP54la+J9z2bOJ
         nPgg==
X-Forwarded-Encrypted: i=1; AJvYcCUtXur2VavTq+5bFEVCxWKjafPN5sr+DQwZqpmun1AWroRVw3yHR4LZV3x6Ni+jnyj+goxLwr6IBKUQpZreGE9X@lists.infradead.org
X-Gm-Message-State: AOJu0YzUWeBq5zV9Y6yA4ZphpY1JsRZ4qbxGB2cJa78QuQPRWhcTM51t
	CMZ8peSOkWRALSNvXplbPL5H+XzxYUbIyYkZiFQIHQ4npVF0MO7tTSa5xdLoKEE3nrRmwsupfrT
	6TPQm3DW5nMTTu3Bfo3D3mfwb4dmW+Qk1X1iqag==
X-Gm-Gg: ASbGncvOIL3kV8akwFa6/A9fGmBxy8RhL4wOeFBlxKBAMLTmY4pyLvNLQfAdbmViHes
	N6FquuOYWnYt0b40+Pe3O6vbMIUpYWrTesbnBCzenAt9CR32ygTK9L4kAfxCoSVz1JIU6HSkpQd
	N1F/GEc5eX8WanjuNMzL5gZ+0IdRQ=
X-Google-Smtp-Source: AGHT+IGQqsMzLL1SkIH3EVJhaanHHGJ9uStzi43oBMlQa1DqbbQl8c3C+QW090TXdgpNQcCnk5YClrhuASylQsAX/Pk=
X-Received: by 2002:a05:6000:1867:b0:391:253b:405d with SMTP id
 ffacd0b85a97d-39132d98a1emr17304676f8f.41.1741777868403; Wed, 12 Mar 2025
 04:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
 <CACr-zFC=mPNeeHMp9XnSby+cMQaPWt_3s8iUiCN+EnVPeGad8Q@mail.gmail.com>
 <uljqxwfgl26txrfqvkvzzpj6qurgmwcbuot7gu2u6rwjaqgncb@jeuyi4mexjff>
 <CACr-zFDSFizYmrVN-dV334n1kq17UB9k4FxrV20NNQCQMhzrwg@mail.gmail.com> <92dd35a2-d1cc-4f2b-b3a8-5752ec33b0d3@kernel.org>
In-Reply-To: <92dd35a2-d1cc-4f2b-b3a8-5752ec33b0d3@kernel.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 12 Mar 2025 12:10:56 +0100
X-Gm-Features: AQ5f1Jr_LcQ_zc_s53yVw1h2DAzbGYxZX7Ayfg2dMTJBpBQw3CievHU4tKHPOpw
Message-ID: <CACr-zFCYWEFPO8yExp_8hOQdVtC9Zwu1ZOZNksSeyyS6Ht0e9A@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as built-in
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_111111_267764_EEE9EB9A 
X-CRM114-Status: GOOD (  24.10  )
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

Hi Krzysztof,

On Wed, 12 Mar 2025 at 09:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 11/03/2025 20:15, Christopher Obbard wrote:
> > Hi Dmitry,
> >
> > On Tue, 11 Mar 2025 at 19:58, Dmitry Baryshkov <lumag@kernel.org> wrote:
> >>
> >> On Tue, Mar 11, 2025 at 07:10:06PM +0100, Christopher Obbard wrote:
> >>> I sent this patch to start the discussion, some things I found:
> >>>
> >>> 1) Some interconnects are missing from arm defconfig. Should they be =y too ?
> >>
> >> No, unless those are required for the UART console.
> >
> > OK, that makes sense. FWIW the cryptic (to me, at least) commit log on
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6eee808134ecf1c1093ff1ddfc056dc5e469d0c3
> > made me think that the interconnects should be built-in on all devices.
> >
> > Of course, the real problem here is RB3gen2 not actually finding the
> > UFS/eMMC device due to no interconnect driver.
> > Until now, I have been building that into the kernel. I will
> > investigate instead shoving into the initrd (in both debian and
> > fedora) which should solve my issue and render this patchset useless.
>
> For Qualcomm platforms you are expected to always have initramfs, thus
> you will have the modules for UFS/eMMC mounts. I don't understand the
> problem which you were trying to solve.
>
> The interconnects were built in *only* because of need for serial
> console. Only.

Thanks for confirming. It is all clear now.

Consider this patch dropped from my side.

For reference, I am working on updating initramfs generation tools in
Debian/Fedora to include the required interconnect modules. Currently
the interconnect drivers are built as modules in these distros, but
are not included in the initrd. That is where my confusion initially
stemmed from.

Thanks,

Chris

