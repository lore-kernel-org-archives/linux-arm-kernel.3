Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C0ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+aH8lUB+El5hnIWJORr7k8qBwm8VSBJwZFvW25Fg/I=; b=FiRIhJFy2vl/Fa
	S+tU1MgdQ+jJFa66FndGC+rK2heHMSkPBZoXm351uw1neA4+BqX40nfpsWr0VjqX0IYNHxXAA+Ss2
	J7d9IBuZsocyVwO+Xe7YZJRRlB5Zh5YWZn+NWm/gfBr6tOhdg7KF4Zv1EG82aPdELIf0d9lSw1c8S
	397YcKxzQbliHKL34qtu5FZcmzzJkfN2sE6vSQ2pekm249GTrh4DXPIsO+fv+UCb2p+BLyTkD59QA
	5R/ve0rzC4svJPD9JJXYxQRgcu++TuxsjVTxYS7Xx7H5E4s2A07zSNHqnFgwucaT4QufIHPXAC2Bf
	H5tZK1RV+6WH6qcSpViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyRn-0000000AQes-1pmG;
	Mon, 03 Nov 2025 17:34:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyRl-0000000AQeW-2m6U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:34:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 036D543C6B
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 17:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADCAC113D0
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 17:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762191264;
	bh=U+aH8lUB+El5hnIWJORr7k8qBwm8VSBJwZFvW25Fg/I=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=tUx4q78TJlms91B8kVH3OS4mBEXWsvYo6gIgV6Y0heRMq8vOm1cDId7gsHmz7W3tE
	 7GiOz3MF6wlKLkRekNZ6ukVR+qYIJP7pj1+1I+C0fnW31LlA6+pgdgbsu1yqVjE6lO
	 bvjS/eBSerrLyAuAqTfYt/Jm0i0W3o6czTZv7Ca+Eea98ojf4VLlcwUKvJpLKTQR+W
	 n81B/gcvOWkCN1B1qUtJ1ul7lv3noAm5/SH0L9mrkqMLY/tBb/mPjuKZcG2t902EXh
	 l4Xsnxt08jqN5XmqKhFuD5XCXr1TRB1nQaD8aChq4XcRvAOuYvyd3fS0LpCKAQlOPK
	 kksI4DjMOPIUA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-376466f1280so59275481fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 09:34:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVX7OQug1l3vXdAtH/+hO2SN18po24bjlW1S9n77o0gcilwT56p+Skt4EqcTVodG3JEgorASJQvdUZR/9lqshEy@lists.infradead.org
X-Gm-Message-State: AOJu0YwSPEe8bgNu03t9lTdjj80Dh9aBaerdteKqdp+OdaA3bGivOzm/
	wcmfQZrWE4kHLgO4tGx7ORf0rB35tnKo5mnNuRepLGfIGCmov69KdgBsL8FrSspbUSGQPX3TlCc
	jKsTVGO9Ln2+7Ge+0/BEYH07t16EsjYw=
X-Google-Smtp-Source: AGHT+IEqIvI6roVKypuJ/8lmOG6ruLu/sT6I8PoGyCI0UGJODSsC0TE29OXF/Zmg59uD8vy8TPsUZtJtVFNrzZBQfWQ=
X-Received: by 2002:a2e:960f:0:b0:378:ec14:f79d with SMTP id
 38308e7fff4ca-37a18da804fmr30699451fa.22.1762191263229; Mon, 03 Nov 2025
 09:34:23 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-31-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-31-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:34:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v65v3_uNohrH6PgDaRdVcKzEL0n824kqxGC+m_ZMOjLiNQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkqC2MlJ3l_GaAyIVAX7lpWibpo3rNv2SEIDf6NmFqmG-ysp_S5fUsi28A
Message-ID: <CAGb2v65v3_uNohrH6PgDaRdVcKzEL0n824kqxGC+m_ZMOjLiNQ@mail.gmail.com>
Subject: Re: [PATCH 30/30] drm/sun4i: Nuke mixer pointer from layer code
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_093425_718614_33429DE4 
X-CRM114-Status: UNSURE (   7.99  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> It's not used anymore, so remove it. This allows trully independent
> layer state from mixer.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

