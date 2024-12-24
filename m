Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE81E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 15:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUthszcY7WUoYLW/EhDuHucO4Lic/IF30bEB9ypkHzU=; b=M8iYRGZECCtC29uMGwFjiGaSKJ
	GSgVdO6n7eHiWxlrsP/m0QMah0vLc53HV2jxTvFPckDcZwquPTQwdCVciQcxl/DawiBx01DzIXq+R
	jx+c6PnUeif9vERR39v3p0C8QUZ4//vufeSFAzA6Mq0ZSnbO8YXbIabmKylwczYH8tyt5vU/evQXo
	TuLfeWjS1RF3gS6mDWRLq9VnW9rb1oaaPydGy2URvZsIv4yjmf4kFwoi79ombSHWiVeLrhIyNzZNa
	SGMXe5p8BJydAWXGa5dBU7xNDDMJ3L1dvlj7US7h4AgdyO9ow3QHlN5MRxyENmjK59ATzRMwb2d73
	kB4rqFpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ76i-0000000CEra-48LG;
	Tue, 24 Dec 2024 15:46:04 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ75X-0000000CEie-13V4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 15:44:52 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e3a1cfeb711so4049121276.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 07:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735055089; x=1735659889; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IUthszcY7WUoYLW/EhDuHucO4Lic/IF30bEB9ypkHzU=;
        b=NVze5hdMv9jf/f5h1UYDgw0qAinwYp+lLT+V7GvDy0AKvL7fpeEsdL7PD4vcWyGwX5
         JQTNmVIPsvJJBfPVhBSNydMhEMH8my0g6w1XGhFpx6YyiVZerTXZHwcdQRrg5NjxM8UJ
         USIQ9VR2FWxhE4xjDHCMDekdoHJYU2wxVE4U6uee/bUO5WxJwIGY5kVRAC0GhkH2SXyB
         q1/clbIsXRBtWsCb192oVTboZ8YgGVjo8Kqq66CaGqvgRIJX7l0+QTk3hfLcU2b662Qw
         0w/lmA0d8eC7iswIQ/QkmnZtibgGkRodGWzxYxGxgvqMACkOdRgTM7CrPS2BLx7saw7v
         /AWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735055089; x=1735659889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUthszcY7WUoYLW/EhDuHucO4Lic/IF30bEB9ypkHzU=;
        b=BIvzvl8H3+KUTiNyYTmMdI/a+IJsfTc/1VxSYRsb4XZ3vnABvxLijYFgQ/FXwEZX/3
         VymTOA4z1Gn4wXGkxelnWvbb5F1UIuEvKmfuQ916t89BWv14vZlL9yxM1IvGUcP7E76y
         VVulB3dMPh+63FiraA2Wf8/LBSxOvup1EMyTDSmQiUHWCtvBWfGUn/Ja9/p0ps6LTbSz
         AuLmH7cMxBeNrqlM8Osz8Dyf+95vRlX7+9N2yrSfy6PJ6B4s4Da3raOpoi6pNE+fWC/b
         k8FvSr2uNrxGhJkwRJ3BbUi5xmntTtGFlAQXhvIcn+lfNbKnEM7+Df7Li3wWzFSWjPfd
         8Hvg==
X-Forwarded-Encrypted: i=1; AJvYcCWqtpCx2n1FlozcPQsUQ627Apy1bA0xKX89bo3dAflM7p5b8/3+FxYRiaU0rLFhBYJ+kf/ScXz1JW+nE5zbCWpo@lists.infradead.org
X-Gm-Message-State: AOJu0YzVJN80eihqGD2AXaa4A78ILAvu1L8EDTHvanE2IjtMMVuBsXY/
	ad04Aa/yCbPi3WOy6/fNKtA3OFU91JCYygUDPLYLadA8zvnbzKON0efRUQjz
X-Gm-Gg: ASbGncsZHT393YslWm+07loA4SPGnE23BjPMfwg3x2ZRkgYWo1siqNNwKbFIO5pvT63
	OpLU+C1VmUgjbOYsehdyK6RTEaYZvowWKj5SF6yTpRxngIPIbO1r9sLT6GStA3Ya0cZ/IN3ZHUU
	rwNVEGKk2ZNHT3L7kfxxrueMHOaiwCc5BjwXcfloOOdb3zdY404GtYrJ/cpekTpFjO86zk+XhC7
	s3zWkacYdi5sbhQwLLCXmVETWqUyHlcf4ZCMJej26ClQmk=
X-Google-Smtp-Source: AGHT+IGS01EhQzLkGSG5QTs8kVJO38w9bONzDU7GkpYvQ0IQiouZvmnxnTA/0j1IS6e2jMjLsjqvdA==
X-Received: by 2002:a05:690c:4d01:b0:6ef:529e:6049 with SMTP id 00721157ae682-6f3f80d5c86mr110219607b3.4.1735055089247;
        Tue, 24 Dec 2024 07:44:49 -0800 (PST)
Received: from halaneyt14s.local ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e7836ee2sm28920277b3.98.2024.12.24.07.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 07:44:48 -0800 (PST)
Date: Tue, 24 Dec 2024 09:44:46 -0600
From: Andrew Halaney <ajhalaney@gmail.com>
To: Enric Balletbo i Serra <eballetb@redhat.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Halaney <ahalaney@redhat.com>, Udit Kumar <u-kumar1@ti.com>, Beleswar Padhi <b-padhi@ti.com>
Subject: Re: [PATCH v4 0/2] arm64: dts: ti: k3-j784s4: Mark tps659413
Message-ID: <bamrgf5yiksx6rgxljgw5r3y4nkno2el7qigynynubehullurd@q2xptf5wndcx>
References: <20241113-b4-j784s4-tps6594-bootph-v4-0-102ddaa1bdc6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113-b4-j784s4-tps6594-bootph-v4-0-102ddaa1bdc6@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_074451_309057_D560D3DD 
X-CRM114-Status: GOOD (  10.23  )
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

On Wed, Nov 13, 2024 at 10:15:15AM +0100, Enric Balletbo i Serra wrote:
> This series marks tps659413's regulators as bootph-all in order for
> the nodes (and parent nodes) to be accessible during MCU's u-boot SPL.
> 

Merry xmas eve, going through my queue and thought
this could use a gentle ping :)

Seems to apply fine on next still and it would be
nice to land the associated u-boot changes eventually
to get the watchdog working!

