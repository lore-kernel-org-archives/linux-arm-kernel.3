Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B208BC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 00:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGq9rwKs6zOSERDHcPXz2t5IH8ioYzNY8P7u5lh0XZk=; b=RlDsdNaBDpm1kC6KBOOH9acyZP
	KNeMPUnK9+fgzx1go4bSnuD86yWRzs6j2JVK9tuCU5P3GZHdUmn6ShZxpJr8ygze4+xaYNxr5U0Vv
	GM/VHDeVVEoqofw5qYXVOfGfNRob12ldTcXyNbB4t0AjXHqbOKfnkXmqHL3qIBUGHJnmTkyQhJC6h
	6SIq95PKkHbIa21fZ+0Fqu2fohLAhKwiMueLRYALd+59bSkDqsaJESRPsLV+IvnsPvguriKNdgk1d
	XbXnM3VIAbEd7SkuYzmiA1d1c4+iDmYNbt/A2GWbVSBlg4+UeZUEYsY+gCJnGK3VYn37doUq6og3g
	ya7264qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9B9J-00000006oRx-0C5S;
	Wed, 23 Sep 2026 00:47:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9B9G-00000006oRS-1rHE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 00:47:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xGq9rwKs6zOSERDHcPXz2t5IH8ioYzNY8P7u5lh0XZk=; b=TX8yDkcxbI/5urihg4q3EwAXyu
	7tesNQWje7Dx8qwWKaA4+9rkx5m3d6PPAGfxaZ3CU73YxZdyjB8zW9Jd1RnKT0vyM1dN+97nlFysf
	NYySCAx5hUqRhq4DUd8DAafOH5xurHEhwNraT7mLGHXJaJahlNEctea/yIiVYpa8d54E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x9B8v-006hSd-KD; Wed, 23 Sep 2026 02:47:25 +0200
Date: Wed, 23 Sep 2026 02:47:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Joakim Zhang <qiangqing.zhang@nxp.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Alastair D'Silva <alastair@d-silva.org>,
	Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] net: stmmac: keep datapath state coherent
 after reinitialization failure
Message-ID: <af3d89fc-0fb5-41a9-98ab-5a7df4c10173@lunn.ch>
References: <20260922-submit-stmmac-reset-fixes-v1-v2-0-d92e609be996@gmail.com>
 <20260922-submit-stmmac-reset-fixes-v1-v2-2-d92e609be996@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-submit-stmmac-reset-fixes-v1-v2-2-d92e609be996@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_174746_484922_F1274F9B 
X-CRM114-Status: UNSURE (   9.38  )
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

On Tue, Sep 22, 2026 at 05:27:41PM -0600, James Hilliard wrote:
> An MTU change releases the running datapath before reopening it.

This is the real problem. Changing the MTU should not release the
datapath. 

> If the reopen fails

Why is reopen failing?

You want the driver to allocate all the resources it needs before
releasing its old resources. That way you can always undo part way
through and still have a working interface.

	Andrew

