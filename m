Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F581CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGqLSUHMGrATPT+jYKhYD8UW7g72lzD3aJqot7FLQWg=; b=WWrjaUd6dJBAeysySukidatTNY
	CDQWOLevDmQG9IX01FR4NWBjxtKlAmBReDb6t0qhg4JLNlodAQd1V/iojiyB9JyNnPUki2qFU2T6g
	tfsT6eArqt8JqQOnzMPo477ACz75WqGQh0yBqWwQk8tT9RJfrZF5a+MkJKgrazSjjNo580YMPWQGn
	RYB4ehtVZDbbA33c+93ZpGSms6WjggcK5tJs2cK0gkcRzQcrG8PU339N9sf2VrSNFvtPVVqOo+6af
	uy0kRyqw+DxUFMK7adYkInijU4pgLq1WhsrWgNczsEM5w+Mdt7T91mtTkPeOmezG1sSDhzG61GyYk
	TpDzQqew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwSJ-00000005eMS-12D9;
	Tue, 09 Jun 2026 13:25:23 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwSG-00000005eLY-2twQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:25:22 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 6136E1D0005B;
	Tue,  9 Jun 2026 09:25:17 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 09 Jun 2026 09:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781011517;
	 x=1781097917; bh=JGqLSUHMGrATPT+jYKhYD8UW7g72lzD3aJqot7FLQWg=; b=
	bai9tG1zDY0suc4xGLSOP1BXIZWsjzOPZJ378ur6a5Vzue0j1KiUXX92wj2FcmWX
	4LFQwOZDV65hHGHAhRZNO+24/urkA7OSV3ea8F8prJU2Zigim/OAAubkj6Keb9Rd
	oDPN3TThCjZ5fCB5jpL3Kfk56ssOxiAa4sY/2CoCLHb1OM99Ipd+yRCJvjRgOkDj
	s/nBL77DBDopetNrl/d3N68OKW8CfOGnMvd3d7ouLuEzGCg08Idx0WEz9v71H+HG
	112EFbg7ReP73Y27dovdZ4nLuR4ZOZU8SOEptSgoPN8+PylIcUq5E8TjIW8Wkc4x
	bigGBKIlrPwM2r8NYoGjew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781011517; x=
	1781097917; bh=JGqLSUHMGrATPT+jYKhYD8UW7g72lzD3aJqot7FLQWg=; b=J
	rGtkjA0n7vKr3prxXunRreKsNMMGN4sZdMG8i15VdVsljZtGtq8BEIBhXcHRg0xJ
	Mkqh707HdChSXBVGE3ZmadRtTUODs3pdM8Lk0zp7Hare9TGC7OyyLGoYVC7w0e81
	0+10PuoKgH4kEgUxuNo7tEMGOo9HPD7fyUijHKakc5yzDijrsfxzNHxr0ZrQCIC6
	fDP8TRCI2zTdaM1Ug22pXttPPXRPOwWS8fvjWTbZruc8Q3mmzBJcLnZzPmMjOTW7
	f/ZAGoqYXgg7ahv4PSDDIf7fxc0BXq+lJSWjnbIV0HF6Q1m8SLqJbrg3zUMfIMYa
	iSa+vUjmJwiChZoPiubCg==
X-ME-Sender: <xms:PBQoalySK3aGwQ4qKFjTiPibZ3AaM27fPG7nv_8tKc0cknB8WN_0Fg>
    <xme:PBQoagHNaga0aIoU7HeabYEswpUBTPDhGKKMB9bbEtFVppC8eJe-Fe8OTDkHjGQ9M
    OITy4G-hZWaHvzeL7EhvGNBHnL6nygHRv3fU96MfXR8QlE-LHoAXzQ>
X-ME-Proxy-Cause: dmFkZTGtDpmmqoVfbHshe/GUl4vxwrhmR3uE88+49PG2mSnnxVFhi4azEwaA/T/pbhx7fW
    94SNaqBYBaPTi/WA17tT+vXokIGOVe30XUtprKU0Pie4wSZwE9uoth/TKnZuOuUDTROf46
    EPFaNLzsKxt+/U8JYMV5D1d+T54ve9UDbRfuKSuSfXuo0aBFhZvUEdnQdMNMM69lh8cbUl
    1qZIy+JKNofuEfl/kL8scEpjULVxKUGMc001RVWwzLPO69go1Bf6HfoQqYzSyCO5nXGXEi
    8woC0VoZM5styGPHdORTUrSEDd6SDg/81zXqsLnULnvjCmjosrpGpmTnEpgU3Hmvmt0lLt
    /Ndon63Z2i/D60XQ2jNiE5YerAk3xGorkctqFqQ77MXkRRValthqC+7LjDmojSFfoNHFRS
    7sNtxxEV/3ujtysXn3lj5vsoJCxOMKMy6rD39/qcPbyoqHMrjYpt85pZu7qAFQvmOjC68C
    jArwes5YNtQELKiEVstjjN1D6jHBmTyLAvN69Le33jSkAXh7fRi92Frw3UyfOr88yE89Vz
    WOsXiD+I+XfHRHpbRgZ48QY3zOuTVQhky+/nFXiAyu7g4G6xVkzXb1zzVIygk/U0xn0nMN
    b2pdp80S5ytdhyhlO3POd5HoCGRpxbq0DawzU12zZzCOlRbH9Van6Qg9hniA
X-ME-Proxy: <xmx:PBQoao97CWiJ9OP4ZcHAz_NATMQCzwyY5EpusLbG1NWBTyuYgGjY8Q>
    <xmx:PBQoappv3L5z0TuY5xQ3MKSDX-33o_CYZqgm5jMFH1n2M7cqT3DW-Q>
    <xmx:PBQoapkoURRYNNcHQZMze9I9L5b-BXYRM8JxUE-4L-QtElJTk8rgKQ>
    <xmx:PBQoaogAhaPjd1uJvTze6RsPsoBqIjAx8_2c3AnYxSrS5vTmB8Q9aQ>
    <xmx:PRQoapBFmEAGYI1fVPruCi8kGAS7XRgrzjk8IbpjHKEPNR_U2-UpAQ8P>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2246B182007E; Tue,  9 Jun 2026 09:25:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AWnOTg1RWIwJ
Date: Tue, 09 Jun 2026 15:24:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "gordon.ge" <gordon.ge@bst.ai>, soc@lists.linux.dev
Cc: "yangzh0906@thundersoft.com" <yangzh0906@thundersoft.com>,
 linux-arm-kernel@lists.infradead.org, bst-upstream <bst-upstream@bstai.top>
Message-Id: <731e235f-96c0-4233-b316-c7887fb99bf9@app.fastmail.com>
In-Reply-To: <20260603.193147-gordon.ge@bst.ai>
References: <20260603.193147-gordon.ge@bst.ai>
Subject: Re: [GIT PULL] arm64: BST C1200 eMMC DTS + defconfig for v7.2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_062521_005180_570E2650 
X-CRM114-Status: UNSURE (   8.46  )
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

On Wed, Jun 3, 2026, at 13:31, gordon.ge@bst.ai wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
>  arm64: BST C1200 eMMC DTS + defconfig for v7.2
>
>   Black Sesame Technologies:
>
>   Enable eMMC controller on BST C1200 CDCU1.0 board:
>     - Add mmc0 node in bstc1200.dtsi (DWCMSHC SDHCI controller)
>     - Add fixed clock definition and reserved SRAM bounce buffer
>     - Enable mmc0 with 8-bit bus on CDCU1.0 ADAS 4C2G board
>     - Enable CONFIG_MMC_SDHCI_BST=y in arm64 defconfig
>
>   The MMC driver was merged via mmc-next in v7.1-rc1.
>   These are the remaining DTS and defconfig pieces.

Hi Gordon,

There are two more formal mistakes here in your
pull request, please fix:

- keep the defconfig patch separate from the devicetree changes,
  as we will merge them separately.
- on each patch, make sure there is at least a 'Signed-off-by'
  tag from the committer (plus author, if different), and
  ideally any 'Reviewed-by', 'Acked-by' or 'Tested-by' tags
  you have received.

        Arnd

