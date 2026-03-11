Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3732DFD064D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 07:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNaPTJmABnkgUPv/s43KbEfglxud1HBJws7Ybd31zr4=; b=lJ49TV/0W0R9o9YIcBCdcGDLF2
	yAhMgLd6I+O1GMUliprb/A9Y60P2abEtnYSCC6msKvzFSiaAOq43/vQCRmpB0XcM4eMsuG7iWTbS7
	++4A3S2gUKHYjJr2P1fcjEBUh4W5rClTGXYsLeyBJgfRyx80kkABg1tcJheFTp+MI9cgeRT2fWQpl
	6XBUkaFxy2JmkEt3mCFT3e1LQme4OkyvszOaXkKh71Qg917BsD3vmxFaze+VnyAxp57L9HqT0pEZr
	pMPhvlPsY8DJF6CvSuT0khzVN5VZqJKOZSXBN4739COFY/TKYgkPqTdiRl7A+Vb4sX97M8sVkE4IV
	aQTbVbIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0E7w-0000000B4FQ-2HMR;
	Wed, 11 Mar 2026 07:37:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0E7v-0000000B4F3-1ggB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 07:37:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36E2C6014B;
	Wed, 11 Mar 2026 07:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7FA7C4CEF7;
	Wed, 11 Mar 2026 07:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773214625;
	bh=DlTWqEYmmaHPY7LRtbKDsD5+DzQ07gnLXptRGHY7zvg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YtvHdUfPDH4V8eGv4CAkFIjWXX5VyY/FPveZNpN3uHpRsvTBzGF/nOoV15oF6Pzd6
	 Ev7qM6Hd8j8lxjKBGAxFh3qy907xZRURTPrpMK0MoqmECQAVSybnK5JVJqZKtYfiDp
	 is5t3/udqQ8OsUB/8mmivaxN4yG1+cJwS60lIbDGb/D9zNDZbEkw1NQW0MBGlHZbwG
	 ayzjuJ4ADWE7NaxKzN87/c+IQZ1vhmnVXnDKCJ2dPds4gS2TpGPAB01OJ3dGmtPEJl
	 gMkq9/jKCOK67BU+uTF3Npnpl6H6F4An2RiH/kCCLXJKRpYgG7LXOHabyu++cn8YVH
	 ENTk057UPGh1g==
From: Srinivas Kandagatla <srini@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Christian Eggers <ceggers@arri.de>, 
 stable@vger.kernel.org
In-Reply-To: <20260306142235.1401319-1-festevam@gmail.com>
References: <20260306142235.1401319-1-festevam@gmail.com>
Subject: Re: [PATCH] nvmem: imx: assign nvmem_cell_info::raw_len
Message-Id: <177321462464.2138451.16844523641384766454.b4-ty@kernel.org>
Date: Wed, 11 Mar 2026 07:37:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Fri, 06 Mar 2026 11:22:35 -0300, Fabio Estevam wrote:
> Avoid getting error messages at startup like the following on i.MX6ULL:
> 
> nvmem imx-ocotp0: cell mac-addr raw len 6 unaligned to nvmem word size 4
> nvmem imx-ocotp0: cell mac-addr raw len 6 unaligned to nvmem word size 4
> 
> This shouldn't cause any functional change as this alignment would
> otherwise be done in nvmem_cell_info_to_nvmem_cell_entry_nodup().
> 
> [...]

Applied, thanks!

[1/1] nvmem: imx: assign nvmem_cell_info::raw_len
      commit: 70557835f9d310767e1af4522af59ad0aadc1ce1

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


