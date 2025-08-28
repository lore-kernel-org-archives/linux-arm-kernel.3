Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7F1C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+wN+lwhqYoTKxVX6uQN/sHMwauGJ+RriAyxhBVnStc=; b=q1uier4hNtrwmmEmQjv2ZO1it3
	v6SJgYjkl3Zv8lvwjwHuYJdYTIlkaBlG7KJQxGHw30IFCgGEMC377ZaZCrKy5lKaDHR4eTlzmCNmN
	nSdgHVjgIxBesRvpus56s2Zg1zg2bFznpReuRf55KuILnrf9TTQimOkL69fnIYtjf+TsGOUc6jA8O
	fGy0vH353jS+QFaKyXPtnmsB137ba+KxPlf8DjOuFfsiWZ+L2qnHDGKTRo2WHrnPVd/VmQ/obeWC2
	pH/9Q8jLbFY5uMZFSgZln7X6w31kLFkI+9NdzjeTLIaSFa0tY741J4GeHplyXRv2zkTxHhEIjTLCN
	W6Aa0KXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgQV-00000002W4Z-13Xi;
	Thu, 28 Aug 2025 17:28:43 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urdr5-00000001xeM-2tMb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 14:44:00 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-afe775db944so314277966b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 07:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756392237; x=1756997037; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+wN+lwhqYoTKxVX6uQN/sHMwauGJ+RriAyxhBVnStc=;
        b=Q67JEWn4pLvp1kJsntlSAoVtAe2DV8cF2daReq8mcPwWqNxYeaKpKez094/7R8NOW3
         XPX22Bo2fNmLVgumrbMxzZdiECFKRGfiDRqrN43pLwMqx/rFGbfgcjRdD6uZuIYBjs1J
         JYqjfcRg6Q0I4TlKggxoV2MEryUsuzCllroKAzbMBhRMZEIK6yPKvuFdxd4aVRDmKn8+
         q25H/jpXS67FLiU27IHGTgjETZJLv25IYsWQVDcBHig/1kNZK3fUj/ZSpr8+iB85p99t
         AIvgVDI4wHmt5d/BqdxWOHsZsJdoT+10YxYys2yyF36Bi2OOUNRAeOZlGh3bKphIltAh
         0hGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756392237; x=1756997037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+wN+lwhqYoTKxVX6uQN/sHMwauGJ+RriAyxhBVnStc=;
        b=aZAF/q2z4/+dId4nsnYLsmKPgvaiiwYjeDsmg11K21P/EQKtkH3eiyXU8yXVDwKA4y
         7yslxbRTdJKCLxeWW/KzNkfW+GSzOZGxi7a/LpCAXAQ1QU4g4bV7SpuCrqVtDmyue3XC
         Iy3/M/UFicsjUeY9cq0F14hoiDfOEF1vlQynnO33Gluvz74H79cfLwOcrvnag65DQ3da
         ycLG868pb668EiU6qa/FcOSQaKna4PrXWtMcvNxwUhuyPnFuUJiFJ6+S6tg7nNZhhkQK
         XZ+WYm7eIVcqWWTMj8GLap01Z6ZpELQNXgC5g9ljZuHIq0//FSUIKjwfvKjZPYaSZyea
         i9fA==
X-Forwarded-Encrypted: i=1; AJvYcCXIV01440+LYT7ESuLwVuQpztcFlEzPXur3JXQcPblfMuMAjtfJcxtonO2l1/IsogGscFfeyNHT1FK7yNjpJup4@lists.infradead.org
X-Gm-Message-State: AOJu0YwuIvROd7K5k+70A+4kemG+w88ReOmKgLaPiWypXiYBe+FTw06t
	/sby2G7JhpK4HU79vaU2E+m1GZWQM4OxyVMZ3UgPB76mM3rMQ1aR2URfSlJogSQp0C7tbbKjFcd
	bhgiHDd4HRDcq0pS2BNrF5Zm2hekDC3Q=
X-Gm-Gg: ASbGnct0LHsjkSsg7UVelmaBwh9EA7Np4+NOEltXsFusBGF0SYCfiEosPRTo+ofCd3D
	iNjyDMRupECqpVSbbtt0yn83nVcoWBKUE8BIniTDLpchjqE8TVr1+9Xg9Y3hwG35Aw7uBsSSzsT
	SjmKjXEdGkeY37s7nQlb71vUDVciEWo4AHbMqQApIA36S1+vl6bCqyxcr3SnXzdSyGEy+mZa0bZ
	U91LC0ui9OqiKWhwQ==
X-Google-Smtp-Source: AGHT+IHSpV38jN3vXlwaE5Hc/33kYxgkSGU7qt3cnFjrbvgWPlGfvWhPC35RdoWMMw0cLo0RpnrmYHf9TYgJV3EIk80=
X-Received: by 2002:a17:907:7ba7:b0:af9:479b:8c80 with SMTP id
 a640c23a62f3a-afeafeccd92mr974083966b.4.1756392237310; Thu, 28 Aug 2025
 07:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250828140617.3193288-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250828140617.3193288-1-sakari.ailus@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 28 Aug 2025 17:43:19 +0300
X-Gm-Features: Ac12FXyTLkbkyCMLdfg5IxUIPPUzIcPP1Ugg5myE3SihT1YJg_dhgWhZBLYFxok
Message-ID: <CAHp75Vdr5atuW8wivgR3KRjhCK_i+JE2rJFTU3CkWwzpuNv_pg@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] iio: dac: Remove redundant pm_runtime_mark_last_busy()
 calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_074359_726274_D2B2D482 
X-CRM114-Status: UNSURE (   8.73  )
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

On Thu, Aug 28, 2025 at 5:06=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to

redundant

> pm_runtime_mark_last_busy().
>
> Also clean up error handling in stm32_dac_set_enable_state().


Code looks good to me in this version
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

