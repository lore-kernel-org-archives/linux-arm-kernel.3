Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3531B1099B33
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 18:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSPTkZbbxMFzXX/PNyizi++R3fgwKb/OBYen38TBWRM=; b=UAtFkdWCE8dPZNyhkHaaIxVXI5
	O87dhaby8V4BNzzlkBTh/UWdjePVSrvsT9o3OcLGZ6tbCAhIZkY26PWTtJ3T1VWNsQhc2H8a+80rY
	qqeuzhGj/8oGZ1Wn0qc70mKT+GVNGgdxFg/DZ+8g/vOPejQtOEElPEmBzfSzwcFAakhJuvIDuE9NT
	PUp6hhXtRkKIZFVoeH8UaMO0Pe6TEUWF+DABmE69CIT9QCX9CBZUWzaGrejQFEEVIg1VAVFTGOGO8
	zHpYZvx/BvnGvgiQx4OEoL/y7wp5NUuwDvBlVX8ydZbqDRn3p33mu3uFj5WpF6Do1f7Xvz0tLZMPr
	zhTMnbwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3eNk-0000000DMPq-0Jsb;
	Fri, 20 Mar 2026 18:15:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3eNi-0000000DMOY-1Ug8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 18:15:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1367041990;
	Fri, 20 Mar 2026 18:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3D3C4CEF7;
	Fri, 20 Mar 2026 18:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774030532;
	bh=9kPe7L8w8yNoC/3rVWXw1UQUGy4KdxDRZFpsLFau+28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fvyWdItKAFGkXtbpu9IZCQfa3UQE3LpEHeKH7IpwLR69wZubEGnT4GPR/p8XJU5kI
	 YAtY+08BA6aAhwa6KUbgCA4ipo6n14fVc9YBpNL+yhnWhDxou+UGjBuFbFy8O4Ksi0
	 ZTG/mQ+ftMFrfE6M/XBAJhkWGj38pFy2+fTzjOmJdKTzScwQ7WhHluJkNjpFK9+5H8
	 3sfjl2QDIxhr8FJMzAd7IUUiiCSspiV/PjmsM3GEnIJesh+Ct0vVEufv1mn6f9zqV3
	 abKIm26LU3KRD0E8J4hZO9wMXAKcPAOE/S9dVkT9I3KmMkWM+mSuHKZaizLRlatgoA
	 Dlg9kjrerghcA==
Date: Fri, 20 Mar 2026 11:15:32 -0700
From: Kees Cook <kees@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-hardening@vger.kernel.org,
	gustavoars@kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
Message-ID: <202603201114.9A02FDA977@keescook>
References: <20260306044536.149204-1-rosenp@gmail.com>
 <20260319220901.GD950375@killaraus.ideasonboard.com>
 <CAKxU2N856yYXURRf3td-_RCpe9hyX=zAy3qtD3ki23RjgO+a4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKxU2N856yYXURRf3td-_RCpe9hyX=zAy3qtD3ki23RjgO+a4Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_111534_441338_5820BCA8 
X-CRM114-Status: UNSURE (   7.92  )
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

On Thu, Mar 19, 2026 at 05:11:22PM -0700, Rosen Penev wrote:
> Technically kzalloc_flex is simpler but I assume a devm version of
> that will be handled in another treewide commit.

Yup, that's coming. I wanted to get the "first pass" of the base kmalloc
family converted first. There are a few classes of "kmalloc wrappers"
like devm_* that I'm hoping to convert to type-based allocations. devm
is next. :)

-- 
Kees Cook

