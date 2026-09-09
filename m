Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EF1C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvH1LN5nROju0SUpXayMHEhowOFfOFw00A7tsFfYyCc=; b=2AOxpIJwpxpDgt+QBq+V6K95Fi
	NoFgiobHZCPvdpoBDW3XXV44Dzp3mcRsfklZLIzVb0ZGvnIJAlT5iNu90qnQqVpA7j+1eru+mU1s7
	c+jNShIgXE34pPmXoB44hT5Mq0MR/0iZ2uTMemtGoGzjCi6b2hRka+9H0MIqvjsPPKEtuPMqRiqnL
	QhiXVVimaJRvq2XTmDW6KVoOak0jjfFVBkDt3OmcX8wxDeg46b+6uJ6/4UCx2aV4NiRKMYa3Ut+r5
	KO0uWzxlors7wFiFWb1XSuJUHp8exl+wh/GTNHtY/Ar/NtdZuEQkqnmSg5j/XiNRFAsEJNGRyXcXU
	RhYcDx/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K80-0000000C8Rw-3Uly;
	Wed, 09 Sep 2026 15:22:24 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K7w-0000000C8Nn-22H7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:22:23 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-746d77537f8so3571819137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 08:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967339; x=1789572139;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OvH1LN5nROju0SUpXayMHEhowOFfOFw00A7tsFfYyCc=;
        b=D2RFSO6oDmTvHC1gXPOhwC7hJEPfYD3YpKkBXriKhhPc7GsLO8kKTiWXcLxhulBSDB
         9T3NvPyZk6QXHJ4Jd/S4tF8BD63MQZpH7I8oHu4GZOf1jwUJPaOrb5aUG8/+w4VJyrAD
         VFG6/7ZIp4JaLNPEa4w579wW2yL9ubWiKqWFQHCBPIxvjnBCVvyxTr/3NJSj5EZGDTRO
         5IJD2C6UuP+0AzX4dzRU52HyX7H5qG9ZD2ULXd08Rt7gdLhwei/ByWUU6oGZ3v3RN9mj
         muL15x0z5aYJVw8NiPOePX2hXsz/volfm5OCzSh3WFQVu/8kEwM4q1FJPpNnurQ/tNyv
         XyBQ==
X-Gm-Message-State: AFuF++laXer/ytd+DjZPkdsnFQANi9T/gOAUmLlFqsZyQn8rf8+2KvQD
	Nhb8FzXeNsBxXV3F/3lcZaUyNHMPedhUuqxXhGvqaVoi39uQNSy0itB2zcJ1ZxirerY=
X-Gm-Gg: AYBFou34X8IaYRn5xbemS83dG5sATlinAwahTGVkZzwLe+yCOrBFepEFBg6sv1FZMp/
	HcSd468V8Y8kiTmsNawC8LRBFyD7UtpCEHgsC9JU1zqvu2X/rveQThF00O9lUaCWmI6K3K3PFUd
	t4SD2S0rbUzVgW3MJ/hlh/PkZDt62HIYyIxKuPAA1AOlNapzfi2Fz7r6pl/q4eEkMkfUGbZertZ
	FjZF2xPdyqWjANJ8HykA0+lVZGMnMb1C6wfEsOR2NMuVRoA5pxWH9UKXNEQwBt0rfpVrpxcHgS3
	pIAy49KW+gsQirQ4FEZClGBaM+9vuU7Hdl2BF7d03OsK1sisw6S8/vAoY+TS4oX9sKEZGHFhN4l
	fp727Zt82Rowfobx3csTgbu+KaNnQSVujgsfNcl8HAMsQ4KHilh6wwHqSmKaJPzNPjAD/u7OpDI
	VF8Ar816GgHB4wuQVziXxLeOsSuAr+Xqa6XNVYKhJGrhEyTFxL0wXSdlqpRUDTuko4BbeRhcrE3
	HK6T7AAY2ZvNqcZH8Plj1Q6jLxv08e/a2xD
X-Received: by 2002:a05:6102:f9b:b0:786:8a7:92e3 with SMTP id ada2fe7eead31-78a4a72db1emr18892620137.2.1788967339248;
        Wed, 09 Sep 2026 08:22:19 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47ae8dd2sm11521630137.8.2026.09.09.08.22.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:22:18 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-98089686ee7so3457629241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 08:22:18 -0700 (PDT)
X-Received: by 2002:a05:6122:8b11:b0:5c7:a844:493 with SMTP id
 71dfb90a1353d-5c7ed2f89e5mr22804170e0c.0.1788967336434; Wed, 09 Sep 2026
 08:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260909151341.28322-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260909151341.28322-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:22:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsr_ahkeEZ=MB5KWCUZ+moSgkuJ2_5mZXy58QE+Oq61w@mail.gmail.com>
X-Gm-Features: AcwNN1WgFr7t4mTZJlE0GkQEVjTvX4ia6Ekcpvx97Yyry4KwbnrUZ-lG4127I-8
Message-ID: <CAMuHMdVsr_ahkeEZ=MB5KWCUZ+moSgkuJ2_5mZXy58QE+Oq61w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Align MSIOF1 PFC node
 name with label
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_082220_524294_A9F5B4F3 
X-CRM114-Status: GOOD (  16.94  )
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

On Wed, 9 Sept 2026 at 17:13, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Align MSIOF1 PFC node name with label to improve consistency.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

