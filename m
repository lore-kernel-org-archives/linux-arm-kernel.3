Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40556C98330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 17:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7tn7xMQ/3Gyf8htyyRCNZJNLea2G+jrvfBLiBrEmgg=; b=1LeX843KBe5lSg4GLBCnyEY5LG
	oxxpU6wSAARJyIlUFHVyl6F1F/Aakug2ebaB0mW3lCAmq5v9hSYyVrN95BXf5o+WQT+Z6YPFlA9kb
	UJa4FrBgpuMgOd8oKjTH4Sf4+1vKTTdrFTrtxfQqridADxSh6g/lI9EmhRGY/RONhTSYlCrBH9jgQ
	A0DSzGSeQVIodVRO2tPADPUwLAVEpCJkfOK3KVyLtrwuDMZGZebo4x4b9Rd/zf4jfDdYh1LS7Y/VR
	ysnFygqlN41gDCpToFWJ3yfI2GercMdapOYfF5w9Rf9GmiiRE6eOUip2IDtvaC/AP9l7ieuUrt2wq
	1P0xskPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAFn-0000000Fh6D-3TKB;
	Sat, 17 Jan 2026 17:38:27 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAFl-0000000Fh5T-0HVQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 17:38:26 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 22401EC0575;
	Sat, 17 Jan 2026 12:38:23 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 17 Jan 2026 12:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1768671503; x=1768757903; bh=s7tn7xMQ/3
	Gyf8htyyRCNZJNLea2G+jrvfBLiBrEmgg=; b=lLGEGnZpdxhVTjBVsk/xAiFCUp
	CzonC3v+wGWJB9pxIqXRHVAWP4uysF4aTpmbC832b1SJuDJUHIuAiJ8G8SaN8Po/
	f58xGYICU15tGh2XgjE1zraJyWq4Ja0tpPZE4AEcvLgRdX+HqG4Lzil/BjgdcM1X
	TdnxjIhRvmClCHVeM3yQgVbWTW3aBmKh9ksQXqYP2ym9C7kVVoBUzBIajw70QYwm
	FgrGMrqpqF2O9fJ6OB1gHw88xXFaf0L1DrD1qjRqv2MHKgaALwQwqKKGsDHsc9n0
	R/WY3Rrky3wjgwydNOJEQqORJoDye0GyakOgB3li+FCTO+phYAOfq+d2Thaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1768671503; x=1768757903; bh=s7tn7xMQ/3Gyf8htyyRCNZJNLea2G+jrvfB
	LiBrEmgg=; b=AIXJMmW7oxZgWae79N51IazVJxO/IZuzTS4pL7sVO/CfBwVMDlS
	c9f3CfBq8S0rrzfXkCLARKbxZt9WGnh+ZQ4jxGtFSm4PHDWUrBAPNNn090wReVBb
	epRqE7evGul17PM7pF73Mu638arILI8aD4l1NTsQabgpR/B843LngY8nndf1QwOk
	/QITKWSrh+CeCebPNli0Z1KSTVYinnlqgmK/qZ1PpJ972T7P5zX9W+PK/hwLi247
	2mysi2q3CiyQxBY0Rk3Ha1SclvUoXWiIPd4CNcpfZS5leq/ffW+pNuPYyDNJ2eod
	LKkyPz+6QAAU1uSXeRLmmrxrPkUFbNqVaaQ==
X-ME-Sender: <xms:DslraX0IGyYJ6zDxGAuFHiMTNTHpRyS1djI0E1q5GE8yXusD-BBnOQ>
    <xme:DslrafBEW8AIZmCdsY_UFWlykkTly0Z5xZExnTZt0Q4UA0Zo2zq_axryRxN5pV9De
    MKOxW0oupI__W6Vcsdx47R0A10dxUfKjjDsXKjiAaP16srO5Go-YQ>
X-ME-Received: <xmr:DslraTdCReo5rKuu4Y29Lc-z46wU_UkYBzku7KzmY1x8OZaIfs3Kd1IfEeFTX1mUdhP8upc2V8SxDnIwtGHVXLldF3dPcg_-EmM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufedvgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggrlhesghhomhhprg
    druggvvhdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhr
    tghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Dslrac7cH60NYRMrE-XmCDdJisvyGU2sHhxddBzGPvpy22dL_XOgSA>
    <xmx:DslraWVyndFqfvfxl6HPKVdoqjfkrMLXtXbTYkoU5qQkoAIhZ5oYmA>
    <xmx:Dslrab7i2aP6tPR5kV1Ex9kezlwLcccwgze3H8udstRW6HQyVruwuw>
    <xmx:DslraRoOGrczNsg3kwdN-yz0XddJVa_wQ0bsuTyH2dPVNv-z9o0uXg>
    <xmx:D8lracA8tXkJXch_D8PlwaQLKv3W7USIHEMcbaXXSwA0o8ewBQMsa5na>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 12:38:22 -0500 (EST)
Date: Sat, 17 Jan 2026 18:38:19 +0100
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: apple: rtkit: Add function to poweroff
Message-ID: <20260117173819.GA55832@robin.jannau.net>
References: <20260117-apple-rtkit-poweroff-v1-1-6fbe8145e965@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260117-apple-rtkit-poweroff-v1-1-6fbe8145e965@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_093825_601847_06370563 
X-CRM114-Status: GOOD (  19.41  )
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

On Sat, Jan 17, 2026 at 06:24:44PM +0100, Sven Peter wrote:
> Add a function to put a co-processor into the lowest possible power
> state from which recovery usually isn't possible without a full SoC
> reset. This is required for the USB4/Thunderbolt co-processors which
> can be restarted since the entire USB4 root complex can be completely
> reset independently of the rest of the SoC.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/soc/apple/rtkit.c       | 17 +++++++++++++++++
>  include/linux/soc/apple/rtkit.h |  7 +++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index b8d4da147d23f7e99e76eea314e4d976cddbd1c6..381faaf74d5982163d2c44d1e2c6e0ddad07bd73 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -851,6 +851,23 @@ int apple_rtkit_shutdown(struct apple_rtkit *rtk)
>  }
>  EXPORT_SYMBOL_GPL(apple_rtkit_shutdown);
>  
> +int apple_rtkit_poweroff(struct apple_rtkit *rtk)
> +{
> +	int ret;
> +
> +	ret = apple_rtkit_set_ap_power_state(rtk,
> +					     APPLE_RTKIT_PWR_STATE_OFF);
> +	if (ret)
> +		return ret;
> +
> +	ret = apple_rtkit_set_iop_power_state(rtk, APPLE_RTKIT_PWR_STATE_OFF);

inconsistent line wrapping. It's wrapped for AP power state which is 1
character shorter. I would wrap neither it only moves the statement 4
places to the left.

> +	if (ret)
> +		return ret;
> +
> +	return apple_rtkit_reinit(rtk);
> +}
> +EXPORT_SYMBOL_GPL(apple_rtkit_poweroff);
> +
>  int apple_rtkit_idle(struct apple_rtkit *rtk)
>  {
>  	int ret;
> diff --git a/include/linux/soc/apple/rtkit.h b/include/linux/soc/apple/rtkit.h
> index 736f530180179bd144cf85eb0f0bd93844d7188a..bda3c528b51553c13f7fe5685ab60f7fc675361b 100644
> --- a/include/linux/soc/apple/rtkit.h
> +++ b/include/linux/soc/apple/rtkit.h
> @@ -125,6 +125,13 @@ int apple_rtkit_wake(struct apple_rtkit *rtk);
>   */
>  int apple_rtkit_shutdown(struct apple_rtkit *rtk);
>  
> +/*
> + * Put the co-processor into the lowest power state. Note that it usually
> + * is not possible to recover from this state without a full SoC reset.
> + */
> +
> +int apple_rtkit_poweroff(struct apple_rtkit *rtk);
> +
>  /*
>   * Put the co-processor into idle mode
>   */
> 

Feel free to fix without sending a v2

Reviewed-by: Janne Grunau <j@jannau.net>

Janne

