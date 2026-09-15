Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CB4C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 01:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4Jx0gqCqlP6JSyM7YNUSbMymSXVv7Wb6Hva9YnJeBQ=; b=bwO8pj8Y56BkHb/0WTStup0030
	7a2sV99j/47AyALJQeF8EhrRfNOmlbwp7KlgZiCc+vbDabrHlunT/j7NYTyHm2kHhFcnpjo7fUksm
	Rv7imKR6ExUJNE0wQuMBdy5Vz2BnDwLqgfNEphVAjsNd/7uWWsBhe4aMVePA/69pQqeNhZ4mFnC83
	eDADIZS2DZmgIAAkCsyuJ/7u1WIuyPixbiDihgntLgrQH/nnKbCn/GimryxiCC+Y+cHdRZG0GI9iD
	F7QtenBajn4TpbcdilFbEkv/GjMyULmu8ggm5DD/DenhFjyYywNo6p/Yj/VoMNnzSLgL2lUHc4MQh
	KeqXIvHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6IMC-00000004zPx-20W3;
	Tue, 15 Sep 2026 01:53:12 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6IMA-00000004zPU-3Hzl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 01:53:11 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-7981646dcd1so726820137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 18:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437189; x=1790041989; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U4Jx0gqCqlP6JSyM7YNUSbMymSXVv7Wb6Hva9YnJeBQ=;
        b=i3jCLKTStJtGq5C3f0NwWcr1nuN65NX+pl6lmjlSXchkOuUX6RFRYX3H0zf587pLzM
         pjVk/AphKCUcCb+Go/ykP3uF7GF+ng/a2+LIvzkOEp0BaY0YVubb1ZoIinEOo87Ioya0
         pEObsytAyWxJaRmOGfxi47nozGTQL0rwpD3VHNRdzvh2NZcIE2RmKzasqz7DXPLgYmRh
         CdzVJPmkSE3j9klj5tZGKYwbZk1ScENbtnVkeTPRmU6aK0gOyGgpuc7BGbRuvpQ84HHG
         8axHCMgZ9id24DPRHdaNb7U/D11+1+JrTCW4uPue4Sm9JKRvl7avKUc5aQsArN4USTfV
         BBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437189; x=1790041989;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4Jx0gqCqlP6JSyM7YNUSbMymSXVv7Wb6Hva9YnJeBQ=;
        b=Yd0CLQRPtlgy/AMHUGKhMWxdUxAv14iSb6dsPF/+1iVicsCVbzC+DJIuVFV5xuZTA2
         t7x3P/EFey45gOuYc0u9d5SwAzEG1TUFilssNCGDHvN9zV2xDMNB2Xv3esSMo0QQqaF3
         FBbTI9v9bSQqXeNj5AeTxI27DkAEPENPRVEboHxBe2PasTKgHTBD79ASS7u1Yw1ZbK1A
         xnZYhe2M5bSks3TA8U6drQgGtj+gqW8iAwf9gN7Bp6AI3n6MyRpxAdEKI79jkyvxYKfF
         SNvYiqs5sTWJ9b9KmOPnl1sX1rwUSbVxD6OiUrxRKEUBtm2gV3U0+E++67XZ63FQClMp
         nN0Q==
X-Forwarded-Encrypted: i=1; AKwUvByHaqeRpZQvhWJSgiepOAdnR0x5s5qEbqGxFVOJ5QmLlwp5OWEC945irOU9NzT+wmQv/uRSZQnIztQBHT/PYMaA@lists.infradead.org
X-Gm-Message-State: AFuF++lXSBiAlcR5O2N5GxMgO0zIg4mGnemafaI5UJFBjp8kIArIFGB6
	gWSprYKg6I+DBzQifkHpqv/k2xWin9eJ1QFoJ7396LlZbUALhE1IOqET
X-Gm-Gg: AYBFou05RYAS7xUcbNK1dm3uredm9//3yJrHxk2rknhdF27TVoJo8pH8xTIj+JlAuWU
	9NdTWzNp7UuL6Lz6yFyLOOcGIBusWCbvWY8hRsMUNsJuh26wZpNmqhtHSkqW4C2rCfme365z68A
	yiAieexU0cpUizhIH0sTXeOaf61XemeSCSM/uVuVyaq8+qWZAMtGbx4iBV6ez+pS3lvo+vXUe/5
	QxxFvfKiHQcI3cxW8rHlKxX8EB3lFjayS1xaA0iVHFIdmGFT3jM2dQaUEmx9WnZCofxVXClgoOe
	8GI2NMJWmCKneWs+zF2mc8uL3Ws1iLev21LWj5LFZBeYHgcUkm3jxfZKb3q5cdpydgJTDcw6TAw
	/NKez71/Bx7H5uFOmJ128t26dvwyJfEDvmJQVB68AXXmExegV7DVTQRolna+73iZOMnegnbDKue
	Sih+SV9xkIsG+bvPJ83rDym619pKcx4iwp8jx+rV46qhU9J9qHN0UJadaYrJh4G5WHwEM/dI+Gg
	vL4/w==
X-Received: by 2002:a05:6102:3a0f:b0:79d:63bb:249b with SMTP id ada2fe7eead31-79d63bb25fbmr1122940137.13.1789437188656;
        Mon, 14 Sep 2026 18:53:08 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982b9fac504sm13361055241.8.2026.09.14.18.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:53:07 -0700 (PDT)
Date: Mon, 14 Sep 2026 22:54:07 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] iio: adc: bcm_iproc_adc: convert to devm-managed
 APIs
Message-ID: <aqilP8FSTmrLpqEQ@debian-BULLSEYE-live-builder-AMD64>
References: <20260908172359.30003-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908172359.30003-1-mdshahid03@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_185310_825981_BAEB6234 
X-CRM114-Status: GOOD (  10.21  )
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

On 09/08, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> Changes in v4:
> - Move the ADC enable error-path cleanup simplification into the
>   clock conversion patch.
> - Simplify the ADC devm cleanup action.
> - Restore the blank line after the copyright header.
> 

For the whole series,
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

