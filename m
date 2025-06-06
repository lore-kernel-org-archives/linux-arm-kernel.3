Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40250C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 02:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RoHiv3adbuz/NM7b0lHqt17ZlxpCuBuKV24AJTxk100=; b=kzbD6KLLeiLuTgQjliyXjhMMG3
	AwPWaAa11g0eKlaTl3qjDLfVfbJb9OHSC3MgEZmcpNswS3hLTA6/AHIM6zhaIQNx/aQ3/leDGRR1F
	9rIzzA+dIqvRK7nA/z/cT6xD6szbjsllRfbHSKPDVt6IbKA8vwPl39vuSNldly0QeegB178P+kXJs
	VlgbFVrV6P0X3xD3AYjjkocmMSQVzjqbzGpoWOHy9ZAN4/uT1Q1FVaUdAx6dJooi0tcwfUO+nk2QK
	FoLPrUnPVTrWKwa7E1rmr4Oq8mD4+hmTBjANbimICpIm7UjbpdK+27uS/Cd9EHmi39y/i0I4pYIbq
	P2e6jCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNMbX-0000000GxNE-0KWz;
	Fri, 06 Jun 2025 02:14:47 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNMWI-0000000GwwA-09zF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 02:09:23 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-311d27eb8bdso1047165a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 19:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749175760; x=1749780560; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RoHiv3adbuz/NM7b0lHqt17ZlxpCuBuKV24AJTxk100=;
        b=b13wu+V1JJCaC5OlW6TT4qcqwrWud7x+K6ejE4temdND0CnMPE8DvUESA3SO+jR5IS
         uJgexZ1MtLOv20v1bmibO+AJoMGjC7NYPSledd//SneEms4wTbUfNZy1AwGN22I9ac9d
         wwmcPi3v5yQ+I/LcXa1YZliuKB8TyKaYs6ixeGORglwKHlItWWKNFMtXrQt4xbE8G0PA
         gn2jVS7vbRFspTnTL+g1hAfYDqFcOyMj0aff1JIUv/4/RM6zGuz/B8IGBCdjWCZKuGhJ
         pxqGjv3K84BFjV7GyfDD/hz9kDWmBskAMfcAXkkHDefsbuLP5C3zCPYMz7F9HgkeZEBu
         FKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749175760; x=1749780560;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RoHiv3adbuz/NM7b0lHqt17ZlxpCuBuKV24AJTxk100=;
        b=Cw2Czi59fMZOZicxAQOje9+DmPnisgB3TzBC+DkKN8VMB+xneoxQcQHgbGFKPmkiOK
         3jflB+xGfswQQxdyBtXu5jVnstq8bSHhF+0bj3bT62PxB0IszUgQwjO2nE7010CwIMGG
         1HGVoaqpY0rfngCFZH2Qvaj0MEBx9Ro2ShUV/4mU4GKzZ+MwTAKDvxTvdi1Fe5P3A0e+
         q0FsIBZnwgPXh16W8sWpVepw/rTD4f7Wv/HDEqLjdJiKZShZi06pkI9GHVC8KEMPLrQA
         89s55h3QNAqLWPc1CXxHNwkFVOtV21nIs2Yue5+yQA5+epuBjQgr6Ro4pRzWWrEKLnvP
         D2RQ==
X-Gm-Message-State: AOJu0YwM7U+T4LHN4XHLOXmQB9H/PQgLnI7UZBHXaUVtdNBdYKiLv1VH
	LBddT+m7Z0XvTIXIp5J9mpV3fGEWQFIxqatYp7pgcWp2r+E1JHCLC3P0tt/OcgCc+WiWv0BGvYL
	Mjb0gnLJKiuZmmbVKOdTLynk3MPcXPtWYglMq
X-Gm-Gg: ASbGncsyC8U4TmE5pNmo1LTu/EtL7y4OlY2QHaoFj/CIBTzNhaPYvdrbYo/2NpFbk1w
	rNLzUGnWKYU0d/xS99xU6NwpJtGvlz/mlxknJP0Syi5U/e3Pi55Sik5pQNYyNNkmNcLwei9axJj
	tmBeale3batBPKfcAKFzHh+YmGwEEdSXcO
X-Google-Smtp-Source: AGHT+IFDyHCxW+B0FoS8D+UNK6O35w/6Hqct4WKi9YFHEOYF77hOsAdH68oGpufpPKYcQxTBdcDG7cyWPn3Om2Doo8M=
X-Received: by 2002:a17:90b:3503:b0:312:639:a06a with SMTP id
 98e67ed59e1d1-313470738f1mr2258026a91.31.1749175760580; Thu, 05 Jun 2025
 19:09:20 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Hopkins <ajhinva@gmail.com>
Date: Thu, 5 Jun 2025 21:09:08 -0500
X-Gm-Features: AX0GCFuwOOw22Vrnmw-XFsJoapzC5-CoU0mehdSAN_fkfD0gyCwjb3I5UhYPdNI
Message-ID: <CANYda2GUFmopw87AargyMMXy9L62y1Nc1gmLkGZ54pDgMYwLmg@mail.gmail.com>
Subject: Bug
To: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_190922_075210_BAC85FDC 
X-CRM114-Status: UNSURE (   4.69  )
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

I am using Ubuntu ARM64 on a Dell XPS laptop. YouTube videos on
FireFox over heats my laptop. On Windows 11 ARM64 it stays cool.
Thanks, Andrew

