Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BCAC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 11:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkLj3L4dQlpMsdIQhF3lEl4OZRGB90PZA1PEkLCsjsA=; b=OTE5QxdWS18JdGdpOuTXTbMHKx
	z8Ylemf3xXnEJggjNlKJOGBJeWc38t2rah7stlcuv2WrXQpzjh8jtkmPX0Fpzz9t81Em+j9cpvnJq
	SH/YUb7OHOUwcqPWJk7TZxkGo7AxSkgCFxiurFwo4X63+vK9iAx6sFTz0H59+g/IRAiLka1sweE16
	Czg9jQK3fe3veEPL+KFsExAkoWP+QQ8qnVzg+w3jEKE3zT/PtNM8RIGIoCK1sqmFUku3dDQFkxCmP
	IdNeFSEQYFT9uwLcAwJjjJKpLE+s2IPNkn5xGzTnhN/tJSep1t+Wxwx8SQcku5bx1/AhF65vsNpIn
	QLRdPFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlRWy-00000005Nqu-27Ej;
	Fri, 21 Feb 2025 11:49:20 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlRQf-00000005Mcy-47op;
	Fri, 21 Feb 2025 11:42:51 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abbdc4a0b5aso379087566b.0;
        Fri, 21 Feb 2025 03:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740138168; x=1740742968; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkLj3L4dQlpMsdIQhF3lEl4OZRGB90PZA1PEkLCsjsA=;
        b=eks3Ubs87rsq8aP6At2b2YaGR712kzZBqBjW7zYGCLZDiGOADYo4TxuiuQPnq6X7Oc
         biddRsLqMzz7HemL+CyVrX3EL82LWGZtn9zXkNdYbWikDYl7EHi7hu+xuyf71GOI8gYo
         44yODTWsA/TRHMEmwQJGhJeNWQnYPYQyZGBLVSshLYjKfY3lmShQygrxWiYMnc2S06Cd
         VdVEKeucxvlmyel+KGKsNtDqu8T0IHxXEJzrmUg8Ti0u5JxBy6n+Yc7ay0pKirTN7oV9
         TiTGkawmVhejg0i1hobnzYqM93vS+xnAXoClz87pixyLrIgnnBaJEmRM15EELhNCALVv
         Dl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740138168; x=1740742968;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkLj3L4dQlpMsdIQhF3lEl4OZRGB90PZA1PEkLCsjsA=;
        b=n4Ni9uWopcht8GOYXC4f5D+WqxdLy6bmeqRbhxPI4h7q8RzXIsQhN5QwfJ/VnQHO+e
         4PgDrcozwaRjLsZ5P4KuiXyO1UAoNxTUJfMpVcoeXQ2ICaHrvbp2KduZ/DDrWClzFSsI
         U73OLnvQrSFTard+nD45mFKvuAMgi8zOY/wZtHIekq00BgwnGq6F1sQwl3ZAbn6Z07AF
         6H2bA4uGRI1cXb4W89zwEmp39SxSkWpBHQjEg4y5GJh1rsGCrwmWP8YqU0Rf5FZ0pdbT
         BVfzwqWbfBuzMIf58JNTV5TSJ6PF6vh6WT95jNKo/p9YGM8F6CpeKjED/L9ExtWDsrTD
         C77g==
X-Forwarded-Encrypted: i=1; AJvYcCU2Ll8eheXUU+eGEmbO00r9hGAM9hk7wPvZxHS2ohDKw1nAFx3ftoZ5SLSBMJLsp0O6APPveyQFjTz8mOfPmbg=@lists.infradead.org, AJvYcCVjCDBCnjwx2Rw0aD3LWQdDe3i9WoSnFQKPoS8z+xAlWChxUyejzI3T8XurmFOa0H42V9eb9t3RDwI7C9pmVT1E@lists.infradead.org
X-Gm-Message-State: AOJu0YwY8lN99+vTSWbEccOyS8bjtFIpX5tk8z5Uo5ulRFgQUHTtzbEr
	ZpxknpJG1DZ9E3zPUbYERRFUN2btKGcXuQSHiRZljOW6cBIFmgOj
X-Gm-Gg: ASbGncuNb5GhtsAvJgme/igvsbnZMt81SmR5fvIJxcQz/0jDUe/Ky9kiGbOAV4EiCt/
	s+b68y6xnC/t34Xe9j5DZa3MN2zYcKm/TqpUyuT74NiVFdNqG7I7cWIa8qtUaZcNeTaljnmatfu
	mydL9PhflU/EwiCwHFwEPBUp5ZstbnYYGCiKlk5O/DCw5VWgemRWP/CJQB6cOIHz98SwuIKGaje
	CE37yh4TKihuLv2poD8WUpc1YwbCaUCXj2JYlgan4sej747MS8/JfBp+fHsULLDZyCwtHsYYd3v
	zMwh+NB7Dl3hJN16PefkurgfycJmlJTjzVwHoBniq1hUJBqbNVoDteWewMDKJn1IvOJ3aMjUQ22
	SGs6zvdo=
X-Google-Smtp-Source: AGHT+IGqnd85Z6uUbc80gi8ICKJ1IHVsX+dg/Mm+5UiTzJwBP7TGxu1s6WSYqAFeYjWEnu0FlWu8JQ==
X-Received: by 2002:a17:907:7e8e:b0:abb:b411:5e02 with SMTP id a640c23a62f3a-abc0aea5253mr285729366b.18.1740138167711;
        Fri, 21 Feb 2025 03:42:47 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbad879b26sm789563166b.44.2025.02.21.03.42.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Feb 2025 03:42:47 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v7 0/3] Add HDMI audio on the rk3588 SoC
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <BA73C4A1-C680-4748-9CE1-4B3B19A14261@gmail.com>
Date: Fri, 21 Feb 2025 12:42:31 +0100
Cc: linux-kernel@vger.kernel.org,
 Algea Cao <algea.cao@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org,
 Niklas Cassel <cassel@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 kernel@collabora.com,
 David Airlie <airlied@gmail.com>,
 Dragan Simic <dsimic@manjaro.org>,
 Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 FUKAUMI Naoki <naoki@radxa.com>,
 devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Jonker <jbx6244@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5E535D58-AEFF-45A4-A1EA-1FA282F366AE@gmail.com>
References: <20250217215641.372723-1-detlev.casanova@collabora.com>
 <B8EF5196-55FB-44EC-B93C-E327C791225B@gmail.com> <2357838.ElGaqSPkdT@earth>
 <BA73C4A1-C680-4748-9CE1-4B3B19A14261@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_034250_018182_D1B3485A 
X-CRM114-Status: UNSURE (   6.48  )
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


Small data point: on rock5b switching in dts analog audio: from =
audio-graph-card to simple-audio-card (so dts is: =
https://gist.github.com/warpme/349b27e49bc6f617ef1041047e75adab ) makes =
kernel oops go away with analog audio still working=E2=80=A6

so maybe issue is in audio-graph-card code (or its dts fragments)?



