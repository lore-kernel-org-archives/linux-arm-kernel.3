Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9704DEA8550
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbslF3ayhf5j57yOSEHBy8h3Ekscc5WaKLdzlOVhmKM=; b=W+vjjjOMdFddxU
	1PbOUJQ6/fGVRUHIbNWmn79MNZ/oXyKxVa09dSD6ukzf+YplT5pADCRUYtae84H4WT/aQb0vpHdAI
	hqy6YuHhwT+3NTevUMawsxoMEb0PpeHJDKHmB7GFK9FQ9qYEwdin1jkp8V88H9XiG1zRFsB4TTLdq
	GqK6JvYxOkUFb0jTsrCV0tiUH3SdVHYsrC44ZiScZ+H3sXIohCIm4EsO6wMRS0RjhePXWCz3sIZ2N
	43ic6LSOauGiQ9F7eUpAJk27xaJb2HR6sa9r8gw1HNGbKEAypo+sO+TGONyQT+Z88Vm5qoDQlsLLL
	soP93Fdyy56xEY6FKmHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztSl-000000096WC-1WOX;
	Tue, 10 Mar 2026 09:33:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztSj-000000096W5-47LW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:33:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 57E9960130
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 09:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A3BC2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 09:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773135192;
	bh=iJrlNVsjh6+70Ec05z6rXG0svXgiagQ0oIi5LjzykKg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=KE80/p/KUIZZ0m7i/OIN43aBTaEeymRBmw0M6WAtsm4CddJyu6nn4tSPfT2/7FiBZ
	 VFPj8QNK4E02O7q/2/SlWu33xsm7/CFxdA6fI9rFAD095OwGBGSlkjkTfoMcEmd7Oh
	 Yl2fKpC5Z67Zc6JouVMQaZUCgUZapXYbhdS5Fan+jT3GEnIjNyt2buK2SVTsHoPEFn
	 P+DAd3fSZ+QFLK+kxmiFqv+fly1pMLuv2BUxWPX7HNWkvV43CkBu8OydVQ4BzbABKI
	 bg47oniWxm1db2FiSb2qkr7aEziiA2m5wvfkxwhK9M17HDyMiIa++d+pBaMU8VZWWp
	 B8GXp3pFeOn/Q==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a2a59baa6so54208351fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 02:33:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRhl4riY2fSIV7mkR9oRFmIqS/1y5viImF6zl+qoHzILXDIdIPbAHw8MuFcHQoBCURZE+MZqBkoUtRi42hRZ3t@lists.infradead.org
X-Gm-Message-State: AOJu0YxyHIAmUmuTJxI/1zzn58/HLyN/c4XdvG5x3/upKh0z5q64Gv5o
	RnmBR9l5K5HwjTqk1QOhyCpoL1y6NPjcGxZ4TcGzgiZ2QiOv1JEWg1oP36eVrmERLu2viwtYrHF
	vUGrhHUGYE2caiAE2Tplff0V0Yo+2laM=
X-Received: by 2002:a2e:bd82:0:b0:387:20:bdbc with SMTP id 38308e7fff4ca-38a40d61d78mr46199441fa.12.1773135191017;
 Tue, 10 Mar 2026 02:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com> <20260310075539.11701-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260310075539.11701-4-wsa+renesas@sang-engineering.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Mar 2026 17:32:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v65gV+2xZDO7h9Dsx=iOHX6Jt_JyHTOeWRYaEMuC+jR1FA@mail.gmail.com>
X-Gm-Features: AaiRm51CffgMBtgWhMZCUpMdeeAdI463XBf8sQip2RO0V2c7exzECk92c7gy0OY
Message-ID: <CAGb2v65gV+2xZDO7h9Dsx=iOHX6Jt_JyHTOeWRYaEMuC+jR1FA@mail.gmail.com>
Subject: Re: [PATCH v4 03/15] hwspinlock: add helpers to retrieve core data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Wilken Gottwalt <wilken.gottwalt@posteo.net>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2026 at 3:56=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This is a first step to hide internal core structs from hwspinlock
> providers. It adds helper functions to retrieve the data needed by them.
> Because all users are only within the hwspinlock subsystem and the
> change there is trivial, conversion is included in this patch as well.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/hwspinlock/hwspinlock_core.c  | 12 ++++++++++++
>  drivers/hwspinlock/omap_hwspinlock.c  |  4 ++--
>  drivers/hwspinlock/qcom_hwspinlock.c  | 11 ++++++-----
>  drivers/hwspinlock/sprd_hwspinlock.c  |  6 +++---
>  drivers/hwspinlock/stm32_hwspinlock.c |  4 ++--

>  drivers/hwspinlock/sun6i_hwspinlock.c |  4 ++--

Acked-by: Chen-Yu Tsai <wens@kernel.org> # sun6i

