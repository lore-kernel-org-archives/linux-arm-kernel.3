Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4777D3EE62
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 13:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8CbrCrSyhfZml8vZcWoHSjX6r1/a9truiYCwNb9+Ik=; b=hEsfAqe5HRd7+y5VhvN72Qm6gW
	Ds0YkBG2w7VM7jZdlmiLWq4uYu/+7qFoyKShpgl/xNwk6BrTslRbCgtZ9AMBKPhFdUpzN7MP8FhSU
	YrDrWTdJy0kkqLu4Lo2f+2/M04OuLMr5BJtDxdxIuuyZWrN/A7wSrLVqZbiWlX4YryiZS9QxI62BO
	IwaCSx0bbKxNe7zF1lmgr84xFoKO6ZrlDNRl0BlPAYmjsC0vGOPYUFX5j95CjIAbc/p/giYl0TiAl
	N2g3St7ooFNVqjyuNNorZmwQKqggDnjJ6hNObOBo9Hz9EZftr6PCLDGm2B1XoEVyd6NeQCNLmmxll
	WIIbAR5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuON-000000076Zy-3MBG;
	Thu, 22 Jan 2026 13:06:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuOL-000000076ZP-1S8Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 13:06:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F6CA43D94;
	Thu, 22 Jan 2026 13:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C931AC116C6;
	Thu, 22 Jan 2026 13:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769087188;
	bh=gCxiwAEkAW1/kJHAFTDw0bNVSClmk0Y0pxeqMlpD8Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HmbiaW43matw3oDkMMwT52mk2XrU4qkoJUwxT+LvFTd5zSVe7MUM9r1eTV8qk11Y7
	 KK7H5vDwgJxjnkdOalPNTTIyktcntGaUh9x7I7s1rZ9nVsgYiEye1EX+ZxAn9TZPSk
	 9pjEE/XX1boOCNtLpA85qjIrUWEDE2OP7FL8a+f3kvTnUFw/q2ekEtpJctiWrjwGKh
	 Rvvlt4KVUduOl0fd36KCl1ivRWu2150ex2uEcavY6Np/7+Pc3Xg0pppwkfI7puIBLG
	 rDhDftFpUeTFGywy3Sc119azATIFAGQ44FbOMovbDFxfiZC+2ey8m6FH35TKmrKfTk
	 AC8gMicfneSGg==
Date: Thu, 22 Jan 2026 14:06:25 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, vz@mleia.com, pandy.gao@nxp.com, 
	B38611@freescale.com, wsa@kernel.org, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [Patch V3] i2c: imx-lpi2c: fix SMBus block read NACK after byte
 count
Message-ID: <aXIf4RfhZ2nI2Uks@zenone.zhora.eu>
References: <20260121094837.2651035-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121094837.2651035-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_050629_403831_BC04FC1F 
X-CRM114-Status: UNSURE (   6.93  )
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

Hi Carlos,

>  drivers/i2c/busses/i2c-imx-lpi2c.c | 106 ++++++++++++++++++++++-------
>  1 file changed, 82 insertions(+), 24 deletions(-)

thanks for resending this patch, may I ask you to please rebase
it on top of i2c/i2c-host-fixes[*], please?

Thanks,
Andi

[*] https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git/log/?h=i2c/i2c-host-fixes

