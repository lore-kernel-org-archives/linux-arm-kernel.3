Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B63C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cDRNp7sN30u47HZEONtfi3hMQ/gOuKGJhHadwqE0Vk=; b=ryAu3v7XNPLldCsJjZFA+hnpPX
	lelDiQLH3AP+H8+GEP3SUzL7kzdDL7xCKInzJ1Pan+HjrDSRnL1t4IL1kPiVoP25/oGgvWgm2tQAO
	+4rUnyIzXrxxukOIqOrhHB8A1DmEJeUPnd9f2e3kBicnCoKsiBiOQPbr2wL36UPKHr+oOv9syi7H2
	R7cxwKdZtdvTA5tdm0GLwdlPLXO7T/lsJRGBPWTLE3dB7Cv43vNDYkl6Tj8Dj35vSexxu8dKlrQtk
	1FQ1Gur2J8ZczDznm2r97akQOpVHvA+oh+pM++xMVYKX8ARFaNbnteymXl157wBDTo2YAet+fkyKz
	1F6k3ARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VTz-0000000E3MS-2Umt;
	Fri, 18 Sep 2026 10:06:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VTv-0000000E3IQ-366l
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 10:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1cDRNp7sN30u47HZEONtfi3hMQ/gOuKGJhHadwqE0Vk=; b=L4h6ET8T0tg+jBHS3KnXcgWnZw
	ajDigLsHziAvX5Mezz/CsyhpyR5rt23w4rfHGA6hTOm9sB6XqIe8EajKo189XntIFf6vd9vYu3tB8
	gsdNX++8LDPCKG3JwBAOilaIZF8nInBjGRCQZiJsHXPE105hV13l3YDb+IWbS05YA6GUtsXhDNkXe
	TDAPKzHuv7QEBFFiXL3vmHnEGgUKMAIBK4qfs9m76mHNCpEMrUrJJIkxbRheS5EBFMeT+eLBggxxN
	0Byv48tUShougiJ7GnmY6iCOgA69sqmdmEJr+YtxWl/EEcsl/01qRKVy5zoLShFSVt8TQEpYXTMUf
	EMGN5WNQ==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7VTs-00000009twu-41WW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 10:06:10 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485843116d2so63000f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 03:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789725967; x=1790330767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1cDRNp7sN30u47HZEONtfi3hMQ/gOuKGJhHadwqE0Vk=;
        b=hb2kcvoZ29mLn0tHbcXAyAWl4k9XStvMq66XVBxmNiZ1ovykSTkf3l0RL+kjSZcNey
         wNThaU/kNfSQ08MQRaYseirv9HuzqyNDNTZ1szPcEF0PVBGij8489On9IetUPSFtwC/S
         /woKjG6vw+HAK0jbONg/jS85gISFYNBGMy6JAuTDgT4403ccdxALw/ZRHEeWj+J+cYL1
         YfhzEGCK6R9aXNoDEBL1LHhT66h1rfjuO88sAWWVeg07k0NcVzpgjvtYnjwMBF3FFdwU
         IYzZPr1665sV3Aiuq5rG8lUts7ZSTMPHsWgA54IkGvZKfQyR+YJUyV0gybLSBOt9+Rjr
         i7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725967; x=1790330767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1cDRNp7sN30u47HZEONtfi3hMQ/gOuKGJhHadwqE0Vk=;
        b=IFIL1mL/YFrJfzKePnirN3+WkE5LyQnaHK9qmueQysj34B9iCX9vzfcsVChTE4BYCT
         ANBhAmH+U+ggAQGWjeMEg7L2/AYWL8mxrqrBYGZgweD9LVIhvWwOkiE6WtsWriiWha4K
         3A2TPYKvNtrCOUkja6PEEbiH2j0FXd1eOPlZtE+vZKWpGhogHCxUFpJbxcXzMjxAQLNT
         J7i6dbJ5SYztON56H3b3npTWC2hxvs6RSSiQkKP9X4AXKtjn56vu0IK4qai11Tw5z+Kn
         cBAjcRZM9Fyu8bP0Z9gcXRORV5aCHnqmsX2PxzX4p3XtTBfkymEOf8ZGQj+H8t2VR0nK
         zMew==
X-Forwarded-Encrypted: i=1; AKwUvBx5DY9eUPrFn4py46/fzlKOSe1KE6bCG0YHYPaDDGP5PaZDLr3EqtJvpGG8SZRX5BRssO/59BguhITS+NI7x+FP@lists.infradead.org
X-Gm-Message-State: AFuF++mjamP5GcUEDgTfJXUJRbC1s51BWJxH02XWxbwwOYjj52X//v3E
	AxrAUsk180C2/V4WaYyAT41JxxMY5/kz7FOcf7NUj1vzazuDwbUoxwoI
X-Gm-Gg: AYBFou3w8AJuNirwS6TYdT6NmeL3s9I/+uf31x+siCyeF27vs1Xg6LZtNxNYPnEC2bF
	qhDDb/9NVOx6We4bJbpU7NzQSANtEpT0XpefRCDPLUwLAd1/BR+iPMibvl5xuGi0N9ZDydEo/tf
	51CuU6HcDxvvcdWuBwoVecWHu9J+WE2FliNKJVehawfDrTDVG9cYlhayg0p59R5rsYQBe3syQht
	dJq8V3NJgfKDSb6gFg2E1dFclrXu3rK87IdpHyGU+52LygeqFaMm5RLScn0ENp4OcvZ3++m7tYF
	a+N89VBWaf22N8XQIGOboP7Yyej+33PzQfO/DbHDgDJFrzKQSZNw/dQTSbHxHCWTxoRB2h7F0tX
	OqLHBrhmd90gx4Z7TZ2f5cjzPmilEMwbCQNjG+/d4qIQemDqn/9+lI0+Q2oaPo38Dh2xuHBkV0n
	kjaOeWIU+s5/m6qLJ/AYSbtfZM0beWsLWncaKXXdsvBj36WLDLotKvwIdf6TT7lc8jg2FOzRfM9
	9Wizsp0oqaccleXKbJBB9Me+d83ZgsyNA1GMHUj9NTkcGKJ/dJlirnjGgvCp8ffjHu4JZk+r08n
	uaSpLGC5Vcwyp4g=
X-Received: by 2002:a05:600c:83cd:b0:49e:6806:5712 with SMTP id 5b1f17b1804b1-49fc7ddb90emr15837745e9.2.1789725967027;
        Fri, 18 Sep 2026 03:06:07 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B829B006E521A2A508563A3.dsl.pool.telekom.hu. [2001:4c4e:1b82:9b00:6e52:1a2a:5085:63a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3a8easm2922671f8f.9.2026.09.18.03.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:06:06 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] accel/rocket: DVFS for the RK3588 NPU
Date: Fri, 18 Sep 2026 12:05:43 +0200
Message-ID: <20260918100543.23974-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904130858.27803-1-royalnet026@gmail.com>
References: <20260904130858.27803-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_110609_083154_36923FD1 
X-CRM114-Status: UNSURE (   7.52  )
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

Hi Tomeu,

A gentle ping on this series, two weeks on.

Conor acked 2/7, and Nicolas's review of 3/7 means a v2 is due.
Sashiko could not apply the series, for the reason you gave Jiaxing
on 31 August: its prerequisite, the slot-search fix (link below),
is not part of it. With that fix first, the series still applies to
today's drm-misc-next without conflicts (git am only, no build).

I can send v2 with the fix bundled in, so Sashiko can review it,
or wait for your comments first, whichever you prefer.

An LLM helped me draft this mail.

Thanks,
Igor

https://lore.kernel.org/r/20260904125936.26234-1-royalnet026@gmail.com

