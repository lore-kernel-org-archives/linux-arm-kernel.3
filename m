Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43001E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 00:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krLcUhB+H3+rCqm9IrFZZfanLZTEha1VXLaGt1AsXto=; b=JWCi/LYqiHEgG1Lf/o23UPoNQ7
	t0sg731geLWYomhRVm4s6gvSc6mqSSNgMDLgJRyzUtyaww4hm80zU4KWBfyF694S/M0w9urL2V9WI
	DL/H1MpDgKok4c0hpndTavSpOsIixjUHNmHb5qALDaP8VBOa+GOWjQKXi9loggdOKxAmed0JFT5OA
	mc7aHEJR1AZvsjknBJKSamUedOJD4Av6mQLzKq2KGa/LF4V2/biN5x5tsjK+N/HjhBX/8FnTdAdq+
	Uh/9bN+MGyRKtXbx1UuvIP9h+oNP3vlmWDeKoxU7dvU5zpBvqFJVjMNLfdKoyEvUJmEFnJXliTWNh
	LMgyrpyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUxW2-000000032uE-0ddR;
	Tue, 07 Jan 2025 00:32:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUxUn-000000032j4-3LUC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 00:30:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF184A41FE7;
	Tue,  7 Jan 2025 00:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530BFC4CED2;
	Tue,  7 Jan 2025 00:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736209856;
	bh=wDhSYOfboak3qK+hy1jYjiF2LpSH+HGBwrcDHRKoB60=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Hpl6zwgdR4rZ4/LVHS2TAzt0LK+XL1glv0sqbDQZP5vA/yFhfcJUM/eZMo6mBhJG5
	 XyzVwBNReTSIVRdlVitJ1NShl44sdJ0tzFaKhuvroIL1z4OEWZ6V5iR9Qu0HlW7kNg
	 6ymMwWmMG8LsBL81AQsCNwYMqgv9UXNZMC6TTPeSVj0YYaO61EtJEwaQk1aLAD9pa+
	 7pEmZ69BMmznRpGThBIONnF1Y7/r40mDlKWDJJv/TMQiD8ons7ehNGNdLqmj44+dKj
	 7upTyLTWkJ5nTVSqIm8ITzVHXzrR+oKncduJjAlNMaVm3wCqB72QGwqf0IodKWQjlS
	 nFn5woCVD5o0w==
Date: Mon, 6 Jan 2025 16:30:54 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v6 0/3] Add support for Nuvoton MA35D1 GMAC
Message-ID: <20250106163054.79cdd533@kernel.org>
In-Reply-To: <20250103063241.2306312-1-a0987203069@gmail.com>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_163057_904588_08279303 
X-CRM114-Status: GOOD (  10.02  )
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

On Fri,  3 Jan 2025 14:32:38 +0800 Joey Lu wrote:
> This patch series is submitted to add GMAC support for Nuvoton MA35D1
> SoC platform. This work involves implementing a GMAC driver glue layer
> based on Synopsys DWMAC driver framework to leverage MA35D1's dual GMAC
> interface capabilities.

Would be good if you could reply to Christophe's question.

Then please rebase on top of net-next/main and repost.
The first patch doesn't currently apply cleanly.
Please leave out the second patch, it has to go via
the appropriate platform tree, rather than the networking
tree.
-- 
pw-bot: cr

