Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E29CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 17:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whFhBndJs8rNIwDbAnCZQ1mvUrLqXBGZtosZ49qZssw=; b=QJNqFZ65HDQ+NhdmxT4egLAQfG
	Z3fOQZZwlY5rEqGZyPOk4tm9To8BZcs+/HsNXdj7S+zqxQWt31LG6aHucARViryBFAwJMwLJ87MrT
	5Pk4xvgMtHDWIPPh2sCrgriRpeKf1uPBgIqRlbcmNzI6DOCTwTgUaZWDL2XF7Vu6FYmnsoIEViVPv
	FnnX0VBVrjoCFZtiCD0EWjr6QOriZbZLQVufW6sgldWGE/GfbSTmbBLaV71qtdhYV0Z8kelGvIb3X
	3+VksIZZLMkU/uimV0dPukHma1VymeH5OhzYUDEEpOv2lVB/9eqXQv65CzONjIvLMsMVH7oF8WctO
	woZ4XoDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJE0k-00000009OkO-38Ry;
	Sat, 02 May 2026 17:20:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJE0h-00000009OjJ-3URi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 17:20:12 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-44b052142e1so686849f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 May 2026 10:20:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777742409; cv=none;
        d=google.com; s=arc-20240605;
        b=YsFUbm7gqguXMOPFf46Jtjx4NgTZl8BAvMG+YB36T2kSLa2pezgdHZ43zkW8oX5AHu
         MEiP9qxeTKVB0ZWwzm2e0NyETBVjOqvHz0CbleJ21RtWmpP0oxXmDejGOWkJUYSQ7aNU
         4P80hsNZ8vT+spcR1hsENZ9BD3ooj+KnDEMfxmEL2ZZ25qmzSWjz/zQwdXxlptEPV7MB
         U1tqWU4xZSLIPnR582ykGd60dM2qxbHPlI/tw/BXLAamxAadSjVVC7n/HoSZftlyTX1g
         EJ6ryaUYO/c8r3aR+zjzY3WsERnh7eKZblAgABIJnsuFPRKfMwsfRoLmHIKKTrRO6K13
         eQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=whFhBndJs8rNIwDbAnCZQ1mvUrLqXBGZtosZ49qZssw=;
        fh=V4KXH5amZHffOrNxj7QeUqzBdGqMktUuu6KGxqAj94Y=;
        b=c1dF2ULmpDtOn+iLPPmIFk8dWDtRilH6Sj96ljL6prRaeg3L64d5DfAg59IHjnd+0K
         fj7ay3UqSIDvrvyMJtL08qVmgv2kHLcP3WdVd6HhmwGAjUU7obrpbv4Ui1Bii4+StbTb
         XGvZ59VNYU3a4L9aXlYGYHd/KXCXlIQ0rkQi4PtcInyYf15wRVzSuOeiiubDI7qiSh8i
         L9wWsG7lLkJUYdm9+C7SXdPQXJNWywv27SWICowECzOiCHdHOMGkEf6n8AwDpFjruNHB
         SLAiJg6SZoVNA8CTFk+dSOBP3+NWybUv28aPmUkUitTeSMhJrxdIReCX+e37LNHutcH1
         t9JA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777742409; x=1778347209; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whFhBndJs8rNIwDbAnCZQ1mvUrLqXBGZtosZ49qZssw=;
        b=QixBEYD/L6nyFqNTCiTfznMimsjPmVMnQtuBJiklJmRB29uDYn3SzUJiOn5O0ljEeC
         NNi6ACpM4pb5VuIybcovSWnqgpL0eL6Kdo4ECrvSPvmgjZnYtNGE+cXSD16bdEPKn8u+
         KnCO0OXQDQyCe3uYRUnemoigSU0aKCRJUSpaCrBgSUtg0OCg9b33H2UK6AJVPFmRQ5GR
         98a704SkjL2zExZ1Lp2FYjV+7Ohwdgr7mdNPxDPs6WifQkA1hIYZkGP6Bx1AZyZQSUlq
         iIapxMrIV+VNoa/ZCiMgIFpXZ5K5Ht4JoKCbiRGkpqPNvgVMnI6VN9qtHmUKElHU2kAF
         vX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777742409; x=1778347209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=whFhBndJs8rNIwDbAnCZQ1mvUrLqXBGZtosZ49qZssw=;
        b=pqELUE8xOs2GnsCiRDfvKsE3c40SLzoVw2wAd+ZwUuDEDhZPgTzXQmTQMe2dsaSJhK
         7zDv6yFeI9z+kQy9Owh+GAWdclt2+2CQZZsL6/sW6j+4cA0tsYFjxxDtKAwL3TFGfn+w
         T/lBaaXQOiISnm/U4qdxO0xvHXFSPv0QvTm+Ckb+ed0q62sGyaLKHwFxqRaCV1MObxAz
         OJmFADOtulPFY+M6QwvdSaIq6Yomp7bA/JIws1dbaS2TWhMmCc1xofJR8ZI2xOqQJYCe
         Z5eulNjsv1qM8yfcKaQ3rjVwAim+xSg/tiHCdNMG2orq1XhclTKlg2UmV7TY6VayiIgy
         /DPw==
X-Forwarded-Encrypted: i=1; AFNElJ/S24lSct+PZXrpHvS2Cq/8fJgX+Mp/2kW9+lN3FhM6EPBr6PEDkgdLWMgSzUppVnmv8eL9iO892BcPfSgUimmv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5bwxVGePKKh5NlcC9mGQcrChYJ1lvfD72tGOJABHVdcamzGq5
	+SULMdEgLgAMnxnVEM5k/edmq4k/oRfXzg4ZCpM+vUOTSJyiAWyRtavvHM8riqBNl4YUy7cbJlB
	4gMRiKddLauQWlWHnnph6PJ5Qa+c4TQs=
X-Gm-Gg: AeBDieuyFIpjpTQWSixcazd35YPeJQ5WkxuCURT4Cccj8vABpjz8mVhpa0E1YlWmAgX
	dp4uKeDyBZ7T2tsMA7ePi/sHZa7dAd7lZDOdCWf74ylUQZ2bw3DILT+Y78VufFbGzGnCDig54Sw
	s67JLMUKe/WoCneyEA5aw859TzJ13NNMUJRHTJerZuwvBH7q/muoRQC42NsChC+FApqH73goaRW
	INJk4HyFV0bW8uq3x5WXn4r7cf73cAJvTvDlJkqwjhy4V7tRLCd3mIbgfITVPDDqWFqPAyDc43a
	oBhdBnTkyp7ABJ/rG1bJYoy4Hq+LQGGviBXyF2WCU6/rY3ZC
X-Received: by 2002:a05:6000:3110:b0:43d:1c4a:37c with SMTP id
 ffacd0b85a97d-44bb2e2eefamr6396799f8f.4.1777742409079; Sat, 02 May 2026
 10:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260429063712.2150938-1-gray.huang@wesion.com> <20260429063712.2150938-6-gray.huang@wesion.com>
In-Reply-To: <20260429063712.2150938-6-gray.huang@wesion.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Sat, 2 May 2026 12:19:58 -0500
X-Gm-Features: AVHnY4I4aJL8bDrcLq713fIEFP6fqUjfNi1_05rQa4Z92_j9G-w3WDXUUfgZeg4
Message-ID: <CALWfF7K+g0sYLDQ9ROo1nGR9EADK44kVKQ_x=zonWD9eJLMDng@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: rockchip: Add HDMI and VOP support for
 Khadas Edge 2L
To: Gray Huang <gray.huang@wesion.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nick@khadas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_102011_875299_5D682AAC 
X-CRM114-Status: UNSURE (   9.45  )
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

On Wed, Apr 29, 2026 at 1:38=E2=80=AFAM Gray Huang <gray.huang@wesion.com> =
wrote:
>
> Enable the Video Output Processor (VOP) and the HDMI TX controller
> to support HDMI display output on the Khadas Edge 2L. Also, enable
> the associated HDMI PHY.
>
> Signed-off-by: Gray Huang <gray.huang@wesion.com>

< snip >

> +
> +&hdmi_sound {
> +       status =3D "okay";
> +};
To have hdmi sound working, you'll also need to enable sai6. Similar
to the update for rock-4d
e6066edc9413191479b05596ba06c40908f44e22

Jimmy

