Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1C1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 23:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0fB+IKeLyIRbapePVfANbbyhFuIZhjPV0fgnOr+ssQ=; b=DcdRiX/BRMvfzldCXUsGOEVx3Y
	7PDovsZt0jprFBgfC18e0+hRB5kInjAOYszkyPRo6TnPxuMdFe2PZb50HjaXzcTuonTahwSqxSndl
	gIrfAUZcsqchkoxdtbMqwMfz0d0S90xngdYje/XcJkF6AuMtNGHDSc5eNIkMDzh4u/EaWvNJzKjB3
	Xrzfu4KBoWL4CZ3ExP58/Y0AI0Qo86ofkQg+PtUTlur3EkvDmOY4102xeQidEgdJH43S6wRIDZ479
	QlGhG5SWVBIce2mVGIjMw4AmiTn9nVODN+odhHqSzl+ToaOIGVxg56mTvJcLttJzbn4K4vD7kpkbc
	7LnFcKXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2IK9-00000005gr6-1Ksw;
	Tue, 08 Apr 2025 23:25:45 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2IEk-00000005g36-2Wxb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 23:20:11 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e6a8aa771e8so5259870276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 16:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744154409; x=1744759209; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0fB+IKeLyIRbapePVfANbbyhFuIZhjPV0fgnOr+ssQ=;
        b=iBC0hAsyo6mytowsagGwYeurZm+u5DYJuTBhw3R0mV1seoEVJ+X67Chz95B7CUV22g
         qus/o6jnLBR33utmUZPN5gnWRUGzVkr4GGA/mHz2fElj77pB/q0YgBZtAmhO9wpM7HFL
         Zi4KLNzqK8VLyKLjam3CJnPS0Q0x9nNHu0HNtkdeGqDG+gjI/y1g16WXwPfhdKbQXrLK
         J+WTdc2AiGSzoBzXaOu/18r2iZbbe9gGfyV+AyIXtD//eamtOCrOGIfBgSKEIC9M3FSv
         rlmjBxbd5/JQrJ6mbGc/gx9V1PkLhlXIQZWaxJ2sj5DHYCtkezGsvvSUhG9wc2WxWzc8
         2lBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154409; x=1744759209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0fB+IKeLyIRbapePVfANbbyhFuIZhjPV0fgnOr+ssQ=;
        b=kQY6GBtbz0ygamuSfalOvP5xvGki36PgNLOgfEs0bWyidAmXnCNXvmoEC7HJFJefA2
         1VVMMXZi4uP+k2e7NrFAkZ+cxkDxvtr25256WQSK2OrpLnsZjgWy/rpp8NPlV3nx2Vah
         GujFr3t2iSXqol2SqqTnu+F95PXcktrZPPr2btok/R3j4qTM8KINAxcd5suQVmJEaynr
         x6VZVjvRMjD1t8A08murNObKoLFR5S6FWJE2/TODz6cXyEduKY+Sk6PBnFpcmQb2oCv7
         v3LPssRr+khVq1dXUsoKgYI3kqGVMdDaJnbbDV/ytZSxUwvN+xlFvp3KYtiq5PpzwjYa
         WWig==
X-Gm-Message-State: AOJu0Yy1Ps3Z12pTdwwuQ6ub49T/i21HWLEglXjzoZLEhbdEyQTR8TYb
	oOKmrwtfkPnEqM3F3aF1D5h03uLyJe3Wtx/q1ffzonZSulXDARD+Bfv5uRJjGzs/e/f0bwmEkzO
	TW2XbSUcVHBrc/aRwPCgU/8lx53s8AN2z
X-Gm-Gg: ASbGnct+iEhZHu6ZWUCmeMFbPRJQWzat25Rd6Uaea3cd00uGK95A6ZFPA5s5ET85nRq
	Hq/d7A6suj3LfmarhqPNKb3FI99yqlF8nNPTrHjRAD21gyXWVQ4CU1xAuNpqGFDE/tg1F77zQn3
	wgb1sCG6t3fGhugLSAd4RGYdHkCFfhxvNIt5tmYA==
X-Google-Smtp-Source: AGHT+IFpDe4WZSyDgZhnjQhwlrjTlvrI4BE2l3Nj2Xpuah2KBF9AOZ056+dpJFQvlFIchgOZLbDivnYaGNNGCRdpSoM=
X-Received: by 2002:a05:6902:981:b0:e39:8e5f:adab with SMTP id
 3f1490d57ef6-e702f06db4dmr1162901276.39.1744154409254; Tue, 08 Apr 2025
 16:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250408231823.826163-1-robertcnelson@gmail.com> <20250408231823.826163-2-robertcnelson@gmail.com>
In-Reply-To: <20250408231823.826163-2-robertcnelson@gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Tue, 8 Apr 2025 18:19:42 -0500
X-Gm-Features: ATxdqUEqOr2dxKhn-iktIhobKCO_F83ejdgGyZozs2sb1C-LOU6OcOG2UtmJ-zU
Message-ID: <CAOCHtYhFKO=LRN8qp-w+rkTGKJ8t-LnqgqbQW9P6CO3=EeuufA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>, 
	Andrew Davis <afd@ti.com>, Roger Quadros <rogerq@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Judith Mendez <jm@ti.com>, Andrei Aldea <a-aldea@ti.com>, Dhruva Gole <d-gole@ti.com>, 
	Jason Kridner <jkridner@beagleboard.org>, Deepak Khatri <lorforlinux@beagleboard.org>, 
	Ayush Singh <ayush@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_162010_696375_839068B7 
X-CRM114-Status: UNSURE (   8.64  )
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

On Tue, Apr 8, 2025 at 6:18=E2=80=AFPM Robert Nelson <robertcnelson@gmail.c=
om> wrote:
>
> BeagleBoard.org PocketBeagle 2 is an upgraded version of the popular
> PocketBeagle.  It is based on Texas Instruments AM6232 or AM6254 SoC.
> Its dual or quad A53 cores can provide higher performance than classic
> PocketBeagle. The new design comes with pre-soldered headers, a 3-pin
> JST-SH 1.00mm UART debug port, a USB-C port, Texas Instruments
> MSPM0L1105 Cortex-M0+ MCU for ADC, 512MB RAM, and a LiPo Battery charger.
>
> https://www.beagleboard.org/boards/pocketbeagle-2
> https://openbeagle.org/pocketbeagle/pocketbeagle-2

dmesg:

https://gist.github.com/RobertCNelson/c68c96a8a1dc6e4d39d8c48fc13ca1c1

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

