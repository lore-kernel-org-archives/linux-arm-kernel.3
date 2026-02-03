Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965B0E8B37C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 22:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJ5plnrs+BfR1wOWG2wWBqV8kdp2nzqWPZUxyUrkUkk=; b=ylJ+7Q1A2AioFPpTPBWS28sYz5
	2Gr3avEcLwlZ/Q5Fu0Q9gwZkvF2pz/jBcCZJ5V960ZHGeRooNK1Rvu6y1mm7DNOfth4YVTM4d5Dwz
	WIlK5cQuwcpQXa8BjwgoTQdFISWogXEnaNoHauztdgJ7i1XnLDbWPvbombunOXBRrbVqd9MtEongo
	nxqSfhYY9C9HJEHowyo+kvVzL+vC31kp+arpXvFqvRutPROXI4pXvKMZpYFcbUV0qqwJ5Xq3IbwQM
	HP3w1LB+0/p+9XPCFHgO050zUHROjRV6NiLWk0miL95aXr984T9C2CTQBJnPmwBsMELf6anE4EQJs
	Cygi9PdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPIA-00000007W4v-3gBc;
	Tue, 03 Feb 2026 22:54:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPI9-00000007W4p-3DHQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 22:54:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0017D60134;
	Tue,  3 Feb 2026 22:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E38C116D0;
	Tue,  3 Feb 2026 22:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770159280;
	bh=xTEa66SqIkzAleDgDRd7lGWFimq5gjopqYwFXFVLDpQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sjCVV9peYhhrciKha3J/XPkboPPVtTmNcInZhTc+F62AFgALdSSL+Hmzh3A2B1EZw
	 Arb6xJM4W1nFMQHJ3SDeign5nxpIop7IWk+jPnwsbnxebEoNgGkNU9yyuUd4JXgWp8
	 uzRMtCfHfyqKmTWraf02FKOFcXLaV0kNPjJdZtK16eOujseXLzblXMxMdLyjtshz6e
	 XpLGxeymh3oTeJzBWHskWP+FjM38PaSmDrWkwiV9MOHXwXgPgcGCmV7tmjtrBEmWup
	 7ZfQI4kVJN5yRgs5VWOkBuS6/mK9mZoru9ha9OUUsxkn0fL38QTmXizln3FJaYtyfx
	 BeatimVe6FgrA==
Date: Tue, 3 Feb 2026 14:54:38 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Chester Lin
 <chester62515@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Eric
 Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>, Frank Li
 <Frank.Li@nxp.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 imx@lists.linux.dev, Jan Petrous <jan.petrous@oss.nxp.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Matthias Brugger <mbrugger@suse.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, NXP S32 Linux Team
 <s32@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring
 <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linaro-s32@linaro.org
Subject: Re: [PATCH v6 0/3] s32g: Use a syscon for GPR
Message-ID: <20260203145438.5a850b61@kernel.org>
In-Reply-To: <bdb7cd69-7dcd-4e8a-b04a-14a2eb902311@redhat.com>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
	<bdb7cd69-7dcd-4e8a-b04a-14a2eb902311@redhat.com>
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

On Tue, 3 Feb 2026 12:18:54 +0100 Paolo Abeni wrote:
> It looks like patch 3/3 depends on 1/3 but it should land in a different
> tree, as patches 1 && 2 looks suitable for 'net-next' and 3/3 should
> probably go via the arm/freescale tree.
> 
> We either need explicit ack from freescale maintainers or this should be
> split across subtrees, right?

FWIW normally we don't touch the dts patch at all, unless the
maintainer chimes in and tells us to take it. No waiting for acks.
Off the top of my head us taking dts patches only happens if 
the person posting the patch _is_ the platform maintainer..

For this series we're waiting for the bindings to be reviewed.

