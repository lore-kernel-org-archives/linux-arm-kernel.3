Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F88C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfSK4wZ0IXAaLuWeqeSbn2/BZJH/6gHhbVTHrVcpn3U=; b=anMwnvXFRD1b5N7JyXUmut8MvZ
	fBU2tJ+9C2lzDn7m/J93Cv5bnc2VU/XxasOtd8mhCxpbfo5E4q3bJe4KKKwsC2y4aUyqgaW91D8Ys
	QOmc2pb3l3Soy6F/a1LnDudXDxjzPvQUZh4td2nrhjm4W3yuyt6WvCtnSwPqGGSGFdWkGrifCXdDr
	wqThZVQqGFmftKLGYHEN7inZhSriOXJEZeKkHtY/bE+yAyv4BGOzOvaFqU5fmJ2pBptIghPHovblD
	ly23DNifBnb88lzqAnMOBiTJwoZXc5F5ttW8fYk9ziy/mFlI0sVUDg6o2GPbrUyEgKk03SzhLvQfl
	gyLBFQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhlZ-00000001vSA-06lV;
	Mon, 07 Jul 2025 09:04:01 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgr0-00000001nhc-2Ikt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 08:05:35 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso4669363a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 01:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751875532; x=1752480332; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cfSK4wZ0IXAaLuWeqeSbn2/BZJH/6gHhbVTHrVcpn3U=;
        b=c739LnbvbEUNBR6yYv5XqacyIbfLiFBTZ27gpsvIUJu4S5iVdV30v3Ax9ZrTwUP/aE
         M2Vg6OWJ+3GfSpzdY/A0RQ+xOmQxxrvnujj5eee42Oeh2FGw8tfiTnJt4Wc8+iVdvlkC
         uY5C/R7prqrRACG5pcQ1KP3fzUyzyYmAXtx7CQc+3OQzV1E5wNyJHZrgbmK/IzA4b6Qg
         R1toOK/hX/dbWUENT9r4E4HjhyxYlZqSBiPNubiOLrAbKNrBu13Lig+PXIVzpCEBQ6UV
         pSJfs1UcGzzKaqykojQISxYZ5QAs5M11xWWIkH3WWMRXVfRUGaMkIBoF7Wop2fH0r46/
         9Rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875532; x=1752480332;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cfSK4wZ0IXAaLuWeqeSbn2/BZJH/6gHhbVTHrVcpn3U=;
        b=S7FfPkg4lmLMQy42GJVsvVpN6oIrrv5loCWEvA9SC/1YaX55vATaQ/rrjssNVw/xzk
         g+bPctrjDTzakw1+xRGNXe0YBvkIeZrK2tPu8iXGRYZCsQmNy2i8XJgq+OczFDHeDINq
         wz1PX7bqXoYApjjBy7x46KY/4KQ/QlHtE7khKq0Sl7JkGNwnmQR6gqS9P2DIdrfa78Qo
         TzY+J3cJ6M2HFKxI/RYhnqs3MIDSNisXuDLHb6cQMMgQqcv9cT7HDSO9clII/jfVtPOf
         EAtLfNI+fSiw88vxRi5ettGUvj9yUEMciN4itlRBMB4hrYpUm17zmgidgXXITa12c8FP
         7tFA==
X-Forwarded-Encrypted: i=1; AJvYcCWtw9yzm7I+V/GyaeP464/AvFSrb7lU8I23dyrl2sp6ywcmtZW/IixrSzC9oMzQOsk/MYJYYHqJDzwQRhykGvOg@lists.infradead.org
X-Gm-Message-State: AOJu0Yyaob40ebckz9kHTJugB1FLkLakUdk9u/Z5jfpAA6MmxGDVIvjR
	7/PU0F8o0+/oZD+J1X6v2T1zsfPoQui/xQ3zkYdy4f8I5dY9trwzUBEZYkWGz40btEE=
X-Gm-Gg: ASbGnctYfBadH2M1c8UNkO9p4f8nlE6WhEfgfBxG+aQgYRP4FEY6XHwKWiTR0HeK6tR
	muB2clqY1uEwr0wHRSh6LWGzcFuPXbVquY8MG3Xc999XkikAFjR+9MKbsZUT3qdU5jhuqz3cXZQ
	VF2zfwyTdzZ08bd8UQH66whXeah1yhe2eq5RJW4DCZEx6F9BWBAtlEA4uFXFsDa2F2iAOsA0z9K
	FKrlOoZC+3rs1zeohfcPWdVVYVZVlvLLmt9B+06gEeyJKiJDg4G1E/vnT68u9s3gjYCeBfc/tVd
	fJcB19MQXRWiiBkvRHfAkR1Idbim4TseTnkXevgBysUl2iKlk8D6zwB1HQ3ITttXWVQR6Q==
X-Google-Smtp-Source: AGHT+IE0L5DPGdmdGEN0u5OQ9V+2BW3fc6+QE6pzmfgPPJld1q+jXk9TxJBBsXR1qKPnO0Xzg35V4Q==
X-Received: by 2002:a17:906:c14e:b0:ad8:914b:7d15 with SMTP id a640c23a62f3a-ae3fbc899b6mr1217341966b.7.1751875532226;
        Mon, 07 Jul 2025 01:05:32 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66e8c26sm650083566b.25.2025.07.07.01.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 01:05:31 -0700 (PDT)
Message-ID: <96af5f63-dbaf-4177-95e2-a6cc24019dc0@tuxon.dev>
Date: Mon, 7 Jul 2025 11:05:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] PCI: rzg3s-host: Add PCIe driver for Renesas
 RZ/G3S SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <aGtsM22QYqekuiQA@shikoro>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <aGtsM22QYqekuiQA@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_010534_718319_8B270EF5 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

Hi, Wolfram,

On 07.07.2025 09:41, Wolfram Sang wrote:
> 
>> Please provide your feedback.
> 
> What is this based on? I tried v6.16-rc4 and renesas-driver/master. Or
> is there a branch I could pull?
> 

This is based on next-20250703. I pushed it here, as well:
https://github.com/claudiubeznea/linux/commits/claudiu/rzg3s/pcie-v3/


Thank you for looking into this,
Claudiu

