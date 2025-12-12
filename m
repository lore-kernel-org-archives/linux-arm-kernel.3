Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912CBD44149
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 09:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mw2ckxKrCqrlVWik5CQTkeiXSkBsBd0QUuzrYIPgiQ=; b=jsmbsLJdPKGx2u3kaRrz5DtQfy
	9gQ6eYqT0wlaR02T45IlXkw6VkXzKJ/j91qBxwM46zvuPgXiOKwOYxpdZDPdIojtz0I1qq0i1CXvJ
	3w/ME1+HyIO87ZGwnWZfhzAeVTkTgTVJrZw0almQlLSzAJuLuYhseuK0eLboWv+IzmL5XL0X0lzkq
	TGhh8ElBA3r/C4jyMdKD2x0AL5GVFEGfg2lufZ9XrwhlmznWG+4D7/8pItijs6+H2+7ZgAStvn8Q6
	PS8N3PMY0zSJjpYoRv07jnXFxwmUwqdIuDFW7OgbXQzB5jhERZGJcrv/AfGrLeWJ+oFHWd9MzFQG7
	D8dnjqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz1D-00000000IOX-116z;
	Fri, 12 Dec 2025 09:00:55 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz1A-00000000INX-1sfX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 09:00:54 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-595819064cdso1520459e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 01:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765530050; x=1766134850; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mw2ckxKrCqrlVWik5CQTkeiXSkBsBd0QUuzrYIPgiQ=;
        b=TI7qntqamUU5Dzws+aOS0aYvIfjRnobUGaCLri1tJPTQhQ0zrklMCcdsxgqmg3QKpw
         7drUITQVLBR6vuQiZISIDLocm9d97Il4un1MPUeJIx/lw3gGFOCh+TK21gYa3Bi3RhKb
         +axc4VqZDkQ+ijNhifzzQDqLYNoOnbXIASPU29eFkmzjN7ECxRIjC9wVpn3PX/MWrMsl
         tLZluUNJ4bFvEdBSR3N6u19Et+X7Id1juanOt50bEj5myhToKl52yvziUdl4cxg4nUf9
         csWsItGNuMfOq2t+QpNJzk+SjICJMA8pnXVEZk8hb7ftFGMo2tHX3fuOrl2qZGa4SI1I
         nNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765530050; x=1766134850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0mw2ckxKrCqrlVWik5CQTkeiXSkBsBd0QUuzrYIPgiQ=;
        b=E0mGr+BcNTez9WzkbrFSZcsTcQ3LfnD4qd4ADEDbsc7W+oteuCGKeUfDa1y7+mh4mk
         iRn2EJNUVqzj94t+N1HRIRRfvcHYV8cF0lBmjO6wB9tb2dG7p/IthvMTxaEvLeZBhKD8
         MTKG6nhXgyqcEBr0x6eUp4Ehn/aBalVAIwI1OXvDlw03ybgwktTRtOihXkbRxNpRU4OE
         w4TdMgTZl7OTcl9KVlM8tA+BO5wYpyaaZRr6c92w3OwgQHONqnCTyZfhP7XjuoxHm62f
         ZfI+yZYED+ZwtsTL9kBl9dvFqlwOlh81LZTLRdW+RD2MoKOuP4vEnolraCuZyHSUja4y
         PsEw==
X-Forwarded-Encrypted: i=1; AJvYcCWA6++a3NYM6fld27koUbXMpeE4eA69QFRZ7h2Ob3nZCS7PMpPwpI9DEXkbQR4oqA05KInyneCYKWtd7pDoyexk@lists.infradead.org
X-Gm-Message-State: AOJu0YxC39AY1ci1q5cgOOBMhq7wtxhnJ6I9N0TIC1KjzBEI70JWmv25
	9AX6gUgpXvOJ4iU+ShtlmrxFK+70zU6zMyzEKSVuMw+aYdzAKCUQD0Tp8wWa4ETdvmOS4EM1vT8
	/RJrU4gqV5XZcvi1pZOtyZYWpqn2js3RjAj8FeJ6BOA==
X-Gm-Gg: AY/fxX6O/DZrOhIjU/FfIhdpHe6GmlaXZ0GbpFOOFsX42hFRtCET1NOawzeDUjeh0Ge
	5xJ4JpLz48IHCcjZbQnUvom3zvnpv6oC3Ebzc5TpwCNGqLwCMLSO6v8lHJZy88T05Cironm8F0D
	FvpWfOsI+DdalaJ6iQ/FCMR8uROq9VBFPnAMquoI0iDQ+YHAz6O6FwLYaB5pjxv1XWWiRSRfmmJ
	VrpppPkEeLc3yawSYJWFA/NGLFOgmcHrJY9reQOOO1dgPg4oYUM/rZuesnrIwiZEmgXhSdrb9n/
	QyhKBn/RmYn00FoH36dMCM0EDkH3
X-Google-Smtp-Source: AGHT+IGHt0jB653fstrXoO4vNaIHzgQTjgWqFmWp/4blz3V3HQcG84keViqz5W7TjXHTBEBk+A9OOWVA1fGP2/OdKUk=
X-Received: by 2002:a05:6512:39ca:b0:598:f392:897 with SMTP id
 2adb3069b0e04-598f3fdf577mr1812272e87.22.1765530048350; Fri, 12 Dec 2025
 01:00:48 -0800 (PST)
MIME-Version: 1.0
References: <20251107141303.223254-1-marco.crivellari@suse.com>
 <7e24110636db36e8c0a877d90d2ed9570c4aecf5.camel@ndufresne.ca>
 <CAAofZF44pUoyDPnnv9UUuMkYvqiSWP4gELg4rutgo=3tNpBZsw@mail.gmail.com> <fd401d1b4f1e7b7178699227d31976453de5891e.camel@ndufresne.ca>
In-Reply-To: <fd401d1b4f1e7b7178699227d31976453de5891e.camel@ndufresne.ca>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 12 Dec 2025 10:00:36 +0100
X-Gm-Features: AQt7F2qisoxfgXyJ_Gr6IYtNxxPMB4bbWODY-TGwkyfLroDt6ydW5EY7csE5T24
Message-ID: <CAAofZF45i42hvn9bN=77WzcRmAj8eGXFjY7uA+cmnSLrJUNaLA@mail.gmail.com>
Subject: Re: [PATCH] media: platform: mtk-mdp3: add WQ_PERCPU to
 alloc_workqueue users
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_010052_491795_815DAE65 
X-CRM114-Status: UNSURE (   9.39  )
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

Hi,

On Wed, Dec 10, 2025 at 5:04=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
> I don't have strong opinion, if you think this driver can be ported in on=
e step,
> that is always my preference, and making things explicit is also nice. Bu=
t I'm
> also fine picking this as-is for now. Let me know, your preference, avail=
able
> time and safety of not breaking anything is valid argument to me.

I would like to wait before the conversion in this case, to avoid
breaking the driver.
So I would like to keep WQ_PERCPU instead, like it is now.

Many thanks, and sorry for the late reply.

--=20

Marco Crivellari

L3 Support Engineer

