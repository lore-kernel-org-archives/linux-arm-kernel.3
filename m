Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC491E7FDF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 22:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGqAdrVHnFu6PnnaHfHKQoFDoCwgyHq7ziHIdTjOCQs=; b=JUWcCpswxe5gvF3XIi4N5QHV7l
	PdnsMIDIqQpJD4FhHNEkOYsmATqDgyIhMK0boYCO8hcTyBzKnnair/buJiNEo0AM3Ia4BJPIzNJ2h
	vcyIiq7+Wj7TkcqwBAYs7uqVIsgPG3Ef2CQY83vTdU861umWL0bQZrAmRWY2NoxAtzQHc/Xxefoa9
	//xOiBGnfG1TV3CyLxA6X6UyuV7htZASRCBoAgBOVEnAsvP9c0FAHYW0essyZeoxljdPHfLSXgRwE
	sEVMCe/wFkQz2O0nzdnVbNypQe8oHQoVyOwcC+6u+p/6MQpCnD0tbML4KlwhaQo3/gb3aeyEDllSL
	ZCIHs5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn2fw-00000005it0-3MiA;
	Mon, 02 Feb 2026 22:45:44 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn2ft-00000005is8-0gmp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 22:45:42 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-482f454be5bso1657005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 14:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770072339; x=1770677139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGqAdrVHnFu6PnnaHfHKQoFDoCwgyHq7ziHIdTjOCQs=;
        b=fLTRpG3XuGS3BescqRhZBLLNh0qNjkib9YpOolmuzt7qVop9y7Yw4v9W60nQGYMBJp
         uHtDQrLWD0IpvG1sobCOJaLkyojqGT8pQGnxXxNonNzSGWRPvEW0A54RVNYSYFUvC0Gp
         bEwRIpbhgtYHbJR1gazobZiEQ/syatzcGC0dbJzpnirdRJewVw37DGZXiGppgybDiM76
         W5aHXZIrqzfjV8fuVby/r4i1m/F9lbcjHXG/pwLf1hnFyyq58kPb2m3XuuJ8xEK5y7ss
         A6sJhiBYzvp7S9ffggdPnomBnsxqo++eEAZ0Bd1sVErG7Qjp7Rqo2w9Kt31gaL8TdOSL
         NOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770072339; x=1770677139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JGqAdrVHnFu6PnnaHfHKQoFDoCwgyHq7ziHIdTjOCQs=;
        b=X0qXP5UWTmOUFe5H/2vYuA7TGxXpsWAWl4N6g4+EUcwOhOR+PFu8KoB2wcLZCQKLzH
         GdEn+m+suBodqmivMlnSQN2ShNKxT9cjdMmg7g7U/nL6shE22Zgzf18h56URB9jjEZsk
         Zhi5Tp5Sen/k/mo4dyECsmOxP1Gqz2KY0RVhuYHLOa7VmnG1ahCfJ915FqBkT+Ss8tJk
         wiozS15jvGATILSormF6emtsB0QHQxTSDvE5dUL7CTKr5fxAoNz/zpFEggD5V+tbyFtF
         58cSR5ZJN2kubl/ytm9WvU8pEisdEXT9x6ezUzrwmIBzlNoiqmk2GyZLEVLWMGu3vakZ
         NICg==
X-Forwarded-Encrypted: i=1; AJvYcCUrUuEmASrrg4Kd7aiesgYV7pYtUYQIeV3SKIIPiMUT5kXcD718Vz7DwSmmWzQhPni74cyENBo4019xkg6J5Ikf@lists.infradead.org
X-Gm-Message-State: AOJu0YzAP1/wCO/C7Q3qdQXTIphvy4Y1kO1vhNY+2U4j9/2OgDossQdo
	0T44lOX5aJ/KVYesQV+CqLH8UIQ0QFequvRDrDKTZMxSSf7MYIRxVlj4
X-Gm-Gg: AZuq6aInLBqmuypCh6MhtQRiQvr0qod8EWT5BIWrEbcsvLim1fZFJF667el8NYwiVIF
	PqU/iyLJpMk0217CKzHHgMxhWBM5Bu84TOdHYpRvCkrgtQT1i8UM3J34Kxfoy/T7n7o+UKNMqF6
	ZGQXRFch0cm2SShLSUd/6AinQLm96c81rAOaM0rAztY52DWFNBFhDWZdLzfgLEJEbj1T/tMBtVI
	YBhPBroWHPtkYncGPUdiaxNfpgzIgVtW6DBTrN1dX9H8IkJpiAdQSvj6R+mxf9KIXIEQktN9egt
	8pEBIEW8wzg/jIJfdRg08aU/5N44LA8P/NdO9ny+AiSlheWWvAwlCs9j17IxFM0klvvnKL5Wf15
	hkmzVpZOPoBQNwPcXMLAjTQ2OH8TmEzifE4G9oTC+EbOojJSK9YmLnuNN05j1SliAT8riIHtEHY
	KLiEVaXKWMPKQp/vtzKUzIngjnuJA8g3Gkcer5MGW6KMNkIIhfb1Mv
X-Received: by 2002:a05:600c:6303:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4830513aed8mr18382505e9.8.1770072338747;
        Mon, 02 Feb 2026 14:45:38 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e2973d57sm100080575e9.18.2026.02.02.14.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 14:45:38 -0800 (PST)
Date: Mon, 2 Feb 2026 22:45:37 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Arnd Bergmann"
 <arnd@kernel.org>, "Detlev Casanova" <detlev.casanova@collabora.com>,
 "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 "Nathan Chancellor" <nathan@kernel.org>, "Hans Verkuil"
 <hverkuil+cisco@kernel.org>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] media: rkvdec: reduce excessive stack usage in
 assemble_hw_pps()
Message-ID: <20260202224537.16c16e13@pumpkin>
In-Reply-To: <070cebc8-3cab-4f32-a203-9456506dfcc5@app.fastmail.com>
References: <20260202094804.1231706-1-arnd@kernel.org>
	<16baade123f563ea92e6117bf78c56e8617daf14.camel@collabora.com>
	<3b89635f-1c1c-4e4e-b0a9-2bbd0f21bc90@app.fastmail.com>
	<da9f044152383cacd50989b025fdce08a654bbe3.camel@collabora.com>
	<070cebc8-3cab-4f32-a203-9456506dfcc5@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_144541_232483_D7F8211C 
X-CRM114-Status: GOOD (  13.60  )
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

On Mon, 02 Feb 2026 16:59:05 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

...
>  - Since most of the fields are exactly 6 bits offset from a word
>    boundary, you can try assembling all the  *_field_order_cnt*
>    fields in an array first that has all the bits in the correct
>    order, but then shift the entire array six bits.

How are they being written to the hardware?
It would be very unusual for hardware not to have things 'reasonably aligned'.
This makes me think that the data buffer is actually being 'bit-bashed'
down some serial data interface.
In which case the simple solution is to give the function that writes
the data a 'bit offset' for the first word.

And to re-iterate C bit-fields are completely non portable and entirely
inappropriate for mapping onto device registers.
You can use C structures (arranged with everything on its natural
boundary so there are no holes) with members declared with the correct
endianness.
Indeed that is actually preferable to using numeric constants as the
offsets are tied to the correct structure.

	David

> 
>       Arnd
> 


