Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9F9C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 04:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoJ5mElxKk9yvVUb0i6F/KwQgRj0dudGNWq8IqQblk8=; b=kTQzhkVnfeT/hOFjiqQLrt8eq0
	1eoJn/OBK3Xsyut4cceSh/XmM6CSKXNKCr55czL31gJWuySpgCDTd8R7Bj7f+i8guAfsssm3h4VvM
	Xum1+jAa3CPrarzNa4zpcijPCKUAYvQkMIbx8yUd+Nax+OYX7MM86T4VLUDBVo82vhYHTRtncyL8f
	TugDKEF6gaHU9WPoohHFEQjF4Nw4GojR348oHREem3i6UKcsraxGG6AGo9jQDlaF5ptFtRHvTyBcG
	4Wkg4kkcSZyMS/1/YxHiwcFDP9TCym5Ccz+tTykuKyQupZtdwiui2fDiKSZe55KYbwVuoo+HUODNi
	dAGnApxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thhWB-00000002Sb9-0AVe;
	Tue, 11 Feb 2025 04:05:03 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thhUk-00000002SSN-3Skl;
	Tue, 11 Feb 2025 04:03:36 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5fc0c06e1deso2671553eaf.1;
        Mon, 10 Feb 2025 20:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739246613; x=1739851413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoJ5mElxKk9yvVUb0i6F/KwQgRj0dudGNWq8IqQblk8=;
        b=EJfeuO4u/O+0GyOj5JCpw1Ovp8ir3lJnXGs2DX5BeGTzobpi8etTJ5YKwyAZQYpHr1
         /PYUdVyR25CB2GZ2E08ktZFSINhxuyOxrqpzddu6ESAiySlKTe4Ak1KxggIscF6RMHrr
         kxYDikgFNMK/JWd+W8Qs5GPhgK6wCoyOA/kMsfvKPZy+ws1MlgIxv6G19JjxPq13on6e
         v9xQOj5E9jeYXe1Dl7UfU8ERNimON7qwdRsFDRC/hoOYLN4Gsj0Edy93Gt2E77AS4Y2N
         hsZH2ldsnIh1xRndhIuIpWK9RA4nezkWb3HohWxABh1jSJ6m1dkPvZnoQRF7OJSJ7OpX
         XhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739246613; x=1739851413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoJ5mElxKk9yvVUb0i6F/KwQgRj0dudGNWq8IqQblk8=;
        b=tfC4vDbR8R/3fV7o6GhEX5efVtbvzNPB4V91iJwnaXvBj5ikyB6m9BtBfd7OdBPSdI
         R2DYsN8TodvefKJieVoM9eDTHDdzFBA/ugYxjY+NS1XiFxsnioZfm5hV3m90HxA4XhD3
         Y9GtwoSUwhvNZJ6I9eTTB1SkWcbR3n0yfSxoRWusX3hA650OXvxTLKo4Wy1QfM+66uou
         liNgFk8eMELKd9QBgEjpXUGiHxjRHIcjZdzO29KRYuPnIn+7MNVl7Muv3xj7SiQnufsk
         1oKbOBnvnrbaTj7dAXFv0nyeI+RRd5NUhQLuVoAulGd6Zh5oF9ObhQFbobY7XBOygr27
         xHIg==
X-Forwarded-Encrypted: i=1; AJvYcCWoIKF0DiVR6WVoQd7nRlKsKy9aBO3D+oC3P3bBGeNQNpWDhIGsZlXgUv2xaC2TQClTLjHhpteeFiJU+eFFaDHw@lists.infradead.org, AJvYcCXQ+Kxvv/1+cMXyckuFZ5IUVo/LM7rJic5wjKyZiST+gHGcqQfgZbvnya5rvN3HDq/K5GQK7ThZqPfxUEYM0oM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCH0Re9gP9Cky+GSrfxngfeVfG1sSWuhQ1UcbHa+XP42NW1KYX
	Iw8TOEe7TxqdU7F6lHJ8I7teWwQE6Up76rLLhx4KXwNjTWw89hU9/CN6xHSn
X-Gm-Gg: ASbGncsnRo+ttfe/7TAj4SQE0bXYTL5LiJ+YI0merjW4IGvTJ15PCYRAwMNzNAz+qCg
	N74RZBu4j/6sVR2j9KyvvC7PvNGB76IgJSRVwZtHmDn9BVcZ3XpHNkBJPXcdivlxYBcJbqv6meX
	Y7Z8q1P3tjB6FETiyXgJyxzKHU8dRvYntcPzhLMMgPjB2QCRaWXxHk22K9Zdt7rW1KV2D+vSRDP
	sSmzP8Wyj0hmMK7cnTK/48IAiLUe4TiMOiFD1DUrxDJPueM6c8grZ38h80AhKFrAxvi4vQYf550
	FfRmJW7igGu6XVzxCLotRg==
X-Google-Smtp-Source: AGHT+IENrTWZ1c0wp2TPerlNKzvAOVlUwQI7xND1PGvNe4mKp3oVwD++MKmG+bBpbEQqclu2AFkjQw==
X-Received: by 2002:a05:6870:d14e:b0:29e:76c8:be2e with SMTP id 586e51a60fabf-2b8b5956561mr1541389fac.28.1739246613240;
        Mon, 10 Feb 2025 20:03:33 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:4b2:23d:64fe:f3dc])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b825ff504bsm3081397fac.26.2025.02.10.20.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 20:03:32 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: patrick@blueri.se
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: RE: [PATCH v2 2/2] arm64: dts: rockchip: add MNT Reform 2
Date: Mon, 10 Feb 2025 22:03:00 -0600
Message-ID: <20250211040300.1905-1-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <Z6p68brg5itgYdO1@windev.fritz.box>
References: <Z6p68brg5itgYdO1@windev.fritz.box>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_200334_865160_D1E74BD2 
X-CRM114-Status: UNSURE (   6.85  )
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

The RCORE looks like a carrier board for the Firefly iCore RK3588Q SoM [1].
So it would be better to restructure the DTS as a dtsi for the SoM and
a board DTS which includes the SoM dtsi.

That's similar to the structure of the Firefly ITX-RK3558J board which 
uses the rk3588-firefly-core-3588j.dtsi. [2]

[1] https://source.mnt.re/reform/mnt-reform-rk3588-som
[2] https://lore.kernel.org/linux-rockchip/20241216214152.58387-1-shimrrashai@gmail.com/#t

