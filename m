Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C93F4BB71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 18:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPZuuyOkZlhki+7UWHq16YlQwKX4HwZ3acsGMHI5nBc=; b=OBJhJllZ4KaM+LD1IkKoAKErdi
	5dLm2f7E1OSoNti5LxOVj184PO9IWuxnEhdnJOetX7jBDNJUkyC27P7yPyqohn/N65sd39/AzqQfJ
	eT5kktwDTaRhAF72yUcdpDHkiOAbTfg0aX5fEiAYUozv6uTm6QZhiE6hV9tjArohnWjX99KcGhFsA
	Kw1hGLzS40J+mELkuXvwO6yTfen8AH9e8SbNK7sBGi5DnE5nON4a9vVb9pHIzMGAoQQk2Tikt+qYU
	25s5Tz99ZhdJt2qKhYXxEQclrQkHW1fs/s8ic32BYPwzaatcDQC5nbLe11Ybmi5FL5epUFNp/nOl+
	d9qKFvpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuxCk-00000002dno-0fdU;
	Tue, 24 Feb 2026 18:32:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuxCh-00000002dmz-0KAu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 18:32:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C02743DD9;
	Tue, 24 Feb 2026 18:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52733C116D0;
	Tue, 24 Feb 2026 18:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771957934;
	bh=pjvAYBrvNS02jtvepugyA12PJiegFiNTbfdgM5xo/i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7knNeoc9b86Pn0zEU+63t097NFo8V1DiirlR+tFZ1FEmys2K12aiKxgV26a+Iq89
	 RW6s0i4WgFsU7xqxe8QBZwCYJNTIVU3fAwl3MGD7Aj4aB1OoJndbEf2iR6U88immAp
	 lZ+ZXHG/Xi72zzK8VDXb1mAK2vZ0209HXQk7MRNvlQC+u2HbsY+3zcDZ+XYAve07YX
	 j2P8qGLxSyl/X5aalMr+ZIKOrye9wAb9AsuokDyn+o7qEDIc7rs0g0ENF+WykPsMJB
	 rB53ZMhwaMGyIXtt5iQf/o7438b0ko4vJZyN2r+EDkjhge4ukxBR8Fm0m2Acp8dlEu
	 cszWkbq8B5NMg==
Date: Tue, 24 Feb 2026 12:32:13 -0600
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev
Subject: Re: [PATCH v2 8/9] soc: renesas: don't access of_root directly
Message-ID: <20260224183213.GA3239922-robh@kernel.org>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_103215_146745_1EECDCD6 
X-CRM114-Status: GOOD (  17.36  )
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

On Mon, Feb 23, 2026 at 02:37:23PM +0100, Bartosz Golaszewski wrote:
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> to retrieve the relevant information.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/soc/renesas/renesas-soc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
> index 38ff0b823bdaf1ba106bfb57ed423158d9103f8d..bd8ba0ac30fa91fcf2a10edd0d58b064650085cf 100644
> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
>  	const char *soc_id;
>  	int ret;
>  
> -	match = of_match_node(renesas_socs, of_root);
> +	struct device_node *root __free(device_node) = of_find_node_by_path("/");
> +	if (!root)
> +		return -ENOENT;
> +
> +	match = of_match_node(renesas_socs, root);

Doesn't of_machine_device_match() work here?

