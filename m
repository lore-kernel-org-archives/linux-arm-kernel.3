Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D943310775E1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTy9Ek/cdGZ1MasZugacGDt/OjNWerL8zY/8K1ebyW0=; b=yjBkm19uj9+Fo9M2x2gFjtyA4d
	8Q+nZkcMYQ8QImfNeAYWl1fImquy0w4MpvbKZ5Poe5kdtdrDJTj4Gn16ZKfUKRgz79Ts5p1ZY1ytL
	6h41djRjrDwl0bL0ueYRLp/YNLrXRS4b8sMsVYAW3GgmlJyUSsoqoabO79yNzSs9RuF0i0xov4aLC
	/VLxdSmptrEItT0cVZIbnZye72kOEmj0fWOL7RwYP/emInMSzXA7G50EkTw1hJnLANTjcaWOaLfo9
	xhLUwVYNZKpcwXLCsC4joHG0ddT8qsFgqLGzCqGth3irqqinMG+2/tZWAHjmBzbxoPRhtnWUUauRj
	UXI3qY6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tkt-00000008vYh-1OgD;
	Wed, 18 Mar 2026 16:28:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tkn-00000008vND-0ePh
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 16:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kTy9Ek/cdGZ1MasZugacGDt/OjNWerL8zY/8K1ebyW0=; b=rDln3ymzkYiQiqU8DPD0kOZhB5
	cxJltbka/HzMqHjj7gijQwQyFAGGFRlJ2cSayDXWHyVtv5euq2gQFkxHtIuZH+/kMAWYBhj4PKCM1
	X6mrJssRAJa03oMaFmm28BV2OGMuc/HPGr1fvF76QqYyrQ0qseN6yHrD4ERP3/2BHQmYXhFtswt6g
	fDFe9wUOxKVf/unYLi1fzKpKnZiqIF7bMXqhGrg4inCOB+/FZNX6/feYxKkLYxZOfVHh5CA4u/eM/
	NKs9LZU1fRPxooDcyONAKEs9nu3qon5Jz+soCqMUKQao4IY2C5A2Y0LzsUmb+RFuNwRNqlH9EaaZH
	FGgk2Evw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tkh-0000000BiTu-3Rau
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B700E40643;
	Wed, 18 Mar 2026 16:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67090C19421;
	Wed, 18 Mar 2026 16:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773851284;
	bh=JRpRMOihLhniYpAAT2t+NPGuGJBBL5PuCSnuu2HqvrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Alwo8cBJC9XI+zxiSJ9bNsPB4D1V9ohSDm+WArR/gLZqW7lOYrVRPNqiHb+PDKUWP
	 AHpBZnGY0TdK0KGRPhfm4yDAO0kxFJc7ZfN+mGIFMwose6GkhVv1duRMyWvq7iw/4H
	 JMsJEEYUBzMgXSjALVi9mLW2+BJgUYCKnt65osCJ2e8okdDDxXNg+8NLJP4NEOQ0pQ
	 /0o8l0Dl7J6pluh38yrd1rPoNIAwLnBH2yI12Btptxm/u3V7Aj26SIKnr27dHWTXwd
	 INx18uEbjNjJvX3WQkPefTwdd63EYvrslNdwX0dNDtV67Vunft5fa2IkoGtJfLFKR3
	 AwLD9rEBnIxIA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Support loop control in quirk code snippets
Date: Wed, 18 Mar 2026 16:27:58 +0000
Message-ID: <177385122249.117565.12887395986436607561.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be>
References: <51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_162812_082862_1CE233D1 
X-CRM114-Status: UNSURE (   9.74  )
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

On Mon, 16 Mar 2026 16:34:40 +0100, Geert Uytterhoeven wrote:
> Each SCMI firmware quirk contains a code snippet, which handles the
> quirk, and has full access to the surrounding context.  When this
> context is (part of) a loop body, the code snippet may want to use loop
> control statements like "break" and "continue".  Unfortunately the
> SCMI_QUIRK() macro implementation contains a dummy loop, taking
> precedence over any outer loops.  Hence quirk code cannot use loop
> control statements, but has to resort to polluting the surrounding
> context with a label, and use goto.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Support loop control in quirk code snippets
      https://git.kernel.org/sudeep.holla/c/0a7ec808abec
--
Regards,
Sudeep


