Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36940F4643F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8msOfxeowllRcJq32bZpSujfByu+DcMa2B+qOK1z6c=; b=eaC379SJClgez1jYBAVt4JUghQ
	AkQLRHJrLstgqa6Kfk52SIdH3HeH0HOCWjl6F0ORmGWDuMuvFfTP0MnRYYyzpglAbSI55wzoK/lBR
	eVELzqFj7Cw6WxmrXJugS90UwKCUHDapNg7V3rg9Gh9BHygKGt5ZxzSFzte5M0pXrOrL1Nw8zSuTr
	QvBDiNOjTA9A7yhWqjmiAdsvXc7oCuOMEL/0H+wZyia4ucX3QdF33C08/Hcxui2UjZMWEhkjxIEz9
	CV4oYD+2my7x+2iMjDgEKfI7q0YHrvc1VeohdAOx0ekpfw51NV457loJIGZrjowSaho2+qWbaGXO7
	V7uXzZ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24Rn-00000003fKk-2CPy;
	Mon, 16 Mar 2026 09:41:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24Rm-00000003fJF-2eeV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 09:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Z8msOfxeowllRcJq32bZpSujfByu+DcMa2B+qOK1z6c=; b=cmu45gq3haRQT4xSYiY8Ms1bSR
	XX1xz6iNRwvzqVFVDlkQprL4SZjLWr7ZAabp/u8tEXbWRAPn8MewHuG/xK4ljT5RAttF1uMQLzlh7
	ar1Z2tCYY3+aPiiWJ3pmBcQ2TivvMR84wV5jPvOHU4+x40qqwZJbivaHj7yscevwe2Evf+Z4pu696
	12M0mWaVBSjuunGjOpW58DE/n3vmhdACJhClsVRPxKrvsY9iAABi1LYmDSA8/eID1vXdX9dWf65+4
	JdlPgg2kOxWwbZuEwa3w2goVGIAV3LWcA1WvtEda8TfT97ADNRLM5MtgIYmBodj8vI9G1KgIpet0Y
	lZnQ965Q==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24Rj-00000006OeH-2eoY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:41:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF45A4425A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAB0C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773654066;
	bh=Z8msOfxeowllRcJq32bZpSujfByu+DcMa2B+qOK1z6c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FvQ9/GKcDqmGgAAoj077c1EfOGahXoK21ZWGDM8QElN4LpnNTYOL/79aWdo1ocCNY
	 O4q0TAWCYbxe5zd/TFjruAxbPxv8bqde+79DWLjmz1WA1/+TJK/F5bjhtNKyn+GOiM
	 h6Gw9962LjAHSeqpxD9KGWF1iYJHowE4y6ndlSbKv8stNc57gaEeOG7mgqIKuD9cnB
	 J4Ws5u2lcwhh6cTFi/yd0APiFFeGeyefn33EZ4B9AXQzfVvqRb6zm5gWY8sW6C+Ebt
	 zmH0FW7rEWg4agRa8YZEVD8wQX2AFSjZ1s6zaFay3csxXCPFbo8nYoebmLH8zKzFwh
	 wM9Wkp/CH9UYQ==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79a5a37113aso2095117b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 02:41:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJ0IDDxWeF5OInglt4vr0Dnu2XT8C5F57kZKOSft3S3Q2KxaQujv79Ju5aKW2tCBvL0SDhCeI4Uzm5b0V+ZBCk@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc89cyaINJ7MhtR5nokJiOlx/A0tk290utJXQaC/FeDwb3zKAi
	yV4O0lGgU/Jc6PGOMk25+7IKoDTd5Tp6o1pW6VZrVF4VDhirSjBzmqj1tkFx/IMEBrVv2OpbNKY
	BaXBzIs+6BHLcg63mgooXVURMZQJEqH8=
X-Received: by 2002:a05:690c:1c:b0:798:34a:52de with SMTP id
 00721157ae682-79a1c1ddd0fmr123816337b3.51.1773654066057; Mon, 16 Mar 2026
 02:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
In-Reply-To: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:40:55 +0100
X-Gmail-Original-Message-ID: <CAD++jLkNdc+jc2+c_ageDAbw7ASCDf+6CKTaU4nMt68LhpuB5Q@mail.gmail.com>
X-Gm-Features: AaiRm51CGq6AEM0GTX8yXQmjUc1clr3otpnO-iyM1eZa4K5fUJagwOZsjTiiBjY
Message-ID: <CAD++jLkNdc+jc2+c_ageDAbw7ASCDf+6CKTaU4nMt68LhpuB5Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] pinctrl: Add generic pinctrl for board-level mux chips
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_094111_965485_AD833B14 
X-CRM114-Status: UNSURE (   9.60  )
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

On Wed, Mar 11, 2026 at 8:08=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Add a generic pinctrl binding for board-level pinmux chips that are
> controlled through the multiplexer subsystem.

I really like this version, I had a minor comment on refactoring the
generic helper instead of wrapping it (plus some random ramblings
from my side, sorry). With this fixed I feel I can apply v4.

Yours,
Linus Walleij

