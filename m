Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F4BFC9EC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 23:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4xsdr2SOXxaVwr7h1gBMDOwXdTrlnqc/oGBb97215A=; b=LhH5ZYp07QDQt5l8bfv2N4wKnF
	/CsI1+7oNfYgmS7x6kstdYhAqZfJT9duqOSwohwiCPf1QSlZHJphxpvaC4U36Xc7um+r+rVvhXucz
	uQkGfZOM/bWbKpnr2nEK/LQslm6AGskpSazGarDbc7r6I/UUhM1GZ6dLAPOEE+XnW9pAi/iwclGoF
	kVxt7riW5ABzJ+pMQb5UAlNZ3GRiq08yM7dcnZtJ4PoEf5mMgTA0fHMOrd7sDqmGZIaI85FkWBwDu
	o2pTYH8Ynxni/Ou2+No+FO0dzrShpP8itA97b5kT8Danv6db+E+nU+zLNwwabaRr4Fe2IxVre+eCr
	lBZFD9AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyesM-00000004fzY-2k1D;
	Fri, 06 Mar 2026 23:46:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyesL-00000004fyt-26HI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 23:46:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9190760053
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Mar 2026 23:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4602BC2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Mar 2026 23:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772840792;
	bh=V4xsdr2SOXxaVwr7h1gBMDOwXdTrlnqc/oGBb97215A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l0h7AZaluenLH656OAETKKyXCSFDSTj1tVnm4Hh15YNg3sXwVkLgjEjOCluh82ZP8
	 WnNLYMQrH+UNS/E4LG7GDj7njbm+ewuTqyP4n1aQ/FQUyKuRxhCwFJd5T+0+rH0/M+
	 WE2FTfs8G3AQ3yDB2BN4ZKRG6aAbgMxA+0/SKY+ujFHAmkYUDXJM1glAhTzjMnif+3
	 lQMaoPrbqwlFvGxEmEb5oFMHErrhTGp9O8lKfDglBdkELxhjYLssUsulAj2Flr31Hc
	 aygTJrpLYYnQiEyXYuf7iUhBzcHLfLuoHnrEuQyxl9T841UuftX9biKXgGPqDrIBw2
	 DDLwUY8eCjERQ==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b940a00415cso341798666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 15:46:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW8tv+RLJIJHP8L7ztgfzfjKxhT4V/tO4D1oYJAt5H7eJWBSYrWzkdbcK2OsogJTxO++ocrcQPWpG7K+VGTPYnI@lists.infradead.org
X-Gm-Message-State: AOJu0YxVt082NHLiJDGCPyi+PPq9RVFLVnuMYS8/NoURCeArq0+dTfrW
	+mGoZm82eKnfKNkwu/KRvI+p3gPfnUn1IGSYVx6WYtvt/e64OMg8FHtWtJ9o2HbH97RTF2wORae
	+ARWaTSUgelDzcziKbW2ZAcpLapaa3A==
X-Received: by 2002:a17:907:3f20:b0:b73:8639:cd96 with SMTP id
 a640c23a62f3a-b942dbdfbd6mr216720866b.24.1772840790779; Fri, 06 Mar 2026
 15:46:30 -0800 (PST)
MIME-Version: 1.0
References: <20260122165923.2316510-1-enachman@marvell.com>
 <20260122165923.2316510-2-enachman@marvell.com> <87ms0qfd8h.fsf@BLaptop.bootlin.com>
In-Reply-To: <87ms0qfd8h.fsf@BLaptop.bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 6 Mar 2026 17:46:19 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJn87FdJmh=4phLL+DRQk8dz1iJE7=43f-ObFpEPpB_Dw@mail.gmail.com>
X-Gm-Features: AaiRm50LdTsH2jqP9SzcYIinwhDACMAbrvfuHG6zjOqjPZa8N3B-Nx1hio6ZK-c
Message-ID: <CAL_JsqJn87FdJmh=4phLL+DRQk8dz1iJE7=43f-ObFpEPpB_Dw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm64: add Marvell 7k COMe boards
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Elad Nachman <enachman@marvell.com>, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, andrew@lunn.ch, sebastian.hesselbarth@gmail.com, 
	pali@kernel.org, mrkiko.rs@gmail.com, chris.packham@alliedtelesis.co.nz, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Mar 2, 2026 at 9:44=E2=80=AFAM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:
>
> Elad Nachman <enachman@marvell.com> writes:
>
> > From: Elad Nachman <enachman@marvell.com>
> >
> > Add dt bindings for:
> > Armada 7020 COM Express CPU module
> > Falcon DB-98CX85x0 COM Express type 7 Carrier board
> > Falcon DB-98CX85x0 COM Express type 7 Carrier board
> > with an Armada 7020 COM Express CPU module
> >
> > Signed-off-by: Elad Nachman <enachman@marvell.com>
>
> Applied on mvebu/dt64

It seems the .dts files are in 7.0 and the binding is only in next.
The binding needs to go into 7.0 too.

Please pay attention to the warnings. There are only 19 (unique ones)
left for marvell since I fixed most of them.

Rob

