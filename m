Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DED9F89251
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 11:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9s8/6CxAimRxSBzycRWJAays1e9oC2blAl7hbQ4gthM=; b=BYa6c5OP1LabInFbASJCX6p0jR
	OCXBL8DkjG+DfvpS978fHbfXBUOc6hsqjar8MLi/mPzhrssLDmU1cWTxXn6IC4N69iqYwboUboFmg
	IC3hkNzQfX9jP4osvvCNbpY0z8AUaEQuER0rx8sOfpEorXAdk1Gcg8k0RKK0IYkkHHLVF71Lg/KG/
	NQMczhl/SxDcfPDXsGHwDedbqjucbrahVRURdlY+M7JtSi00zCbFRIigAYFsM2lw1O5ymWw4dqrVB
	CUZASNbu8ZED7E0xWNu2BLaw2MFhJz6zmlYDsqyMbtq+cF+1b/dKV7ZTHfkhOPd+xiXMxtooJZOdI
	R4Lijxdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9Av-00000008VcC-23re;
	Tue, 21 Apr 2026 11:21:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9Au-00000008Vbc-0d55
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 11:21:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42AF860141
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 11:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC61C2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 11:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776770511;
	bh=9s8/6CxAimRxSBzycRWJAays1e9oC2blAl7hbQ4gthM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eCWAgGob4ru5rmVKZXHGN1rgp4N4E29mvj8oML1mkerMFOyh/gje8QrwIPevd7vxh
	 vRyyOiOAGniq0SdA9lhCW95uraysEJunixqCPH6i3gPPCNtudkbd+AKlhWVt1LE616
	 vrab/W6qIPVIeuh4KXr/Yugar73d23YBT10dmiCff+Zq1RmFH/OGCJxiQVEbLxYzie
	 /nHUA5tR+n5tDuSzj1eA0BpmSXywBt+WH6LE6v5goohNVANcRvVYaaL6EDPjGP5Yd7
	 p8+YzHXHEHrtYUdAAIMQMQxcJCEFtrp/a1fapgaiH61szJhKXLWAHbjfvT6wJacelC
	 2jwlsNFOU7iCg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so5427099e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 04:21:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+kPfAlE/s1CDyy9NYxIFBJXAz1PRJ9zk+34jXuiCjvhM55vr2MPGTqF2hmv/cucbGAVSVxMxbt25E3HiUoj11Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzVl1dQ4U2fwSFBWg9puRON4WBJ1HYBasvIKE/MSlI6SH48Gw9K
	3DQHwwK0q2sB9ynwkd3uRXqPO9IRaLuMm5v/EV04tX4ECyYgE2b6hm4E2mBgfBflIf61BPuwuwp
	WSEDnRsLnknqBGvaTa1EXoc5s47yKSIM=
X-Received: by 2002:a05:6512:1285:b0:5a1:33b6:2b6d with SMTP id
 2adb3069b0e04-5a4172c590dmr7176236e87.14.1776770509364; Tue, 21 Apr 2026
 04:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260419223630.67644-1-m32285159@gmail.com>
In-Reply-To: <20260419223630.67644-1-m32285159@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Apr 2026 13:21:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLkQD_ZSFPGrx4uL+ezrR1Ai2ddUF9_PpesDG+AEwiDrag@mail.gmail.com>
X-Gm-Features: AQROBzD3vULz9bpY6-B9483r_xgyXE67qFa2sjkZj_vQ2SieZ3MVsEEIVSb4PuE
Message-ID: <CAD++jLkQD_ZSFPGrx4uL+ezrR1Ai2ddUF9_PpesDG+AEwiDrag@mail.gmail.com>
Subject: Re: [PATCH] rtc: ab8500: replace sprintf() with sysfs_emit()
To: Maxwell Doose <m32285159@gmail.com>
Cc: alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Apr 20, 2026 at 12:36=E2=80=AFAM Maxwell Doose <m32285159@gmail.com=
> wrote:

> This patch replaces sprintf() with sysfs_emit() to ensure proper
> bounds checking. It also simplifies the return logic by directly
> returning the error after logging, instead of logging, calling
> sprintf(), then returning.
>
> Signed-off-by: Maxwell Doose <m32285159@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

