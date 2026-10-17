Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4622CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 19:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYGsXWG9SDMV67QAf1tz6nrdfNEYE/8zYbwRK9nJnn4=; b=GNIlWOJXN4lOmikobN4Vwj6r7Q
	M2rkFz7plSz1yeXLVJYIQnf4rLUuyZt+DB7s3NlR248Abh4A5z57mFVkOKYfHdN7v60zbEA6skugw
	yHa2qg49bhJlR1aMeWpLpL76gQQYUexb0bJhgP0vr2z55nrKP81OTDV3XhGtHuL7MqTuqKyMyGJDY
	YonUK/uSma+jarzBTF3UthITLMn9LW8T7Mc5Ga3T+nVKBzS2N10sDDGwxB5aPItuKJr3AAM3WqMaC
	c4M5zDetIsXs89ZEMk5n9kgvdi6OqV0DUDnTUZLWhQJR8jRNbK3NauzfiVcYxlPeC+kXI3T1WPxdl
	dANsoCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIA4w-000000057l6-1TfJ;
	Sat, 17 Oct 2026 19:28:26 +0000
Received: from mx1.bren.win ([51.81.56.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIA4u-000000057kb-0R1S;
	Sat, 17 Oct 2026 19:28:25 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=bren.win; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1792265288; bh=XYGsXWG9SDMV67QAf1tz6nr
	dfNEYE/8zYbwRK9nJnn4=; b=Bc9PpG/GzYM2QmKjQ5SpzU15RbbZOvKl3FIpV2CvmJgaOk68MI
	xgwZuGLb34w1+w51I+A5bf1aIefq3YTLXzBg==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=bren.win; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1792265288; bh=XYGsXWG9SDMV67QAf1tz6nr
	dfNEYE/8zYbwRK9nJnn4=; b=U2nms9Y69+2ltth1F0svRq3QaxJ61tVeB8EqANhoOshtIqAtkQ
	7fY+DVxzZnZZjbQBk7ckBTt7T/rRzn6HprEHWhAwvcHz1SVrWEHRJ69Gl2ZS4f8dVw9/n0a+ANp
	HYMNYV4To0r2sQ9v15SgNW8Cm0V1JeJuDVcL/0QVtlFMyAPNBxyHHP98kGUgdyKDLYDLLH4mW8t
	Q2yaPEw7LTHqiyHOAJsYYgiVR7pdw3XWz4ddXe9kabLmEy3KZwWNptg4u7Dr/rxf4T1fxYyzgpQ
	j7LrSalQUJdK3vQzmhjIYq1AO9qrNZjytQCZVI5ZvvLBivg2l+OcNmG8CL07LkJj3yA==;
From: "Brendon C." <bren@bren.win>
To: linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH] clk: mediatek: mt7981: feed MSDC from emmc_208m, not emmc_400m
Date: Sat, 17 Oct 2026 14:27:53 -0500
Message-ID: <20261017192753.1464632-1-bren@bren.win>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017190729.1369302-1-bren@bren.win>
References: <20261017190729.1369302-1-bren@bren.win>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_122824_230399_7AB04A9E 
X-CRM114-Status: UNSURE (   5.56  )
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

Tested on a GL.iNet GL-X3000 only. The change is not board-specific:
every MT7981 board with eMMC or SD currently runs its bus at half the
rate its device tree requests and will get the requested rate with this
patch, matching MediaTek's SDK kernel and U-Boot. I do not have a
GL-XE3000, CMCC RAX3000M or Cudy TR3000 to confirm on; the test scripts
are in https://github.com/openwrt/openwrt/issues/25960 for anyone who
does.

