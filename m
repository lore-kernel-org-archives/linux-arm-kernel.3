Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187C2CF65DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 11:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvJrcXtn8iRvKT6VDEN9miPmbI0CvZ2DRzSRmtrceIs=; b=we8vgzKL5q7e+x0wZt1yw3wgEZ
	JPPnmNGZeCzC5/S2GULPHrfFq94kbTFApZoIVU1IH71bCC8DRTG7uqzt04emqbraUH1YkOY8I8Uew
	TfL+J0erSdqF5L224NwoxgCZ9DpD8SxRe0YObFax5aCDb1UnlvX0F17cav4eJmNRc33maNjYHjyiR
	FRC1cCxDx21D2YIz9ZVN9uVXkx7fQkOhjSrx2fQ7Zq2/SEq+UAXdtdUWO1jv1PPiW158BW8kF2Kyj
	8wBWEMLPqjZY8wvJUyV8URlN7xQSuqhUrvYRnm35Oh16ZW4tOZkt4eeOMHZbbZHKflT6cVFZvpCdT
	tFSAW+Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKLJ-0000000CNHS-0CiH;
	Mon, 26 Jan 2026 11:01:13 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKLF-0000000CNGo-3azJ;
	Mon, 26 Jan 2026 11:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=XvJrcXtn8iRvKT6VDEN9miPmbI0CvZ2DRzSRmtrceIs=;
	t=1769425269; x=1770634869; b=TRaWAPWy2FPQ7HdSTJvcfY1YMgSZKw98zExJow1ZNu+PTeK
	onDgqkITqRrMyjw9Lx+HhKRgsjAqLRKBFjlJWZfF8ePLAlvEdDTOvQoMC+xt2N5v+8iv30W7ngmD6
	V7/LKeE4JylNgHPS0qzjH2RtRrI9zhEndizHrxnicrdaV/9FhZu1a21SXfNPTHrpuS1wQYjUaDobm
	7bbDTKWwYcVBRnb7MuVk93Hs9axTUpctH/RpeCqexVI0/8/AI7R27COmEyP8HslLqEhxz0lgoBRD1
	DtiXpsVXLImVS7VVkYtYqpmImBx2m4zw49AbslguViy2GSzCDfX86Sd/6cTwyn1w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vkKL7-000000047Xj-15mx;
	Mon, 26 Jan 2026 12:01:01 +0100
Message-ID: <01e62344994a34daae0666b3873aa98e72fb5850.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v2 1/2] wifi: mac80211: Add eMLSR/eMLMR
 action frame parsing support
From: Johannes Berg <johannes@sipsolutions.net>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>,  Sean Wang <sean.wang@mediatek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, Shayne
 Chen	 <shayne.chen@mediatek.com>, Christian Marangi <ansuelsmth@gmail.com>,
 	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 26 Jan 2026 11:59:45 +0100
In-Reply-To: <20260125-mac80211-emlsr-v2-1-466329d61c88@kernel.org> (sfid-20260125_115209_143463_EFDC87D8)
References: <20260125-mac80211-emlsr-v2-0-466329d61c88@kernel.org>
	 <20260125-mac80211-emlsr-v2-1-466329d61c88@kernel.org>
	 (sfid-20260125_115209_143463_EFDC87D8)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_030110_148837_139BAAD3 
X-CRM114-Status: GOOD (  26.27  )
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

On Sun, 2026-01-25 at 11:51 +0100, Lorenzo Bianconi wrote:
>=20
> +static inline u8 ieee80211_get_emlsr_pad_delay_update(u8 param)
> +{
> +	u8 pad_delay =3D FIELD_GET(IEEE80211_EML_EMLSR_PAD_DELAY, param);

I generally prefer the typed versions and mac80211 (mostly?) uses those,
i.e. u8_get_bits() and friends, since they also cover endian conversions
where needed. Is there any reason you use FIELD_* versions here?

> +	if (pad_delay > IEEE80211_EML_CAP_EMLSR_PADDING_DELAY_256US)
> +		pad_delay =3D 0;

Seems that should use a constant, rather than =3D0?

Also, is that really the right thing to do (also below) to just silently
cap it? Maybe that should be up to the caller? In some(/most/all)? cases
we should probably even just _reject_ frames that carry an invalid
value, which you can't do with this helper?

> +static inline u32 ieee80211_get_emlsr_trans_delay_update(u8 param)
> +{
> +	u16 trans_delay =3D FIELD_GET(IEEE80211_EML_EMLSR_TRANS_DELAY, param);
> +
> +	if (trans_delay > IEEE80211_EML_CAP_EMLSR_TRANSITION_DELAY_256US)
> +		trans_delay =3D 0;
> +
> +	return trans_delay;

why does that use _three_ different types? Wouldn't u8 be sufficient?

> --- a/include/net/mac80211.h
> +++ b/include/net/mac80211.h
> @@ -1902,6 +1902,21 @@ enum ieee80211_offload_flags {
>  	IEEE80211_OFFLOAD_DECAP_ENABLED		=3D BIT(2),
>  };
> =20
> +struct ieee80211_eml_params {
> +	u8 control;
> +	u16 link_bitmap;
> +	union {
> +		struct {
> +			u16 emlsr_pad_delay;
> +			u16 emlsr_trans_delay;
> +		};
> +		struct {
> +			u8 mcs_map_count;
> +			u8 mcs_map_bw[9];
> +		};
> +	};
> +};

Maybe add kernel-doc? Also not sure the union really is worth it? It's a
tiny thing. Especially since you don't even label it - maybe if the
parts were labled emlsr and emlmr, and then you had emlsr.pad_delay?

(I'd label them anyway, of course, even if not a union.)

Also now the emlsr pad/trans delay are duplicated in the station info,
is that worth doing? You have to and do track them there too, anyway, as
we discussed on IRC, could just have the driver use them from there?

Per spec I'm also not sure what the MCS map should be when it's not
included in the frame?

> + * @set_eml_op_mode: Configure eMLSR/eMLMR operation mode in the underla=
y
> + *	driver according to the parameter received in the EML Operating mode
> + *	notification frame.

Maybe describe the link_id here, or move it to the params and describe
it in kernel-doc there?

> +static inline int drv_set_eml_op_mode(struct ieee80211_sub_if_data *sdat=
a,
> +				      struct ieee80211_sta *sta,
> +				      unsigned int link_id,
> +				      struct ieee80211_eml_params *eml_params)
> +{
> +	struct ieee80211_local *local =3D sdata->local;
> +	int ret =3D 0;

Shouldn't that be -EOPNOTSUPP?

> +static void
> +ieee80211_send_eml_op_mode_notif(struct ieee80211_sub_if_data *sdata,
> +				 struct ieee80211_mgmt *req, u8 act_len)
> +{
> +	int hdr_len =3D offsetof(struct ieee80211_mgmt, u.action.u.eml_omn);
> +	struct ieee80211_local *local =3D sdata->local;
> +	struct ieee80211_mgmt *mgmt;
> +	struct sk_buff *skb;
> +
> +	skb =3D dev_alloc_skb(local->tx_headroom + hdr_len + act_len);
> +	if (!skb)
> +		return;
> +
> +	skb_reserve(skb, local->tx_headroom);
> +	mgmt =3D skb_put_zero(skb, hdr_len);
> +	mgmt->frame_control =3D cpu_to_le16(IEEE80211_FTYPE_MGMT |
> +					  IEEE80211_STYPE_ACTION);
> +	memcpy(mgmt->da, req->sa, ETH_ALEN);
> +	memcpy(mgmt->sa, sdata->vif.addr, ETH_ALEN);
> +	memcpy(mgmt->bssid, sdata->vif.addr, ETH_ALEN);
> +
> +	mgmt->u.action.category =3D WLAN_CATEGORY_PROTECTED_EHT;
> +	memcpy(&mgmt->u.action.u.eml_omn, &req->u.action.u.eml_omn, act_len);
> +	mgmt->u.action.u.eml_omn.control &=3D
> +		~(IEEE80211_EML_CTRL_EMLSR_PARAM_UPDATE |
> +		  IEEE80211_EML_CTRL_INDEV_COEX_ACT);
> +	ieee80211_tx_skb(sdata, skb);

It seems to me that it'd be better to not copy the request, but rather
build the response. It's not _that_ much data, and from the spec it
seems to me that e.g. the MCS map should be included in the response,
but you do that now, I think?

> +void ieee80211_rx_eml_op_mode_notif(struct ieee80211_sub_if_data *sdata,
> +				    struct sk_buff *skb)
> +{
> +	int hdr_len =3D offsetof(struct ieee80211_mgmt, u.action.u.eml_omn);
> +	enum nl80211_iftype type =3D ieee80211_vif_type_p2p(&sdata->vif);
> +	struct ieee80211_rx_status *status =3D IEEE80211_SKB_RXCB(skb);
> +	const struct wiphy_iftype_ext_capab *ift_ext_capa;
> +	struct ieee80211_mgmt *mgmt =3D (void *)skb->data;
> +	struct ieee80211_local *local =3D sdata->local;
> +	u8 control =3D mgmt->u.action.u.eml_omn.control;
> +	u8 *ptr =3D mgmt->u.action.u.eml_omn.variable;
> +	struct ieee80211_eml_params eml_params =3D {};
> +	struct sta_info *sta;
> +	u8 act_len =3D 3; /* action_code + dialog_token + control */
> +
> +	if (!ieee80211_vif_is_mld(&sdata->vif))
> +		return;
> +
> +	/* eMLSR and eMLMR can't be enabled at the same time */
> +	if ((control & IEEE80211_EML_CTRL_EMLSR_MODE) &&
> +	    (control & IEEE80211_EML_CTRL_EMLMR_MODE))
> +		return;
> +
> +	if ((control & IEEE80211_EML_CTRL_EMLMR_MODE) &&
> +	    (control & IEEE80211_EML_CTRL_EMLSR_PARAM_UPDATE))
> +		return;
> +
> +	ift_ext_capa =3D cfg80211_get_iftype_ext_capa(local->hw.wiphy, type);
> +	if (!ift_ext_capa)
> +		return;
> +
> +	if (!status->link_valid)
> +		return;
> +
> +	sta =3D sta_info_get_bss(sdata, mgmt->sa);
> +	if (!sta)
> +		return;
> +
> +	if (control & IEEE80211_EML_CTRL_EMLSR_MODE) {
> +		if (!(ift_ext_capa->eml_capabilities &
> +		      IEEE80211_EML_CAP_EMLSR_SUPP))
> +			return;
> +
> +		if (control & IEEE80211_EML_CTRL_EMLSR_PARAM_UPDATE) {
> +			u16 eml_cap =3D sta->sta.eml_cap;
> +			u8 pad_delay, trans_delay;
> +
> +			/* Update sta padding and transition delay */
> +			pad_delay =3D
> +				ieee80211_get_emlsr_pad_delay_update(ptr[3]);
> +			trans_delay =3D
> +				ieee80211_get_emlsr_pad_delay_update(ptr[3]);

It seems to me you're missing a bunch of input validation?

> +
> +			eml_cap &=3D ~(IEEE80211_EML_CAP_EMLSR_PADDING_DELAY |
> +				     IEEE80211_EML_CAP_EMLSR_TRANSITION_DELAY);
> +			eml_cap |=3D FIELD_PREP(IEEE80211_EML_EMLSR_PAD_DELAY,
> +					      pad_delay) |
> +				   FIELD_PREP(IEEE80211_EML_EMLSR_TRANS_DELAY,
> +					      trans_delay);
> +			sta->sta.eml_cap =3D eml_cap;

Same comment about typed bitfield accessors, and u8_replace_bits() would
even shorten that quite a bit.

> +	if (skb->len < hdr_len + act_len)
> +		return;

bit late that :)

johannes

