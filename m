Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F22F55434
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 02:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXN/eInJZvrExBtU+sDs825VLVWTmFbt87uoQKuDH68=; b=sLi8rDlmvAfC1rY/wvdlyYeOTC
	ucSPjWGjMypHippad/aoOnf0p5V+BOnInj0MF1awJFt4vUZqfshmkqKOrbho3bU3hGfPJxavR4ctS
	Ax0J6QCENRnN7h9kD7m2erltgLqHxLGh/2dWKf1fPL8n1GyBATwdsp7fc0bscgAOt7sAVIC0FGr4C
	1J1KxTeWU0piNvVEOUPwJ/gz923hrPpRbOHNOYT/vrVeEDWKijQg1rmzn4MzoShdzDxSTtHOKsq8/
	51GDXM3KYwU8w0EG8hJMJ3cxjlCwjP9eC9YDD7XGQqH4s6dpFaU/Bju8rA3S1F2a+W/s8+nWqG8MY
	oupYyk4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4Tf-0000000352A-3RCq;
	Wed, 25 Feb 2026 02:18:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4Td-0000000351p-3crt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 02:18:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12B41419B1;
	Wed, 25 Feb 2026 02:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78074C116D0;
	Wed, 25 Feb 2026 02:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771985892;
	bh=koEn24MdSI/LDateH21gj05ZN5t8MXb/Q7bk0NhGEDQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R12LEGpoVZ4usUFdsXQlyBva25EGZb+B98lQOXagtsziw9WaEm/SF9gtZ4t6l/VFk
	 pxU3eSEckS97ptJ0k/biQMe/oMlB38EDRj9QS3HLF8hHOC+Onjt3Ssg4CmEQuzMQNC
	 tsA5E65lQ8lX4DXRZmLdCOgMM6EM7NsKGbfyXlEMG07Xl/xr9QhfwjTJOeCaqnrGtq
	 XPv7zRohxtMXM18spQuApMBRE6jy6xtI+gICqr5d0pxGvmu2pmIVE6NWopWFihQo2+
	 meVNcj8pppXjTctgqPHksh4TVTGOXIeG2v8C7l5ynHLNpjqdNfwAVgOnoTIc0WPWxw
	 JdirW4HxpE8Dw==
Date: Tue, 24 Feb 2026 18:18:11 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jose
 Abreu <Jose.Abreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, Paolo
 Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: ptp: limit n_per_out
Message-ID: <20260224181811.611e16cd@kernel.org>
In-Reply-To: <E1vuUvf-0000000AfhS-0lJR@rmk-PC.armlinux.org.uk>
References: <E1vuUvf-0000000AfhS-0lJR@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_181813_938679_D71B0702 
X-CRM114-Status: UNSURE (   7.45  )
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

On Mon, 23 Feb 2026 12:20:47 +0000 Russell King (Oracle) wrote:
> +	if (pps_out_num > STMMAC_PPS_MAX)
> +		pps_out_num = STMMAC_PPS_MAX;

How would you feel about tossing a dev_info() / dev_warn() in here?
If nothing else if will prevent script kiddies from sending a patch
converting this if to

	pps_out_num = min(pps_out_num, STMMAC_PPS_MAX);

which presumably you don't prefer.

