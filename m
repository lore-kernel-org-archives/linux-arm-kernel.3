Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAA3CCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDjf5Zet0LKmhh6LAOeo9wOIpr3u3VhhkFWY0LFMIyU=; b=D4BreF1ho37Zydu4PKG86UmDlP
	v8H2+zW5Keol+LKFqKxPhWH1tJj7+iAqvSdeew3yiUG0kr113/Dj2lK+s/32iXeZIOHabMUSIb9wR
	rmXGmJFuuP+ANrqzDllyuYKHThQRILo2l2Jo/KCv+tDr/JxQtDtAnpOZoJWEfsmIICdHoi0U/4gnK
	FHZWc6TJpQ1dXLwSC2WQlKj+SN44L+CV4giZ4+TpfORj52IC3rNnKVFXnbN+gUsiJqfKLkHWhSwkQ
	1rHDrIW/u4wgaPLFqBskQnX+HFqCwriUNqxouZ+uKmUGFiVPz32lZd9ij8vT6YmPP5l7Z9Jsi8uJm
	Sdojssog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkYL-00000007BHG-27cA;
	Mon, 19 Oct 2026 10:25:13 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkYI-00000007AzY-0E7L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 10:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=DDjf5Zet0LKmhh6LAOeo9wOIpr3u3VhhkFWY0LFMIyU=; b=sLuOTZk1259plTznuAjZZl8qHx
	O2XpSyfTSS9N+bngz1bNYYv2VEfq7tqHja8V7CTBuXUZbfodn8VHRBd6Ks2mZNRDSTVr0V6zpuBIQ
	xH7nev8zSTJnPMZ0tMP1ZGqA3vZQfexnkep3Z8ZIMThC/dsFyz40EPe43Z3sef/I9PaV8OvqYgySW
	g8ImJX65XH5Wv8PRMY2/pnp1R6fAVQ7CNQnQJJsjIjhEbpkKs/YrSDLgMBi1u98OmQNwSrTK/kWqR
	23ZA+erM83OeOPCgvt9+CGGpZdnW/x7ENxLW904NeY7+b2mWViEWetwi1zl3dULKJuiX0gPJAQB/T
	TzZP7DcQ==;
Received: from [115.246.246.98] (port=45272 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <saivarun@couthit.com>)
	id 1xIkXb-00000000VO5-2pJL;
	Mon, 19 Oct 2026 06:24:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 013371BA02D0;
	Mon, 19 Oct 2026 15:54:23 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id erd3YtZvu9BY; Mon, 19 Oct 2026 15:54:21 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id CAD1F1BA0896;
	Mon, 19 Oct 2026 15:54:21 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id ShKfL8_7tJT2; Mon, 19 Oct 2026 15:54:21 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id A09201BA02D0;
	Mon, 19 Oct 2026 15:54:21 +0530 (IST)
Date: Mon, 19 Oct 2026 15:54:21 +0530 (IST)
From: Saivarun Mudepally <saivarun@couthit.com>
To: netdev-bot+sinfo@kernel.org
Cc: Sai Varun Mudepally <saivarun@couthit.com>, danishanwar@ti.com, 
	parvathi@couthit.com, rogerq@kernel.org, pmohan@couthit.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, afd@ti.com, 
	basharath@couthit.com, horms@kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pratheesh@ti.com, vigneshr@ti.com, 
	praneeth@ti.com, srk@ti.com, j-rameshbabu@ti.com, m-malladi@ti.com, 
	rogerq@ti.com, krishna@couthit.com, mohan@couthit.com
Message-ID: <493615167.624945.1792405461616.JavaMail.zimbra@couthit.local>
In-Reply-To: <179214979438.408196.11375100740673315884@kernel.org>
References: <20261016105206.167094-1-saivarun@couthit.com> <179214979438.408196.11375100740673315884@kernel.org>
Subject: Re: [PATCH net-next] net: ti: icssm-prueth: use
 dev_close()/dev_open() in icssm_prueth_change_mode()
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.247]
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC155 (Linux)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: icssm-prueth: use dev_close()/dev_open() in icssm_prueth_change_mode()
Thread-Index: Sxdr3LPvc6wuwZudfEjLAZ3i6JSt9Q==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.couthit.com: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_032510_160196_740EC1E4 
X-CRM114-Status: UNSURE (   7.59  )
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


Hi,
 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
> - How the issue was discovered, e.g. hit in production, hit during
>   development, syzbot report, manual code inspection, LLM or static
>   analysis tool scan.
> 

Sashiko, the netdev AI review bot, reported it as a preexisting issue,
while reviewing our ICSSM HSR/PRP offload series
(https://lore.kernel.org/all/179151741150.434549.7819199497598747618@kernel.org).

> - Whether the issue was actually triggered, or is only theoretical
>   (e.g. found by code inspection). If it was triggered please include
>   the symptoms, like the stack trace or error messages.
> 

We first confirmed the issue by manual code review. We were also able to
replicate it on TI AM57xx IDK hardware board.

> - What hardware the change was tested on. For driver fixes please
>   mention the device (and if relevant firmware version) used for
>   testing, or say that the change was not tested on real hardware.
> 

We tested the fix on TI AM335x ICE / AM437x IDK / AM57xx IDK with the ICSS-M
PRUETH while changing the protocol from dual-EMAC to RSTP switch mode.


Thanks and Regards,
Sai Varun M.

