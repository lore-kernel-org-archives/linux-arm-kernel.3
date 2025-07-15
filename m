Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3184C83F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AR57cyXHpNdEBRao+1ozE9zC0Ys9s/kP9hmKhK9UHUA=; b=jlqwO+19YggJc/0HPwEoydJ9BB
	P0vLQten82GwnNdgMcrij5SZbRNk/IrbuXfupMVXmIUY49ljfKyjWNVv1P3WZltYwewwow0ti/kqU
	hHDEBMd5mk1+izfvXawe5kw/jc+iEbKDKdt8qxYOHA0U9uq6Y2LdJvoPSvj/iUNJkjFV8AE/NapEU
	2Oqu3YytYCm5cDPGPEiJDKSza9YFFUYOKiNiOnTg+jovo4XoZe5i3+arUUzFMYzViGWJBzmp7Z3HP
	dP6B/zJ3QVJWNfOiys3uHYz3NC1fAWpZ3ez1xHAUip7rtb9tmiFFLJBEwPofIAZHRKE5U+RNrem+T
	fimnLaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbkd-00000004dpz-2hAD;
	Tue, 15 Jul 2025 09:15:03 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubax4-00000004Vnu-2Gqh;
	Tue, 15 Jul 2025 08:23:51 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-31332cff2d5so5047826a91.1;
        Tue, 15 Jul 2025 01:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752567830; x=1753172630; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AR57cyXHpNdEBRao+1ozE9zC0Ys9s/kP9hmKhK9UHUA=;
        b=GJtRVRU7NtGPrO4deCV+vwuY007r12ADsFdTx24vlMSJeP7rEzUzxlMKe76Bh1nxTa
         9PPh6zeFroNFEifJ7oZMFGHIB2p0sXfPeZNhvdjnqUwyb4g8GPxM9XjCdA9r9vyP4ew8
         aU6mTptQye35iv8K4ivR10nFUEsl4gtKiouqZ6M19o4UYk0kHheWvGuMf+kPPSO1o+1j
         kjkt0gH7Iu7mhOjU0V7kj6Uy+oSPWY3xJ8KFyyLpB0lRsKt/Wz/+b9wYr6HuQrhTim0N
         FkiybeXjp/CvbKSxAoVI/smP4KxgJSUhfNrMX2V4sb3QUJO+sMdc2SYU3LCNpOUGxweA
         n2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752567830; x=1753172630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AR57cyXHpNdEBRao+1ozE9zC0Ys9s/kP9hmKhK9UHUA=;
        b=aK/Oy7E1+p/QN1156SHaBfsIaK834qJzel1CnE2y1dcU1kIX3SjrXZHjD4MYHyf9LN
         vZ/4eF67Xcx4iysT5DKMykn+SrDT/OVRoitn/oVTHSFvYWCxyZ1C2JDQiN5Gn+z+OAw5
         qxgx3Y/UGBqeMvhSnD2/LmB4dPdbyGWJcYPS10jNdVrb2n5a4xMsJtUEVDLYkMqjxQTa
         Q8yKVUdDTDgDgdicE9M1Ja2xR30cbnUUcduTxoUk6HiEWv37319chzOR8XHjp2E0CYf+
         +lJHcrbyd2scUhoTUUdOcu0FYhI37Ig1IuDJ3HUwqpRerh6jW4mPko22i3GYRuGjr6xi
         85Gg==
X-Forwarded-Encrypted: i=1; AJvYcCV9t6scIw2jnTvJ4nCV4xQGAjifwH0ZShYfpI60Ler4e9hqAhwtOg+W6t/emiOJmI5XsEbRYkdMrH/R3dG3y8XW@lists.infradead.org, AJvYcCVceByIzExerVn7A3SId9KhHJ4qpKFFkLrufwKRJTgvhYJWlHZs/BLyKUBcyq3Znc/8sOUcjf2kmAyMbnHOXfA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBaPtwQ1TDTWIbO7/zdAptlheK+q4Ah+8R5u8tm/XkKeuKKCDY
	T2VXAJd+a+hpZcWA7aomSdgBefMv+e1rYwxFqSXA4rqbMAzT2LzdjbENOhTEJUeHrplnxsYJGka
	n/fLnfnPgTeUG3tKPNAPg1IhUNcPiVmw=
X-Gm-Gg: ASbGnct0ltgnqTY4mTkTBZY9gtPCmQVOwASfws6meGUIi4O0a2j514BTSqx5OiQHENK
	SPQSEjHIIgI/ovCgX7mgNKPXyjwq77P9mpes2LoJ7zoa9rUCYmfOMNceImVmRJUzSSwmpbXgE5F
	QYlLQ3nBJ7K0kWdzIxAj1URnyEJK/9wGgmAMmvYtuYNo7H7+x7mSJDhGY9qzhm1kvRD2qa/3qYR
	DLO
X-Google-Smtp-Source: AGHT+IGQim4tVu7RMI5fjr1GyhLLVevwXHUGV3YhMyRCmfDdHKplROEF+/5RsJJ3UPhiAa6LDTi+DGZv63jRAIn0aBU=
X-Received: by 2002:a17:90b:5885:b0:319:bf4:c3e8 with SMTP id
 98e67ed59e1d1-31c91f25558mr3528982a91.18.1752567829634; Tue, 15 Jul 2025
 01:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250712210448.429318-1-rosenp@gmail.com> <20250712210448.429318-6-rosenp@gmail.com>
In-Reply-To: <20250712210448.429318-6-rosenp@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 15 Jul 2025 10:23:38 +0200
X-Gm-Features: Ac12FXyjagyqzzwK9h4VxCo7FvGtmHUddwyUc5g6qUy0YRPcOqUgDiJgtz5UTuw
Message-ID: <CAMhs-H_xaV6o7ah=7m8KVBqRgudjKS5o5JA0LTLxf+S2gsuDAQ@mail.gmail.com>
Subject: Re: [PATCHv4 wireless-next 5/7] wifi: rt2x00: soc: modernize probe
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_012350_585999_1D24A3AA 
X-CRM114-Status: UNSURE (   8.98  )
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

On Sat, Jul 12, 2025 at 11:06=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> Remove a bunch of static memory management functions and simplify with
> devm.
>
> Also move allocation before ieee80211_alloc_hw to get rid of goto
> statements and clarify the error handling a bit more.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../net/wireless/ralink/rt2x00/rt2800soc.c    | 185 ++++++++----------
>  1 file changed, 79 insertions(+), 106 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

