Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9907FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 11:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krEC5W4u3Zy98qJoM/+vZPkJBJL5qw1cHHHERcq1ubA=; b=T+MBm5AJstszImvGXmYzgRp2lv
	xcStyxv30nFrXQ4FQNtzJN4cVCQVlzbhejinpZxDjLiFPdF/Ycm5qGmzcKKvB2IP6y7kyYmiSoHK8
	a3+v624OZU7wJWBuXERfDvdPrFEXUn43mmMrbwDEG2KUn7DgiJzoiU8YOW1BEAk7RXxRpgujmWp0d
	/4+LzoRnwM75v/yg1kcd7PLwiTkckYYqLvsQXSrQm26GnpKSV4tybhYQLK91PjNr7QE7nPOszZZ+t
	svcWU6J4FIn2eaiiUgP4arHm+L0Ctuscp85VUwkEJEvh5dIipToy2uhmCkPq7jeX8YYLg5udRQiMs
	yNn21EFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGamZ-0000000EN3h-2HOG;
	Sat, 25 Apr 2026 11:02:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGamW-0000000EN25-0qOh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 11:02:41 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so44220815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 04:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777114958; x=1777719758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krEC5W4u3Zy98qJoM/+vZPkJBJL5qw1cHHHERcq1ubA=;
        b=jicVzObfe4/zFotZo6I7/eyPsEjbe4ecJ5wuJ4H7HjY27HsNr+2laPpd7WphQpmPQR
         91Yh//JLxRiia/Z+A3ZbyEU3mWBEF2mHHSzvBrFZiVhBYS/J8wsxXYelMPsmgeRnGzBw
         dyTBBbzKbrAPR7pMkUPPb6wwPFyHFAB5/PpEIifNXqhjN9ZACv7/EebZ4nEaRRmg8OjL
         z8cSVsGgkKDEpYGSjTmMoc+XeQ7kDg4dlCHF+R7YETFLJ+6n3Voi4pwLIqukraeV4UWk
         12NJv9WoMUAFphu3H1ZYH+lhPc/DE7K8s/LCE1lIU4wi0vGDSEoJbLwz6oLJbKZ6dArb
         U+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777114958; x=1777719758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=krEC5W4u3Zy98qJoM/+vZPkJBJL5qw1cHHHERcq1ubA=;
        b=dp16+lRW0AAgGXLrotwMYUWrM9TtcLTt59I13clhFlc+HM/oK/06J4+JC6zIgjUThV
         cDQjsKDfhSZgbZ9GkqQiPutlvOSwr9whRcejkDc1u/qlkJHRfbShf7TPzr3jm+hl54B5
         n96NPyAcIbwwni2+GDsQw6humeN1RB4QoQ4IqXWpB3q6DxbtsgRJyr0qJOnQ8ggaQ8KV
         4nDt+bbBfonUMuhAN+Dz/iGYopitS3ln1MkD/oZ4HnPs6w3cmpwrZ+cuSn2IgWx00GOG
         RHXd1+4ePjjTq9c57aQeLekG40AHQPHehTdBUIvRYex7bqziNd5I+cVMXuIO/WzfqWSw
         dtxA==
X-Forwarded-Encrypted: i=1; AFNElJ8fbkT+9QKv5vpappUVNOwny86jaITDRZGSIaprpWR4Nx7zEF8HDN6+Ym8l/Oon847ydvZvAWXb3pCCsuaZhF8O@lists.infradead.org
X-Gm-Message-State: AOJu0Yyim3CtTA1EXo0WV1uzheBgfbDgq5ydQQgUg9zYyWnjTRucnFpj
	y/vj42uuoz5lngTSEQidxS5x5e5WLk/abPyC4HD6FEt5G8bB0yPTJICt
X-Gm-Gg: AeBDietF+yN3CSFWth0OnlIS3DggJoNeAobdsi65zRhCvBetXmKTHV8I2T8Wh1IgGs+
	iXWecNeMqiB8HGvZsy7JWzDXXGW/gT8ADC/HZw72ps5eM0xpm3mLIXRqXZTWerdCCBXftUYuPUe
	BMv19GVk2mdm+CpFLw1Bd+KD8BgvnJIVxLaqqkJzzu53NPnHZoJsjELn3IJ+pJV/9iUlcO04w8p
	C7rplS/bXnJ5t1vVN9d2a5+bKzCDb+walaKw8z8y0TFGPwtkBYb0ZLtrvXZEXu23uHmsazoF0BS
	C1h5/34140hUuBMrhNt2+yRb1wQSR7GZOkaOVxdgHLwHvk+BlHJuG7JMxCELDJJnUsHATPMHItY
	igl4iJdJnn1ChsUsKaBsRrrsFSKBWYr0B0o3FrTTK1Pd9p5gce+8OY11Y0jpFgDzNo7gbDrdi6f
	0qK+iQFWKWupw/oPHaRCQmEacnh5PfD3cB+WLhA78k3IH04gUV0P1fnesWRX+0d6IV3BKLw/t8n
	bTSHN/X7cMQlA==
X-Received: by 2002:a05:600c:b96:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48a53390f6cmr295415295e9.9.1777114957837;
        Sat, 25 Apr 2026 04:02:37 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb77b001sm312125075e9.3.2026.04.25.04.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 04:02:37 -0700 (PDT)
Date: Sat, 25 Apr 2026 12:02:35 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: Ai Chao <aichao@kylinos.cn>, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 linux@armlinux.org.uk, dilinger@queued.net, adaplas@gmail.com,
 James.Bottomley@HansenPartnership.com, FlorianSchandinat@gmx.de,
 alchark@gmail.com, krzk@kernel.org, kees@kernel.org, rene@exactco.de,
 tzimmermann@suse.de, rongqianfeng@vivo.com, thorsten.blum@linux.dev,
 chelsyratnawat2001@gmail.com, soci@c64.rulez.org,
 gregkh@linuxfoundation.org, daniel@thingy.jp, linmq006@gmail.com,
 fourier.thomas@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-geode@lists.infradead.org,
 linux-parisc@vger.kernel.org
Subject: Re: [PATCH 03/35] fbdev: sisfb: Use safer strscpy() instead of
 strcpy()
Message-ID: <20260425120235.2ec10089@pumpkin>
In-Reply-To: <ccd01f97-d4b7-4bd0-92c1-adc3b1136cbc@gmx.de>
References: <20260425065926.1091168-1-aichao@kylinos.cn>
	<20260425065926.1091168-4-aichao@kylinos.cn>
	<ccd01f97-d4b7-4bd0-92c1-adc3b1136cbc@gmx.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_040240_264217_E28BFC56 
X-CRM114-Status: GOOD (  13.44  )
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

On Sat, 25 Apr 2026 10:08:08 +0200
Helge Deller <deller@gmx.de> wrote:

> Hello Ai,
...
> > -			strcpy(ivideo->myid, "SiS 730");
> > +			strscpy(ivideo->myid, "SiS 730");  
> 
> The compiler knows at build time the length of myid, and the "SIS 730" string.
> Using strscpy() has no benefit here either. Contrary, the code generated
> because of using strscpy() is probably even larger.
> Don't replace such code with strscpy().

Both should get converted to a memcpy().

If you increase the literal to be too long I'm pretty sure you'll
get a compiler warning/error from strcpy().
OTOH strscpy() is more likely to truncate the string (I'd need to
check).

So leaving it as strcpy() is fine - and possibly even better.
The header files might get changed to error strcpy() unless the compiler
knows the source string has a constant length and the destination is
big enough - but that hasn't been done yet.

	David
 


