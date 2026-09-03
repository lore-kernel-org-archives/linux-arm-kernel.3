Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854B2C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 22:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmPdKwA5oBox13nOVPuYeBNSXW5SZTTwhPMA0q7U9Zw=; b=1ohQTjelZ6JkQhUcjc532IHD0z
	/1yXkHV/PEMAo3h22wahZoKGZctka4rRqj+OCsXoXAPPw/RfRT9VnC/oCfU0vbCFloMF5qm4HuM7C
	p9YnXz5g8UZULUskCblP62o29/ria6s7y9NGx26MQAt/8LvGiyiKu3t6ZWY0IAnJDKIDl/JlZfcMd
	N7rFS4c2uv116i0yV46rwYq5HyXdA0ShzVDCgOR6dQeRo2KgHbvxTRn6pCRH/hkSGcI7Iit8W32Fs
	0LuRbhRavWN8kJTqO/zi4Nj9hyDBKpQuuz1Y15IAySnZQ4EmuMmpwNzY97Vf8uEMA7r3O0XaLjBIA
	evWPnG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2FaV-00000000h8p-47Sk;
	Thu, 03 Sep 2026 22:07:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2FaT-00000000h85-00rf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 22:07:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jmPdKwA5oBox13nOVPuYeBNSXW5SZTTwhPMA0q7U9Zw=; b=aE4zSQpP7srwC+sX23tPsnerwc
	hcQmjb9SQ9NYgiecdLxz9fKLTynt3+M94BU8XsbIUKRd5wFYwugiC4dZ8MgYFMtegJAm/yQ8dJnHE
	Qevt9Akx2rNhInCkeLTp7TIuiVtD+DCstnpBzcc1v6s9UBoJa5Dauv5TMSkMcrPs3aT8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x2FaI-002oOC-AQ; Fri, 04 Sep 2026 00:07:02 +0200
Date: Fri, 4 Sep 2026 00:07:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Esben Haabendal <esben@geanix.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2 net] net: ll_temac: Return actual error from
 of_get_mac_address()
Message-ID: <d2ef669f-12f0-4fc7-9fbc-1142f9d62761@lunn.ch>
References: <20260902210238.283494-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902210238.283494-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_150713_039535_1B6374F2 
X-CRM114-Status: GOOD (  10.79  )
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

On Wed, Sep 02, 2026 at 02:02:38PM -0700, Rosen Penev wrote:
> When of_get_mac_address() fails, return the actual error code (rc)
> instead of the hardcoded -ENODEV. This preserves the original error
> information, which may be more specific (e.g., -EINVAL, -EPROBE_DEFER)
> and helps callers handle the failure appropriately.
> 
> Use dev_err_probe() to avoid printing an extra error message in case of
> -EPROBE_DEFER.
> 
> Fixes: 8425c41d1ef7 ("net: ll_temac: Extend support to non-device-tree platforms")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Does this bother anybody? Have you seen the extra error message?

Maybe net-next would be a better target.

      Andrew

