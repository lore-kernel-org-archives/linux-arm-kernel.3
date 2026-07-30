Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCF9C55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ae0rKiO6QS0+h8Q8O8N/F/upuiynCiCImWPcUdOek2E=; b=jf9KT4z5MmQlG+aG4iwIha1GjI
	UtKo1uzy2doWNyD8jv7U8D8nLYY1Vefm9pjPiR0GOAKoZfZnuM7XjpwnCO/bipwjG+rsZHWiZODiL
	vCh1Q4W/Kj9kG0ulQOWWvzHUKj8w7kz/Tl1uhkVAUvl0TIMqkqHSx5m3+uUVe0sV3yKfhS8kUMNwc
	085sft+aBNeDzDh1HZeuZEFWX+BfNvZ1DAU3v6VQEqMGPuJzlwWWvH86B0ENx80uRCSDrRExSH3I3
	cpQF6i3KRxm4mO1KiE/BlDrMLNYPJbuPYzXPoiP5b6U6XR0Ucry0x9S1OmISpYCCWoRXb5rz2UXxn
	LL+ZvaMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTj8-0000000B0X4-2w5a;
	Thu, 30 Jul 2026 16:35:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTj2-0000000B0V7-3taD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785429316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ae0rKiO6QS0+h8Q8O8N/F/upuiynCiCImWPcUdOek2E=;
	b=Ku+djM+1VhpqvtY3FbrKtMRKOtO0ZPfEFSruzRRzEgQtPgAmA81jC8UwPea+kjX9IXvOwG
	VGALwdk2fk0rAG/vOU1FvHPlz9FEwLJcjUgUucawWTdxKip+ROr9towZminONhSsCPhsQn
	m3YhDoil8WFd7KoPoW+OMBFlZ7rweCg=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-6K-0oD3oMd2N3mbq5Xvtmg-1; Thu, 30 Jul 2026 12:35:13 -0400
X-MC-Unique: 6K-0oD3oMd2N3mbq5Xvtmg-1
X-Mimecast-MFC-AGG-ID: 6K-0oD3oMd2N3mbq5Xvtmg_1785429313
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6689c0ac195so6436445d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429313; x=1786034113;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ae0rKiO6QS0+h8Q8O8N/F/upuiynCiCImWPcUdOek2E=;
        b=ln/45vi+M+2O+MTbuPEcUr7mrBC+wntfMmFxGvjZ3rOZKEBow03F2sa9Rip8SYvglH
         Rdfniio+2b0xjWpgw+PLf9zuie9P19bnNouuYij94R9IVkOQNyGAjMORkEu6v+66E04d
         dkyxXuMm0lDC8vfcU3MoGs+jr9GeN7FceBwjcFjh3ou1O9JgKpXmHWki27jwD85Zqv9Z
         FIMHebovR3UeiMHydGM8nrcyTA9dIbKx8JSxIFpQqF1THdnvcR/s7BLFIT8UwovL6t/n
         Eblcdm/bzXzrvy9j5qzM++P/22DgR0NZh+CSCJZaC+Y/bLsY5LAda44ahg07PYtNjdVV
         rGsA==
X-Forwarded-Encrypted: i=1; AHgh+RpQZGnALQ4saHHYw4mx3yFrcfUjCIp+QJAFtWngW9ibKaabaSVP9ii81Sh0FiTqruLVFJgjqllo0n1h13YLXBNN@lists.infradead.org
X-Gm-Message-State: AOJu0YxTBMrQNWHT73UKUt03LxqhmGP3hoLuVtq3UzrQNmYfEhttKXpl
	UvYRyizo7oXX9Nou7gQ4Fm0VGej6fo/376WJTJOY5ILxLsWxP/TP1+Fba2cxx0iKxH0+WZllOjq
	yo8/hJi46VMliFDfTnnBtUFnBx+/kyfula4ugZsrzl0WUQej5ys2Grg0lJMjL6OH4Lf0nHHVP/T
	+/
X-Gm-Gg: AR+sD13IQrLWdT67HF/eChR9T0v2wIqXfUK+UFIwIsWPqj7aCzNiSoIdsimvI8zHyu7
	rnKVoXv4ryHRWGIWcjI9c4zz/JogAo7PHWPtgo3Ro+hyArFGrWFrNyN+rfj/zkDGi9GOkh4zl98
	TaIJI6uFJHqF31/rEDqlF99rAeLUQVTDx0tRMa78Oqpj5siYY9sOn6E0UDhTHCn5j6dMmj2T7K7
	PnyvLDR5oAIq3NMNssIxTRZ1fUh1M/XE4rM8Ld0srMOtKkYiGAr4NaEAlV3GkQAJYgPw+WI5Suy
	OQm02mtgichK0+v0U03xglcYbU/R8S/CtpTjGB466l6C4Elnnk6fgmRxmodwAlytqtuNGf3aEom
	McJE0dXoPgdixcwVU863rmPtOZh07dVAQdeM=
X-Received: by 2002:a05:690e:484b:b0:668:2e27:22a7 with SMTP id 956f58d0204a3-6692f4d43c2mr1753676d50.33.1785429313005;
        Thu, 30 Jul 2026 09:35:13 -0700 (PDT)
X-Received: by 2002:a05:690e:484b:b0:668:2e27:22a7 with SMTP id 956f58d0204a3-6692f4d43c2mr1753652d50.33.1785429312567;
        Thu, 30 Jul 2026 09:35:12 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c734cfasm1633877d50.6.2026.07.30.09.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:11 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:35:09 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v11 06/11] clk: realtek: Add support for gate clock
Message-ID: <amt9Pby8K7w9Mxkw@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-7-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260728142806.1954638-7-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NFZwNwNY4hIBjWwOuGvoitzjG24x4oB_mZBsK0yXETE_1785429313
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_093517_205796_7F4B1A07 
X-CRM114-Status: GOOD (  15.10  )
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

Hi Yu-Chun,

On Tue, Jul 28, 2026 at 10:28:01PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Introduce clk_regmap_gate_ops supporting enable, disable, is_enabled, and
> for standard regmap gate clocks.
> 
> Add clk_regmap_gate_ro_ops as a read-only variant exposing only is_enabled.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v11:
> - Add 'rtk_' prefix into struct names and function names.
> ---
>  drivers/clk/realtek/Makefile          |  1 +
>  drivers/clk/realtek/clk-regmap-gate.c | 70 +++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-gate.h | 65 +++++++++++++++++++++++++
>  3 files changed, 136 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.h
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 71edc18121c6..90c0658a83bf 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  clk-rtk-y += clk-rtk-common.o
>  clk-rtk-y += clk-pll.o
>  clk-rtk-y += freq_table.o
> +clk-rtk-y += clk-regmap-gate.o

Sort the list.

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


