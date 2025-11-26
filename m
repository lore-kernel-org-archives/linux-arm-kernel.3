Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ECBD0EE10
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 00:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5PIGTFLdkW4IniYiOexcRvEmMURl8sUXIKPSPYdx5o=; b=wheghTBOSsByHM68W8wuLbe5De
	Eu6QCg2L++ivNSleGFehbqZZYoBw+OGqEdrVb7fqsluW7GMd2ZMiciNjeqv2WKb8sWkiFI5UTgtVy
	b4JQ1bJ3kTgVgeol7/PcAtfVSfBErz7be+AP/ZLatfA3oRI8NMRPN5Cg53QZIYj6OSWS0Q7DDhrkA
	sEe34aBpHfc3vhlhzk2gs3img+xU1HuTvpiP2f4t7CCsOwGqL/twz83ABDn0I4IvDVJqJt6Eu39iv
	Sy5GslgukYrSHIePj834dwPie3HHM5mKzj8VmD7TnMp3N9YzG0W2m0CzDZwXcbIE5LsE1fJGTzBOz
	sU+iXQ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO3WD-0000000E7rA-3Yf1;
	Wed, 26 Nov 2025 00:36:25 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO3WB-0000000E7qd-17jl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 00:36:24 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4ed67a143c5so158321cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 16:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764117381; x=1764722181; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n5PIGTFLdkW4IniYiOexcRvEmMURl8sUXIKPSPYdx5o=;
        b=OUwHloeo0aXRo5tA2yZfl6xLO8X4++tnC6rb8ZyL4LkDH79p6x/zDkcEy77pBlCAKu
         oiuz7AOS4ZIpx8FDM6dbwMaIqBuUiSlemaTp2iLyWPN3Ep/0uWoBLWDrvV8dDV+nA1Xs
         Sl6yQ091Yx0fpe0tR/gCUQCCPJrTMFC1D1o/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764117381; x=1764722181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5PIGTFLdkW4IniYiOexcRvEmMURl8sUXIKPSPYdx5o=;
        b=U0pv6ISyLCcQzAUOdxDx4VXHEH/88DRV6SxqedhVIpTAcN51glSklL6Pq+qQtaS4b4
         xdYqHjCzGW96R7PAlb2MYvG94bMF0Ok83B2hGs05XAp9Tb10UjDwod0JsmB8RGI9fdlg
         VXYVTNQnIReKoZbEaVL6ck36ghwkvBcGGue7R/lNGT41cJwxV1tNXzCZ8HVqgGIzW7uu
         yirpTtBf/Lxu+qMJspmd73EagfLokCKoq5dwjh2VhxH1hoXjZogr/3XGEG225RPGEBB9
         qbbkw9429WNV3+cUTJ9BbfAMf0KOekRH5O3YtrKVhuX+ZmzkzMS+XAvpfbtWgk8KpeC4
         nrLw==
X-Forwarded-Encrypted: i=1; AJvYcCWK4j/XAI7kzMynw6lYkzYeaJ3sE0lzZGdIXwupJyUolfq1HkFGd77GsMKiar/IWgbO/RZgWQwacPqTma3nTl1Q@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpq3GGJiLJ60z7JmnpE/cATGuiObixUj0qME/rYU7BakT8nE9w
	aUyV4S3R1+cgIMy8BuqPaIt4HT9IxVouECbmq6DU1h4ky7e0NzXffeOlUidqHTYQOV6huAYBjyC
	k3fqj8CPukWG8ePX6l3Lu9kBCT/Z+niqvOFhLWjU3
X-Gm-Gg: ASbGnct+3GcHv6z52oxaVobw+0bg7CocdjUdCvsYhqO8PJ8IhaiFn+/TjZvw63jvznr
	GkYTaPNjvxZBStcyidenZneHBBFmDMbZ0shjFrWsz04hcZEPqwyNzlH7ToRz3+VYN2zITomphu9
	I6dBeytE+KSHMwE8Gg4nRu/kpb3jj2H85oN+z9iReCM4/tJup1f8liogIUKB2v8YJqx/yV4BNHw
	rB9nRZTMnIjw4xGkyvGT7k4qT7/5/3UBK1hGJftamIaQ4NVsovOBFLLwk/KMlUyMWneSdE=
X-Google-Smtp-Source: AGHT+IGP6oX1F/D2CxJOatUpgvnDhypTahl/TVp41rMeFMAZHUR682n0RVM907rgexwTnBhQMCJvipynTviLMfsb/Ok=
X-Received: by 2002:ac8:580e:0:b0:4b7:a72f:55d9 with SMTP id
 d75a77b69052e-4efc83b0345mr1017551cf.13.1764117380805; Tue, 25 Nov 2025
 16:36:20 -0800 (PST)
MIME-Version: 1.0
References: <20251125064851.3781993-1-wenst@chromium.org> <20251125-outgoing-boisterous-millipede-6dabaf@kuoka>
 <CAGXv+5FPaJMuN7wCP7g0Rxa0mXD3Ru0rxka=m8B_rv+XUkJPWA@mail.gmail.com> <25ee55eb-91d6-4da2-a798-b704acfae4fe@kernel.org>
In-Reply-To: <25ee55eb-91d6-4da2-a798-b704acfae4fe@kernel.org>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 25 Nov 2025 16:36:07 -0800
X-Gm-Features: AWmQ_bkYsZKnR0Rl94iSzfQ_dAjBcO2VNFs_DTYgpRBgQH_dr4_09XaXBAvsBPc
Message-ID: <CAODwPW_LfeC7UFnDMxJFfKCFBoGBvu2O6S=otD0Sj7ssOSJVgw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: firmware: coreboot: Convert to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Julius Werner <jwerner@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_163623_436963_2B31E285 
X-CRM114-Status: GOOD (  28.34  )
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

> >>> +title: COREBOOT firmware information
> >>
> >> Coreboot
> >
> > OK. Side note, coreboot is stylized in all lowercase letters.
> > Should I follow that or just use standard English rules?
>
> Just choose one. Here was capitals, but in description not. Preferably
> Coreboot or coreboot

coreboot should always be written all lowercase, even at the start of
a sentence (i.e. "...bookkeeping structures to the kernel. coreboot's
FIT image payload can insert..."). Not sure why I wrote it in caps in
the heading here, that was never really correct, not even back then.

> >>> +  The device tree node to communicate the location of coreboot's
> >>> +  memory-resident bookkeeping structures to the kernel. Coreboot's
> >>> +  FIT image payload can insert the node into the device tree. If a

nit: Not really sure what "coreboot's FIT image payload" is supposed
to be? Do you mean "coreboot's FIT image code"? (The file is just
called fit_payload.c because the FIT image takes the place of the
usual coreboot payload, but the code that does the device tree
stitching itself is still coreboot proper.) To make the point you're
trying to make here, why not just say: "This node may be inserted
either by coreboot itself or by a second-stage bootloader (a coreboot
"payload"), depending on where the kernel device tree is finalized."

> >>> +        /* Firmware actually emits "coreboot" node without unit name */
> >>> +        coreboot@fdfea000 {
> >>> +            compatible = "coreboot";
> >>> +            reg = <0xfdfea000 0x264>, <0xfdfea000 0x16000>;
> >>
> >> That's the same address in both places, so the same one entry. You need
> >> two distinctive addresses or binding needs changes to have only one item
> >> as well.
> >
> > The description does mention that the latter block can include the
> > former. It's really up to the firmware. If you like I can include
> > two examples to cover both cases.
>
> Lovely, I don't think we should accept growing this binding at all until
> coreboot fixes this mess (duplicated entry and missing unit address).

As Chen-Yu said, the second region usually contains the first. It is
possible (in fact tends to be common on many platforms, because the
coreboot table is often the last region added to the downward-growing
CBMEM) for the start addresses to match. That is not an error or a
"duplicate", they're still describing two different things.

We can start adding the @<address> part if you want but it hasn't
really been relevant in practice since there will always be only one
coreboot in the system anyway. As far as I understand, node names are
just informational in the device tree and the compatible string is
what identifies the actual binding. Since bootloaders on older
platforms often don't get updated, it is probably still a good idea to
 mention that in a comment like Chen-Yu did here even if we change it.

