Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3C6E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 12:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HB4h5xGYBYj3eCi9b2ZJAMbBJzOGVJksJuXFxsMtAq8=; b=XEWLUp3OV4LAFt84yMopz7pkLw
	N4P3POxf1Q01Cw+5rWV5GL0g2FsXaNyz45I9bJoy04911ybrsabktEIijvHy7VKTvLwm3oZfTdazL
	h27i8H5SVtGZpjWDngTP7YNE3tlTycbLTcE+54NO92vRdxqgE2lZCA2GAOSYVkQLY/eG0eTif0lX3
	zyKh7ElaCQIhXzDfDmJfKM5kltqEoPUh/QjyAau/JcbOEgDnJVniuFArlKZSIKx6RG3FZhMmOby/e
	tFhUcp2Nz5AHvcXU2j3n1eRzrowJE5f2vwptWxdZuLBZn5lwm/Ff1ccTgnkJqNEMmvcdxxV7avuyy
	/CiNGygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKd7s-00000007le3-2cPe;
	Mon, 09 Dec 2024 12:44:36 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcw7-00000007hQJ-2eQq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 12:32:28 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aa69077b93fso76152966b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 04:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733747545; x=1734352345; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HB4h5xGYBYj3eCi9b2ZJAMbBJzOGVJksJuXFxsMtAq8=;
        b=VGx59HWUqMU1bixe0SGYdcn1zFe718SxKA6a9RyMmXtvqMkIhX3GyCp6eZabaGxZMv
         HSuFYuzcRxNbeXqODYHGB+m06XZazgmHVg0R59xKE2a55kqA+2mOe4c75icBDhH6ptC6
         nx+DeOfI1pj7898CTmUAVuT0LGkpI1kLDBAYIGyY8Rj5wyZYp9LCTy4MCSdDOGthxXfL
         Gjo0iM+7VWj9TkVH4azWeS97MS52LghSJoeNLW/cDB1EzG2wlUkswLzoeZM1HZ892TJ+
         DBodGzCLMduGkk+YFzpXkamlKIhkkvqP7/X0JnHsLULQJEpwT96CS+Z24uwIQIKkjHa3
         lnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733747545; x=1734352345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HB4h5xGYBYj3eCi9b2ZJAMbBJzOGVJksJuXFxsMtAq8=;
        b=cWf8dsiYDgs3k7aXBas2shyK0IitVfkEITE1rtFMbPCLtLG8coxcneV/xGs/KBfoGf
         WAdvKhMZFV1IPTBQHvG7wtX/vHnHAIpECYBxaSubeBnvDx9jwy4gXERcnpEgIoE6FDf5
         8cAXM/OZCYO2ggLV0I47HxnnvWEfZ9PlkGA8WcLlVVONzCI0M8/vjS87d2kkMBSOZnnW
         x0bLU4NobNdzLCqaARx8pA79Kz0pQcPitpQ35T748QZ2SG4V8kxJ+C4H3Cs9ZMtodLIK
         nOcFPQafQa3vzLMbMYA4LuM1aKGXue7w2hoMDgsSDwHCR4xk9SwUgIWoOhutD0Atueco
         yovg==
X-Forwarded-Encrypted: i=1; AJvYcCU3XNJ1/Y1P3PmSGg5XDCLvtDdXgDQlBRW3RQMjsKIJBj9A8XvKdT5PPZ4nHLIBkN36lDwcPDrEg1SCrdW8bJVi@lists.infradead.org
X-Gm-Message-State: AOJu0YwwhZOKb3IDntfgAUHe78KEhYRXX9JZI3SKDEDDBuWNYUXmEi+Z
	FcUasxiDxGo9lXt/k/eu7ScGxBevbNI75zjOH21P6uDaPrKUtcOoqMyoy3Tvvsfg9gjeCT53+Jj
	fE6CW4em42/b3/HWx/VK81qRmp8Q=
X-Gm-Gg: ASbGncvSAbzQu8ikV9sWW6LVawDHW3t+nNT0AorYJHp70cBJ6udE+LkVBerrst2Vccs
	XNF1vHGsvlvvwwBSvM1eYohgwNjH01uw=
X-Google-Smtp-Source: AGHT+IFjelp5b6CRvlamva7li7ksyULJr/ZURZRaVo1idystYOkChGCfpprPWdYOncNMp0luUAJecmb6PSVS5WPpxr0=
X-Received: by 2002:a17:906:3145:b0:aa6:7cae:db98 with SMTP id
 a640c23a62f3a-aa67caedcf6mr431164766b.10.1733747545303; Mon, 09 Dec 2024
 04:32:25 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-5-4e4cbaecc216@wanadoo.fr>
 <8b8262389bd6484586007d749132346f@AcuMS.aculab.com> <CAMZ6RqJPvbSr5i8N4Dm=2N6D8uSzefCM3TyK8HBNNNrybo5f2Q@mail.gmail.com>
In-Reply-To: <CAMZ6RqJPvbSr5i8N4Dm=2N6D8uSzefCM3TyK8HBNNNrybo5f2Q@mail.gmail.com>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Mon, 9 Dec 2024 21:32:14 +0900
Message-ID: <CAMZ6RqLMXaAej75eXrLgvt-Co1yyEg0QNJSxPovzLzb7vdxmdQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] minmax: simplify __clamp_once() by using is_const_false()
To: David Laight <David.Laight@aculab.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
	Martin Uecker <Martin.Uecker@med.uni-goettingen.de>, 
	"linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_043227_668148_3513DB34 
X-CRM114-Status: GOOD (  14.47  )
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

On Fri. 6 Dec. 2024 at 00:52, Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
> On Thu. 5 Dec. 2024 at 03:54, David Laight <David.Laight@aculab.com> wrote:
> > From: Vincent Mailhol
> > > Sent: 02 December 2024 17:33
> > >
> > > In __clamp_once(),
> > >
> > >   __builtin_choose_expr(__is_constexpr((lo) > (hi)), (lo) <= (hi), true)
> > >
> > > is equivalent to:
> > >
> > >   !is_const_false((lo) <= (hi))
> > >
> > > Apply is_const_false() to simplify __clamp_once().
> >
> > There is already a patch 'for next' that changes it use BUILD_BUG_ON_MSG()
> > and statically_true().
>
> Found it!
>
>   https://lore.kernel.org/all/34d53778977747f19cce2abb287bb3e6@AcuMS.aculab.com/

I picked up your patch and got two build errors on an allyesconfig.

You already sent a patch for the first one:

  https://lore.kernel.org/all/33893212b1cc4a418cec09aeeed0a9fc@AcuMS.aculab.com/

For the second one, I submitted a patch here:

  https://lore.kernel.org/all/20241209-nfs4state_fix-v1-1-7a66819c60f0@wanadoo.fr/

I will wait for those two to appear in Andrew's mm tree first, and
only then, I will send a v2 (that will be rebased on the mm tree to
get your change).

Meanwhile, I think this series will be on hiatus.


Yours sincerely,
Vincent Mailhol

