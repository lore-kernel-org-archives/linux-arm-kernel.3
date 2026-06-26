Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AE4CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fu9TsJGr2BQbDqvWo5w+dHLu7Kx9Mkjtvmx/clbn+f4=; b=JXb6mDvYBfYttAwHxskAjgOEl2
	GhKsh1IaEPLVkkBimsYym/bpaOIRkS0/R4PrR+WzSPYdsyC+nlozr0Bw7VImQrMXgYG7x3doCA0x2
	cFUgxcuhRlvXRYDJMvv4lC9ijpWrLmPqUeiB9gqgewumC5+MRRnH9Prk4t68EEOG0n5Miey8n/IZj
	fU3Ha1z8bEGry/ta9hvSKUkeo4QNyJnx3T780aSkdF2gWsQe0BpvEYICxak0FTvFVQrOjoH2EqWk3
	sKGBQJGDz1nDl4t5eIKOGJL9cD5HZkqGe7AJGFFEpfuhkkT2LykO6jvPUlopve2qEW6e5D0WYbm+J
	ze/u9Z1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Iq-0000000AiYv-18Yj;
	Fri, 26 Jun 2026 07:48:44 +0000
Received: from fsn-vps-1.bereza.email ([162.55.44.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Im-0000000AiVU-1fSU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 07:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1782460114; bh=fu9TsJGr2BQbDqvWo5w+dHLu7Kx9Mkjtvmx/clbn+f4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=QEt68Hc2Iwnt5hJOnqWzuEE46SMI99d9j8yhL76igYVk+Z2HuWrqShDiIdFlMazjW
	 ChE3kVJkR7rbm7YwifGNj5H1o4RLuWoQFZvMiLHYtOJaeZlkLCWpXPxLB4cu02MRkI
	 A6g1MiobRTxewhm+IzBGmkD/loRZMv7yKuVkDVaQziVTy74bDdgvzWQvqKaEwSEGGy
	 apVpB1WXgUBjmotxmStjiy9O1zhNINyMypX/TWaOYfkVtX4Ttc5BwLv629u2lMqfGa
	 m5zm3Tv5RJQAGbL6KFSiDstVkbl37W0zqdiNv7pGmOhfvnLNy7rg4n5Bfvw6Z6i8V7
	 PtIvN9QQf9eIg==
Received: from localhost (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id 579F460E20;
	Fri, 26 Jun 2026 09:48:34 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 09:48:33 +0200
Message-Id: <DJITDJYQEOPN.I0S9T54IS104@bereza.email>
Cc: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Suraj Gupta" <suraj.gupta2@amd.com>,
 "Frank Li" <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 0/2] Fix CPU stall in xilinx_dma_poll_timeout caused
 by passing delay_us=0
From: "Alex Bereza" <alex@bereza.email>
To: "Alex Bereza" <alex@bereza.email>, "Vinod Koul" <vkoul@kernel.org>,
 "Frank Li" <Frank.Li@kernel.org>, "Michal Simek" <michal.simek@amd.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>, "Ulf Hansson"
 <ulf.hansson@linaro.org>, "Arnd Bergmann" <arnd@arndb.de>, "Tony Lindgren"
 <tony@atomide.com>, "Kedareswara rao Appana" <appana.durga.rao@xilinx.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <DsE3FsHGEnJCtXR3Z9SV8EKrNPT5Ts7jJzvuFbYxFFwXiTIk9D95VxhojlLSRRnswrBlhXLZAePfM5VH9axGhQ==@protonmail.internalid> <20260402-fix-atomic-poll-timeout-regression-v4-0-f30d6a6c13cb@bereza.email>
In-Reply-To: <20260402-fix-atomic-poll-timeout-regression-v4-0-f30d6a6c13cb@bereza.email>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_004840_893918_4B7BBBB2 
X-CRM114-Status: UNSURE (   5.69  )
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

Hi, could it be that this patch was forgotten? I still can't find it in
dmaengine tree. Is there anything I should do? It still applies cleanly
to dmaengine/fixes.

BR
Alex

