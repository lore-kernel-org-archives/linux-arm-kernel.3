Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C411EFD208
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i767YM81rg16oZZHvqRpOQjd5YhsJg23jCgSi88ETAE=; b=DBmg7F1+gqXt1neWWm7D/gQ1jZ
	WegIdsTprqNmbc6OccjZwSUgPFqduxnFi4hduedoBBb/RuX9gbBSYRqpfF23dmbz6ki7hy35IYJCQ
	iwAoMnGXgG+rxGOM9w/2V9j7Q4s0lAyXTrnjDRNndVJcn2VI8aWCpmIBcR1GCU0mNv7iLlfG2eSYd
	smgZrWtqjJUEqYS46lA6j67yAHSIiKr7QMfJHMSSk/DYuGbgVxBTpCBMW9EIxUjTlgjopbYcyyyQL
	jRaeYjmjvu8j3OcNsInC150EagsNE/JlXr1eUbC5yYunNBKMbZS9lg3QAL0wOCoibnm4VJR23VS4e
	FCRloCjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA72-00000003Xj4-2kSk;
	Wed, 25 Feb 2026 08:19:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA70-00000003Xi6-2z8o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 08:19:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EA9C44206
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 08:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CBFC2BC87
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 08:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772007553;
	bh=i767YM81rg16oZZHvqRpOQjd5YhsJg23jCgSi88ETAE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=m3MnF8kg8EdpV9TU8qMVIyRtyy9/e4Sc7qdBSw7Kmbx1O/1IQVhMe62U56el3Q/1k
	 jAqYvJ5zQWcCSk+wSu5VRgVyrERgCYFo0yLzeFapQxOGWNY5i38UYyNfKPQKIn2MFO
	 TbcLMBptwcoK3QOFNuZShpI9rnqwr+XKTnBdR8LT+p73sHev4Yna30R8exUDG6Ki0q
	 UOUjUjheFSk0BXDERTF5jqlIlnsHwIOPgB3vu3e0cn6ofmiMyx86oPNZyFXzQEvexL
	 yEfI8mKfouLgxGH51mxfnY6ke55/jie2AOXfv21aQCN/djFyBsC8M30M3dwDJexryF
	 HNda32plqi0Qg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38704f70ea3so57207091fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 00:19:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVgl7VtsqQdrbz01Km7tkxrq++P/Gv10h7U6bYOnawDfbzhCiJORhDqmn/Zv9H54vv++BZ1cPAQFZZIEoZ3cjgi@lists.infradead.org
X-Gm-Message-State: AOJu0YyBxYeJAT2PQ/mV6HI3ufdIGm+jQ/oPHHUNHbYp+cc5wZc7xkxa
	b+sRg+dU+fS/vYRCwlHmbJSGVUAcm5tOwRRIsIXjbua8BJnUaFZy6EGsB2kIS0+07EAUDgtU9u1
	ucLwPcAPJjMdun8RvphkgtXViVochs1X4XNGcfag5Mg==
X-Received: by 2002:a05:6512:1252:b0:59f:8993:df7d with SMTP id
 2adb3069b0e04-5a0ed8a2429mr4956665e87.26.1772007552569; Wed, 25 Feb 2026
 00:19:12 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 00:19:10 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 00:19:10 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260225072225.3345307-3-wenst@chromium.org>
MIME-Version: 1.0
References: <20260225072225.3345307-1-wenst@chromium.org> <20260225072225.3345307-3-wenst@chromium.org>
Date: Wed, 25 Feb 2026 00:19:10 -0800
X-Gmail-Original-Message-ID: <CAMRc=MefvP2bxdGqhw+Sn_MDqVcA2fPefCBygP=ZdFLnkPcHUA@mail.gmail.com>
X-Gm-Features: AaiRm52W52XmwIgwxtOACerr-UA7gcczLgZWX36auM-UC97DyKrwy0k9pm1Y2nk
Message-ID: <CAMRc=MefvP2bxdGqhw+Sn_MDqVcA2fPefCBygP=ZdFLnkPcHUA@mail.gmail.com>
Subject: Re: [PATCH 2/7] PCI: mediatek-gen3: Add error path for probe and
 resume driver callbacks
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_001914_766122_20E4C486 
X-CRM114-Status: UNSURE (   8.37  )
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

On Wed, 25 Feb 2026 08:22:19 +0100, Chen-Yu Tsai <wenst@chromium.org> said:
> The probe and resume callbacks currently do teardown in the conditional
> block directly. This is going to get ugly when the pwrctrl calls are
> added.
>
> Move the teardown to proper error cleanup paths.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

