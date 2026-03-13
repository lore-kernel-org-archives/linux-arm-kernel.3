Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1828E105F791
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 10:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhyWFQlG5kM5a2LcSuo8L0gRDMTfjVWGWozEYXAOnsg=; b=PdTx4QxJbbav/fcfTV0quz8tfg
	yi3evZiMZpnogL9kyTW+rbN4Pz13rCdxXdRVz6OGABvJ1T5dZwm/WpYi7R+GCARm9mkHb58szGaOo
	TDyZqUZu49H1PMFAmQzm5nWULAVrCbg7HJpfZqupQ0azeGXfdNYPgd3uXWoJw6Qk1SoHgMEaLLBfF
	nhPiKp3ByjsK1O2cbiXdcPUML7/UvKs//x1QbpIMu90wMHHbqvOJ8v8OXK/fIz4+7S/95j2G2zNC8
	3rmf8I7/dlgFpMkR9T58t+TJFTlMP2jtAgx5eXqypNth+8nliMoZCcUuLAjRtsSOd1kqK1hJNdjkg
	wbj8nQmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zjN-0000000HVxy-1iSN;
	Fri, 13 Mar 2026 10:26:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zjK-0000000HVxc-37iA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 10:26:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 02FF01A2E2D;
	Fri, 13 Mar 2026 10:26:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBF9860027;
	Fri, 13 Mar 2026 10:26:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2849110369E5C;
	Fri, 13 Mar 2026 11:26:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773397609; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=VhyWFQlG5kM5a2LcSuo8L0gRDMTfjVWGWozEYXAOnsg=;
	b=sMugrtBx0yLiH03UfPyn/BFrI49T0ORFt8Lczv8U5tZbq44MujFu1fQuqBipJ6QUHEavAo
	TDndTnlvWQwRkYwQZHvM+Vsk7Vx+yvLjvnvhIwO1qgsb2fSWY0bDylLRPNY0o9s8GPTtps
	lEQpWs2e2xewcrgHXHhbz3/PJwlSLxhB4XG3LQp8B2Lfrfj2LkXjcePFYCeqXAkHGafXYQ
	ttp/VZol8kKFITwdW0QLwD5wjNI9O3oEvsjhJvrALpquDks0NQzmKjYIC74sLNXagF7dPy
	TicTJ6pLYIuJsbT3hLAF66+Va82rg0rmFvPordVErkasmBaH1nfeS0QpmQtoAw==
Date: Fri, 13 Mar 2026 11:26:45 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: armada38x: zalloc + calloc to single allocation
Message-ID: <177339759096.2797383.7105613894300986419.b4-ty@bootlin.com>
References: <20260304225329.24510-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304225329.24510-1-rosenp@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_032654_939382_2CFA594D 
X-CRM114-Status: UNSURE (   6.62  )
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

On Wed, 04 Mar 2026 14:53:29 -0800, Rosen Penev wrote:
> Use a flexible array member to simplify allocation.
> 
> 

Applied, thanks!

[1/1] rtc: armada38x: zalloc + calloc to single allocation
      https://git.kernel.org/abelloni/c/5827fe59745d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

