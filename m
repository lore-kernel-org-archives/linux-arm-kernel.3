Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01813C02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 16:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ya3+9Wg953Jn+6r1BFFWGUmXlm/mTDHOFstHYyTPAz4=; b=aItahSOzXXEx2wd6JBnuP713TR
	Z/ttRPVduqmawBq1Zop9Jt1tKgu0gffFnLND0DYpPjP5yuVocXNKc0Z1RTr/2RtmlTeyeNLKwSZmR
	WCYSDN5MZ1yqCxRD2QA5Ws0JAAYZhPc2/EWN+amEVbqFwWR2FEv8d+6+9W+HoYx3K71tRU+oeFAPD
	y3S+icyYkd7ZAVfbDws77V7iG6EfyzCpBJrjnvQ1KN0NkHGZyo+9F1/GgVaTX+CSHnFZnXahD57a2
	VuNpUGK1iRLK/KiTd4PtvwuhOE6r1S3EdT/nGM5P6rdi4KPbRziZO3bga+eD3vzKwMploUCF5J/wY
	1HWxccwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4ZH-00000006p9x-0epf;
	Thu, 06 Feb 2025 16:17:31 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4A4-00000006lRY-3EhT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:51:29 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6e43557fd94so9698656d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 07:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738857087; x=1739461887; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ya3+9Wg953Jn+6r1BFFWGUmXlm/mTDHOFstHYyTPAz4=;
        b=DcFSixPT4ld/xNX7PMEgsEgobr22VXMTBB8S9VAuS+g7ZG6/LjqhHzgus6A70dkWdj
         0rjhDCLxc6DDCcosHQQ2e/UlU+7n2fnTw9yn5EMDTNx0GYlNpyInC8U6Uj0WJpeDGiIF
         cZter6G4LauqgThvPBuIH6ImRCA53g+tllyv9xbgw5x0hn595Ghvdi9ecRpi432RID3k
         0dD12/9PUyCEaysvfamn1qKvy0ceu8o3kDRUYSELNm1a9EDgRKM69nawKPKMgKKws948
         7qMXZ1o7zAv9HmtKHHe4W+tCLIXcBcCWzTS+eUJ67EhEry/jr11XVCyPX97ObRThuNOT
         MwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738857087; x=1739461887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ya3+9Wg953Jn+6r1BFFWGUmXlm/mTDHOFstHYyTPAz4=;
        b=FYmdFsXQIUJVAoNonNZaQLPCt9ojvlWXk+beDcmQAA+c8wM+jRJElHYhTXgJzgV+5y
         K6mDzbu+duEXnitBucmTw57s7WzNnHbSKic3aU9OJVAAj6p2ABROqgVytz4sHdbA2ZNB
         PEVa9Y7MZ7F3syS83jsWkxcU2Z7KWKolWiRZoGg5bNZPdaxk98U0F0DGkwvdXDdJGvNw
         fP1fXEHLyqpxjk6ry4nczwzx89jxl50MDD52Bu8jxaZg0zwSCOKOW1chq/1I9OBEPGIW
         vSO0v44+6f3IiLyHOMnUvkKiXSsNfVz7NuJjM7DRIbl3Mzno3naqLKa+aIc6+b8OJ9Qd
         rabQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW6zfLoiwZ7+svEAgezmSQcG6I3YqnOFO635yJuvie5cVlig74FrT0NXAylj+bJqev5eArpLCJ+fTHgElVBOFP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy36QKdgOHBbUbUeKW34q7irJUKMifx6qnwO5TF5rXykKVE7EfP
	cWIPj99sKAalQ7JulRXVDXvOcJrJ3TfbrvybfkB0Z3M4Y54NMNEuDGBP2C1IZpNAcKaXK23DrO5
	BOQoMkcCoZwvJcC3uiOdqvezG3RRWDVhH3vNx
X-Gm-Gg: ASbGncvLQ+rdb45LaFjy6Up2eOZ8sMxonUu99M6jhgrBxEqy8rnJ+w2JcO+S1o0q51K
	fusEofhOSEALLKpZbjpoQWoZ1AiQ2nzmZpzA9ekLQOCb7O++IuNen5niDPnw88x0Oq2/WWdi+jy
	o1M4tAwdzVEY348vbJH13geJrfHDo=
X-Google-Smtp-Source: AGHT+IFMBJsyPwVR1HoBMqviD5Pyqu4vYLuB8gSFN9ZYqdsjCcNmHY1xh1xQXuMX0ieM7+vdGY+x3E+i/HgZsuYPxmg=
X-Received: by 2002:a05:6214:5085:b0:6dd:d317:e0aa with SMTP id
 6a1803df08f44-6e42fb0aa0fmr101443986d6.8.1738857087521; Thu, 06 Feb 2025
 07:51:27 -0800 (PST)
MIME-Version: 1.0
References: <20250206152100.1107909-1-maz@kernel.org> <20250206152100.1107909-4-maz@kernel.org>
In-Reply-To: <20250206152100.1107909-4-maz@kernel.org>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 6 Feb 2025 16:50:51 +0100
X-Gm-Features: AWEUYZn8_ydm0qkW8TG4DHZiHFcLg3-2ZneNEx2eq25GUfwj1j1D17RMpscxmHM
Message-ID: <CAG_fn=XLYmv-Q=b9vaLow82BG9oKDjM0BoCK24c14B4XweJfcA@mail.gmail.com>
Subject: Re: [PATCH 3/3] KVM: arm64: vgic: Gracefully handle resetting an
 unallocated interrupt
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_075128_807964_FC3B2A41 
X-CRM114-Status: UNSURE (   8.48  )
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

On Thu, Feb 6, 2025 at 4:21=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote:
>
> Playing with racing vcpu reset and vgic teardown makes it relatively
> easy to trigger a case where, by the time we try to reset a mapped
> interrupt such as a timer's, the vgic is gone and there is no
> interrupt to play with.
>
> Check for NULL upfront to avoid further embarassement.
>
> Reported-by: Alexander Potapenko <glider@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
Tested-by: Alexander Potapenko <glider@google.com>

