Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8489C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 06:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bwYMmAg8VWivh0Q28h6rvauGMF0XnNE+msNjrnFeNE=; b=Vm2bspLSpAcn02fRhmsgb9wleC
	3npdg8bWynCgLAIhTGfQpzR4zlHX5nYSCzQd/NA0SxPvDxVnrcBgUXwEN1ikORNmFrf48A3FG2bsr
	mRHMciyQRTNLNoIQL7Rf7/obj8FTdG/k93osHVz5Sjb+0n/Q2odbeLEYgw8rZ6kkyhhWH/VxWSqxq
	f3rYWT8ti0w/Yy77pmDURybafeheilTJ/B0NTvfu7DwID3aIevvSobogG8BsTIa2p0UBh8S7rbF/J
	L+NXX6nmUkzAELDPqhYWWdcS/ng9BAxsFrQJApDM7PZjnepQLWdvWj9aEN0MN3rJ3dUKt/wEuki+2
	Ch5FfkOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taqfr-0000000BnVj-0M5q;
	Thu, 23 Jan 2025 06:26:43 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taqeW-0000000BnLF-0OMj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 06:25:21 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5439a6179a7so617587e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 22:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737613517; x=1738218317; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bwYMmAg8VWivh0Q28h6rvauGMF0XnNE+msNjrnFeNE=;
        b=mc/Q3FqFTK83kBrrpmBbbYrN4J+YLk6zaIOrRPEuPl02/a9PrZTqjkQl2gtZeMOAOG
         snCzood5IHUCowy/9JqCXUWyW6aQ2ubA7cEM4ht8rDXv7PycKVkJv3v7Mi3ZDAHhxH7b
         P8fO5TUQcppLPdEvCyhwoHO+gtizc9YKKmHOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737613517; x=1738218317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bwYMmAg8VWivh0Q28h6rvauGMF0XnNE+msNjrnFeNE=;
        b=ehgND8pHLLHXeRooOm4V4tJEAcnlZ/zoF4UOzFtt81dRXgoCSWRWIShJy7oWHFWqkh
         c9Dg/hC4Qny7bWZUiVWM6RSzPg5DC6VybUeabDt+lYIAHivgZyWbNLtI2KsjC/6+RU8+
         B4VU4IeDTgKpwfLFUmXRt9tZuE/MoKG1Vz6qBOdqIB/CzDFFOZ4dLCkDJlAgzV0Uv/fI
         vfagysNsf1/xELGCeFCQfNyDwpdARnEtKlFKI9zM59qOnvlGzRYX7ya7KLxwSeWiLZR2
         /4k+VB7dkm5BlCFfmDif2MGilvZ6KFExkb01kcBgG0jIvV1emgDaMzXhlrMuC4SkPZHs
         nWfw==
X-Forwarded-Encrypted: i=1; AJvYcCWjh2wEhQwmi7B0PAenil1f3wCDz9jp6imxM287w++oHpFVPczNjeUvH2zd/pUt9oJhqa2jiz1PcZaMolA/qk4F@lists.infradead.org
X-Gm-Message-State: AOJu0YxwVNuEzvnc4ZLPKvE2o2dRDYQXoENu5Aei3aKB6XOL1WLYFopX
	UHZfg1GatbqqGTXFAsQ4NLPCMKlNtXGq9zH8z97TbeLv/+sO2yxDeYjsVCwqxzrdq6UR6OYy6S+
	miEPBR4azGIcadpE6j47dd2joiFi6gHBv/fSo
X-Gm-Gg: ASbGncvNPmJ0trGDxzLyKiV+Ko4wxkcyhGBI8t8cBa1yNynkW2L99FfQy3mkTamyLoR
	cdu2M2zyqdXAVJBoNk5vWy5QT4oQ9vWjY4z3qRvSnQzcmblI5w+UV7N0yhsGV7Vn/kdfxlVDmG0
	Hq9I3EENkVxvMvHJtyzQ==
X-Google-Smtp-Source: AGHT+IFjV1nbatIBQFwYYLMA1abMLSRNx+Lvn+/q0MRJLEjGc9mVSRrS+HUSZbvSas2ijuwobcEMUWdONKDCpspTIUU=
X-Received: by 2002:a05:6512:128f:b0:542:8c7f:cfc1 with SMTP id
 2adb3069b0e04-543c21ff387mr771068e87.3.1737613517221; Wed, 22 Jan 2025
 22:25:17 -0800 (PST)
MIME-Version: 1.0
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-5-paul-pl.chen@mediatek.com> <173651725269.2671643.2891127782637834272.robh@kernel.org>
 <SG2PR03MB66367B4A9DBCC971F55DB326BC182@SG2PR03MB6636.apcprd03.prod.outlook.com>
 <d116e180-a056-4595-851c-ed1bb6f24cef@kernel.org> <b9405b09da418eb3c65592b53489d7f0dd4093f2.camel@mediatek.com>
In-Reply-To: <b9405b09da418eb3c65592b53489d7f0dd4093f2.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 23 Jan 2025 14:25:05 +0800
X-Gm-Features: AWEUYZkP14TqYWMXYt98_YoyRL5G3Oss74IUQkNsE40hMbKns2HVZ7v-H1NK9Uk
Message-ID: <CAGXv+5EhG+xnJmYj6kYp2hzgkX62HfxRUJZKc4_X-s09aBMvrA@mail.gmail.com>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for MT8196
To: =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>, 
	=?UTF-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>, 
	=?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>, 
	=?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
	=?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?= <Xiandong.Wang@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "fshao@chromium.org" <fshao@chromium.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	=?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
	=?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_222520_158096_87CD106C 
X-CRM114-Status: GOOD (  24.73  )
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

On Thu, Jan 23, 2025 at 2:11=E2=80=AFPM Paul-pl Chen (=E9=99=B3=E6=9F=8F=E9=
=9C=96)
<Paul-pl.Chen@mediatek.com> wrote:
>
> On Sat, 2025-01-18 at 10:22 +0100, Krzysztof Kozlowski wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > On 14/01/2025 06:49, Paul-pl Chen (=E9=99=B3=E6=9F=8F=E9=9C=96) wrote:
> > > Hi Rob
> > > Thanks for the advice.
> > > The root cause of the erroneous log message is due to missing
> > > power/clock dependencies.
> > > Once the MTK clock/power header file is upstreamed,
> > So this cannot be merged.
> >
> > Decouple dependencies or wait with your submission till depenedncy is
> > applied to *LINUS* tree, not even maintainer. Otherwise this breaks
> > maintainer's tree. I really suggest decoupling.
> >
> > Best regards,
> > Krzysztof
> >
>
> Hi Krzysztof
>
> I hope this email finds you well. I have a couple of questions
> regarding the EXDMA commit patch and decoupling:
>
> 1. Would removing the example from the EXDMA commit patch be sufficient
> to achieve decoupling for EXDMA YAML and MTK clock/power header?
>
> 2. If removing the example from the EXDMA YAML is not allowed, what
> alternative changes could we implement to achieve decoupling?

Just replace the macros in the example with the raw numbers, and
drop the inclusion of the header.

ChenYu

> Thank you for your time and expertise. I appreciate any insights you
> can provide.
>
> Best regards,
>
> Paul
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

