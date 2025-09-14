Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A21CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 15:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lF7TefPrj8nTqh1Zwwwayl7uZBox7tbKj5sj7DEzwK4=; b=H/2AqFMkl8g9wUt8NGIc95LtbI
	4kiWRFnz/g5jye4OOOSmY3vtq3CTpyUKCxfwh2wE/9t+Wg9S43bjmLgMtyWhjo6Okvk3yi1z0S3xh
	r/5X2Rr1J444Ws4+9g8vUa7gaF9qGvox+vlvH5BuH08hBNTHPuyZxkixv0p+AzRcCP1oEkNU9B85d
	79jCPXPXOFEysHiVAa8suOnj5NBSJzaFcWp8s8xZ2xZeY98dgVjJ8X6Xtj8ldMdBXATIbzp7EvG92
	yoY0Kl87Hz/lOBtDvKZpO1MFVi1QlS/2g3526e2c/dsDPMlEx0FPioMT+jJ2Cj0sJQ47XZz106Ku9
	G5/5NLLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxosN-00000001jFz-15JZ;
	Sun, 14 Sep 2025 15:42:51 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxosK-00000001jFc-12Yo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 15:42:49 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3e7622483beso1667976f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 08:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757864566; x=1758469366; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lF7TefPrj8nTqh1Zwwwayl7uZBox7tbKj5sj7DEzwK4=;
        b=A4P2CFTp2QurFbuTMiFcsltv6la6f/2lySu5DP1443zmRPnPj2SCEw7F/+O49WcSFa
         13hatEL2dm2iYt8kito7eDTNgbxUgLXZB+Sgg7xNWHbkbIZxaEywA5PuhKhQEXUtL9GY
         BJ63Flb6aJxnXetMra8jRLLNa0aN/FbyHYZNphjfFJ63riIkXvKUA4a9yeRe3zQEJx4H
         J0eYaTfeDsnd1vfosigi7sY8GefJi0P/ZH7hUGE5d0BmOE/MyYM2t5bThSb2jcOUlsBV
         jEKOZzACG6fEQh2S6mzk/wz9GitCNsyV6aLZqVU5kO6xkbYbGvJB1Uj/7w4TUmydbl0d
         X9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757864566; x=1758469366;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lF7TefPrj8nTqh1Zwwwayl7uZBox7tbKj5sj7DEzwK4=;
        b=Kr7bqlhmRoeGv9cpf/Izk/MKMNsJeJfQYYboKbhB2b5VoTfrpAkr7D+6W0Nq/EGofj
         iAmcQeBM1Zry9coGlTHTk4nDnU3IlptmzxR6IjNggTz/Sd2D4U55z9ItWqP5qflB458g
         feDIjOEiosJAiM0J/L5MNPYaP0dEKP3AMPDLwOCpZbgb+ZsUtpJICijQpq9DG2thhy/J
         rHSeo6UzCi7NeurmRVjC8dID/BMsZAXvvOqZLlkPc7KayT3GDGRWeL3Liv9azRx/62zr
         zzyhWKwuG6eq3m5dV5tG1XQfH2aJJhzxQUWl7bHVNZhv/DnsCvyH5e1JEfmj9SJFUWjg
         AK5A==
X-Forwarded-Encrypted: i=1; AJvYcCWT01bEXqgbs9o3uxOkDGc0dEQDypwSF4Bzb9mzx2w+3JXxm8JpN7WrQjF01kExqRpzkSWIpSbFBag4rmnjSkqn@lists.infradead.org
X-Gm-Message-State: AOJu0YyunUy2ek43OoFl9j3RHVJzXqR1iSYw6ycbddDU5qSXxuwSakfW
	qBhpsKL2EAbVgn2M8dCIdSp09h4N+0qZEOshIzdaDMHwvEUkFTgZWXnK11VomX9QTyc=
X-Gm-Gg: ASbGncupWQqycMfYDPxds2pCnzkwm4oqcoow3cgC0ha9xFocBRbqYDChYTgRHDzGJF6
	vELb2SkJg7fQ8V78rMElsmyRJaLRbba+vbNuReDS/IoAW2S+XD8sdNXdl+xUkOZ0EliXNZE1v0E
	75N/llydhSnKKIWA3j6AN8j2taqMP+70WrfkG+Uf99joxXaz1dXCL9Jyq6nmBcvKsgdv3P+i0yJ
	frjwheoWBxvoxxUw9eGJHMOcww+nYut8SqkdIsa9nAjNRckpeg0QeYtqXyKGkZJCWZIO5Rlc+mk
	FRjB17+1cmGWaFrr5VkY0SBO3Iw1RsAkUoOXIoycknW8v50foGJpAtRCzcZ/2nrlXq7YGoPLKEa
	VuvX4pM+N1iIlUDKr3XDVIXYftgQ++jAqmky40m9BCw==
X-Google-Smtp-Source: AGHT+IFzwsBtZqrEsafWUsUxi583ZTfa92WFIWs6GNlc6Hk5flYFXVJ+chnYflQbOkJeB1ew0UPusg==
X-Received: by 2002:a5d:5d05:0:b0:3e4:f194:2886 with SMTP id ffacd0b85a97d-3e7657b9d92mr7371826f8f.19.1757864565702;
        Sun, 14 Sep 2025 08:42:45 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e8237cfdddsm7414702f8f.60.2025.09.14.08.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Sep 2025 08:42:45 -0700 (PDT)
Message-ID: <3a3a3e2c-2156-40bb-9233-fc2e6320eaa6@tuxon.dev>
Date: Sun, 14 Sep 2025 18:42:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] nvmem: microchip-otpc: rework to access packets
 based on tag
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 eugen.hristev@linaro.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, srini@kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
 <20250804100219.63325-3-varshini.rajendran@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250804100219.63325-3-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_084248_431728_AC5A4EB3 
X-CRM114-Status: GOOD (  51.13  )
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

Hi, Varshini,

On 8/4/25 13:02, Varshini Rajendran wrote:
> Rework the driver to change the packet access technique based on the TAG
> instead of the currently in use "id".
> 
> Since there is no way of knowing the OTP memory mapping in advance or the
> changes it can go through with time, the id based approach is not reliable.
> Accessing the packets based on the associated tags is a fail-proof
> approach. This method is aided by adding a table of contents to store the
> payload information which makes it easier to traverse through the OTP
> memory and read the data of the intended packet. The stride of the nvmem
> device is adjusted to 1 to support the TAG being treated as an offset.
> The only reliable way to recognize a packet without being aware of the
> flashed contents of the OTP memory is the TAG of the packet.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  drivers/nvmem/microchip-otpc.c | 130 +++++++++++++++++++++++++--------
>  1 file changed, 101 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
> index df979e8549fd..e922c882af72 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
> @@ -18,16 +18,27 @@
>  #define MCHP_OTPC_CR_READ		BIT(6)
>  #define MCHP_OTPC_MR			(0x4)
>  #define MCHP_OTPC_MR_ADDR		GENMASK(31, 16)
> +#define MCHP_OTPC_MR_EMUL		BIT(7)
>  #define MCHP_OTPC_AR			(0x8)
>  #define MCHP_OTPC_SR			(0xc)
>  #define MCHP_OTPC_SR_READ		BIT(6)
>  #define MCHP_OTPC_HR			(0x20)
>  #define MCHP_OTPC_HR_SIZE		GENMASK(15, 8)
> +#define MCHP_OTPC_HR_PACKET_TYPE	GENMASK(2, 0)
>  #define MCHP_OTPC_DR			(0x24)
>  
>  #define MCHP_OTPC_NAME			"mchp-otpc"
>  #define MCHP_OTPC_SIZE			(11 * 1024)
>  
> +enum packet_type {
> +	PACKET_TYPE_REGULAR = 1,
> +	PACKET_TYPE_KEY	= 2,
> +	PACKET_TYPE_BOOT_CONFIG = 3,
> +	PACKET_TYPE_SECURE_BOOT_CONFIG = 4,
> +	PACKET_TYPE_HARDWARE_CONFIG = 5,
> +	PACKET_TYPE_CUSTOM = 6,

You can drop unused packet types.

> +};
> +
>  /**
>   * struct mchp_otpc - OTPC private data structure
>   * @base: base address
> @@ -42,6 +53,25 @@ struct mchp_otpc {
>  	u32 npackets;
>  };
>  
> +/**
> + * struct mchp_otpc_payload_info - OTP packet's payload information
> + *				retrieved from the packet's header
> + * @id: driver assigned packet ID
> + * @packet_offset: offset address of the packet to be written in the
> + *			register OTPC_MR.ADDR to access the packet
> + * @payload_length: length of the packet's payload
> + * @packet_type: type of the packet
> + * @packet_tag: TAG corresponding to the packet. Applicable for most
> + *		of the regular packets
> + */
> +struct mchp_otpc_payload_info {
> +	u32 id;
> +	u32 packet_offset;

Can you keep packet specific members in struct mchp_otpc_packet?

> +	u32 payload_length;
> +	u32 packet_type;
> +	u32 packet_tag;

Will this technique limit the number of packets that can be in memory? I
think this is not an issue with the current devices? What about the upcomming?

> +};
> +
>  /**
>   * struct mchp_otpc_packet - OTPC packet data structure
>   * @list: list head
> @@ -50,20 +80,16 @@ struct mchp_otpc {
>   */
>  struct mchp_otpc_packet {
>  	struct list_head list;
> -	u32 id;
> -	u32 offset;
> +	struct mchp_otpc_payload_info payload_info;

Warning: ../drivers/nvmem/microchip-otpc.c:83 struct member 'payload_info'
not described in 'mchp_otpc_packet'

>  };
>  
> -static struct mchp_otpc_packet *mchp_otpc_id_to_packet(struct mchp_otpc *otpc,
> -						       u32 id)
> +static struct mchp_otpc_packet *mchp_otpc_tag_to_packet(struct mchp_otpc *otpc,
> +							u32 tag)
>  {
>  	struct mchp_otpc_packet *packet;
>  
> -	if (id >= otpc->npackets)
> -		return NULL;
> -
>  	list_for_each_entry(packet, &otpc->packets, list) {
> -		if (packet->id == id)
> +		if (packet->payload_info.packet_tag == tag)
>  			return packet;
>  	}
>  
> @@ -140,8 +166,27 @@ static int mchp_otpc_prepare_read(struct mchp_otpc *otpc,
>   * offset returned by hardware.
>   *
>   * For this, the read function will return the first requested bytes in the
> - * packet. The user will have to be aware of the memory footprint before doing
> - * the read request.
> + * packet. The user won't have to be aware of the memory footprint before doing
> + * the read request since it is abstracted and taken care by this driver.
> + *
> + * There is no way of knowing the Mapping of the OTP memory table in advance. In
> + * this read function the offset requested is treated as the identifier string
> + * i.e., Packet TAG, to acquire the payload with reliability. The packet Tag
> + * is the only way to recognize a packet without being aware of the flashed
> + * OTP memory map table.
> + */
> +
> +/**
> + * mchp_otpc_read() - Read the OTP packets and fill the buffer based on the TAG
> + *		      of the packet treated as the offset.
> + * @priv: Pointer to device structure.
> + * @off: offset of the OTP packet to be read. In this case, the TAG of the
> + *	 corresponding packet.
> + * @val: Pointer to data buffer
> + * @bytes: length of the buffer
> + *
> + * A value of zero will be returned on success, a negative errno will be
> + * returned in error cases.
>   */
>  static int mchp_otpc_read(void *priv, unsigned int off, void *val,
>  			  size_t bytes)
> @@ -154,30 +199,23 @@ static int mchp_otpc_read(void *priv, unsigned int off, void *val,
>  	int ret, payload_size;
>  
>  	/*
> -	 * We reach this point with off being multiple of stride = 4 to
> -	 * be able to cross the subsystem. Inside the driver we use continuous
> -	 * unsigned integer numbers for packet id, thus divide off by 4
> -	 * before passing it to mchp_otpc_id_to_packet().
> +	 * From this point the packet tag received as the offset has to be translated
> +	 * into the actual packet. For this we traverse the table of contents stored
> +	 * in a list "packet" and look for the tag.
>  	 */
> -	packet = mchp_otpc_id_to_packet(otpc, off / 4);
> +
> +	packet = mchp_otpc_tag_to_packet(otpc, off);
>  	if (!packet)
>  		return -EINVAL;

If one would want to read the full content of the memory will this function
return first time offset will not corresond to a valid packet?

> -	offset = packet->offset;
> +	offset = packet->payload_info.packet_offset;
>  
> -	while (len < bytes) {
> +	if (len < bytes) {

The approach now is that a single packet can be read at a moment, right? Is
this intended?

>  		ret = mchp_otpc_prepare_read(otpc, offset);
>  		if (ret)
>  			return ret;
>  
> -		/* Read and save header content. */
> -		*buf++ = readl_relaxed(otpc->base + MCHP_OTPC_HR);
> -		len += sizeof(*buf);
> -		offset++;
> -		if (len >= bytes)
> -			break;
> -

Dropping this will not return the header content anymore. Is this intended?

>  		/* Read and save payload content. */
> -		payload_size = FIELD_GET(MCHP_OTPC_HR_SIZE, *(buf - 1));
> +		payload_size = packet->payload_info.payload_length;
>  		writel_relaxed(0UL, otpc->base + MCHP_OTPC_AR);
>  		do {
>  			*buf++ = readl_relaxed(otpc->base + MCHP_OTPC_DR);
> @@ -190,6 +228,20 @@ static int mchp_otpc_read(void *priv, unsigned int off, void *val,
>  	return 0;
>  }
>  
> +static int mchp_otpc_read_packet_tag(struct mchp_otpc *otpc, unsigned int offset, unsigned int *val)

This exceeed 100 chars.

> +{
> +	int ret;
> +
> +	ret = mchp_otpc_prepare_read(otpc, offset);
> +	if (ret)
> +		return ret;
> +
> +	writel_relaxed(0UL, otpc->base + MCHP_OTPC_AR);
> +	*val = readl_relaxed(otpc->base + MCHP_OTPC_DR);
> +
> +	return 0;
> +}
> +
>  static int mchp_otpc_init_packets_list(struct mchp_otpc *otpc, u32 *size)
>  {
>  	struct mchp_otpc_packet *packet;
> @@ -213,8 +265,15 @@ static int mchp_otpc_init_packets_list(struct mchp_otpc *otpc, u32 *size)
>  		if (!packet)
>  			return -ENOMEM;
>  
> -		packet->id = id++;
> -		packet->offset = word_pos;
> +		packet->payload_info.id = id++;
> +		packet->payload_info.packet_offset = word_pos;
> +		packet->payload_info.payload_length = payload_size;
> +		packet->payload_info.packet_type = FIELD_GET(MCHP_OTPC_HR_PACKET_TYPE, word);
> +
> +		if (packet->payload_info.packet_type == PACKET_TYPE_REGULAR)
> +			ret = mchp_otpc_read_packet_tag(otpc, packet->payload_info.packet_offset,
> +							&packet->payload_info.packet_tag);
> +
>  		INIT_LIST_HEAD(&packet->list);
>  		list_add_tail(&packet->list, &otpc->packets);
>  
> @@ -236,7 +295,7 @@ static struct nvmem_config mchp_nvmem_config = {
>  	.type = NVMEM_TYPE_OTP,
>  	.read_only = true,
>  	.word_size = 4,
> -	.stride = 4,
> +	.stride = 1,
>  	.reg_read = mchp_otpc_read,
>  };
>  
> @@ -244,8 +303,9 @@ static int mchp_otpc_probe(struct platform_device *pdev)
>  {
>  	struct nvmem_device *nvmem;
>  	struct mchp_otpc *otpc;
> -	u32 size;
> +	u32 size, tmp;
>  	int ret;
> +	bool emul_enable;
>  
>  	otpc = devm_kzalloc(&pdev->dev, sizeof(*otpc), GFP_KERNEL);
>  	if (!otpc)
> @@ -256,10 +316,22 @@ static int mchp_otpc_probe(struct platform_device *pdev)
>  		return PTR_ERR(otpc->base);
>  
>  	otpc->dev = &pdev->dev;
> +
> +	tmp = readl_relaxed(otpc->base + MCHP_OTPC_MR);
> +	emul_enable = tmp & MCHP_OTPC_MR_EMUL;
> +	if (emul_enable)
> +		dev_info(otpc->dev, "Emulation mode enabled\n");

Can you update the commit with the meaning of these?

> +
>  	ret = mchp_otpc_init_packets_list(otpc, &size);
>  	if (ret)
>  		return ret;
>  
> +	if (size == 0) {
> +		dev_err(otpc->dev, "Cannot access OTP memory !\n");

Space before !

> +		if (!emul_enable)
> +			dev_err(otpc->dev, "Boot packet not configured & Emulation mode not enabled !\n");

Do you still want to register the driver in case size == 0?

Thank you,
Claudiu

> +	}
> +
>  	mchp_nvmem_config.dev = otpc->dev;
>  	mchp_nvmem_config.add_legacy_fixed_of_cells = true;
>  	mchp_nvmem_config.size = size;


