Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27B6C5B559
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 09:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOMikGDm0MmBx1ffFfqI8HnHprOULeEnm50fJ4rduiM=; b=2zO1KOT4eSecPA6C+BEEPwsuAu
	CIT9Kqm/BDFclr4LBFtMh5u4xRMTVmuOOCE88Exh0IsoT2FLe/8GDZXjtAtFPeUQC9ew9igDUUMzJ
	g/e87vhWMRWhWeHs1qh2jvmskNJ7/vrMdTCeH/f3J3inimmRdnKVYTE72btLv5GlSNATcgWFeOl7A
	7QSrA+ZWwE8yIHbu62vB8VAl5WJgu2uIYNfEOsVJHX7wkuiV45pOJNnHLrocfjUKeV8ZI21hKowA6
	44sPoZiSu6Oq4ya+fgCTHIBpqR6JpE1TWaXj7A5KH2CqE7bjNmVaasK4qJahJ1CRr9Vu+lmUL/B1A
	jptjaSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTlD-0000000HaOO-0BhB;
	Fri, 06 Jun 2025 09:53:15 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTgw-0000000HZsr-24lp;
	Fri, 06 Jun 2025 09:48:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749203325; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BDRQhUXbZUXBzSw5etuAVJudYAJv3trPbVEKVW6rlGrgnN2e08Az+GzLRKwRLQdkcFR7fOyxG9ejgamyeLed2xLloQDaL7Tj4xkzuxHsT1U4x4jtQoA050uUt3/9O/uIALARzVrZGsXqwm6Snm/kIao1kEYs0Qvi3mfNjtDFCSQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749203325; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pOMikGDm0MmBx1ffFfqI8HnHprOULeEnm50fJ4rduiM=; 
	b=OuYOkQ9JUvFU83oyRWnXcQMzx7c4joJcXfgHpBqS5d05ixiVEmg0hDqHLMfvCSdHv63o8X7iWYPBOVVzhk1JR20vnJlxODrToAaQWK1QowIlGwo+dp10ALfOvcP/mwK41OYAJiNtA2gXQDfdfaN2U98I06l4YnCZ5jTFDi5epzk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749203325;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=pOMikGDm0MmBx1ffFfqI8HnHprOULeEnm50fJ4rduiM=;
	b=AXrT3X/gdWM3d/al73oHTm1DN8lTjiDmui1fUMKEtuAgJ8VTAhcjSRq1wH5kJy1D
	i6TL+OWL3LgzNr/iD08U06uj/1K7RrfU3lipLp0BRWmhtFqYTQ7OmYX+ir8o+VVQ+8B
	RMNAI2YuCzcS8ffKZTdwWX4K7unjDiVoAPnTqY0M=
Received: by mx.zohomail.com with SMTPS id 17492033238565.683996663710104;
	Fri, 6 Jun 2025 02:48:43 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 heiko@sntech.de, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pei Xiao <xiaopei01@kylinos.cn>
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH v2 1/2] ASOC: rockchip: fix capture stream handling in
 rockchip_sai_xfer_stop
Date: Fri, 06 Jun 2025 11:48:38 +0200
Message-ID: <9468228.NyiUUSuA9g@workhorse>
In-Reply-To: <c374aae92c177aaf42c0f1371eccdbc7e9615786.1749201126.git.xiaopei01@kylinos.cn>
References: <cover.1749201126.git.xiaopei01@kylinos.cn>
 <c374aae92c177aaf42c0f1371eccdbc7e9615786.1749201126.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_024850_608261_CE1ED540 
X-CRM114-Status: GOOD (  16.38  )
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

On Friday, 6 June 2025 11:18:21 Central European Summer Time Pei Xiao wrote:
> Correcting the capture stream handling which was incorrectly setting
> playback=true for capture streams.
> 
> The original code mistakenly set playback=true for capture streams,
> causing incorrect behavior.
> 
> Fixes: cc78d1eaabad ("ASoC: rockchip: add Serial Audio Interface (SAI) driver")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  sound/soc/rockchip/rockchip_sai.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
> index 602f1ddfad00..916af63f1c2c 100644
> --- a/sound/soc/rockchip/rockchip_sai.c
> +++ b/sound/soc/rockchip/rockchip_sai.c
> @@ -378,19 +378,9 @@ static void rockchip_sai_xfer_start(struct rk_sai_dev *sai, int stream)
>  static void rockchip_sai_xfer_stop(struct rk_sai_dev *sai, int stream)
>  {
>  	unsigned int msk = 0, val = 0, clr = 0;
> -	bool playback;
> -	bool capture;
> -
> -	if (stream < 0) {
> -		playback = true;
> -		capture = true;
> -	} else if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -		playback = true;
> -		capture = false;
> -	} else {
> -		playback = true;
> -		capture = false;
> -	}
> +	bool capture = stream == SNDRV_PCM_STREAM_CAPTURE || stream < 0;
> +	bool playback = stream == SNDRV_PCM_STREAM_PLAYBACK || stream < 0;
> +	/* could be <= 0 but we don't want to depend on enum values */
>  
>  	if (playback) {
>  		msk |= SAI_XFER_TXS_MASK;
> 

Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Acked-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Thank you!



