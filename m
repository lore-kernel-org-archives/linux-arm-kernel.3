Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EE6C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGs1EnzSeub574uPXMIe13ZFm12UfNdhxp96d4YDOjA=; b=UCM2bIQ+DPe4t4dkaCZoUebVXi
	G5YmKcMLJh1U4KW+XzvHof2OoeF2G6N1ELobQaSF+jHvXzRiYgW8olq6c5AkgCXHM88tpGbPp605E
	0GxCmyhklt8MF0zHImhS2pYSnje7IYmIvZIPyFNhxXTOGOtm3iqLTH9GbwCjYsVaTf+sVP6SzsY1t
	R/unSCfFpBNHDBsVlKR3TPQQnesLkc12tfC7XBlIYqfKZINm3ShVENG1Y+6sYWfw6hOqJs+McEhvw
	8ySjl5nds7npa8KjhARbLyr1xPTj96fNNEpFCEfrG6eVfnRZa65gMUR5wXayUl2+NG2w7mrdpDakH
	tORupZAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YZJ-00000006ohR-33oC;
	Mon, 07 Sep 2026 12:35:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YZC-00000006ofw-0I7H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:35:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788784516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=eGs1EnzSeub574uPXMIe13ZFm12UfNdhxp96d4YDOjA=;
	b=V8O7F5shShFpzHOrRFONjfyXJbcog/aA+RRKsV0AONWLbmwwnrYPz9odANHPYw/PDpqWcj
	DAXf9NchLU0+vNDtHgan3ffCSsnml5WH0eD4VL+K8YaHtoG+XmEFPHcT1uiAj8npTipWnw
	K5vT+cJqQUJ0EC6AOabisSRnL5VRujs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-N5NXZEgMO_aVxBF3d479JQ-1; Mon, 07 Sep 2026 08:35:12 -0400
X-MC-Unique: N5NXZEgMO_aVxBF3d479JQ-1
X-Mimecast-MFC-AGG-ID: N5NXZEgMO_aVxBF3d479JQ_1788784512
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48439ef42d8so2905003f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784511; x=1789389311;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGs1EnzSeub574uPXMIe13ZFm12UfNdhxp96d4YDOjA=;
        b=r7t8mdry86dr8SH1Y3A3BCOYDHgHmd23VFOfQNdFuOHG5TIZIcvvhUZn5nMaKvgLWk
         mDsueH7lZ4PwR8Cm7sIu+g+uFM8Zqig6EThwf5qTb0iSPtnGjdozlYV7mLocpB5rkq4i
         HP1Quce98t2EWmK7oC0WS2Io4fPm34vM+2w5WlTBEyR82WFLuWJijwO62ngWHsQm2I1E
         6wFVJtp5fRqsc/4mT3QDdEMzUa1rERx2YBNeRgzGG7RzSp40JV5KYEzIls3uGlZUAOI0
         PP8vCVGg4MALy9dRovPwzqpJBCeK4t1/Q4Lo+/TTgA25QaXiUvA2kNVnQSFFOKBrKzGG
         e4Ww==
X-Forwarded-Encrypted: i=1; AKwUvBwofTVrhXPjMxxftunQg2w/lTl0ivFQR9bEz6akHPYupyoMyhvzFdNPGyECFrJZpAFR7cZH65Ldm95BHLYZ6H6w@lists.infradead.org
X-Gm-Message-State: AFuF++lrDgKybptA331d69ybmkHM8BFNliQWTHh9gKR8ry7rKU2mc9/v
	s8S3/7iX2b2GIPyw9FTA/44SnMRyu9WRQH1LxO8Y4qjYAksMktQpEygs+/qQLFs/T47J4Pknp7e
	TlSZMKHIlzPfICCkDd628i3JhSKVowOlVsZmiTXEijcU+ihXQBmqGHW9QAzlP3SFAV7tcbyKEEZ
	Qy
X-Gm-Gg: AYBFou0jKsNSEWsBK3R1aRpHoNhQpeyp6dbfLoxWoMawJzSQChoqaiN5I40zKZSUkNA
	LU8JK5IME628nXmid1VUUHoP9Hhz71zisdvxSV6LfgJtDzHc2QeeZhgyI+PQM64d/uuC/yARbTr
	FUAiJYkUjXw+B9LNqTbz5Zpma0Tzof8oLjxRv9j0kIWehT8nBv14hxJtW45+GkJtGQlIncVdl/5
	x3l+4GFfXOMaeDZb7jtb40V+FkOGfVTyMLETgoqzBvwGbiNxpFSKCJjn/yDx57p69wITKshgBC3
	sqf5954kLtQ+eDS9oXtswWFz1+c+K5p429E5Y/611Bdn6Ft0lW0ocjfO2HuXa/jJU5dejZTl
X-Received: by 2002:adf:e199:0:b0:485:8a46:7052 with SMTP id ffacd0b85a97d-4858a4671ffmr21064082f8f.36.1788784511665;
        Mon, 07 Sep 2026 05:35:11 -0700 (PDT)
X-Received: by 2002:adf:e199:0:b0:485:8a46:7052 with SMTP id ffacd0b85a97d-4858a4671ffmr21064046f8f.36.1788784511253;
        Mon, 07 Sep 2026 05:35:11 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.113.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm29439360f8f.34.2026.09.07.05.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:35:10 -0700 (PDT)
Message-ID: <400323d4-cdb8-40ff-b23b-d426a0d7e6e8@redhat.com>
Date: Mon, 7 Sep 2026 14:35:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 George Cherian <gcherian@marvell.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>,
 Gilad Ben-Yossef <gilad@benyossef.com>, Ayush Sawal
 <ayush.sawal@chelsio.com>, Srujana Challa <schalla@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Bartosz Golaszewski
 <brgl@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20260904114345.27509-1-hemanth.selam@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260904114345.27509-1-hemanth.selam@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KSlP3voHXI2lkQ1GowszziGXjapQN6BdlQnzaTxiIpY_1788784512
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_053518_187065_A526BE31 
X-CRM114-Status: GOOD (  10.46  )
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

On 04/09/2026 13.43, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>   drivers/crypto/atmel-sha.c                       |  4 ++--
>   drivers/crypto/cavium/cpt/cptpf_main.c           | 12 ++++++------
>   drivers/crypto/cavium/cpt/cptvf_main.c           |  4 ++--
>   drivers/crypto/cavium/cpt/cptvf_mbox.c           |  4 ++--
>   drivers/crypto/cavium/nitrox/nitrox_main.c       |  2 +-
>   drivers/crypto/ccp/ccp-dev.c                     |  2 +-
>   drivers/crypto/ccree/cc_buffer_mgr.c             |  4 ++--
>   drivers/crypto/chelsio/chcr_algo.c               |  2 +-
>   drivers/crypto/hisilicon/sec/sec_algs.c          |  2 +-
>   drivers/crypto/marvell/octeontx/otx_cptvf_mbox.c |  4 ++--
>   drivers/crypto/omap-sham.c                       |  4 ++--
>   drivers/crypto/qce/aead.c                        |  2 +-
>   drivers/crypto/s5p-sss.c                         |  2 +-
>   13 files changed, 24 insertions(+), 24 deletions(-)
Reviewed-by: Thomas Huth <thuth@redhat.com>


