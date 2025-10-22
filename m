Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9863CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 18:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2kFn+Q9bHJC3Z5Ojn03a1WB7AFdkKhdOTMatKkfbRQ=; b=hnRfcAPuiDvO9whrKdgyi0YdQU
	lM6WoyNnSO4VxNJxwxIGUqvgEsK02sINgvY9GOEV6bnBGDL7wKhbvdnaDvQpfB7SUXPZicpbkkXpr
	aQ/M8r6CEvr/E8EHXwO2Sb566ap5oPaDupAgWdHgQZ6nBXC5NA7T/hEYc/rMtIfkUzii+PKUzieUH
	iw7SJu1PQn3ilxWP5RDZ8nfbl1+0E4kKIGIJUH+08tuxv9O0oJZjo/ZkkDmrSs9uE/gtL3m9kYKDT
	B55HLzCobig2hjtLdtmsu3mfso4msTpucLUUy95cKnYPAozCzTIRI37Nd7k8mBLZkjxdmA+tCAKtS
	wk+LTMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdLj-00000003xDU-1sHq;
	Wed, 22 Oct 2025 18:14:15 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdLf-00000003xCh-43SQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 18:14:14 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7a2738daea2so79441b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 11:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761156851; x=1761761651; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z2kFn+Q9bHJC3Z5Ojn03a1WB7AFdkKhdOTMatKkfbRQ=;
        b=BIU4aiJAyJtQ/K3WxxPoGUR/YodAdWOiTS/SRWy8AskbXlNYdfEOTd80nAbDBC/3FY
         6oHV9AocilH3YrCcDE9Ta2gfY/dHMZTwmAmG7uw9MdWKE88pc4UnZwwGD/C2KUNdXZht
         yyP9Em8VK8pqhgiZXk+R3MYPeD60wR4sA+3V6Arh+MSrFNTw486edXKuFljZdNcNb0sP
         msM5AUNIo1I0f7VB3iMdTuuv/G+UadgS+BUYhhLzhFmyZPgeutpeDCXeu4kR07jj2r+F
         98OK3YwYAHK4mify/1pvVv4jjh/SOvS3Tjwu/Db9Oy4wgZYC9QUyFb6WvE/XgEMBhQsM
         qWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761156851; x=1761761651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2kFn+Q9bHJC3Z5Ojn03a1WB7AFdkKhdOTMatKkfbRQ=;
        b=w/lAv8Jmh0WNdgPtIcxJDhpMKtyFLV+VzJLz895PN+jMmofG58lHV5b7705cXgAa5X
         tNCEoJB310PtpO0rVJqhnV3LEestW1yiUV3OjilX4XvvC97Bz9pnzyPDxZabOLkwFQCq
         sY9s9Fzs/QuiE8lb9PQBeg7V7aGZHrJ2Wn7kpu+5QyrwZYQX+QY22TKjd1xIRaeE43YZ
         71RydMN/jzDu52his/dkHQBmw5lftCB0EUw09owaw0RSeseIiTjHKWEcY/ME3I4y3zHg
         xvXPwAvB/wFXc1HTVzuyKdj0RbLzzaEawprXzf/fVBwItjQoX8lXtAiI0C+LiUnsWzFh
         07MA==
X-Forwarded-Encrypted: i=1; AJvYcCXOnuU736fHdG0ILvXBtpCd0BX4qMgNlXqluq8BnoI0WGiPmtaC4Hd+sUpNjnXfNrA1FWNwVvBWLuXPKMVihlv0@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj7WN9114YE9DWScL0dwBbjAsk1JufF6gbHKvuC0r7xetuPJbK
	NWYb9cvNCQOpW964K1BcN+Wz5oWKk+41hTY95r+PfBEoUULdwmQBI/Zr
X-Gm-Gg: ASbGnct9rjdErj2gsypnoQJ33PoxrYxhfhWvUDYxz//h6Jg/UNp6u/ohaLL2Km1Rqep
	okogBJUV3xIXSntoQmPUIkXb7jLVa0MM6iWsFp54b1HTc68GFo899Qvoyq46nJb8398kmEXXSIU
	l3+zlIwe4uc117TKV3linEfEXEEyZ7UHflbnVYckTPR3879qNEYasfTSJc06qX0d8TLwCMHev1C
	ljErXPmBspMn3AQcRaO8BW2TlZUpNtl5lnu10nSYqep64a22GCw/nskns9jW3SAhQ2uXQnY8q3m
	5kCfW+tbGANQHocD0YxKduFa/zP7CghcpdA0BQIAc2WyJGoq537DuWLqagep811mjUEmrmUTo0S
	3PThUNTJIYBB62utdcRY3TfOjH0RCAhgcnoOV36raRQExjKGB23xqXtpkWgUcnHlhJegbvhS8XD
	uqTBVXCV9s5hJlW+NrcS2JJWONDvg=
X-Google-Smtp-Source: AGHT+IF2Mft5qBX8wVUVoHYsw+dNzDnWTlX/e+wgKxFPHsJD8mgW5lDVoEORt0wiViK+vK7wTKEhow==
X-Received: by 2002:a05:6a20:939d:b0:334:8e2e:2c55 with SMTP id adf61e73a8af0-334a8525dadmr26726146637.18.1761156851043;
        Wed, 22 Oct 2025 11:14:11 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a834de75bsm11192507a12.12.2025.10.22.11.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 11:14:09 -0700 (PDT)
Message-ID: <432ac9c4-845d-4fe4-84fb-1b2407b88b3f@gmail.com>
Date: Wed, 22 Oct 2025 11:14:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/6] net: phy: add phy_may_wakeup()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCO-0000000B2O4-1L3V@rmk-PC.armlinux.org.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <E1v9jCO-0000000B2O4-1L3V@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_111412_008552_B40B1CD2 
X-CRM114-Status: GOOD (  10.58  )
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

On 10/17/25 05:04, Russell King (Oracle) wrote:
> Add phy_may_wakeup() which uses the driver model's device_may_wakeup()
> when the PHY driver has marked the device as wakeup capable in the
> driver model, otherwise use phy_drv_wol_enabled().
> 
> Replace the sites that used to call phy_drv_wol_enabled() with this
> as checking the driver model will be more efficient than checking the
> WoL state.
> 
> Export phy_may_wakeup() so that phylink can use it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

