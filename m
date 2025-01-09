Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C459E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 08:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=te63t1YmW78w0jngM1bhVxUszC35hUvoiS+vjAYaSak=; b=xp/gihWzn9vJT5pjU18IisOAW4
	JT49Am45hhpiMLHlCdfyekQ7W9g3tvU1+nFgO8jDlj0zvwVZ+aLTBdpAKL+clAY8IQf19cQzPJjua
	sPWMtP5Hz4uIMsn5PXtpKrnzlzh5W/94OXz0AqJfHDW8dEvfKc02HQzUGvMPgGymETWMxnF4+JAEI
	lWc9ebdZDzzvcS8r2YTs+JmgBWbgz734I2HcPFVTlm0qRgRpwKOvROIH1saQ/la5Q/DeJ8jqQUE2Y
	X8BSBHU9IAXcKcDn3dnxegk4h5GOn5+jn0H2BLRnY7tQW2P85gYy9i/XjDTdgivCh97/9BWAWBuo9
	ZBTRdmWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoNe-0000000BF13-3txY;
	Thu, 09 Jan 2025 08:59:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoMQ-0000000BEow-15ui
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 08:57:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4505E5C5A20;
	Thu,  9 Jan 2025 08:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1EFC4CED2;
	Thu,  9 Jan 2025 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413069;
	bh=x2GsenrQunaqAI/1HgLji0dzukFaaJQHfX1V156HY20=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lAluccdx3ImOki5Oe/C412QGvfef+Zz6uvtIFQ3muUweTtuTgqIqm1wDkSK26ksTZ
	 r0vqQHWy7aaGzbNizzyT67+jp0b9uGfVthe2EA9OU8FaXrTlg0xTwqPf3tqO3ldkjr
	 WMTNmd7qM2NLTFqjEJcXlf0WcIrSqXjKTf2KRhTn8RLULfmk+3i30yC2kV7VcshIPK
	 F3uxLVRdE7u4l9xwXCTJ04pMD447Vqktp1GFCfKhE1Rh29d/CrXRdGIV+mv/uf6nU7
	 dBPWQ8MsBMFk/EkEg8hFWrWkINGbC3n51aqemlAQzqQwL8XQ5gzFt0e30chTDbrBZS
	 GRctYh4jGbf8A==
Date: Thu, 9 Jan 2025 09:57:46 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Karol Przybylski <karprzy7@gmail.com>
cc: bentiss@kernel.org, mcoquelin.stm32@gmail.com, 
    alexandre.torgue@foss.st.com, skhan@linuxfoundation.org, 
    linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
Subject: Re: [PATCHv2] HID: hid-thrustmaster: Fix warning in thrustmaster_probe
 by adding endpoint check
In-Reply-To: <20241205222221.3094702-1-karprzy7@gmail.com>
Message-ID: <0r15030s-6r63-p644-rn4q-393s3p694p1p@xreary.bet>
References: <20241205222221.3094702-1-karprzy7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_005750_347326_3348E65E 
X-CRM114-Status: UNSURE (   9.03  )
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

On Thu, 5 Dec 2024, Karol Przybylski wrote:

> syzbot has found a type mismatch between a USB pipe and the transfer
> endpoint, which is triggered by the hid-thrustmaster driver[1].
> There is a number of similar, already fixed issues [2].
> In this case as in others, implementing check for endpoint type fixes the issue.
> 
> [1] https://syzkaller.appspot.com/bug?extid=040e8b3db6a96908d470
> [2] https://syzkaller.appspot.com/bug?extid=348331f63b034f89b622
> 
> Fixes: c49c33637802 ("HID: support for initialization of some Thrustmaster wheels")
> Reported-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
> Tested-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs


