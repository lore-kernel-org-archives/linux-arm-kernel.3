Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9415CC6B39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 17:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJ7AwNTLGK0qJotpIP2/0w2WrkX374IVRj5Elec6DwE=; b=zxNST3iZTyC8brON9udJJAEjtL
	z1SN0TtbZS1vdB0x67jjKJ6fEZPiWk79jnOOVc7FqT10b+d1DYZ6vBP+ZBTXlIOP+TUaKUhWoPrG4
	5XfpaGl0qfb6GJCTfR+Rz88W3U1unA1EpMk69ZX6nKA1NaAOFOyH7SSQGYurmxfMrWi3KFWqD2C4p
	FesJLldDeOUC1tIYV7+jd+axzuBsOO536tdOfFiEYASaEz4B56Nxj4oY7CFPK4EC9FtfGesthBsYh
	XyBZxytbolvu7F07hH6MjB3xYZZoH7u9TE41nxokMp2CKkXMMiga0x1oubhYGZ6GiaywZDbDstOqc
	IROd5kKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPC0-00000000z5D-2nYR;
	Thu, 15 Oct 2026 17:24:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPBz-00000000z4W-0zaI
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 17:24:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QJ7AwNTLGK0qJotpIP2/0w2WrkX374IVRj5Elec6DwE=; b=WYBWMZZUgRei3WHNgN3U7pS77d
	Pc9KUvVF/HJBJexr7ZEwgwxqDBNvfgxkeUSWjdJLNZTVgb9MNWX7N6GvlvjwWcEelpYCVLIOKvbGv
	5+lmBnbhwJH6QjTKTYfAOh7rBRTOzA+c81azCAXSK5FkmcMD8QXbPeIvg3e+gxMcwjXOWlnji1Vkw
	x7Fjmfl+PMhwnaj1L8DEtzizYNBjpQ9HfY17t7+TF9wZIBLPNIEn08JpYQzhv/hxArmDxCIOYvcAm
	aP1/zgFFsxZ3sLhuqIEwHM31mHcHR2gt1NmjUFlRScah3Ofgb71Hkk0aMm8iuzd8+JZEwxhwsKGmX
	8PqzB2Ag==;
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHPBw-00000000fTF-1Jfv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 17:24:34 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-6767d92cde6so5757882d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 10:24:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792085070; cv=none;
        d=google.com; s=arc-20260327;
        b=S/FWi1dZZGx7+PkAb+MFvnbDYH2MH4UpIQIuv4HnM9SkX1CYcHyJ4NpZ4P4PZ3RmoY
         m2X5PvgSFUI8rSJgPxQxJkpFkE+AE7uQXE7F1bJxhWGe+QxJCoLkj0sAduxARUSYp9R2
         Yp1EdydklvBoty1dXJbZ1PMSRXl67YLMoCFI4sHLA5/3AqEcdJkUORpsfjgaDARekq9b
         jBaon0iEHTtAYRsE7E4YxR8POOvR6d552ZuXqxRjsH2wD2k1I/LXBlAlZZbJOuRgICG7
         8gUgGKuYXV9UbQqZ8ztMabMjjkFpkID7vc9CyDDpo07rn+r5dwOBTuXvoNJRVRWcJsgG
         oAkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QJ7AwNTLGK0qJotpIP2/0w2WrkX374IVRj5Elec6DwE=;
        fh=GYBkCsOUaxgU5wz1oK/1eLqX5UGVI0CLlRlaMPaL1zE=;
        b=g1AzEOBUnhN6hjgMPO6A1WQTKbXmmuzpjup01zGbQI/uWOdkpahKVigjNrR9fN2Ckz
         z/mkLUELAufGnHS+Pr4QXQx8QBZiGjykqfYBDJx6+ezM146e6ImiD398VsjEkxkzV6CR
         vACJcwa9LJiGM4pcOn8yimjSXJhlOxUGrsMDp5gLrhdLhSMCk52FeDNCCJZ1yrX2pTt7
         TAOP1XebI+eewHkTHAj1viTDX++pKP+lHM8inXMqGDpVDlaZKPX9PtKlpJ7OISLcmnxl
         lOl2Y1kjWQ7ddB5cIb5TNUw6rnhjFHKQ40xU8LUpiYZ3EsUhcFsCXVBwICooK4TI0Ic3
         uK1Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792085070; x=1792689870; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QJ7AwNTLGK0qJotpIP2/0w2WrkX374IVRj5Elec6DwE=;
        b=Ti7HYClGUbBNkexVgTX/6TJsIAlmBmHlkARL07hPSs0eABZnorzKqpHlzQzodyhpHf
         /RomfWsO0gidt85B5H1yxDSc6J5GuwneclFiZw4uMt5snAv26kUo6cbd+QwJNB/RwSSX
         5d1y/veij/E9M51H8HRvD5t4wCDZLlMiHFtZ9uGhf0+SP4lRfTuOXGXk82uX23oWW91f
         o77KIgm4e1xIxlPplepxMjaU4mRLVUQyTy/hxka8Uh5qu6lLX/fR5L6biAN4tFgIw/Nz
         C88vx1KLo6R4miPWoVjA4crRNOrcR+HdgQRihjBIJD44vFwJsDMtJd032kIttp7qGCSS
         5vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085070; x=1792689870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJ7AwNTLGK0qJotpIP2/0w2WrkX374IVRj5Elec6DwE=;
        b=zWSjqefNT3BxRW2XTmQsIGAzN9+1H6uKwqd13CWl1RKisXszVMfbOAoeG7ooi5xLNI
         G8znIpB7YnSlX0mt3iKxDxStX5GxQEriI27jManAgcdbRfbJ5cbJAKmZifGke48swI3M
         nWjS3OmTMAxbx8kzozPQ5QrbufCnPJrfopEXv7wG1g6RjHFs48XfwqLh4Qt4HM9y2B2k
         u8KUVbDURWQiJu5yqp1+ddUqNDCmbsozn54TYII662Z503v3gBqzZMwCw/9Yt5jEOh7F
         VM3LcyRES0jKAEqmDGYaZj73yfgwUkpiNNv0tMMIj1CtltQNzN4be3kQ+2kR6zafW5Nm
         UWcw==
X-Forwarded-Encrypted: i=1; AKwUvBwx5droqr0Alx9wmr/JYSS/gX44gHp2x+bCnzyJAitKEODiuirivxPZ4LoJY4PbfOE5V/4xqUOo0MBo/zU9Z8Wb@lists.infradead.org
X-Gm-Message-State: AFq9FYIlKwI18EdLukbJmBF4xrqbVVyI7K6wOrJRj+fULk0MtHYnCzyH
	oXqQs3DnISb+ZyjvOLBjTtrW+A0IfzHjIgvhX0RBWSLPEiEasxPyo/B+7bEAzv7uk/xbUZ7RK3h
	swxJBHTpzoZTC5HchoopS9ZzVerSnlE4=
X-Gm-Gg: AYBFou2m93ZAZwXgO+OzTy+0HEbYBTbax1IN8yDT+ZnZxpNYFJBCHkxsCIvEX2mIgq9
	EYShCjA0RJ2MYlZLL2X8mRjaYS0f1Tqz1GweRpKY4M6BcLz8QFIZaj4UBecEFJS+46kokDWPrwq
	uabbPTu2a7J1u+XkBwSA0pQaXYddcfqyGEdVNwceFo3PsXtDSiTZW+83KESGbG1T7lmciFaVRuj
	ipY0Ir28CMLdJiv9lYXhyLq5c1jqCapMP5fIrBcZgCribuUSNG02j6YdtNJ71e7D4tq4Tdo9c5f
	Ed/7ndyxaEqFCBpI4TzaS00o+hN0FFFNSf8RxI7D7ICq2o0iV0qSe489lBun6TQNDcTxCmVULP7
	hoqhbfddVYJDDP6Qzplw=
X-Received: by 2002:a05:690e:1689:b0:672:f272:f629 with SMTP id
 956f58d0204a3-6793630d90emr8360068d50.104.1792085069711; Thu, 15 Oct 2026
 10:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260923055103.949540-1-gongtao0607@gmail.com> <10d0c5a6-98d0-45d5-a196-aa839b452172@redhat.com>
In-Reply-To: <10d0c5a6-98d0-45d5-a196-aa839b452172@redhat.com>
From: Tao Gong <gongtao0607@gmail.com>
Date: Thu, 15 Oct 2026 10:24:19 -0700
X-Gm-Features: AclHuK8ES2Kd8skfs6udor0Fpl5ne5f6cGaytsMa82tMXcwNkOjHwfvDn2lGZGA
Message-ID: <CACmSHQse_McSbBfEiyvCCePp97Azb7a5c7q5rr3AdXncrcSfUg@mail.gmail.com>
Subject: Re: [PATCH net v2 0/2] net: dsa: mt7530: fix trapped frame forwarding
 and egress tagging
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, "Chester A . Unal" <chester.a.unal@arinc9.com>, 
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_182432_475216_70D3E879 
X-CRM114-Status: GOOD (  19.81  )
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

Sorry, I overlooked the existing fix, commit 4cb3cd670b2a ("net: dsa:
mt7530: untag VLAN-aware bridge PVID"). I saw the issue on real
hardware (AN7581) running a 6.18 stable kernel, which doesn't have
that commit. After picking it up, the issue is gone and neither patch
is needed. Please drop this series.

On Tue, Sep 29, 2026 at 2:08=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 9/23/26 07:51, Tao Gong wrote:
> > This series resolves two issues in the MT7530 DSA switch driver prevent=
ing
> > trapped link-local control frames (such as STP BPDUs) from reaching the=
 CPU
> > host when bridge VLAN filtering is enabled:
> >
> > 1. Commit 3ac85bcfd404 ("net: dsa: mt7530: preserve VLAN tags on trappe=
d
> >     link-local frames") set MT7530_VLAN_EG_DISABLED to preserve VLAN ta=
gs,
> >     but in hardware this disables the per-packet override and causes
> >     trapped frames to follow the CPU port's active VLAN table (VAWD2) r=
ule.
> >     When bridge VLAN filtering is active, the CPU port is in stack mode=
,
> >     causing incoming untagged BPDUs (01:80:C2:00:00:00) to be egressed =
with
> >     a VLAN tag, which userspace STP daemons (such as ustpd) and the ker=
nel
> >     bridge drop. MT7530_VLAN_EG_CONSISTENT correctly preserves wire sta=
te
> >     (untagged frames stay untagged, tagged frames stay tagged).
> >
> > 2. On Airoha EN7581 and AN7583 switch IP, setting MT7531_CFC (0x04)
> >     CPU_PMAP alone is insufficient; the switch MAC forwarding control
> >     (MT753X_MFC, 0x10) must also have CPU_EN and CPU_PORT configured fo=
r
> >     trapped frames to exit to the CPU conduit.
> It's unclear to me if you are observing the issue with real H/W or if the
> patches comes from LLMs or static analysis. Please clarify such info
> in the next iteration.
>
> Also clashiko feedback looks relevant, please have a look. You should
> address LLM's feedback proactively.
>
> /P
>


--=20
~Tao

