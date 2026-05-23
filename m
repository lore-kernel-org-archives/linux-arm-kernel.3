Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268C4CD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 01:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvrv1h2YtaxLeHVYBfz/LqY0BX/aHmJKlWG1cpkGMaE=; b=Jl3lvA7cJvedU3K0obAyqXyPiV
	e3n+ytUdnUwKveklODu7qJWbYGdmQ0GQtNkSmc5jZAnY9zGb7lUuforNuoOBo63LlqNoi/NyhFGXH
	4hpN5u+baF0EPqI3PFJ/eYS2tZ0WQQkE7fXdAXhPwlAAS/GBZCbvpKuRgiUC8yHO7phffMwI9PhN4
	wXwHEz6Q2gxVwmf8Zji7R6nECc8rf6M2n+b9tKpZnVS1i6UHeThwlJXxSF3fOrpYYLnQT86dg0y3B
	yU2HBSUwhAzFiwDNNyascI2HzqTvW/DCzyhtsUgcfOXE64qTmzfRt2eydT4TBG1TLFFmOzsxX/pwZ
	rNX9ATJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQbR0-0000000CTNo-1Kuo;
	Sat, 23 May 2026 01:45:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQbQz-0000000CTNZ-14ZK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 01:45:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E92060103;
	Sat, 23 May 2026 01:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD261F000E9;
	Sat, 23 May 2026 01:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779500748;
	bh=pvrv1h2YtaxLeHVYBfz/LqY0BX/aHmJKlWG1cpkGMaE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MvtZEsG8FHoC78cJtO+Cdd6uqMGryX+mVwM0GiuLE0LDsBcQnfTHi59T1S1iQqJ0A
	 CXTxULGnYSJyfxfIeCN9kPIaYd3qnU9B5PJXCmQChxSUVpEP+H8l9bJEDQAdn800NB
	 MyeeNmSTM8wy4U4UPW1OW7OB+yyPvaZOla9Ax8o4cwIzd7ofMTzyITzNre2cNboIkC
	 IJ+b9p7no/kxLVYouATjNEI66SeYGkKFnzwmKHFY5+wUZPuVbNet9RtjaatwjCncTk
	 wfDkpVil5ol8dYNb+G1h1RgqmdYBHlrMQZSYj0Ax9HD1tr/n3SY2Wbb+U06cKBMOfd
	 jvnP04P7fHv7w==
Date: Fri, 22 May 2026 18:45:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Steen
 Hegelund <steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
 "Alexei Starovoitov" <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, "Jesper Dangaard Brouer" <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>,
 Herve Codina <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mohsin Bashir
 <mohsin.bashr@gmail.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v5 08/13] net: lan966x: add shutdown callback
 to stop FDMA on reboot
Message-ID: <20260522184545.43e00be3@kernel.org>
In-Reply-To: <20260520-lan966x-pci-fdma-v5-8-ca56197ae05b@microchip.com>
References: <20260520-lan966x-pci-fdma-v5-0-ca56197ae05b@microchip.com>
	<20260520-lan966x-pci-fdma-v5-8-ca56197ae05b@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 20 May 2026 10:12:20 +0200 Daniel Machon wrote:
> +	napi_synchronize(&lan966x->napi);
> +	napi_disable(&lan966x->napi);

Why the synchronize() before disable() ?
napi_synchronize() is a simplistic disable() + enable()

