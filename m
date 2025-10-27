Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F259CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 17:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZ+9YzWy2jl/tRxo90fB2UylD3lSKVjcqVAde7Bc1U4=; b=4wJv55Fn68Qtqe
	bzvKch9TvYK2QNjaXiWcjmJY5R6NimPJ2gI2X3XuF/Rc++REIAaddjQ4Ysk4UgwSbYPI1vG2msa/w
	u5JCzRf4Yfl72P56B7XL9duQ5PVTmBiiKfTgoitaqty16ArFZNcVzK15V5FZ9DL1y42xJXpIdAJvR
	SpBQtGr/MrtNXLYbFvH0YHL9f4rEYuZR1ClWVlKy+FIDjuGCFsODfmLnWnyuwCR8AMpb330jTjVob
	7StI+RSTrDXmPE9iIPkUviGkGz3l7Vu3ZcHeTc/3nqzRufK2rSVl6sJF7gWN5PoEfHBsmydFJQ9/E
	gKATDyOeL8mjykJ4mwtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQoS-0000000EQK1-11tN;
	Mon, 27 Oct 2025 17:15:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQoO-0000000EQHl-132I
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 17:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=EZ+9YzWy2jl/tRxo90fB2UylD3lSKVjcqVAde7Bc1U4=; b=lOadlz9oF09KtwSDbSQqVsnm6+
	K1wIK1PklKgbybH3eVtt9Q/MzYA1yM6nhBCbjfoSf8gzetoz0QBj0QFY2ANroDeyGniUz9OPb8bJd
	lW/tOS2BqocoviPlMj1D+gITCgECIA4Jfqofg07L7SL80Dw4yT0z50OcaSFmtd2ES/2V/LJya77jf
	vb5MDFHudo3eRbrca7qPcYx5ezz/Q3uCshWDKPabT2P3LVM8mdTafo6y05ha22stXDPEg7Nz29fIJ
	/8y7CwbBnGT3BYeQM1x6WNtQ5bAgHAUfy9uFfy2M2yROeBdbwbQwsGDJAtup85MzJcYVTfetwrGeC
	HbygPrMg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPwb-00000002eyp-1U8k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 16:19:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A813A45F28
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 17:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C67C19423
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 17:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761585311;
	bh=n10NlR5AQZVuyebRk7B2SUL8HffpvVGuK0dPunXc6Is=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=HqZr+eK4r0DzyGqvmeYi5mqxzyyqHWBykNMpoMfE03X5z6pt5O8eOzMRYd9U8ZUQh
	 eYITan5jDOYW+kPveVqXTdkK4/68+CF7oh5DF96MzpETlIk0uh4aLwwmhsahp6rIJn
	 hb9MZzElerUW3qdZGtZinkVPXmRKFFox7+oXIB2S4M/pqJ4Ql57IqzMoKRgUaT6FkK
	 jOYZyLvn00EyjpiJgUwyHOibmTJxoa1uwMGwn7D4dhkQA2/m62ejGggHXJUpSlXPII
	 kuefpXpMvSLts30670r1p/D5DybsVniH/C5X0jaqa2xC7Rx2pLw3QgoPR/rDlC8ft3
	 9Jha6fJS1+a+A==
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-430e182727dso21456785ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 10:15:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpq5BST0vNFrGCi4iUEAJWIaGu6Eq9jQ6sKyZqDH3hxRTvBNo+lTbNBG8FgKEK4X0N1Sm02xyNsePy5P9+/0sA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc/fadofXYSXZ8vvnOOb+mwROCqKPqkv39FZBV1bNFAwyJkIh7
	70kosaZPeO7mv0JIbP5PeCp7xikk7gUITibX/35ApMjFr6B2mCRLmkoUbCqWeEQq/W1s309RjMi
	gP29OTjgqI5f2xUku5s84LdB+Fk3Y0XA=
X-Google-Smtp-Source: AGHT+IHX7Cu0cAsXytC3RTDyLGsbQ6D3nuir1yy3lnzLJPUDYwnFPuEpRZmXHsx20REcyJQHIoGh74zShF/YlLRFw2s=
X-Received: by 2002:a05:6e02:1686:b0:430:a4ba:d098 with SMTP id
 e9e14a558f8ab-4320f6e72b5mr13684325ab.14.1761585309545; Mon, 27 Oct 2025
 10:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-14-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-14-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 01:14:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v654iKx+2_GrFAJYF0VGXSd=ssxE6UYpN3jSAspEC9t3LQ@mail.gmail.com>
X-Gm-Features: AWmQ_bldcoQqUG3m9k_m37cYhHNBmzCyQWdekxIPdWuxn4IqUUTfMQc9GRDtYCo
Message-ID: <CAGb2v654iKx+2_GrFAJYF0VGXSd=ssxE6UYpN3jSAspEC9t3LQ@mail.gmail.com>
Subject: Re: [PATCH 13/30] drm/sun4i: de2/de3: Move plane type determination
 to mixer
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_161941_606686_6F981FEB 
X-CRM114-Status: UNSURE (   7.95  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Plane type determination logic inside layer init functions doesn't allow
> index register to be repurposed to plane sequence, which it almost is.
>
> So move out the logic to mixer, which allows furter rework for DE33

                                               ^ further

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

