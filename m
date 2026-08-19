Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A454EC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 18:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bjn5VJLDS1yXucT12O23qgB/U5aanozAOffCoTMJ1Jg=; b=ThkNJXjXYVbdAoFZbMTfDtDEue
	SwncED8BD3I7vWj/pYVpVQ1Jk0B1gY1z3ujQKz4zLAHzvD/5ss8RllDcQT9enKfZzEC3gJIuFpjNO
	xkeA92fmmg3V8GmPM7z62aNwn47b0u/tI5gayVPk8YR+lLSTGfkZt4wXyW8tLPW5on5lJgEKDmQdx
	V2GBzizbz9ZIhc5gSJyB/WwKJQr0d87EZIGHkb5+IVUZDNLPS01OlTNkugjyv5oD/+PgFDnls02bc
	YaWNcoecQpQAVnXN2pB3xIofrlOztTuJ+eDGgxJZTXvHLV4Foh9aSYyDKFViACVrUW9Xxr+AI3vxL
	/25MXl4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlLH-0000000AOq8-0YgW;
	Wed, 19 Aug 2026 18:48:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlLE-0000000AOox-38GV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 18:48:49 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4957739c22fso599705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 11:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787165327; x=1787770127; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bjn5VJLDS1yXucT12O23qgB/U5aanozAOffCoTMJ1Jg=;
        b=TLhTxBJUGLWXxxlg2GgctMfpzR3Xz1QyP0aN8sIynAaJ9wPBhmMURDWIKgPub/cM6v
         7z6M5OodQZh7ztLosw1j2gpYx+E0uDQWJulTq3+Ppzj5bPAnaBAR6aY2+TfNuPRhjxpU
         arH7jjkG38I1CwgvZn8YebpHtZmg6tm1jaxg69yys70cC1S/CxfrxFMGf78cLf3qe+OO
         N06iFYcvNio3Nz79NNLlS6Q4aqgEdBFoaB0szHby/UX59yzmntjatIq6Tq4xO77f+Rj4
         FmS5iGaqenWKkPSKHKSwlibvfE+xAsosC5iD/6rzU7WQG4KBxFkDZK2ka4/Z3Nj+tZHR
         KgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787165327; x=1787770127;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bjn5VJLDS1yXucT12O23qgB/U5aanozAOffCoTMJ1Jg=;
        b=MWRDJUAh3Om91kK+EmODBMTEb8lo7iBCTnmCn2YlgB7S85B4x63OwzMzMhhl88RhTx
         /tsfd8BBA8mz9SCjEM1SiypTtl9GMItJ7SHrVwNhGpqRoIb+T4+r2sUDMVuxFGHHdXNb
         T7pUnpbf9bxMxvm+WtaBKUOS7hF4Essg/bGvW7KPEKsAKS9BZ2w9mr9La0PqDH6oRjMZ
         o4JdTLDz58K5MiPimn1gehKUu3kBeI8gg5GbTgcPrWEqofDCTZaIasKR8EY948SYPFFM
         94VKT9ofrsNEU3EYdZcfjiOoPU03diwON4d0MvpAwuGrMwaPhCLxYPl+Pxg0jQT/S7vy
         KQhg==
X-Forwarded-Encrypted: i=1; AHgh+Rqi3nP11PiApZCbgN4mR1ZpmbgzQJ8uNJ57RKhPpoLFuTbmbZzb8c2GVfHJBWKVQRaK9/tFcMFvdVNqEXbBK2JL@lists.infradead.org
X-Gm-Message-State: AOJu0YyduBnHAK1GACZ2BSCoWzjG60/PBfUNOAUs+73y0kxDrqqWFKzd
	qlGmgZZU0mY5es6fewXjxB4KxfPjCW5CL5JvciB+jCR/oQm3sVo/RkJv
X-Gm-Gg: AR+sD11EUtKzypE9dcVgtlZls6/VlOgfoXpYDUk0E6seAcy4OJCHSIyhWWAURqc4rxH
	t1+ozcBDw+a9oDTZeY1QXD80d5jAqs/84McJEXmB4w41hYiJM9diWtiTtZ+uoGWXPnfUfT7GYBp
	1UEfOwx2GvuYHmHwwT8UrlYHLthSER92hL75SyegV+5kVMe7sK39U7VRALJp+mm9g9x6OW1TG44
	LMCSTvukybnBkoC17DhdQ/frLEGBjvKxSOpCHPFbhORq51uqYGwqAzZylfI+sGRn4t/tMkXarE0
	uCd7EM2NAzgUVR9z+wuJg1wD3zz92sbHpk05LAy5s/5XBhf5Pl4Y8LeiYh9I0U/7GkV2HuBlVF4
	5sfp+L4+eB7hEnVGIFD5LdNd6OiPMLsB2xaFRzV/ocAQZS1mr2VzQdUuhm3EWnDzXFPJiS9tmcL
	wdyPDC1V6gaOkNL+rw3QEbWeHAKvHat8+oosdI+7HZd92X+IWKkXiQHZHL3L9l4U2ZipyCfiHQZ
	WJmxbeBJNOBTsO3IGpJCtWzG4hjDIDc9j5AUN56q+EL3MhHM4LdKfvvKxQGpnce8rLn
X-Received: by 2002:a05:600c:3b84:b0:492:4a7a:e415 with SMTP id 5b1f17b1804b1-499aa1a8c0dmr80658135e9.2.1787165326812;
        Wed, 19 Aug 2026 11:48:46 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B9296006957154F80580DB7.dsl.pool.telekom.hu. [2001:4c4e:1b92:9600:6957:154f:8058:db7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm78585025e9.11.2026.08.19.11.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 11:48:46 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 08/10] accel/rocket: add RK3576 NPU (RKNN) support
Date: Wed, 19 Aug 2026 20:48:33 +0200
Message-ID: <20260819184838.6723-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819154634.7584-1-royalnet026@gmail.com>
References: <CAEWPSH7ETfw2TDjUfOvcVtDm19FC43x2vP=Lh7m+XPOGptnPWA@mail.gmail.com> <20260819105723.632029-1-gahing@gahingwoo.com> <20260819154634.7584-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_114848_798686_76BFA6C7 
X-CRM114-Status: GOOD (  13.51  )
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

Hi Jiaxing,

"Coming days" turned into "same evening" - the harness already existed,
it only needed your question. Both halves below; raw npz kept for all.

1) Forcing outputs below the zero point on RK3588.

Model built to your exact case: 1x1 conv, out_zp=128, no fused
activation, bias centered around zero so the outputs fall on both
sides of the zero point (59% of the raw reference material sits below
it at oc=56, 46% at oc=128). Open stack, mesa main (bf70ab68a21),
which ships no lift - the pre-fix state, so nothing in software can
be compensating.

  vs raw CPU reference : 56/56 and 128/128 channels within +/-1
                         (47 and 113 exact), global maxdiff 1
  vs max(cpu, zp)      : collapses (0/56 channels, maxdiff 128)
  NPU values where the raw reference is below zp: min 0 - they pass
  through freely, nothing pins at 128 (0.6-0.8% of values happen to
  equal zp, consistent with the reference)

So on RK3588 the output stage does not floor at the zero point with
L=0. The floor you demonstrated on RK3576 is real there - your
three-run experiment stands - but it is not an unconditional trait of
the family silicon. Which of your two explanations that favors for
the vendor's per-model 0x40ac values on RK3576 is yours to judge; what
it removes from the table is "unconditional in the family, so the
compensation must be hiding somewhere on every SoC". Here there is
nothing to compensate.

Reading what the vendor stack programs into A on RK3588 needs the
vendor runtime, which this bench machine does not carry - if the
below-zp result does not already settle it, I can set that up after
Aug 30 (travelling from tomorrow).

2) The remaining discriminating counts.

oc=50, 60, 90 and 114, same protocol as the 17th (raw CPU reference,
no clamped comparison, zero constant reference channels in all four):

  oc=50 : 50/50 within +/-1 (43 exact), maxdiff 1
  oc=60 : 60/60 within +/-1 (53 exact), maxdiff 1
  oc=90 : 90/90 within +/-1 (78 exact), maxdiff 1
  oc=114: 114/114 within +/-1 (98 exact), maxdiff 1

No channel pinned at the output zero point in any of them. Together
with 56/88/120 from the 17th and the earlier 20/33/40/48/72/100, the
RK3588 side of the discriminating list is now complete.

Regards,
Igor

