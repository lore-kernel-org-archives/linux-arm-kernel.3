Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADC5D6AAEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 16:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQHOj/bnPK/nIDomsOi7P10E15gaCTUx4OYWYgBgufo=; b=Xz7X8BPeCrPFfyoE4XXaUCIA+v
	w7MDIt2tiGmZPhnT9eeQ7vaYZTAF7QOdwwhH00LUE/1OPyOzcv/XqLWdUz9vd1JSjS4fk+FG8dxiZ
	bCnQVfiWeR6GA45lKPx2zaM5S0olaAOMvktfgws9iTs0i5u8IlnqaWRuTBH5p2a6kD8QQU7BNm1VY
	TOKTWbPNggKW1Mri1nDV43GufoXjxeGFG5/75uf2NIil+mQvOT8yPUJdO8tgxQonW7lHi96F2BOPj
	FMUc90js/uGEodz0so3W6jUBtDQt5TacCL+XBlsWaAT4as7F8CtJVoGQWgZQQPMuT3mKI69oMSJ9U
	GDP1olVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LIu-00000000YIm-3bjY;
	Thu, 02 Apr 2026 16:54:00 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LIs-00000000YIR-0XKz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 16:53:59 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43cfbd17589so923287f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 09:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775148836; cv=none;
        d=google.com; s=arc-20240605;
        b=hgahViavGrUDszvk2Wh8cktc5NLpSBEXGL6u7x6naJIdIPWz//j+NbtYCxNp1nBWPf
         Hz47n81SsimT1THlX3IY1KeMOg1IINkEGNzM+pZn2Ub8lJdV9UmqlvVE0w3My9lgBL9m
         r0OEpJgLVH6eXvOBS/inM1Xu9B/ACec8tHJXO5/1oZmyTXIALxy1SYKNZPJg/qVXFiFF
         +2iWJ4zm9YlQOC6dlPsxOMVXMgp1chHC7mUEsfwkH3rYvJsHS+QVRkG9Wyx5pvmRQVM/
         lleduTDImLPN3r+87hK5XUrUY2KylZL/OIwc3Zo+hdJiFOvkndHy+nx6xta7Gkv9jCBB
         E32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YQHOj/bnPK/nIDomsOi7P10E15gaCTUx4OYWYgBgufo=;
        fh=ctbq0FIYrNQmnav5HT5ZEVxQjZVcw0py7Y4vGDNiqH4=;
        b=i+cg3cZ6z8ddSYinFuDIYfAVdZ6LOazbYayQuc4sUSA9XJc91b7DR/FA9fiEM9sJTr
         PqCuMMrikB7qNp+qvuJfnvOnpEv2oLOWMr5a4Krp5X99EL5eUxleEB5FqKVcSV4wGXgM
         KNORWnjkNKrlRVEwMe3YHTCJ/tjUfGgCWEtH5HVOHuD/zPhl9n0kWdQffpxfh4vbo8zG
         r4HvvCTBIMcOlGq/NKurcnRji04aerxYCRk+2MXKHV27GP1pnt3wm8gw3cYbHuXuYL4H
         rOlejN1Da7vm2cOZE/3C+8yrpl6aTnk2Cv7Ke/TmedzVqol8bQQCX5PicZXOY8stOKlz
         i8/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775148836; x=1775753636; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQHOj/bnPK/nIDomsOi7P10E15gaCTUx4OYWYgBgufo=;
        b=JHWHO0dHud+2Xx3jGKYgDzuIrl18b4eRfsKf/WQSxnTs8nVJSkFAeRkOBrOpWuNPYo
         NHRa3GEcDEypdytPTu1Lyn2V8N9N9nxUPqMkO4tjec3oEI9PQBgl1RpsF5iNgHoCURwF
         1rl4VKc4KP1wugCopLjjsVvU96uVpTliJbEdILdMrQEWpEKfSKNY936OztTC8wfz8bTr
         Rgr5ZXo15/0nrYWBamv2p4VZt9KWEeL/85My0kBFqToSfldvpNKQ9/Zce+1Qf0bYUFeL
         0rpZqxsEqUWCF1hXJiAY03r/QFIyKN6AoCS1FO6C227Ae8U4f42+CP7Mag2m/ErBTPLX
         2Yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775148836; x=1775753636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YQHOj/bnPK/nIDomsOi7P10E15gaCTUx4OYWYgBgufo=;
        b=dcMW11PTwYFbsOhm+32v2Atm8iq5FbINOtuRR+cWjBUoCXnpI81M4NZYu8Vm4g7cSH
         +M4mzdnL4wnT07NbipDQ6ZmPsaZAybDrPQsm3ijKJIFnhi2a7gjpnQe026HBZ+l7ehiS
         pNkppkJSf+3j2lUFiLO8kABamDDbAq+uZ/cAGvRsDiXTx7Gfgg20QMQyveEat45bXsla
         fo2eEJTJwZ3zjfsRm2pwBBL76V+BTwUFb973ztRZdP84fs70WXJN9jHwRcmv3UUUApIy
         MUwnDvsPzN9kJYR3Mm3vF+L32JALscB4gYavbeYLqP5Zfmv9d9MSW+LcNI+ae4f0AK+y
         LCXg==
X-Forwarded-Encrypted: i=1; AJvYcCV/xp5xNNIdkGOR0Se8ltPJt4in8bd05qGLYWmxU2u7MF9gWogYNFD586NVahRCyq/kVMEgkLEnwcQZyQ4BxzdC@lists.infradead.org
X-Gm-Message-State: AOJu0YyxD6rIZ/g9Bh7OYFTxKMcicWpukxtxBpYmJ8orI1T7edFpr5oC
	dbUU3/DiGMWEluOqve8FjPIOWfCThgGib8fnhgPDCZ9IjicPAksAVHRWEMg0X3x+JSe+3f2E3Gz
	WO2krrirtBwlD2N6fveh7b0gpM7/TeMw=
X-Gm-Gg: AeBDievptxdqRYmB33pM97CAmqKCrppb4qc7HFM8AfjmTINkd2p/YX6Mrlss/DdmY4N
	9t7WRPzBv3q3fQNC6y2/OgyYCKay8ePA7WRS7rQaZPX8+uSQ9k9Itt+KGfQ8mtgD8dttxF8tDwe
	HxZVIeGGDFUh8ap6WmV1TlBQjtBdIgc0s5k1ZMg4kuH136vku0jyzuhgBwyN5wWsWLBeK+V8L+F
	S19r/bXGgDcGiTADykMh4w5w/zanW1FFFOYuPu+ozB/9IJzaiR4/g5dr7ZQFd7F7i+6SZRjHCbW
	5fDMPSkDTAdPndj/pilPZkDBnv5xsLhAoCnsSm8=
X-Received: by 2002:a05:6000:15e0:b0:43d:1c75:db70 with SMTP id
 ffacd0b85a97d-43d1c75dc44mr7692327f8f.15.1775148835462; Thu, 02 Apr 2026
 09:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260401041929.12392-1-CFSworks@gmail.com> <20260402080542.293e8729@kernel.org>
In-Reply-To: <20260402080542.293e8729@kernel.org>
From: Sam Edwards <cfsworks@gmail.com>
Date: Thu, 2 Apr 2026 09:53:43 -0700
X-Gm-Features: AQROBzCjWRVG4OPIJXMJdioZXiZLwrE45OlbnJvHM-A6xPnlux3hujAChNQ6Gwo
Message-ID: <CAH5Ym4j5peYXc5c9ycJzimy26Tv+4x18hyy+j-H4v7PyWuWhtA@mail.gmail.com>
Subject: Re: [PATCH net v4 0/2] stmmac crash/stall fixes when under memory pressure
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Baruch Siach <baruch@tkos.co.il>, Serge Semin <fancer.lancer@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_095358_181027_0E793293 
X-CRM114-Status: UNSURE (   9.27  )
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

On Thu, Apr 2, 2026 at 8:05=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
> I meant we need both a threshold, and a delay :(

Hi Jakub - got it: when the critical threshold is reached, allow the
NAPI instance to sleep and start a timer instead.

1) We'd either have to leave interrupts masked or let them race
against the timer. Either one is manageable, but I feel like those
interactions carry *just* enough regression risk to bump that patch to
-next.

2) Could you point out which NAPI driver best handles this situation?
I'd like to replicate its approach.

Thanks,
Sam

