Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEC3CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 01:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwzorkUFHXdlT8TM8w+mRBafUN4j5T2DUosmDnooYsY=; b=uRYZnB8wV/wUbGS1JGbgLuVKlq
	T34pMYW0DHbttdLjnr41vYMAIlwcF9ny6CW0AmVIWRI/glcO7YjOKFbiARWgS1LswJOTiimL9LhMY
	eiLjOClfbzuKoSn1WjFG//c4s8PrRvy8AgM4x+Jkq1P0Y+WF9qJb/Ajl+6K3sRsPipRJADgpVVibQ
	tzhFPncAa6weMPHHbv0ffp/XGjGbsZi4u/ie7sAfjoJ5iGNfIAUYYRvszZG/YrUmE4B3kImuiai81
	4KG//eYoU1tmz9AoSN1vNmHMTghn9BaFjWEsmozzZ57ChTK06vwezuMQkgIvvx26Srq4Ma8R5mPJ7
	selWnxyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQdz-00000000Msh-3zUq;
	Wed, 06 May 2026 01:01:43 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQdx-00000000Mry-1eIL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 01:01:42 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-671dad7cac8so6503713a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 18:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778029299; cv=none;
        d=google.com; s=arc-20240605;
        b=QoLCDoLZJXUlbCIHCjOX9OkuiBnrHflDuNsd+KbI6Fdx9AVhtEP8ZkRWlIg0oXpgPq
         gMf2QT8AosgdvKXe+QA7YTBRa/ac3jTCK8fyDAnDN3PC/tnqSnJkbW/Zc1UA0PW1AOHG
         akqmRlxXqPItHul1skBsfJKTO0p/osZEJxT2IEBsZE4CiAY5Tf9fwxnB5UebYsoon3Vf
         wQgSIyyVXkNpdfHBgqNaORy3fK3J4zX4/wqhrg+pEOFPbpY0b1bnt34l9iRPMCPw8Isu
         ykO/kdZ42/lOEdrP+hi63RTjqI38l0wUX0r3/yDl0MHXPkbWYs+T3LANn+sfmmKrc0WK
         bqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NwzorkUFHXdlT8TM8w+mRBafUN4j5T2DUosmDnooYsY=;
        fh=wIw5L0XyZ+Jz0cQWdUk4v4n9KVsCv+23Z5RF7fPgBWM=;
        b=BNfmL3LcjM1CDKcUZp0Hm61SWywVi2rTr3Z/7aaVNB6INdnEX+y0Cxn6y2q2MOKRVN
         N5bMn5N14KeskNzB7luSTYjpfjPb7lHVFTAioCW+8TlOPCyx0rpnvVzfWrkQsgGpgNW8
         edehEmjDw4zGdB5v9B0FFoPpHvkvxcCnTabRpYBHecWnbC7neJRlVVGW8qCkwAkUml06
         6GtB7QeatSxEvmzGpOfPC9UcrLY3Z6CQo1adU/isOhseVXKeCpgYdbJRPHbpY4AU8cFC
         3YMErDNNgZHRNQq3IMVBKvhqyMKg0G6+LG/by49r/tPfvMvS85POXjaYYuGojbIT2y1l
         whoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778029299; x=1778634099; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NwzorkUFHXdlT8TM8w+mRBafUN4j5T2DUosmDnooYsY=;
        b=N6TtkNpuNaR5avPYXAt/78TIIHN1YTNHZ4isFuEAKNIopInvTDsbyek8N9hG1wmE6W
         71k3WcAi3kkyFEsbOh+9LIOuFwPyC4Fok/vp5FwfaOKvGzRBMWMDohILLGTJJkWiDVkG
         qGumRYBLSec43kqWOAR/BdAAzdOcdiTKqFWdQi2M4vWEiN2prifcTS26Gmh4l/URRFLh
         WNw/Eke3t82VHZmpDYRZTBlMWR8y4o0Kf2Rmq7U5vYmMimnAomTASr9AkcFne+oFj6Ru
         Lnsbbyfa9QgItNAbdeE6LnUIHOW6gBuL8gi2mQvs8n+9e0fHe4dYPvMbgiTjGVpBNyFF
         toeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778029299; x=1778634099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwzorkUFHXdlT8TM8w+mRBafUN4j5T2DUosmDnooYsY=;
        b=RGlo6Y2dxj2Fi5IFGw323Oaxyz5V8zXfHwzKqcw4afiE3W2/vWx2eC/F8o06y1IUEo
         td54KUHUec+xZOP1UgA9lYltxEZQyRV92u8n5tsSKnvGIu++gyliJUXnevLTpUKYeWRV
         azUZz0G/7WQe6cW+swE8v12LD6Gg8aPSBlpjLk3tsPog8EIQdJ+04hOhDNwEdJrrjnGP
         BjyiW924NDHONPqIofPKKbOgE1bAJWUBfpKXcO0J6gRZ8CnSY54pE2KcmCUGwZiQi/D+
         nxadLBj4REYRw1xL1SupE7xlee2Hudd/YVY18bF4reBfZQ4mV4G8y3rcU9iacDS2ALUQ
         sgyw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZOuwN6/0r6SBJkzaHsMzo96Vy7RqFkCesS1Q/JjZaq6GmX4leU1wHFaBMzj70/B387pbS3ZKddoPgFLi5Sfmd@lists.infradead.org
X-Gm-Message-State: AOJu0YwmhPgSUCNbMtpVQDInx9QKke8qD8ZsE+reGe5soMTyWfGquGsH
	KO5OmPkGcPjiOjG5uXIGSUm13KTw5YU8oNYo0zKQzzJGHGwES3tl644AAmO/6ofJk5WaDV+FQrp
	sHLXSifBKZHnq4iTPT8//Or2xV3VYPyA=
X-Gm-Gg: AeBDievXIfB+oRqPpw3pc8DGqFHmm5heBAqT5vRSJ4yY79VUzBRgTamfNb2aVztd2hk
	y/GYYjXBHk6OyeY/BDKGN0k43Ng8iyJ7Rjoup0x247QznLoGgJTuxm9rUaUG0dGTdzAceo+DrTp
	g0/Rhmu/1jj15RcrvgER17VfKjHZDsgmQi6jMpQEnNOy0fXSF/52aJKYcGjtEFnDbtRb/NI35Y9
	kMhbs8qdDQ1r3kN7Q2eLuXHQhg8y7eKZQzzr0SaFvOAyAx9or5EVBsephL4sQfG78cLuB/xBUKX
	6PsUlKWHqBNgiMvXCOI2
X-Received: by 2002:a05:6402:561b:b0:674:74bf:8813 with SMTP id
 4fb4d7f45d1cf-67d648a2908mr225875a12.21.1778029298587; Tue, 05 May 2026
 18:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260503-mt7925-tdls-fixes-v1-0-dde847e21081@gmail.com>
 <20260503-mt7925-tdls-fixes-v1-1-dde847e21081@gmail.com> <CAGp9LzogKfGovfDw+=m4BkqWAakFTStXH20cQ_FA_5-zo+rmGA@mail.gmail.com>
In-Reply-To: <CAGp9LzogKfGovfDw+=m4BkqWAakFTStXH20cQ_FA_5-zo+rmGA@mail.gmail.com>
From: ElXreno <elxreno@gmail.com>
Date: Wed, 6 May 2026 04:00:00 +0300
X-Gm-Features: AVHnY4INobXxdEOMhemHPoV056iwAV8b_9YlbIjpzUDt0nGFCtcSzWUQppCzglI
Message-ID: <CAJ5_wsS1fMRvD0akfPB-FTcnk+j0pULHrzvOCgVVh1XVbmOmnw@mail.gmail.com>
Subject: Re: [PATCH 1/2] wifi: mt76: mt792x: disable HW TX/RX encap offload to
 fix TDLS direct-link
To: Sean Wang <sean.wang@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Soul Huang <Soul.Huang@mediatek.com>, Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, 
	Deren Wu <deren.wu@mediatek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_180141_475288_4DE35633 
X-CRM114-Status: UNSURE (   6.96  )
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

Hi Sean,

Thanks for the review. You're right that the global disable was too
broad. v2 scopes the fix per-TDLS-peer; rationale and changelog are in
the v2 cover letter.

Best regards,
ElXreno

