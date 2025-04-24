Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7BFC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OFUtc6E14wdV65P9yIfONJCg9qWhxxWMsqL7KKETGU=; b=Ei3tqN7wtWk1C7DebOxbf6QEgq
	sOsUaH60XzPVj+vPJ/kV+F7B3NDaur2J25zwCiAPtPBPAZPzg00tf3v7HrxJE+XZsYB++sa8xULiH
	9ykr2nLAHuijgCbZvmnsqNdTEXdAM1KhzT9AiZ0Qb8lCv5V1taN6sgqhUHr0UHfKVUogIQLVz5LlS
	XdWkKFOWYDrOTNJnfPVNA6P+euG+2OpHa9TWIEENAhT2HUmUOib2Wfj2iHPsZ4D/73Uu2Eq1m18hU
	dDvALZaeV/hCfcHBzSMG4AyKejPhyNiz4+nyZ/DExlgQ9USOWDdvzY8kOCzcfZz1SD/slQ+J//pdf
	/dkgu4nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tNo-0000000Db7G-3xjd;
	Thu, 24 Apr 2025 10:00:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7svI-0000000DVeG-1cOO
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 09:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/OFUtc6E14wdV65P9yIfONJCg9qWhxxWMsqL7KKETGU=; b=Cl+0Gu0ccsyRZr7wZ4LP1wPp6r
	pRYX5BXbeVyWgwz6bf6UcofTHplHQPu3gbxwwIZT/tLNIkjyrGjLeynG2JL15xKWBTWRG99YJNkJJ
	eO4FVKc8+reCaLF4WsFW0QTU6hGe6bkKo+hLuRRxzwven7eU8LCW+5eAcEn4fsT1IePZnNSyMLy+t
	5bUoIJIMEe3P9R1jzJlT0M/dfQiUXwOTdbwuQWNJ34GtGWt3twmJsdt5UfyIGi4sSBa6j14MSmk5Q
	MCZ2mng1aVUGUTCEcs/qtvi+WUDwdW/NIAzUTHoME9B9BVqrEEoDQXplJYlWsrSHrvBLR2BXOH4Vc
	m7GrAyZA==;
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7svF-0000000Bg4N-09Ki
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 09:31:11 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so929561e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 02:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745487066; x=1746091866; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OFUtc6E14wdV65P9yIfONJCg9qWhxxWMsqL7KKETGU=;
        b=kiIH2qsMlG8xSc2iNitn1BeukaB+zvtluXA8a+omX9INtLwMKo0HaaDeYP0xdLwH3i
         MwjKAkAZI/eD85ptI1Uv5qUfi80zJHgkkMHLybjvLaWEfG8LPHtIbj3w9axFaIKYyAky
         NY6OOFytmt7qE1qZa4wFpBqY1/H6+VGwt3xPbXizChmQtbFjI56qtEx1hqnFeTPVYFk/
         8HBAgHZ1lcH1wNqhXqEeoFaJEQUMoyABuhZ5LE99cG3j5b9l/z5E28Msx5yz1iiZY3n+
         3iw5H1tXr5ONCqdrDnxKtcktlY/RwLoSgBY8SGLN+1jmu5KSAMojyaMYiZ5VLB9u1fGy
         ESCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487066; x=1746091866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OFUtc6E14wdV65P9yIfONJCg9qWhxxWMsqL7KKETGU=;
        b=bebDQwSu7maqQUjeJYRMvokH+dM6MLlGuhtWcT/9cXWS6Q7lVGaCZi6ggut81CQI0B
         /MdbPUbGeSnmELNdTMnWrl20qQuf3ZcLrRfTXFGVJ0wpFw1+L8ThRj904XEdMI9oEed+
         FLxqJ+ZKw9LhszT8JlGIILvHZuJ1IwAoeyD/79Y5v33LkwU5/1hINXZFYJSw+77JR1Om
         LFFfMZAZOdpPPSU5G5NEjwZktagEWKvQNCmG8NHiKjDzg4nJyfri4UNAX7npOdUafl4G
         aNPV6cmAPPnTWd0I6eiYjWq3LsTscePaPdMeZRwUaYuej3ZQ88GC6zeCxol8VocPBk5P
         s+5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDog8HFXi0WMs1NfaGqYIWCCmygYN4zAkTTMnbU4W8fjRt1LHaLq3g/a4HQ4qtf8pi80YigG1ykbQyImLKqQV/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp2DYXBKhLApiSjtBO4ayiXiTG8kK6GtaZjvALgqhlM82QNlHN
	cgWuJIJInNPHiZX1pzejVDqSBK0XsqTu9DQCN0no3O9w9ODFteJd/5KkaXMQRlL4GXQie0jFC0t
	3MDjeNle7TrwQ3xHN5uVqcrT9epdZLXALmJ0HHg==
X-Gm-Gg: ASbGncv+Qroy6H2SN8zbUBFgSoorLHCyFwaAbLydbzzBKIlYaCgX07DJqL8UEjye/UZ
	ezYMC5j028VC+MGoW4cOo4NBrVTahpbuPC4t+8gNY0qb+2V3gAWPJpxfl28/17ge8OXZB+TBzN9
	kBIl6VGcXFCLVxmJKlWakVxV6uXjd7KgQdsgpnjZ3WDMoAfr4y5IAVug==
X-Google-Smtp-Source: AGHT+IHsrcwDupy17KAeauM93eCNYxhglhW02BiNTpc5bBXPbxtFIaFqSommlAPszsE+qNtEV18lQUWNZqxLQ8RBYlo=
X-Received: by 2002:a05:6512:2249:b0:545:2953:1667 with SMTP id
 2adb3069b0e04-54e7c3f2750mr606356e87.13.1745487066171; Thu, 24 Apr 2025
 02:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-0-f3fde2e529d8@collabora.com>
 <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-1-f3fde2e529d8@collabora.com>
In-Reply-To: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-1-f3fde2e529d8@collabora.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 11:30:54 +0200
X-Gm-Features: ATxdqUEmwhcixS5po8qzLJ1UaZ3b5-0QLF1L8tULREqHXKqmqmDdo2m_9ncmEOo
Message-ID: <CAMRc=MfgfZnQ4SarQGqNXF_f+rOQgiS49AHFKAKCtHTmStxZrw@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] net: ethernet: mtk-star-emac: fix spinlock
 recursion issues on rx/tx poll
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Biao Huang <biao.huang@mediatek.com>, Yinghua Pan <ot_yinghua.pan@mediatek.com>, 
	kernel@collabora.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103109_360017_2D148480 
X-CRM114-Status: UNSURE (   8.35  )
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

On Thu, Apr 24, 2025 at 10:40=E2=80=AFAM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> Use spin_lock_irqsave and spin_unlock_irqrestore instead of spin_lock
> and spin_unlock in mtk_star_emac driver to avoid spinlock recursion
> occurrence that can happen when enabling the DMA interrupts again in
> rx/tx poll.
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

