Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867D2CDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 02:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=; b=CdB/o3krK2Y0qjvnX+bg48GM9i
	VtQ+vahUTlXgSr+dy20WmY6m0sUP7vA3ZL9gxNBs/XDnXpCH9qrTecgvNCMC/mq/5oivPwAJfsXNE
	yfPnPSPare0grl8UBUrpZPd+EjUZWoWVI32fHuCqH09idMIcMVKfY+F5bBjrOzBtSDiswiLLor9uZ
	LcotBlid6/qSq3JJRGzHgUfVocDdFRVVawmphlh+ykaYkfhM+m9m3FHYWDT9n9esjkE8h7hDPAPX4
	mavfnD3PlKV//3aNlYF0eBHP57iHL0KtFlchI0M8nzKIeoeRLAC+W1KHYyiLd9VjjOJnp44PzLCLQ
	HvXBIqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwDZ-0000000AGyT-29gZ;
	Fri, 26 Jun 2026 02:22:57 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwDX-0000000AGxy-2Fxd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 02:22:56 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c0115a3794bso79307566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 19:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782440573; cv=none;
        d=google.com; s=arc-20260327;
        b=TqcV2gg5UYrCdzIMoTsEEXVc/ctxbP1Iy/Uhxo1b1fGmySQsRpsU8kqC3efvKJgHnV
         H1WkiMifw6UcunuZTSSmXWYEMnvUbDotu30F9IDJW1QMcEXp7aRiGdSraGM51Q6DNsuZ
         Ac6uKd8bBr96SP53xTVLsxyAga2rWlajpIQCf99oI2FX2JcwndVtt9HmCiWJKEabo1xp
         Zsd3tOEu41uRxOvAHZvnDyNzOjlZA8JOW/xgKdHXkY5+1qNZiAlvs3wvDaTs4SyyVpPw
         mmWHFNqm06L1PqpHifj29Nuc5uIuT6rhQ1a3XpPugioCcULig0PP06IduH2U6Ub7A9AL
         pxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        fh=4k3NWmarHuhhNuJ15+b1X9fButhK2T+sbrTmXRUgFdU=;
        b=omfzl/kneG6ru+5fiWsjS4XjXl4Ie+Wc9zEXAqoeKu6t2GXny+gjC49MVH8vbnpfWU
         uI7WrGw1KtxzWIOtESow/8Z4NvxCNPHWbDJ6E5wHGJkPxaeEY7hmhlUkiQ5ziFWSJ90W
         qCZ/sZOZi9ofAe+aigRd5kc83tw6VjEoiY6MrvfcHZVrrbG1ceCDQaxXSeR/7r+SZDat
         vt6mYHOZcJ7PNNU03MVMOcd9pwZ8khsqUzX3BAqgNxmR4USN1GrYvWPHfm3rY5AmQAXj
         37lJ35XIWhJyQc7IbBx5gD93XIUHmoy+IIR2qfz4f8JmRoLrZttNHWLYqfMipKGGnuoS
         VKQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782440573; x=1783045373; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        b=IEW6W2G4KZ5HUgxe83flXWQMiw3EdRH3W1FcnMv4BHUBp9B13bMxWMnLLz9WH1NLRN
         lt22MdesbHm5WEbDaZpWfQ98TVQSlWmbeqX18Tz/Y5yKjc6qaCRLbQ1T879M6QRY1f/w
         hTmArp210NstF2JzrU2Qg2/DUWZgimAfdmgMQtJtoAJyDXuGekl77UW0gx+Gapt0OvKM
         S66AF6Qb3piEMW/1VCeyRBxQL+5qxLZlztWrCN/Rt4s04boy0DeKWQGwE/7hz9FSaqfQ
         ZfqOw6F6yGd0yIV6EqNkkl+jS612wOYC0DnANNVg3s17dcSezCAIWQPtJ51uvg8OUy3E
         1MtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782440573; x=1783045373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        b=aO6f/WkCLi+jx7S0WJQZuA1pRRDOuNc4obFNnapdYKgS+HXlGRzikcBstoXFL2NEal
         fBz1NurMZrV+Q5K3zJmQDfqNs++O+5u6LBDpdeDUrVdWOMC1Crh/+2btSZag69WPNtMR
         RIKXk6586bg7GeuIZmb7emO4RX4NFXZLbMyT7rhEWum8GE6FrGDFOIqg3hM6tJX7W9Eo
         EIeze9L3Ps9Lvm9+830cTx7khIhoorMyF1nrIKPhfJC/xLp0lxnhmk+G6bNEBish82/p
         RJcYyD7fYmL9Ib79hYxcnSfPZRuHyeK17AWZNzL1jOav3WF3zBWZxQfUZjeIICW4ox/b
         q2pw==
X-Forwarded-Encrypted: i=1; AHgh+RpoOPKee3h8OlNCAJq3KJp8GRM3wdzICPyWyW3B5XBYAL890BTs67c9r7oV4DU69GrrPoKefR1/J0ONe/nxR5p0@lists.infradead.org
X-Gm-Message-State: AOJu0YziG23jj2OmWW2yfA/6nyq7+v/xhKwdz/nMjFjTPdDdRi9Opr9P
	tN57MrN8dNCgWpsrTsompjvYITaXciHGsB1QDQ4iOcukzMvPRvAttuLHCWrjJY0lDMo4G2PMd1N
	30iGkSgf5TMJtQ/956Zf+gX6r7fZ/B1TLjxDULbsVv3xx
X-Gm-Gg: AfdE7cnNWT0oIJ7sUkuWakd+a0vjothFkp53sth0VIrK1cS+r0LCmWiRTey+5eSRjRH
	rZP8o64X54fWkLCueTP6YqU4Rpn3KyA5uCxSStSA6plCwj9wZIThoWNQ6sGZpLiVFomEHry46AQ
	scaoNv4HObJzYik12KBOqh3cBxSeL6KJ2S6EyZSwZOy/pEOxU2h3l7ala4i4qaX3Ie/cny3pwTH
	4UXVKaVpvp2l0cmxtXkjPXsKsMvi+CLX0pYnB59WSwgVe+HIc7Ifltz0ZFt73QWFl9RGGhqpXmb
	n7o6h4U=
X-Received: by 2002:a17:906:99c1:b0:bf0:b39:dcc8 with SMTP id
 a640c23a62f3a-c1205e9e0bemr310104166b.26.1782440573260; Thu, 25 Jun 2026
 19:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260608042331.2633217-1-dbgh9129@gmail.com>
In-Reply-To: <20260608042331.2633217-1-dbgh9129@gmail.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Thu, 25 Jun 2026 22:22:42 -0400
X-Gm-Features: AVVi8CcQ34Y39-PzrNt74VCOQcbSJ1cto8eguB8JlV6Qmjuq7WsCjesKnTmU6iE
Message-ID: <CACrCO_Xa+NUmjmWH2=ptWf5=XC=EiKU66Lb8-NWo+YDYrm16dA@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: l2x0: Fix OF node reference leak in l2x0_of_init
To: Russell King <linux@armlinux.org.uk>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_192255_597264_ADB61409 
X-CRM114-Status: UNSURE (   8.01  )
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

Hi,

Just a gentle ping on this patch.

I would appreciate any feedback when you have a chance to review this.

Thanks

