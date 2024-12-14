Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDA8E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 02:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iq6dDBbndLiY2DDddQXufq1/8xq38ddxvn4I/8Ms6j4=; b=H7/23TvyCmwMX8zr/ABwmyt3vR
	jh2qEqSTZByLO31K8x03YZvzEo19lMZCvOLRkR6Uv12ZwODdPVGZpwCvR+DbE6BetUCM6RnhJRSk5
	d6IfgiYQ3MM5SY0taqaf4jGmxglJ3uBPu3wfY31/9+b14X/CgHkCWKiLw9cnvqsV9sThC+9FLaB8E
	G45eYdqdXuG+GDcnxdV4ewKw2Mcp4wwTCe6jK6iJgSzn+31JcDi9vrWNiPFCP2pojcP1IcV/qcPtd
	4tGEx2hdO96PGFo6H5S9puO5muSG1MySZpmr5JEd8X58j4MJnJqzYbUY/hYFh9IKvQ9uDAv66vr9c
	nYxfQ9jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMHrp-00000005Ywy-2Sh7;
	Sat, 14 Dec 2024 02:26:53 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMHqk-00000005Yq9-2KHJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 02:25:47 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-467896541e1so60491cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 18:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734143145; x=1734747945; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iq6dDBbndLiY2DDddQXufq1/8xq38ddxvn4I/8Ms6j4=;
        b=Zgb+0GHQ2E2CMDlI8BKPjknyV9xCom1CBBXhaUiwGtA6ML786BYWmJc3lnGMcjPf5H
         cGbu3zBU8t+neWoRJ7AR6s5ZO/5OfNr0EOexQDAwi3pc/tbg5uZ0qRpayMmbxpbafGsH
         xOJxrkhq6/pdus/CyR6ILWXpxp8jpWJrBN4aY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734143145; x=1734747945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iq6dDBbndLiY2DDddQXufq1/8xq38ddxvn4I/8Ms6j4=;
        b=b2elyTv/wszV/G8+W27RgbxP63EWt8gcLBkHE9arV65xmZFVdcwQoBkgr5DrXKQDVu
         v0bU+n9dJleuVeO+wVpp48vBJCBHeN33afqVC6KnADSKza+cWDGaJjL4Aie7gHo1Ca9M
         S/PK/UfvRY+HrP+hLvO9XINvQLy0dNxMykNvuND6gytZqzot1geIYLCT3Q5aBEavGmYO
         jwxqvjVZxlyFSWZV0NJhH4xCB9qR96W9Y3x9H4bRsfoiTq85gBlIY1AGecVGJKpgkHbk
         BVkOKKIg3GJ2G20qp96jU/cQ/wLoVc+S4icjZuQOSqJvvsC7H/eRG1L2QqxpXXNBBQaF
         9+cg==
X-Forwarded-Encrypted: i=1; AJvYcCUxq0QrTYD5bV0GcvtmArvo8rbS7lRvR95SHWrk1FT4rHN/blKIARNeZGr8skzQzcch3cAtpogvCDmBu21cfTUa@lists.infradead.org
X-Gm-Message-State: AOJu0YyLmk7k/IwhUsHApJc4x93yNPXN6IP7uSqefDwi3O4YvnDNndL0
	C7MZ9X7rv6yQyzkFEZx5Ddq+omLQNqZNeXTMk8jiK21ZfF4iQ+OfmU/621eLr2kJfa9/PLvo6S4
	+1NX8D1A86Eb0/FfjiQG4pw6ko/WFw1hppuk5
X-Gm-Gg: ASbGncuIHZxGb7bB83GZBa0DdnCIKKM+j6NaWGMwTjv1z3knSYkAfKeH+adKS8ZsocU
	h/7Do4so6Ixk8wzT3/aNEYsI9fuvzIzet7vU=
X-Google-Smtp-Source: AGHT+IEOn70h5dn6BYdJXbg/aSWnK5Ci6RKTe7m32gd+98te1xMx5Rg0/FeuU5bBDSrYLKEpYMEBBJdcHNY+XpSFfJI=
X-Received: by 2002:a05:622a:89:b0:467:7f81:ade0 with SMTP id
 d75a77b69052e-467b30b4e71mr1334511cf.24.1734143145148; Fri, 13 Dec 2024
 18:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20241214005248.198803-1-dianders@chromium.org> <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
In-Reply-To: <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
From: Julius Werner <jwerner@chromium.org>
Date: Fri, 13 Dec 2024 18:25:34 -0800
Message-ID: <CAODwPW_c+Ycu_zhiDOKN-fH2FEWf2pxr+FcugpqEjLX-nVjQrg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Julius Werner <jwerner@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, Roxana Bradescu <roxabee@google.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, bjorn.andersson@oss.qualcomm.com, 
	stable@vger.kernel.org, James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_182546_622710_5C523D97 
X-CRM114-Status: GOOD (  17.06  )
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

I feel like this patch is maybe taking a bit of a wrong angle at
achieving what you're trying to do. The code seems to be structured in
a way that it has separate functions to test for each of the possible
mitigation options one at a time, and pushing the default case into
spectre_bhb_loop_affected() feels like a bit of a layering violation.
I think it would work the way you wrote it, but it depends heavily on
the order functions are called in is_spectre_bhb_affected(), which
seems counter-intuitive with the way the functions seem to be designed
as independent checks.

What do you think about an approach like this instead:

- Refactor max_bhb_k in spectre_bhb_loop_affected() to be a global
instead, which starts out as zero, is updated by
spectre_bhb_loop_affected(), and is directly read by
spectre_bhb_patch_loop_iter() (could probably remove the `scope`
argument from spectre_bhb_loop_affected() then).

- Add a function is_spectre_bhb_safe() that just checks if the MIDR is
in the new list you're adding

- Add an `if (is_spectre_bhb_safe()) return false;` to the top of
is_spectre_bhb_affected

- Change the `return false` into `return true` at the end of
is_spectre_bhb_affected (in fact, you can probably take out some of
the other calls that result in returning true as well then)

- In spectre_bhb_enable_mitigations(), at the end of the long if-else
chain, put a last else block that prints your WARN_ONCE(), sets the
max_bhb_k global to 32, and then does the same stuff that the `if
(spectre_bhb_loop_affected())` block would have installed (maybe
factoring that out into a helper function called from both cases).

I think that should implement the same "assume unsafe by default
unless explicitly listed as safe, check for all other mitigations
first, then default to k=32 loop if none found" approach, but makes it
a bit more obvious in the code.

