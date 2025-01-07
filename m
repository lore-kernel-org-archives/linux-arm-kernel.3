Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48878E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 22:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhhOsxIrAZXRQSyguOLlB0hClyT00aHuDw3Nc1/4jp8=; b=tZ4110zaOhSs28eVDgmG6cY8Bl
	EXeVig1JelDKKTSGrNpZbYmZFxv/+82wJyLg1ASqKVHBX6OPrBOuQtqYMh958nCDz3fuS9jiG4l1g
	FsmY3MI9JrIeD+H18QbZ/Y44MhEpLXUMGkIxPAmqXeqK++1b5+80yiVQgLcMU/8Qh7zs9PaeseIF1
	0VECkgxRGrgiEtcjx2R02/BoMNcewiRAjmthU6JDlSsMicqWk900yoPehsrcCMV3LLlkt0dVOUMXl
	Ppp31EzEWU7b9fBrURNAAXqa82MbygoR6WEbBOB7p6dGkqGhFa9Gd8wjNvoLECQF9b52rQxyIWAhl
	Mp3eqPLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIMz-00000006S9c-1iY4;
	Tue, 07 Jan 2025 22:48:17 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVILk-00000006S3L-23p8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 22:47:02 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so23620975a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 14:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736290019; x=1736894819; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VhhOsxIrAZXRQSyguOLlB0hClyT00aHuDw3Nc1/4jp8=;
        b=AlX8lpg2EQAhsJ0bnof4Mk1VD4pKtrQU459r/IfsrFZOH6yYeIjyo9sQYtNtM3oGyg
         VIOqjZ3CUFhNFX1gIgmuK94WAHYqFbVzHeFU70OxyV3huPn8O3KqCtHS0a1Y04kYtvsk
         hauPQVmjxHEGBFWWAYgcepEqhBBAICs+E0fkSEgfXaI9p4wjkiVHUidZ5IvQeL+Ybm5Z
         QbcQ3/eIvHItVUrkRjMhRk98nTA0wQcGddbubhe6wW0EQxpqTSr3m0oUe00NaYO3DKAX
         bJ0pgRqlKCy7utzL2q+HB2WvXJn9F2D+iwl0zZsIxgit0fqDWUg8/EkFVtwAKX0+7T/+
         Unlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736290019; x=1736894819;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VhhOsxIrAZXRQSyguOLlB0hClyT00aHuDw3Nc1/4jp8=;
        b=Q7SBUnR/QCyo/GNQROKtFBJV/fMjwR8d4rhqivZLJCM6RMPZDkmq/HN0OVn42nrevT
         hRzFcimb50p9Cmbb40w2xkaZXNEJwCkrm1hn+CQg99uNy7sdLyfpOcCk44eGIQFooi2m
         k4DAHshNlip2l+it7SuAsjsbnKdmo6jc8xEtV+wB8Fh5Vxgw4xvu28hFAKmKp8Gc5CtW
         NfJpg4nGs8Dur/Vb0Chy7z5js4X0IT5GWi3KaTSVYIs/nU3cejEukMc9TeohbLX8kZpq
         70/Ff/F1rLPKS8V+jN8ZkuWLzt9IbT7cAtE8YwS/pqN/isV3ydu4nc1Ac4uyrAPToh/9
         FsSA==
X-Forwarded-Encrypted: i=1; AJvYcCV9q/H0LuAXhLXc/2aKAhBlJ6t3MMda3uZQCS6TfjOdd4G0chA77uiJ/Em1ER+9fZidTo+S9Eu4OT8+GYhqWVq/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1/zSJ6/FFvtH2VGeIs+7ud6DcU3nhekYDn/dkt5fucvE3D1dM
	7Y9MrgiCnzV8Bl4GGEE102befTQpuFQzchgUBQqlqeSa8ICoC0M6unSXt378LL8=
X-Gm-Gg: ASbGncsiJGtOT5JcBw7TDT8fK68+T/G94LYJglXETn+krEQ26IUl4vx7IhcU4M1bwNH
	F+P3guTOaG2a3nHoP9tn6Y2U+0rrwJaEOP9fT3LL0V1ocddV7bBlPqzn8owv1wf9HzmneBqMoGc
	J/o+9H4UgKuc1q42jfzZtp+FcQcpKC1UJMZtOObZeur+M2QH4xIkUmxCG8TYmT4OqlO509kVn6T
	wGmd5NOqgF1iysZrIeofUKV9UOquxQn04qRqeKWT1gmlL0brKTxDu8=
X-Google-Smtp-Source: AGHT+IEWLZ0aAO0tFLvsOPBDQKKeuyqMuH4W0nT1NxPlNJruhvsUZ/Ykoi06+2HvkLi5ZyYOcU4+/g==
X-Received: by 2002:a17:90b:4c8d:b0:2ee:5edc:489 with SMTP id 98e67ed59e1d1-2f548f5ed6cmr824480a91.26.1736290019527;
        Tue, 07 Jan 2025 14:46:59 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a2df0b3sm49805a91.42.2025.01.07.14.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 14:46:59 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Nishanth Menon <nm@ti.com>
Cc: devicetree@vger.kernel.org, Romain Naour <romain.naour@smile.fr>,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 kristo@kernel.org, vigneshr@ti.com, Romain Naour <romain.naour@skf.com>,
 afd@ti.com, s-vadapalli@ti.com
Subject: Re: [PATCHv3 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
In-Reply-To: <20250103212528.enq4ur5afxhwzh7n@outdoors>
References: <20241202143331.126800-1-romain.naour@smile.fr>
 <173344002250.407600.8303166891165540615.b4-ty@baylibre.com>
 <20250103212528.enq4ur5afxhwzh7n@outdoors>
Date: Tue, 07 Jan 2025 14:46:58 -0800
Message-ID: <7hr05eb5st.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_144700_692870_F1922EC6 
X-CRM114-Status: GOOD (  15.78  )
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

Nishanth Menon <nm@ti.com> writes:

> On 15:07-20241205, Kevin Hilman wrote:
>> 
>> On Mon, 02 Dec 2024 15:33:30 +0100, Romain Naour wrote:
>> > The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
>> > SoC are used to drive the reference clock to the PCIe Endpoint device via
>> > the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
>> > obtain the regmap for the ACSPCIE_CTRL register within the System
>> > Controller device-tree node in order to enable the PAD IO Buffers.
>> > 
>> > The Technical Reference Manual for J721e SoC with details of the
>> > ASCPCIE_CTRL registers is available at:
>> > https://www.ti.com/lit/zip/spruil1
>> > 
>> > [...]
>> 
>> Applied, thanks!
>> 
>> [1/2] dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible
>>       commit: d8efc0b428856137608ffcbb6994da6041c9fe2a
>> [2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
>>       commit: 1d5e14a20dc60b440c60bec8489acfd45cdf7508
>> 
>> Best regards,
>> -- 
>> Kevin Hilman <khilman@baylibre.com>
>> 
> This will need a bit of fixup - See along the lines of the following.
> Additionally, we should be a bit careful about the dependency of dts
> mix up from two trees.

sorry, these should be going through your tree in the first place.  They
are now dropped from my tree, please go ahead and take them along with
Andrews fixup.  Sorry for complicating things.

Kevin

