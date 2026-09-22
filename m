Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21736C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 00:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=; b=QqjKT5r0wKrLUuEVU8m2eS3H10
	bFys+xVWsLNyeUPMG0v3hkfuZNdfpcM3ptOy09wLu7Too6UJo+0tftacTmCK3iBR3TRf8QyfgUo2U
	NL7qaHQ/Y0f/g4Xjs6B7wgT26gZFygJ7hzUvN2+mcGIc2xlr5V7Kg4VMd9oZ22L417qTXnPCeAIN/
	h2jGZn2o9U6gSMtJGcr7U5FWBgF+5MdF0EMf8YvSrKUg9xIO3WOyGO/2jp0HBGr0UTtDhDPqcyutK
	tK7v+vf4QflT4WDrR6WKrtqvEGVUANMMdrH6YXaabqBD9CXXE44JN51MCW2pkUeulW4UrGXi1CLv9
	wBnwP7eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8o2N-00000003kq3-2gey;
	Tue, 22 Sep 2026 00:07:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8o2B-00000003knI-39jO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 00:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=; b=nqHSCC8xQYQmejDM1mVjrMph/M
	Y7wFtzPAqAAMAH0zhZtVF/8DvRf2qDkAews+9w/bkH94P1bLub99cGAVO7JBcZ35d3CrdO+j6aPMr
	mMBeR2xGyhhp5fl2NzhYOH0MezTSWB4SFztTq7lOPdS5PP7qh9zIHoFh54BdxoRi9tlopKUVbsoPQ
	G60SGj5d2L2XBT3AHllTz7cWECqQBExAgGiKd8ihPz1eGCKQqQFIX8XO2we8vGDYK24PccBbzSu/w
	HLZ6/1kWQS5/EX9t2mFP2yMojPmg34dvhJwSAzNYzAR8Id5ajnU32tJhj3dA5B8oqjwO3oFpC9jYj
	yk0oDo6g==;
Received: from mail-oa2-x11.google.com ([2607:f8b0:4864:30::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8o28-0000000Cw0d-2uy7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 00:06:54 +0000
Received: by mail-oa2-x11.google.com with SMTP id 586e51a60fabf-466ccdd7695so1244122fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 17:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035611; x=1790640411; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=;
        b=Dzg7sRCV2hF031Hvk8WvSppv0MNF4+Ir7QphwhWF4fL2M5bWh+pq6Uiqw/f54d6BcD
         isEGFDj+zP/27Ki4F9+nhYu1dRXCrgBhzisrNzi2in82EWrnM93g9UlJofC4Ak9JfvbH
         FEOwFKZrL88Qvi+4GZw1CB+9QFdEKQqwsM8QFZkdCqCmP63RI/+IA7pQyHATVog8mB1L
         HSvMBlsb47kzX/nnenHpFhjiXYYvZGcP7q/6EXqyALXPQ1Ss2dApWQi+OzIz/ulZ1Mih
         SOvr6HB0+aRpBC69GgTBMOPS/B7vEfsV6OFbmxj+TJyZrsBZKSgLWokdwZRDNT9FHBaZ
         66zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035611; x=1790640411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=;
        b=rPsyf3y8t4JW26L+/4RtEzQawCF2LSxWuR2Zsqt0+mzf9t9m7/F+X9D+sz2xRHnEQs
         xekNM2vi2NpC1Kf119dLWb+zfBUVq0zQmdxszUbkgOgr7jvLwGFFfdhXahHrtTqiWObQ
         I4mwGbc8SZa5ma4xgBIPfA74sCdUH7tgnnjUvmCk5M4jJ8Aegtq7wLA1WGy31AFDllUO
         BoTVuOt2l8WeyOHBGLii18PeA8KBl7/0FwmRKQavJcfHBCiQMT0mSJege0TIkUvNM4+0
         mG5XSir5G/f7q/8NHbQxmOn6fS3B9lN3l5DaYb4t08qpL9nDGG46zbBRJfipBfLAuDns
         oNPg==
X-Forwarded-Encrypted: i=1; AKwUvBwdy3VvoRHTq3cgXFuuQ7842z0MyocoM1aBtObpGGUsO2plEIl0fk6dQrH6D+N7ckiT1SVXsIXNfKyi595149VC@lists.infradead.org
X-Gm-Message-State: AFuF++lIJQfFUgNGy+td2Iv0xScD2GMlqK+RO7+ivWhc0oNquTtEKBZx
	C/YkbHkzDqA2sV93VruXD721tKNszz6cn+Yg/iW5+T0zzUtWsY4amRwU
X-Gm-Gg: AYBFou0h5DWN7ivEKNtsN6pJwkYA1OySNxbBSkV2TCq760sy4Qy1UDKkTwSJSyNQ3wr
	CUa3dYr0KWzHFQIMXHDTQ9LKAOixYFJIRSncycXm5DZKL3DECSjBAWp2P5/6ZrV81XQ6uutMnJW
	atdrkNrBEuHXvwmmN82bbyc2fzyiJlANZ8VnCE3EAEismKjC6to7tq5d1mKyaG8G+VlOEe+pbiK
	azpO+zY2fA6rjpoKx1QkU63RbltGwFYZ+8qZze75Yw5vBR2DtbOf66E63U4XMNgVsmqBdu7D9aT
	tcdR2RSpN11JY5HAdxbvfECuWfKwSqEibKVI0N5fVzDmGCP9tM4m6b/PPd4zp3jIIGelW0cvpZI
	qSSskw0tlm8tag7mx15J+EZvsbQUK6c4knQ/58S40z4l8gHmq+snahzqauHZ+UFwzvcHROe6b8H
	YGOnVPH/aYkJYzNLGGIXzM9r7G3pPF/aYjjmr50IqXIbGXvxFrH7mzk/i8wPgf3VPXEUY5BcF8F
	vYKUvkrpMUrvPexO9NlpvVXGoQd8KLeZp5ojBt5ijtMiMMzMwbQ3ixVDxbeXLzBhkXHsdQFng1i
	Bixmr0ZSBYO/ny+R1bzJQb82kAwi3piX9ru4jDIGosXWr14KWbCycJbepjHucBHh3cVqmJjq319
	3g8EdkfYVrmnoTl60vu9O
X-Received: by 2002:a05:6870:e24a:b0:483:d19f:334b with SMTP id 586e51a60fabf-486e6eeddb5mr12235098fac.24.1790035610897;
        Mon, 21 Sep 2026 17:06:50 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48f7280cf14sm801683fac.13.2026.09.21.17.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:06:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:06:34 -0600
Subject: [PATCH v9 5/5] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-h616-pwm-v8-v9-5-37bec6201ff5@gmail.com>
References: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
In-Reply-To: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-clk@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_010653_051056_85E62141 
X-CRM114-Status: GOOD (  10.78  )
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

From: Richard Genoud <richard.genoud@bootlin.com>

Add myself as maintainer of Allwinner SUN8I PWM driver.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..d9713b1044c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -918,6 +918,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 F:	drivers/hwspinlock/sun6i_hwspinlock.c
 
+ALLWINNER SUN8I PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun8i.c
+
 ALLWINNER THERMAL DRIVER
 M:	Vasily Khoruzhick <anarsoul@gmail.com>
 M:	Yangtao Li <tiny.windzz@gmail.com>

-- 
2.53.0


