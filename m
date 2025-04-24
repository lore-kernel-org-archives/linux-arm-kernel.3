Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56B1C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bh3s53lxnJJO2dUSgO66le/Ri+7+LskKQ0VlwKBl9JU=; b=kTRl63HHp3fz5jVIOuXgfB+gEb
	JjAZt7/A6Fjtggb0Eq8XAIe/MUWdZf6O2Allxg2FlfXeGig5mzCn+y6iXMKOC8ulvySPYbk/zdM1z
	5ZSpwFFQ7X5AABlSWXJq/seGtOrip55LVvHcKs7jcTfsI/7PVxRHLh6ACs2Jr1El+V6MjyYZhqh8A
	UEsutspK6GYVOy2a/lY2m6CooeyucDjlOk4ipKMBDFDFEsFz0E4sHJcHGDL0ZImAhe8zQeilP6Pe8
	FPOcT5sQC0EhQow7b1y1TisLjpVtoE6HvUjVQue5Rf7MbThXv2fmy1zuLF+NfFvv49JCqNjwhq/tz
	+WmsFRtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z3N-0000000EaGQ-15AD;
	Thu, 24 Apr 2025 16:03:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vJQ-0000000DxNb-0xaC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 12:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745496254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bh3s53lxnJJO2dUSgO66le/Ri+7+LskKQ0VlwKBl9JU=;
	b=hUWJkPQlxl1a5FPHlLKfiI7BAdPB0vZi9x7rVztM90JiRyWgzEDgNXLVe9s/Xx1AtE4iJU
	by2u2gcDNvThVfnPpA09vRwg30q1hlzqyOX+qnzOAc0cBw8pIGjJdbVDvSkW5c3JTMOEeE
	8JLeA+VoGi3pwBhrPnnhl7de1DEoKAM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-pm16O2PgNOibybjEB3qTag-1; Thu, 24 Apr 2025 08:04:13 -0400
X-MC-Unique: pm16O2PgNOibybjEB3qTag-1
X-Mimecast-MFC-AGG-ID: pm16O2PgNOibybjEB3qTag_1745496252
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39134c762ebso322210f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 05:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745496252; x=1746101052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bh3s53lxnJJO2dUSgO66le/Ri+7+LskKQ0VlwKBl9JU=;
        b=ETj7L887vEdcVbKwdUsXCgW7TAJ41eesWnXIvoImBcBDO5n9WYbOWKZrmINwwRB0BG
         hrIvyw9UEjFqhO8sgVNpvEX+SHt5+CvPaS17L/jocPOaiboe8y9ryYTmf2sINFPXrTB0
         7hLplNL2UJyYLEobVl9gvzC0yU76el7k3jyyflYTgOuNd9LNqEADafdnSY95TAbzfVb6
         tw1lK8ly5AfeKq+vkEEdDegsV4EahE/29Am5AwOPsJS32r9h3U/5OSAipejB7obbPeS8
         nV2D46h8sMqBAgKDlg+Yvk92b3cXo0kC0R/ZBEsl35iSF3KMLxNAAg4PMPWMFuyUzU64
         ak7g==
X-Forwarded-Encrypted: i=1; AJvYcCXN+G9kJjDXhTlcd1Whka7OZSEQSO9eYjmHJvka8uUQHnPmZihjDlWr/DtUpbD5+sI/gdtGtidTro58SvS6RQXC@lists.infradead.org
X-Gm-Message-State: AOJu0YzL1rsvMLq+5MAYSIlmsFUKkuhffZvPLQbD9wrLKfoZrdGrxXzO
	nKr7Vp1ZZlWY6eJYhyWK+gTGK5uKe7lYJwn9KiSJMQFvf+GEfRucK6RTIwDaPwN5MiJaM41Eaab
	CLGXaC7VqYTducdDgYYSTNS8BIv22+v4joGCxNCBJFaqV6jfkxHbT2svH5cJ7PHSxiBr5qBHc
X-Gm-Gg: ASbGncuYeXmTlfBs9fx2njQYbvmNgIzft9WTY3IbN/1tg1acydtKJyxA7XKCZfnzl6y
	CsIIb2sVAx4CsKTGIVkfe0V7akIhG42Y6jGuUt6CaXWsgkYQZ2yP/M01NIEzIYL9n6XONCVcV74
	iixAQpOa/kgfWf5WY4Yxh2yDvFslwhxRVGKUAYDsZXyX87qd5Tp1c0h+00rsqFK7MqQuzVrFU4Q
	1DxqfQTX+B51iCxBqI/CllDqL/h3NiOQ0T/BHfXE41tBTWwxmLUKv1ScJyTKUNQK9DFjErSRJ3B
	6fYuXNzdS7T94NPaAiwjqYarCxGNbEIoo5gUlug=
X-Received: by 2002:a05:6000:178d:b0:39c:266c:423 with SMTP id ffacd0b85a97d-3a06cecb362mr1842808f8f.0.1745496251987;
        Thu, 24 Apr 2025 05:04:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRZkkYGPeYcct/UGZCOBgEUQnsD5s94C5Hyp3c2PijFG72me2Lm433rHFIjvW+57vf1ZeXEA==
X-Received: by 2002:a05:6000:178d:b0:39c:266c:423 with SMTP id ffacd0b85a97d-3a06cecb362mr1842753f8f.0.1745496251410;
        Thu, 24 Apr 2025 05:04:11 -0700 (PDT)
Received: from [192.168.88.253] (146-241-7-183.dyn.eolo.it. [146.241.7.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm1852436f8f.7.2025.04.24.05.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 05:04:10 -0700 (PDT)
Message-ID: <43ef6713-9ae1-468c-bc43-2c7e463e04f4@redhat.com>
Date: Thu, 24 Apr 2025 14:04:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/2] net: stmmac: Refactor VLAN implementation
To: Boon Khai Ng <boon.khai.ng@altera.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 Tien Sung Ang <tien.sung.ang@altera.com>,
 Mun Yew Tham <mun.yew.tham@altera.com>,
 G Thomas Rohan <rohan.g.thomas@altera.com>
References: <20250421162930.10237-1-boon.khai.ng@altera.com>
 <20250421162930.10237-2-boon.khai.ng@altera.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250421162930.10237-2-boon.khai.ng@altera.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nnKE0hyP4x33L6cheOJ8kO1Znfs5bQJW0kD2mrwbZak_1745496252
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_050416_342595_E11B7F71 
X-CRM114-Status: GOOD (  18.02  )
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

On 4/21/25 6:29 PM, Boon Khai Ng wrote:
> Refactor VLAN implementation by moving common code for DWMAC4 and
> DWXGMAC IPs into a separate VLAN module. VLAN implementation for
> DWMAC4 and DWXGMAC differs only for CSR base address, the descriptor
> for the VLAN ID and VLAN VALID bit field.
> 
> The descriptor format for VLAN is not moved to the common code due
> to hardware-specific differences between DWMAC4 and DWXGMAC.
> 
> For the DWMAC4 IP, the Receive Normal Descriptor 0 (RDES0) is
> formatted as follows:
>     31                                                0
>       ------------------------ -----------------------
> RDES0| Inner VLAN TAG [31:16] | Outer VLAN TAG [15:0] |
>       ------------------------ -----------------------
> 
> For the DWXGMAC IP, the RDES0 format varies based on the
> Tunneled Frame bit (TNP):
> 
> a) For Non-Tunneled Frame (TNP=0)
> 
>     31                                                0
>       ------------------------ -----------------------
> RDES0| Inner VLAN TAG [31:16] | Outer VLAN TAG [15:0] |
>       ------------------------ -----------------------
> 
> b) For Tunneled Frame (TNP=1)
> 
>      31                   8 7                3 2      0
>       --------------------- ------------------ -------
> RDES0| VNID/VSID           | Reserved         | OL2L3 |
>       --------------------- ------------------ ------
> 
> The logic for handling tunneled frames is not yet implemented
> in the dwxgmac2_wrback_get_rx_vlan_tci() function. Therefore,
> it is prudent to maintain separate functions within their
> respective descriptor driver files
> (dwxgmac2_descs.c and dwmac4_descs.c).
> 
> Signed-off-by: Boon Khai Ng <boon.khai.ng@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

This patch does IMHO too many things together, and should be split in
several ones, i.e.:
- just moving the code in a separate file
- rename functions and simbols.
- other random changes...

> -	ret = readl_poll_timeout(ioaddr + GMAC_VLAN_TAG, val,
> -				 !(val & GMAC_VLAN_TAG_CTRL_OB),
> -				 1000, 500000);
> -	if (ret) {
> -		netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> -		return -EBUSY;
> -	}

> +	for (i = 0; i < timeout; i++) {
> +		val = readl(ioaddr + VLAN_TAG);
> +		if (!(val & VLAN_TAG_CTRL_OB))
> +			return 0;
> +		udelay(1);
> +	}
> +
> +	netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> +
> +	return -EBUSY;

... like the above on (which looks unnecessary?!?)

/P


