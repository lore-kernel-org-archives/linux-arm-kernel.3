Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52049F53D6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLckGAOtYT1zr95PYEOacOLTzrnEirym4NMLHWZh7iU=; b=gISYT30p7gX9UfHzpxGgVbWbLB
	YJ9cd8m9oFbicchiY+KHGYaoGZyPxp0dXNCzVrEVxXBZR6wjXNhyrWOH7UfbI3I9hv7r53/R33PfF
	5gOO+iIn2C3qNItH2dGYajw0arL/jTjvvop6+DuMzoV6uL+bCMIp7MNitQe7O7RvMiNL0mfEY1XJF
	HlzyjzfhIHwRjY/RTon8Khof4oQdYimBtvU9G7sjUjL/lE2eJPD8CTG+WtVnwc4BcgzD8PwCaXET4
	91zqg6v0nvwesnIURPGdSpsKt54Gp0djOBlpXELDuSypjBJQ019zwS0fhRh0AYZdTbXn930QutJwt
	5hPrcnBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AI5-00000004O4Z-1OqZ;
	Mon, 16 Mar 2026 15:55:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AI2-00000004O3l-3ZdT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:55:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64AF114BF;
	Mon, 16 Mar 2026 08:55:25 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65FE23F778;
	Mon, 16 Mar 2026 08:55:30 -0700 (PDT)
Date: Mon, 16 Mar 2026 15:55:27 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Support loop control in quirk code
 snippets
Message-ID: <abgn70W3kYZcZpg_@pluto>
References: <51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_085534_934978_0D7EFD38 
X-CRM114-Status: GOOD (  10.16  )
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

On Mon, Mar 16, 2026 at 04:34:40PM +0100, Geert Uytterhoeven wrote:
> Each SCMI firmware quirk contains a code snippet, which handles the
> quirk, and has full access to the surrounding context.  When this
> context is (part of) a loop body, the code snippet may want to use loop
> control statements like "break" and "continue".  Unfortunately the
> SCMI_QUIRK() macro implementation contains a dummy loop, taking
> precedence over any outer loops.  Hence quirk code cannot use loop
> control statements, but has to resort to polluting the surrounding
> context with a label, and use goto.

Hi Geert,

I was just now writing the quirk for the Renesas issue and realized
this limitation :P

Do you want me to pick this up with the quirk template for Renesas issue
that I am writing and post all in V3, or you have already the quirk too ?

Thanks,
Cristian

