Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D95EDEBFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 00:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LodMPQ4iFToDY+xYB4wGeBtsV+RQzMBqBwJ03kJNjPc=; b=j81s6mhzSO487gGeRrdvBpP7zl
	dGEWBfxs3NSOqPV1xlV7e9K2YjrEpYh0JBXFnrCV/xSSC1G129hRCBZQBHJqmJgUPO9KVYjIGxZCP
	fGZTibMT+x3ezjSzL/wPhjmH+ynfYnvrFJQkseYhE7bejBR7pQOM9AG3jUt6796NpvnIDXl4eaH41
	9Jg2BnAeDNYIt4Pv1Nbo8BXlABeWcIxP8u9h7+TXdz5iJm+ugy4OxDIWykSEMoBrgVltrHV9y4Ng8
	uBBYA5I1uiXSa0FN1skjwcITwEMlo9mvdbF1dqlZo7XbO0I/0VKOcDVLaXEuNsRQHCEIZLcS55LiY
	LwZ5AjZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaGK-0000000GATw-1ktT;
	Wed, 04 Mar 2026 00:38:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaGH-0000000GATP-3u23;
	Wed, 04 Mar 2026 00:38:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9AF3041675;
	Wed,  4 Mar 2026 00:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33080C116C6;
	Wed,  4 Mar 2026 00:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772584728;
	bh=ghDmKoa2dUlX6/OtOt3rrcXErN7aJJ5211rIBAkODmw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tEWdoz5OeaSpQx6c/ENjos95U5KxI/Jl98SqspTWYj3JuCPx8u10usnjYZyhNfXsZ
	 v9Y8yc0cRsOCu3g4v71FRmk4/3ZGq3w/PpuMbj6vD4Kzmk5ZoWkIoKPu7hEp2oqFlb
	 1VLOi+5HRdjjE21UT8wHg2ILz+0qW9818yapzRb+8Fwcy3JKAiMT49mUwYa1SNdaFm
	 qCSMPXpomA/If4KmiZI3CAmba4Nm5jBLyIGAtVhbzJevqUAVOCBsK1sVz374yCZIVC
	 Bgd7V4HY8JQiMkVu1thvTZ1zJ+j1xtktAnESJIiMcYuDV5maJYvwmJ1eXFbDNo/eIi
	 Cnd/Bg5opJH+w==
Date: Tue, 3 Mar 2026 16:38:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: lizhi2@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
 weishangjuan@eswincomputing.com
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: ethernet: eswin: add clock
 sampling control
Message-ID: <20260303163846.156d18f7@kernel.org>
In-Reply-To: <20260303061637.872-1-lizhi2@eswincomputing.com>
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
	<20260303061637.872-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_163850_016427_8DA2BC33 
X-CRM114-Status: UNSURE (   5.84  )
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

On Tue,  3 Mar 2026 14:16:37 +0800 lizhi2@eswincomputing.com wrote:
> There are currently no in-tree users of the EIC7700 Ethernet driver, so
> these changes are safe.

What do you mean by this sentence? The commit under Fixes was part of
Linux v6.19 already.

> Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")

