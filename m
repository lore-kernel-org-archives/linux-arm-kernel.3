Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07999CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 08:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2LWVlEbO4mtlO7zkAsTCCHDAZ0eNseSbBPcM0qvM7c=; b=2HlWbeyn+ayY5Y/Gp2NfCCQSSS
	hlvcwHq1diYFl8tahCG7c1Dzyl1ugyE1hqM6kxN5yhsUaiLqnfCHK6dOH3CZvEg+Keva0hjI/ltR4
	CcMe4EJZiFSUgMja9xkgjHKqhxS+3s5UWF9ealr/sgMTivEmThs3+2EtM9l0q+geqrZ+BeI7nHnv8
	YuRMv97BeZz+9lzVZEAY2xRkmfjSSicpMxltcYaYqMeeBNxqD3AZh0lZCa5g5Oa/21iHJeXjzKoUh
	vqRUt6QDFLt0+hDqR/i7S2Lw+A2xB9cgAZGXQTQaNH2jGP9RTXyS7gxI1PdgIXqvB2fCIEFUjAccY
	RJlxsggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEN6R-00000001xiY-2h2n;
	Wed, 07 Oct 2026 08:34:19 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEN6O-00000001xhq-3zvI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 08:34:18 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48c4649b35bso3787871f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 01:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791362055; x=1791966855; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2LWVlEbO4mtlO7zkAsTCCHDAZ0eNseSbBPcM0qvM7c=;
        b=JeaEDWOdo8M++NX7JD0la9Q/+zBHTcT0/qo6q24YufNTtcPu9uzsHNKNeH353D8kdS
         LnFSRkGAtyU5HNsF0h68lx76cKDhLYwhmcJWPszO1yzaD+9YYNwalTdjSGwU6uOTj8N9
         TrN/Kn3O2vsL4ENSgkwvpI+/Fk+aksGG4+9vwkc3yasqNesy2A9GbMNCVh15OVkjG5WD
         rfqIINV3Q/q6sSWo3jui18rY2gqz1bEmsPdjgFMi2aG0FbAir4+2hYcNwkjBkFpt5wNL
         2RUTbNwrkVTY6yVSBUL2yMEsy0UPjKRy05X/baA6Nq+jCurbNsrzgJCRA4qnbgddu2P8
         f+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362055; x=1791966855;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k2LWVlEbO4mtlO7zkAsTCCHDAZ0eNseSbBPcM0qvM7c=;
        b=j1SJ2eUFwPkd/nWflhCRuS0VI+3IJIA3y0umwxBZ5+ApYaBCy2Px3t6VJCo/WOTmK9
         b2A7/5j/SCiNIOMP0xRjCppWHmRKwkuGyQ8Fpm+Ctb2NiZmqtJjl8Q3uYOW4sQUZM6q4
         YLeB4z/9fZysixgvWhNqCFig0pCBK/qzLN6mOU0sCoB/38SSOQsxEZIReC+HR4cBn6LS
         CIfIBmt8tKu0LPwGTplk9e+HbBIUkV0VDDiZhqvUi4Y26pLAP5X15QGZ3aO1onrZcWZl
         eCU6BsPRLGR9Y1FRZXY7LLaDkNRLQudJV1+azSu/+M9Sx7I2//3Lq8G0a17QZjx1HbWc
         s7WQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2JR2kERVEW076mPejp+LsHrtdheKeZSIy0kzYFqdwM5H4wqj1kXjf1llmv3Mo9uoTTfKps/tlB1jg5qjOxxPb@lists.infradead.org
X-Gm-Message-State: AFuF++mm6K2z+6SEs+AL9dacyDxpRJNXc9JINyCduDHsb8+gxtW4y40G
	dV5hVsaWJR0oKTQ6pVSlOV20bYLfGbeXc8BOi+MfDMyFvDzvnJTN/HOqwWajRlSJVtg=
X-Gm-Gg: AYBFou3PU0qYSHRojZJZcwG0voNeoDPzhIgh30S3QYfwAUChuEr69aX+4Yr0Y+peI3T
	fc4IArZYI5CNaXCRu/87ctIq05l3LWb7QlaxvD8dNBaA6beo4dPFw8xpF/Nx3NbTe8KAUg929Nu
	MsiwVKgr70j4utuT+XZTARnUpdM5OYoKLWcBVRqUw5CrYpsnp6lMvFA/Alv02TvVnUbrVEAoOPn
	QcoVtTbAmhVmRdryy2BPC39d6luJEMAEVCt75HjV0cynZN6Ukz0eGzRTWOVbXUzX7ycDAG/KKTy
	RlsDaPm3RKxqOT2PtErROuTM9wTU86y7IqyhB8t1sAJGq2vkz21vLtylZZMqRhMr+Xp8plLVIQb
	69uOvA2zAex/8AB3sbnGHvsdEHQV06tLtjOYtvhlX2R+9YOIuZco6O1INA1SqhPfEN61WRl6QdV
	zvooTGIYdeqcFBTzbHLMfBHfQ/5K/VfKBChACkFJAqpfgfj01tfOxM4cCZYXg3YO535vdgVXV1/
	3cBo6iLtzSLqUSMnQSM28i3DA==
X-Received: by 2002:a05:600c:5254:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a180679d9dmr19886705e9.33.1791362055220;
        Wed, 07 Oct 2026 01:34:15 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm79454375e9.2.2026.10.07.01.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:34:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 2/7] ASoC: meson: build gx-formatter as a separate
 module
In-Reply-To: <20261001-audin-v4-2-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-2-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:34:14 +0200
Message-ID: <1j8q49zz7d.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_013417_091987_AAE8FA32 
X-CRM114-Status: UNSURE (   8.80  )
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

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> Instead of including it in 'snd-soc-meson-aiu', create a separate module
> for it. This way it can be independently selected by either AIU or the
> (upcoming) AUDIN.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

