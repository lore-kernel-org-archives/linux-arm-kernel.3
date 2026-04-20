Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6787BF36C5F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 12:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8b7fULVtzI56Bio+ZPKMEGYjw8VcHhdEK82O/OfdDU=; b=RoNvS10kkfXKTlW+HGMuxlWMQV
	m24w00ODcp3LfLpQFxBjjax+xIFsAR9wjqv7MQGwd0wjvmatpV23CNNEtkTNupo+5D04nvgyfcmBO
	YhEbGMKZAhDLAL0xivDkOPq05FhK5kS4OC877GLKVSTL1hlrPdgGVv0AUkVzV9llqhMnu4EshEr2k
	kAnyp9cx8AfXMpccwvMRFlNX3A5KcOiDdPyAC099/F/NmrIcrAbarRtH5/B7UW8KYP5x3YivyTVy6
	I75WkWmvFWbAYo9DYR5dgGXPShDrIZhwFnw1HQY0vU83nLTjP5liaYH3LAZcSPlcEidCm+z1I/sOu
	CZ85ZyJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnL9-00000006qpK-3oau;
	Mon, 20 Apr 2026 12:02:59 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnL5-00000006qny-40Bp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 12:02:58 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43d7213b6ebso1962966f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 05:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776686574; x=1777291374; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8b7fULVtzI56Bio+ZPKMEGYjw8VcHhdEK82O/OfdDU=;
        b=YqYpYKJaWvR48VNISHhzXTBl0XMm38SawN5UlK8V4TpNXXLTjHEH+iKwckn9STr1WD
         jqtakgJCKAxIEBTlNs5rHyDGTCseoMfhGy5TIJlm+itvLou+qGDZwW0/LhV7Sc78UjQQ
         bF06an2yMZpU1Epe0QiKr1KwFmpIf2sRE5+OVZ/KPQPSTsyAWz2Rx2VJh4PpTdQKeU+L
         uNNNYW12vG9q7WlzOdmNGJZu/tupmz5r40GdzxXNB7BfJsnEadRa/kFRwxdPMolBARUJ
         rds0x2d36TiM38VD6IF7/7zPVX5W2qN+jP7QG/EhGJEWBh3Q+Q4oP1wEU+fCu5RbxGTH
         B5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776686574; x=1777291374;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8b7fULVtzI56Bio+ZPKMEGYjw8VcHhdEK82O/OfdDU=;
        b=f2G6cXFCyLiUKjYwwinBt3HX+x9oA3xaWS7iAGqB5C6b85qbC8rcfFI3mBCqdlHQcm
         /nhlxVr0toTRw7gNpsVAxERUl7nt0uUO06pZyukAQUQn61A4UFpbbygXda7BUBu1QjSM
         yZJ7c0OrvfiNu1889Fg/J6q2mS+4vf1OOs6ax0ya+YG/hM0JQT9FDHh5ig27lpSdfX8Z
         MBcg90vV74DY6LQp3hLfSY/xQE7uTT3AvGRSDJQLgcPN5afcNZFY6ZorY4t8PM4ZwWXD
         mNi29vXsxHbLEm4ZlzsW4DTmUouhA7jw+B+u3pk7iMSpw7RBNmsWTkylQBmHj9be+6Ez
         68Nw==
X-Gm-Message-State: AOJu0YzegR+x31BtAVJ7xc4V9PvRQF56LkIgfRp0nBfJo8FoF7twQTgj
	/XBEG3ug7pEglP/oVH/HN8PxL2nYpX5pOkE6NN5BXXd1v+UTTCvb9eHMslwjdm+I21M=
X-Gm-Gg: AeBDievnu3LqnpTtyIP9H5/T3pBwc/MscII0A7u59YjBXcA0TAC+eD/gkmhpg1mYCjZ
	yt/8dDA2VNd+G9FxgSVv6H/jX2vVU7Dh4A6F2r00+JDI4KZ5TrY+QYCHyimloobXIUR75qRlRZk
	imfiXFHW5cVtZdyuU8oWB9UF0W8MPV61CTq0bJRWzAR82Kf0xhVMgZO/CIZWxBJ02GOvVNzubww
	uRRPjWmBYp10QI9GMYHWfFD23O/3rvFR+TYC/E2l3J7CkNUZ9KKBHRgUF5SEx0GdsLvZj96GkdL
	p3CASGvOWvaI6ZhPc8o8DlQHfOj+S2EM1Qn1KUK+sBRilnZxQ60Sq4Nh0f8GpTgdUGw9Y4cRUXf
	3RqbNc8zmYvCiPoKup8DYcWLIAZH2ZKZuOYS8NlpOSFVT31K8BA13tekmR/GHXLEYB+oK6cOj9d
	ZY6JaZK1hUKTdw8qHbx53/ctwtaEWKwyanxLyPGtT3sH8oykVA96CU6IcHuE2K0S4IGHz26qFSK
	7/0k2uJ1wdG7e1uRg==
X-Received: by 2002:adf:fd4c:0:b0:43f:e414:4c6a with SMTP id ffacd0b85a97d-43fe4144cabmr12333460f8f.0.1776686573966;
        Mon, 20 Apr 2026 05:02:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:851d:cf13:ef26:f254? ([2a01:e0a:106d:1080:851d:cf13:ef26:f254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a18csm32493652f8f.20.2026.04.20.05.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 05:02:53 -0700 (PDT)
Message-ID: <7bbaf370-3b66-4889-9abb-c31983948ac3@linaro.org>
Date: Mon, 20 Apr 2026 14:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/4] arm64: dts: amlogic: t7: khadas-vim4: Remove
 redundant clocks from UART A
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420-add-bluetooth-t7-vim4-v3-0-669cd2530ae5@aliel.fr>
 <20260420-add-bluetooth-t7-vim4-v3-3-669cd2530ae5@aliel.fr>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260420-add-bluetooth-t7-vim4-v3-3-669cd2530ae5@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_050257_162424_E84E402C 
X-CRM114-Status: GOOD (  11.75  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 4/20/26 13:58, Ronald Claveau wrote:
> Remove clocks and clock-names for UART A, as they are defined in DTSI.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 69d6118ba57e7..3227ab27de107 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -250,6 +250,4 @@ &sd_emmc_c {
>   
>   &uart_a {
>   	status = "okay";
> -	clocks = <&xtal>, <&xtal>, <&xtal>;
> -	clock-names = "xtal", "pclk", "baud";
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

