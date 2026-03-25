Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27819FEA812
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 06:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMMtXMgWO6nJUXY1GJq46+g6ULs076NiCTMWt9PLsUE=; b=4xwAgrAyCzFmmZMF0eFYebOMDe
	Ic1obo6kpDtqBxh6ReySLThxt05vRF44XOG7QHgZOzNMd2QN01N1MXdmzq4gcWxgMUNLTvyGZVZzZ
	aNczOFjTRDi5hhG2D820UssyHGzpDpO6ASRKnxCOJnFF7BrRU1Ptp4nqAkNaXEVbphbH/LSjY+Z/1
	7p36njIiPUNYt9whAguYLIASHHhxs9xoJApmrNUpH9aaYpsAw6DAeVrXEmoVm8HBXYmYb34vhmMld
	quW9ZAFf8x7vOfkLB/g7E5L6pGNlPCCkR9UccDbAPiRhkwmnZiitxW9L3Qu7+ok49vX4eOFlKhbfp
	NghVmD3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5I16-00000002o0z-06aA;
	Wed, 25 Mar 2026 06:47:00 +0000
Received: from mailout1.hostsharing.net ([83.223.95.204])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5I11-00000002o0S-3F6C;
	Wed, 25 Mar 2026 06:46:57 +0000
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id 043DB3AF;
	Wed, 25 Mar 2026 07:36:45 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id CB4F36033925; Wed, 25 Mar 2026 07:36:45 +0100 (CET)
Date: Wed, 25 Mar 2026 07:36:45 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Hans Zhang <18255117159@163.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>,
	Grimmauld <grimmauld@grimmauld.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
Message-ID: <acOCfYR3ii8RoKLz@wunner.de>
References: <20260226101032.1042-1-linux.amoon@gmail.com>
 <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com>
 <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com>
 <DGZJBMG2Y738.2MU5LXVGEDD47@kernel.org>
 <acNYJ2dyPaEzabYL@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acNYJ2dyPaEzabYL@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_234655_979387_59CF0BCB 
X-CRM114-Status: GOOD (  14.38  )
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

On Tue, Mar 24, 2026 at 08:44:22PM -0700, Dmitry Torokhov wrote:
> I think the bigger question is why PCI does something different from
> every other bus? Why doesn't it rely on driver core to bind devices to
> driver?

This was introduced in 2013 with commit 4f535093cf8f ("PCI: Put pci_dev
in device tree as early as possible").  Corresponding patch submission:

https://lore.kernel.org/all/1358803252-20639-12-git-send-email-yinghai@kernel.org/

The rationale in the commit message for performing device registration
earlier is that devices would otherwise not be found by for_each_pci_dev().
I don't know why that was a problem at the time.  The patch is the last
one in the series, so there's no other patch succeeding and thus
depending on it, which could provide a clue why this was necessary.

Needless to say, changing the behavior now risks regressions.

The author of the patch is apparently no longer around.  Last activity
on the mailing list was in October 2017.  Access to kernel.org infra
persists though, so maybe he's still reachable:

https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git/plain/keys/A7C92F7A39BD11DA.asc

I'm not defending the patch, merely trying to explain the history
as far as it is possible.

Thanks,

Lukas

