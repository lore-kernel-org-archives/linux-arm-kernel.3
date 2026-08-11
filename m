Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF680C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 21:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4po5zk0dS52Bck5CruHj3lVNTqtL7/vSqh7qaAgXQo=; b=Z/7G/CUoNFfo81i/7zK9uA1pHR
	ciY8lK+t+AvC73PTKjgxVLzfMHdbmDbkqdoYujEqxDMzf9fEps5dxe+GlsDw4E1MsTeSgA+pXLz5J
	ipd22kwZaxmerzSzYaz9akQqRR1Vc52LY1rhkjDJePRQ7HRoojKuaU2c2kyuGmRFxz3hmNfA/Yw5v
	WLp8uQGQx38+MxOgA9usoSxEWFsQvg2iKxWd3pTVwBVMfFbxDH0gRx8c4LiT39YmMbbsLE2rolMfv
	VjEmS1iaDqCaSDmbT2zIBZqRKy7bfkzvY4l48h2u2EiTV3qukI/WUT4OZzOSBQk3gYUywAa0tJnbR
	XzgWrJQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtuOs-0000000F0sW-3N1r;
	Tue, 11 Aug 2026 21:52:46 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtuOq-0000000F0s7-1yOE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 21:52:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4954b3c5cbeso294295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 14:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786485162; x=1787089962; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u4po5zk0dS52Bck5CruHj3lVNTqtL7/vSqh7qaAgXQo=;
        b=bRXv3NIZuPoOn9saUxuXJWCeUN6aQw+Fr9BzyTrCHcAQJyQDwM1b/F3EO+SXOhPCUE
         0xNhwSULA1VE1PW12UpWuWIWXbEJANYXqFkCu6xz3m0ju3ipgHY69xc8wR+O+xZ2vd88
         JajH1CdJKDTOqQjYN7LykNGYcwGVlc3Q7uCyXrGy2c5tkDdCBLs30kxwXHSOQA8K2FER
         fgfhSB7p1UYmV49VyLSZ9gwMfk5x69I4G3Xw/d6sqZ0QpUlUKugbfD4YOoUqFYqBD6rI
         9ALmY/YJ34/M/Yx77wfJmuyqHOTVqdDQryykge0z+OwYc8pNSWLc3CpfS/ArYDM/Q291
         jwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786485162; x=1787089962;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u4po5zk0dS52Bck5CruHj3lVNTqtL7/vSqh7qaAgXQo=;
        b=YzZwwSuNeYAz2oVZAv/5lEgWig+8HsMfgqISsZPhCzX7f5OsKqim5CySLaVa1yB1LX
         FhsBaD/8D9uFf3QLZ4iJtIP4gJWs1H0Gphl4ogqZf0z/bfCWj4xI3WKUYcQYaHeuYRte
         Hn9z5EzaSoWIZjUmDPwAwvDv9n4cl2cQX/WWlLx2o4EgdKXsjuhrVZZ1tikwXynl/G86
         Tp1CnHjnVBV/ZCZoxBDmtu04isfXNaeDqEtruW90K36aawHslWMlndWOG2yPUeutEWB0
         dHjSlTPHnZpUH0c+j85YA1BpGh1/+Zl/sdnNF3/SNkXOIJEFXp5ctgGi0jXDeFQYLiQP
         2FEg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6mAkdNRLph4w6nSilNpVzbLqaDPtMXmyXbB24MU/RtoCq7gxbH8sPAkPB6t4bEvN9biSwERwoYSHmaUPy6Xk5@lists.infradead.org
X-Gm-Message-State: AOJu0YxIdRZ6u5CWI2tzYKR/ZFEqt6eIS4jCf7HiLqGXbOARTLh0V9qi
	cdZ1n8qTIduzdZD0/HwWUMuF5OTJZ3NNWRSd3bz9WIIaiu6yS1IPKWIX
X-Gm-Gg: AR+sD12kasAMxJ5uGNtCNU9FDF+CsEOgFYqVEwMOdUCDoWjZlRgbzy7EnB7oSpsFYFy
	r3mUJzo5qAr4eEY26krjhBoA16yS1RBDzePkyizHoECPNWtFPLWzm6Yp51qOih9dP8QdB12blDD
	J+nBJSs0Yu6YuUClWi3kUJPc7RfAOs1GL4T6BAQPH6d9sgwDrhPEjJJ9LvJE/7bH126dNiyjKHg
	3ul3G7asmOwKKiQdL9/mlnrVOxirC35lvEINK8mqmERjlc4sGA+aMohAK6JiCm8KWgLIDgcsl7+
	PfSPGX6GQTTYwsaSOuKgiAvcA15UK9CBksMlnOg20lRZkLne2pNNqoKsbdASj7ijBY59HqmSrWn
	VzdFWZDXVltnd3wNe96Hi8mC0A/lMLTSFRciRZykJ7nCG2awIkAkxJDBnlD93mM9FXccgu6D/qm
	eyFBAEuT39g1UdzJQCRUGbc/v0dXmiWGuRTTdNRF2HlHgzgbNK
X-Received: by 2002:a05:600c:c8d:b0:495:7561:a9cc with SMTP id 5b1f17b1804b1-4997c16802amr1408805e9.4.1786485162596;
        Tue, 11 Aug 2026 14:52:42 -0700 (PDT)
Received: from skbuf ([86.127.220.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997abf94c1sm19437485e9.14.2026.08.11.14.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:52:41 -0700 (PDT)
Date: Wed, 12 Aug 2026 00:52:39 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>, netdev@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Semih Baskan <strst.gs@gmail.com>
Subject: Re: [PATCH V2 net 1/2] b53: deal with Northstar devices using CPU
 port 5 or 7
Message-ID: <20260811215239.jogh366edojjo3mi@skbuf>
References: <20260811193658.14304-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260811193658.14304-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_145244_528669_C47F05EF 
X-CRM114-Status: GOOD (  15.17  )
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

On Tue, Aug 11, 2026 at 09:36:57PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Northstar devices have 3 CPU ports. Ports 5 and 7 may be used but have
> their limitations. Warn user when CPU port 8 isn't used and add EAP
> setup workaround to avoid non-functional standalone ports.
> 
> Fixes: 4227ea91e265 ("net: dsa: b53: prevent standalone from trying to forward to other ports")
> Cc: Semih Baskan <strst.gs@gmail.com>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> Tested-by: Semih Baskan <strst.gs@gmail.com>
> ---
> V2: Print warning on switch setup instead of on actual EAP mode change
> 
> I added PATCH 2/2 as requested but I'm not sure what DT maintainers will
> say about it. I'd suggest to take this fix if there are not more
> objections on net changes so regression can be fixed. I believe we can
> take more time to improve Linux dealing with switch to be more optimal.

It's a good thing you added it, it created a better perspective into
what problem you are trying to fix.

Please look into implementing a solution based on commit b79d7c14f480
("net: dsa: introduce preferred_default_local_cpu_port and use on
MT7530").

pw-bot: cr

