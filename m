Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F22C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRnTE+sfqNi4P4NSTy/kqSXlrErtvnHm1QlBxXoiDG4=; b=X366uZVa8aMxa6iTHgMXQyY2p8
	Pb4LK1yAGCxjRhvMAyWmvRTaFSnPBASosjiJmoaBykl75fd+CY3zsbxV8k2/mIl332bThn2rC2dHr
	iuS9nFploWfzrzrGyMsU2TLO6ZjUz5Eic80E/sSqykpJIjR64WUn1+IdQrISlO+sQpg5P51jPk8fy
	elLUqEtodZUktIVaH5UKz3cIRK/YXnk4xb11sEr0+vwXOrTp+ns/5y6DbW9gYlutFZnP6Yl3BUIbd
	g4djg9a/OuzfNMAE9jEGc89TAwyF6bmksmXxo+dVTKrpzzGrN3bgxe6pkFZ107jqlZrpwkZw4qWIm
	rm1yIDTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcid-00000006uLD-0SV3;
	Fri, 03 Jul 2026 12:10:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcib-00000006uKO-1pe1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:10:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A731D600E1
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 12:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2881F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 12:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783080604;
	bh=FRnTE+sfqNi4P4NSTy/kqSXlrErtvnHm1QlBxXoiDG4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=R5EQi/XUeS15y7qKoAb3iyfRNON/HfPCXUy4TXekpkz50HKLNuxkqfKMtIacIPCj2
	 excH/UeAK7lKnCYiE7kk/ZGc1Jfdv4I7p7pz/KRc++S0aaGZcMMiQLjOLAiJOjGnft
	 WMtcYRr9SpfVqjeoJajNQ/rtXF8WYtixMqYLReWDkKRvSDsn0G4NEMqd2rcm7GxCeW
	 4I4Nd6FfGuJ0Rx/EhdyECwnNkB7IuIcqDASN9jsbcVfNYBfIt1QxTQKalBynI+NzXm
	 +gC1za7Gwuqlvy4P/sjLjFDhyho2uKcKCsSlqjXvXaKuMVevHXQehOOSdPTahIYEnd
	 giIul7JI8B9WQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39b27812c96so4373601fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 05:10:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqgnni+hX0iPuhoSv3VtdEVRmYwNUjA/BiFe6u4/DOrHyIEcJ+2TXhf4Mf4QXJDs9bTxFjDM2t02AiibNEoiKW3@lists.infradead.org
X-Gm-Message-State: AOJu0YwWaUc35jpdrj9dSPFH06jzyKcef1pQEYtIjfsXCrBhKHOX4Zqy
	2ZU7g8ZZRXkP/pQlV3SgTvCn4yQMBNLys+JEaeVeOaEDOw0zuynsqnckrlCm1shCmQg+filM0/l
	mPWyr58rK2LsMmfnx8t+M0KlYkIgzSbYiuTzmaSuo3w==
X-Received: by 2002:a2e:b538:0:b0:39b:2b9c:5447 with SMTP id
 38308e7fff4ca-39b33f83e54mr14578471fa.5.1783080603058; Fri, 03 Jul 2026
 05:10:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 07:09:59 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 07:09:59 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703110317.1283411-6-wenst@chromium.org>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-6-wenst@chromium.org>
Date: Fri, 3 Jul 2026 07:09:59 -0500
X-Gmail-Original-Message-ID: <CAMRc=MddJrLT1f62-MCoKQ3ZzchHRypXF0njO0K1Fgxmpv4BGQ@mail.gmail.com>
X-Gm-Features: AVVi8CcIrznNQZqmZR1andR36KwnRtt161WRtINBstw2LlkWAj-ZsW0prqZIcwI
Message-ID: <CAMRc=MddJrLT1f62-MCoKQ3ZzchHRypXF0njO0K1Fgxmpv4BGQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] usb: hub: Associate port@ fwnode with USB port device
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 3 Jul 2026 13:03:06 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> When a USB hub port is connected to a connector in a firmware node
> graph, the port itself has a node in the graph.
>
> Associate the port's firmware node with the USB port's device,
> usb_port::dev. This is used in later changes for the M.2 slot power
> sequencing provider to match against the requesting port.
>
> To avoid potential conflicts with ACPI firmware nodes and then causing
> power management issues, only assign the firmware node if the hub's
> firmware node is not an ACPI firmware node.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

