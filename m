Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C96C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arsuenBaXtBMqazzptjgRYvEzzXZ3cFNtGq2cAJLhn8=; b=dIZQIkkeM8vhSytbpTkrc0potK
	ujZvn3liC+4OmvkTvUSpau/2pdrRwxvt5ujfeOXLAVsT/WaKRd4SCjhVKaJBDxeXOWDEKXD9T3wMB
	A5JPTUfbxMIC5154XxXXQwjzCAnzzRrUxz0ueBRX8uzXFBuuEvJvnrjeCkcw6uep6VYSjcYUBwRMh
	uPuh8Qu58pK1QOrTco2vCr5Fq+O2R/Sdx85MvVXfzl2SknHBq3Ki4mKijrz24qwZoM528NIQ6mZPJ
	rATBkpi4NRvEjhFjTmEBTzVy/9nxlIyJIlCj2th73SsAtfJY4JGu/NnqAqPUicmDJHnP4LgMq5L3Q
	QbPcriuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uwZ-0000000GJDX-0qjL;
	Sat, 19 Sep 2026 13:17:27 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uwV-0000000GJD7-0afV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 13:17:25 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d391aso10994995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789823840; x=1790428640; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=arsuenBaXtBMqazzptjgRYvEzzXZ3cFNtGq2cAJLhn8=;
        b=Jt+wyPx1I5wIe41NIiD1jk0JFcA8ZoHWiiOwr+vFRGqRajJ4wcm6Qq7oD2vLwIqXIv
         iXFPwXZq044X3s7dx0ekL84TvSmuqKi5g/QajBB/3SLMR7Q7uDfSoTarqR8o5lh2MiCZ
         rH1MkZICmOpxJDg6EMNJfAIgwmR83w+8wZKc0b/VsCT3eH4Y7NtfCqCuPTpJcQb1BU30
         /AvaKrBwbnFFOXRszJxwy7ZSJpjeFQp5P35fiSSCNjDtwNBoqqLi7nfLFjafUcWPdit2
         2VcndIRXDKPRZ9jztNbXKWlPlEKFfTEZxx1Ou/xiafqRsn2Tl39pVSyknPE6lj3aK8ST
         Q2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789823840; x=1790428640;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=arsuenBaXtBMqazzptjgRYvEzzXZ3cFNtGq2cAJLhn8=;
        b=Iiz+rF0VhoAQ512c/5r85xHR4iTKiJA9j79GsZAIKmfd7dAe5qPCRUKm2PJAddi74N
         kSIb88sUlkZ7UgbPhhYECVF3mGtK66tPKcCD9AmdUIzgyWNg+kJI5m5Hju00DppcwbFj
         Ugzeo2glL43e1jZg+mOoPsvdkwv62ELqwkcHtjocKfe+D8v/SzuQDSeET3ZEFMIRO3Gn
         d6fe8RbWYLtQCqpr6g5mqfrRt6lQOYwZ9A0TKc+BHnIqjtBYIc47J6KYr6hd3zs6pSKZ
         iAxDz1H+ZDe5r2KAH2M+LdHJmPpiKaHOqyi/UzkCydzln/WUBVq9LTpC49Ze0qjX3irQ
         6kTw==
X-Forwarded-Encrypted: i=1; AKwUvBxJn6VAqo4LTXhAvML/jEaWIK5S+gHlXc8U3AKsgpYk8lUUaAMERCVbX52Kd1ey1nJzlAOnc6rXLcD5dEs5wdhA@lists.infradead.org
X-Gm-Message-State: AFuF++maWcCkMVObCdORJFpjVm4avG+5j3+mYVHfQzUALfmepVnsQjcb
	EvxP9TsZDOq1+2xWeQhDrU+Nb+DNuG6P50zvHKvURi48rxtyxpQc1y+oTVUa6uttNMQ=
X-Gm-Gg: AYBFou1D2BmtwxAYfazcF2R/vYfwDydaPVlh06nmgB6yBnDt+1aGpO0+omUBiESFDlE
	qGg7a3Itq2+pZvM8Ld4M7hfGFNKFasP3oeSj3SB60+cuWVBnyf8+EpjU+F87UG+lVNx3+Sok274
	/jL539jZXv5ULRUTr/iTnQCb7bLor3rKufTr5BzPCzzNx/52sY9dJhCWEI7thNk5Kz6LuMhAzBN
	jF8OfPoBpE04CdhBckcPkF2vZREmrdZ5Ib19txjzUuKXI/+P6iAjHk/m5GmZSNmHLe8Dj3VuoKf
	Nlmi4ICD+m6YKr54mCWqp0OV2i71soqE+X9a87LcMt7CgGdo0wf1ICaM814aCq1jtXztbN97Uz3
	iiUpUAUAxNDA9IGKrT7w0ZpthxAzqaEfjwANwszVzWmQDl2nlybmBHxwdx1bgys8JD5avyt/ZaV
	wsDMv5aCCWsgbPAEqUWkYkMSqUHUmQ530FNefsIJKs5IB1gU77rfQby28cwZnD1CUjEPOMl02Xr
	6EN30uovbIPw7qwOWyagKhA9hhlWTFokQklNntLaqscpainvu/OLDm+iPi+R29DpXTd
X-Received: by 2002:a05:600c:3f0b:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49fc56aa68amr77388855e9.8.1789823839836;
        Sat, 19 Sep 2026 06:17:19 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0ece6esm103469825e9.2.2026.09.19.06.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 06:17:18 -0700 (PDT)
Message-ID: <a5f22eff-5d5f-405d-86fe-471e522ce602@tuxon.dev>
Date: Sat, 19 Sep 2026 16:17:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/17] nvmem: microchip-otpc: nvmem: microchip-otpc:
 add tag-based packet lookup
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, srini@kernel.org, marcelo.schmitt@analog.com,
 radu.sabau@analog.com, joshua.crofts1@gmail.com, jorge.marques@analog.com,
 Jonathan.Santos@analog.com, jishnu.prakash@oss.qualcomm.com,
 antoniu.miclaus@analog.com, duje@dujemihanovic.xyz,
 mazziesaccount@gmail.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-10-varshini.rajendran@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260806074024.531259-10-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_061723_345214_416797A4 
X-CRM114-Status: GOOD (  51.53  )
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

On 8/6/26 10:40, Varshini Rajendran wrote:
> Add support for accessing OTP packets by their tag which is a FourCC
> while preserving backward compatibility with the existing ID-based
> lookup.
> 
> The OTP memory layout can vary across devices and may change over time,
> making the packet ID approach unreliable when the memory map is not
> known in advance. The packet tag provides a reliable way to identify
> and access packets without prior knowledge of the OTP memory layout.
> 
> Two offset encodings are now supported:
>    1. Legacy ID-based: offset = OTP_PKT(id) = id * 4
>       Used in DT as: reg = <OTP_PKT(1) 76>;
>    2. TAG-based: offset = 4-byte ASCII packet tag (FourCC)
>       Used in DT as: reg = <0x41435354 0x4c>; (tag "ACST")
> 
> The driver resolves offsets matching valid legacy selectors (multiples
> of 4 within the packet count) through ID lookup, falling back to tag
> lookup for other valid values. This ensures existing device trees
> continue to work while enabling new tag-based access. During probe,
> packet meta data including the tag is read and cached.
> 
> The stride of the nvmem memory is set to 1 in order to support tag based
> offsets, comment in the header file is updated accordingly.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>   drivers/nvmem/microchip-otpc.c                | 117 ++++++++++++++++--
>   .../nvmem/microchip,sama7g5-otpc.h            |   4 +-
>   2 files changed, 110 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
> index df979e8549fd..a17f82afdc37 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
> @@ -23,6 +23,8 @@
>   #define MCHP_OTPC_SR_READ		BIT(6)
>   #define MCHP_OTPC_HR			(0x20)
>   #define MCHP_OTPC_HR_SIZE		GENMASK(15, 8)
> +#define MCHP_OTPC_HR_PACKET		GENMASK(2, 0)
> +#define MCHP_OTPC_HR_PACKET_REGULAR	1
>   #define MCHP_OTPC_DR			(0x24)
>   
>   #define MCHP_OTPC_NAME			"mchp-otpc"
> @@ -47,11 +49,13 @@ struct mchp_otpc {
>    * @list: list head
>    * @id: packet ID
>    * @offset: packet offset (in words) in OTP memory
> + * @tag: 4-byte ASCII (FourCC) tag of the packet
>    */
>   struct mchp_otpc_packet {
>   	struct list_head list;
>   	u32 id;
>   	u32 offset;
> +	u32 tag;
>   };
>   
>   static struct mchp_otpc_packet *mchp_otpc_id_to_packet(struct mchp_otpc *otpc,
> @@ -70,6 +74,52 @@ static struct mchp_otpc_packet *mchp_otpc_id_to_packet(struct mchp_otpc *otpc,
>   	return NULL;
>   }
>   
> +static struct mchp_otpc_packet *mchp_otpc_tag_to_packet(struct mchp_otpc *otpc, u32 tag)
> +{
> +	struct mchp_otpc_packet *packet;
> +
> +	list_for_each_entry(packet, &otpc->packets, list) {
> +		if (packet->tag == tag)
> +			return packet;
> +	}
> +
> +	return NULL;
> +}
> +
> +static bool mchp_otpc_is_valid_fourcc(u32 tag)
> +{
> +	int i;
> +	u8 c;
> +
> +	for (i = 0; i < 4; i++) {
> +		c = (tag >> (i * 8)) & 0xff;
> +		if (c < 0x20 || c > 0x7e)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +static struct mchp_otpc_packet *mchp_otpc_resolve_packet(struct mchp_otpc *otpc, u32 off)
> +{
> +	/*
> +	 * Legacy id based packet access: offset = id * 4
> +	 * Inside the driver we use continuous unsigned integer numbers
> +	 * for packet id, thus divide off by 4 before passing it to
> +	 * mchp_otpc_id_to_packet().
> +	 */
> +	u32 remainder = off % 4;
> +	u32 id = off / 4;
> +
> +	if (!remainder && id < otpc->npackets)
> +		return mchp_otpc_id_to_packet(otpc, id);
> +
> +	/*
> +	 * TAG-based packet access: offset is a 4-byte ASCII tag (FourCC)
> +	 */
> +	return mchp_otpc_tag_to_packet(otpc, off);
> +}
> +
>   static int mchp_otpc_prepare_read(struct mchp_otpc *otpc,
>   				  unsigned int offset)
>   {
> @@ -140,8 +190,29 @@ static int mchp_otpc_prepare_read(struct mchp_otpc *otpc,
>    * offset returned by hardware.
>    *
>    * For this, the read function will return the first requested bytes in the
> - * packet. The user will have to be aware of the memory footprint before doing
> - * the read request.
> + * packet.
> + *
> + * Two offset encodings are supported:
> + *
> + * 1. Legacy ID-based: offset = OTP_PKT(id) = id * 4
> + *    Used in DT as: reg = <OTP_PKT(1) 76>;
> + * 2. TAG-based: offset = 4-byte ASCII packet tag (FourCC)
> + *    Used in DT as: reg = <0x41435354 0x4c>; (tag "ACST")
> + *
> + * To use the legacy ID based packet lookup the user will have to be aware of
> + * the memory footprint before doing the read request.
> + *
> + * But by using the TAG based packet lookup, the user won't have to be aware
> + * of the memory footprint before doing the read request since this driver has
> + * it abstracted and taken care of.
> + *
> + * Practically, there is no way of knowing the mapping of the OTP memory table
> + * in advance for every device. But by using the packet tag - the identifier
> + * ASCII value (FourCC), the packets can be recognized without being aware of the
> + * flashed OTP memory map table and the payload can be acquired reliably.
> + *
> + * While the legacy ID based lookup is still supported, TAG based approach is
> + * recommended.
>    */
>   static int mchp_otpc_read(void *priv, unsigned int off, void *val,
>   			  size_t bytes)
> @@ -154,12 +225,11 @@ static int mchp_otpc_read(void *priv, unsigned int off, void *val,
>   	int ret, payload_size;
>   
>   	/*
> -	 * We reach this point with off being multiple of stride = 4 to
> -	 * be able to cross the subsystem. Inside the driver we use continuous
> -	 * unsigned integer numbers for packet id, thus divide off by 4
> -	 * before passing it to mchp_otpc_id_to_packet().
> +	 * From this point the offset has to be translated into the actual
> +	 * packet. For this we traverse the table of contents stored in a list
> +	 * "packet" based on the access type - packet id or tag.
>   	 */
> -	packet = mchp_otpc_id_to_packet(otpc, off / 4);
> +	packet = mchp_otpc_resolve_packet(otpc, off);
>   	if (!packet)
>   		return -EINVAL;
>   	offset = packet->offset;
> @@ -190,10 +260,25 @@ static int mchp_otpc_read(void *priv, unsigned int off, void *val,
>   	return 0;
>   }
>   
> +static int mchp_otpc_read_packet_tag(struct mchp_otpc *otpc, unsigned int offset,
> +				     unsigned int *tag)
> +{
> +	int ret;
> +
> +	ret = mchp_otpc_prepare_read(otpc, offset);

Is this needed? At the moment this function is called a prepared was already 
done (in mchp_otpc_init_packets_list()). The header was read. As of the current 
code from mchp_otpc_read(), after that, writing 0 (for DR increment) to AR and 
then reading DR leads to successfully reading the DR.

However, the manual [1] mentions the following on step 4 from chapter 37.5.3.5. 
Read:

4/ Read the header of the packet in the OTPC_HR register. To read each payload
    word, the *address of the payload* word must be written in OTPC_AR.DADDR. The
    payload word is then available in OTPC_DR. If OTPC_AR.INCRT is set to
    AFTER_READ, any read in the OTPC_DR increments the DADDR field.

So, maybe there is a bug in the current code, in the mcp_otpc_read() and this 
function, and instead of writing 0 to AR, after reading the header we need to 
write the AR.ADDR and INCR=0 and after that read the DR? And the HW happens to 
behave correctly even with the current implemented approach?

[1] 
https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAMA7D6-Series-Data-Sheet-DS60001851.pdf
> +	if (ret)
> +		return ret;
> +
> +	writel_relaxed(0, otpc->base + MCHP_OTPC_AR);
> +	*tag = readl_relaxed(otpc->base + MCHP_OTPC_DR);
> +
> +	return 0;
> +}
> +
>   static int mchp_otpc_init_packets_list(struct mchp_otpc *otpc, u32 *size)
>   {
>   	struct mchp_otpc_packet *packet;
> -	u32 word, word_pos = 0, id = 0, npackets = 0, payload_size;
> +	u32 word, word_pos = 0, id = 0, npackets = 0, payload_size, type;
>   	int ret;
>   
>   	INIT_LIST_HEAD(&otpc->packets);
> @@ -215,6 +300,20 @@ static int mchp_otpc_init_packets_list(struct mchp_otpc *otpc, u32 *size)
>   
>   		packet->id = id++;
>   		packet->offset = word_pos;
> +		type = FIELD_GET(MCHP_OTPC_HR_PACKET, word);
> +
> +		if (type == MCHP_OTPC_HR_PACKET_REGULAR) {
> +			ret = mchp_otpc_read_packet_tag(otpc, packet->offset,
> +							&packet->tag);
> +			if (ret)
> +				return ret;
> +
> +			if (!mchp_otpc_is_valid_fourcc(packet->tag))
> +				packet->tag = 0;
> +		} else {
> +			packet->tag = 0;
> +		}

The else path is not needed since packet is allocated with devm_kzalloc(). With 
that, if the above is true this section could be written as:

if (type == MCHP_OTPC_HR_PACKET_REGULAR) {
	u32 tag;

	writel_relaxed(packet->offset + 4, otpc->base + MCHP_OTPC_AR);
	// or if the manual is wrong:
	// writel_relaxed(0, otpc->base + MCHP_OTPC_AR);
	tag = readl_relaxed(otpc->base + MCHP_OTPC_DR);

	if (mchp_otpc_is_valid_fourcc(tag))
		packet->tag = tag;
}

Thank you,
Claudiu

