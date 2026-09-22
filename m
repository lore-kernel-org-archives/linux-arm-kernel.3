Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73456C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 05:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJG6I5Clw5SCk/1VpkRKC4P7mxnCryzaJv4G7QIe0/Q=; b=vEvyxLnx4duHX5FEx4C6s02GiK
	rNzuHfPNvmteNggECp1SzRS9n1bzaWT0bNjBXtOIxVO3WZjIakz06HkZxx+I6zPvvpw7C8O/0dRiv
	vQf5Itpii19CXykTKhcb/MD/kalNQBWLNlRVIbjULgqre3GXifO3uufRzfYUt3aor5O6s0pb9PfDX
	Xh2lMlzmlafdOcn15Jon8NS2wJii8hJKBdqgp3fseCdUqSEKtgtK4WhGxHoRGo76EFFjkDARkFP7p
	lPFkz593ELxyIB9PbVh35Uzm5SGmO11yfD1F3/5d3We1qjDcJ/w6ryxvROVAc1Ar9dyS1Iijn8vG8
	3E0w1IQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8shU-00000004Dno-2GvT;
	Tue, 22 Sep 2026 05:05:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8shT-00000004Dng-33PO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 05:05:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 010B540DA6;
	Tue, 22 Sep 2026 05:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2E81F000FF;
	Tue, 22 Sep 2026 05:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790053550;
	bh=GJG6I5Clw5SCk/1VpkRKC4P7mxnCryzaJv4G7QIe0/Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cxzkTsg6YpwwvdbpuJvSO/ID7WPyYAPxPa9VxLV/seFyHqIQcuYktPfzIZWv3Pn/r
	 90tVtBDRiq3GJGXjb1/hB65AgHECqvX1kq0ukuddED6Rx+plCtncZ0sz7uLqvrPlXx
	 vyOjEGpXaKqPZ61meUlQ5uUydsTCKMA6Ltzr0rpDamWSsy14HARnnb1cwOQ/0QMQnL
	 zOky9+H9ruIRu0xY9YD5vkCA02BYOW63W/3qwbb02+mypTtgNB4nYjsSgKR1TPwTr1
	 Q3TVsEt28jmOfWRA5KdOa5qh3p25iXvRWMyYc5ZQiuHb5Zy0+gyQJW0FofpPoraiCa
	 +vdBYJSdico/w==
Subject: Re: [PATCH net v2 1/3] net: stmmac: propagate platform mac_finish errors
From: netdev-bot+sashiko@kernel.org
To: tom.karpiniec@outlook.com
Cc: netdev@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux@armlinux.org.uk, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 yong.liang.choong@linux.intel.com, brgl@kernel.org, coiaprant@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 22 Sep 2026 05:05:49 +0000
Message-ID: <179005354933.2160803.8939564905853996739@kernel.org>
In-Reply-To: =?utf-8?q?=3CSJ2PR11MB8401FFBBECB8FBBA9C002134E4872=40SJ2PR11MB?=
 =?utf-8?q?8401=2Enamprd11=2Eprod=2Eoutlook=2Ecom=3E?=
References: =?utf-8?q?=3CSJ2PR11MB8401FFBBECB8FBBA9C002134E4872=40SJ2PR11MB8?=
 =?utf-8?q?401=2Enamprd11=2Eprod=2Eoutlook=2Ecom=3E?=
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Incomplete fix: the bug class the commit message claims to close
  ('Phylink then treats the interface as successfully configured and can…
- [Low] Continuation-line misalignment introduced by the patch in
  stmmac_mac_finish(): after adding 'return ', the open parenthesis of…

--

net: stmmac: propagate platform mac_finish errors

stmmac_mac_finish() previously dropped the return value of the platform
mac_finish callback and always told phylink the configuration succeeded.
The patch returns the callback result instead, keeping the zero return for
the case where no platform callback is installed.

No Link: tags present in the commit header.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 1fb5f804ea23..1350e92943ac 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1048,8 +1048,8 @@ static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
>  	struct stmmac_priv *priv = netdev_priv(ndev);
>  
>  	if (priv->plat->mac_finish)
> -		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode,
> -				       interface);
> +		return priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode,
> +					     interface);

[Severity: High]
The commit message says that without this change "Phylink then treats the
interface as successfully configured and can report carrier even though the
SerDes is not ready".  Does that failure mode still remain reachable on the
Intel mGbE ports after this patch?

intel_mac_finish() in dwmac-intel.c is the other in-tree mac_finish
implementer (installed by ehl_sgmii_data(), ehl_pse0_sgmii1g_data(),
ehl_pse1_sgmii1g_data() and adln_sgmii_phy0_data()), and it ends with:

drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:intel_mac_finish() {
	...
	priv->plat->phy_interface = interface;

	intel_serdes_powerdown(ndev, intel_priv);
	intel_serdes_powerup(ndev, intel_priv);

	return ret;
}

ret here is the value from intel_set_reg_access(), normally zero, so the
return value of intel_serdes_powerup() is dropped.  That function has three
timeout exits fed by serdes_status_poll():

	data = serdes_status_poll(priv, serdes_phy_addr,
				  SERDES_GSR0,
				  SERDES_PLL_CLK,
				  SERDES_PLL_CLK);

	if (data) {
		dev_err(priv->device, "Serdes PLL clk request timeout\n");
		return data;
	}

with the other two covering the lane reset reflection and the
SERDES_PWR_ST_P0 transition.  serdes_status_poll() returns -ETIMEDOUT after
10 retries.

Since intel_serdes_powerdown() has already dropped the lane to P3, a timeout
in intel_serdes_powerup() leaves the lane out of P0 or held in reset, yet
intel_mac_finish() returns 0.  phylink_major_config() only records a failure
for err < 0, so phylink still sees success and can raise carrier.

Would it make sense to add a companion change so that intel_mac_finish()
returns the intel_serdes_powerup() result, so that the propagation added
here has an effect on this platform too?

[Severity: Low]
This isn't a bug, but the continuation line no longer lines up with the open
parenthesis after "return " was inserted: the argument list now starts one
column further right, so "interface);" needs one more space to satisfy
checkpatch.pl --strict ("CHECK: Alignment should match open parenthesis").

>  
>  	return 0;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/SJ2PR11MB8401F5C3A075DE2A0013E063E4872%40SJ2PR11MB8401.namprd11.prod.outlook.com

