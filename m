Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29944C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 11:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+6HfTUJJr4nmVrmFlGQYtIMuov7i8x90UU1hsBwAwk=; b=yV8nRYnpwBUsZXyF+0XzVuKHV6
	3pjnujDWkUnPbKK7YSaWo/Kkkrwr83gCtigI81vhxjaHhJGWk+vz/iWh1kytTBi/QlCRuissu2jE0
	CUT1XFp4w+H+DMstEvyU69Xq5lbhD+MeZHVKssOEHX8U9QcbgrLvSdZkS4CsD48OjhXdMaK7n3Kb3
	5X0Q5jfYnBfY+NV4NFI+hKORm1peUhFUzQNBe8vaLq6B/VDs6u2H9Jx1HBj3rvl4cpXT8tGM1MTFJ
	kZPs3srKyqtqUX0cxV66N99gc0kPH7uA4Xv08HEMthAj9m0U5oBThqNm4ITNrlFzaT+1+nQ2jAa7G
	uGKTNndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzDSh-00000000DsT-1qxK;
	Mon, 31 Mar 2025 11:37:51 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzDPX-00000000DQZ-3ulM;
	Mon, 31 Mar 2025 11:34:37 +0000
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 96243138440E;
	Mon, 31 Mar 2025 07:34:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 31 Mar 2025 07:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1743420874; x=1743507274; bh=9+6HfTUJJr
	4nmVrmFlGQYtIMuov7i8x90UU1hsBwAwk=; b=uYzSHDLTNm7iIL8QZLbp4HypKs
	Odui5y+2SuxJivh4Wz1s5I75GN0xYVZ0jyvEU7LnQW6J4MyEkRiGxGCh0DIgFZ6y
	7TgtwYYX7tMz9ax+VPOPZvWB6bywwjlcfVYtTFVAEBnuspipyX5WovK7bGK2t8Mf
	fNHIBS48xc/IIJT0NKsg/5cy4hoKsh/1kp7wy9YtX2IQnu/iVPLUlMoiya5E1FWe
	T3S8GU1Im1BsRBDlhTHmCRS0pr99f8QEoSellYWhXNmXQhLah8V+rxvsG00xUd4d
	P6AkjzL4hNZAyWfc9Pt3Y+dLkiy40C1KcLVEZLT7QRQ5sDXXfJClul2KGE1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743420874; x=1743507274; bh=9+6HfTUJJr4nmVrmFlGQYtIMuov7i8x90UU
	1hsBwAwk=; b=P9u4JZ/E5p/LPH1RFQRw8EXo1cDPkWfohL2ndb+B1MPjjjjR+yV
	S/vKj2kDHwY4BPqng6nUUUKJ14UheqwI3fPZgVstqHjNQ3msEABvdhJmWKA1aeFv
	pUNuv6iYBjh4CDCfLeGlaGL81OImW4V4Cm/UmkInVS3vIryGpV6lpHvFRKQ1fAKY
	l/hEm8slosd1pKsL542stSe8LiZJ9ekKOD9SejMNtVe6QBXUBppP6g3y/GEQHRbt
	Z552Zx2GeaCIC2rTP4zSRTrFKWlG3ygsbvoKEthbJ14KxrNmulxolAcEzPKwU2k8
	xMPdkCKrifS/J+NDMLiA5rRCjunqHbtVcmg==
X-ME-Sender: <xms:yX3qZ2IrMtE4ziE3Sja65Kk0pOed8O-sgGh8PfKpDUk-uTUNOSHvWQ>
    <xme:yX3qZ-KgpGfK-C1CgD9v2QtUzRYvpFc2GHFYQto00qsGRcpdK3SmPDorgZm-OtZQh
    lUc6F6ZQLIQnO71wyw>
X-ME-Received: <xmr:yX3qZ2vkW01-yt-VhmdrSni9Kx8E5ue7BbKKwthaX20305tY_TemNyYwYRzqtwTavPh6qLH92KBjh9A-AhkC650jgPEuhA35dQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeelkeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhf
    fvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfirhhunhgr
    uhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfdvffevleegud
    ejfeefheehkeehleehfefgjefffeetudegtefhuedufeehfeetnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpd
    hnsggprhgtphhtthhopedvuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhh
    rghordhmihhnghihihhnseiithgvrdgtohhmrdgtnhdprhgtphhtthhopehlihhvihhurd
    guuhgurghusegrrhhmrdgtohhmpdhrtghpthhtoheptghhuhhnkhhurghnghdrhhhusehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehfnhhklhdrkhgvrhhnvghlsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidr
    ihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhi
    mhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsth
    hsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:yX3qZ7bP3yAWS1RmT2r2TKaytqtPfQv-xMlVxInmDbwjpXMOgHb70Q>
    <xmx:yX3qZ9a49J8_rETxv7LGlw8lP2qK5DfY2IrYtFtwOc13AR5xavNMew>
    <xmx:yX3qZ3CTcXMOO-rCFfY0in_eBkhsjAmcAtVwdgTbg0b2r2zu2u-M6A>
    <xmx:yX3qZzb4r68zmOoOC3u0IiJFMwt4_kc94suGi0814VWxAuG9RAmzcw>
    <xmx:yn3qZ7yANoCmkr3mCisPpjMqdzVKabDvQohhb3bqlP8t-Cv6FRI_PHc6>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Mar 2025 07:34:32 -0400 (EDT)
Date: Mon, 31 Mar 2025 13:34:31 +0200
From: Janne Grunau <j@jannau.net>
To: shao.mingyin@zte.com.cn
Cc: liviu.dudau@arm.com, chunkuang.hu@kernel.org, fnkl.kernel@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, yang.yang29@zte.com.cn,
	xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn,
	tang.dongxing@zte.com.cn, tzimmermann@suse.de
Subject: Re: [PATCH 1/4] drm: adp: =?utf-8?Q?Replac?=
 =?utf-8?Q?e_custom_compare=5Fdev_with=C2=A0component=5Fcompare=5Fof?=
Message-ID: <20250331113431.GB246397@robin.jannau.net>
References: <20250331172534353mkMR1nv-dsjFTZTXCPY0a@zte.com.cn>
 <202503311728456105AyS6yPwkx8Ccwv6GviVL@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202503311728456105AyS6yPwkx8Ccwv6GviVL@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_043436_040752_37345970 
X-CRM114-Status: GOOD (  14.85  )
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

On Mon, Mar 31, 2025 at 05:28:45PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Tang Dongxing <tang.dongxing@zte.com.cn>
> 
> Remove the custom device comparison function compare_dev and replace it
> with the existing kernel helper component_compare_of
> 
> Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/gpu/drm/adp/adp_drv.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
> index c98c647f981d..32350c1a5c1f 100644
> --- a/drivers/gpu/drm/adp/adp_drv.c
> +++ b/drivers/gpu/drm/adp/adp_drv.c
> @@ -551,11 +551,6 @@ static const struct component_master_ops adp_master_ops = {
>  	.unbind = adp_drm_unbind,
>  };
> 
> -static int compare_dev(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  static int adp_probe(struct platform_device *pdev)
>  {
>  	struct device_node *port;
> @@ -579,7 +574,7 @@ static int adp_probe(struct platform_device *pdev)
>  	if (!port)
>  		return -ENODEV;
> 
> -	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
> +	drm_of_component_match_add(&pdev->dev, &match, component_compare_of, port);
>  	of_node_put(port);
> 
>  	return component_master_add_with_match(&pdev->dev, &adp_master_ops, match);

Reviewied-by: Janne Grunau <j@jannau.net>

thanks,
Janne

