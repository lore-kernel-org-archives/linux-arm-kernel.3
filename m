Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D700D103E173
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q16INdj5Bbx7Rja1/wsZxQcnDm7VEmJ4xMzfrpXcfTA=; b=L7ugcBLBoi85ENiY9/pfbehDGT
	E+amHozt4+TYSEz6itaDE6A+A3BZd9uZExXhLVJ1iqCuHApUnbdmZNkcqdus/wFfrLTYwZjm5FpMJ
	X4E/XOGL0jurgcWVb4u6CBix7QnkodI6pXPiekyNt75LT3K6VHjkKXsdj7GM8PBFynlRpfpigmtBC
	Oz3fKRRb7NsAOztGbZ5W+SOuaqsQg000dbrSJcAGOK9I8MD3uapOZFWh/MWT/JuymvXESZhUWWcBt
	2FgnD8nET/fuoAjbLgAeFI5KPRabezEBIF/rkUFDW8UP7bC7XK4dNnbJCkMi9GU/nASVSoA0MukGs
	bH1k5k7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qyW-00000008U0R-1uM3;
	Wed, 18 Mar 2026 13:30:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qyU-00000008Tzf-36Dk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 13:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=q16INdj5Bbx7Rja1/wsZxQcnDm7VEmJ4xMzfrpXcfTA=; b=Zj5gM0TjUHWgkWrn0VgshTJyG6
	VsSLwYUNIQvtrEPzfdfJSdnfInL7t6WY+dgsGdIY26w2L3Y8iuq0ANSedXTEtPeAC+ouQnvXKZ+AN
	T2FYKGsqzriKN6YwAFOsc83XhgWmRpQvIvAH0/cBt2LNLejps5AuB4GlSwqL5V8ct0eA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w2qyD-00CCig-G7; Wed, 18 Mar 2026 14:29:57 +0100
Date: Wed, 18 Mar 2026 14:29:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Li Jun <lijun01@kylinos.cn>
Cc: gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
	linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: mvebu: fix null pointer when access
Message-ID: <e1c5744b-a6a4-4b56-bec0-b31c4d514bc5@lunn.ch>
References: <20260318075324.2477118-1-lijun01@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318075324.2477118-1-lijun01@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_063014_778095_AF4104D2 
X-CRM114-Status: UNSURE (   7.81  )
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

On Wed, Mar 18, 2026 at 03:53:24PM +0800, Li Jun wrote:
> the kzalloc may return null pointer, will cause kernel panic.

The kernel is a dead man walking if the memory allocation fails, so
that coherency cannot be configured correctly. A panic at least gives
a stack trace, rather than a nearly undebuggable deadlock later on.

Not all kernel panics are bad. You need to look at the context, the
comments in the code.

	 Andrew

