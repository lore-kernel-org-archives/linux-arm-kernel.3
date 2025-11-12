Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E2ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z99mIqeia+YwnxsvpuycDzk6TGzbqIDr6NWTdL8N780=; b=4a35fjDxBS3NxfR+Ar5JKA/7Vo
	Q1h7Jsx815PX4i6IjWLMqGzlNM8P49xaloYXFflg0rvutQUXaPadgPZJqiI0haZl3pHMaRM8VOnrc
	AHVYDtdG2YasegSg/37dc+dodp36YKtrkcnJCKz9YtRMtNPYKqlJNzjDuNuPl9ec4evR7ilLMzv3n
	4VJ0gFADM9hxdsYHamVbkmbU6oNFx2gkEH8M1OLL/eZQ9JdQnJXJprpSzpWZcSAOanp9+DxmLLmQs
	gfCIHS67jMX5iX39rn/O1ElNyPKI5G9xa/XXPlLndl31cIOok/9k2QWHjht/xxnydRkgiTO1t2yjG
	kxZX4Alg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6Xu-00000008OLy-3qMK;
	Wed, 12 Nov 2025 08:49:42 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6Xs-00000008OKj-2ZPB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:49:41 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-37b9728a353so1129961fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 00:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762937378; x=1763542178; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z99mIqeia+YwnxsvpuycDzk6TGzbqIDr6NWTdL8N780=;
        b=EzLa29lC55NB6YdFiwfLcNDBt7WCwSMqMsD+BsZmnIotDum1VuGcpPOd7KWiiCk/AP
         hi6/FwEbCXYVFf+Q0mzcXR+m1+UTI61lw0ht1pHOpsOpIOjMpIPFpTY+m7Gv+q6OoXM8
         08yLnri8uQWnLW1Y8X25RBf6z6RvulQO603to2qliHBj72lIuJCD/f1dfZ66AuXkcF9b
         43DkwW8aFJvx976rJ56QMLD4vmyhog8d04kZzd4WZrCmuJNQj+TDZPC73SXd7swTOHf0
         3LfSqAjoPhCPvMXPHtofl8Mwrk+c0QMyly7U4PpR2zdL4eqTzc0L3WgjZ3Z7ciY5kkjn
         Huww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937378; x=1763542178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z99mIqeia+YwnxsvpuycDzk6TGzbqIDr6NWTdL8N780=;
        b=Z416HH0KIkNEt7rT0D6NGZa3IsL4gZ50L4zUerPz3b13OsPhLaafkU0nxY6WdiA/Ho
         RaPmqOgn8xpIHa3C9PwU3nsoVvQuHfw4LPPoeUnmbgTEX0ShnJe3TAsNM3EMlm4198g1
         hMAtbDvddsgyQZTnxx7bGK83/TrW5cPBJa8kY1e2iXtbzF/lZD9pNNWjTp2fmpCauxjA
         WyX5ovlD12IW9DqhNhMkCPNZtR0GpD4N3tgAf6SeFmg/gEidlYQZZqHci/TPT69rexbP
         r+wjSUncEha1bXKP7hpK3+FSw+ahREsUrfN0GhlEn6T4jaTDLdVV0NTYqGsye90YPNPw
         +tSg==
X-Forwarded-Encrypted: i=1; AJvYcCVZlMt9Ltt04TE7FF7+NItsTdLUUwHeQHgSbEZtLOX3a99BnD+l+LzMoQtSE6nAorsMWt9TXmDcEYKl0T2W68uM@lists.infradead.org
X-Gm-Message-State: AOJu0YxN06CTgV+LaKStPDSC7U+F7xsmFW+WeHMWJr+RMtZ9WsntF28o
	x5yI9WwzoOsgFDSmqMrrcBdnS9ZVjY/1eh6GrQEbgSlvKKIwMr3uL2iTRipKpIq9pNF3d9p5yg8
	QMVOeEFWUHXg/VlqAKmV1vahcAhEjjUwx2yuntnKzVQ==
X-Gm-Gg: ASbGncug0j2ZpTAl9Zt1YnUNau8YRqaMBdglDzHvmbUG3KY55JFtyobEMKTqCaEOoqO
	P4jmPJkgFneJLTVnf7EjfxdmK+TJA6y81KovN2kEe6g033oIDT0Z/yGttqXSNkBoKOHKRAkpTvd
	ZuP59Us/7pzdDF2c7QFCtD2EAFUIW2/haqgVX6SCIPMcu4IpZ58HinKXzgEXcEpuvxdEP4fcS9a
	9kfWdYf2WZO4cz6pls97FBchd2ACM4RC4FrfUvTZRghrEQC9WgE8Dcpe6abWRJcaIHjhVDKlwc9
	wB+/9YAcEHQos8Q/X/1X44J+YVS0
X-Google-Smtp-Source: AGHT+IHwkyX27togvHCQMW2BZonFzlk/AX1LRSnafb7ksgAGV7MSuE3/MUECC9rK4STtLAD8hduluRS8ToF2sYh+/Uk=
X-Received: by 2002:a05:6512:a92:b0:594:2b70:6d09 with SMTP id
 2adb3069b0e04-59576e3a932mr714105e87.44.1762937378011; Wed, 12 Nov 2025
 00:49:38 -0800 (PST)
MIME-Version: 1.0
References: <20251105145824.239054-1-marco.crivellari@suse.com> <CAPDyKFpVS9Z86D_QLhjvOYFAbXaa4_Z=ZQnV+x1ZTuXG4x8oXw@mail.gmail.com>
In-Reply-To: <CAPDyKFpVS9Z86D_QLhjvOYFAbXaa4_Z=ZQnV+x1ZTuXG4x8oXw@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 12 Nov 2025 09:49:27 +0100
X-Gm-Features: AWmQ_bnT0AamP8qb05zC_dt0cIUnpnjMsIHeflBvyb85nhOL9I5Vg8kBfSa8zH8
Message-ID: <CAAofZF74Ojim5fJmeu2Y3OTqi1VTTTSqLiCf9VGd6XqbXJSq+w@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: replace use of system_wq with system_percpu_wq
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Chaotian Jing <chaotian.jing@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_004940_652521_A53D0C5B 
X-CRM114-Status: UNSURE (   7.27  )
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

On Tue, Nov 11, 2025 at 6:37=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
> [...]
> Applied for next, thanks!
>

Many thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

