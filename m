Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6156C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 13:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Bh+Zp7cUZNAenLGdWusNvBpvA8IMsAYVSOUkU7ta8Y=; b=N+QIh4x1LTfh+b3Kz1i7m3j3SH
	Qju3KLLcbBflrzTWypG4f60SYPr97TyWplXMUB9zUXXcZMiNhr/PHN6+N5E6anWYlzHYo4m9ULzs0
	zwmuaS4FmsbivqgN5EPWo78n9YRx8g6C7gIKN2M7aUH/AdBu5nw69gXLlEZnF6oNnlbs290a8M9Aj
	KdaCOUoNACD0nC9BCXec0hggE8D5gwPxBrzhKCow02Gj3er0MulL6BWH6KJ8btWHioLqnSL7T7pfp
	R27S0dRBENTbd1yi4UxBfTJbeJsMeGFMrmk+8ajiVzLQeHJrRANsLLk62KewY8WOoEXn1Uoy3nzt9
	6ofapgog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOcBF-00000004Chf-36m2;
	Mon, 09 Jun 2025 13:04:49 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOc8z-00000004CCK-3Eoz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 13:02:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4530921461aso10306325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 06:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749474147; x=1750078947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Bh+Zp7cUZNAenLGdWusNvBpvA8IMsAYVSOUkU7ta8Y=;
        b=mCaDYx92QwWyTBZqf/BfYcyFfTfBHcwEE/6ToRDzS96uvulVXhHdIbAIqenH00vyqU
         3CWg3mY8XExX8Uts5au+quasXEjgKzdVfmn0rtE0Pcd8rEwubuTiNe3kV//vMTD8K3EN
         gILuPEAuBE4YtypOdp25ULxMZ4Zbs2AanPpWRZLb2ygIQv7qCSc5VdZbGUaBPH81nMJa
         gqyMR3tjzICcGQYFQHLg9i+KbX2Op0YILP5bwU2WTYU6WxuFT8dUYm6zEXpdoXppBqiy
         KPsBDqm8vmzptY6rAPK9b1kQzsqISclnfC1ZwtIex8M+XecL29wZJOYdb1QtDiUR3mMI
         ++LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749474147; x=1750078947;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Bh+Zp7cUZNAenLGdWusNvBpvA8IMsAYVSOUkU7ta8Y=;
        b=SDjTRTY9l5y2rB0HZdUT9RLYaTZ6DTzAreQQUtDN+R32T2+68CepYwPXMK51Opngjs
         SXhprK2w/e+FoUfCE6FoTRd5ZXuDlkJupfxEUOiAMBHYc2b+k8WG5HzqLMit0k46AFLp
         92FvjIyM5gj+sAA01BV2dpDSop8pw8/Lp/Ds184kLlaic2sdh8FvY0cPY7VJDwud0XAY
         C72pZhJw5QRP3ub00E32rRba+GEotjOmlCN0IooVU41k7NVTFHOHszS3dhHVgSZE3mvG
         ZJlPw0J+Rux0Ufe/x5rwck+GrSweyCD16R7Hxcb/cIJYPVpr161LZeuye46HilpV7Cm7
         i9dw==
X-Forwarded-Encrypted: i=1; AJvYcCVn57IHQyuI+ExbIMLp8T+qyZd8UYXNWc2fZ+8n//aYN/OgnUEwj/0Aws4zBNFdIDWpzz6wyN2+L/TiJ6J5ZhF5@lists.infradead.org
X-Gm-Message-State: AOJu0YzHDz8ZgcAfl1Jpw+CMGiTwzk+6D1KuieR6jzatTTiGL+JpeF6j
	o2RctXTt8hLKNaCbtz1See1RcU7lGpys3N0qXtqAh+AOcx+Uw5wUoq7XqSiECPFcw3I=
X-Gm-Gg: ASbGnct9rHqeGgPrYANUzcWgkFkemVYUQz1Qls4vUsM1uoOWEjYQsICTQNygnR+/QwT
	15RPJMjG+OLNRYeK8Y6e8yL6VK7DOBH9C5kBZrOa+auA2aiOyrO3fRNFybM4OG05WBA/Fx+WgN1
	p50rrlDIRXDcJSfMTsvT30boddjzy+CQ26nakbjWtwhIn66NEfJAY6h8FvYWIIWCRrR1ionWX+a
	8aBaDjYiZKfpgi2t2efbjkRyUBnz1IN9RHIK+PXJFrC1sBDIgsQi5uQmHfy31kcH8n0wPtQFvHh
	alvJSwGlVWUAlqzVA63IUKlEEY2LnNAc3VmibWnJnc0UKwJzeYo=
X-Google-Smtp-Source: AGHT+IEC224y8+mr5qcnD9k9Q2VLvv7fn9ojcXNf/BK82QyxQgrEFMVWAZeFnV10+zDndt5WfXGhRg==
X-Received: by 2002:a05:600c:34ca:b0:453:1058:f8c1 with SMTP id 5b1f17b1804b1-4531058ffa6mr39477275e9.3.1749474147101;
        Mon, 09 Jun 2025 06:02:27 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1008:ff30:c454:e59e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-452137290b9sm110888675e9.34.2025.06.09.06.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:02:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  Ira Weiny <ira.weiny@intel.com>,  "Rafael J.
 Wysocki" <rafael@kernel.org>,  Stephen Boyd <sboyd@kernel.org>,  Arnd
 Bergmann <arnd@arndb.de>,  Danilo Krummrich <dakr@kernel.org>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
In-Reply-To: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
	(Doug Anderson's message of "Tue, 25 Feb 2025 08:04:57 -0800")
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
	<20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
	<CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 09 Jun 2025 15:02:24 +0200
Message-ID: <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_060229_810200_C8866596 
X-CRM114-Status: GOOD (  16.59  )
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

On Tue 25 Feb 2025 at 08:04, Doug Anderson <dianders@chromium.org> wrote:

> Hi,
>
> On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.=
com> wrote:
>>
>> The auxiliary device creation of this driver is simple enough to
>> use the available auxiliary device creation helper.
>>
>> Use it and remove some boilerplate code.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++-----------------------=
-------
>>  1 file changed, 7 insertions(+), 42 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll snooze this for a bunch of weeks and check back to see if this
> can be landed in drm-misc-next every once in a while. If you notice
> that drm-misc-next has the necessary patches before I do then feel
> free to poke me and I'll commit it.

Hi Doug,

FYI, this is safe to take with v6.16-rc1.
Please let know in case you prefer a resend.

>
> -Doug

--=20
Jerome

