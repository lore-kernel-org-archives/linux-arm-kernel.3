Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5FBCD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDOXYBEUZnUtmSTyT3uL3mtKxvhVKKfeSDiOOL5ymVk=; b=aUGo9N0Zg55/K07V4jlXLYXyKF
	XxvKx0wFze7j4NZuCmBPEta5kDGtXH2CurVdRtRcmkFUbth1/UPqxjIKbD7DxBNNWU87c72gE440+
	MV+0vrkrgN1W+doziW4kF38uiPfvFEUF89x4eBH8CvsuVHzdtAk0H/R7v46KFpr0Dhi68tApw0EQk
	qwSVC+kozMo4GBsVFFrATdRwTGEM+5vONEsnR8vr8JRkKCEfSfevPEOes/JJJ1V/1gI9err0dXoKz
	FEhl0lBTqnN9P3p9v5c0PDyuYJ/dfRZplnar1bRHjqjA4OMF5QdNI1hWjCv239RK56a6P0XOjtjNc
	KwpQgvPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTqx-0000000EH53-2jPU;
	Mon, 11 May 2026 16:51:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTqv-0000000EH4L-2l41
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:51:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so41406385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778518291; x=1779123091; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sDOXYBEUZnUtmSTyT3uL3mtKxvhVKKfeSDiOOL5ymVk=;
        b=dY77o9O4hEmPQHjPssegiXOd+MtgZln76/3OvST4tmeiMLKD9KVt0mMDM5Ahk7wtU2
         3kF2eRoDnZOzi93CQK7DO/1OnXuJge8PuX6LugjmX2uI80ofSJbCOP0KXtb3hm5AEbk6
         /ieZR2H9NzE6aGyFHIIFTuyIcUa+JJjCR0pn7Sd6Z5SJHT9AWQXXn9GZQteRoAOFWUNt
         tvFNJsxxyrV6B7VGGLNIF/pVfUCvkipk32+r1eg0XOR4r+UdTtciYzvAnHGkCood66K1
         mA1ISnlZyQhtmijwLXgJ7OoWx5PiWV4FiEiPcYM0n1MEMCbaerEsNxSqKopY0jKCw+D1
         4lWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778518291; x=1779123091;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sDOXYBEUZnUtmSTyT3uL3mtKxvhVKKfeSDiOOL5ymVk=;
        b=MkM6oAw7NCKRgDa3yIUJ+sY1VaoEPtUebHKMjVUFEdO7UepfWIR5Voy9TlOW12NRHz
         O13ZKk8UiWhVxv7j6EVJ34Ou0GZU1lyFGPswzkIHDCczQbQRTGQsH+dpwFnW7SE37WDT
         nLhkvKueZlCQSgzJseus2BefoOyrwiWJiQLjxjE04Vjq5U8owrA79EDpnE1OPs8oWmqv
         8PRF9B8jdzpE3FcnAGpDOp3WnLyoTBSaZ9EORvtEmEoisKqYdmf+Nzgc2RM9oY4knPVT
         ZvymOD2HHWqMMQNL1zpX/PiSKwzfr+JAToZpCdIRWEs8cg/0QGEXnjWoZguy3c07rRq+
         2kvw==
X-Gm-Message-State: AOJu0Yymp85Oxus+4FVUOJjjv9MG3N0ZF+AF+JhReGH1X4K/uLoClyjL
	Zr2VF6kjeUYZNtX+fDlera9DcTbsLQDHtn4pQdc1eKLJPw6FGCRAFnws
X-Gm-Gg: Acq92OEYIljtXnZakFb8GajhigX4DONExBO4WdR8tbKQMBEEQvU4ddmyswXtj4ymh8/
	1YVtbjkHedWTqV6HoaaGEkczk1zScod9FaekQkDyVnkZcXTE4fvNqmc92YX1uBR7I5arECKnwtT
	MqtioRq0AqOq9jY23kdYKoUTy/ffjA5PGkBCLM92cXWQbdZpafHx+hxvRS+t0Qzfbc7HQ5hsfk2
	iBT9tGSZ1s+LGy1gEcGh8taU27HL+p+pEyYWvz8tdiKUuLckjvHByYEB2ufPwVlAkEz3ORnA3Rb
	/BnypJTcHuysgzN5hn7r7+Qg9mkOian+H75L0zFBL7O/2YAYzh2N5gPOIQyTiWIAE/9GFzuz7np
	M27cmqU4qKUwFXBcaaQLTZ0mpqVUH74JnK770V9WJkSf1G7QpzwLauVTbs+FKPK/AwGg8CLvocN
	pWsC1ledCsNNR2nHSgayHhgcuOwOD67xY3c0+Z99blIu6Fr3lsnkdTEDuXIXE=
X-Received: by 2002:a05:600c:a08b:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-48e51f4119bmr388918855e9.21.1778518291069;
        Mon, 11 May 2026 09:51:31 -0700 (PDT)
Received: from vitor-nb.Home (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e62a2desm452865e9.9.2026.05.11.09.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:51:30 -0700 (PDT)
Message-ID: <becb54adc0bea88578c8fe4c7c1b7b68bf5cc6d4.camel@gmail.com>
Subject: Re: [PATCH] pmdomain: ti_sci: add wakeup constraint to parent
 devices of wakeup source
From: Vitor Soares <ivitro@gmail.com>
To: Kendall Willis <k-willis@ti.com>, Nishanth Menon <nm@ti.com>, Tero
 Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Ulf
 Hansson <ulfh@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Dhruva Gole
 <d-gole@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	tomi.valkeinen@ideasonboard.com, sebin.francis@ti.com, devarsht@ti.com, 
	vigneshr@ti.com, vishalm@ti.com, vitor.soares@toradex.com
Date: Mon, 11 May 2026 17:51:29 +0100
In-Reply-To: <20260506-wkup-constraint-v1-1-0a4bce791b29@ti.com>
References: <20260506-wkup-constraint-v1-1-0a4bce791b29@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_095133_727882_609D1805 
X-CRM114-Status: GOOD (  10.23  )
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

Hi Kendall,

On Wed, 2026-05-06 at 22:16 -0500, Kendall Willis wrote:
> Set wakeup constraint for any device in a wakeup path. All parent devices
> of a wakeup device should not be turned off during suspend. This ensures
> the wakeup device is kept on while the system is suspended.
>=20

Thanks for the patch.

I tested it on our Verdin AM62P. As expected, suspend now fails cleanly wit=
h "-
19" when an SDIO WiFi module is registered as a wakeup source, instead of
crashing on resume:

ti-sci 44043000.system-controller: PM: failed to suspend: error -19

I did not test the IO daisy chain wakeup path, since that is out of scope f=
or
this patch.

Best regards,
Vitor Soares



