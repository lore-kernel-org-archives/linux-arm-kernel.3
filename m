Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB75CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 07:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjuUe+UFCTyI3ZlwUaVCKaC02uBTC5d7Of/hpQUOtLw=; b=yfsIE1mcGYIpW1
	0ByvLdznCnxqI+PnadPJ9k8R2nNG/Z/xWObFvGGjRZB2TSP9m6Cx7thPKrG9dTl7YAklndZAiVO3a
	ZIxMgbHat67IHh+XKL80wkaPEfMRu8dR8P4piWG/684pwfw4EdJGom2SXr5dJHqfvGDabf1kJcqua
	lH4kCIBNlvn5+fTazt5T/Dd6jSseEkZjxaFC7TnyLKJDVKMWRWWtkxpCKasf8tIGgXwyxPYq1MFHz
	Ny+eS2f+Hf4Knoxc7LD/ZbW3nKYZquGMOwaQzE7WsGmshxslNHWrU9CfoOncYfxI2t6SL/XebRkCt
	ewA9OAZqhvpeyD6/wiLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAO33-0000000Amr5-2agI;
	Sun, 19 Oct 2025 07:41:49 +0000
Received: from mail-lj1-f175.google.com ([209.85.208.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAO30-0000000AmqU-0lTo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 07:41:47 +0000
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-371e4858f74so40082651fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 00:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760859698; x=1761464498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hjuUe+UFCTyI3ZlwUaVCKaC02uBTC5d7Of/hpQUOtLw=;
        b=g6lBnV2J9sQCkP6pV9JfWOzjI29n1LfAjN7Koxln2+AM89tDhJEIxRRR5gxrmYYs6w
         G3EL16bQMKHQmjfvY/H5C/6gzlW+uFh8xtWCZTc4/SpqRoyZYBAWYAHE++VQWXdXI8VU
         lYSRtW0dYOed+57ub1FcwWUFn8XIyv8htsSlXJUX717u4UV/wWysEST6hcVRYSiHwETA
         OEJU2rHSl4FO1+VNyD3Yq0Me65LRNPDPnUBVxFiGf8cMPamf47xtq1ETIpIO5FbUcOWB
         JfXLgw0c1FImQfGdZfTSU7gqOUmDCHMt8GOM12QXkJptFRUkTJIhvecqo0eB/ec5Hk5l
         uSoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ4GxyDTtAofxl/hBbIFYm1AtSIpjPnmS3dh6uFOKCtr2cn7hBp6qmRyEO9FMhxiDVwEy8yEHkBtZhIkwdjA1l@lists.infradead.org
X-Gm-Message-State: AOJu0YwAJG5KzAOjjF3Te3aUCqTmoA8UqwYs7L7mKd0/H6JlwzueYzUa
	8rD4AHbROTomMAeT+6MiRHN7mbNBbPWb4ZKLTJqe6NsFitXiZcQ7jD915z7uvvm+
X-Gm-Gg: ASbGncsOywwVjHrJhi6Q5G7B9kVtux3LFVsevktPzV3uIuk9JPGRwGaMc96uZJgCIig
	EXCh+XAHLv3EB9uVE9Lrjg5iSEi/fbfksg3BwXE6AylwooETGq0rqZsGPWl3MMvV0oAQzzSVI6g
	xyDqMwJRAjJe5nB+tEIVw5/Yqf1Kq5BfqQnSi9HLnYV7HKVm2I4k1gxzZOMXJTyets9pg4Y2L5i
	ZWwFTwjd3t6rVam9n0kWsL7u0WY/kZhq/EODkUb1QHwGGG7YDVFYKdYi0rWogLJjehKCtNkD5FW
	uSfDZnDr8ULtTV7bDNTmSWQRz7rk79Fwaz0u/FfJqaZ7EoHUZBpwxy4cSSk5HCkSu4CDTH0m8l1
	izUM6hQsypPvON4F+ZvkarfMcUWRD8aeIsPv3ndLuIh86y8rFRj5qN6mHDpRSO3e7+Uu46GFTa2
	2HUySPXzBzMtiwNhihuhDV+LVQNLUCCRWMs0RE5s7ncrlC/bJB5BSmOA==
X-Google-Smtp-Source: AGHT+IFvp+AnsDmVlYriWHQwCZMiwdlUMv0d63N6pwEBptoz1ORjKDJSCEZFNn4GSq5H7+iBdNR1uA==
X-Received: by 2002:a05:651c:1544:b0:376:3918:53b5 with SMTP id 38308e7fff4ca-3778216644fmr38744101fa.6.1760859697577;
        Sun, 19 Oct 2025 00:41:37 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a921ae62sm11580111fa.21.2025.10.19.00.41.35
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 00:41:36 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37775ed97daso44620421fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 00:41:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVE84vO7kPu1821soZ5JDjqwuv42gXEYrb+em6lN2BKRqhOOEpor95SQ5Vt/KSHLlmB0D4Mv/YPID2F+JT50fQv@lists.infradead.org
X-Received: by 2002:a05:651c:2113:b0:36b:2fab:fa6f with SMTP id
 38308e7fff4ca-37782137beemr41886461fa.3.1760859695663; Sun, 19 Oct 2025
 00:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-2-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-2-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 15:41:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v66ddMgVSFFtQde34BY2FcjPn38hxCsvVQ+m5+fOJtyJ7A@mail.gmail.com>
X-Gm-Features: AS18NWCXbetOzzBsxzmfJfwCXigzPHLCDC4AqSPGnEbYZf4O62hkT_fB8IZOMeY
Message-ID: <CAGb2v66ddMgVSFFtQde34BY2FcjPn38hxCsvVQ+m5+fOJtyJ7A@mail.gmail.com>
Subject: Re: [PATCH 01/30] drm/sun4i: mixer: Fix up DE33 channel macros
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_004146_235861_06E4D5FC 
X-CRM114-Status: UNSURE (   8.30  )
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
> Properly define macros. Till now raw numbers and inappropriate macro was
> used.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

