Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5C7C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEHYRu3/7xSfEv3Cjj1c9lr1mtyqcmzcegD0em3dLe0=; b=zRyo38sHlf13Q1ujvku93xBK4R
	EUle5sbDVtJVHnn5HrRmye2uqPrDFAMJxBpgDHB68YUp4RPUSXQeGmdlCZQUcajqoeI0FHaKxPYma
	41aIVurKO5a2X2X6frQlMbPQgivXp/DQ53yW3COxnRs3BjZNZlxab/2yAfdcMGmr6luy2ZXbXWeUn
	ti5GCYB9g8htsIjkJf+YiuQEky0JO8tuR6fu2Son8jkm0cNxi16k6kLlyTM8KKxNZ2LQeRXoqXzEM
	jFgM9rwyMKR9LyLBQdcY71DqesN8n+gT5b0VY3fxlGfhkJaEnqlmBfL+4cU7faXdtX5IbddWOj9C+
	t/BAEivQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZs-00000004FxU-0qGo;
	Tue, 24 Jun 2025 00:31:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTllE-00000003fbu-03fe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 18:19:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5310F5C6233;
	Mon, 23 Jun 2025 18:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBBAC4CEEA;
	Mon, 23 Jun 2025 18:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750702754;
	bh=LEHYRu3/7xSfEv3Cjj1c9lr1mtyqcmzcegD0em3dLe0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qUkiFHzDWHjmj+7AaeUsqTx6LaoZuR658XBb6spCB6SxnOCXkpftc+SibmM3wglN+
	 QN2XhAOqBZxJE6F4qsbq9+fd695vXIOL691rtVcf9UkUBHzoTly0p6N5rg71Qz88h4
	 Ul4Epjty0Hq3du+mSGXA4mApwXSfxSufhbtjuOESEtGKjBdO6qSMrahI59kiBCIjNa
	 iwpti94HrJG6ghCZnwwNiImkK+sca5EuZuo1//Qj7bQQnZaAH0zRyYhjxAYOdbrlY+
	 QsNODuefyMv6hG0dz8X7ChbSzexhNTCQzEIxy7k+iRKynQCR7yug/AgTWRgRz+6LbW
	 LAtAyNtVP0L0Q==
Date: Mon, 23 Jun 2025 11:19:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, richardcochran@gmail.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Mun Yew Tham
 <mun.yew.tham@altera.com>
Subject: Re: [PATCH v6] dt-bindings: net: Convert socfpga-dwmac bindings to
 yaml
Message-ID: <20250623111913.1b387b90@kernel.org>
In-Reply-To: <20250613225844.43148-1-matthew.gerlach@altera.com>
References: <20250613225844.43148-1-matthew.gerlach@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_111916_094624_7AB8D4B5 
X-CRM114-Status: UNSURE (   7.65  )
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

On Fri, 13 Jun 2025 15:58:44 -0700 Matthew Gerlach wrote:
> Convert the bindings for socfpga-dwmac to yaml. Since the original
> text contained descriptions for two separate nodes, two separate
> yaml files were created.

Hi DT Maintainers! Thanks for reviewing the IPQ5018 bindings!
In case my pings are helpful, this is the next oldest patch in netdev
queue. The v4 seem to have gotten some feedback:
https://lore.kernel.org/all/20250609163725.6075-1-matthew.gerlach@altera.com/

