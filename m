Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98828CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 08:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMvYItPyzRe1gzBuo0wIhzY+wWucW3fQKtqTXdUcD40=; b=Yj5TRR0lLdITFsEn/5dxvZvScu
	owHa8U4Vj802DcPsmxEe+4+Wkj5o83/mFL7qxhW8eQSuuw87Mwepyqt+kKioCkynDd3wCbgBDOj/r
	JYZVJUIYHjy7lmji1DF6q5BvTXyQ9wUgCeOROei0D+v/khw+N42d4sUFtTvDL2POsVqRfOkoBRp+t
	Yt0j68cquRXToMn6DZcit8sIsgUWYO8m20MiC6tMM/vYEpJGjsYRHaEzb8bc9loYq0Adx6p5h3XwM
	SQejd8tTGTkALADP7P2jynKYtrpvDEZo0ZsqiLF0Ul30xQIYvx/c9A1tkz2B+2lTn74FlzHtZbYIC
	1AbCaDjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbD1n-00000003oja-3ymT;
	Sun, 21 Jun 2026 07:55:39 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbD1l-00000003oif-0AHq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 07:55:38 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c0c41ff84a6so162953066b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 00:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782028535; cv=none;
        d=google.com; s=arc-20240605;
        b=ddLkucleGm3ImJG2r3spMAHX1IrJe53jAMUrGY8EJHzPtGviPQimctChXBxsEcYfdu
         HIWzMU4I68kkv6EZNZPu0ANU947aifxSw/Nyrz5SSokWdYoZdyNpayfZUyGALUYSlHcC
         X/OoRC8p45cejbgVFxUSlpUqZ4jGRVFJpdOCWGa9LyZg6xb34Hr1lRV63iPQdOsp5GTy
         9lAB1BEm4C5nJ4MXPtrhW4ScRKutO4AyNaPXQBbSIYlu2qNQxjJiXhgWlq766d5Iae/M
         kCqCMkKPJyT5KtZhtlYhGvN4ro6yeMhE9ifAUFnCB0AOrA6Dm/CXROW6PEVwdDrWBuCa
         F91g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hMvYItPyzRe1gzBuo0wIhzY+wWucW3fQKtqTXdUcD40=;
        fh=5UVM9Wv7Xk3m5LfMZf3ufTT1voOtY2TNEzCZLHMVxYU=;
        b=LEzziCk1aGGEBpkhCsnykJOahyXzxD3VU5iIIxZfg/6NddyYXupzKnfgwtfhBIgISW
         smoqhzwnKjT6nkhM4+7hklHVI6/trNzqbCww68/Sdig09ufPgoCZRGOSUvAI433ZRY0h
         eWa47HSACEe8YZ9mEi2hunknUKKl8AHUhlw2dzMfAFQ+Z1dWVoBe04QfTFDxrOPIdppd
         4JyMUbnhBqId8YbtTBajpMy/XrYfGRKM8ngwC5+TyBB1Dl1271LC7N5IK9IV7PhvaNZr
         CyyP5b7O9vNQztyi/D5qDh8U+aWrYDQv7tjWtiDKPNJhxEaldzYa/2UqMAf3mlmsbtSR
         +HHw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782028535; x=1782633335; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hMvYItPyzRe1gzBuo0wIhzY+wWucW3fQKtqTXdUcD40=;
        b=QzeK7U5Yasoh3jP9J69UrKKT53PJWAHcbjfsufVU6/RILZPc86bJ0Q6/uTNuc6GiR7
         XCXnQKaKPpOFXy559yH/jAaWiTnBBf0XHAjsFZS3kxZTlSezwwwxySXgnyNdTiomqkQy
         k7AGjy+iIfEuTGhuL3g6hyVrY0P3J0JmfODhKioGzlQjtnZhLeEuZ9xalbXNMOpK0NBB
         /1Z6rDOs0vAT/l0XSi4327TxWE0EzsRWlWrDnS7jJFukGqlp42ZWfeEsRLgkBMjx7p79
         TfWV2eCwrBtavYgQZN2jDEIhxKB256WuJ3vDJ/ZLOD2qMsC2TTed0G5OYF8UXmbj7fzL
         V/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782028535; x=1782633335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMvYItPyzRe1gzBuo0wIhzY+wWucW3fQKtqTXdUcD40=;
        b=PZSSbdfxHHABnabIUbA8Icd1hKDzMeTsx6J19hCtwdn9qvl1muD6izlvC3mM2vLEUo
         zByGY6Tkf3RXFZfe67AnZ9ajR6IXaJ7Wk5XMIvGIORjMZAhKmJn4CXGdUEh30nro+iYE
         aOSN1wK1nahOV3LdzM3Tm1wBI8GVMUIoCdmi1fNOpHqYbGaien3ZSE6lMuJsrRc3XX1w
         25j0HvaUmXxdIATbjC0Bcr0XzIVBlf05URvAA4iJJBq9JpHnkYhEnWFMjS6vq64z2apG
         ltmwWpNxWAGoA5SKH6m5tO51hzG9GapjrojCZ2HeGHbKZd3azF2AU3+eaHZlNRdX1upU
         UgaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wkykeGvHQxWe5KpeA4ymFjAX4l6WF22nz/pRUS1MQKKZTeK6Q4CGgKdOUWob0t8o10KivYkFdpsq+3Ly8sT/T@lists.infradead.org
X-Gm-Message-State: AOJu0YwmQbiJguFCyn1q9VR3RQhwd60jl5yVV5AQObQaEeHzvpOwU9Hp
	cpvf3m6N+VoM7g0eOqcP4yOnzOx1JHa1E0K12P3sXLKELiOUCTBdtUtnwTfdE4ovKVXGhYlZraR
	ZjD/7XmyupFp8J7qxqa5WFG6GyzMyuK8=
X-Gm-Gg: AfdE7cmzrDI8UgcCH5WSSbnwhcQGIPWj34+eVy6SstBIu8It7RhGbrPRoctC9ky0J3Z
	oKBpVpRGqNFMjwV434IkNcZYIcb6ajhX+bHKcVoJKYDvWvCHkxrbN7W58WEdPVn7QbzbCp20HW3
	Y4efc0xTwmQEQA9eCTjaOcdCgNRuxwYy0pT62D/NXAF6DUQKCFWxGq5dpfbBbuh7GLHznwVtvTY
	OmXARdyrEXONSP/XJz3u8gOw0wp8Ez99PrjMSBCjcOn7k1PkohQQRaSuT9dTAROMtoJ6yPNOQLh
	UkdyoUHjlgIs4Eqo59CCfCuhLV3K
X-Received: by 2002:a17:907:6d27:b0:bdf:8e2a:1092 with SMTP id
 a640c23a62f3a-c097adb13f9mr573581866b.3.1782028534767; Sun, 21 Jun 2026
 00:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260620200032.334192-1-l.scorcia@gmail.com>
In-Reply-To: <20260620200032.334192-1-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Sun, 21 Jun 2026 09:55:23 +0200
X-Gm-Features: AVVi8CfSZq6Enj-XJKx5vjhFc4xd-jMn2ZAzgLd4cUoBxN01IhUJaqR7lto47H4
Message-ID: <CAORyz2KB3jaRc5EFhDSuPox794UUeDgT5kRFe=jFg_rXuR9eSQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] Add support for MT6392 PMIC
To: linux-mediatek@lists.infradead.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Val Packett <val@packett.cool>, Julien Massot <julien.massot@collabora.com>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_005537_126690_D2EC4184 
X-CRM114-Status: UNSURE (   8.53  )
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

Sashiko review of v8 pointed out some easy-to-fix but real issues.
Please ignore this series as I have fixed them and I will send out v9.
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

