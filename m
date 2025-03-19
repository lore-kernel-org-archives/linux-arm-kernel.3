Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE17AC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 18:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsvBxlf2VOaZb8vxBRnigpz+ulSEZ9VYrnq1SuZdcic=; b=gUPQcJC9tiFM8M63ez/S1LjuaQ
	OdCzrzRubF7KTyyeQ89KyWkTzY3bmkQWh5GFJW1Ol1FW0hTSV4Eh62p5sFNO7aPEYR4QJ/SB4mXVT
	v01P/UxftPiDC5+0895hMtsQtDwrwWJ5s3V3jLg/LPfq9iN3JoHGW+P4w+f4AuuFc4BdOivu916DG
	Q4p2Kbb927XdF+YhENg8LkcUDv/Agty3oTi+yQ5pt/aXM+Zh0BJBRLrpRq2ISBrTcKZ7KUWOyoDIy
	1L5pNnV68Dk4w+icx1PEdzr8caYA8Bn5Aq817HJLHCPJrXHToRvSPBv+wVtiCDCQDDV6LUoQUkOGD
	s2z18r7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuyKP-00000009rQ6-2qjZ;
	Wed, 19 Mar 2025 18:39:45 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuyIj-00000009rFI-0LxU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 18:38:02 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-2c2451f5cc8so5374909fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 11:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742409479; x=1743014279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsvBxlf2VOaZb8vxBRnigpz+ulSEZ9VYrnq1SuZdcic=;
        b=TXe50iPIARHLHgtlrIPcqzPUwn64uzsa+VumwFwtXoEf1rpq8VGNoW2tq4Rz/QWAuT
         wnrJjVzGu4KHh2swV+AVCedj/0F3eBDvvF3GFzD+OrvhAlHnplrGJsAkL7+Tw5Vfsy8g
         P7lA0dQQLDWcFlhw7AYJcpqI4f6f2iSeD/qZx9/BHSDoQlqe3o8UqIF/y2KZuzzvBtGl
         VX6Pve4eJ/LAMjAzKDTt6MuvyBYeHbxhb+q3uAs3zvR9tzLVEDQPxV2lYa6fPxyY40+c
         ImQXKE4xNfbc3gNSXX5y7ODZwOPcr09RHvZM3FxILYVhUtQIFBqX9QXkwFN2SDpse68O
         InQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742409479; x=1743014279;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zsvBxlf2VOaZb8vxBRnigpz+ulSEZ9VYrnq1SuZdcic=;
        b=qqnfvJN1gyN87T3ciNjWzVOCyoHpht3UXuXUXKjWber3+KB9N9GWP++wayrzUhtgfc
         /ZHZueCPBu4W4suSLhhOXGqkg96XUGkjScj37ACp4JTrOj/+YEn2MI7312O9YT0CH4Gp
         yvGBVyqKIoi0rkI3CtUKe//onSUttYqbA+RGgWqPIGBlTgYVzvhNSSmUrbxkG50SLxTB
         iClQZZwCy1ZtzOR/Ps9FbVccjCdVuzpKSagW3MgZW6lRnfskgtipaiMF/jgAQopHcKdv
         RR+PhgPKDNrxAcPho+yKkEqxf/AgIZuMTpIsPUjp9b244prMAh2qecdQBy4XuW0oG9LU
         lRJg==
X-Forwarded-Encrypted: i=1; AJvYcCUQAU63pG4JPQ5FwRjDQeXO7sPSMI2fBl+miXiTQIIopROmqszt2bIdAqQDEahQ9pDwVIr4/f/aCQUsjsXtHEdS@lists.infradead.org
X-Gm-Message-State: AOJu0YyAE8ClVoW6UDjLT0iR+Y1uCFX0l2s+f4/PGz3gyNHW5le4iKmW
	v07olbbw0cJ6g9TU7SvCrsbcvSAXHIZq0kNZmKpDE09kZv7f77gxdZTuSAZksyqw6V7zrOD4+Q=
	=
X-Google-Smtp-Source: AGHT+IEBFA4Sa9YRWk85bQR5JAziUVGfY3Rr0Wgmbdq2OL7Uy5LWKzyqkOQ+Gg3mIXPA8ssbkLAA0pQ5ug==
X-Received: from oacpy22.prod.google.com ([2002:a05:6871:e416:b0:2bc:6860:2684])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:8984:b0:2bc:8c86:ea31
 with SMTP id 586e51a60fabf-2c762fc74d6mr174282fac.20.1742409479208; Wed, 19
 Mar 2025 11:37:59 -0700 (PDT)
Date: Wed, 19 Mar 2025 18:37:56 +0000
In-Reply-To: <ifqn5txrr25ffky7lxtnjtb4b2gekq5jy4fmbiwtwfvofb4wgw@py7v7xpzaqxa>
Mime-Version: 1.0
References: <ifqn5txrr25ffky7lxtnjtb4b2gekq5jy4fmbiwtwfvofb4wgw@py7v7xpzaqxa>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250319183757.404779-1-wnliu@google.com>
Subject: Re: [PATCH 1/2] arm64: Implement arch_stack_walk_reliable
From: Weinan Liu <wnliu@google.com>
To: jpoimboe@kernel.org
Cc: indu.bhagat@oracle.com, irogers@google.com, joe.lawrence@redhat.com, 
	kernel-team@meta.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org, 
	live-patching@vger.kernel.org, mark.rutland@arm.com, peterz@infradead.org, 
	puranjay@kernel.org, roman.gushchin@linux.dev, rostedt@goodmis.org, 
	song@kernel.org, will@kernel.org, wnliu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_113801_119608_D70CCF47 
X-CRM114-Status: GOOD (  16.54  )
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

On Tue, Mar 18, 2025 at 10:39=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.or=
g> wrote:
>
> On Tue, Mar 18, 2025 at 08:58:52PM -0700, Song Liu wrote:
> > On a closer look, I think we also need some logic in unwind_find_stack(=
)
> > so that we can see when the unwinder hits the exception boundary. For
> > this reason, we may still need unwind_state.unreliable. I will look int=
o
> > fixing this and send v2.
>
> Isn't that what FRAME_META_TYPE_PT_REGS is for?
>
> Maybe it can just tell kunwind_stack_walk() to set a bit in
> kunwind_state which tells kunwind_next_frame_record_meta() to quit the
> unwind early for the FRAME_META_TYPE_PT_REGS case. =C2=A0That also has th=
e
> benefit of stopping the unwind as soon as the exception is encounterd.
>

After reviewing the code flow, it seems like we should treat all -EINVALID
cases or `FRAME_META_TYPE_PT_REGS` cases as unreliable unwinds.

Would a simplification like the one below work?
Or we can return a special value for success cases in kunwind_next_regs_pc(=
)=20

```
diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.=
c
index 69d0567a0c38..0eb69fa6161a 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -296,7 +296,8 @@ do_kunwind(struct kunwind_state *state, kunwind_consume=
_fn consume_state,
 		if (!consume_state(state, cookie))
 			break;
 		ret =3D kunwind_next(state);
-		if (ret < 0)
+		if (ret < 0 || state->source =3D=3D KUNWIND_SOURCE_REGS_PC)
+			state->common.unreliable =3D true;
 			break;
 	}
 }
```

--
Weinan

