Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277F6CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 14:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnBajJ/9WX0bed1VfrPoe2havxj9mVkc39fNvZ3AjpM=; b=Me3TSnuFo7plZ2jfnwS4+a7CKq
	Fx7fkxJGhV/e3ipfGsWzIN4h7NH15pkW0nkPFumOwn0cFSWNqjr/LDa1Phk7zXf6Edjot6nAsmo8H
	CE8o7aZki7NqVD8w4/e+jw1wz3r8uIAs0QKRPZB4KlquhP8wq7pK/d3RqjZ9WQu+Vm1YlumnjVlbF
	8leUvBSBD7KJtXblp9VYgTXUVbMdABxablcvhX6+9feADdXw1Wm7gniZS/XcIAubxXSJi0AW854Z1
	0iURz365WBDs2ZgNF/54WcsFPD/dnuQcBRZY5VmQbqLwh8jIQenKcI/3A+35LqkmMhh7/iszPALCv
	f5vG/kbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzT4-000000041ZG-0DaR;
	Thu, 07 May 2026 14:12:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzT1-000000041Wo-2lMG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 14:12:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52A5244001;
	Thu,  7 May 2026 14:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85F3C2BCF6;
	Thu,  7 May 2026 14:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778163162;
	bh=huVUPART2jTXeXW7K4I2VW/dRB4xvecgCc0kX0CTQBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pci39C5h/cOMDDSO2oyymDLmiaq4ZXMfTibB/Yg4C+bcbVk+Q7SOTDWci19669I7T
	 9DRuDg+kLVm26zNKDuYWGMP56moGFlMngR20Oc2KrpjuGsyRYA39Ya97CyZ0dOD6Yr
	 kKs5XXs7HqJ7YCnnDiONnBAWOLXw83TvgY3+OgRwNdz54SXaZvtieYsBZ/EsRBvx8X
	 TkEtq++dws3GH2BDJewPUQajhV+rRb1OtYZCisTi27/2lezWaedJa3IfS2WWcwju3t
	 1MvkDZX8t/0H9nMbeMR/1+xrr8P31LyvlRcDl+Q8C/vPoKzp2V2543XWpdh1c46d3P
	 B9j8Hy77aZRfA==
Date: Thu, 7 May 2026 09:12:33 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com, 
	rmk+kernel@armlinux.org.uk, konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, Daniel Thompson <daniel@riscstar.com>, 
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com, alexandre.torgue@foss.st.com, 
	ast@kernel.org, boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, 
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com, 
	inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com, 
	livelycarpet87@gmail.com, matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, 
	me@ziyao.cc, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	richardcochran@gmail.com, rohan.g.thomas@altera.com, sdf@fomichev.me, 
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com, wens@kernel.org, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
Message-ID: <afycOwz5TpkegkZd@baldur>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501155421.3329862-9-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_071243_718619_7B241612 
X-CRM114-Status: GOOD (  10.51  )
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

On Fri, May 01, 2026 at 10:54:16AM -0500, Alex Elder wrote:
> diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
[..]
> +
> +  gpio-controller: true

I don't have any concern with the use of a proper gpio driver to model
the implementation, but if I understand correctly this relationship
between gpio controller and gpio consumer is strictly internal to "the
PCI device".

Is this connection variable or is the link merely expressed in
DeviceTree to mitigate the fact that you choose to implement the
responsibilities of the two parts split into two device drivers?

Are there other consumers of these TC956x gpios which would result in a
board designer (and hence dts author) to ever reference this
gpio-controller in a different way?

Regards,
Bjorn

