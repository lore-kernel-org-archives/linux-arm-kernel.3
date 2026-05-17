Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46598CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 11:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3qa+O+cN1U1/5LekcrM9IfwuZeFX3CWVbXfM6k5yaQ=; b=x2NYeJQ2p1OOGE3XbKlLI2YRAW
	r4d8ndWSWUDMm/QzsK4TGFZkMRM3XHIG88HUFI+Hs+5KFR0HVOZoKRn2wtsKElPac1RKUNfmKM90z
	T5xO+HAxSAaUyQCxbUL21Zbmnv3mYCOJkGB3OUnBEYxhF6jQam1VSCa0wZZc8+Rp2ClvYcTXjk3aO
	tdB8MFTrK+LD2Can7ypUW1srN/b+DLTByK9APai09HqW1SPay5TxBhccmkEs0uL8YwiIWjUF/gw1W
	XEJuusFCvelho9YB2AIPRA3lEREUaUQnhO+aPd2PM8ahcUMwGdzb5dOKZE+AbPSRgawSAeIU0BOf+
	fF9jbBsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZkc-0000000Cbz9-2DjE;
	Sun, 17 May 2026 11:33:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZka-0000000Cbyw-3o3j
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 11:33:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A5C4600BB;
	Sun, 17 May 2026 11:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77964C2BCB0;
	Sun, 17 May 2026 11:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779017618;
	bh=yTYlVW3XNQ6KFLt3e4dKFe0LbjnsvoHG3Q/y/y1Hnk4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=usGFqiwbn920YSSpla8jifwVPkQ2LQT22xTcHkRQK6clGMkA5A3ZozsuqGboqlD+D
	 rqEaFyACDlfeQwC58Y93/nOkVnwVs/a7bODfDRCVIiO4m/fBPt/S/kMlhY24gwrBGZ
	 RzpoJ32NMPa5Z9n9kn8kkHEvi01KKaj40kAYAKMnAc6ku/oDxsKH6GC9S3suCuDqcw
	 3iYFpSGVGrRX4r3O8g9ITlaEAtGfOMnu0ZC7jkMx6j5TP2VIp2/hZDd/nofwPFqSbE
	 j+xU1wXeeAJ9xJO1ulP3R+ilLfwfnpcJVvq2q+d9X+oW7ljk/8+Lmkmm4CGF00wo51
	 OBaBKtJPEQKMQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v4 00/15] SCMI Clock rates discovery rework
Date: Sun, 17 May 2026 12:33:21 +0100
Message-ID: <177901751519.3834262.16195066181334247381.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508153300.2224715-1-cristian.marussi@arm.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 08 May 2026 16:32:45 +0100, Cristian Marussi wrote:
> it was a known limitation, in the SCMI Clock protocol support, the lack of
> dynamic allocation around per-clock rates discovery: fixed size statically
> per-clock rates arrays did not scale and was increasingly a waste of memory
> (see [1]).
> 
> This series aim at solving this in successive steps:
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[01/15] clk: scmi: Fix clock rate rounding
        https://git.kernel.org/sudeep.holla/c/d0c81a38d06d
[02/15] firmware: arm_scmi: Add clock determine_rate operation
        https://git.kernel.org/sudeep.holla/c/ecde921eb460
[03/15] clk: scmi: Use new determine_rate clock operation
        https://git.kernel.org/sudeep.holla/c/af86c99170b7
[04/15] firmware: arm_scmi: Simplify clock rates exposed interface
        https://git.kernel.org/sudeep.holla/c/0d76f62613ca
[05/15] clk: scmi: Use new simplified per-clock rate properties
        https://git.kernel.org/sudeep.holla/c/cdcd2fc94936
[06/15] firmware: arm_scmi: Drop unused clock rate interfaces
        https://git.kernel.org/sudeep.holla/c/2e757f71a5ab
[07/15] firmware: arm_scmi: Make clock rates allocation dynamic
        https://git.kernel.org/sudeep.holla/c/62ba967595e0
[08/15] firmware: arm_scmi: Harden clock parents discovery
        https://git.kernel.org/sudeep.holla/c/bda40491e0ce
[09/15] firmware: arm_scmi: Refactor iterators internal allocation
        https://git.kernel.org/sudeep.holla/c/e99ed7267263
[10/15] firmware: arm_scmi: Add bound iterators support
        https://git.kernel.org/sudeep.holla/c/4848d07ea9fc
[11/15] firmware: arm_scmi: Fix bound iterators returning too many items
        https://git.kernel.org/sudeep.holla/c/ae4a088f13de
[12/15] firmware: arm_scmi: Use proper iter_response_bound_cleanup() name
        https://git.kernel.org/sudeep.holla/c/3065e26dac52
[13/15] firmware: arm_scmi: Use bound iterators to minimize discovered rates
        https://git.kernel.org/sudeep.holla/c/26d04d592a47
[14/15] firmware: arm_scmi: Fix OOB in scmi_clock_describe_rates_get_lazy()
        https://git.kernel.org/sudeep.holla/c/4a07036d6159
[15/15] firmware: arm_scmi: Introduce all_rates_get clock operation
        https://git.kernel.org/sudeep.holla/c/d2488ff1a257
--
Regards,
Sudeep


