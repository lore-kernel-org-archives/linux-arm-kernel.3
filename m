Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F89FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 17:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDYAPpaZpHjmAnmWIhwJK6/kl08vFAndQGJqEuV87qw=; b=LZdH8azJ0bzbvmbRvHx7ZpFaoL
	69SrO4ysqekA9WmY2BdxlX40daMwRFemRudR9HeVK6N9vB4BPPhls+gUlslMvWoG8J+MdGG5R7M+D
	IygKa940BgrXedtwRFWfPvjepeUx4LULAzcapcs2hF91GF2XFdWcmqiqPc4fxGUor2/EXlSiitWdo
	dqJRsca4VRofeIzyTWirINOXkg3ZaO3OFzpvBavEEIb5AsDji4LeP/0ZR+XNNUlQgzlTKuUI5/LM2
	HWm5LYKeze0wyFqkwRinEXoWQBhSHcUkdz654Ma3jGvXkUwNf3OIG/KKaXCTcz+cDA8rG4eTnmWx9
	MHYt6Wkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHcb-0000000FPKd-1mOm;
	Fri, 11 Jul 2025 17:33:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGe7-0000000FIL8-2Raa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 16:30:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E5755C716A;
	Fri, 11 Jul 2025 16:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5937C4CEED;
	Fri, 11 Jul 2025 16:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752251446;
	bh=RTEJVfqsliHcfLirkYxlG9p1Pmh0QT6gF3+ptlk8e6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QvY8zaq9DsENMfYjqHArKsKNyhfKiIPgl7gpGhXQm6GljFCgk9PJSSiT+N5bOnd89
	 i0v9HIhSgD8OYSIc2rSTo3jdlfGOOii+Rucy3S6/8wIXtG4jJE8s4btYyzN70hP/86
	 CDUVwFJ+BLF3IBhApXXa5noWTmiwI9Nclyb7swbakRYkBzrAbw4by3d4xHm2Il1ZWz
	 tdRBRyU7/WHl9koVVzyaMRSCrJnYMCXWNXJHc2gnJZtDEL+KsIerrLCo0CVbKKLrDe
	 N2s1p6lrd9uemDT7067swjDG+vIKiIwhDGSka2LF4I6ybFkdff2mNzNReDnKOQHTzN
	 2vxUGR4f8+5og==
From: Srinivas Kandagatla <srini@kernel.org>
To: =?utf-8?q?Steffen_B=C3=A4tz?= <steffen@innosonix.de>
Cc: stable@vger.kernel.org, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250708101206.70793-1-steffen@innosonix.de>
References: <20250708101206.70793-1-steffen@innosonix.de>
Subject: Re: [PATCH v4] nvmem: imx-ocotp: fix MAC address byte length
Message-Id: <175225144346.5072.8813469254272254047.b4-ty@kernel.org>
Date: Fri, 11 Jul 2025 17:30:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_093047_658286_168CE58E 
X-CRM114-Status: UNSURE (   7.04  )
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


On Tue, 08 Jul 2025 12:12:00 +0200, Steffen Bätz wrote:
> The commit "13bcd440f2ff nvmem: core: verify cell's raw_len" caused an
> extension of the "mac-address" cell from 6 to 8 bytes due to word_size
> of 4 bytes. This led to a required byte swap of the full buffer length,
> which caused truncation of the mac-address when read.
> 
> Previously, the mac-address was incorrectly truncated from
> 70:B3:D5:14:E9:0E to 00:00:70:B3:D5:14.
> 
> [...]

Applied, thanks!

[1/1] nvmem: imx-ocotp: fix MAC address byte length
      commit: d102a7924f4459770d1f30212d600d1f16d79f3b

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


