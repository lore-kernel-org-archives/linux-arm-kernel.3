Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BF9CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 08:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XqqRnamX48XVhgy/cSJowCbYmZ8Q51GIp96qBAj+mSU=; b=KIQkRGoimsoUWh
	UbpQ40cU1ZakNxopOdZanXxTnNrfqXsBotnEFQ15xCjl3SfBYUxtfh0rrbesn2tL6utXHalCfBHfp
	iPmGgrwt8d+gQcwfqfRkiFca/BTn//B59pXD/gwo4dpgUt9xBlPtT3jS8i8MbEiBcGdRS1lvl2ZUx
	HzCUhAvugzS9hXfDzzK8Eqf2o1wFEPYddT24SeMVi8owgsUQ5oouDU9qPoElEynK2szRJJ6kErg4k
	sUosM1ePY2WJCyAh16+V25nRih9KEVSHvTmgjDb1juu7VAHg3AEihMWRR6hyYqLzzB9L8g+tatbmu
	0M/4MC5Ul5PdELGpf3Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAP8k-0000000AqEs-23BK;
	Sun, 19 Oct 2025 08:51:46 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAP8i-0000000AqE4-0c0A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 08:51:45 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso4583675e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 01:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760863898; x=1761468698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqqRnamX48XVhgy/cSJowCbYmZ8Q51GIp96qBAj+mSU=;
        b=mJ6rJWg9k4BSPJEPoJ63DwPgzrXo/WPczokpOueflyIOx/a7Uw9BzRNVC5MiaUDDSF
         QJJ8Lsa+tWMPqEjC28BW/Oh6CrqXSOJYmQXaJVv+XMWAuVZPjQWZQepDFt2Qn0gIxicw
         fuy7fIBaZK0f+p0VskTn1vljjs7n8m3UJ/cRGSCoEwjPNPlQvbt5hpqN4NaUcpLwy0pB
         3STGEM7sIdLNaaAyGf08lhcOcq8rA/xzvvZje5QGZsGH97sgqzFpUiss+KL632+SBKvW
         L/KBlSwu2GCxOrC3BP1EFAqGwLW1MP14qB9Gy9Xbo/Mm1NVOepPrAQWyrPHJziSXJGig
         JVRg==
X-Forwarded-Encrypted: i=1; AJvYcCUnE41yETVCSCLynyNNVinyM8RukHTg30T4NkO7M1MfwkT3Yo0VEz9u2Xh0h/IzdD+zOPZvD6zaJLMmP6Wb7pVn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4g6wUzEReR0Q++UmHRj91JYqAcuiU2ZAXYPkf/sQ6fD+/+OLJ
	joRy9dax4a0+p8n/O/l7fsJctjwnJi+O7Ov4VOHpZ+6RpzWmtPdM5WlInzv821DE
X-Gm-Gg: ASbGncselJDSIhHsuQTMmBdbbwP+jlC5Nk/TrRoxxK36pXHVZev/G7yElCrwA7RvCUn
	MKtbQJl4pq3uJMGvJVRjC6M0wT27NTgmlJTgNKtRn6InRiDjWs/uV+rXFwZpp7wiAGB+Ct+dYd9
	Ef5uX0p9hfWSrQ+figJXZ/DCB69aOYb7T0PY9WilgVK7PKQTWFMsTqlvPolFn8byOhjEsBSJUAZ
	2MJnnI3yU48Dkf9IahLsMfic5B4DTIFdzwA1P65sAT7fcYZCik7LtWImM9bJF+UDW/HHmq0i80v
	ulTdeVHKKI9LUU0lM6mVvDHQ38iJvSO17ghHylhCgoZ38NjQNXVYt6R+bA+shS/QVByTKv3U+KQ
	3FJ+oZW2ieCWU3b6zuqmpo3DiGcZ14dhxarXegfNbJDuaai4fw26s0EbIWnJO+dDGGpRWuiiWmK
	YlqCuCpGRyt2TYtnPKlRKA7qysbMqqTjJjvEsijabbjR0=
X-Google-Smtp-Source: AGHT+IHoEBcO5PbBnr+o5N+VzR41J5fKHJ95jBCytocJKKjw4iHgfX54XcO7MTN4ap4NnP723DNbhw==
X-Received: by 2002:a05:6512:3c9f:b0:57b:8675:e358 with SMTP id 2adb3069b0e04-591d8502860mr3194549e87.21.1760863897691;
        Sun, 19 Oct 2025 01:51:37 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def1ebecsm1389440e87.97.2025.10.19.01.51.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 01:51:37 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-367874aeeacso39172941fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 01:51:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUs1klUmqHUztlp6yMEO51h9BnPFM75vkkvscB1C8mty2DSbmOr1gaUJ8jxEK/wRQ8X3DFZE6hrGM4KdQy0WgUp@lists.infradead.org
X-Received: by 2002:a05:651c:988:b0:337:e0e1:d11e with SMTP id
 38308e7fff4ca-377978ab8d6mr27450931fa.18.1760863896800; Sun, 19 Oct 2025
 01:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-7-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-7-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 16:51:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v661kowYSSNYJ5Bb05mRFJR7pZFym95Oyj7-R5kkPrzNzw@mail.gmail.com>
X-Gm-Features: AS18NWDXIVTjeyhWFEjy65wFSPD-aqsq49LxTr6pJCNafi4Ajfc1OGiZzxQr0Ms
Message-ID: <CAGb2v661kowYSSNYJ5Bb05mRFJR7pZFym95Oyj7-R5kkPrzNzw@mail.gmail.com>
Subject: Re: [PATCH 06/30] drm/sun4i: layers: Make atomic commit functions void
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_015144_186549_BA728422 
X-CRM114-Status: UNSURE (   8.69  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Functions called by atomic_commit callback should not fail. None of them
> actually returns error, so make them void.
>
> No functional change.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

