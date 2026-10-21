Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A365606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qGyyEUYO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=LXgseJI2;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VaLGlG5u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30kfx+f5OMbhpYMMm98MeKilykOWKFy2lcIJ5DpS4GQ=; b=qGyyEUYOjpdujBXlnLZNl1sv0S
	+dLO+b+qCAs5KHctmzFBdnWOcjMfVX3MsAjA7YovBsWexjzh+Cdx9/thiASnqmkpjzoKu9bNnA+Ad
	0kx7P4UPA1PWvZh0+Z5th9JZQpnlv3o2kdiMNEedcF+UMm6/oBUQs6RIEar2ACyQX0O1ecsikMfym
	5qsBINq5gn/jJjcM5vD4T4EXHWbDJ/E5IFKZ09HNEPydl3u3wSBO/g3U0NoWkMnkk+jFnRQSsqqJk
	apzZIFCDC1O5/kZ6y9NidLUuQIKGYJgK91KV2jkyvE4EPdyBCSaqBjNZqcO9f9IieuZZrctvmtyOF
	JZBH4low==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWG7-0000000BtNa-1jem;
	Wed, 21 Oct 2026 13:21:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWG6-0000000BtNI-2Tn7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 Oct 2026 13:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=30kfx+f5OMbhpYMMm98MeKilykOWKFy2lcIJ5DpS4GQ=; b=LXgseJI2QpPKQcZ1hc2PdmDLmv
	DnCkvh7fyT3UEFMZq9b+9mgWkUsA+ff+7jauaXpdRo5M0kPzKTygnMDde14ddrxLv5myYIxX1O1Gd
	nY5ZUtsFp1tLa+XYinEHEkI42wvP3Coo67LwAKY6BCjC9nXl3r1CSSx8rR9AIB68ZeCaLI9CfepIt
	C7c7YLG8YeRJ1mIXBUqrEv7a1E+QEIzWMaGnVXD/4z4lTIvtFQelbMpA1hWtIWQMqRuRE8MeEdjPu
	lpiErHCUya2iS70L1yH78oYZLTJ/f7PQPopfMBtll23oVGJ/91dxw8q/v+U7Xczh2REB7cuDYdW/J
	e+Cr7uuQ==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJWG3-00000005qMV-1md6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 13:21:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso7361495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 06:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792588888; x=1793193688; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30kfx+f5OMbhpYMMm98MeKilykOWKFy2lcIJ5DpS4GQ=;
        b=VaLGlG5uDeRGgaelcq4IywadSGQGNIMb4iXDgEBLFWZgMMf3jgQf9Z6lmnVBypTFjT
         Kg00JL6hpZpVQkt9Y6ZJbwnuEhDweACgA81KLvsZ2BnOD1Qc0P7/QqE1l2IBbu4lOc4p
         fahnnJs667zKD7Q6KOmvbX1prGtjED/boC30Zvq4EXPNdKoft5C4P84eGsRuqbP6CYeo
         VxBtICZktUSb6+FWGXPa5YpGQZ0+tb5xN3tqBREGjCQC/R69qi8BoEHtacFE1/RYIW/N
         9S0MKtidn5olYTFZv5xGB128kIW1OdtflOGiaQTEM8piTbt6VTTddXvobKyq37NpAwRt
         bLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588888; x=1793193688;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=30kfx+f5OMbhpYMMm98MeKilykOWKFy2lcIJ5DpS4GQ=;
        b=jz8W9z3phvCYTiC07p9bJLKquJStj/J1M3Vi+8Ed6nkqAmxYcMuBswUgjFDqdPw0g8
         zBemg+mDV9E5Tm54dXIrX+qO8+i5gCd/r6490cuqZxHt5py5CmBauFG5WBecXMdILmz0
         aFOLgOgl/hu2EjJuWY/27rP4rTsk9NxEtjazOgn5wHvX03RrR25QiNkMC1y8oKNSO8LO
         V6LNu90JVdknwHiE/M/3ELkQCAAyVg6rWl/48z6geM1s7lFbEI3wa34B5GQqbfEwrY5u
         gQUXGWPZwLYdBatmDkMQK1RtDssB9Zrgica/hjOTIsl2stmUwGY+D2fZbLUg3Hb3tUvO
         yUOg==
X-Forwarded-Encrypted: i=1; AKwUvBwMKcGXUT4L9Csqs7IxH/dXu08XsJI79I5FrtZ0+CDLyEGscMO1naTw/r4p7e9F3WQUdE+j6iw8TpWEUVsC9IZp@lists.infradead.org
X-Gm-Message-State: AFq9FYKDU5Yg2KnASoVXNdktpaLQvV0RsrvbUggHXX2eEHGeUdL/3pER
	E+8DJZdPuOpJQe52RbfDh7RkzV7NCUNJM8FvC7XT2AtstpkQ3hUGEYs23ifjbwRo630=
X-Gm-Gg: AYBFou0zw7g+yw/C3jCP2gpIT2WWgYSqavtw0AHe+rGScwvoPrBz5ZV/hSBVDrHWM4X
	zuV2fc96EAhV223X+vAc21Xm71EnnY0rG/yA2IkQFswX56Q04UrPGofQuRYwE4vMYntm/jC/XYR
	p9Lt/6yb1K/WjRG+IEDW6XNRuoNDK/Q5t7szRs8RyUCS16LgGCsbPX2F4gFClt1G8rlIzr/UuPy
	xRSfHktrbJjbhzaVlbWks91pHUQ4DFMkQgayJpEHXy3KU1QRtqZwZFxCO92xxHN0Fj9mEqPGgCT
	tT2SAwMvkLW2TP33ckxGt2+CUOku1Plz09/ygqQ195Qm/ByUql/2ak76CidKX6EkZDsRoj/Z4Il
	mWcdYq1xgQpUTxR9T9K7ztOvu+CMbo0Zn66mw+saZMAUSo98KrLk0cweIFfYYi3ETgVXuPw7AsD
	35/TPHNnqVkskB+mDlwupLRoWuvhiold8BCDbC+o4Pl23H6ID4kG6lA//16GB3E0ZzQJMMYp9uP
	VJ/RsNid0jiCIOcSdgMSM74MW5bli8Yk/uG3yRXfvws+w4t0fBY3BNa5mI6MOCJb8qsZallCKc=
X-Received: by 2002:a05:600c:6097:b0:4a1:d456:ddc8 with SMTP id 5b1f17b1804b1-4a1fdaef8b0mr39864365e9.7.1792588888044;
        Wed, 21 Oct 2026 06:21:28 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm112679735e9.5.2026.10.21.06.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:21:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ryan Brue <ryanbrue.dev@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
In-Reply-To: <e8389c1c-e858-4171-adff-5bd94909120c@gmail.com>
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
 <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
 <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
 <12e0953c-5181-45f2-b409-05163ab2a031@collabora.com>
 <e8389c1c-e858-4171-adff-5bd94909120c@gmail.com>
Date: Wed, 21 Oct 2026 15:21:24 +0200
Message-ID: <1jy0brgpez.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_142131_569860_3025BE9C 
X-CRM114-Status: GOOD (  15.43  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On sam. 17 oct. 2026 at 18:03, Ryan Brue <ryanbrue.dev@gmail.com> wrote:

> On 9/28/26 7:22 AM, AngeloGioacchino Del Regno wrote:
>>
>> Please collect the changes that I've reviewed for this cycle... I'll 
>> start
>> sending PRs from the next one.
>>
>> Thanks!
>>
>> Cheers,
>> Angelo
>
> Hi Brian, Jerome, and Stephen,
>
> Gentle ping, in case these slipped through the collection Angelo asked 
> for above: this two-patch series (FHCTL DDS mask width, mt8173 and 
> mt6795) and the related mt8173-mfgtop fix [1], both reviewed by Angelo 
> on 14 Sep. Neither is in clk-next yet, and both still apply cleanly to 
> it. If it's too late for this cycle, just let me know, and I'll ask 
> Angelo to take them in his PR for the next one.

Hi Ryan,

If you do not see it in the clk-next now, it means we missed it and it
too late for this cycle, sorry.

>
> [1] 
> https://lore.kernel.org/all/20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com/
>
>
> Best regards,
> Ryan Brue

-- 
Jerome

