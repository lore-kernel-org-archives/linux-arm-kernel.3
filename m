Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C25C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 17:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8sWmgtXc9A8SS+LZhHtZUXAexu8GgTmOedRrg1dhsA=; b=o8jGg/Wo1mlN+iagw52t1GIn2d
	Zy2vFeOAybmF2tC9QVtopNUqWqONM+zUXLU5FiohjJUp9GTQXlft6pUh+XcIRvZM2xrj4YsLG4FCJ
	vPfBTGZ0cRWTmbBRiUi/W5SRpAkAuvjEJ+DkOMOJOQQez1DgRrtjDDle11xY/9tnqcGfGFTsLUpa9
	AuP9HihJY84/r2HhIspySkccf5zNCRygsgLpW9I6MtVCtLJXo3tQwDrb/1mQj6jIUyI4z5ouNRFiB
	P29zN098gfNyVNwC9Z4rc7sxebsBYiKAjcgs0t50WtOfCQPCKouOgoR594W3RDWadP6EwrbhrYQFg
	t2wL64NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvK8i-0000000CsYP-1BWc;
	Thu, 20 Mar 2025 17:57:08 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJyf-0000000Cqpj-1UuL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 17:46:46 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-224192ff68bso13168215ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 10:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742492804; x=1743097604; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8sWmgtXc9A8SS+LZhHtZUXAexu8GgTmOedRrg1dhsA=;
        b=O2wW3HtCQlHa++r5iJoxBSR0rp6hPLP0y2ANdI6j4b29pLUtuLwkYsoghoDfmVUSlm
         qwYb9JSTCTW7HFOZgIlKSfWcYFXhhtxI0rH5i4eJUFu/Lb0B1u8dbWvmATrzsaM4DCjb
         gGn2AblA1L+Z6Gc09Gy1JvKEDHfDTxuog7KLfSMT6xAuQvV1uxFACtqms+pJ5HnIJFZS
         4cDoiGQJkhmVB488lruWKdt0Ib/noiOVIBWeBC1LXh50XtXx6U8E2F4kE1w176yEqIps
         SdfSeXLh4zlDRV5UgNKYPlOPyONhjMYdGy0u3Ax61GIDVBFybjyLv74TF5meLoUJlaGD
         EU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742492804; x=1743097604;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C8sWmgtXc9A8SS+LZhHtZUXAexu8GgTmOedRrg1dhsA=;
        b=rfaSIN6b6hsBv/Q00G7Z06IELNsCGx5CvTiqlJoyLl60g8mgE77l+K3dvdh7/Zg9Uv
         b6OctELo9nvV2Pa7oJQeMRvHleSmGFWw8l6cs2Sgy//pgeQzc/VK6A6AHfFX6kCtZHO2
         NIKlf9Px1dgLfeJerKIp04WYPz+w5PVUngBisl8q/3JM9RUFzRZE0MpEfaE/siBDyCd0
         rdJjtYejgUlDOsHdoaQtBphRyyUBmkVhUdjZDGsx+M8NxZyASzkVqzQ0GYhcj5QAH7BM
         uWCBbzgkr56QkHEPdjECIkvwCdKdfitMcWuf/8MgoXyySfUzYzlFzN8rLdqFsMuBVfh7
         BP3g==
X-Forwarded-Encrypted: i=1; AJvYcCW++ZN9SVq1sPro0mo7Pqw1aFFgyvJZ5yO2jV64UWjCTgzQ2b/eS5fe69H9dlWzoeayau3XI2KYISZnXbq+ILQP@lists.infradead.org
X-Gm-Message-State: AOJu0YyqQSgF23JYehU9CPlSnw9HGJ/STMmDOxXCEAVZuqY6d/w3fbvw
	ul12W7gYO8Xg59y47h8R/xMZh+LV7YOMyHGZbSYRp5tmTn0ZtQxA9BQdfagWFi7kiGakzbU4rA=
	=
X-Google-Smtp-Source: AGHT+IGkcvsUd+T1mc9VlLct3/yS/hr+HeuaSZ94iAFaq0agza5SWuSHmNHqalPgRdwW9LY8R0G3yzT4RA==
X-Received: from pfbcg19.prod.google.com ([2002:a05:6a00:2913:b0:732:7e28:8f7d])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3991:b0:732:535d:bb55
 with SMTP id d2e1a72fcca58-73905966850mr512059b3a.4.1742492804271; Thu, 20
 Mar 2025 10:46:44 -0700 (PDT)
Date: Thu, 20 Mar 2025 17:46:41 +0000
In-Reply-To: <20250320171559.3423224-2-song@kernel.org>
Mime-Version: 1.0
References: <20250320171559.3423224-2-song@kernel.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250320174642.855602-1-wnliu@google.com>
Subject: [PATCH v3 1/2] arm64: Implement arch_stack_walk_reliable
From: Weinan Liu <wnliu@google.com>
To: song@kernel.org
Cc: indu.bhagat@oracle.com, irogers@google.com, joe.lawrence@redhat.com, 
	jpoimboe@kernel.org, kernel-team@meta.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, 
	mark.rutland@arm.com, peterz@infradead.org, puranjay@kernel.org, 
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org, 
	wnliu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_104645_397947_A91B84E5 
X-CRM114-Status: GOOD (  12.10  )
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

On Thu, Mar 20, 2025 at 10:16=E2=80=AFAM Song Liu <song@kernel.org> wrote:
>
>  static __always_inline void
> @@ -230,8 +231,26 @@ kunwind_next_frame_record(struct kunwind_state *stat=
e)
>         new_fp =3D READ_ONCE(record->fp);
>         new_pc =3D READ_ONCE(record->lr);
>
> -       if (!new_fp && !new_pc)
> -               return kunwind_next_frame_record_meta(state);
> +       if (!new_fp && !new_pc) {
> +               int ret;
> +
> +               ret =3D kunwind_next_frame_record_meta(state);

The exception case kunwind_next_regs_pc() will return 0 when unwind success=
.
Should we return a different value for the success case of kunwind_next_reg=
s_pc()?


> +               if (ret < 0) {
> +                       /*
> +                        * This covers two different conditions:
> +                        *  1. ret =3D=3D -ENOENT, unwinding is done.
> +                        *  2. ret =3D=3D -EINVAL, unwinding hit error.
> +                        */
> +                       return ret;
> +               }
> +               /*
> +                * Searching across exception boundaries. The stack is no=
w
> +                * unreliable.
> +                */
> +               if (state->end_on_unreliable)
> +                       return -EINVAL;
> +               return 0;
> +       }


