Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3031FCD0CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1thjCaWy2Y4MaPdfgdXswMbuA6XTuPK31ODNC+iJJ2g=; b=A5rbmKKhNouvpDnIvw5f+lXJSU
	ufz/MHXnxwpF1/rCszpHdLj/BNU2COrRi9nCAutOGiQ0IDjBqNMZcbxLoDrBWJFL5j6I14M4zsx+R
	FA8XFjAnKr0qOFN1W8AZfCGPbqQzSrEPIUXNCNjSrU8v/M/uM4TZmgWnhhGwOKvsVcSidk7XLuPF2
	IhICymM7G7zDTxp8VTkjqP/vqx6LR9fK9/yka65iM4AiyPoH7HTRFLDN6cyNGQr5xpf4/cbdgOgqE
	1bD0e+qdWW1dQhgZU8DBaLepG+ZZ6iakTuaMKy5jDxFrKckIySnDJJtoQDORr3dK2gjddH5vQthtL
	P2BFGLqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ls0-00000007yn1-2Q0t;
	Wed, 18 Mar 2026 08:03:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2lry-00000007ymZ-1ZdW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 08:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1thjCaWy2Y4MaPdfgdXswMbuA6XTuPK31ODNC+iJJ2g=; b=c7U/aYIdQW2fmS2TxDL/u+YaRy
	dDip749V8eak2+tgxjbbSeUnn6uC3FnJmx9M1pggAXgNNdSuA1k6Hu5D29Cv+MB+IY07UvsF7R1as
	y1uwwqAI0bTgtWs9DwfJUrFs6Jk48JP7cHFfB8sJdNSN0rLtZwQ1AGVIQvgnpykh4MdWgyDFeTj+n
	D5i9P5HZbhEEIuKzEt9r6bnKvYCviJLqgRDBZZAoSdvDGbco5M7Jt9TtGSTBVIeKka/xYUTuJY7KW
	LbF5DN58l6FRjQ/+LIu51YK35hl0ZcQ3Egh3OB/VevpWA+VuKi+0eCZMETZ/V13N9ZBpyiTNS4t3D
	Ke/h/IBg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54972)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w2lrt-00000000314-1wxZ;
	Wed, 18 Mar 2026 08:03:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w2lrp-000000006vl-1Sam;
	Wed, 18 Mar 2026 08:03:01 +0000
Date: Wed, 18 Mar 2026 08:03:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Li Jun <lijun01@kylinos.cn>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: mvebu: fix null pointer when access
Message-ID: <abpcNTI0NFZqe5eE@shell.armlinux.org.uk>
References: <20260318075324.2477118-1-lijun01@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318075324.2477118-1-lijun01@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_010310_411196_F20CFA24 
X-CRM114-Status: UNSURE (   6.83  )
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

So might kstrdup(), but you haven't fixed this one either.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

