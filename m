Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF3DC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 22:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVueEXeSmiJbNmR3RqJkm1geuIWo49OFRoKB4g004mk=; b=W3/p9gukfMniloFnyHfH+04Bs1
	j6qgkKwAJB4m8dlX/cobyi3AmujbZb2MgpbTRI632kRg5EOKE+Od+0TwwAzz0nghOKQvxp50brVdN
	EOA6m7pV0qSbFBJW9I3OrNtw3MvxqMJZtySzbiH/Bld5Ccy0ENQMnmZmPucyF5fT5hYaKs9HU2G8p
	JlWt0FVbAxiVyV3RnJ/qm4gNMbkSlmIdejtVlpW/PPbBBirkZjSbMEYBN9tXmZtmEsiTVdbD7d4vC
	D515VdF99V0wOQwkQQCpVsVbUKcJbY/hE3Vzn2m5BUFENsnr4eCsSjclyksTsEPUvrrEht20lXAsn
	cC+1l45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjQa3-00000000pZ9-3oLH;
	Sat, 15 Feb 2025 22:24:11 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjQYb-00000000pOp-2Knt;
	Sat, 15 Feb 2025 22:22:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1739658154; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YmF0IvhOTmnh1dWu4RSf+qquro+asXnI7k1O/zgivywQaFcyAfWAgGtqmRkB8E4ja9BlsbhgxhMVPz4QH5p/QVXgk50ywxHAxCCVFS9CTK0t+Edl43GAFpAilIyuH5oiH1OT/VP5bX420ESoBJKKDjbkOHuptQ1hbHzEU+F9aTE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739658154; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YVueEXeSmiJbNmR3RqJkm1geuIWo49OFRoKB4g004mk=; 
	b=HrZzDYkI0zwBMDxtIjo2KLRzOW0BD8Cg3l1qSdT2vHE+dgKEqhR+YxXCbPZCw6vfZgrbnV4g7twlYowwV2yGxK5IbHvjlhqKkJy3VjBLeGhmE7SKDZDbdcyDTddDqrV3++Er9NNtY3eHMdF2zb20aMTT2N/37alqbLEiHG7frxs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739658154;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=YVueEXeSmiJbNmR3RqJkm1geuIWo49OFRoKB4g004mk=;
	b=Rnb111bkeEICQFLq0dYD5MIejs26GwCkuq5M9aND+MgbcpqucEwp9vhFSzWfO/22
	x+fhAMxpAtp2Y4/AX+kyJMl7igyFOYS6PjiDEO1L+4pXinoMS8HYZsAPdrh9l0di2e3
	WAMIbW12YWs/++UhXQgoRisIe/S39P8bsRUngPLk=
Received: by mx.zohomail.com with SMTPS id 1739658151880996.3267160015083;
	Sat, 15 Feb 2025 14:22:31 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 6ABFC180CDE; Sat, 15 Feb 2025 23:22:27 +0100 (CET)
Date: Sat, 15 Feb 2025 23:22:27 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: linux-rockchip@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: add hdmi1 support to ROCK 5 ITX
Message-ID: <ltuyyul4vqyavsqvaue25tdbtjzpwkmq2smtsedidgyomu7d4w@rxsxbdgzheba>
References: <20250215152550.3975614-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215152550.3975614-1-liujianfeng1994@gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_142241_692102_35EFDDD8 
X-CRM114-Status: GOOD (  11.08  )
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

+cc Piotr Oniszczuk because of [0]

[0] https://lore.kernel.org/linux-rockchip/C81810F2-6E9B-4DCC-85D1-CCB63CBFBFEA@gmail.com/

Hi,

On Sat, Feb 15, 2025 at 11:25:45PM +0800, Jianfeng Liu wrote:
> Enable the HDMI port next to ethernet port.
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
> 
> [...]
> +&hdptxphy_hdmi0 {
> +	status = "okay";
> +};
> [...]

&hdptxphy_hdmi0? That looks like a downstream thing and also for the
wrong port?

-- Sebastian

