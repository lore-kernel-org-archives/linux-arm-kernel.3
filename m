Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E4C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 07:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zYJn0U34;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kw2YFF7S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GSs4SC8xEvXxzc6tb3y0SEMQgJxrl8ZSN7tzilEn+Eo=; b=zYJn0U340cKF9KJ/PgZMJsRqvd
	chtdY/VedtMGnJYSQi+++/NMMMoBAkph/BYgJUhPbNSorofcKdSj+a/QYnLlY0VF6GpDBILpY0QXA
	rteqaQ0gYvgma0eE8DZsn2Fyl2BnRj9vjt8CsE+aFKYDOhDgA0PGOaYYtmF9Ql9TWzN7iOssyQY0A
	JRIw2K8V0l9iJrCqhgCbB/ZCOuFgrL3Vywl995n9SYTCAL5jHQwnOOZMEdiavRhVmr3QswS+M4nIO
	02rfSkE7dNgdI0gb+U3r6TEbX9z5IlXDC4/XtdofkMOW1v5kxA/LfCmVpZ48ysqkVgnkSqLdxWA8y
	+zbosF2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFTy-00000001ruY-0tiP;
	Mon, 26 Oct 2026 07:51:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFTw-00000001ruE-0Ia1;
	Mon, 26 Oct 2026 07:51:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 35F11600CB;
	Mon, 26 Oct 2026 07:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5D21F01825;
	Mon, 26 Oct 2026 07:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793001058;
	bh=GSs4SC8xEvXxzc6tb3y0SEMQgJxrl8ZSN7tzilEn+Eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kw2YFF7SxFhk61E+XcdH8MBJU5Uc/8h26oi7o7fo0V/QjOLivTNhOjXd4oxSKtWmo
	 TDOwAnHtn+tupqC3ENK/PzNjzAuLs/6boivj2cb44g4CWLeFmjFfe4qZZ5QyEZEE0U
	 Y7hFDO2UcS8rNGorC8gC8mujud2i42mt59/cPei12CLO0arqT/SyfnYC9ll8w1qdg4
	 hvXmMy/3rpwMEFAWg7D5yGkgdBIDIjew2h8Xr4b0wil4qqxrWe7q70RwTVZwBjrdlI
	 w/vqiZODz5TkQSdyrUG9sScI45GRiKP0qiV9SMNXUBS444al4GYVHiIPikMnoyIfhC
	 osaOufWgrm2zA==
Date: Mon, 26 Oct 2026 08:50:56 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Chris Scott <gilroyscott1970@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, pawlik.dan@gmail.com,
	zhengping.zhang@airoha.com
Subject: Re: [RFC net-next 3/3] net: airoha: npu: use coherent memory for
 mailbox messages
Message-ID: <at8GYPdqto4xoHBl@lore-desk>
References: <20261024154150.45733-1-gilroyscott1970@gmail.com>
 <20261024154150.45733-4-gilroyscott1970@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ks8RgjNESd8HpSsU"
Content-Disposition: inline
In-Reply-To: <20261024154150.45733-4-gilroyscott1970@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--ks8RgjNESd8HpSsU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Daniel Pawlik <pawlik.dan@gmail.com>
>=20
> airoha_npu_send_msg() maps the caller's kzalloc() buffer with
> DMA_BIDIRECTIONAL. These buffers are small and not cacheline aligned,
> so on arm64 the mapping bounces through swiotlb. On a 2 GiB EN7581
> board the default swiotlb pool sits above 0xc0000000 (0xff6cf000 on
> W1700K), outside the 0x80000000-0xbfffffff window the NPU can address;
> higher addresses alias the lower 1 GiB. On W1700K + MT7996 this makes
> WLAN_FUNC_GET_WAIT_NPU_VERSION read back 0.0 and mt76 does not bind
> NPU offload.
>=20
> Allocate one coherent buffer per NPU core at probe and reuse it under
> the per-core mailbox lock. With the previous patch it comes from the
> NPU DMA pool, inside the window. airoha_npu_send_msg() is also called
> from PPE foe_commit under spin_lock_bh(), which rules out a per-message
> GFP_ATOMIC coherent allocation.
>=20
> Add __airoha_npu_send_msg() with an optional reply buffer so GET
> callers copy only the trailing response payload; airoha_npu_send_msg()
> keeps copying the whole buffer back, like the bidirectional mapping.
>=20
> The original version of this patch was written with Cursor (composer-2);
> it was rebased onto net-next and its commit message rewritten with
> Claude (Anthropic).
>=20
> Link: https://lore.kernel.org/r/20260809152813.585797-1-pawlik.dan@gmail.=
com
> Link: https://lore.kernel.org/r/atCRsquzA1UxSpCc@mediatek.com
> Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
> Signed-off-by: Chris Scott <gilroyscott1970@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_npu.c  | 65 +++++++++++++++++------
>  include/linux/soc/airoha/airoha_offload.h |  3 ++
>  2 files changed, 51 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ether=
net/airoha/airoha_npu.c
> index 069fd60680..3d1aa63dd5 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> @@ -24,6 +24,12 @@
>  #define NPU_EN7581_FIRMWARE_RV32_MAX_SIZE	0x200000
>  #define NPU_EN7581_FIRMWARE_DATA_MAX_SIZE	0x10000
>  #define NPU_DUMP_SIZE				512
> +/*
> + * Mailbox DMA payload size. Covers sizeof(struct ppe_mbox_data) (28) and
> + * WLAN TLV messages (header + payload); largest in-tree WLAN payload to=
day
> + * is 16 bytes (INODE_TXRX_REG_ADDR). Keep headroom for future commands.
> + */
> +#define AIROHA_NPU_MBOX_SIZE			256
> =20
>  #define REG_NPU_LOCAL_SRAM		0x0
> =20
> @@ -161,23 +167,32 @@ struct wlan_mbox_data {
>  	DECLARE_FLEX_ARRAY(u8, d);
>  };
> =20
> -static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
> -			       void *p, int size)
> +static int __airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
> +				 const void *data, int len, void *reply,
> +				 u16 reply_len)
>  {
> -	u16 core =3D 0; /* FIXME */
> -	u32 val, offset =3D core << 4;
> -	dma_addr_t dma_addr;
> +	struct airoha_npu_core *core =3D &npu->cores[0]; /* FIXME: core */
> +	u32 val, offset =3D 0;
>  	int ret;
> =20
> -	dma_addr =3D dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
> -	ret =3D dma_mapping_error(npu->dev, dma_addr);
> -	if (ret)
> -		return ret;
> +	if (len > AIROHA_NPU_MBOX_SIZE)
> +		return -EINVAL;
> +
> +	if (reply && reply_len > len)
> +		return -EINVAL;
> +
> +	/*
> +	 * The NPU only reaches DRAM at 0x80000000-0xbfffffff; a streaming
> +	 * mapping of the caller buffer may bounce through swiotlb outside
> +	 * that window. Use the probe-time coherent buffer, which comes from
> +	 * the NPU DMA pool when one is declared.
> +	 */
> +	spin_lock_bh(&core->lock);
> =20
> -	spin_lock_bh(&npu->cores[core].lock);
> +	memcpy(core->buf, data, len);
> =20
> -	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, dma_addr);
> -	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, size);
> +	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, core->addr);
> +	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, len);
>  	regmap_read(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, &val);
>  	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, val + 1);
>  	val =3D FIELD_PREP(MBOX_MSG_FUNC_ID, func_id) | MBOX_MSG_WAIT_RSP;
> @@ -190,13 +205,21 @@ static int airoha_npu_send_msg(struct airoha_npu *n=
pu, int func_id,
>  	if (!ret && FIELD_GET(MBOX_MSG_STATUS, val) !=3D NPU_MBOX_SUCCESS)
>  		ret =3D -EINVAL;
> =20
> -	spin_unlock_bh(&npu->cores[core].lock);
> +	/* Copy the trailing reply_len bytes of the response. */
> +	if (!ret && reply)
> +		memcpy(reply, core->buf + len - reply_len, reply_len);
> =20
> -	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
> +	spin_unlock_bh(&core->lock);
> =20
>  	return ret;
>  }
> =20
> +static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
> +			       void *data, int len)
> +{
> +	return __airoha_npu_send_msg(npu, func_id, data, len, data, len);

IIUC airoha_npu_send_msg() is used when we do not expect any reply, correct=
? In
this case we should have:

	return __airoha_npu_send_msg(npu, func_id, data, len, NULL, len);

Am I missing something?

Regards,
Lorenzo

> +}
> +
>  static int airoha_npu_load_firmware(struct device *dev, void __iomem *ad=
dr,
>  				    const char *fw_name, int fw_max_size)
>  {
> @@ -500,9 +523,8 @@ static int airoha_npu_wlan_msg_get(struct airoha_npu =
*npu, int ifindex,
>  	wlan_data->func_type =3D NPU_OP_GET;
>  	wlan_data->func_id =3D func_id;
> =20
> -	err =3D airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len);
> -	if (!err)
> -		memcpy(data, wlan_data->d, data_len);
> +	err =3D __airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len,
> +				    data, data_len);
>  	kfree(wlan_data);
> =20
>  	return err;
> @@ -794,6 +816,15 @@ static int airoha_npu_probe(struct platform_device *=
pdev)
>  			return err;
>  	}
> =20
> +	for (i =3D 0; i < ARRAY_SIZE(npu->cores); i++) {
> +		struct airoha_npu_core *core =3D &npu->cores[i];
> +
> +		core->buf =3D dmam_alloc_coherent(dev, AIROHA_NPU_MBOX_SIZE,
> +						&core->addr, GFP_KERNEL);
> +		if (!core->buf)
> +			return -ENOMEM;
> +	}
> +
>  	err =3D airoha_npu_run_firmware(dev, base, &res);
>  	if (err)
>  		return err;
> diff --git a/include/linux/soc/airoha/airoha_offload.h b/include/linux/so=
c/airoha/airoha_offload.h
> index 7589fccfee..16a988ad74 100644
> --- a/include/linux/soc/airoha/airoha_offload.h
> +++ b/include/linux/soc/airoha/airoha_offload.h
> @@ -173,6 +173,9 @@ struct airoha_npu {
>  		/* protect concurrent npu memory accesses */
>  		spinlock_t lock;
>  		struct work_struct wdt_work;
> +		/* Coherent bounce buffer for mailbox cmd/rsp */
> +		void *buf;
> +		dma_addr_t addr;
>  	} cores[NPU_NUM_CORES];
> =20
>  	int irqs[NPU_NUM_IRQ];
> --=20
> 2.53.0
>=20

--ks8RgjNESd8HpSsU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCat8GYAAKCRA6cBh0uS2t
rAyyAP4vQ0d/lxhDq7vgz5zZvFYc9PWyteGbdUndIq9yHNykLwD9HXcgZ822FdNP
cxub3lKtITSN9fGw+qxMyaBJbgcfXgQ=
=fVMR
-----END PGP SIGNATURE-----

--ks8RgjNESd8HpSsU--

